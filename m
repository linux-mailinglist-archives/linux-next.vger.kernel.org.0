Return-Path: <linux-next+bounces-8187-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A72B43266
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 08:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2D5F567F2A
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 06:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87AC2248A8;
	Thu,  4 Sep 2025 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJxEZOYi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10921E3DFE;
	Thu,  4 Sep 2025 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756967448; cv=none; b=Wv9v/1f1XgGUozgIkTglodJKx88czyueyeJlGngvE61MW1FfkYkn7sy87MUN6JA/t+yHbNtRKQemRw4PIOKQKhl1RGzzzhG+ItNixDivzKbxCgOtpnLLKWv8nPbxRXh5vQoaW8a+J2NYnH50S00M4MFv51FizRSbs+TfZfrrOEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756967448; c=relaxed/simple;
	bh=kdYDjzaNlwToulTmT/ZGxJ3bp57/mMqU1jSrlRUBtEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcIvWk+inVD4IP4hySBUyQDyxF5fKI5optejATbCmu0mE1Kr1PPt4nMXIwXQwFIGpP5tQ/ustepGMfdS0kcFxh9Yq2sOkH8iX1hz/BtnXYoK/Di+kE/3+FKw1jGkwb+vpSgz6XaaW7bGnfEZPhJfu+HcZFzcipuOp8JSbI6nCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJxEZOYi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE956C4CEF0;
	Thu,  4 Sep 2025 06:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756967448;
	bh=kdYDjzaNlwToulTmT/ZGxJ3bp57/mMqU1jSrlRUBtEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJxEZOYiO79gME1yD0oYDYc6pNzxOr0n0/Q2rP8X42wCB/GYZd/d7zQQRu6Nwie5P
	 M99vp8mQFwPVHFfeDmwJEzFAZhqJOB1e5XRn3L0prD7YsxHC3oSCbcACFu6haFxq6H
	 QJm8QQkLAE/Jb15qdxXbS6x2zt+ktoIyP5YLzWrm166RhCbav7xgAFgLOdQ/mgetw9
	 ad6vfCnPtBfgMzrNNsSUqggi4tSpywRCEE6CExEOpRTEbaA9EOXxLl2/4dV0q/6v2E
	 RqRQ8rTTtGeDQuuLBfajEZ+geLMEXNhKiASlWEPLHWAdZAXONfQ4aw6JxbYOexTbaI
	 ycNofzaNgj9Ug==
Date: Thu, 4 Sep 2025 07:30:43 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20250904063043.GE2764654@google.com>
References: <20250904154122.63acc45c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904154122.63acc45c@canb.auug.org.au>

On Thu, 04 Sep 2025, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
> gpio-stmpe.c:(.text+0x21a7c29): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get_direction':
> gpio-stmpe.c:(.text+0x21a7db2): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq_sync_unlock':
> gpio-stmpe.c:(.text+0x21a8166): undefined reference to `stmpe_reg_write'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a82ef): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8372): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq':
> gpio-stmpe.c:(.text+0x21a8c27): undefined reference to `stmpe_block_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f05): undefined reference to `stmpe_reg_write'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f89): undefined reference to `stmpe_reg_write'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_disable':
> gpio-stmpe.c:(.text+0x21a91dc): undefined reference to `stmpe_disable'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_set':
> gpio-stmpe.c:(.text+0x21a93a4): undefined reference to `stmpe_reg_write'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a941e): undefined reference to `stmpe_set_bits'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_output':
> gpio-stmpe.c:(.text+0x21a95a4): undefined reference to `stmpe_set_bits'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_input':
> gpio-stmpe.c:(.text+0x21a9705): undefined reference to `stmpe_set_bits'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_request':
> gpio-stmpe.c:(.text+0x21a983e): undefined reference to `stmpe_set_altfunc'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_dbg_show_one':
> gpio-stmpe.c:(.text+0x21a99c0): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9b8c): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9bb1): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9c61): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9e6c): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_probe':
> gpio-stmpe.c:(.text+0x21aa5b2): undefined reference to `stmpe_enable'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21aa83e): undefined reference to `stmpe_disable'
> 
> Presumably caused by commit
> 
>   e160dd0ac8c3 ("mfd: stmpe: Allow building as module")

Okay, I have removed this patch until it can be better tested.

> I have used the mfd tree from next-20250903 for today.
> 
> Note that commit
> 
>  03db20aaa3ba ("gpio: stmpe: Allow to compile as a module")
> 
> is in the gpio-brgl tree which has not been merged into linux-next at
> this point.

Okay, perhaps these need to go in together then.

Thanks Stephen.


-- 
Lee Jones [李琼斯]

