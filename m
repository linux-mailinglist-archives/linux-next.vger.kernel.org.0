Return-Path: <linux-next+bounces-4393-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 093DC9AD78C
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 00:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 970C4B21545
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 22:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823D51F429E;
	Wed, 23 Oct 2024 22:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tjh7S/vM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDAA13B7BE;
	Wed, 23 Oct 2024 22:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729722418; cv=none; b=u748G7/fS6K5U7MDpUIVmt9ED0rqA4svMzr3IPpHkUiietkZUKMe2NNu/N83H9p8mdDCDipOB0s2g+CoA24nT1NdP4LyjPcAYTF91yFC4piTFDrshjcUT76Rh9KME/fizIZQp7Sp/Z7tZJkaC1t62JC72veRa53rP1+dEz0f30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729722418; c=relaxed/simple;
	bh=75AQuif6v24gKO2OFzIH3h1naj1feXYU9tz9GwCI0zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e9OsODS8VSP4H1OXu0jnTsP4+HpymuEfWkjZ52Rdk//7mfQWat+tsiYonDcqutP2EV12kg5arLoVtDdY38t4PtWpAfMEcrfUGEW9JCSj94hsSWNcUwFkiD8/5SYllZPAsWvXvU5JIIzVEI0xHhV0ODXPiByNpfzW/7b2Gx13N08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tjh7S/vM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE150C4CEC6;
	Wed, 23 Oct 2024 22:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729722417;
	bh=75AQuif6v24gKO2OFzIH3h1naj1feXYU9tz9GwCI0zQ=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=Tjh7S/vMlMjBNTdSzZ8uhsfwnZ3cwAVu4JtGuMfEmK3PUlVLYoW+Yi7CW1EmqI1fC
	 xW1kexffrxX0kA03Bnvv2rS5YzOXPbGTJj0a14GFdE6Yhbt2gE/piX7T+fd8j+0KH8
	 /no9ZGkFONNZpIBKvuZEIwLbxl2POgiltVT51LgkDBYoAGMR5TaxxCRAPwtpqtV0dE
	 ZiIqd0CitAota9JpJQsfBZRYE8uBHHwS4nYt61JfMYVQUefVwGz0wuFUyTfVLkmQH2
	 7Ynj0wRyLtiredHawX1n2okodSvwXiy+9CIj4j882FYg3r/ZD342/TvU2cdIuMAA4A
	 nYxJyj1Ky2O4g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 681E6CE10F5; Wed, 23 Oct 2024 15:26:57 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:26:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kobak@nvidia.com
Cc: mochs@nvidia.com, rui.zhang@intel.com, ardb@kernel.org,
	rafael.j.wysocki@intel.com, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	linux-toolchains@vger.kernel.org
Subject: [BUG] Argument-alignment build error with clang
Message-ID: <38508cf1-7d44-4656-8060-973e820b2957@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

Running rcutorture on next-20241023 got me lots of these:

drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned argument to 4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an unaligned pointer access [-Werror,-Walign-mismatch]
          156 |                         (void *)efi_pa_va_lookup(&th->guid, handler_info->handler_address);

This is built with CC=clang.  I don't see this diagnostic with GCC.
But we are supposed to be able to build with clang, so...

The first argument is the address of one of these:

typedef struct {
	__u8 b[UUID_SIZE];
} guid_t;

Where UUID_SIZE is as follows:

#define UUID_SIZE 16

But this guid_t is a member of one of these:

struct prm_handler_info {
	guid_t guid;
	efi_status_t (__efiapi *handler_addr)(u64, void *);
	u64 static_data_buffer_addr;
	u64 acpi_param_buffer_addr;

	struct list_head handler_list;
};

One can argue that this structure must be 16-bit aligned on a
64-bit build.  So maybe this is a bug in clang's diagnostics, hence
linux-toolchains on CC.

Thoughts?

						Thanx, Paul

