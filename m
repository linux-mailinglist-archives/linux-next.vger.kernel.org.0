Return-Path: <linux-next+bounces-2713-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA65491C6D2
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 21:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28B491C23D09
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 19:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576257347F;
	Fri, 28 Jun 2024 19:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJtwbgav"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303BC4CB37;
	Fri, 28 Jun 2024 19:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719604014; cv=none; b=e/z2KMN/w4Sw++SMm2YxaPOEPezcXNEW0ubME3QSE+gD4FjVab3ROhYxTlyxaMz2/jy0/90ohiPaHJAWkNvQOy038TdTohcqt79lMjnrHU7x0Gur83MHL+MQ94x2zQYw/c9Dkv9oXTJ/UQZ09jUqvNLrr702rTPUIFBWqsjA8Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719604014; c=relaxed/simple;
	bh=+syI8ijwYmrqQlbVFajTNcRb+OqZfCEeB1u14NJ78G0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F4QdGezTMtV7Kds5xj0eZzpU75B9GT5U+xksYZ7oBGMuBNgEu4EvdcjD2NpkQ1sl2a7H7bAQ1I1wfMOcvOR+U57vlIjFgZMJS+9gZdCQ3wxsNsW/+h9s9UJzX2l/OMLgPTZpIfIMsnZEANsCYlaQu+FfsENIBX0WaVt+pQ7XojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJtwbgav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08962C116B1;
	Fri, 28 Jun 2024 19:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719604013;
	bh=+syI8ijwYmrqQlbVFajTNcRb+OqZfCEeB1u14NJ78G0=;
	h=Date:From:To:Cc:Subject:From;
	b=TJtwbgav4SWb7bu/RMe6DsFxBShaD+RtKQsvT/1Zv3vRpvCITmquL4Uo6L1LHbgnK
	 YTNAZeaWzFS1RrerAE7NSxVq9iZeU/GWLYWe0iskMq+NRexMNresNSW+26HXm0yMpt
	 /18yVY3+dz8Jw+GiwPo4rXsYIixFwgE6WZKh9DBZH5giYQOydg1TAmQAzYCWgxC3i1
	 l8WAUpZfg6R1YwnIIy6ljw7QjQCCWnys3lc9ImW/o7Ael512kmxtFakjYNWDZXMXgq
	 K1R0VNZWSYuX4vK7eN/JV9fRvORUqAbr/+6pKdyvJmyP+eYfT1GJuo5B97hHQuSexp
	 uLcXHAd1Sw9/g==
Date: Fri, 28 Jun 2024 20:46:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <Zn8TKYDCOCtbbNH8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f/G9OlavzYhgk78r"
Content-Disposition: inline


--f/G9OlavzYhgk78r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree and then some other trees which seem to have
allowed the driver to be built much later in the merge process today's
linux-next build (x86_64 allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: error: initialization o=
f 'void (*)(struct platform_device *)' from incompatible pointer type 'int =
(*)(struct platform_device *)' [-Werror=3Dincompatible-pointer-types]
 1212 |         .remove =3D lvds_remove,
      |                   ^~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: note: (near initializat=
ion for 'lvds_platform_driver.<anonymous>.remove')

Caused by commit

  6597efcfc53585d5 ("drm/stm: Allow build with COMPILE_TEST=3Dy")

interacting with

  aca1cbc1c9860e39 ("drm/stm: lvds: add new STM32 LVDS Display Interface Tr=
ansmitter driver")
  0edb555a65d1ef04 ("platform: Make platform_driver::remove() return void")

I have applied the below fixup patch.

=46rom 59a5e11f41e93512ca1a5aed36c1c396d175797d Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Fri, 28 Jun 2024 20:45:16 +0100
Subject: [PATCH] drm: Fix up STM LVDS driver for void remove() conversion

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/stm/lvds.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index bfc8cb13fbc5c..2fa2c81784e97 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -1186,15 +1186,13 @@ static int lvds_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int lvds_remove(struct platform_device *pdev)
+static void lvds_remove(struct platform_device *pdev)
 {
 	struct stm_lvds *lvds =3D platform_get_drvdata(pdev);
=20
 	lvds_pixel_clk_unregister(lvds);
=20
 	drm_bridge_remove(&lvds->lvds_bridge);
-
-	return 0;
 }
=20
 static const struct of_device_id lvds_dt_ids[] =3D {
--=20
2.39.2


--f/G9OlavzYhgk78r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ/EygACgkQJNaLcl1U
h9Dg9Af/YMVO1Lly6BdV05v0ivZ1USdvVJBnKSsyw9PjNdv2EJxmwZaeRdzaknnk
8pfPTCR4STWZVhgzHaoKGwdOJotO2W7rGEsKSbx6N2ivLoUjqHOZQ6Nb7FZXj5v9
O+P5EXUIQlaUY3LdFMh/4GI6suqI2E4WL6TXPZdjIerow3J9+vAQhfce7NqkwHFM
Bo7PXw81tCTWP34zHOhyHDDoMsDDcxZwkrMbT02b/GHHNGM+h5sEbNo+dmibElEO
DgEetM1K14MaT47S5PuHYpp7GSA9PTEcjJnLhRzOtVd9clybG4BQ9LkcuNQu+9iH
G/kjrvP0p22zNpg/KNneN+Li6aZa/A==
=CEG2
-----END PGP SIGNATURE-----

--f/G9OlavzYhgk78r--

