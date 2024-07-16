Return-Path: <linux-next+bounces-3034-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 929819323C1
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 12:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 141BF1F22F59
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 10:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A53C1991A5;
	Tue, 16 Jul 2024 10:18:39 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2E255896;
	Tue, 16 Jul 2024 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125119; cv=none; b=do72EbQCIZQ60BlYwlJ7ZT2K0VmdBmcR8eb7z/eyzSzq6mz5PKFg8GE551RnoYWRZO2yMgWVFaP1/cw3bdfcXAA1SsIGcFGUampI48nUSSGUFICONunGf1G2gffuWPlucoaRP1FiXRPqEUFyurK6Y6pLQOZEXgn+MyU2vJKAzaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125119; c=relaxed/simple;
	bh=utaNSVftpFdEcoPn/EDfLv09g/DMDqyCk2wf4RX27jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ss7ynFFWx3VnAa1CGMkc/esNOuSzgHAxh8bxgYt/wUGokHM21kXCK6ijRauDtp/fffzouXg/Gk9vajdwwsq6cuiqL7R2xrl43aMX5ONqQmw/xWPwzroQsYzTXyLcRe2RYDTDFaSEXSuTMr+4V/MS6suujcghC71oKpXUhqRee9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6325b04c275so54486407b3.3;
        Tue, 16 Jul 2024 03:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125115; x=1721729915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jvgsrz2gbkz5Y6sf0uFJndaBi+Bdp07mBI1UwquCjQ=;
        b=J5cbSC/j+soQ5voUGTiKL0s7hdpPv/megQOJ+TPzBLe+yK0/qmIsa2MH4zi/MPd8Fa
         Ew6ViKuOnRvbTajxo22yNyPoYfkYzxEy8IaLwQoodaiCWvlmpg8+KmLxC2huDTmiA/oi
         JcNwVX35uFRgcmfwNaMltpsHamobTd4SXq0EGKFISVUHpotIzgvYwnLj4AVSNDgpgJ9X
         9eLQabb+zHzTmuvhYfxLVCf2isa7tNAmjvoL1afwaGPPfrTd6j0Mc3kPKEMl+RP2LaRh
         ol0iHadJ2mSOS1xFxo7qn5d//kd+FLKT1kTPK/GOA/2DKUS6fGCwGLqpO9NojdLywBeS
         DzGg==
X-Forwarded-Encrypted: i=1; AJvYcCVvYDYcNJOjUpVveOhMVD3uW2QtD/lPaE+QQ7tce9SlwkHa/2KtyjUlt/g8SWo2/GZ/WgjTdtnfhx9yottl8zZgg/dZeekcr4HbP28Qzjez35o5punXt8qZss9N3IZ8Rdahr2mmeVJz6Q==
X-Gm-Message-State: AOJu0YwnJ/IZOU1NmuXBiLUu7DMaR5eVaHpHUn7KPW9urHtiU+d/8X4M
	nChZGghN17Pd+LEAgrQ3k+CsCngW5S7q+zbKQigLfrj78Yiz26mq14CpUb4a
X-Google-Smtp-Source: AGHT+IFl2mySFXYwEjsK78n+nZ0b3reSz/8pVDoQ7WDdQ+NMtCFSWJdCRaNfEvPS2BGiwRojCC6puw==
X-Received: by 2002:a05:690c:83:b0:65f:e123:b20a with SMTP id 00721157ae682-66380f13060mr19833697b3.6.1721125115287;
        Tue, 16 Jul 2024 03:18:35 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65fc212b51asm10933727b3.22.2024.07.16.03.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 03:18:34 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e03a581276eso4612286276.2;
        Tue, 16 Jul 2024 03:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwnh67c9N1gQ3puGUIDi6D5po33ODHlP5/QMCxJmEal1izZ9xaWV32Vqtvy+3wyOeqFJmuJitDxCeAJ1araYgazNNLJ5xCvakKO5yOnHDkcZKprJGgr9BXODvU+PxAeAG/qHSWmVeMXA==
