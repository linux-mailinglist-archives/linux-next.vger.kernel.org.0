Return-Path: <linux-next+bounces-3719-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C00972757
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 04:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B31928589F
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 02:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE2A1422CA;
	Tue, 10 Sep 2024 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e5qjOxaZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E204D8B7;
	Tue, 10 Sep 2024 02:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725936671; cv=none; b=g67j01xi1QCKdtWm8mvo4qqr6mDIBNrZtG4xNDPUZvvgjFjmxf7tMKTqYc/wb/1SfsXxTU4oLdrAthw5MODDVc5TXYcxBLsh1c2ZcrCy3ehOzGpOSLIFLS3TsHbnUU+BAjtDz0hq3zglh/aBnnM1Kft16dQPn/N/vOfDwIih6N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725936671; c=relaxed/simple;
	bh=gvLncmditIpK3W9r0yMaIgEbbTOZ1PiL7Ur115zxZ9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MJFTew12QVWVZ/ZbusqGLDH6GSXIkBtaA1kOIIdLCis04jTBs/+7fm5JvIImcrReB2bBEFfy9PyOrrnKyWvhRANZvKk8s7MxCp5kPZ6gDaVHNItQpjzDivQCCNN+RgsXItOl0zqhk7w3k9pQaN6tMaiMgBr3PZm6jqT/ElIemIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e5qjOxaZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725936663;
	bh=IscIEgspsB3jf10GurHepsJMCT3GuysT+pZDGM2xNlQ=;
	h=Date:From:To:Cc:Subject:From;
	b=e5qjOxaZqrWTHIPmZGVuQ0TJyd87kAFNGsYSg6/V3e3P6vncBmSYkPrsWYBEmo1Av
	 64G3+4MW6MUbtIfmrHHOhZda9z9lRMhK0z3YRFzg8zPsmIjvxGFe/imoWzOEcEv76m
	 UX9g+WDDBcKqXvxLQg+s5yrrG2EDMHDKCuZLzYmISSCWIrvUpbcpvsHeflFqw48lsZ
	 k7iN1WlrrG0zlpBEdkg5r9L2NdsJ+VlrtJFXz6SDhaaIyIe1WjRqD8qwyRrxyyNjhF
	 /9fXF0o5sThe4tFMbRsYyT9jXikgDlX4JNhpdcGHEkzpFWpI0nFLVyTDhikybsrXsN
	 cnpW+i6wEmCWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2p9f2Sgcz4wbr;
	Tue, 10 Sep 2024 12:51:02 +1000 (AEST)
Date: Tue, 10 Sep 2024 12:51:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chris Morgan
 <macromorgan@hotmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the regulator tree with the mfd tree
Message-ID: <20240910125101.4057d8f7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dwD.PpaGPIHu.SQfcUfXOKY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dwD.PpaGPIHu.SQfcUfXOKY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the regulator tree got conflicts in:

  drivers/mfd/axp20x.c
  include/linux/mfd/axp20x.h

between commit:

  2e1a57d5b0ad ("mfd: axp20x: Add ADC, BAT, and USB cells for AXP717")

from the mfd tree and commit:

  bb2ac59f8205 ("mfd: axp20x: AXP717: Add support for boost regulator")

from the regulator tree.

The latter change to  include/linux/mfd/axp20x.h is a subset of the
former change.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/mfd/axp20x.c
index 4051551757f2,16950c3206d7..000000000000
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@@ -209,15 -209,11 +209,17 @@@ static const struct regmap_access_tabl
  };
 =20
  static const struct regmap_range axp717_writeable_ranges[] =3D {
 +	regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
 +	regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
+ 	regmap_reg_range(AXP717_MODULE_EN_CONTROL_2, AXP717_MODULE_EN_CONTROL_2),
+ 	regmap_reg_range(AXP717_BOOST_CONTROL, AXP717_BOOST_CONTROL),
 +	regmap_reg_range(AXP717_VSYS_V_POWEROFF, AXP717_VSYS_V_POWEROFF),
  	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
  	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
 +	regmap_reg_range(AXP717_ICC_CHG_SET, AXP717_CV_CHG_SET),
  	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
 +	regmap_reg_range(AXP717_ADC_CH_EN_CONTROL, AXP717_ADC_CH_EN_CONTROL),
 +	regmap_reg_range(AXP717_ADC_DATA_SEL, AXP717_ADC_DATA_SEL),
  };
 =20
  static const struct regmap_range axp717_volatile_ranges[] =3D {

--Sig_/dwD.PpaGPIHu.SQfcUfXOKY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbftBUACgkQAVBC80lX
0Gxx0gf/SlBy++bsbAhD0HL8Azlfyz4pCRWkbj5t5pl9xqTk8punyuHYrOEfCfDn
liO9wbts0csciXq7mU1hdXTU1xfY3rvNBNbh2KeQV3eQj9cWS/mRIbFBR5Wh6rJc
c+dvatZI7JuWg4I8sOx1XYTi98TKjAtrJsCeHYte5cM7RJCTzgLAROChm9Klw0Q5
5zp0FN29Q8ohUtWzcgwk8Q3qMcRWts4RMqKPh+FjxEO35cj/e6FjWD3VIzL9nKcx
o41K1NP/j7JHYsV3dveOi3ySgRkH/BkJdLU1Uzl0zJsmkVrNfWFANM9cB9n34w5a
QJgza1AjhHCnCcQcEmP5fv5AL73MmQ==
=Ij6+
-----END PGP SIGNATURE-----

--Sig_/dwD.PpaGPIHu.SQfcUfXOKY--

