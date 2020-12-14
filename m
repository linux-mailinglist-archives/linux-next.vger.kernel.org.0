Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275412DA151
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502931AbgLNURS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbgLNUKr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:10:47 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CF4C0613D3;
        Mon, 14 Dec 2020 12:10:00 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cvsts4m7Dz9sTX;
        Tue, 15 Dec 2020 07:09:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607976598;
        bh=bOGZIK/EC9dOWE8oJ5/EF1E5GiCSPIErQvZ4/oVKtHk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZH6JVIgfgS5BqpFH6DYnnCcxYmySaWdzxYDUB7ubFw7A4JeioJko7wED2SyY7Y3xs
         beCWzatZoHKsF0BJou/BJKd1zB9/RS3U7XGlvFuqgjo5tGlQgvGFlO2JP66hF9iYtJ
         uLtyGZ/XXmWE4YYn846uyLdXV4BJ7xUlFhstdCJnfoLj7BRP1HgsdhXBIGswJRnyXN
         ie8el/QzC2hBUx3fsrRHAyqNyGuvlkZkTcR5W+MxzPXUv4Xd/K44T1fLu5bZYFRWTK
         83l3TDD937xlIwnE5mkK+zkaHUDYZOH0+Fl2V3CSyaOfsjYJ8ZyzLm5K/CAdk8eew6
         s6YvfS/Mlmw4w==
Date:   Tue, 15 Dec 2020 07:09:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20201215070956.6852e939@canb.auug.org.au>
In-Reply-To: <20201202150149.42543862@canb.auug.org.au>
References: <20201202150149.42543862@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V+8HwfLtgijqLM864dR=WCo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/V+8HwfLtgijqLM864dR=WCo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 2 Dec 2020 15:01:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> fs/btrfs/zoned.c: In function 'btrfs_get_dev_zone_info':
> fs/btrfs/zoned.c:168:21: error: 'struct block_device' has no member named=
 'bd_part'; did you mean 'bd_partno'?
>   168 |  nr_sectors =3D bdev->bd_part->nr_sects;
>       |                     ^~~~~~~
>       |                     bd_partno
> fs/btrfs/zoned.c: In function 'btrfs_sb_log_location_bdev':
> fs/btrfs/zoned.c:508:21: error: 'struct block_device' has no member named=
 'bd_part'; did you mean 'bd_partno'?
>   508 |  nr_sectors =3D bdev->bd_part->nr_sects;
>       |                     ^~~~~~~
>       |                     bd_partno
> fs/btrfs/zoned.c: In function 'btrfs_reset_sb_log_zones':
> fs/btrfs/zoned.c:606:21: error: 'struct block_device' has no member named=
 'bd_part'; did you mean 'bd_partno'?
>   606 |  nr_sectors =3D bdev->bd_part->nr_sects;
>       |                     ^~~~~~~
>       |                     bd_partno
>=20
> Caused by commits
>=20
>   a782483cc1f8 ("block: remove the nr_sects field in struct hd_struct")
>   0d02129e76ed ("block: merge struct block_device and struct hd_struct")
>=20
> interacting with commits
>=20
>   ab3ea6d0e65c ("btrfs: get zone information of zoned block devices")
>   1a4b440a1c2b ("btrfs: implement log-structured superblock for ZONED mod=
e")
>=20
> from the btrfs tree.
>=20
> I applied the following merge fix patch (which may, or may not, be
> correct but fixes the build).
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 2 Dec 2020 14:55:04 +1100
> Subject: [PATCH] fixup for "block: merge struct block_device and struct
>  hd_struct"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/btrfs/zoned.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
> index 155545180046..c38846659019 100644
> --- a/fs/btrfs/zoned.c
> +++ b/fs/btrfs/zoned.c
> @@ -165,7 +165,7 @@ int btrfs_get_dev_zone_info(struct btrfs_device *devi=
ce)
>  	if (!zone_info)
>  		return -ENOMEM;
> =20
> -	nr_sectors =3D bdev->bd_part->nr_sects;
> +	nr_sectors =3D bdev_nr_sectors(bdev);
>  	zone_sectors =3D bdev_zone_sectors(bdev);
>  	/* Check if it's power of 2 (see is_power_of_2) */
>  	ASSERT(zone_sectors !=3D 0 && (zone_sectors & (zone_sectors - 1)) =3D=
=3D 0);
> @@ -505,7 +505,7 @@ int btrfs_sb_log_location_bdev(struct block_device *b=
dev, int mirror, int rw,
>  		return -EINVAL;
>  	zone_size =3D zone_sectors << SECTOR_SHIFT;
>  	zone_sectors_shift =3D ilog2(zone_sectors);
> -	nr_sectors =3D bdev->bd_part->nr_sects;
> +	nr_sectors =3D bdev_nr_sectors(bdev);
>  	nr_zones =3D nr_sectors >> zone_sectors_shift;
> =20
>  	sb_zone =3D sb_zone_number(zone_sectors_shift + SECTOR_SHIFT, mirror);
> @@ -603,7 +603,7 @@ int btrfs_reset_sb_log_zones(struct block_device *bde=
v, int mirror)
> =20
>  	zone_sectors =3D bdev_zone_sectors(bdev);
>  	zone_sectors_shift =3D ilog2(zone_sectors);
> -	nr_sectors =3D bdev->bd_part->nr_sects;
> +	nr_sectors =3D bdev_nr_sectors(bdev);
>  	nr_zones =3D nr_sectors >> zone_sectors_shift;
> =20
>  	sb_zone =3D sb_zone_number(zone_sectors_shift + SECTOR_SHIFT, mirror);

Just a reminder that I am still applying the above merge fix.

--=20
Cheers,
Stephen Rothwell

--Sig_/V+8HwfLtgijqLM864dR=WCo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XxpQACgkQAVBC80lX
0GxhNwgAhiawlO9QrGibxvUMdbTgEUUrZd+IUONEPsj8nwuflNiyn3wDnIEwetlS
9eF4TbD47ETTC588SASuLdfyOwDuC8VzbW570n6wzk6qNrtsYha0Uq4w2Ye+SC9n
lrCYhYlRXySq9YajvAGaS+uUJkVd2O5nhqXbQVfj4dFAmL4Q6I3BP2Ln8k+RZYUl
KjJpLFHpOCemUGdiEc+HxQlb8gI+cjhLvT5ttLzVGUBmIZsH98MvjsIcGfV3NeBp
UH2U2sPxZwD6EzwLlhALDKjaK/oV2LMNmBd6svf5R7QSbuhPXqJ4yh4nwZGC4o43
HnxWCKVTF5El1ZDz8QluIA0Mp8HyYg==
=OCtM
-----END PGP SIGNATURE-----

--Sig_/V+8HwfLtgijqLM864dR=WCo--
