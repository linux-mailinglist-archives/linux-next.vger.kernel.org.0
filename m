Return-Path: <linux-next+bounces-1314-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1863860B95
	for <lists+linux-next@lfdr.de>; Fri, 23 Feb 2024 08:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70AA1281C34
	for <lists+linux-next@lfdr.de>; Fri, 23 Feb 2024 07:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6620814ABA;
	Fri, 23 Feb 2024 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cmlhRdBl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5EC14AA5
	for <linux-next@vger.kernel.org>; Fri, 23 Feb 2024 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708674684; cv=none; b=AdxhpaoZ8mqGGI/8b8r6Vd6iLx8Kd8lpPj+eWFu+bWnEj19dsEsodBOlfwU6SiqS6JS0bvzOROLY6yYfApTk3TK32+zaAT0VghjP4kRSOCdreM3UjXD9IPI6qqHejsvbBAYhDKWeKyPJS8fm38hREVcfJVIVfLS28mrHoYrf5zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708674684; c=relaxed/simple;
	bh=7SLujE9p9Nm9Prxjtn8fONPkVvEqrDPAS/csWaCIAzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5GU3g7nqfx6nkzhYJjZD+KWp1NCmAnZg682cGMMPV/eSrBAzMHb2SMeqq8aRrxuMwVpjftK4jTgAytP75MZQnKUSL00EQT66EzGrRrAUnKsyhfMI6f8jhvXi9UYTgGP4wftU8zMjxT48aJ08ZFu28ctzJxEFFaxAHi055CBqsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cmlhRdBl; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso610277276.2
        for <linux-next@vger.kernel.org>; Thu, 22 Feb 2024 23:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708674682; x=1709279482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0zwJRKqqvkbB5yeYH6nxcBNukYSHGMyv7mjOlzCXaIE=;
        b=cmlhRdBljn+lU2MLykpe/QlhI2j4gJ0rJDexxq7JsqV/nEL41jjIk5V2jYc/NA2SkG
         kq1IcVx9PqXhnjgkytUHVfspW+q/5qIBLFaOMicrM+geMGDxV6fYz/S0InKfK+ZAbAP1
         aJA5PM0l1fZXTKR4WBigZJT9x2UNdM4OeZNezOSVdhTOHugyrHncAqYVWI/IccKBK4mX
         93SY1fMIcKWImvSk632hxFtML8Yc2AW0EDkFa4/2fmtvAFktbf5YJfsH+297hP5DEVak
         2EZREBxt4gp61TE9NW8g9HmdFmtRvk7PuD5d3Bpkk89qc0ADa3ZGGwpztl9rvgh9owj1
         w9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708674682; x=1709279482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zwJRKqqvkbB5yeYH6nxcBNukYSHGMyv7mjOlzCXaIE=;
        b=N3dozKsqwdPIFA3H91nWUFINMfM4VwOpeJr8NfL8nRaV+OrFukBPpzb9rXPX2fscKv
         eVaj4U7SXlHNwJLCtNYB8uinos+vpmL4GJdhDSMKFxEuhNY/XHiY/ycFCUu2f9MpGAw0
         P92xL6+lZVjT5174HyaT4GNg4CwWJBu+np4xrCeOCoSJTwS133sZpdQu5RFJG+/7m3ec
         t/jZey7geZ+y/ufwFStFteydEog+owrFRtbwWfxQ+6Mhg6UdXh0ir8UleWjI4oOxMVFN
         kT7zqjzMYt/qdpJ9GmKU2ERlzul0zTnHwbppS/HUfOlLXY+YY7Px8ehlBO7NVdV4TVc0
         9uKA==
X-Forwarded-Encrypted: i=1; AJvYcCWZZ+hn74Pb9Xlv1vqof14g7xgmpWhZGhFBopOmRG06Z2edZrQkDD1cjcuRPUP2vb3aRGaYix2TStCF7l5Mi4JQpLryTL+LpC7G/w==
X-Gm-Message-State: AOJu0YxbggxNNV7ufbUuRTO7wvnrfBy6GZ/DM7Cbej7AlX5v6omThCCH
	bCqTp/xNJiHqmVmWa2iSltO9pbx21fO0XVmjqu890Z+9kBWoKkwl8RUZLlbxaQzjsabV7IMAP3y
	NAUPvHh8JUcQkbNbqHf/DQhsaNRGevw+bK1teoA==
X-Google-Smtp-Source: AGHT+IHbNOowKrX8O4/m/+E511Tw0EHE2Y4FoVovhCwVnGeUs+qExDuEJiYiV23qeO9vY5G95qZUDa6MNnGueapTxIE=
X-Received: by 2002:a25:c78c:0:b0:dcd:6a02:c111 with SMTP id
 w134-20020a25c78c000000b00dcd6a02c111mr1405796ybe.11.1708674681755; Thu, 22
 Feb 2024 23:51:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223143309.5ec298ec@canb.auug.org.au>
In-Reply-To: <20240223143309.5ec298ec@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 23 Feb 2024 08:51:10 +0100
Message-ID: <CACMJSevZxCiqa8uz+XU36psCa5T_rQGi5tVkMejpZj22Bj1k3Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 04:33, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the gpio-brgl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> x86_64-linux-gnu-ld: vmlinux.o: in function `bgpio_write64':
> gpio-mmio.c:(.text+0x1489427): undefined reference to `iowrite64'
> x86_64-linux-gnu-ld: vmlinux.o: in function `bgpio_read64':
> gpio-mmio.c:(.text+0x14894a0): undefined reference to `ioread64'
> x86_64-linux-gnu-ld: vmlinux.o: in function `bgpio_write64be':
> gpio-mmio.c:(.text+0x1489527): undefined reference to `iowrite64be'
> x86_64-linux-gnu-ld: vmlinux.o: in function `bgpio_read64be':
> gpio-mmio.c:(.text+0x14895a0): undefined reference to `ioread64be'
>
> Caused by commit
>
>   36e44186e0ba ("gpio: mmio: Support 64-bit BE access")
>
> I have used the gpio-brgl from next-20240222 for today.
>
> --
> Cheers,
> Stephen Rothwell

Hi Stephen,

I'm not seeing this issue with allmodconfig on x86_64, could you give
me some more information on the build environment?

Andy: Could it be that the ifdefs you added should depend on
CONFIG_64BIT and not only on the BITS_PER_LONG value?

Bartosz

