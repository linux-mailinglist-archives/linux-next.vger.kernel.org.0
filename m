Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C782CB3A6
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 05:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgLBECf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 23:02:35 -0500
Received: from ozlabs.org ([203.11.71.1]:60617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727005AbgLBECf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 23:02:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cm4zN5Q9Bz9sSf;
        Wed,  2 Dec 2020 15:01:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606881713;
        bh=B9J8C0KrgdXeYlmEmzq3VAVeilwaaAUPotN8wo9Ayok=;
        h=Date:From:To:Cc:Subject:From;
        b=BIvrcCAf0DhaD38btlsV94fX26Z0KG9UR8gdW/WR26y+NYVStzGx2s+6OAqoTvDRQ
         V5yztQnr0nKd8wfLAb6Uw9/KJUuyWMkwARhHtVVEf1MHiknUTkx/iItYBXb78MdXjO
         oYMnrXW+6VRZ7JiEp5/o7AinCF+GAlQKkSZm+y4arWTvztuyDUwVK+jT+sGfPolDmh
         c7mgjGlhoGEEylDUmYeIJJhewp1+M/hDZR79Npr/NzFzSiAiVyUMjGXgkveN0i1YSE
         pUKhbPdP8Iw+5IqhLrLkIQj21D2TEulytX/oEgTaVtZex7g67qQ5rTs42EVZ5L2036
         HRtMtA6mbXHIg==
Date:   Wed, 2 Dec 2020 15:01:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20201202150149.42543862@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gZra8JwowWxMDVPKQPN+6ov";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gZra8JwowWxMDVPKQPN+6ov
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/btrfs/zoned.c: In function 'btrfs_get_dev_zone_info':
fs/btrfs/zoned.c:168:21: error: 'struct block_device' has no member named '=
bd_part'; did you mean 'bd_partno'?
  168 |  nr_sectors =3D bdev->bd_part->nr_sects;
      |                     ^~~~~~~
      |                     bd_partno
fs/btrfs/zoned.c: In function 'btrfs_sb_log_location_bdev':
fs/btrfs/zoned.c:508:21: error: 'struct block_device' has no member named '=
bd_part'; did you mean 'bd_partno'?
  508 |  nr_sectors =3D bdev->bd_part->nr_sects;
      |                     ^~~~~~~
      |                     bd_partno
fs/btrfs/zoned.c: In function 'btrfs_reset_sb_log_zones':
fs/btrfs/zoned.c:606:21: error: 'struct block_device' has no member named '=
bd_part'; did you mean 'bd_partno'?
  606 |  nr_sectors =3D bdev->bd_part->nr_sects;
      |                     ^~~~~~~
      |                     bd_partno

Caused by commits

  a782483cc1f8 ("block: remove the nr_sects field in struct hd_struct")
  0d02129e76ed ("block: merge struct block_device and struct hd_struct")

interacting with commits

  ab3ea6d0e65c ("btrfs: get zone information of zoned block devices")
  1a4b440a1c2b ("btrfs: implement log-structured superblock for ZONED mode")

from the btrfs tree.

I applied the following merge fix patch (which may, or may not, be
correct but fixes the build).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 2 Dec 2020 14:55:04 +1100
Subject: [PATCH] fixup for "block: merge struct block_device and struct
 hd_struct"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/btrfs/zoned.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 155545180046..c38846659019 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -165,7 +165,7 @@ int btrfs_get_dev_zone_info(struct btrfs_device *device)
 	if (!zone_info)
 		return -ENOMEM;
=20
-	nr_sectors =3D bdev->bd_part->nr_sects;
+	nr_sectors =3D bdev_nr_sectors(bdev);
 	zone_sectors =3D bdev_zone_sectors(bdev);
 	/* Check if it's power of 2 (see is_power_of_2) */
 	ASSERT(zone_sectors !=3D 0 && (zone_sectors & (zone_sectors - 1)) =3D=3D =
0);
@@ -505,7 +505,7 @@ int btrfs_sb_log_location_bdev(struct block_device *bde=
v, int mirror, int rw,
 		return -EINVAL;
 	zone_size =3D zone_sectors << SECTOR_SHIFT;
 	zone_sectors_shift =3D ilog2(zone_sectors);
-	nr_sectors =3D bdev->bd_part->nr_sects;
+	nr_sectors =3D bdev_nr_sectors(bdev);
 	nr_zones =3D nr_sectors >> zone_sectors_shift;
=20
 	sb_zone =3D sb_zone_number(zone_sectors_shift + SECTOR_SHIFT, mirror);
@@ -603,7 +603,7 @@ int btrfs_reset_sb_log_zones(struct block_device *bdev,=
 int mirror)
=20
 	zone_sectors =3D bdev_zone_sectors(bdev);
 	zone_sectors_shift =3D ilog2(zone_sectors);
-	nr_sectors =3D bdev->bd_part->nr_sects;
+	nr_sectors =3D bdev_nr_sectors(bdev);
 	nr_zones =3D nr_sectors >> zone_sectors_shift;
=20
 	sb_zone =3D sb_zone_number(zone_sectors_shift + SECTOR_SHIFT, mirror);
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/gZra8JwowWxMDVPKQPN+6ov
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/HEa0ACgkQAVBC80lX
0Gxa1Qf9Ea4iqccc3oQt0k/44YdydlXN0MI91ZunY6rhUcLYpJmx/JJ9JjZoGhCu
FntKQpqZptvxmxk0fIPN+0apPzOsz9GN/Sz0yvImqm64TLhUtmGSrllnt0unCXTw
xZef4MBMZTjj4GqS7cfHmBrpn2ocmzLQrTRrVl4fYEv3JIinbkXInV0NuC8T2qI+
vb7ynJ84QwFQ3hbaEwpDGpf1jyQ5IhMNUMk41gCZFe8/iJpPN6l0dTtB81rQvs9A
e0XLmJ7+d6zJy8nYEkF5eODTTJX0kU50EjsC2k3dgybLfGAkpVcxb5Qkm+1wJTPe
YrgWWkSQeDHDN9z2tOii7Z8s4+Fv7w==
=B42h
-----END PGP SIGNATURE-----

--Sig_/gZra8JwowWxMDVPKQPN+6ov--
