Return-Path: <linux-next+bounces-2520-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE55690492B
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 04:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29181F24878
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 02:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B91ECA7D;
	Wed, 12 Jun 2024 02:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LWGrLywr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E17C122;
	Wed, 12 Jun 2024 02:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718160272; cv=none; b=J9fDJWj7quZaMdwbjqS/cJz8NodKNbJV7ETOlFIFa3/gNfXVLjuyy2N20uWIw9doRXXEjO3uO7AmxsRbzjSlNMahvjCjN4o+J3b0grDDw2fP8xl/y4osUchrsdU/ZClNGz3axuAJ1qUQUnTspmnREumDfpC8HBF4S3WT27ORuAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718160272; c=relaxed/simple;
	bh=BE5Y9Qo5Eyxv2m3y0eALTspWX6n8dh5oWhlO+vbvdHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R4xkNH4tpv1K1i8uAAldZfjrMaR6QVSE8YAhy6xSNM5Y0DEgDXnvIDTW0ezwWRgbSh08MR7497WqDf6GTbmauMXcMvWABAWoq+osYDGT2+rDbsOhfd5zwrjdoT+Ez67sapCAaeylplG+CYkY08MZKYpS0SXb4IN3p+XSuRPLbYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LWGrLywr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718159802;
	bh=avg0iBHIDOS3x7PvuRSF0DrowyNVDLUAoBUaDVo+mOc=;
	h=Date:From:To:Cc:Subject:From;
	b=LWGrLywrcFTTXgXdkZgCAm6p+caTvNIpUPEASXmV5597KhRitw7YeETxiCwdV5LHo
	 EuEHSiy3JZOUccuSH4GfUrK/EKMYb6U02fgZJ4TW2RIu7BLPL524e4FTmG9jMKJ6SG
	 zs3/393A/Fz9rlae3cyITSjkWkaDxHvLKW7l9L7EMTowautNqveu5aMcVYe7rYakEr
	 4/hFKe4vF6nl/66x5ED+6OmwPZPi7GXaw7xFcwvi8bJ0k3h/IYzneeGdjMhpk8Bpvp
	 3OuZnvEGNIOqBz3f0cBLciKYJqHdyTAF/EUsQac+82a9c62zkV/KzAHlRWxN6PjOtL
	 Bp7FQXVPk/1ig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VzV6d5hLgz4wb2;
	Wed, 12 Jun 2024 12:36:41 +1000 (AEST)
Date: Wed, 12 Jun 2024 12:36:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>
Subject: linux-next: manual merge of the driver-core tree with the mm tree
Message-ID: <20240612123640.68ae0310@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NXGv7YrK=2nxl_57utSjCDV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NXGv7YrK=2nxl_57utSjCDV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/fsi/fsi-occ.c

between commit:

  2d2bf1e680a9 ("fsi: occ: remove usage of the deprecated ida_simple_xx() A=
PI")

from the mm-nonmm-unstable branch of the mm tree and commit:

  29f102dbb11f ("fsi: occ: Convert to platform remove callback returning vo=
id")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/fsi/fsi-occ.c
index f7157c1d77d8,21d2666c4195..000000000000
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@@ -718,9 -719,7 +718,7 @@@ static void occ_remove(struct platform_
  	else
  		device_for_each_child(&pdev->dev, NULL, occ_unregister_of_child);
 =20
 -	ida_simple_remove(&occ_ida, occ->idx);
 +	ida_free(&occ_ida, occ->idx);
-=20
- 	return 0;
  }
 =20
  static const struct of_device_id occ_match[] =3D {

--Sig_/NXGv7YrK=2nxl_57utSjCDV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZpCbgACgkQAVBC80lX
0GxVHQgAogcMO90jU47ZoQmSJulLfzunOkza2dlL3ZHjbJO3e2SO1LeKswN19IHb
sbAAIcpb6ZB86vDf+exLjkXmz5s+eZi38mntFWivvLvqAqdrl1hZOFoZvTDc7dpQ
KRuTedv+mclaDxfxH/8wY9Z3andvEWQa9MmBhHpGpEKcrdhWVGegm9ts+1McFfL5
niC2i2/8nO1AHFto3m90ErEdtpSm2tHUgJK5owNLZaJWDmhIkjEH4O/V23j7oWgi
x0TiaW4KJIKrRCP+U2iJT0cQB9khEUgjlZdYtLKDDOR/0KWDI5Exu+5e2Mw93Wjy
c+xsQSt9un3ZQJxuWw324GQuxQsr3A==
=LhxS
-----END PGP SIGNATURE-----

--Sig_/NXGv7YrK=2nxl_57utSjCDV--

