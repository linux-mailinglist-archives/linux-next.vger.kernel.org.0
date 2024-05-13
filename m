Return-Path: <linux-next+bounces-2280-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE238C499C
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 00:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B778D1C21123
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 22:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DE339FD6;
	Mon, 13 May 2024 22:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FRo/n1ej"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E20D51A;
	Mon, 13 May 2024 22:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715639614; cv=none; b=fJxOIFnIOCHeKwM8ubbB9Vr4dB7U3mwpWA64X+GN7g7B/sumw2NOziSxUdcrQDaO0J1cLhp8Wh8WSDYwmb+6nNehcTC5T3299Ki7OZoiNW6XopeINC02bnaU9bxXg5+YrIRjLcGqO/s/zCKEVzPHJsyuE9g9uhyMJQypQiMdNB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715639614; c=relaxed/simple;
	bh=VF+xtnpj6iNd1cqa0mfpTf22R+BwsnEumpnvLM8BRJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B9QpbkzqigFjrO/O+LDR4sXoqC2cr0oowKOzaJx0Vjb9CyukENb0pStELyfJdxfZRxyJExPbvZjQ+BTvvSoOlSs5Bi7lHMoIPPkzgh2DkCf7NdkJap3tQXHhPKF4JywY8Md8RqGdIgSYjyin8OPclm55FDw1Hky3XNEBPjeGtVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FRo/n1ej; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715639607;
	bh=866m8QdJ9ODjSr65zAIEiDVsaMx436FiNEjIN0mFDpo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FRo/n1ejgW31yns0cGuJnHrvzwmey8W3h9K9i1iSVs5zX5Tdp+U6hpehuKHvcFB6w
	 tOCQtZFlcIrJWMqR1FzgZk/t6Ct4Npq/J1FFYTLYoGOy6c5cJhg8cPTTq84alkh344
	 B4GMyh2yi8j3Cte52+mhRDnc/pmdteFv/x4JJ4w5hvrPqEnzyobZz7y6TYn1QYs5A4
	 AHAPORLboAtb5O0dJGanerZwiJ07bf5MqblXv3JERFWKcdTZJInL92c+VOnZ6sBl70
	 REVn6WCepH/0W4gZ7bZtN9PMQHMNj/RpfrnMjKiLhxrjgpjiYKAxglqR9V7f3fcYsT
	 tC1K2hZyrnk1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdZ5M4PlJz4wb0;
	Tue, 14 May 2024 08:33:27 +1000 (AEST)
Date: Tue, 14 May 2024 08:33:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the stm32 tree
Message-ID: <20240514083304.0a8b368b@canb.auug.org.au>
In-Reply-To: <20240430110428.30432b2f@canb.auug.org.au>
References: <20240430110428.30432b2f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y6KkD+C1uYVV+V_u2t3jAxg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y6KkD+C1uYVV+V_u2t3jAxg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 30 Apr 2024 11:04:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in the arm-soc tree as different
> commits (but the same patches):
>=20
>   0087ca056c73 ("arm64: dts: st: add all 8 i2c nodes on stm32mp251")
>   2886ab7437de ("arm64: dts: st: add rcc support for STM32MP25")
>   385ca8e3841f ("arm64: dts: st: add spi3 / spi8 properties on stm32mp257=
f-ev1"
> )
>   3e7d579c9fca ("ARM: dts: stm32: add ETZPC as a system bus for STM32MP15=
x boar
> ds")
>   4ef09379d765 ("arm64: dts: st: add i2c2 / i2c8 properties on stm32mp257=
f-ev1"
> )
>   5e6b388d7bcb ("ARM: dts: stm32: move can3 node from stm32f746 to stm32f=
769")
>   7442597f90ba ("arm64: dts: st: add i2c2/i2c8 pins for stm32mp25")
>   7c12d95564a2 ("ARM: dts: stm32: add LTDC pinctrl on STM32MP13x SoC fami=
ly")
>   7c3d4f99a920 ("ARM: dts: stm32: put ETZPC as an access controller for S=
TM32MP
> 15x boards")
>   808691f7389d ("media: dt-bindings: add access-controllers to STM32MP25 =
video=20
> codecs")
>   881bccce217e ("ARM: dts: stm32: add LTDC support for STM32MP13x SoC fam=
ily")
>   8fe31699b83d ("bus: stm32_firewall: fix off by one in stm32_firewall_ge=
t_firewall()")
>   9e716b41a2b5 ("arm64: dts: st: add RIFSC as an access controller for ST=
M32MP25x boards")
>   a012bd75abf6 ("ARM: dts: stm32: enable display support on stm32mp135f-d=
k board")
>   aee0ce48516c ("arm64: dts: st: add spi3/spi8 pins for stm32mp25")
>   be62e9c0c3fc ("bus: etzpc: introduce ETZPC firewall controller driver")
>   c7f2f2c0ace8 ("ARM: dts: stm32: add heartbeat led for stm32mp157c-ed1")
>   cab43766e000 ("ARM: dts: stm32: add ETZPC as a system bus for STM32MP13=
x boards")
>   d3740a9fd78c ("dt-bindings: display: simple: allow panel-common propert=
ies")
>   dccdbccb7045 ("arm64: dts: st: correct masks for GIC PPI interrupts on =
stm32mp25")
>   de9b447d5678 ("ARM: dts: stm32: put ETZPC as an access controller for S=
TM32MP13x boards")
>   ede58756bbe5 ("arm64: dts: st: add all 8 spi nodes on stm32mp251")
>   f798f7079233 ("ARM: dts: stm32: add PWR regulators support on stm32mp13=
1")

Those commits are now duplicates of commits in Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/y6KkD+C1uYVV+V_u2t3jAxg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZClSAACgkQAVBC80lX
0GyhoQf/URZkgMxevy8lFmqX6G50N5iexA96Z3VwvTjMT197cyAyX/IuThQcZdf5
uqR7htdMsIzIod2PoSCmkqHv4kuhFxhkhNB5aQMDdS2zDV+Z8R0q4Gem4ajMkKE1
nccYyPVEnJEtuPqrWJKDb6/2e1DLo+v6KFhg+IEHVtNRvQb6g+wfaoWsuZJw/TsP
1Gl4Ohxmxbxf24pstgd/Hhsyr/cqF5Irhq3SGbnHsuhQ7v80LQSWngxwdWT2/QQK
efSZsBeEFqXVS0Eyg0vvJpz9sMHJyw2eN5FU1mQEr463+NOIx2rXuYafCKNIFAk/
F62ppmuyc13dSjgYuTlEUtBkcKbIHQ==
=arru
-----END PGP SIGNATURE-----

--Sig_/y6KkD+C1uYVV+V_u2t3jAxg--

