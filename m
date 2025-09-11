Return-Path: <linux-next+bounces-8265-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C4B53637
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 16:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22543165627
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 14:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FD93431EC;
	Thu, 11 Sep 2025 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcO6tbv+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B01E1DE9;
	Thu, 11 Sep 2025 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757602120; cv=none; b=GPOgBb6aCHrC5ksoPs7NX3UH0fkWBQoi3rk9D3jZ0MhwbiSk2a8uiRqA9ii/0Lb/GaQ96Au2OWQtitxPkQEG/1LLEBObVXPIuS2J2S2Nc+UhFinnX6BHjnccDLPGOY9XFjn2Db/b6qgpOhCUMwpbsdiiJDuB3TjpwfXC+M/SjOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757602120; c=relaxed/simple;
	bh=MUkZ6s7L3K4WQdR9PzbN5HgnLg96hS6zJMbKkQ2IXy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJ/na9YQwRuAkqy+JOPHc2bVXHvuNyxay3Z0QGL78a/pcSBoy8skALFJEzrLxZU1MKtPKtWt/Hz/O4sOHp2l7qUIyi3YWojVphm+Fz6qpJBlh8Ew55xKPULln12MUhtczxECPLGP3GffIWvaTo9e9xXfhEqTWFQ5vXLQZLSgmHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcO6tbv+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFC8C4CEF5;
	Thu, 11 Sep 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757602120;
	bh=MUkZ6s7L3K4WQdR9PzbN5HgnLg96hS6zJMbKkQ2IXy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcO6tbv+F9psSGvj3NxQv8NjUx6DnnV1Hh/QR1Ap5pS37oOWw2a7wdhR+taBQmJB6
	 RpozvBuvDcflnHgk8kjWEefqoKSt7cQb1fSzhjzCQWfOsQKdrBx/sFvjksAWC2NF9F
	 cqYoRlZf8vojYDIWu00+a59ITVgcNsMZVAeuPKgrHCP12JQhGMyxp82ruk5SMA8Z2O
	 G9LrOOEfzwk2hwVt2/6OJyqFHrsjtrEklcsdqgVKAvC6cSjDmUycdkeOo4JMlfsZ6F
	 6F78jB9OJoElcvU6OegMSw9SRl5zVMrEPB1R2uBzMEu1kI+bwpNV3N96y6/t2+IGN3
	 ZsPHjwB9Iy7Iw==
Date: Thu, 11 Sep 2025 15:48:36 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20250911144836.GO9224@google.com>
References: <20250904154122.63acc45c@canb.auug.org.au>
 <20250904063043.GE2764654@google.com>
 <CACMJSev63kfCBTzQnija6Q+PNm8KgD-LWVKeqRJ2kLBtT7Zh6A@mail.gmail.com>
 <20250904092319.GG2764654@google.com>
 <20250909122227.4dbbeb6f@canb.auug.org.au>
 <CACMJSeu8Zv7i+_2bH5Lp5fuE0aBUNRfuq5ne0rPCxXCij4orDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACMJSeu8Zv7i+_2bH5Lp5fuE0aBUNRfuq5ne0rPCxXCij4orDA@mail.gmail.com>

On Tue, 09 Sep 2025, Bartosz Golaszewski wrote:

> On Tue, 9 Sept 2025 at 04:22, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > On Thu, 4 Sep 2025 10:23:19 +0100 Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Thu, 04 Sep 2025, Bartosz Golaszewski wrote:
> > >
> > > > On Thu, 4 Sept 2025 at 08:30, Lee Jones <lee@kernel.org> wrote:
> > > > >
> > > > > On Thu, 04 Sep 2025, Stephen Rothwell wrote:
> > > > >
> > > > > > After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> > > > > > failed like this:
> > > > > >
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
> > > > > > gpio-stmpe.c:(.text+0x21a7c29): undefined reference to `stmpe_reg_read'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get_direction':
> > > > > > gpio-stmpe.c:(.text+0x21a7db2): undefined reference to `stmpe_reg_read'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq_sync_unlock':
> > > > > > gpio-stmpe.c:(.text+0x21a8166): undefined reference to `stmpe_reg_write'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a82ef): undefined reference to `stmpe_reg_read'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8372): undefined reference to `stmpe_reg_read'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq':
> > > > > > gpio-stmpe.c:(.text+0x21a8c27): undefined reference to `stmpe_block_read'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f05): undefined reference to `stmpe_reg_write'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f89): undefined reference to `stmpe_reg_write'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_disable':
> > > > > > gpio-stmpe.c:(.text+0x21a91dc): undefined reference to `stmpe_disable'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_set':
> > > > > > gpio-stmpe.c:(.text+0x21a93a4): undefined reference to `stmpe_reg_write'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a941e): undefined reference to `stmpe_set_bits'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_output':
> > > > > > gpio-stmpe.c:(.text+0x21a95a4): undefined reference to `stmpe_set_bits'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_input':
> > > > > > gpio-stmpe.c:(.text+0x21a9705): undefined reference to `stmpe_set_bits'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_request':
> > > > > > gpio-stmpe.c:(.text+0x21a983e): undefined reference to `stmpe_set_altfunc'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_dbg_show_one':
> > > > > > gpio-stmpe.c:(.text+0x21a99c0): undefined reference to `stmpe_reg_read'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9b8c): undefined reference to `stmpe_reg_read'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9bb1): undefined reference to `stmpe_reg_read'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9c61): undefined reference to `stmpe_reg_read'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9e6c): undefined reference to `stmpe_reg_read'
> > > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_probe':
> > > > > > gpio-stmpe.c:(.text+0x21aa5b2): undefined reference to `stmpe_enable'
> > > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21aa83e): undefined reference to `stmpe_disable'
> > > > > >
> > > > > > Presumably caused by commit
> > > > > >
> > > > > >   e160dd0ac8c3 ("mfd: stmpe: Allow building as module")
> > > > >
> > > > > Okay, I have removed this patch until it can be better tested.
> > > > >
> > > > > > I have used the mfd tree from next-20250903 for today.
> > > > > >
> > > > > > Note that commit
> > > > > >
> > > > > >  03db20aaa3ba ("gpio: stmpe: Allow to compile as a module")
> > > > > >
> > > > > > is in the gpio-brgl tree which has not been merged into linux-next at
> > > > > > this point.
> > > > >
> > > > > Okay, perhaps these need to go in together then.
> > > > >
> > > > > Thanks Stephen.
> > > > >
> > > >
> > > > I can take it through the GPIO tree if you will and set up an
> > > > immutable branch for you. Or not if the potential conflict is minimal.
> > >
> > > An IB would be good.  Thank you.
> >
> > I am still seeing this failure.
> >
> 
> The offending commit is still in Lee's tree[1]. FYI: It's also now in
> the GPIO tree as commit df6a44003953 ("mfd: stmpe: Allow building as
> module") and was made available in an immutable branch[2].

Okay, I've dropped the offending commit.

Feel free to keep it in your tree.

-- 
Lee Jones [李琼斯]

