Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4120C1DE565
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 13:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729409AbgEVLcH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 07:32:07 -0400
Received: from ozlabs.org ([203.11.71.1]:43707 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728281AbgEVLcH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 May 2020 07:32:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49T48N6qQhz9sSW;
        Fri, 22 May 2020 21:32:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590147125;
        bh=urgcefr/YlkmkNAFUGmo68RW1ttwHwPL72RDkV/bRug=;
        h=Date:From:To:Cc:Subject:From;
        b=UELXjqvxyjEzBQEmziHCTCjvFZZXw3i1dyiYfnwYTU7HH0c+SjOWJxFKvAthJAIRR
         sDRhEy+YQ+7+01HOZb8wvlKoWxN7BdV7tR/hTZ102qbSTzMO9xvKL/kKoBFY/y6ObH
         J64pNUcsOsz8y0tGvCUpwZiql4kXz0x5O8fTFBa32qTpmHkM3cdO+l85CvmigQRTop
         VYOgfrjKW3qDBBeKAbfN521oG9U0s1wa1NVjj2CcFC3giyyrTZyAjtQj9iGLHfzU0I
         Pz2PAv+PJYMKhT0QC/qIUhmWx6ungZxtPiZwImGYIlCOu3UJ+JvjsOkNiEgL6D+q8M
         Yhqxv1qoP4muw==
Date:   Fri, 22 May 2020 21:32:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200522213202.38ebe825@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UtxBkTtJCi6+=X/EUuCRSf3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UtxBkTtJCi6+=X/EUuCRSf3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allnoconfig) failed like this:

fs/libfs.c: In function 'generic_file_fsync':
fs/libfs.c:1116:9: error: too few arguments to function 'blkdev_issue_flush'
 1116 |  return blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
      |         ^~~~~~~~~~~~~~~~~~
In file included from fs/libfs.c:7:
include/linux/blkdev.h:1875:19: note: declared here
 1875 | static inline int blkdev_issue_flush(struct block_device *bdev, gfp=
_t gfp_mask,
      |                   ^~~~~~~~~~~~~~~~~~

Caused by commit

  c64644ce363b ("block: remove the error_sector argument to blkdev_issue_fl=
ush")

I have applied the following patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 22 May 2020 21:21:54 +1000
Subject: [PATCH] block: fix for "remove the error_sector argument to
 blkdev_issue_flush"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/blkdev.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 95f1e6db31e2..7d10f4e63232 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1872,8 +1872,7 @@ static inline bool blk_needs_flush_plug(struct task_s=
truct *tsk)
 	return false;
 }
=20
-static inline int blkdev_issue_flush(struct block_device *bdev, gfp_t gfp_=
mask,
-				     sector_t *error_sector)
+static inline int blkdev_issue_flush(struct block_device *bdev, gfp_t gfp_=
mask)
 {
 	return 0;
 }
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/UtxBkTtJCi6+=X/EUuCRSf3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HuDMACgkQAVBC80lX
0GytSwf/alxMhLVCRbD9KdpHpaYkX6KYezj3KR2eLqmgHHoSwhzMcORdLy6C8HHE
kDCggkIeBNgKN4AFUUFg5k6koY/CPEoQVV0hWwrb6hrkLjYnEFuXXq1lVTLbAWzE
0mBRhxS6EIZffZ+JdRQrGz32b3asxOLQXMObLSm4y0qAGYZOWeCRMSUceUj3ZL6p
nEMprJflPODk6jA1KmEcuwN3fnkphi5EOhsoscZhlP0cvQokC2Ug9us+Udkkbzj/
dq/sE1Hx7mk3bKm6Vbyi9PbveEFo1Fzy8j3bPCsNYLd2kRoTI+z3Wny/I3rc3ZV6
DgyMoFSPbCU4XxCZunKHW0yzWTFjBw==
=E/X4
-----END PGP SIGNATURE-----

--Sig_/UtxBkTtJCi6+=X/EUuCRSf3--
