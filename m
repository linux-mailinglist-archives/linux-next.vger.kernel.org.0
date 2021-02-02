Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F7430B5BB
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 04:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhBBDRF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 22:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhBBDRF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Feb 2021 22:17:05 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49CDC061573;
        Mon,  1 Feb 2021 19:16:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DV92C5wFMz9tkB;
        Tue,  2 Feb 2021 14:16:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612235781;
        bh=l4RrMfoAysP2CJv3Uqtn4njr4JIiAXCp+xF92OzvXqU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GYLuFAkjk3DzgLqPkf+07TaxBCb6ShKOuGxTGu47OVi+9wzqW/4plulOnS+u4Yq/L
         UtYw4S3i5HOM7rNkRWyI3k2kQA6/2zsFBJ8OtcElC0khq8f1pEz7V2DH7cG2uySYMC
         oWh4syDrHY5iiA5tTpg2xt4gDlE9AijXkq8E3NsCiaxeYKsrjkFQUFcVUQ9Z7At59V
         67qcN8Ix4W/geSNEDjiwR3m5cFGdy6zs9oQu4ftLKpvNGUhCve+aJA4DwhRmiuxD8+
         WRZ+sxyJ9b6C+qKcEs55mNkytp5LD69KjyBD5KGpm9xjuYhtA6cNE57IsYjWC27mw/
         XmLoSOYlflH2Q==
Date:   Tue, 2 Feb 2021 14:16:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc:     Christoph Hellwig <hch@lst.de>, David Sterba <dsterba@suse.com>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Naohiro Aota <naohiro.aota@wdc.com>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20210202141618.4a3a9470@canb.auug.org.au>
In-Reply-To: <20210202135714.6470f476@canb.auug.org.au>
References: <20210202135714.6470f476@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/on58PgwYTw5=sPogN.H4R1=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/on58PgwYTw5=sPogN.H4R1=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Feb 2021 13:57:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> block/bio.c: In function 'bio_add_zone_append_page':
> block/bio.c:860:31: error: 'struct bio' has no member named 'bi_disk'
>   860 |  struct request_queue *q =3D bio->bi_disk->queue;
>       |                               ^~
>=20
> Caused by commit
>=20
>   309dca309fc3 ("block: store a block_device pointer in struct bio")
>=20
> interacting with commit
>=20
>   9f678097f3de ("block: add bio_add_zone_append_page")
>=20
> from the btrfs tree.
>=20
> I applied the following merge fix up for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 2 Feb 2021 13:54:29 +1100
> Subject: [PATCH] block: bio: fix up for bi_disk removal
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  block/bio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/bio.c b/block/bio.c
> index bf3ab1b5c844..e3b9d3e0a196 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -857,7 +857,7 @@ EXPORT_SYMBOL(bio_add_pc_page);
>  int bio_add_zone_append_page(struct bio *bio, struct page *page,
>  			     unsigned int len, unsigned int offset)
>  {
> -	struct request_queue *q =3D bio->bi_disk->queue;
> +	struct request_queue *q =3D bio->bi_bdev->bd_disk->queue;
>  	bool same_page =3D false;
> =20
>  	if (WARN_ON_ONCE(bio_op(bio) !=3D REQ_OP_ZONE_APPEND))
> --=20
> 2.29.2

This then lead to the following in my x86_64 allmodconfig build:

fs/btrfs/zoned.c: In function 'btrfs_record_physical_zoned':
fs/btrfs/zoned.c:1286:21: error: 'struct bio' has no member named 'bi_disk'
 1286 |  ordered->disk =3D bio->bi_disk;
      |                     ^~
fs/btrfs/zoned.c:1287:23: error: 'struct bio' has no member named 'bi_partn=
o'
 1287 |  ordered->partno =3D bio->bi_partno;
      |                       ^~

Do to the above block tree commit interacting with commit

  bccc13e5fe0c ("btrfs: use ZONE_APPEND write for ZONED btrfs")

from the btrfs tree.

For which I applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Feb 2021 14:08:44 +1100
Subject: [PATCH] block: btrfs: another fix up for bi_disk removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/btrfs/zoned.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 334a54be587d..4829ffc5275b 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -1283,8 +1283,8 @@ void btrfs_record_physical_zoned(struct inode *inode,=
 u64 file_offset,
 		return;
=20
 	ordered->physical =3D physical;
-	ordered->disk =3D bio->bi_disk;
-	ordered->partno =3D bio->bi_partno;
+	ordered->disk =3D bio->bi_bdev->bd_disk;
+	ordered->partno =3D bio->bi_bdev->bd_partno;
=20
 	btrfs_put_ordered_extent(ordered);
 }
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/on58PgwYTw5=sPogN.H4R1=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAYxAIACgkQAVBC80lX
0Gxuvgf+PMYsZd3gUrbJXToN6ov+U947+Orgk+9q1S4d4jl1zoDXs1B4ojQ0x1Cg
43XGdMGy6H1xUMS7CdzYnBpUNDeEF5AP0aW/byvGINZnnVY4bsVgBj4hGbaq+RvF
HqWkBOBT3qDEB6MdCcCefeqA3sW4BJtPNyNOTDUjYDanRp36lgPypN46sMWNQbko
vp2i1hyqzkjWl51Jv2YYdTUOtP1vmc4hXYoaaI1pzCOcHFYeoEiU8nYzOh80BaPk
oQ4bWrxOGpyIvCX28yDIJ3KtQ7lY0Z9bQ8X05AdzNXlxb+wqIYGVJhvJnGkQ1b0h
g8XO7QtTuEK9YHSKicsR2Uk71hEHYw==
=wAOW
-----END PGP SIGNATURE-----

--Sig_/on58PgwYTw5=sPogN.H4R1=--
