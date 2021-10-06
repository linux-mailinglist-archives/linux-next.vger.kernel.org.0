Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A44E424580
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 20:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhJFSC3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 14:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhJFSC2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 14:02:28 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6C7C061746;
        Wed,  6 Oct 2021 11:00:36 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t8so11434749wri.1;
        Wed, 06 Oct 2021 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EPNCCSvlkMxEqS60vnaY80nAIfQ2x+FisCTo8PhpnNI=;
        b=YaYs1nWRhu1qjZuQdKnS5hT/tdWkGV4MWKyHCGYv21kS5A6rvA8AQcoxeA2IwZcamq
         utq055Y5LwdstG4WW3JKijldku1Q+VIwyVVymc1F5y7TVLUMcDyzEnUk9w24P80WD6PA
         IjibsMZpFitMYBvOhJf+XMXkM8SFApmXMpxqIgytlKzgaGrYaegO1ddm2NfbNb8wblez
         Fk6/DXjRHMEHIDGxBrKtzdvO2n7JB/kWICc5ZSnUABwSdyV7QK2oeTGpqLhmktiyUrLZ
         uItYZvbguecHv/KcahyAlNb3YcoQumdOHFDMqTPI0K2w3ViZ3WWYHRoi8sp8OEIO3kSS
         gsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EPNCCSvlkMxEqS60vnaY80nAIfQ2x+FisCTo8PhpnNI=;
        b=uZnHOYZPStAM5Jn820bXwtdnH1u473E6g6j3lKYeu0T54oRMryYeS86UzJ1kDr+7dg
         Ebnc3ljfdGka4mvFdVKbVG2HJ4p9WTXJcHuHCwcv/5NIE6Z/FYShZ4lxzwKrHIwZWx9r
         yUMiatIJlmc7zRHBQWwrjgui4VPkMXXfwjPltvjaXb6tB67wytQ0ZW084jTERi1dN0UK
         YqcOXwljkrcMIkgJJmGkwXgX92CMidPqNTEw4PqGalzIYnrju5Icp00LPDtOi+BTkxQ5
         AqQFSfU6rGUDJ/FMyIbuZWq4AGmHAUO3BHzMCIqun1DgfaS3zRtLENzFaKha/hWP9nk/
         Qc2Q==
X-Gm-Message-State: AOAM532eRAV9wV6MHMeerb2o013IxeXtFWRx8CrMMeIuUYy57gnEeL4R
        Me/cBjrwHn/lCLG8pEfnJDk=
X-Google-Smtp-Source: ABdhPJyvoi0ram5mwr6OdEm44/6bwDjCaD9mcLelkQkBg/9ZHIQaKIDjoqXN1D0ZY3E/SEDZmtSgrg==
X-Received: by 2002:a05:6000:1885:: with SMTP id a5mr11945807wri.64.1633543234667;
        Wed, 06 Oct 2021 11:00:34 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l16sm6506475wmj.33.2021.10.06.11.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 11:00:33 -0700 (PDT)
Date:   Wed, 6 Oct 2021 20:00:32 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tegra tree
Message-ID: <YV3kQPYVKraegCf5@orome.fritz.box>
References: <20211005103952.0914094d@canb.auug.org.au>
 <445e6daa-f210-74c5-cf8d-4aa138136b7e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qLw0vJmupSraQi/M"
Content-Disposition: inline
In-Reply-To: <445e6daa-f210-74c5-cf8d-4aa138136b7e@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--qLw0vJmupSraQi/M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 02:54:43AM +0300, Dmitry Osipenko wrote:
> 05.10.2021 02:39, Stephen Rothwell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi all,
> >=20
> > After merging the tegra tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > In file included from arch/x86/include/asm/bug.h:84,
> >                  from include/linux/bug.h:5,
> >                  from arch/x86/include/asm/paravirt.h:15,
> >                  from arch/x86/include/asm/irqflags.h:63,
> >                  from include/linux/irqflags.h:16,
> >                  from include/linux/rcupdate.h:26,
> >                  from include/linux/rculist.h:11,
> >                  from include/linux/pid.h:5,
> >                  from include/linux/sched.h:14,
> >                  from include/linux/ratelimit.h:6,
> >                  from include/linux/dev_printk.h:16,
> >                  from include/linux/device.h:15,
> >                  from include/linux/of_reserved_mem.h:5,
> >                  from drivers/memory/tegra/tegra210-emc-table.c:6:
> > include/linux/clk/tegra.h: In function 'tegra_cpu_rail_off_ready':
> > include/linux/clk/tegra.h:112:15: error: 'tegra_cpu_car_ops' undeclared=
 (first use in this function)
> >   112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
> >       |               ^~~~~~~~~~~~~~~~~
> > include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
> >   121 |  int __ret_warn_on =3D !!(condition);    \
> >       |                         ^~~~~~~~~
> > include/linux/clk/tegra.h:112:15: note: each undeclared identifier is r=
eported only once for each function it appears in
> >   112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
> >       |               ^~~~~~~~~~~~~~~~~
> > include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
> >   121 |  int __ret_warn_on =3D !!(condition);    \
> >       |                         ^~~~~~~~~
> > include/linux/clk/tegra.h: In function 'tegra_cpu_clock_suspend':
> > include/linux/clk/tegra.h:120:15: error: 'tegra_cpu_car_ops' undeclared=
 (first use in this function)
