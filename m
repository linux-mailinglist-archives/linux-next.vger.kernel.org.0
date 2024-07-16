Return-Path: <linux-next+bounces-3033-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3479323D2
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 12:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F0D6B23265
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 10:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4115E198A36;
	Tue, 16 Jul 2024 10:16:07 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3922A3C3C;
	Tue, 16 Jul 2024 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721124967; cv=none; b=i8UFb6mt0SzvCE9q2xdBOwJ7jTlCqmO/fOEjR5iYMOU89A6xiphLEERWzG+oAZb0ZKBG7hYbSol2U4Uk9vQ5SJfqYfop/eGcp11bET/JCV2CeMEHws64HaV8de21N9MJdDN4an9exlFSVe9cUNNNovUw0qCa83LuPaZk4mIBk14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721124967; c=relaxed/simple;
	bh=FS29QGysNhTWVFlH65R2gsjhPUCjUNA7LgGU03WagD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhNNDVmZOkvGf8hyaIeGYbAWGXR2nckFBSa2QT5zOhHoorREjbzgGbaAIdb2ljxjF77NMeTgggN+Qyf3mcUoJx1KxFrK5MUKmy6fEDzFQmaNUqtB8a0l7K8MxXqPQ+veCosE0EsyTheYK+Unn8z02UjwH4JJYqX6X9hYJEah0is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6518f8bc182so46487377b3.0;
        Tue, 16 Jul 2024 03:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721124963; x=1721729763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lg82mOlKcZMSt/wtYimCB/hqB+SLV9zQbRzPDFLfmeI=;
        b=BWwDRi9EErMfAuOS9DCjVUB58d1C7INcJRkORPoSR4ixya2ULSXGLQSy7AKpq8/4fN
         jdSO8o/IiaGTc+GN/LDM0jpes+cBjRQQS8+vIScd7X1zPFst2UePl5vicu5JZr6Awgok
         XQ0eQ43Nf+vNeXg3oVy7mx0+CNGmJSQlMrKhFS/ZFuw/VmMb1QBDd3Dzy4fR6XTSia+R
         vF0Fu0ZJu/vmSDfDyyrb5ZRL9Cin7HHelVp1hl5Yfv2nu9/DCh6F35rvFwjzEz0Bv0wz
         y++qBmeUV2BF/lyeg5bgYs90as9VKOd37WtgFb2wnPe0lOu1FxH3Gu5Xr7K8SKiEezXi
         LWWw==
X-Forwarded-Encrypted: i=1; AJvYcCWBoSM06i2W+f6unIO5zjcOhlA09Jlorq9gKvX0SjK6By7jguxRcXCE0ZUCHIKphOD6GjokRtJChmQSCm2e4Ny4QY7aa6Ap22CliKhlgSxbs3xnICq9wEhQUDjYjMU15LS/QnRAgOgIfw==
X-Gm-Message-State: AOJu0Yy/uOarfFnM4a6OmQG8rhv/1cFbD/+KvUoKts8deSBlvFXM6Kpr
	bbBM/wHnuSNOXfpkuV8nA6zHWFx7Nzc9NO9Vbq4yP/xLfcj4s7oHiTe8s98Y
X-Google-Smtp-Source: AGHT+IF6zK6agLyDoiTALixwtpj9YWIsrlMc8iv4Jr/jHtEQBMOeRx98bdYQSdE1p+OewO27DvAvSA==
X-Received: by 2002:a81:8886:0:b0:62f:206e:c056 with SMTP id 00721157ae682-663a3647b74mr9565937b3.5.1721124962907;
        Tue, 16 Jul 2024 03:16:02 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65fc212b3d7sm11067637b3.14.2024.07.16.03.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 03:16:01 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e057ae1adbeso3995626276.0;
        Tue, 16 Jul 2024 03:16:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPIiGpF9nVey0Tqqv8BnY7mcXWRi6asjvNnvNzeb320B7m3I2JoqxABTfh0JFwYR4Y3Lz0SksHcMILB80uB9EO8YeaunZqsqgtRnaHpq1ZXYz0M31/pD2LUBlLOPPQvASNGiKfJEhE9g==
X-Received: by 2002:a05:6902:1b82:b0:e03:359a:6a54 with SMTP id
 3f1490d57ef6-e05d8057354mr1058940276.6.1721124961376; Tue, 16 Jul 2024
 03:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Znm5qDrsqIY8VNTc@sirena.org.uk> <2024062524-numbing-winking-dde5@gregkh>
In-Reply-To: <2024062524-numbing-winking-dde5@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Jul 2024 12:15:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAs-Mm4YKgEJsr7XO4e2ezUD9PY7QE_F8gY6aQaWuyQQ@mail.gmail.com>
Message-ID: <CAMuHMdWAs-Mm4YKgEJsr7XO4e2ezUD9PY7QE_F8gY6aQaWuyQQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To: Greg KH <greg@kroah.com>
Cc: Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 7:11=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
> On Mon, Jun 24, 2024 at 07:23:36PM +0100, Mark Brown wrote:
> > After merging the driver-core tree, today's linux-next build
> > (x86_64 allmodconfig) failed like this:
> >
> > /tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: error: ini=
tialization of 'void (*)(struct platform_device *)' from incompatible point=
er type 'int (*)(struct platform_device *)' [-Werror=3Dincompatible-pointer=
-types]
> >  1381 |         .remove         =3D rtsn_remove,
> >       |                           ^~~~~~~~~~~
> > /tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: note: (nea=
r initialization for 'rtsn_driver.<anonymous>.remove')
> >
> > Caused by commit
> >
> >   0edb555a65d1e ("platform: Make platform_driver::remove() return void"=
)
> >
> > interacting with
> >
> >   b0d3969d2b4db ("net: ethernet: rtsn: Add support for Renesas Ethernet=
-TSN")
> >
> > I have applied the below patch.
> >
> > From 8f276c3b5b1be09214cbd5643dd4fe4b2e6c692f Mon Sep 17 00:00:00 2001
> > From: Mark Brown <broonie@kernel.org>
> > Date: Mon, 24 Jun 2024 19:02:24 +0100
> > Subject: [PATCH] net: ethernet: rtsn: Fix up for remove() coversion to =
return
> >  void
> >
> > Fixes: 0edb555a65d1e ("platform: Make platform_driver::remove() return =
void")
> > Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Any chance we can get this fix into net-next?
I've been cherry-picking it from next-20240624 for the last weeks...
Thanks!

> > ---
> >  drivers/net/ethernet/renesas/rtsn.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet=
/renesas/rtsn.c
> > index ad69d47463cbd..5a6cc99e6b35a 100644
> > --- a/drivers/net/ethernet/renesas/rtsn.c
> > +++ b/drivers/net/ethernet/renesas/rtsn.c
> > @@ -1358,7 +1358,7 @@ static int rtsn_probe(struct platform_device *pde=
v)
> >       return ret;
> >  }
> >
> > -static int rtsn_remove(struct platform_device *pdev)
> > +static void rtsn_remove(struct platform_device *pdev)
> >  {
> >       struct rtsn_private *priv =3D platform_get_drvdata(pdev);
> >
> > @@ -1372,8 +1372,6 @@ static int rtsn_remove(struct platform_device *pd=
ev)
> >       pm_runtime_disable(&pdev->dev);
> >
> >       free_netdev(priv->ndev);
> > -
> > -     return 0;
> >  }
> >
> >  static struct platform_driver rtsn_driver =3D {
> > --
> > 2.39.2
> >
>
> Looks good, thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

