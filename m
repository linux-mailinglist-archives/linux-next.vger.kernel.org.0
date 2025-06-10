Return-Path: <linux-next+bounces-7130-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B522DAD4671
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 01:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DEF0189E0A8
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 23:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D855260574;
	Tue, 10 Jun 2025 23:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZMD1pj8s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B74F78F34;
	Tue, 10 Jun 2025 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596690; cv=none; b=XPknHTmsdDc5ktpJtn80IDYkPfxJwoCEirfTP7VE5norFcWcKEs7SiR2az4sp2pW3+eqqUzAG8+em4VZCTzc/A+Y45NVNKM05iJFLvurpa1f+yxHmNa60xosWScmO9hlHOfLesNTuO87ejJla3kZej2NkOWmlDB9ZwNiYs1zObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596690; c=relaxed/simple;
	bh=NuZBUFZ3Z4XX4PgFlUpCgydrKQCPkczti63A/LvaRwY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K4gVcxRzItuPc7dyan/kKTkpEmYatCLvppwksPxWzb0lFn8RQeKtP41B0BXYs6eLO9pBipeOTEWDGEuR0c98RwvMYm7+pBYE40AKinxBJPII1DLx6+b2T1761VlfaWcmb35JdCUsKcoCLuNHZ6qpPNeRl/byxwefqUX0cZzHpTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZMD1pj8s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749596685;
	bh=muDFxLfY0+qeyLI3mE8/sqT0z3/gvu2RClGHImS1nX0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZMD1pj8siDTBORviatsIe4lYZrJR4nlhYEN3vJ27H+r3K3pQ3Ep7ajkhs0pl0NnY9
	 SVgdmap932TmWkhVuRnF51VAvXZCWtx/XL2W+4KpyXUugp3v6M0yQGZ002erMFpRKH
	 rmHb3HAFLwZcXcma9w0rp65GsUEazukpVUzqMXxUyzEA1STYRNJP8BGsVId4os1cMg
	 tZxqmcXbUzi3AJjhk3w1y3Gw7pxZG7eIp2znCY/yq0KgXhXi0EPgUCId1dol3legH9
	 xFmRwYeBQB4wvnR+tM6RTMQxW36+efH/o7skmmoxA76qiQDnSa9YcHLO5LMDIQJOjz
	 kGcRl+Al1GztA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bH4B45D4zz4w2Q;
	Wed, 11 Jun 2025 09:04:44 +1000 (AEST)
Date: Wed, 11 Jun 2025 09:04:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250611090444.237c9562@canb.auug.org.au>
In-Reply-To: <20250522113816.16953357@canb.auug.org.au>
References: <20250522113816.16953357@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b=7_cKKdRrcq./9hKW8B1SC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b=7_cKKdRrcq./9hKW8B1SC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 22 May 2025 11:38:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>=20
>   0a0e8571837d ("ARM: dts: stm32: add vrefint calibration on stm32mp13")
>   2a47c4033e09 ("ARM: dts: stm32: add an extra pin map for USART1 on stm3=
2h743"
>   3acfa4becfda ("arm64: dts: st: Add SPI NOR flash support on stm32mp257f=
-ev1 board")
>   3bd31eb4f6ee ("ARM: dts: stm32: add vrefint support to adc on stm32mp13=
")
>   3f70ddb86143 ("ARM: dts: stm32: add initial support for stm32mp157-ultr=
a-fly-sbc board")
>   46e2ad9fd187 ("ARM: dts: stm32: add low power timer on STM32F746")
>   532c5a818d2e ("arm64: defconfig: enable STM32 LP timer clockevent drive=
r")
>   7b6bbef62485 ("ARM: dts: stm32: support STM32h747i-disco board")
>   7b7b6bb0f98d ("dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UAR=
T{7,8}_CK")
>   826e6fb26193 ("dt-bindings: vendor-prefixes: Add Ultratronik")
>   878dec8597d4 ("arm64: dts: st: Add OMM node on stm32mp251")
>   8b773be67b10 ("MAINTAINERS: Add entry for ULTRATRONIK BOARD SUPPORT")
>   8c18889c702d ("arm64: dts: st: use lptimer3 as tick broadcast source on=
 stm32mp257f-ev1")
>   a4d2108a4b3f ("ARM: stm32: add a new SoC - STM32H747")
>   a09cdc01ad4a ("ARM: dts: stm32: add pin map for UART8 controller on stm=
32h743")
>   bf98eb91ac66 ("ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins=
 phandles")
>   caeec8e2b846 ("dt-bindings: arm: stm32: add compatible for stm32h747i-d=
isco board")
>   dd9bfe13b47e ("ARM: dts: st: stm32: Align wifi node name with bindings")
>   df863325b92c ("arm64: dts: st: add low-power timer nodes on stm32mp251")
>   f069852c9b33 ("dt-bindings: arm: stm32: Document Ultratronik's Fly boar=
d DT binding")
>   f80958d949c3 ("arm64: dts: st: Add ospi port1 pinctrl entries in stm32m=
p25-pinctrl.dtsi")
>   fe8690b58efb ("ARM: dts: stm32: add uart8 node for stm32h743 MCU")

Can the stm32 tree please be clean up?
--=20
Cheers,
Stephen Rothwell

--Sig_/b=7_cKKdRrcq./9hKW8B1SC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhIugwACgkQAVBC80lX
0Gy2yQgAkAGaQZt4GSiuHRyOcqcwXyNSNRa0g4NUcNGWrIaM/LKfrx7mqTXuIFDs
Y80fon+MqVpxmAWsCGfb9r4s9DAAugr/7TZhCd66AC09aVyCeIJaUWe1a4mWBEY5
vm0uDKvZRg79C+jj3ePHn8gLyjK8uuUryae2YqctXUcb0FxdDiD7e6/HpTrngt1E
b+FM0EywOiRU1oZP1svCd2YBF5/dEpp+PFZEnPYjqmTqbs5sZDhCtzA5HRBKaZiS
kHW6xfWRYFN2mtD9h4SvEFXPhBriUFqC/CN8f1tnIAdPgHI0E/mR7EW5dMZxUy4O
fbYTxNVQtpDYZUEoKqvtrxqwfPEDmg==
=hXim
-----END PGP SIGNATURE-----

--Sig_/b=7_cKKdRrcq./9hKW8B1SC--

