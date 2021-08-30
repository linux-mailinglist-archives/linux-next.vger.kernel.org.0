Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821403FB19D
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 09:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhH3HKi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 03:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbhH3HKh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 03:10:37 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF0AC061575;
        Mon, 30 Aug 2021 00:09:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GyhJz1Pvkz9sWd;
        Mon, 30 Aug 2021 17:09:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630307380;
        bh=JWdXF1YT9kLWd3QuI72kVKyXKtNyWN50muCt8tSOHIs=;
        h=Date:From:To:Cc:Subject:From;
        b=K5/5AmoAkDprt2BeogrWY25K+76vvKZvsTxCAN+88lMgXmtiHxXpEjy7/P6vuc8St
         5oznhfuMAxkqDLi9NWRD3Z+xHQu/2pcUvy+qknir1ehsLKLb516isujVponjJncUAL
         K/DYlfEsHrqaU9DvnShj8JkfO2jFAueYMI0vsClrsnpLYEiEd1WBaw1HmJL80qommU
         TWXyY8QUQSseabs4v+kr4MYLtqCYrLt8Kir9JQ6EpCwW91j7TqfAdpC2SmSeaYTdcM
         rGF3YvbMijepVM6mMEAECGe5YMtJq4bx8iuUptfkGQrhkOco74nSIpnRrM40uT9zY0
         ds1u+tylrD2jA==
Date:   Mon, 30 Aug 2021 17:09:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>,
        Gao Xiang <xiang@kernel.org>
Cc:     Gao Xiang <hsiangkao@linux.alibaba.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nvdimm tree
Message-ID: <20210830170938.6fd8813d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h_vRppassiqsbBXGL_Awkc_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h_vRppassiqsbBXGL_Awkc_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nvdimm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/erofs/super.c: In function 'erofs_fc_fill_super':
fs/erofs/super.c:549:7: error: implicit declaration of function 'bdev_dax_s=
upported'; did you mean 'dax_supported'? [-Werror=3Dimplicit-function-decla=
ration]
  549 |      !bdev_dax_supported(sb->s_bdev, EROFS_BLKSIZ)) {
      |       ^~~~~~~~~~~~~~~~~~
      |       dax_supported

Caused by commit

  bdd3c50d83bf ("dax: remove bdev_dax_supported")

Interacting with commit

  06252e9ce05b ("erofs: dax support for non-tailpacking regular file")

from the erofs tree.

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Aug 2021 17:04:59 +1000
Subject: [PATCH] fixup for "dax: remove bdev_dax_supported"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/erofs/super.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index a8d49e8fc83a..2dc0b9f1d421 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -526,6 +526,7 @@ static int erofs_fc_fill_super(struct super_block *sb, =
struct fs_context *fc)
 	struct inode *inode;
 	struct erofs_sb_info *sbi;
 	struct erofs_fs_context *ctx =3D fc->fs_private;
+	struct dax_device *dax_dev =3D fs_dax_get_by_bdev(sb->s_bdev);
 	int err;
=20
 	sb->s_magic =3D EROFS_SUPER_MAGIC;
@@ -540,13 +541,14 @@ static int erofs_fc_fill_super(struct super_block *sb=
, struct fs_context *fc)
 		return -ENOMEM;
=20
 	sb->s_fs_info =3D sbi;
-	sbi->dax_dev =3D fs_dax_get_by_bdev(sb->s_bdev);
+	sbi->dax_dev =3D dax_dev;
 	err =3D erofs_read_superblock(sb);
 	if (err)
 		return err;
=20
 	if (test_opt(ctx, DAX_ALWAYS) &&
-	    !bdev_dax_supported(sb->s_bdev, EROFS_BLKSIZ)) {
+	    !dax_supported(dax_dev, sb->s_bdev, EROFS_BLKSIZ, 0,
+			   bdev_nr_sectors(sb->s_bdev))) {
 		errorfc(fc, "DAX unsupported by block device. Turning off DAX.");
 		clear_opt(ctx, DAX_ALWAYS);
 	}
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/h_vRppassiqsbBXGL_Awkc_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEshDIACgkQAVBC80lX
0Gzb9Qf9EjmMeSoMGI2rOOif2MxxSKa9MuigwftZhilDi4HTl1m7WGVzaJbH+88k
psqnMHuNbCy9zHxmtJv6L8nwnZM6o+KGrBLXDFbyCO7E9/YDFNcUiqGiIba+vaPe
d/1Iw/INkwmDy9R6krTDsKlsVED86qXq/t74AbkL720rtryMTDvlEKQpFQK9QVEW
gn5ELfOhjYybg/lzKS3nR4/LekshCoYetRYhat1s62QC4HzwujVj1MRf800S8XTr
Sv5Xn9GP1ER6mh9/o67uYEsfacObY05QHw6YFQJOPw95Zg6NlzOxH02KY14RABpB
udJmT1b7sebovUrk+2lHSgJ6K/D5JA==
=8PBY
-----END PGP SIGNATURE-----

--Sig_/h_vRppassiqsbBXGL_Awkc_--
