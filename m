Return-Path: <linux-next+bounces-2217-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F48BF4D0
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 05:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E5671C2218A
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 03:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF85125AE;
	Wed,  8 May 2024 03:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="je+VPU1P"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC814A83;
	Wed,  8 May 2024 03:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715137335; cv=none; b=bzuebSlu5f0MEuRu3/ujUR81UCf9kD0Lu2Go4KMeUfce8TcnkGcnJ0bytcv9OchFPpqy4YRMKLW2TFHIP8O9pOz6NIC1YKW+4a33KznDAw238eM1JAd2iNoMk43CN1lu200IMawLZ1CzHVPAXpffMh5Naeq8N/q9iNU/71DEUfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715137335; c=relaxed/simple;
	bh=RSXkWh+YRP86q6rexA0Xz6MWHMmjPq2kVnY4SmLPLew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=C/VShYn8M4fUyGqp7XwmO8ZSyWRBvS11F55FeE5fNgA7/bmZ/xVuXycwfAv5iPX7EHz2sNwzwFLkKKwPfoS2ImTxSYqiY/gg6JJZwJHbvH8yBsZiiBVbo3FiCB4ssTfhrvgS/C5aDvh6QZigNHfyog1vEFHyyQXHB8R9rn4OsUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=je+VPU1P; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715137330;
	bh=FEbw+d5VeRFIZSqUXNpFbCLSNmCEdL3Hop+4ng9mEOc=;
	h=Date:From:To:Cc:Subject:From;
	b=je+VPU1PJCpn9bE2wPrAXVtRbKp19yXraTVwUS/PYZ83yFvHhVqknI4ZhOXwPPzOX
	 mTXC9DtaE43sXjcGYwctEHv9F4ZyEG9Q9DTxoix6Tq5dcKVw0L/sTcM3K9MWxz5Y4S
	 NnDszPFNmsPX7AMROIX0vWkSYOgCIWGNhE2wOxA39aPBc8p4lQG/B3JdDsc69haQxi
	 AHjUmEegimQNWhByMUqEXwv+ODwTVsI8bX43BfKO/Pudx1UQ0Kn6RjG/4Y17u0mxtE
	 yYpB9lRoEV0EVz4CkiZFTGzJiKH7QGBG9aOZP7cv+4PaF6RiRGPSi7BVOjnFVjqiKH
	 mDfd/gNkCiX2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZ0L86Fp8z4wc7;
	Wed,  8 May 2024 13:02:08 +1000 (AEST)
Date: Wed, 8 May 2024 13:02:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the vfs-brauner
 tree
Message-ID: <20240508130207.3d83702f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X84bEj4TZydhZxfVv0cdEua";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X84bEj4TZydhZxfVv0cdEua
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the block tree got a conflict in:

  block/ioctl.c

between commit:

  695eaf683e8e ("blk_ioctl_{discard,zeroout}(): we only want ->bd_inode->i_=
mapping here...")

from the vfs-brauner tree and commits:

  719c15a75ebf ("blk-lib: check for kill signal in ioctl BLKDISCARD")
  fb4271f2bfac ("Merge branch 'for-6.10/block' into for-next")

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

diff --cc block/ioctl.c
index 3b31c09941dc,c0f1b6583a9a..000000000000
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@@ -95,8 -95,13 +95,12 @@@ static int compat_blkpg_ioctl(struct bl
  static int blk_ioctl_discard(struct block_device *bdev, blk_mode_t mode,
  		unsigned long arg)
  {
+ 	unsigned int bs_mask =3D bdev_logical_block_size(bdev) - 1;
  	uint64_t range[2];
  	uint64_t start, len, end;
 -	struct inode *inode =3D bdev->bd_inode;
+ 	struct bio *prev =3D NULL, *bio;
+ 	sector_t sector, nr_sects;
+ 	struct blk_plug plug;
  	int err;
 =20
  	if (!(mode & BLK_OPEN_WRITE))
@@@ -124,9 -131,34 +130,34 @@@
  	err =3D truncate_bdev_range(bdev, mode, start, start + len - 1);
  	if (err)
  		goto fail;
- 	err =3D blkdev_issue_discard(bdev, start >> 9, len >> 9, GFP_KERNEL);
+=20
+ 	sector =3D start >> SECTOR_SHIFT;
+ 	nr_sects =3D len >> SECTOR_SHIFT;
+=20
+ 	blk_start_plug(&plug);
+ 	while (1) {
+ 		if (fatal_signal_pending(current)) {
+ 			if (prev)
+ 				bio_await_chain(prev);
+ 			err =3D -EINTR;
+ 			goto out_unplug;
+ 		}
+ 		bio =3D blk_alloc_discard_bio(bdev, &sector, &nr_sects,
+ 				GFP_KERNEL);
+ 		if (!bio)
+ 			break;
+ 		prev =3D bio_chain_and_submit(prev, bio);
+ 	}
+ 	if (prev) {
+ 		err =3D submit_bio_wait(prev);
+ 		if (err =3D=3D -EOPNOTSUPP)
+ 			err =3D 0;
+ 		bio_put(prev);
+ 	}
+ out_unplug:
+ 	blk_finish_plug(&plug);
  fail:
 -	filemap_invalidate_unlock(inode->i_mapping);
 +	filemap_invalidate_unlock(bdev->bd_mapping);
  	return err;
  }
 =20

--Sig_/X84bEj4TZydhZxfVv0cdEua
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY66y8ACgkQAVBC80lX
0GzcEwf9FfHtra+chFIi3ZeHfu7NdGK2tb5O6kAMDLTwLwQdQmJ9u/Dj18rEoiM4
o10As2KLpPWYnukJsqy1uQidCKAvalSZDRp3tO0EPuHld78HOG3MuJye1Tk7MjJF
LK9hsbNrfbFmPxsuDBey3/Ref1RGVRrkpY7hd1v1A63cgY1ajMD2012XSFBhDCGt
07zy9D8sZAirLgUAEjQDFyVBYDbze2kVMFylmLtSsXpRkEJP1vwIJVJKQxFizc/o
x66UyJMNvghATxlzSiiEGaLc6z/KvseoJqt+1m9xdeWlrdNIZjctgB1FRdo4b02P
nOlO1xAwwuibi3w5QZsCOFCHGJtDXg==
=Ohqx
-----END PGP SIGNATURE-----

--Sig_/X84bEj4TZydhZxfVv0cdEua--

