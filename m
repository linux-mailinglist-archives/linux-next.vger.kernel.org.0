Return-Path: <linux-next+bounces-6183-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25010A7F511
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 08:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A51D3B0054
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 06:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0827325F78F;
	Tue,  8 Apr 2025 06:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyxrQgFA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2961CD15;
	Tue,  8 Apr 2025 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094151; cv=none; b=N2KynkgxQGgIMjcDoYe3ci1BTauSXBWqyTnDE00ZxntFGmPyHtGhG6+Szwotk7n4Cr+b5pvSlFdQGOuBou84B0jbBPvDX2UyTIQPa2AryDv2WbpXXiyMjrUGqn6Psi8QbnIed/wl2YfiHVgpiql3mAMgXbazL4cMnFLOJpyjTU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094151; c=relaxed/simple;
	bh=Csqgrzyk+uBAewDCXxAVP30No7fss9Z45XpijiikhNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCMlukhFbsXZQ3A0Ao9PYoHGHnXR3A5T/Wq1i1V+v30XqHRZ+UN/1xAaNXgbqYgLWAp/Rcs5DFYJ2qud+qL3SEjm1jMKEEYZhICT19NR9j4JEPm8SkGdu9xM1EW2PW6WzO/+10GyeDq204oFIj7iOqMCuzlNo7c7owFymz0p7+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyxrQgFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF770C4CEE5;
	Tue,  8 Apr 2025 06:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744094151;
	bh=Csqgrzyk+uBAewDCXxAVP30No7fss9Z45XpijiikhNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyxrQgFAql85niNS0g6S67Ta4AYHuTXDHML/VqxfetcqFYjm0PiEl9Lz0dutT3qcH
	 9nKubvNkkgpYQSKV5mje4Qj2kzWsI8H5BvjgyN2L8GNptItE9smEChP4ZMaOTX+MJL
	 wbhn/Yj17G+9Cwwl0fU25LnD1V1z/0HlxGSN06iY5XT+eggIDljSsCkwYnnAPlxcBT
	 O7saJ3Dhz/KP7RFQs15xx9glGC3sMoxgPR3yYUKwMzSQDnThfWqJGw85vscNHtuJSx
	 oR/3z0xiAw9Kdt0hkHsPUE0jBueVBv4skrIA6FgYZNCEUn2nE5BSjXHaAO05HsA5FM
	 FLbtkafhsPsKg==
Date: Tue, 8 Apr 2025 08:35:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <Z_TDwj7cxauy0gQu@gmail.com>
References: <20250408112830.4769244e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408112830.4769244e@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/x86/Kconfig.assembler
> 
> between commits:
> 
>   984f835009d6 ("crypto: x86 - Remove CONFIG_AS_SHA1_NI")
>   d032a27e8fe9 ("crypto: x86 - Remove CONFIG_AS_SHA256_NI")
> 
> from the crypto tree and commit:
> 
>   a72d55dc3bd6 ("x86/idle: Remove CONFIG_AS_TPAUSE")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks good to me, thank you!

	Ingo

