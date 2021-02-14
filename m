Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D79931B305
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 23:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhBNWZA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 17:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhBNWZA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 17:25:00 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1207CC061574;
        Sun, 14 Feb 2021 14:24:20 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df1xD5BDnz9rx8;
        Mon, 15 Feb 2021 09:24:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613341457;
        bh=wqgr1aEs2mYxaw6/K4Djf1vXOMJNvkfKoHMr/nVHG5o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kNAYuq6S9pTZuRNhcoiEcp1DkBIQkFYIgL4MJPcBxTxGztR4vlF8WoIJQvZPuSaF9
         rPY7iPUaAZXGoPXgq0s1YsNyGHcJP7Rw39aV4V7jJg/9wCOIqyVvUiHlO6qmWqTMji
         nZyN+7uwbXqZeBN4HAI5BWNgYYBAg0QSnEfFqfnRuSuGGiw07i8MyilKDIpycCKSk7
         ncWOAxytB8Zy4tHP9WK15YtCWxHZErxfZdRESYwXihQW6MehRQTFoIBUT61dsOAT4t
         LJ/Bl+PGdMno4lCMPTltX35L46D1Iat7lMoV6X5VdvQohiKY4MlHmkUnbSjYiH5AwI
         rzlQy8FNsUb0Q==
Date:   Mon, 15 Feb 2021 09:24:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc:     Christoph Hellwig <hch@lst.de>, David Sterba <dsterba@suse.com>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Naohiro Aota <naohiro.aota@wdc.com>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20210215092415.4d8df749@canb.auug.org.au>
In-Reply-To: <20210202141618.4a3a9470@canb.auug.org.au>
References: <20210202135714.6470f476@canb.auug.org.au>
        <20210202141618.4a3a9470@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wc0OkUrOkQpsuyeiHlisEGR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wc0OkUrOkQpsuyeiHlisEGR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Feb 2021 14:16:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 2 Feb 2021 13:57:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the block tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > block/bio.c: In function 'bio_add_zone_append_page':
> > block/bio.c:860:31: error: 'struct bio' has no member named 'bi_disk'
> >   860 |  struct request_queue *q =3D bio->bi_disk->queue;
> >       |                               ^~
> >=20
> > Caused by commit
> >=20
> >   309dca309fc3 ("block: store a block_device pointer in struct bio")
> >=20
> > interacting with commit
> >=20
> >   9f678097f3de ("block: add bio_add_zone_append_page")

Now

  ae29333fa644 ("block: add bio_add_zone_append_page")

> >=20
> > from the btrfs tree.
> >=20
> > I applied the following merge fix up for today.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 2 Feb 2021 13:54:29 +1100
> > Subject: [PATCH] block: bio: fix up for bi_disk removal
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  block/bio.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/block/bio.c b/block/bio.c
> > index bf3ab1b5c844..e3b9d3e0a196 100644
> > --- a/block/bio.c
> > +++ b/block/bio.c
> > @@ -857,7 +857,7 @@ EXPORT_SYMBOL(bio_add_pc_page);
> >  int bio_add_zone_append_page(struct bio *bio, struct page *page,
> >  			     unsigned int len, unsigned int offset)
> >  {
> > -	struct request_queue *q =3D bio->bi_disk->queue;
> > +	struct request_queue *q =3D bio->bi_bdev->bd_disk->queue;
> >  	bool same_page =3D false;
> > =20
> >  	if (WARN_ON_ONCE(bio_op(bio) !=3D REQ_OP_ZONE_APPEND))
> > --=20
> > 2.29.2 =20
>=20
> This then lead to the following in my x86_64 allmodconfig build:
>=20
> fs/btrfs/zoned.c: In function 'btrfs_record_physical_zoned':
> fs/btrfs/zoned.c:1286:21: error: 'struct bio' has no member named 'bi_dis=
k'
>  1286 |  ordered->disk =3D bio->bi_disk;
>       |                     ^~
> fs/btrfs/zoned.c:1287:23: error: 'struct bio' has no member named 'bi_par=
tno'
>  1287 |  ordered->partno =3D bio->bi_partno;
>       |                       ^~
>=20
> Do to the above block tree commit interacting with commit
>=20
>   bccc13e5fe0c ("btrfs: use ZONE_APPEND write for ZONED btrfs")

Now

  d8e3fb106f39 ("btrfs: zoned: use ZONE_APPEND write for zoned mode")

>=20
> from the btrfs tree.
>=20
> For which I applied the following merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 2 Feb 2021 14:08:44 +1100
> Subject: [PATCH] block: btrfs: another fix up for bi_disk removal
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/btrfs/zoned.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
> index 334a54be587d..4829ffc5275b 100644
> --- a/fs/btrfs/zoned.c
> +++ b/fs/btrfs/zoned.c
> @@ -1283,8 +1283,8 @@ void btrfs_record_physical_zoned(struct inode *inod=
e, u64 file_offset,
>  		return;
> =20
>  	ordered->physical =3D physical;
> -	ordered->disk =3D bio->bi_disk;
> -	ordered->partno =3D bio->bi_partno;
> +	ordered->disk =3D bio->bi_bdev->bd_disk;
> +	ordered->partno =3D bio->bi_bdev->bd_partno;
> =20
>  	btrfs_put_ordered_extent(ordered);
>  }
> --=20
> 2.29.2

With the merge window about to open, this is a reminder that this
conflict still exists.

I am still applying both these merge fix ups.

--=20
Cheers,
Stephen Rothwell

--Sig_/wc0OkUrOkQpsuyeiHlisEGR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApow8ACgkQAVBC80lX
0GxsWwf7BelogexUJj7LQShzCWfIB1IB8Nh3k+fmmR/g3PYu143zQMesuSvpq2dq
X/tXtWITqYLTsYwclu9Y5EZ6HrzEcNOsTOqZBsCJrkxLAbX1wxO8/fNdsIY/gEhl
5FZ6l5BY3F6QCzQLo43nT3rfM9Ihr0LnY6oVN9Y51VkgwPOgs6Zy1L/BFU85jlOm
kHBIwlfxd55KU2V4EFrvoqGWQNX9aOUnAmLvU2O+jzhYyDloTbYoGOMp+RPGP9oH
URUUlbM1/D4fkFKMiYFzT2fmQcbmYYVEzqlqtlqwhpArlGXVQUFyUPnokwUoET86
T60WU6j+cbapyTsdAGQX3UNe58Qv4A==
=zH4b
-----END PGP SIGNATURE-----

--Sig_/wc0OkUrOkQpsuyeiHlisEGR--
