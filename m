Return-Path: <linux-next+bounces-2215-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E518BF3BB
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 02:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A59691C232D1
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 00:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C95399;
	Wed,  8 May 2024 00:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I+MJGh92"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31853387;
	Wed,  8 May 2024 00:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715128485; cv=none; b=Glity5KoDc+nFD4LiHt21uV3dyTZqTxw2OB+lffgHeafTfxN/S3EcQJYevIG2cztUX3E3rTvM3I27fnNhPSxot+iCeOBNpGmW55qd4KhHqeEGRZbBuM5FW6Klu+/Yfk8C2To7o7VIyqzCRGhs5EpdIQGLrc/Kf5mpKMuQtXn5ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715128485; c=relaxed/simple;
	bh=DkKeUnboAHqb/Jet1FGm7L4z0eOPNgYxnvewhiK5kkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bWV7G8kOTdgnkWuirrc08Uchq7R68ZHi4GHftnbQO1tQzDN0wZafkl+gSuCrUdU3wxLiYqsfpKNAnmXFzBdjtMwhycAPklWsEHcIzQqnINYxI0rA9nY7KyEWrZGGAyaZGTJXO/p4GX3q9+zbH8oMghSE+hg+zcREZm/q0SWa6vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I+MJGh92; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715128479;
	bh=RyQGYljSWMAe9xi+R6OxFlFM37o0P0Z9Ke1ZuQqhF5M=;
	h=Date:From:To:Cc:Subject:From;
	b=I+MJGh92FkhJ4OFZGdXrsBTHDkv+9ZxBHYNdHvt37z4Ihd9tNMwbl+XO2lysbZI9k
	 8YNb2UqF8C/N/BkIAJBEhhgCSRTS0gvAo7J6p/Tok/fsiQlL2wEflQgc2bSMR1Qieo
	 R8vyMVb1Z0jdFCqxaX2t+njlhmz2hlutUW+1AynPu7KbBbPKMO3aSjKibzuLXHWhBX
	 Cbw5zyOZBTRXcYNd45B5x+C6Qa49p4D9TiwRt6QCelpNd3eBJsRQPOt7vVPA9P0+tR
	 G9iRjqv5w5y9xBzZNvXMYUdh/IzZvrq2+73JTHC+/48xf/jDsXTHXG2FlPhZIT6FYx
	 sTQK3zytP6BEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYx3z1dMVz4wcF;
	Wed,  8 May 2024 10:34:39 +1000 (AEST)
Date: Wed, 8 May 2024 10:34:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext4 tree
Message-ID: <20240508103436.589bb440@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z6QW1W_rd/rhI.BiE15ht.j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z6QW1W_rd/rhI.BiE15ht.j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/ext4/file.c

between commit:

  a0c7cce824a5 ("ext4: set FMODE_CAN_ODIRECT instead of a dummy direct_IO m=
ethod")

from the ext4 tree and commit:

  210a03c9d51a ("fs: claw back a few FMODE_* bits")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ext4/file.c
index 77529c655f95,28c51b0cc4db..000000000000
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@@ -884,8 -885,7 +884,7 @@@ static int ext4_file_open(struct inode=20
  			return ret;
  	}
 =20
- 	filp->f_mode |=3D FMODE_NOWAIT | FMODE_BUF_RASYNC |
- 			FMODE_DIO_PARALLEL_WRITE | FMODE_CAN_ODIRECT;
 -	filp->f_mode |=3D FMODE_NOWAIT;
++	filp->f_mode |=3D FMODE_NOWAIT | FMODE_CAN_ODIRECT;
  	return dquot_file_open(inode, filp);
  }
 =20

--Sig_/z6QW1W_rd/rhI.BiE15ht.j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY6yJwACgkQAVBC80lX
0GyDZQf/TS0djE5HDw+uGXN7PsX7EJSoe8QFKVc5p5fAcv43Hiv5JsDwB/IrDuAY
OVa7N/aIrM4ZYZMsAwkVyYZfQkCTS6BxEs/xnICoE6+xbrttFlcedCNclJ5/7b4x
BtQm+YRNTTD7jDDweT2tUVq173dhAX7kIAAeWCUwlYVw1l8u4RIISPqGyd7Lw5Hz
sWsgBRgFNUJr93OcTl5mRsVe5kypTH1ZeDh+GJAMq60+9RYAqicD9VQ8h4R1CIu/
2l94FBnpsUtCerqkbxztS+6LoxUvYrahFMN5dnOpPC8eoNefafFa0yatA9DbeJKs
OCB2EQqkwgUYpvbNTFyBlYxxjQGCyA==
=9tMw
-----END PGP SIGNATURE-----

--Sig_/z6QW1W_rd/rhI.BiE15ht.j--

