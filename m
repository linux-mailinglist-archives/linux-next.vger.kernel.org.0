Return-Path: <linux-next+bounces-3904-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC497B6AC
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 04:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 463281F2376B
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 02:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F523524B0;
	Wed, 18 Sep 2024 02:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F5J4qpko"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B075619A;
	Wed, 18 Sep 2024 02:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726625151; cv=none; b=hYpjHVVkY40gamFqEDreJXsruxQrhEJO6PVigkF2CX7IJ6p5FlyONJ6PxjPQTPUS9feNc105HxGDE0xtbhuHwwDPQtdfSIUS7/xfP0DGQywtzdBkCw58OsuhMCbEdmqwHrUjXh10LSpUQmr9sDQ6Q+ptVQ7VwbVtTPkdW9VHA5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726625151; c=relaxed/simple;
	bh=Ab2/LOxhpE5niCrUzSebbWT+ZOyvaTATKYrALwMKywI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIuz/v7pu+95scc9qSZNYommj8UE46FB2tiaRJ1U82Z5TDfqmzC5MJOOARmDGdNpHuETeuq9+I+rXzB3LoBN1bLWTI/upBB55N5r7ySe4ns6B8hYmjs6jMM0jjqaijyGmsCSKY6GLp47kiyipPV/yx2cKHg93Wst2zc6WeL6qtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F5J4qpko; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726625145;
	bh=JFR3RgugFq1YfT4esI9HKKUJ1Z9NhqOrhmEOzHZXTdk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F5J4qpkoeqRlVODclqY0e3gIYcNYzIcZB3Q87vY7qkVw4wAetclSnZKqEUEDFM01V
	 7z8e0IfbhJ6TRgQvS37s778Edp6zd2ZnVIYxBMh5k255tVGb83cfuH7ONqnfBIFELz
	 elzhkbg25JtQKurGt8/zieWA+Hc78TlvNC9EvuUkNe9jQC52jyo++D2v++aYmXfSnX
	 vRl/8/x9sZ27cShcpF3abWurBOnHB+r8UDVs4TOaNFeq60nN1ac2wS7TovhjrlupHc
	 zA2Q0FszENavgpWkRi7Hea0zOP1a4VmxKIu9e6K3gC92JqnzEAMvSzBStnmrS291ot
	 JJQ7doc/qhGsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7hnh677hz4xWZ;
	Wed, 18 Sep 2024 12:05:44 +1000 (AEST)
Date: Wed, 18 Sep 2024 12:05:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chris Morgan
 <macromorgan@hotmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the regulator tree with the mfd
 tree
Message-ID: <20240918120544.0150c844@canb.auug.org.au>
In-Reply-To: <20240910125101.4057d8f7@canb.auug.org.au>
References: <20240910125101.4057d8f7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pINKJaHHiIeFY9KtkAwQTF6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pINKJaHHiIeFY9KtkAwQTF6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 10 Sep 2024 12:51:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the regulator tree got conflicts in:
>=20
>   drivers/mfd/axp20x.c
>   include/linux/mfd/axp20x.h
>=20
> between commit:
>=20
>   2e1a57d5b0ad ("mfd: axp20x: Add ADC, BAT, and USB cells for AXP717")
>=20
> from the mfd tree and commit:
>=20
>   bb2ac59f8205 ("mfd: axp20x: AXP717: Add support for boost regulator")
>=20
> from the regulator tree.
>=20
> The latter change to  include/linux/mfd/axp20x.h is a subset of the
> former change.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/mfd/axp20x.c
> index 4051551757f2,16950c3206d7..000000000000
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@@ -209,15 -209,11 +209,17 @@@ static const struct regmap_access_tabl
>   };
>  =20
>   static const struct regmap_range axp717_writeable_ranges[] =3D {
>  +	regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
>  +	regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
> + 	regmap_reg_range(AXP717_MODULE_EN_CONTROL_2, AXP717_MODULE_EN_CONTROL_=
2),
> + 	regmap_reg_range(AXP717_BOOST_CONTROL, AXP717_BOOST_CONTROL),
>  +	regmap_reg_range(AXP717_VSYS_V_POWEROFF, AXP717_VSYS_V_POWEROFF),
>   	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
>   	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
>  +	regmap_reg_range(AXP717_ICC_CHG_SET, AXP717_CV_CHG_SET),
>   	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
>  +	regmap_reg_range(AXP717_ADC_CH_EN_CONTROL, AXP717_ADC_CH_EN_CONTROL),
>  +	regmap_reg_range(AXP717_ADC_DATA_SEL, AXP717_ADC_DATA_SEL),
>   };
>  =20
>   static const struct regmap_range axp717_volatile_ranges[] =3D {

This is now a conflict between the mfd tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/pINKJaHHiIeFY9KtkAwQTF6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbqNXgACgkQAVBC80lX
0Gxi5gf8DFtVz2eIcXHU6elV4TNiRfi2bNHYkuh4HuCKXpRcYh5RETu82oKFyubo
HbRrRKwyMG+i+Fm91lfMv+LFRIsvdJdzKuaFBgisJcPPdzUCOoKb8LXT1aENKuhT
dXifb8djdwTy3gyvl7TQjKlOCGu1nychJ6+iYX/kWVPDWc4CaM0bag+/6JqiGazm
rEmdBVByzpnBQTHQ4suO0SNxLoJZs43IwLaFM4puz+/XYGXm5R3dUrCmwJdXthCj
Cpfkb7ZxBscgpCDaov/jI6Mt2Zo5Dqxa04SYLWHSGt+yqRV/H44o1e2msNjU7Z6I
HSYbgicyeo3oLbMi44TAD42JiIRIkw==
=fsbN
-----END PGP SIGNATURE-----

--Sig_/pINKJaHHiIeFY9KtkAwQTF6--

