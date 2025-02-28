Return-Path: <linux-next+bounces-5615-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B91A49A16
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 13:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD9967A3A7A
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEF026B2CD;
	Fri, 28 Feb 2025 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PC0n80Z9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2847E26B2C8
	for <linux-next@vger.kernel.org>; Fri, 28 Feb 2025 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747584; cv=none; b=RBOj7KBX78n0HDaPx3dc1blt+TfEIm9aKFP1ITVmlxWBPV6DVi3ktde6A6YQyf6GmaOPK9tg1sRd/ylsYn6QcECHonfDEF/DHYuoTBTpGcC9U0mkPYSFxVe8cl6/Xb9iQt6NHIyWdjLavZcPm3JkRoZrjDiIH1S049m2iMXFC/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747584; c=relaxed/simple;
	bh=4CTspMKLjSchgdZUIDYXHa17XzqC+EKN22jzUDz747I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwKBd3MxVshXQzcM+ZNo9wzg4jTmSDQOJSZaMsD3msGjIuUQyqan/dAFf1qq2sKTU8/etcEOHiBRfRunsKQLCzX9zavA8dEQORJ6Ac/cY9F2yLP3l7BD5m75wG0J5WOOR+6lgSr5rmEcXgrViMy0ckw3Gmh5eLTZnppMARCFmgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PC0n80Z9; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f88509dad2so20065817b3.3
        for <linux-next@vger.kernel.org>; Fri, 28 Feb 2025 04:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740747582; x=1741352382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCTmypiLeGBL8xVDG84oHuOUgQGA6jAq3NzfKLXhqvU=;
        b=PC0n80Z9gbkZtXZMOww/zEV+UnO+3/jjRHLLWiolWbPdayv/hTJHCfI7jnNxYrWuwR
         ah6J+wo6ua3N8JgC9jTAY7RceGszVLXbbXvw59hzb6zKOPHnCWkjpfHjajwQd3yxsSjD
         VPRVGH5jkkDyP9AKfilK9e3QGFEezNEH1up+xHRgK9mait0Q7n3UoKjS8d9ahHj+g2S6
         sCaPWcYOAs/npPYguFdwn7ovQ5SGqQ5Wfb61qA5a8LytYEQmJu7QrrYoegqg2hK7bxzw
         FXbUDxl243Ttq9Cu4kDH866icPVdYctXzFMXnAgZNdqYKSHVkszo60KVVxbUXGjFWgN6
         +t7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740747582; x=1741352382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCTmypiLeGBL8xVDG84oHuOUgQGA6jAq3NzfKLXhqvU=;
        b=l+2adHXuwkDourQuVhKKw6fZsGTowUSduzUbhLJTGfy0JxE3Gob+IyQQekQUWW7vAU
         hX1Oda/+wWfrbEDU3fMfjCjJNA3n2F0RaqLsLpZvflDK2K54TXOFoarMpVPwb/8Do7n7
         kAj/HpE4Odu22rMe96RiK9RuX47JURLFuuY3gRzRbpLQB6/TYtiYmbHecBDLXjjDNL0F
         6nJ13hiveWPJar9UNZL2K0YCFXPmtyBzBfcyGRyt952grn/iY1T62Txnis1DbJVkxn2a
         PULNHE9by+drQ/rVIZ6jD6HChsjPvcpUI1Nv9TPBrEOQbcS8jgkMCBpmQtcoGqayqOVN
         kIVg==
X-Forwarded-Encrypted: i=1; AJvYcCVN/HaOQJlY9UuzKE+ZoBgFXPyEbOsVQKA2pCxadmEGWcWYM8/RPKoCWmrISSmnVTAqxRY1Eut1dDV8@vger.kernel.org
X-Gm-Message-State: AOJu0YyM0U8vCnPWkRRtMi4pwaJTc8wkc3fyJ5RgT0DGwoA57oyBuk0k
	XKOxJCe49JxZiNNdJTm0tIzfni+dWyUxspQ8Cz6JEM9B9gLIoOlc2s/vdoSWVIbgoM2HI5RpBDN
	bHojoiXF++9zCp5pjZwTVfyHr5YZG72buTKBgng==
X-Gm-Gg: ASbGncstp+ry0XnUEXZ6eeRPsh8s6uAR5yBypSF2lE0Tqjixofu+GrMEY17VfvZwIfH
	xJS0K/TI9XePlQiT3TxN5TCE3GY0trbzKzddFqIxweQlj5Lsdx0CTLyj9j9Uw0RvWpaX4CTuJ5h
	+Pqz+GrLjn
