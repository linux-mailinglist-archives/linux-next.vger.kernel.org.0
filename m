Return-Path: <linux-next+bounces-5103-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1939AA06A69
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 02:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8D91664C3
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 01:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF1BBE5E;
	Thu,  9 Jan 2025 01:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Mf0YiBR3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853728837;
	Thu,  9 Jan 2025 01:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736387186; cv=none; b=htNyt9DoMly1ztjBp3FgWsjXcUziLslD6nTYg3nIGQXODIIxk5c+xhvANZEqQOzmmDN/fMiHTK6Xk9RjTPFsRdTyjOgS3huHXzZngmkOmHWBjWB5vhrE+emI5XWb+vED+yORPA1WHaNwNP0zdwxINAy1C+9quQENB5jwKa1xH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736387186; c=relaxed/simple;
	bh=AUSpJ44G4OimdTY4rS5w3bxc0Q9fKfjrXSzDvcDXIgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HE0d6B14amVEspLujnt0FAlJSr06StgwZS4CErO7eJPXnU+xPqWqifrzyzgdAhZl9DDVXXQFDXZea7tDzNcs+cbO5k8RofxLQ0IvB8Qa+lQslNoUipGnr/R9ofcpk5Y+QANxs3F3pnvlDjURADuWyoRwSY/ctnvAIvT602QgrQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Mf0YiBR3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736387172;
	bh=HxIT1hWXSmnB9DSX8HSpK7uomHTJBfi+8NdQm8eba/0=;
	h=Date:From:To:Cc:Subject:From;
	b=Mf0YiBR3t3fEc33CVzDuq9hAb+Sp+/9JYHKLINXRmX+7u5h7lmlUXlFpyW2CNXUCO
	 XqIDPAl9PlNVZjoH1C8jdEmcgX6BZL73qj5yzduHWDSx5iU14Tj/gNus5yGWv4EKiX
	 4Jq7Rqzv0s5p3KhONNJ/Z2ES7OFf3DKv42QAWJ5PToyPlGP+fqcuVAAS/8Ci3tJv5E
	 /2ip8zi4UOZCsiBwDv3Ve2Q/doWVLONkm5NPCl7zOm+jPnup4HGQJqToOLykG2ratK
	 XZOxeQCevCyBJvFNQgN0tR/8TJAOluq/go+YoLhCn7c5j6orCQSryasDUOoxuYXP4y
	 O/WO5yPoZ5YtQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YT70z4tMcz4wby;
	Thu,  9 Jan 2025 12:46:11 +1100 (AEDT)
Date: Thu, 9 Jan 2025 12:46:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: John Garry <john.g.garry@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Milan
 Broz <gmazyland@gmail.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20250109124617.1b4ff0b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pfCEm5=ZbGbsEclO1C1yOEB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pfCEm5=ZbGbsEclO1C1yOEB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/md/dm-verity-fec.c

between commit:

  6df90c02bae4 ("dm-verity FEC: Fix RS FEC repair for roots unaligned to bl=
ock size (take 2)")

from Linus' tree and commit:

  5c292ac6e69f ("block: Delete bio_prio()")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/md/dm-verity-fec.c
index e61855da6461,b0ee199009fc..000000000000
--- a/drivers/md/dm-verity-fec.c
+++ b/drivers/md/dm-verity-fec.c
@@@ -121,8 -132,7 +121,8 @@@ static int fec_decode_bufs(struct dm_ve
  	u8 *par, *block;
  	struct bio *bio =3D dm_bio_from_per_bio_data(io, v->ti->per_io_data_size=
);
 =20
 -	par =3D fec_read_parity(v, rsb, block_offset, &offset, &buf, bio->bi_iop=
rio);
 +	par =3D fec_read_parity(v, rsb, block_offset, &offset,
- 			      par_buf_offset, &buf, bio_prio(bio));
++			      par_buf_offset, &buf, bio->bi_ioprio);
  	if (IS_ERR(par))
  		return PTR_ERR(par);
 =20
@@@ -163,8 -160,7 +163,8 @@@
  		if (offset >=3D v->fec->io_size) {
  			dm_bufio_release(buf);
 =20
 -			par =3D fec_read_parity(v, rsb, block_offset, &offset, &buf, bio->bi_i=
oprio);
 +			par =3D fec_read_parity(v, rsb, block_offset, &offset,
- 					      par_buf_offset, &buf, bio_prio(bio));
++					      par_buf_offset, &buf, bio->bi_ioprio);
  			if (IS_ERR(par))
  				return PTR_ERR(par);
  		}

--Sig_/pfCEm5=ZbGbsEclO1C1yOEB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/KmkACgkQAVBC80lX
0GweZAf+KNdXqaUbWcys/s7MK9jI3tZ0FLYBmmoaK/xmIVtrPYaXK2HsyGXQXt2i
uEW9AaFVfBYrgU6HPpCYxvT4wBEP9hp6gESKE8bVO0HoIojkEOL7QzJfir4hYWGA
7uje6wy7IZrZoBoO6GHy6OqT2MoB5RMsPN+RpJHwzPU1nGaxSesMJmE4isE/1gx4
e7ujyA64LwyS20tG+owGIzCY4cnhHyP0BYtH/hZoq+29JJPwnFAAjPtrJAamJTBU
IYt4SaGWfNwJQejS8A6B0KQaizHB6hCyvFcG8LKlEE0oEG7FNi1/AQjIKDz1BCR7
OH77Dzh8xH8Zmkd52Jy9hqdbzPCYvA==
=4g3j
-----END PGP SIGNATURE-----

--Sig_/pfCEm5=ZbGbsEclO1C1yOEB--

