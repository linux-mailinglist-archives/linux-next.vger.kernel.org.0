Return-Path: <linux-next+bounces-5609-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C5DA49452
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 10:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25C423A60D8
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 09:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41152580CA;
	Fri, 28 Feb 2025 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="nOFqVJ7Y"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89EC1E8321;
	Fri, 28 Feb 2025 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733307; cv=none; b=MpvyYXRg0nK4rYM6ik8dmru674Kksb27tq9AaiRUBHgQF+gSas0AOMvmPt3wHZ+gPNUbG4V6WHJgszmtWcg/Ep2Sm29u13EvSiluWVBkw3v6S+xwLy0JAq4B6dA69YrwwXNa4p1LMRrYDVubnthjnVoHOXTabNOKXlTO8iPt5ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733307; c=relaxed/simple;
	bh=nEX5uT4e0AB2AVLnf5R0GF6Fbtxry4MmDRIaRzp1z6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KthlQPaOlOygKv5IgA9RL6KG6BwXpnh52BcJI6gYkA3gexh9rUqNa7ZIfeQkR9joo98H4t8hZbTLBB6or4hwm0m1ZVHrSqFKJXFI2zKcbkdf2GuzwSz2iJh6EP/DkIJqrAI4osI0GLJ2PSowvudkKegw1nYG52Ehpgsz5QUB/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=nOFqVJ7Y; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OTBv0xr6NJnTSdyyl1TiCQzhVSmYt2aW96H5kc2RCw0=; b=nOFqVJ7Y2z7wfkE4WyH+5fvlHy
	K6buyAbBc0np42yDtz+l4fqA4dD/FDe5eR6ewVgEFaxrmMR+hTSupiBonOc85R5CReBAsnPK0Wowe
	zAqJTqseV1gZij8sXcogHmcv78V3IU2A1y4UpS5a6JEa6Kad79Bz7+Klr5nnBwRKD2zwwYzaaLW1X
	o3zGj8+V3WcitQS7XSOQMpzm0CQxFllg5yFjS1h9f+DM+3YOpe8CTL/8laDyZYs46dkZvPs+r4e55
	6SEzVk/w/mwsFxOktDvIAhXp/GzNUFvZzdExjyIPArS32u9Cz39UlFWojUy9shS16pVwj2xZVJ9UQ
	zD51O3nA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnwFH-0007y4-J2; Fri, 28 Feb 2025 10:01:23 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
Date: Fri, 28 Feb 2025 10:01:22 +0100
Message-ID: <2087532.0S5aU1g85B@diego>
In-Reply-To:
 <CAMuHMdU102nhmHoxo+z2XCxNf+gLFuBnAZamtW+V=WjKFX9rjA@mail.gmail.com>
References:
 <20250220113338.60ba2290@canb.auug.org.au> <15141602.O6BkTfRZtg@diego>
 <CAMuHMdU102nhmHoxo+z2XCxNf+gLFuBnAZamtW+V=WjKFX9rjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 27. Februar 2025, 18:05:18 MEZ schrieb Geert Uytterhoeven:
> On Thu, 27 Feb 2025 at 17:16, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> > Am Donnerstag, 27. Februar 2025, 16:56:01 MEZ schrieb Geert Uytterhoeve=
n:
> > > On Mon, 24 Feb 2025 at 13:27, Ulf Hansson <ulf.hansson@linaro.org> wr=
ote:
> > > So this was fixed by adding a dependency on HAVE_ARM_SMCCC_DISCOVERY[=
1].
> > >
> > > I am no Rockchip expert, but is this the correct fix?
> > > As arch/arm/boot/dts/rockchip/rk3036.dtsi uses enable-method =3D
> > > "rockchip,rk3036-smp", e.g. RK3036 does not depend on PSCI, so I assu=
me
> > > you could run a kernel without PSCI support on RK3036 before?
> >
> > All still relevant 32bit Rockchip SoCs (rv11*) already switched over to
> > PSCI. So if one uses some sort of distro-kernel (or one simply built fr=
om
> > the in-kernel defconfig), PSCI support will be in there already.
>=20
> OK.
>=20
> > So the only case where this is relevant, is for kernels custom-build for
> > one specific soc type.
> >
> > The rk3036 (and rk3128) are from the same era as the rk3288 - 2014 .
> > That's more than 10 years ago. And we're not talking about these old
> > boards not working anymore - just a _possible_ size increase in very
> > special cases (of not using any distro-like kernel).
> >
> > arm32 psci.o is 176kb ... and even my r3036-kylin board came with 512MB
> > ram. So personally I'm not too worried.
>=20
> My worry is not so much about the size increase, but about
> CONFIG_ROCKCHIP_PM_DOMAINS becoming disabled when
> running "make oldconfig" if CONFIG_PSCI is disabled.

ah, now I get it :-)


I guess there are ways to prevent this (still uncommon) case:

(1) The CONFIG_ARM_GIC_V3 already uses a
  select HAVE_ARM_SMCCC_DISCOVERY
The pm-domain could do that as well.

(2) The main __arm_smccc_smc has a stub for the !CONFIG_HAVE_ARM_SMCCC
case, and arm_smccc_1_1_get_conduit() is described as=20
    "When SMCCCv1.1 is not present, returns SMCCC_CONDUIT_NONE."

=2D-----
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 67f6fdf2e7cd..3e6b34570a64 100644
=2D-- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -300,7 +300,14 @@ enum arm_smccc_conduit {
  *
  * When SMCCCv1.1 is not present, returns SMCCC_CONDUIT_NONE.
  */
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
 enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void);
+#else
+static inline enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void)
+{
+       return SMCCC_CONDUIT_NONE;
+}
+#endif
=20
 /**
  * arm_smccc_get_version()
=2D---

I guess case (1) might be the easier one, because stubbing out only one
smccc function might raise the issue of what about the others.



