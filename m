Return-Path: <linux-next+bounces-3108-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27C93A9AA
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 01:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BEADB22C10
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 23:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D5B149C63;
	Tue, 23 Jul 2024 23:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AvZl7WZH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD9C13D52B;
	Tue, 23 Jul 2024 23:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721776503; cv=none; b=RnrtiXdTTENOS3cJVz8mXRVlK+OEVAw541GOdBk6Gj7SKL3hLosCcEA8xwXj7wsYOgy4euKkE95oXVuWkCP1CSNOYIMeTcTkgUsUnB/bC140/nj0tA2DhMJZ1l7Tej71qSMlwgnjWAUUhy++SKeUBA/FPKbHFkOixkgtFew9Ar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721776503; c=relaxed/simple;
	bh=TJsBEydBJqcIXloHId44CNbYL5gDTZLZhhT/kXZQThw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jkG3W8lbWb+271WxxYMKPqvGo3ymWdixImbrJWZfBdNOkTcToCnlokUm7rHi2snbT/fOzPd1aM1ctNvNLCQzza+wjMscYuq795sDyNHaXU3d1Qo+Ia94nei2KQMn+K+FylHAEk8+gb0t+0Stgd7yhPn0rO4J/Tudp2fmSX/c9KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AvZl7WZH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721776499;
	bh=lHrlVazwJprImr0oQBw2SYD7G8B4wRCVINC9aevYsnA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AvZl7WZHqDX6bj7pPBIT76vf55T7+CJGu5D20bw2pfdIvijC4pAxfaV26sYkaimHg
	 OZCiaYzaXnSBu+bCYO3wPISfny2P9JDUvsW4UM/1+j6v4jHefGNxXO7VND1Zvnd3eQ
	 Dte7+VmccBFXQABt+Yymrcc1rGp0rTQfY7r0whh3G/3p9FPstaWL+CZitc2IISW1Wn
	 CmHz63/T8ts3MwfXns8Ai6ihDjILgtL+RnstxZczqwH2ggatWgnxduVrR41D4E6mFs
	 eJSoMkrh/qHhyk18XtmYd5Xj4UYXwWLZWPv20Zq2KwjV8QHIfp2iYa54FskZlJ/zM2
	 tYRDa7NTB+Nyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTCfW3317z4wZx;
	Wed, 24 Jul 2024 09:14:59 +1000 (AEST)
Date: Wed, 24 Jul 2024 09:14:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?B?QW5kcsOp?= Draszik
 <andre.draszik@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the
 samsung-krzk tree
Message-ID: <20240724091458.3052dc6f@canb.auug.org.au>
In-Reply-To: <20240703141932.47e51748@canb.auug.org.au>
References: <20240703141932.47e51748@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XFjo01nz5p.DP/ajuGG=3e0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XFjo01nz5p.DP/ajuGG=3e0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Jul 2024 14:19:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the phy-next tree got a conflict in:
>=20
>   include/linux/soc/samsung/exynos-regs-pmu.h
>=20
> between commit:
>=20
>   85863cee8ce0 ("soc: samsung: exynos-pmu: add support for PMU_ALIVE non =
atomic registers")
>=20
> from the samsung-krzk tree and commit:
>=20
>   32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy=
 (HS & SS)")
>=20
> from the phy-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/soc/samsung/exynos-regs-pmu.h
> index f411c176536d,6765160eaab2..000000000000
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@@ -657,8 -657,8 +657,12 @@@
>   #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
>   #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
>  =20
>  +/* For Tensor GS101 */
>  +#define GS101_SYSIP_DAT0					(0x810)
>  +#define GS101_SYSTEM_CONFIGURATION				(0x3A00)
>  +
> + /* For GS101 */
> + #define GS101_PHY_CTRL_USB20					0x3eb0
> + #define GS101_PHY_CTRL_USBDP					0x3eb4
> +=20
>   #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */

This is now a conflict between he phy-next tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/XFjo01nz5p.DP/ajuGG=3e0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmagOXIACgkQAVBC80lX
0GwYLggAgSG+82hWbhOZuStZlfZly4kXW/io1/SkYfZCxkXPyX86ZcfiFlJ7gBKE
GyudHG/iGQkZ1VZUsd6n73ZP5hiUUtEaIPV4jduZ9qtpxcBwOuwO3O/R7stsyFYK
3TBWNc0LPlp+SvMH4F5YJWdkPyD2lQw2Vfrhfbxh/s7LNRCHK/9xOSCHgKta6W3h
KlezCKhlgPKJeDijFWGmeb6hXPC0LFxvvkixdeMiB+eDYKwbl2I1+xYwh0WOn+VW
8Dn6le9ex4/mKbW0ros9jxJCCz/dJO2uJBUiZkkQIn3QZ6bN3j/1ThEMes9SN7tt
SielzTAr7LHPJwHDWTE1DXosYSP6/w==
=SZgo
-----END PGP SIGNATURE-----

--Sig_/XFjo01nz5p.DP/ajuGG=3e0--

