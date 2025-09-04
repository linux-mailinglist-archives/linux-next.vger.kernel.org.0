Return-Path: <linux-next+bounces-8190-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2227CB4338E
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 09:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBBC05E55F2
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 07:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7483729A9C3;
	Thu,  4 Sep 2025 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XuUsVUdj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C28029A310
	for <linux-next@vger.kernel.org>; Thu,  4 Sep 2025 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970280; cv=none; b=t53gO/so4bu2cjMr8HAC6gEigbz3rvaqcXmt9TtZctgO+MIX7FigrxWgTTZCS/sX7IdCfEV4QhUWcZ5B8lty6FlFfd4u+2pxVKm2D4Pbf4J4jm1TS2UzIlbzXisCkQ+Ow5Xh5R3Y5FTg+/GhHcgkPvsZTvmHa+RaNmvfgNuL/VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970280; c=relaxed/simple;
	bh=W+kfG1opgTYiuSbM1ynJeC3MtjJuAFRHGYLJzeN0Lks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWI/pWn8Vv801ApPbumjgH1PFd2jIiNhbpxVBmvPCT2F2U782uKUgDhQZoB5ePN1ZJiAt8CFGK7UM0NPxmUId5XTYLaG64Slp+hqB28VbguFbMRotSZNcSI3tHypa0kTNfP0RUfJO/catRnjbSUzFa1fAxAf/PR8y1ps65vzw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XuUsVUdj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0449b1b56eso105043066b.1
        for <linux-next@vger.kernel.org>; Thu, 04 Sep 2025 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756970277; x=1757575077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LSCPkDHsEcxmpOj6VbQwTWZYShwT8gUAJwxZ5jykxvs=;
        b=XuUsVUdj2Kehfy1sOQQMiWGN4JADHUO2Vd8wTwzPi6fthG7jzRw2EvNwbVy9rlDxuT
         DYlcn8MB3PPROiWL3Ag5WL4Ktk1W1QG9AA3QXh60lOqYh/O85SJ4xyzTFUBf1WZKi5Fe
         IndD5vPGtr823JQdYVRmD3kPdfkFcmT7F6uCD0BKqGfXg+tcJEjGwm+Up4kOKloB3LEv
         p3Ods5tWfz5mQxdaBJxuhD6fr/bigLCg9mdLZ1Hm/Tyz67Ffy2LBfWVz2VUbD/i7o5YU
         OJRSIjyzDkQ0thQrgpTBNQNeHiCH2zvMKoI9BaaIENzycXAK+3HnnEF4B7p0wtwj5V2m
         zbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970277; x=1757575077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSCPkDHsEcxmpOj6VbQwTWZYShwT8gUAJwxZ5jykxvs=;
        b=CqtBncdwz9hLFa5TG/DelxKEv+OJR5M+neD/EByDRYvqU40bggFc9DfPtSqETTX+iu
         q8ZMKTwpqetaR40doPrk27kVi5cJlHfTg8bZ8AAv4LdSidRP/MtNMtRbiNl2PBDOOm+B
         MPzhjB6bw2fpwhDGR3ux+IrgUsbSqtdLOGtu5RINhdy+Tr1HbV1FEU11HuYJK8X254ew
         +Rt4zkKrQa4JZPWzEnsR4yeMwq+qecaspDJYJxCju64f1Bzo06Uqo6hAyOeLBUSRkJai
         4ZdibPlmW1meSF6WNNJPvmITJPbUY+nM+tdDEnTvnQSS4O1iAZvh3CVv2ClvU1VX70qx
         +lMg==
X-Forwarded-Encrypted: i=1; AJvYcCWjQTutyXQYl43Juj7BTpmPuEzrmxrT+LKHcviitf14vSBgMlycBoKn7cl6B6MyGw/Xj/XPK7gI8V1r@vger.kernel.org
X-Gm-Message-State: AOJu0YyxqEc2hVRNPi60w3aaKb0VtRjlx7O5VIRO1QuMkeSApN7omz42
	iFNM8ppyjHR2kjcRwi8yHat8Xpo8GpOTkyfvh8WEfdajgpW/FQV22kg6XTHno0mRQRICAgIRKlR
	7C2dp/17QJB1aY/vm287LaB8vUYdXhYlcTA3x/cL7Xw==
