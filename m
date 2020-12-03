Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08ABF2CCD6C
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 04:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgLCDoc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 22:44:32 -0500
Received: from ozlabs.org ([203.11.71.1]:41411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726734AbgLCDoc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Dec 2020 22:44:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmhX4612qz9sT5;
        Thu,  3 Dec 2020 14:43:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606967029;
        bh=WwqcBKfHn38z/Vr5d/f/DdHivfFtB715Py8ijRHceVs=;
        h=Date:From:To:Cc:Subject:From;
        b=gR5cQ2pYjD71mnDWqpkukbSYk0YnDUpZWBVi/x6tETN5y6MuzL/3vsAaEXywUOvLn
         0Zg892xVQ9mZ/HFzjyTf4/djcwbSCvnP6fTTycxstrbIKFjshdZKGDdqGLFm/OgpRH
         ndLS+4J2LVZhR1Ljz6x1MJbfGT2qdzB7kx4UXg0gfwFCcF4/qk4M56/gHEuEKldP3v
         vdZK1KYB7+EkYS3g2HPBnOejkFztsCAaRbe7ftAklx6VRV5L5ouCPPDiw7dqhEXU80
         8UJqLaosn3k3ZT18BHeJXHtOTIQtS9X/qkcCoIru+aLYUx4BAUZIrbvBfW+D5FNe+c
         fjEliBlT2e92Q==
Date:   Thu, 3 Dec 2020 14:43:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the f2fs tree
Message-ID: <20201203144348.70f139a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aNLD_GmqL6KfdZ77ZL3I+U=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aNLD_GmqL6KfdZ77ZL3I+U=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got conflicts in:

  fs/f2fs/checkpoint.c
  fs/f2fs/f2fs.h
  fs/f2fs/super.c

between commit:

  5c0602188dc7 ("f2fs: fix kbytes written stat for multi-device case")

from the f2fs tree and commits:

  8446fe9255be ("block: switch partition lookup to use struct block_device")
  9499ffc75217 ("f2fs: remove a few bd_part checks")

from the block tree.

I fixed it up (I think, see below, fs/f2fs/f2fs.h and fs/f2fs/super.c
used the versions from the f2fs tree) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/checkpoint.c
index 14ba1519639e,54a1905af052..000000000000
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@@ -1385,27 -1385,6 +1385,26 @@@ static void commit_checkpoint(struct f2
  	f2fs_submit_merged_write(sbi, META_FLUSH);
  }
 =20
 +static inline u64 get_sectors_written(struct block_device *bdev)
 +{
- 	return bdev->bd_part ?
- 		(u64)part_stat_read(bdev->bd_part, sectors[STAT_WRITE]) : 0;
++	return (u64)part_stat_read(bdev, sectors[STAT_WRITE]) : 0;
 +}
 +
 +u64 f2fs_get_sectors_written(struct f2fs_sb_info *sbi)
 +{
 +	if (f2fs_is_multi_device(sbi)) {
 +		u64 sectors =3D 0;
 +		int i;
 +
 +		for (i =3D 0; i < sbi->s_ndevs; i++)
 +			sectors +=3D get_sectors_written(FDEV(i).bdev);
 +
 +		return sectors;
 +	}
 +
 +	return get_sectors_written(sbi->sb->s_bdev);
 +}
 +
  static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
  {
  	struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(sbi);
diff --cc fs/f2fs/f2fs.h
index 5cd1b9f7cc53,49681a8d2b14..000000000000
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
diff --cc fs/f2fs/super.c
index 47858e0c5e95,af9f449da64b..000000000000
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c

--Sig_/aNLD_GmqL6KfdZ77ZL3I+U=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/IXvQACgkQAVBC80lX
0GyDBQgAnu7cXjFQlvRzXo6XuxEE4J5+5wR+Iyet5imZZg4xRF49BJya00cI8Hr6
7LyU6wnbcPbsGM88p+yiwgUSf0J/YwHQf373DAN3Kx1Z3gb4bfwh+b2UEvME90TB
v2UBKUBuX77IlQABB1CdM6wtZ1G6RB3OfRgXo0PNQLlt1+eiBd/UlkbYhuRCHmh7
zEaXynvZqb+IAMBuZ5/BBG+eTqJIhpvOiDFrQxraYmIvNEwafvHAdQ1BWBjn68Uw
mP425r0/gWS3qWmjReF16nDD03AtIhNHV9QhqyoKfc5WOQ9Mjo6T2c4V4kRzCo2f
alJ0YxReDUgFh1ZrPPPHTp8Z3JB83w==
=lTAs
-----END PGP SIGNATURE-----

--Sig_/aNLD_GmqL6KfdZ77ZL3I+U=--
