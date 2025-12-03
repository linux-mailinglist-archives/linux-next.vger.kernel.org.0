Return-Path: <linux-next+bounces-9312-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B90F0C9D93E
	for <lists+linux-next@lfdr.de>; Wed, 03 Dec 2025 03:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3FDA3349A0B
	for <lists+linux-next@lfdr.de>; Wed,  3 Dec 2025 02:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9512E2C187;
	Wed,  3 Dec 2025 02:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RymtIIHI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C636D507;
	Wed,  3 Dec 2025 02:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729146; cv=none; b=adNlE+ftuNuE9C1kWgF9m1QVw0bPOrjjVVP6HhNvK8OoHWlUs+Eo6UsNKgcDcvtDYMm3jBiu0hw4WeiVbO1wHFENd/jiIV5Vqn4AqXPk7dqfMlnQjaZAgHnOJJ7ByaBwhuVT4ewFYnCmkFf2e7cAzLeyHWBrLGJUAeIYLc4sfDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729146; c=relaxed/simple;
	bh=noU5XoWFq5GlG17bcWJUVsy7s2N/ot7n09FamNau4i0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pp23/V3BJg2BNliDXGkiyvj7vl6gmJ9CfTnDG/EhNvJ6qTApYZRYtIUM6cEStR1AY4ZX2CTkgb0Tj62f9bXEk+fxNi3eDyRf65oPt4iieRbkr+VsQPoqFt6vYfjhIVLMe7DiO4zEADsPJbm5sfVb7on69HzWm49K6pMBqKgF+W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RymtIIHI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764729139;
	bh=kgot3L97Ba8uL1Tovsjflmvz8btXfsFI82hEe4GBu3I=;
	h=Date:From:To:Cc:Subject:From;
	b=RymtIIHI91u8GoeYbDgeFqUPcgM3sH83nsdh/ZwiClK3ELN9ahIGLREZX2aVD5PFV
	 NdOsJ5tY2pUtqZqhnFSvZUIbEAOVXXTj9pxRz6qODuDlqDP86O27tHJI5kLpbKXTpj
	 MGiieTlgyLnUtqfdzYVLQfoYMv6hhafXpTnp8AFHWicy2v0Mi1KyZS244GUwMoIVj1
	 AzBmmnsqDUShRCXrOhrYMyfxRkvU5Sk492rgkm7IXSBSsll1KVQAHe6dxeL+n3JD1z
	 d0d8XNzUGM6LJw3aZZw/uPMkTFil7hoMZs2rv9QRfkuZcz4wRrdklrbxfFq9p8+swG
	 3aoyUtcmcILBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dLhVq4Vvxz4wBD;
	Wed, 03 Dec 2025 13:32:19 +1100 (AEDT)
Date: Wed, 3 Dec 2025 13:32:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Frank Li <Frank.Li@nxp.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the regmap tree with the i3c tree
Message-ID: <20251203133217.5b99010a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NyXF+7WntIGyXX4AMneze91";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NyXF+7WntIGyXX4AMneze91
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the regmap tree got a conflict in:

  drivers/base/regmap/regmap-i3c.c

between commit:

  79c3ae7ada05 ("regmap: i3c: switch to use i3c_xfer from i3c_priv_xfer")

from the i3c tree and commit:

  af9c8092d842 ("regmap: i3c: Use ARRAY_SIZE()")

from the regmap tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/base/regmap/regmap-i3c.c
index 4482e64f26eb,6a0f6c826980..000000000000
--- a/drivers/base/regmap/regmap-i3c.c
+++ b/drivers/base/regmap/regmap-i3c.c
@@@ -18,7 -19,7 +19,7 @@@ static int regmap_i3c_write(void *conte
  		},
  	};
 =20
- 	return i3c_device_do_xfers(i3c, xfers, 1, I3C_SDR);
 -	return i3c_device_do_priv_xfers(i3c, xfers, ARRAY_SIZE(xfers));
++	return i3c_device_do_xfers(i3c, xfers, ARRAY_SIZE(xfers), I3C_SDR);
  }
 =20
  static int regmap_i3c_read(void *context,
@@@ -37,7 -38,7 +38,7 @@@
  	xfers[1].len =3D val_size;
  	xfers[1].data.in =3D val;
 =20
- 	return i3c_device_do_xfers(i3c, xfers, 2, I3C_SDR);
 -	return i3c_device_do_priv_xfers(i3c, xfers, ARRAY_SIZE(xfers));
++	return i3c_device_do_xfers(i3c, xfers, ARRAY_SIZE(xfers), I3C_SDR);
  }
 =20
  static const struct regmap_bus regmap_i3c =3D {

--Sig_/NyXF+7WntIGyXX4AMneze91
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkvoTEACgkQAVBC80lX
0GyW3ggAnNiBATtv4yIdR5LkyO1u69uUPw5T8Gdw2QVI8QSw/j9MUpg+HVVDwoT9
6TEgvp/xqYhA/3gVODy+2X6PpjgSNQfVvdE7AIgBa4CbyDWHVPnG3tzT/ZmkBP7Z
oKSllWJqTtm77wVddfks+PQ3vdH9v3ppLufLpuxm78SJ51IN9tzrgUjuwm9qcUXy
yQfeyfYHPTosEG3mJ3wLDDgwJvz/IbJzNQ89qAOXiwTuj3MfRAeOB5qVH5V9qZt4
iaxQ3ykbJ4Cdy1DLtKTPmAcaQeDXX0CYfMhu2bGffFhOJhDI81eTdRaPftGffuWE
lZ41ltmjA7Ooe3uW29SSi+NM/14i2A==
=rSWc
-----END PGP SIGNATURE-----

--Sig_/NyXF+7WntIGyXX4AMneze91--

