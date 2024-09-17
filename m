Return-Path: <linux-next+bounces-3895-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E4797B4D9
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 22:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D5D1F21ABA
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 20:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022EA18D656;
	Tue, 17 Sep 2024 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tga0bg+M"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F77016132A;
	Tue, 17 Sep 2024 20:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726605835; cv=none; b=uziX0DhIdjPb/h3t5Da7+ID+++c9NAATUFFKkD92zzwiuDmUUu29JMcM2/Q299hGKnGbLduJRRR96M3Dnv5ZrS53sE9wlcyJMpYiELO7pjImQ+tLhZwgaLO09csh0+IeimoeUjfaBvwNlqCTFYuo0fbzUFA9x4wrDW/QAM8pCgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726605835; c=relaxed/simple;
	bh=YeaS3unihXtzQOMow7ezk1Bx9gSH++mgIedNJfbgh0w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XAKAQEoOzDBqIjrluxx/yQvXDGlhgAyvYsVjpu4qTMWotrsTOVMjU3BHxI7WYhSKAhHJMN3EcD1PHHMU1Ej7+2+r4t5O69j31QjL9+RKa+6ZpI/FVIhC6ly6tsaJYGGPsq8VWLlSij2L2T11VOz4lDZ67RXE1Rp1WtwNiqJ/UFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tga0bg+M; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726605830;
	bh=qv5jMhiYV9JvdlxIVn4GEDGlQx775UIeF98ZabxwPdI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tga0bg+MLRDZaLdYyWr9wOHGduEZAK0gvBp5yaP6orAVpwQlfInSwSoNHo693BZeB
	 y0uxKQ/J/Rd/x+ebTMFshgcM9AHPbiRZWAg4jGg3AKMeUCE8rQVHmV3mYBBaTISaZj
	 f8jqjNeLp2tSFZfWmnVNHjtE6A08G5YjfSjvXpKDk3Fu/CRnmGvR7xwLZIcDCuA6o+
	 ocCfKkeM/Y6IkBxLGTJRCFpFLxrAAQg2KrXka2vc1VUiCMr9PGs/mU6z43cvOrnirb
	 odA/AkanoqmqDT4pGsaEGQAzBk7ZKncNdMl2BJOaHQWtu+/+p8OY41h7P/lWG5A/yI
	 zvk9I5SE8yNwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7YfF4xgvz4xWm;
	Wed, 18 Sep 2024 06:43:49 +1000 (AEST)
Date: Wed, 18 Sep 2024 06:43:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the stm32 tree
Message-ID: <20240918064349.79dc0a1e@canb.auug.org.au>
In-Reply-To: <20240906120821.6ca2ac3d@canb.auug.org.au>
References: <20240906120821.6ca2ac3d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dtVwgsyt0Ba3JX/KfWIkA4r";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dtVwgsyt0Ba3JX/KfWIkA4r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 6 Sep 2024 12:08:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>=20
>   078dc4752822 ("ARM: dts: stm32: stm32mp151a-prtt1l: Fix QSPI configurat=
ion")
>   76e16f3549e8 ("ARM: dts: stm32: Keep MDIO bus in AF across suspend DH S=
TM32MP13xx DHCOR DHSBC board")
>   835dfbca3781 ("ARM: dts: stm32: Add ethernet MAC nvmem cells to DH STM3=
2MP13xx DHCOR DHSBC board")
>   8388a6e67f22 ("dt-bindings: arm: stm32: Add compatible strings for Prot=
onic boards")
>   a15ad86d4b65 ("ARM: dts: stm32: Add MECIO1 and MECT1S board variants")
>   b14c9f6bd0ba ("ARM: dts: stm32: Use SAI to generate bit and frame clock=
 on STM32MP15xx DHCOM PDK2")
>   b512ce39b570 ("ARM: dts: stm32: Sort properties in audio endpoints on S=
TM32MP15xx DHCOM PDK2")
>   c00176c49e94 ("ARM: dts: stm32: Describe PHY LEDs in DH STM32MP13xx DHC=
OR DHSBC board DT")
>   ce923f5d2804 ("ARM: dts: stm32: Switch bitclock/frame-master to flag on=
 STM32MP15xx DHCOM PDK2")
>   d3557e468f68 ("ARM: dts: stm32: Disable PHY clock output on DH STM32MP1=
3xx DHCOR DHSBC board")
>   efab072ce426 ("ARM: dts: stm32: Add missing gpio options for sdmmc2_d47=
_pins_d")

Those patches are now in Linus' tree (as different commits).  Please
clean up the stm32 tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/dtVwgsyt0Ba3JX/KfWIkA4r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbp6gUACgkQAVBC80lX
0GxHuggAjN3UZ7xhHdYguvl/wLOsYviQ5R1fG0ygEw1PFEhNurXj3W9sIPIoBzat
6PhKmRbL9dZxmJCc3vy23SslWUXALFO4yUG5wXayJV9sdJc1b/hpD7tX2qjpbk2q
4TvlMPVAYwh9VX/Uosmi8QzB6vzgnjuGyWqxzGQBN3pzrmQep/gt4HKqxf7CJgNa
V6F/Jvnmzgf0EvAfU76u0EEu+mM46UU2k6ehAGvngtIAMqX23rwcjuRw9sc4crjA
jDMFpdpiH1Kq3hlO1KQyVgcHPigUxm0AhxVHRCjoEMCTyS9FJDLxDlISwNy9E4K/
FekJ40Urx0jsP40wuJoHEORV1FiTjw==
=bHIe
-----END PGP SIGNATURE-----

--Sig_/dtVwgsyt0Ba3JX/KfWIkA4r--