X-Google-Smtp-Source: AGHT+IHtf9QXuiY5xXAGiBiB0ZqMXV16c1zC+23L951s4uTBNQf6KtwYbOfS7+aOcWi8wholKrvRp2OF2LeDxR8Wm8I=
X-Received: by 2002:a05:690c:3686:b0:6ef:6a71:aa55 with SMTP id
 00721157ae682-6fd49ead0dbmr49973807b3.0.1740747582047; Fri, 28 Feb 2025
 04:59:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220113338.60ba2290@canb.auug.org.au> <15141602.O6BkTfRZtg@diego>
 <CAMuHMdU102nhmHoxo+z2XCxNf+gLFuBnAZamtW+V=WjKFX9rjA@mail.gmail.com> <2087532.0S5aU1g85B@diego>
In-Reply-To: <2087532.0S5aU1g85B@diego>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 28 Feb 2025 13:59:06 +0100
X-Gm-Features: AQ5f1JrBlInqsTnKC-ZJdzKy1iY_YHHHz4CIkGCaW6ofmvNG5_zIe99Suy3Ucbg
Message-ID: <CAPDyKFr7g5sEP06_cUO6zFk1GA_QmXg30aKdqrYA3RmU=ybTzA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Feb 2025 at 10:01, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Donnerstag, 27. Februar 2025, 18:05:18 MEZ schrieb Geert Uytterhoeven:
> > On Thu, 27 Feb 2025 at 17:16, Heiko St=C3=BCbner <heiko@sntech.de> wrot=
e:
> > > Am Donnerstag, 27. Februar 2025, 16:56:01 MEZ schrieb Geert Uytterhoe=
ven:
> > > > On Mon, 24 Feb 2025 at 13:27, Ulf Hansson <ulf.hansson@linaro.org> =
wrote:
> > > > So this was fixed by adding a dependency on HAVE_ARM_SMCCC_DISCOVER=
Y[1].
> > > >
> > > > I am no Rockchip expert, but is this the correct fix?
> > > > As arch/arm/boot/dts/rockchip/rk3036.dtsi uses enable-method =3D
> > > > "rockchip,rk3036-smp", e.g. RK3036 does not depend on PSCI, so I as=
sume
> > > > you could run a kernel without PSCI support on RK3036 before?
> > >
> > > All still relevant 32bit Rockchip SoCs (rv11*) already switched over =
to
> > > PSCI. So if one uses some sort of distro-kernel (or one simply built =
from
> > > the in-kernel defconfig), PSCI support will be in there already.
> >
> > OK.
> >
> > > So the only case where this is relevant, is for kernels custom-build =
for
> > > one specific soc type.
> > >
> > > The rk3036 (and rk3128) are from the same era as the rk3288 - 2014 .
> > > That's more than 10 years ago. And we're not talking about these old
> > > boards not working anymore - just a _possible_ size increase in very
> > > special cases (of not using any distro-like kernel).
> > >
> > > arm32 psci.o is 176kb ... and even my r3036-kylin board came with 512=
MB
> > > ram. So personally I'm not too worried.
> >
> > My worry is not so much about the size increase, but about
> > CONFIG_ROCKCHIP_PM_DOMAINS becoming disabled when
> > running "make oldconfig" if CONFIG_PSCI is disabled.
>
> ah, now I get it :-)
>
>
> I guess there are ways to prevent this (still uncommon) case:
>
> (1) The CONFIG_ARM_GIC_V3 already uses a
>   select HAVE_ARM_SMCCC_DISCOVERY
> The pm-domain could do that as well.

I think the select better belongs in the soc specific Kconfig.

Like in arch/arm/mach-rockchip/Kconfig, for example.

>
> (2) The main __arm_smccc_smc has a stub for the !CONFIG_HAVE_ARM_SMCCC
> case, and arm_smccc_1_1_get_conduit() is described as
>     "When SMCCCv1.1 is not present, returns SMCCC_CONDUIT_NONE."
>
> ------
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 67f6fdf2e7cd..3e6b34570a64 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -300,7 +300,14 @@ enum arm_smccc_conduit {
>   *
>   * When SMCCCv1.1 is not present, returns SMCCC_CONDUIT_NONE.
>   */
> +#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
>  enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void);
> +#else
> +static inline enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void)
> +{
> +       return SMCCC_CONDUIT_NONE;
> +}
> +#endif

This could make sense, but to me this is an orthogonal problem.

In the end, we really need the "select" to be done so the platform
becomes configured correctly.

Kind regards
Uffe