X-Received: by 2002:a0d:f602:0:b0:64a:4161:4f91 with SMTP id
 00721157ae682-663816dcaa3mr17608637b3.14.1721125114463; Tue, 16 Jul 2024
 03:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Znm5qDrsqIY8VNTc@sirena.org.uk> <2024062524-numbing-winking-dde5@gregkh>
 <CAMuHMdWAs-Mm4YKgEJsr7XO4e2ezUD9PY7QE_F8gY6aQaWuyQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWAs-Mm4YKgEJsr7XO4e2ezUD9PY7QE_F8gY6aQaWuyQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Jul 2024 12:18:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwD0VqhosSAh_ZgjNO58YeSN+XtU5VBGzv4r+kZ0chyg@mail.gmail.com>
Message-ID: <CAMuHMdWwD0VqhosSAh_ZgjNO58YeSN+XtU5VBGzv4r+kZ0chyg@mail.gmail.com>
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

On Tue, Jul 16, 2024 at 12:15=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Jun 25, 2024 at 7:11=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
> > On Mon, Jun 24, 2024 at 07:23:36PM +0100, Mark Brown wrote:
> > > After merging the driver-core tree, today's linux-next build
> > > (x86_64 allmodconfig) failed like this:
> > >
> > > /tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: error: i=
nitialization of 'void (*)(struct platform_device *)' from incompatible poi=
nter type 'int (*)(struct platform_device *)' [-Werror=3Dincompatible-point=
er-types]
> > >  1381 |         .remove         =3D rtsn_remove,
> > >       |                           ^~~~~~~~~~~
> > > /tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: note: (n=
ear initialization for 'rtsn_driver.<anonymous>.remove')
> > >
> > > Caused by commit
> > >
> > >   0edb555a65d1e ("platform: Make platform_driver::remove() return voi=
d")
> > >
> > > interacting with
> > >
> > >   b0d3969d2b4db ("net: ethernet: rtsn: Add support for Renesas Ethern=
et-TSN")
> > >
> > > I have applied the below patch.
> > >
> > > From 8f276c3b5b1be09214cbd5643dd4fe4b2e6c692f Mon Sep 17 00:00:00 200=
1
> > > From: Mark Brown <broonie@kernel.org>
> > > Date: Mon, 24 Jun 2024 19:02:24 +0100
> > > Subject: [PATCH] net: ethernet: rtsn: Fix up for remove() coversion t=
o return
> > >  void
> > >
> > > Fixes: 0edb555a65d1e ("platform: Make platform_driver::remove() retur=
n void")
> > > Signed-off-by: Mark Brown <broonie@kernel.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Any chance we can get this fix into net-next?

Oops, for net-next, .remove() should be changed to .remove_new().

> I've been cherry-picking it from next-20240624 for the last weeks...
> Thanks!
>
> > > ---
> > >  drivers/net/ethernet/renesas/rtsn.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethern=
et/renesas/rtsn.c
> > > index ad69d47463cbd..5a6cc99e6b35a 100644
> > > --- a/drivers/net/ethernet/renesas/rtsn.c
> > > +++ b/drivers/net/ethernet/renesas/rtsn.c
> > > @@ -1358,7 +1358,7 @@ static int rtsn_probe(struct platform_device *p=
dev)
> > >       return ret;
> > >  }
> > >
> > > -static int rtsn_remove(struct platform_device *pdev)
> > > +static void rtsn_remove(struct platform_device *pdev)
> > >  {
> > >       struct rtsn_private *priv =3D platform_get_drvdata(pdev);
> > >
> > > @@ -1372,8 +1372,6 @@ static int rtsn_remove(struct platform_device *=
pdev)
> > >       pm_runtime_disable(&pdev->dev);
> > >
> > >       free_netdev(priv->ndev);
> > > -
> > > -     return 0;
> > >  }
> > >
> > >  static struct platform_driver rtsn_driver =3D {
> > > --
> > > 2.39.2

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

