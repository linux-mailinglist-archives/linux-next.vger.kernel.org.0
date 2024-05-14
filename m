Return-Path: <linux-next+bounces-2288-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF268C4ADC
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 03:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB821C21433
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 01:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07ABF17CD;
	Tue, 14 May 2024 01:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NP8lJqA0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578F6EDC;
	Tue, 14 May 2024 01:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715649990; cv=none; b=MrWMffpWPjPzsAu9RzK1IDFT7wPuZm0ZtYoj7G9D1oYqeVn6BN4ldSGoIFkc4q7aK5GdN7kQ0cDz+Vna4bi9IIUEjWetEISLIOSsFZDc5Gq2zawIuG0jxUMjvlRp1Lw97xBSPamyOOr3gOQw6fqSJHF7OU3ZCzJ/lHqYkC919fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715649990; c=relaxed/simple;
	bh=ZTBmPRZplR8W18GGJCNCbMS9FmtIuBAuXx20MKNwRrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RdKjgaErNGzAQCODj4AMeVczl4++uc+dCNKGVFzTVcbJw1BSxBNOrTEbxFKT+nbXQvVneF/ZkMBqVfyRlf+uwUQTXGFQ8MVcZE11NkgbYk4QRNf47DNqb6jFgtHV5DnkxphULCtutotPwwK3dH7wyMEaSf93125AoOCfg54DLu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NP8lJqA0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715649984;
	bh=D4ZvohIwpoATIf1kOoEHa9IE5VgAEOMsVFO6GEWhlfM=;
	h=Date:From:To:Cc:Subject:From;
	b=NP8lJqA0mOsf8hQ/zF0mc9vEFkF9nCNpKMKa1xdEqYtu3gqwn1V86oW/aWXJsk6EM
	 BICEAxQoBlXBQUkbiMDLImw2Al6Fsd1mhyJKVZF2Wso6pF/n5SRys6njejIxPB6xHI
	 AaCatBM3DsvWwWCVzmpXLseZxSYgEFFJiKFrBroAE8qWgbbWUc4kZs+7MtNFjC6fG2
	 bvR1HHF0sQj6M/QuBZDWyHdwAUbywGcMWZt7KIT/WFaOeIKCdmtwfq9JxV/mceCVxN
	 rffa4J8i4BdMoFMvPu1RzEMiH2TDeLEv4st9cMijEg8tFoWSUhNZ20qElp9WbtvENC
	 waqvrFw13RLLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vddwv4Shkz4wb0;
	Tue, 14 May 2024 11:26:23 +1000 (AEST)
Date: Tue, 14 May 2024 11:26:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Message-ID: <20240514112622.63021dce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//SomYFN01wtONHPhVXDx5rV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//SomYFN01wtONHPhVXDx5rV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  block/ioctl.c

between commits:

  30f1e7241422 ("block: move discard checks into the ioctl handler")
  719c15a75ebf ("blk-lib: check for kill signal in ioctl BLKDISCARD")
  0c9f4ac808b0 ("Merge tag 'for-6.10/block-20240511' of git://git.kernel.dk=
/linux")

from Linus' tree and commit:

  695eaf683e8e ("blk_ioctl_{discard,zeroout}(): we only want ->bd_inode->i_=
mapping here...")

from the vfs tree.

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
index c7db3bd2d653,0513fbe90280..000000000000
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@@ -95,12 -95,8 +95,11 @@@ static int compat_blkpg_ioctl(struct bl
  static int blk_ioctl_discard(struct block_device *bdev, blk_mode_t mode,
  		unsigned long arg)
  {
 -	uint64_t range[2];
 -	uint64_t start, len, end;
 +	unsigned int bs_mask =3D bdev_logical_block_size(bdev) - 1;
- 	struct inode *inode =3D bdev->bd_inode;
 +	uint64_t range[2], start, len, end;
 +	struct bio *prev =3D NULL, *bio;
 +	sector_t sector, nr_sects;
 +	struct blk_plug plug;
  	int err;
 =20
  	if (!(mode & BLK_OPEN_WRITE))
@@@ -130,34 -124,9 +129,34 @@@
  	err =3D truncate_bdev_range(bdev, mode, start, start + len - 1);
  	if (err)
  		goto fail;
 -	err =3D blkdev_issue_discard(bdev, start >> 9, len >> 9, GFP_KERNEL);
 +
 +	sector =3D start >> SECTOR_SHIFT;
 +	nr_sects =3D len >> SECTOR_SHIFT;
 +
 +	blk_start_plug(&plug);
 +	while (1) {
 +		if (fatal_signal_pending(current)) {
 +			if (prev)
 +				bio_await_chain(prev);
 +			err =3D -EINTR;
 +			goto out_unplug;
 +		}
 +		bio =3D blk_alloc_discard_bio(bdev, &sector, &nr_sects,
 +				GFP_KERNEL);
 +		if (!bio)
 +			break;
 +		prev =3D bio_chain_and_submit(prev, bio);
 +	}
 +	if (prev) {
 +		err =3D submit_bio_wait(prev);
 +		if (err =3D=3D -EOPNOTSUPP)
 +			err =3D 0;
 +		bio_put(prev);
 +	}
 +out_unplug:
 +	blk_finish_plug(&plug);
  fail:
- 	filemap_invalidate_unlock(inode->i_mapping);
+ 	filemap_invalidate_unlock(bdev->bd_mapping);
  	return err;
  }
 =20

--Sig_//SomYFN01wtONHPhVXDx5rV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZCvb4ACgkQAVBC80lX
0Gx0xAf/ZdxY+yVGz90SjSSJdIHPqCwcqsdkW9lTDCj/ype7aXjsrZomSZEm14yd
w55rNd7ZRdee7ZUsCOSzX5wodX/OPxDdsDHH9DsOAFj0D35lIsYp1fMXOtGiDGbL
yv2p/GtWP4woPvWeVc+KehSTdj5I6mYlhSUrel5JG5a+D+Y9IzusqP26j+FFoozT
aDNRSJppDwoxzPJq/FftTCyTTRYfjEe3vcdQWpV4qvBDNgXMOc3pKDwxgCWvfx3f
qwBtSqE5V955AHrn3TElS2P8V/T7R9TzTKl4e7rdjHzQJGZWurYIgA1kTIyduezd
M8mA3QBVHK6DOUSHLGBdDHnb7merVQ==
=p/7N
-----END PGP SIGNATURE-----

--Sig_//SomYFN01wtONHPhVXDx5rV--

