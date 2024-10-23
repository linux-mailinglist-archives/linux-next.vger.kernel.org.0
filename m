Return-Path: <linux-next+bounces-4395-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A82719AD7A6
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 00:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CB692844B6
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 22:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEB917C222;
	Wed, 23 Oct 2024 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gl5R3jrH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09A0146A79;
	Wed, 23 Oct 2024 22:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729722919; cv=none; b=DUFxvKw2EaQ1dBrqqn2ekJSrADpIFf98fDHjqOFgLu6CVqYExLrxvqhkyRWthwuEG5kvYHpmrecLXsITXN2iNuGfyEPGw0MY7xQt1eFzCTu55Cm9LnBCgR4tpSgLBnBUB7mTo904pb8uMg0Yq4hW7IYuZecoIsnXZFITZ8iqCzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729722919; c=relaxed/simple;
	bh=kFUZRApfRhwRNnH2g/MMFbF11hdyniiAYG2bhWxegh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPM/+EHiYyhfivWTpNhi9u03Vo02490pVhPhduCVqJ8CHVi6E4QruHlHOnDb8ODM9oaftcnkV9HkHtXlDZ2ToptHFteZoEoqWaexej67a4ycGd+rJNle2ULIragvOBU8CG2ln3P7EDIEpKuLbBwOOjK6SYMUDTlVTxjGaYOSk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gl5R3jrH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D840C4CEC6;
	Wed, 23 Oct 2024 22:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729722917;
	bh=kFUZRApfRhwRNnH2g/MMFbF11hdyniiAYG2bhWxegh8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Gl5R3jrH8abq0r2FvhAcKDmZSRzQx1/+b2YfZ4Vb7yFs81qBjYwndpR3PFg7WZT2Q
	 opW4Y3GC/MbsvA/LkMej+Ac8/JL/HdoayvshLSY9XKui0W79ijAHSV/dphTPMEMQc7
	 jmIFwo2KTOIYf85LUZDZP4PvomwRXnPlSecPPl4kRmOBhT8l1+LonY2HKL20KBha6C
	 iguhpHVt5pkCLIUO2nYjrsY+zrGiUaji6d1pXjtLTV39gpth5tOUw8m6sd6COqm6SE
	 +HQ9EynhxHis8K6CWHc6+NZe8NoXBAjPDzvscjFVfBC0ZG6xolWZn2j+SYChKs7ipq
	 PY0nyjKpqXM8Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D1CE4CE10F5; Wed, 23 Oct 2024 15:35:16 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:35:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kobak@nvidia.com
Cc: mochs@nvidia.com, rui.zhang@intel.com, ardb@kernel.org,
	rafael.j.wysocki@intel.com, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	linux-toolchains@vger.kernel.org
Subject: Re: [BUG] Argument-alignment build error with clang
Message-ID: <0936dba4-4de5-49ff-b90c-1263e25920d2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <38508cf1-7d44-4656-8060-973e820b2957@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38508cf1-7d44-4656-8060-973e820b2957@paulmck-laptop>

On Wed, Oct 23, 2024 at 03:26:57PM -0700, Paul E. McKenney wrote:
> Hello!
> 
> Running rcutorture on next-20241023 got me lots of these:
> 
> drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned argument to 4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
>           156 |                         (void *)efi_pa_va_lookup(&th->guid, handler_info->handler_address);
> 
> This is built with CC=clang.  I don't see this diagnostic with GCC.
> But we are supposed to be able to build with clang, so...

Ah, and this might help:

clang version 18.1.8 (CentOS 18.1.8-3.el9)

							Thanx, Paul

> The first argument is the address of one of these:
> 
> typedef struct {
> 	__u8 b[UUID_SIZE];
> } guid_t;
> 
> Where UUID_SIZE is as follows:
> 
> #define UUID_SIZE 16
> 
> But this guid_t is a member of one of these:
> 
> struct prm_handler_info {
> 	guid_t guid;
> 	efi_status_t (__efiapi *handler_addr)(u64, void *);
> 	u64 static_data_buffer_addr;
> 	u64 acpi_param_buffer_addr;
> 
> 	struct list_head handler_list;
> };
> 
> One can argue that this structure must be 16-bit aligned on a
> 64-bit build.  So maybe this is a bug in clang's diagnostics, hence
> linux-toolchains on CC.
> 
> Thoughts?
> 
> 						Thanx, Paul
> 

