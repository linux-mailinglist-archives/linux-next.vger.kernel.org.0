Return-Path: <linux-next+bounces-2385-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936E08CC9DF
	for <lists+linux-next@lfdr.de>; Thu, 23 May 2024 01:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01AA1C21942
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 23:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BC0146D4D;
	Wed, 22 May 2024 23:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iS+Lz1A2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C052E631;
	Wed, 22 May 2024 23:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716421847; cv=none; b=R7k5bn7MiyXZxcMgJL4LDNX3x93qZhAockNcJU4mtL8wihn0foK0zgg9WHOR5cVXAilOVWVFQKDaUUN9pikGgYjF0B4CuD3djWg39HmZbQF8hrkYsXM7+XK45FjuZqHFTTLbZbVv7oavkfquLFfAqbb+es/iu9/0Dw9ZjiCuuow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716421847; c=relaxed/simple;
	bh=Q0ze4oFaxTqQNb1Hh12EqiHsY1+uPgjoaKkQxkPeKUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lR8idsbmvyDGozrBnbLFeChTR+pFzx5j2SA68leypAFl+/nAv2vn7zbv5yPHzqTRipsTXjy+oTdu5+0mm6XkXFOHq0AndYfzIET2j1/aGbZhuCZZydYxCDt4C0T2CJwj5B02VGkR3qM+ItgBiy4YOC+XQy2xUVSmVBmVwD89Vzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iS+Lz1A2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716421839;
	bh=31bpavRAvsErDL7HuZhdx+mTnsWylIri6VdoeO52Y5M=;
	h=Date:From:To:Cc:Subject:From;
	b=iS+Lz1A2Q0IGkM99e2/eGrGudGFs+gNrh4oDSdHSLnzsJ8utYrfUgDu0mIXaOBvyf
	 nrYiakjHBeo5O7oV9O6kl1oKMOJIhSRFVLjqSleB0vp9AeVB9ZHgZswIQIomT/zNcc
	 KJUjQ2U9BIHEDeTnOqr1ZPQ967hjirJaugfCv9x71ddIpI3mqF9UalN+1CZorGBpum
	 bpSf8Ra76RMyhRHLJTA+/0Z9SQkNZAA7kD9eDRCkxu4zklzwMhwflbvjNXGPzpqxw1
	 v8FRYH02Cxbyt7qfDZUwPI8R+sUOoG95ouZfjQfj9GMr39drPHLx8HgSQ34us0dK4e
	 zdzIoRhbdJYDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vl7NF30Slz4wc1;
	Thu, 23 May 2024 09:50:36 +1000 (AEST)
Date: Thu, 23 May 2024 09:50:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yu Kuai <yukuai3@huawei.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20240523095035.11a94157@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MYSUCo8Lgxu//nXPbWPHJqf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MYSUCo8Lgxu//nXPbWPHJqf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/blk-core.c

between commit:

  ac2b6f9dee8f ("bdev: move ->bd_has_subit_bio to ->__bd_flags")

from Linus' tree and commit:

  9a42891c35d5 ("block: fix lost bio for plug enabled bio based device")

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

diff --cc block/blk-core.c
index ea44b13af9af,dd29d5465af6..000000000000
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@@ -618,7 -619,9 +621,9 @@@ static void __submit_bio(struct bio *bi
  	if (unlikely(!blk_crypto_bio_prep(&bio)))
  		return;
 =20
+ 	blk_start_plug(&plug);
+=20
 -	if (!bio->bi_bdev->bd_has_submit_bio) {
 +	if (!bdev_test_flag(bio->bi_bdev, BD_HAS_SUBMIT_BIO)) {
  		blk_mq_submit_bio(bio);
  	} else if (likely(bio_queue_enter(bio) =3D=3D 0)) {
  		struct gendisk *disk =3D bio->bi_bdev->bd_disk;

--Sig_/MYSUCo8Lgxu//nXPbWPHJqf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZOhMsACgkQAVBC80lX
0GxNjgf/RTz0nSBSyji3aQYYunxXyxFHoiuMSJmf0/JX6zMCgZT7lULIW/BOVEiN
4GCKGh4wGbHW0WoamuqxoALppFGyiX9/+VafNYmglxuDap+0H6qURqH1xrwPy1an
wZE27ZwKfLjJ2m3BHl0kQrv07AcfaHoIkiu4iNdfqCr9JieUIQoP2X/mBU1+YkWK
tNvCiIlWeZSeMRomQzPHnzmSVLMmAep5G8Us1y6wKlfxxj5SwZmn80pYBRxdqJVC
lf1QuA/gnw/W39xdQMjVxwrPL+p6btz9h2kVaHJVf1zi/Xj7bY6ZIeHwy1cmvRNr
1Eepz4wwe1zBzzmTVie+18lkOarGZg==
=nnNX
-----END PGP SIGNATURE-----

--Sig_/MYSUCo8Lgxu//nXPbWPHJqf--