X-Gm-Gg: ASbGncv8KVDsmNKsbv/CsiIP6Ld3XSPkbab3v70Q2GR/7Jchc7x0zrxpMNPQn5MULzs
	cHbPjWCjYE4MVlgrx+rzctx+nKkfiMej7Lo5EXNhgBWYaoZcAnNFFDc2bhhDYsxu4oezZuHqILV
	7hQANfHgA4+tUgQXVMF0RK65O8ET0pJ5M3PN09I2uZTDT30hXi+Ip3KLFi0zRSlTY74eEuPwKQt
	Fvw8KlsTugl3kC5PCAVKxTW5wYdoNd+DhBIoQ==
X-Google-Smtp-Source: AGHT+IHnU2tk5eG7O2PgVrjb2HzIr4PTSJ4VHsEZcdbhADM6XksqxivxCaBQUAUhKnd0CQ4ZYon7QtZ6SkUdMUpZKLY=
X-Received: by 2002:a17:907:724c:b0:afe:764d:6b22 with SMTP id
 a640c23a62f3a-b01d8a32756mr1542758166b.9.1756970276788; Thu, 04 Sep 2025
 00:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904154122.63acc45c@canb.auug.org.au> <20250904063043.GE2764654@google.com>
In-Reply-To: <20250904063043.GE2764654@google.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 4 Sep 2025 09:17:45 +0200
X-Gm-Features: Ac12FXxAxk7z0xvnWkE-R2CKKYv7l5x2z2VrkIbotE1EotEkf36zoUeazbWjmVE
Message-ID: <CACMJSev63kfCBTzQnija6Q+PNm8KgD-LWVKeqRJ2kLBtT7Zh6A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
To: Lee Jones <lee@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 08:30, Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 04 Sep 2025, Stephen Rothwell wrote:
>
> > Hi all,
> >
> > After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> >
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
> > gpio-stmpe.c:(.text+0x21a7c29): undefined reference to `stmpe_reg_read'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get_direction':
> > gpio-stmpe.c:(.text+0x21a7db2): undefined reference to `stmpe_reg_read'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq_sync_unlock':
> > gpio-stmpe.c:(.text+0x21a8166): undefined reference to `stmpe_reg_write'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a82ef): undefined reference to `stmpe_reg_read'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8372): undefined reference to `stmpe_reg_read'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq':
> > gpio-stmpe.c:(.text+0x21a8c27): undefined reference to `stmpe_block_read'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f05): undefined reference to `stmpe_reg_write'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f89): undefined reference to `stmpe_reg_write'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_disable':
> > gpio-stmpe.c:(.text+0x21a91dc): undefined reference to `stmpe_disable'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_set':
> > gpio-stmpe.c:(.text+0x21a93a4): undefined reference to `stmpe_reg_write'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a941e): undefined reference to `stmpe_set_bits'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_output':
> > gpio-stmpe.c:(.text+0x21a95a4): undefined reference to `stmpe_set_bits'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_input':
> > gpio-stmpe.c:(.text+0x21a9705): undefined reference to `stmpe_set_bits'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_request':
> > gpio-stmpe.c:(.text+0x21a983e): undefined reference to `stmpe_set_altfunc'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_dbg_show_one':
> > gpio-stmpe.c:(.text+0x21a99c0): undefined reference to `stmpe_reg_read'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9b8c): undefined reference to `stmpe_reg_read'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9bb1): undefined reference to `stmpe_reg_read'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9c61): undefined reference to `stmpe_reg_read'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9e6c): undefined reference to `stmpe_reg_read'
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_probe':
> > gpio-stmpe.c:(.text+0x21aa5b2): undefined reference to `stmpe_enable'
> > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21aa83e): undefined reference to `stmpe_disable'
> >
> > Presumably caused by commit
> >
> >   e160dd0ac8c3 ("mfd: stmpe: Allow building as module")
>
> Okay, I have removed this patch until it can be better tested.
>
> > I have used the mfd tree from next-20250903 for today.
> >
> > Note that commit
> >
> >  03db20aaa3ba ("gpio: stmpe: Allow to compile as a module")
> >
> > is in the gpio-brgl tree which has not been merged into linux-next at
> > this point.
>
> Okay, perhaps these need to go in together then.
>
> Thanks Stephen.
>

I can take it through the GPIO tree if you will and set up an
immutable branch for you. Or not if the potential conflict is minimal.

Bartosz

