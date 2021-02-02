Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9749230B584
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 03:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhBBC57 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 21:57:59 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41895 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhBBC56 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Feb 2021 21:57:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DV8cD0DdXz9tjt;
        Tue,  2 Feb 2021 13:57:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612234636;
        bh=5xkzDG4WtUNuRhGuN7jmw2R75twvSA4l6Hb78ZxgOb0=;
        h=Date:From:To:Cc:Subject:From;
        b=lmX0MWQZPTIVfi/2Ns6f+WpVd9hSAAgpiH4/JQCHTW8wDPjZSLUc6/PCkN9aUXeNf
         ClhRud9vDq67PvrqumdILcSX55gVsc+3gz5EfgrZ6JWwPm7tOzDMzPLYQSoJGT6d9Z
         CQrRKodycRMj8z55o9rO9cXleSZGDj9gaPBSX407QfE87MgfvtuKLfJrMNMapAGBuc
         pinwiEbbPIM4kyN7GJeduqvLkxu/DaKtquGxUT0JaQVGJoat47o3yBDmwLeq0UOZGT
         Ey4ZESjRKDdwPqJPHUJ1v9mMXwT7HzQ/lydS/JkhRa6+ieq4NR6aXk4qkA6ThJeQ/6
         p8ngvoLqFsR5g==
Date:   Tue, 2 Feb 2021 13:57:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc:     Christoph Hellwig <hch@lst.de>, David Sterba <dsterba@suse.com>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20210202135714.6470f476@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8khiC8Fh8Zx.ODu4O_E0T+r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8khiC8Fh8Zx.ODu4O_E0T+r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

block/bio.c: In function 'bio_add_zone_append_page':
block/bio.c:860:31: error: 'struct bio' has no member named 'bi_disk'
  860 |  struct request_queue *q =3D bio->bi_disk->queue;
      |                               ^~

Caused by commit

  309dca309fc3 ("block: store a block_device pointer in struct bio")

interacting with commit

  9f678097f3de ("block: add bio_add_zone_append_page")

from the btrfs tree.

I applied the following merge fix up for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Feb 2021 13:54:29 +1100
Subject: [PATCH] block: bio: fix up for bi_disk removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 block/bio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/bio.c b/block/bio.c
index bf3ab1b5c844..e3b9d3e0a196 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -857,7 +857,7 @@ EXPORT_SYMBOL(bio_add_pc_page);
 int bio_add_zone_append_page(struct bio *bio, struct page *page,
 			     unsigned int len, unsigned int offset)
 {
-	struct request_queue *q =3D bio->bi_disk->queue;
+	struct request_queue *q =3D bio->bi_bdev->bd_disk->queue;
 	bool same_page =3D false;
=20
 	if (WARN_ON_ONCE(bio_op(bio) !=3D REQ_OP_ZONE_APPEND))
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/8khiC8Fh8Zx.ODu4O_E0T+r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAYv4oACgkQAVBC80lX
0GxIKQf/TO4TRaSRFH79dXjUG4PrYe9bD0eL84a5m9p98qU6djvh9QkPu+f7ol8S
ff6TDkaz0vnsotrf1/wncNoY0s5aq5N/J/T+O1yjO4v7TYkr+fkMOeKZ74kebT/Z
bhnII8dNJ368I6RDZe3lnCSviup722xguvFQ8cdVq4wL4cPc23QDJcXgxDyScCFY
BSSi/LnCprRHdWI23l7A1HayrKEnwauLguf1CVXeVdO3gyNh5B324jZX6XVp9FHA
qopRo1fM7nPft+9QEqSua10rVZkLFxZg8u2pTyE2fGcTsuYlnwTY/WfBeCGgY2oQ
+/AhVNocOJpDWP67SyRJ0j+BXVnPSw==
=yT/Q
-----END PGP SIGNATURE-----

--Sig_/8khiC8Fh8Zx.ODu4O_E0T+r--