> >   120 |  if (WARN_ON(!tegra_cpu_car_ops->suspend))
> >       |               ^~~~~~~~~~~~~~~~~
> > include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
> >   121 |  int __ret_warn_on =3D !!(condition);    \
> >       |                         ^~~~~~~~~
> > include/linux/clk/tegra.h: In function 'tegra_cpu_clock_resume':
> > include/linux/clk/tegra.h:128:15: error: 'tegra_cpu_car_ops' undeclared=
 (first use in this function)
> >   128 |  if (WARN_ON(!tegra_cpu_car_ops->resume))
> >       |               ^~~~~~~~~~~~~~~~~
> > include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
> >   121 |  int __ret_warn_on =3D !!(condition);    \
> >       |                         ^~~~~~~~~
> > In file included from arch/x86/include/asm/bug.h:84,
> >                  from include/linux/bug.h:5,
> >                  from include/linux/cpumask.h:14,
> >                  from arch/x86/include/asm/cpumask.h:5,
> >                  from arch/x86/include/asm/msr.h:11,
> >                  from arch/x86/include/asm/processor.h:22,
> >                  from arch/x86/include/asm/timex.h:5,
> >                  from include/linux/timex.h:65,
> >                  from include/linux/time32.h:13,
> >                  from include/linux/time.h:60,
> >                  from include/linux/stat.h:19,
> >                  from include/linux/module.h:13,
> >                  from drivers/media/cec/platform/tegra/tegra_cec.c:14:
> > include/linux/clk/tegra.h: In function 'tegra_cpu_rail_off_ready':
> > include/linux/clk/tegra.h:112:15: error: 'tegra_cpu_car_ops' undeclared=
 (first use in this function)
> >   112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
> >       |               ^~~~~~~~~~~~~~~~~
> > include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
> >   121 |  int __ret_warn_on =3D !!(condition);    \
> >       |                         ^~~~~~~~~
> > include/linux/clk/tegra.h:112:15: note: each undeclared identifier is r=
eported only once for each function it appears in
> >   112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
> >       |               ^~~~~~~~~~~~~~~~~
> > include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
> >   121 |  int __ret_warn_on =3D !!(condition);    \
> >       |                         ^~~~~~~~~
> > include/linux/clk/tegra.h: In function 'tegra_cpu_clock_suspend':
> > include/linux/clk/tegra.h:120:15: error: 'tegra_cpu_car_ops' undeclared=
 (first use in this function)
> >   120 |  if (WARN_ON(!tegra_cpu_car_ops->suspend))
> >       |               ^~~~~~~~~~~~~~~~~
> > include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
> >   121 |  int __ret_warn_on =3D !!(condition);    \
> >       |                         ^~~~~~~~~
> > include/linux/clk/tegra.h: In function 'tegra_cpu_clock_resume':
> > include/linux/clk/tegra.h:128:15: error: 'tegra_cpu_car_ops' undeclared=
 (first use in this function)
> >   128 |  if (WARN_ON(!tegra_cpu_car_ops->resume))
> >       |               ^~~~~~~~~~~~~~~~~
> > include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
> >   121 |  int __ret_warn_on =3D !!(condition);    \
> >       |                         ^~~~~~~~~
> >=20
> > Presumably caused by commit
> >=20
> >   bbe30ae68d14 ("cpuidle: tegra: Enable compile testing")
> >=20
> > I have used the tegra tree from next-20211001 for today.
> >=20
>=20
> Stephen, thank you. Now I recall what was the actual reason for my
> version of the patch [1]. Thierry, please use my original patch, thanks.
>=20
> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20210912202907.284=
71-5-digetx@gmail.com/

Sorry, I forgot to reply to this yesterday. I found a simpler fix for
this and I pushed that yesterday. Today's linux-next didn't have the
build failure anymore, so I guess it worked.

Thierry

--qLw0vJmupSraQi/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFd5D0ACgkQ3SOs138+
s6FLKRAAhmpECO0bnxSlRePMARoo8f1a1IYrae52l6ThkA3vgKPJbBOfP8dCaty7
pC4IiMYPIjNitQbnvglRfIZl0+xZwaEawP/jkkeNwiFJwiRtQ3t+dhvcqeO++fk4
ZZaTt80Qm5y/r03p3uBcnpZPQH3xBTPsFurhrT8Xb5HIVSQuLwrbzmShFHxRIn9K
FyekzbcfpdXBHxYBih6tBEES+fhzVpv5Ulg/F7r3K+KcUkjP/4HjOajQfeL+kSye
4HrTpYXXpRGcGbXr6Jsn2e1dVzQXjaFazRrHNtrv1biba0ezlzK95iS4PWg3wyKC
4KYKWS1vcxcfcbIpJUelceodsFWpaE1fqBSVNKzvLiJDqr2y5xP15Q3si5DD9IyS
NbSZeZhroFukNaFkL3vMWTyZ1zvWAp49M3WAf1pTp4c4hnL8m0eXJBdQOTvkyZgX
7Ej8LHV8Tgm53mgiJSBG4R4uas9EX5hXHI0YOcqDB/kbzVlFoqjKSUJl3VlnaQ+U
asBEeY0Z3Z/cftrjHEv2vV+95NHBG0qQxzfDOJDN8MEFPE8wn4dwmspGNEzHns+P
VGrANsMesTfZF0j53UNVM6T/yOW/XeYau4uAIrdUJl/Czl0aBXkQ3cnp3f33XSmG
HzaDr2cz2Y1M2xvNz8VS2gqggixyOvVFbSCduNl0L3eVU/qTMcA=
=8p6Q
-----END PGP SIGNATURE-----

--qLw0vJmupSraQi/M--
