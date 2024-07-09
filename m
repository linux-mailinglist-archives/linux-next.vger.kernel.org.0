Return-Path: <linux-next+bounces-2865-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433692B15B
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE6D282466
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 07:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA5C144D11;
	Tue,  9 Jul 2024 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MXKZ8mU1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD70C13211E
	for <linux-next@vger.kernel.org>; Tue,  9 Jul 2024 07:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720510852; cv=none; b=raiH4IdvhWMdVqvLu7msodMYYoEwnwqCI4GS+QIPxUsf5ulUmz5Ur8wsz7GJj0hIawzCgxqQCb7RvUU/9bK52tzIHxKtXQpMXTNJVhAeJxmiEFIzsZa6XQ0ZD/U7SnzOwZD451q2CWy7mHVNmCjoDeSG8VezwTyXUzStwEVKNOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720510852; c=relaxed/simple;
	bh=ixggmUE0LTyUbS3bl9curw62MEaHezEtSQEQ5nCTZfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhQFnwbJxLiZ8l2WhSBRzQ0bVWaP8MkxNEYx3IvpFP3eFZq8mLdS+NaaQEQjwK2DrBndeo4tCSJxay2ewl7goqvWYfky9WrSA4OBWjEKa9SHgvt6QpgyY6x37AQo9WIXIZTQGHkha2P9UaTprSDdDVdj35N450vCfiWVteWigl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MXKZ8mU1; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64f4fb6ce65so40779477b3.2
        for <linux-next@vger.kernel.org>; Tue, 09 Jul 2024 00:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1720510849; x=1721115649; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oV2ivOS0H4TcrNQjSu8eXaAaHjNVHS96/zwQt0kFu/A=;
        b=MXKZ8mU1uht3aDSxtfSCU4sRnIgOv94pyXun6PqgNn6hFD30vpDnWaFkurAj1kJFKW
         /0IrScXPWBOtQstEpK6qIUrw+Gox5AdGMbPGDt0cQb9a0eKviLcUre7YrDJA5mxDYrFQ
         2SkUyuiOFgddZQCbODD3ZnAZBKZRY4nbDqpNrUkF+Zvfi4q2hun1OaYkpTlVsghDbJGs
         PyRjlurGlSWKj3gEAmgsGuSOmZfWQ0QXoJlpJkWo5S/1pjx/sHogL839kXrgOtpB04FW
         Z7t3x6tmezJ0ZVNmsW1hdd99CFLQeTxPXrCEtUFRp37A7UdQtTIkgRo9P/LWHrA9iIag
         Vkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720510849; x=1721115649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oV2ivOS0H4TcrNQjSu8eXaAaHjNVHS96/zwQt0kFu/A=;
        b=EXE4U+IcGv8M4gnQwZZ0Rw7vmdeIv4W49xnK5f59WNbh4flrdJigX9Te+lUGGEKiPU
         nnAfQwKSUxhKJ7u/THTEsCep4LPGO4seHXZ3feKtTJ+oMmW3GvmCpsyqLwNvs2Ephix/
         /ClKx7hk0KQqrG48FXvLTs/HgSZnRMPrQ5fP+IDXsM85TjquOMCAbdObg2fA9VEwVOzz
         UjvAMaM+/eXzPkXDDV35gk27sApJ4BaATPqxL9E9pEk2F34hqBtvCzo75FuJK+h6AfA0
         Ma+OZva4REXiOTN/90DGnSvFVmwGoUcULEis0eRFTXCJZXszWWQsyrDxRPmzhH2Ios4J
         SqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG4o5Nx+IYUx9Zf2nL059UY9vqvjwpxIEciOwDFDbiyaj44yi6ls1Dp9LE+LvweaJFA8AnuvLK3wFA+0Mr6+NwU9pxD2/9FsbYHQ==
X-Gm-Message-State: AOJu0Yx7KgDB782XOfdHf7STiEeek48zX6+gsvqCpS11rcBfsnnKNijn
	PMpHaZW28Q041zzW7+jppnFQC3GO+n0ev2uIO1d/25IvFwPzY3U26wNyuMeGH+3557zifmVrhvZ
	LVoA5imJHsSysGPoF/aKZVZbDPN7th+GZDtim29BS3oEiZjVziDE=
X-Google-Smtp-Source: AGHT+IHfQTRA7DIEd/l5VzXaMa8uR3RFFy6Bw7APbayqXIsTVF/H4Rl79/XS/cd6+JfJMLdBwPmNJye4ekec70FChu0=
X-Received: by 2002:a05:690c:4a0c:b0:63b:aaf1:b8c1 with SMTP id
 00721157ae682-658f02f5605mr25038747b3.37.1720510848794; Tue, 09 Jul 2024
 00:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709163715.3bcd6ab3@canb.auug.org.au>
In-Reply-To: <20240709163715.3bcd6ab3@canb.auug.org.au>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Tue, 9 Jul 2024 08:40:13 +0100
Message-ID: <CAEmqJPpaz8dDGvv2z2VkRPFdw7kr-NCnOmbYc-VaTJUx0KXr6A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

HI Stephen,

Thank you for fixing this.

On Tue, 9 Jul 2024 at 07:37, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
>  1786 |         .remove         = pispbe_remove,
>       |                           ^~~~~~~~~~~~~
> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: note: (near initialization for 'pispbe_pdrv.<anonymous>.remove')
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   0edb555a65d1 ("platform: Make platform_driver::remove() return void")
>
> interacting withc commit
>
>   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
>
> from the vl4-dvb-next tree.
>
> I have applied the following fix up patch.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 9 Jul 2024 16:03:05 +1000
> Subject: [PATCH] fix up for "platform: Make platform_driver::remove() return void"
>
> interacting with commit
>
>   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
>
> from the v4l-dvb-next tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index e74df5b116dc..7596ae1f7de6 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1756,7 +1756,7 @@ static int pispbe_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> -static int pispbe_remove(struct platform_device *pdev)
> +static void pispbe_remove(struct platform_device *pdev)
>  {
>         struct pispbe_dev *pispbe = platform_get_drvdata(pdev);
>
> @@ -1765,8 +1765,6 @@ static int pispbe_remove(struct platform_device *pdev)
>         pispbe_runtime_suspend(pispbe->dev);
>         pm_runtime_dont_use_autosuspend(pispbe->dev);
>         pm_runtime_disable(pispbe->dev);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops pispbe_pm_ops = {
> --
> 2.43.0
>
> --
> Cheers,
> Stephen Rothwell

