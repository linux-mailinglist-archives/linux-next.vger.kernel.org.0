Return-Path: <linux-next+bounces-7616-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF2EB09AD1
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 07:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FC6EA62F11
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 05:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59AD191F9C;
	Fri, 18 Jul 2025 05:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F/lk0bTH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F33214;
	Fri, 18 Jul 2025 05:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752815453; cv=none; b=Mx0KEZPLHHyHJKVjlerBaPlWoWL+oXAhAzA90s3p3DlkCz0lUX8v4Mx6f3f8Mzr8uEOroMXep0PVyfU2iw5ndMX7jiYTtNl5zdrjDUNdKhXoHwgAVBVGnFeySQQbhv/WfaK58lD89sAHHPui5xRl0D/XHoLqOo3anTFkVD/LhN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752815453; c=relaxed/simple;
	bh=Lq6bWs6NfRIiGzft0XbUnv7RXtn094GFczL72QtTlfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VPdMZoZiNYAFKpGPlb5JT2EbbhUFV67pVzCTnL6jO8rejOywlq5ywMDwp42V5f8VLqsND31b9BHiEKyVkFKCGeJW9DhMCZdoktitTkngv8wFBV8v9GH4aemWzDaNntn+/Id4HL/GQ6wZtUvILr71gNRBKYP2zGbsBTQDOkVDqEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F/lk0bTH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752815318;
	bh=uhMoIxthROCfsQYdhmhsp8AY6lURuqWwGJI3Qxk8cto=;
	h=Date:From:To:Cc:Subject:From;
	b=F/lk0bTHSF8Bt/XF+40hV62TpZZsK7XX0KBvl6eK/S8blWQqO5bFai2RO0xw7jxHV
	 aPqA+lbnD92uL9RMha/jUBpqfZoIM0yg0xodW+8rzPCf5DBKRZt0ZUDds9im9G2235
	 r63432ZmhPJ0AHjUyiYOTxb9gXYABfRTmiEfCMOS70dc3Og6I4/zaOy45ARp8yASc2
	 IW+CYDqFcVZfj23m1q1GzNm5hXNuC2+srEXIHg4yDHUewk9MqY0PeU0FQVhYBQr/Uj
	 Sxgbjp+Jmyyo89ICoHrKSg0Txhs8NsaLaW9vYYPs7KZ1tAb8Ffg6qnM10cGyDMYssQ
	 Io8dj2FsScO4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjyVr6xZ2z4xQN;
	Fri, 18 Jul 2025 15:08:36 +1000 (AEST)
Date: Fri, 18 Jul 2025 15:10:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Jens Axboe <axboe@kernel.dk>
Cc: John Garry <john.g.garry@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mikulas Patocka <mpatocka@redhat.com>
Subject: linux-next: manual merge of the device-mapper tree with the block
 tree
Message-ID: <20250718151045.2c5bfe6b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ljEIkPYUnwwUbre0XtW+0Gu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ljEIkPYUnwwUbre0XtW+0Gu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the device-mapper tree got a conflict in:

  drivers/md/dm-stripe.c

between commit:

  5fb9d4341b78 ("dm-stripe: limit chunk_sectors to the stripe size")

from the block tree and commit:

  846e9e999dd3 ("dm-stripe: fix a possible integer overflow")

from the device-mapper tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/md/dm-stripe.c
index 58902091bf79,984f53a42bf0..000000000000
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@@ -456,11 -456,13 +456,14 @@@ static void stripe_io_hints(struct dm_t
  			    struct queue_limits *limits)
  {
  	struct stripe_c *sc =3D ti->private;
- 	unsigned int chunk_size =3D sc->chunk_size << SECTOR_SHIFT;
+ 	unsigned int io_min, io_opt;
 =20
- 	limits->chunk_sectors =3D sc->chunk_size;
- 	limits->io_min =3D chunk_size;
- 	limits->io_opt =3D chunk_size * sc->stripes;
+ 	if (!check_shl_overflow(sc->chunk_size, SECTOR_SHIFT, &io_min) &&
+ 	    !check_mul_overflow(io_min, sc->stripes, &io_opt)) {
++		limits->chunk_sectors =3D sc->chunk_size;
+ 		limits->io_min =3D io_min;
+ 		limits->io_opt =3D io_opt;
+ 	}
  }
 =20
  static struct target_type stripe_target =3D {

--Sig_/ljEIkPYUnwwUbre0XtW+0Gu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh511UACgkQAVBC80lX
0GzGVwgAoabygGos2sK4D0arZytQnZpenZJ72/lh18FMfbJtH9UQR7mbmMdXPI6b
YflF4Sm86N/Vkjv4VQ5eTk2bYb0AhU7sLavYPqkGWja9A6f5S7csHD/weQLOdBf5
aWY8THNZfwUQ3kXdQTgVCCZkDj+XK7i98VcWBpekzDwEsVmJ/IfBAhj3Ve+7KXdX
ziEbKxTNnhA4Cj8mfuXdwM3/Zx7TxNNNuLa0prBHCAZLQyXzQD58SeziZGcAd7kv
YGAR49MAHcFfnatR6ylUGOGu+EQdVy5nBxVNqFdY5gqDF5ABA8bOkQG4WeT3faYO
iExKqTDsEii/eEsKucCP9neeKR9Fwg==
=gQFa
-----END PGP SIGNATURE-----

--Sig_/ljEIkPYUnwwUbre0XtW+0Gu--

