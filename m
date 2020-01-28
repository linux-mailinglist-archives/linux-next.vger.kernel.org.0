Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0A1B14AD66
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 02:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgA1BCZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 20:02:25 -0500
Received: from ozlabs.org ([203.11.71.1]:34687 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbgA1BCZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 20:02:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4867cr75J5z9sP3;
        Tue, 28 Jan 2020 12:02:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580173342;
        bh=Wkr8ksztdFnzpNY0uZjxXq/vQG8DOZMe0OVzHE236G8=;
        h=Date:From:To:Cc:Subject:From;
        b=GZzeSHPW5c1t/GMK2/diXN8HcGNe0cf6+Kvw898RyR3gYJA3B9RqXMEQcgIMQW2Ld
         SVrFoJ9zt3QqLCQDORfEmcvc8Qv6r3boQuxTxQaMQb6IFGBIywrmdMciCpo6KZolcz
         kGPB1SA4Ll6V1amB8olWqY58ZvJmhvPO97Uf5QmjmfUsI4og9xol4bZW7MyvmS7YdR
         KOFTXPueBfOmRovU0tWur+InfV3VFf6TT6InmYxOqEMtzLL9zsVpFJ1UCGIszrzyFK
         xt9m75/BLh8bBzN0HjoLnM5GtHNEUqUa9bNnDfJKDdpgnm+i6uau+7QrbSPLw3H2Q9
         RlF5RHIbrc1Tg==
Date:   Tue, 28 Jan 2020 12:02:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Axel Lin <axel.lin@ingics.com>
Subject: linux-next: manual merge of the mfd tree with the regulator-fixes
 tree
Message-ID: <20200128120220.53494c29@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uEAyqUdHDuR2=EIxfTmmBgw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uEAyqUdHDuR2=EIxfTmmBgw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/regulator/bd718x7-regulator.c

between commit:

  b389ceae4a8f ("regulator: bd718x7: Simplify the code by removing struct b=
d718xx_pmic_inits")

from the regulator-fixes tree and commit:

  1b1c26b24a6e ("mfd: Rohm PMICs: Use platform_device_id to match MFD sub-d=
evices")

from the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/regulator/bd718x7-regulator.c
index 8f9b2d8eaf10,55decb58c777..000000000000
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@@ -1146,10 -1078,20 +1073,11 @@@ static int bd718xx_probe(struct platfor
  {
  	struct bd718xx *mfd;
  	struct regulator_config config =3D { 0 };
 -	struct bd718xx_pmic_inits pmic_regulators[ROHM_CHIP_TYPE_AMOUNT] =3D {
 -		[ROHM_CHIP_TYPE_BD71837] =3D {
 -			.r_datas =3D bd71837_regulators,
 -			.r_amount =3D ARRAY_SIZE(bd71837_regulators),
 -		},
 -		[ROHM_CHIP_TYPE_BD71847] =3D {
 -			.r_datas =3D bd71847_regulators,
 -			.r_amount =3D ARRAY_SIZE(bd71847_regulators),
 -		},
 -	};
 -
  	int i, j, err;
  	bool use_snvs;
 +	const struct bd718xx_regulator_data *reg_data;
 +	unsigned int num_reg_data;
+ 	enum rohm_chip_type chip =3D platform_get_device_id(pdev)->driver_data;
 =20
  	mfd =3D dev_get_drvdata(pdev->dev.parent);
  	if (!mfd) {
@@@ -1158,16 -1100,8 +1086,16 @@@
  		goto err;
  	}
 =20
- 	switch (mfd->chip.chip_type) {
 -	if (chip >=3D ROHM_CHIP_TYPE_AMOUNT || chip < 0 ||
 -	    !pmic_regulators[chip].r_datas) {
++	switch (chip) {
 +	case ROHM_CHIP_TYPE_BD71837:
 +		reg_data =3D bd71837_regulators;
 +		num_reg_data =3D ARRAY_SIZE(bd71837_regulators);
 +		break;
 +	case ROHM_CHIP_TYPE_BD71847:
 +		reg_data =3D bd71847_regulators;
 +		num_reg_data =3D ARRAY_SIZE(bd71847_regulators);
 +		break;
 +	default:
  		dev_err(&pdev->dev, "Unsupported chip type\n");
  		err =3D -EINVAL;
  		goto err;

--Sig_/uEAyqUdHDuR2=EIxfTmmBgw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4viBwACgkQAVBC80lX
0GwnAQf+MScNX4DXx7hNGB8XwpLtDOAo+3EBttQeTy+bTa3ZptIx5Rw4Jo8w0ap/
SBSN7zxW9NRtgqTDUqT4cX+STwAojxOiD0VxDB+yT46jLSbE2P3/7DVcWSgB6KrI
G5nQsd3R42g0b41TzsF1/r/OcXcLU3EYUukuxa3ny9aZsKbYzCJXogf3jVdhuAIY
70uFJPP8T0BGWZuPHLo05ZzN9BUr8Ph8vBjMdMYRV9WEjPThiTq1dgbC6zpF9AAm
quqRXvKshSJxzWvbNIeBCDDTPxNcxHAxwUfKRDP49P1toIYNwLFdZKYC17xPkYoj
KbLS8JG1i8aQYUbCsHPThpy0xzQYGQ==
=oWFg
-----END PGP SIGNATURE-----

--Sig_/uEAyqUdHDuR2=EIxfTmmBgw--
