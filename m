Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC80A2DCAA7
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 02:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgLQBvj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 20:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgLQBvi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2020 20:51:38 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6810FC061794;
        Wed, 16 Dec 2020 17:50:58 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxFML50jHz9sTK;
        Thu, 17 Dec 2020 12:50:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608169855;
        bh=Y1kp6PWenWCO1/6eeal0Z4AjvcrMAokck/ar2RjYStM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NCy1mmZmvd0CTRb4qbwD1KbYnuVCO0CiKXpl1KCHT8WlWPlc91t1Mk1BywbCG8M+k
         23Y/qkQaL/nM5lBEAXSN7Ta7VXw34I2aaZoYssxattMzFHT7BFrp7+9lkb5UsmJ0vr
         96S5Fwi3j90rk3+7imC0ZXr73Ee19BkvHrPGSLvFumORDge1kO7JG9nqC8pfnxIcpW
         bsgXpIOmo9tDSgjGWPP+kkK7axqy6OyiGhJvCSE3BprLs6fbXj9FJTRbi5sOBt7mo7
         +E3RgtaUn+AQX3vM+md5D1n0Ch3/vZu2SPKkyV717fsmUTM3rdjXNPUquFWgDQh3Pg
         tssXFPDKJbnww==
Date:   Thu, 17 Dec 2020 12:50:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Jens Axboe <axboe@kernel.dk>, Chao Yu <chao@kernel.org>,
        Chao Yu <yuchao0@huawei.com>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the f2fs tree
Message-ID: <20201217125052.50be70b6@canb.auug.org.au>
In-Reply-To: <20201215071212.7a83aade@canb.auug.org.au>
References: <20201203144348.70f139a9@canb.auug.org.au>
        <20201215071212.7a83aade@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7aBkm0.Hp9j5LFM=MCycyk6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7aBkm0.Hp9j5LFM=MCycyk6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Dec 2020 07:12:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Thu, 3 Dec 2020 14:43:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the block tree got conflicts in:
> >=20
> >   fs/f2fs/checkpoint.c
> >   fs/f2fs/f2fs.h
> >   fs/f2fs/super.c
> >=20
> > between commit:
> >=20
> >   5c0602188dc7 ("f2fs: fix kbytes written stat for multi-device case")
> >=20
> > from the f2fs tree and commits:
> >=20
> >   8446fe9255be ("block: switch partition lookup to use struct block_dev=
ice")
> >   9499ffc75217 ("f2fs: remove a few bd_part checks")
> >=20
> > from the block tree.
> >=20
> > I fixed it up (I think, see below, fs/f2fs/f2fs.h and fs/f2fs/super.c
> > used the versions from the f2fs tree) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> >=20
> >=20
> > diff --cc fs/f2fs/checkpoint.c
> > index 14ba1519639e,54a1905af052..000000000000
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@@ -1385,27 -1385,6 +1385,26 @@@ static void commit_checkpoint(struct =
f2
> >   	f2fs_submit_merged_write(sbi, META_FLUSH);
> >   }
> >  =20
> >  +static inline u64 get_sectors_written(struct block_device *bdev)
> >  +{
> > - 	return bdev->bd_part ?
> > - 		(u64)part_stat_read(bdev->bd_part, sectors[STAT_WRITE]) : 0;
> > ++	return (u64)part_stat_read(bdev, sectors[STAT_WRITE]) : 0; =20
>                                                              ^^^^
> With this removed.
>=20
> >  +}
> >  +
> >  +u64 f2fs_get_sectors_written(struct f2fs_sb_info *sbi)
> >  +{
> >  +	if (f2fs_is_multi_device(sbi)) {
> >  +		u64 sectors =3D 0;
> >  +		int i;
> >  +
> >  +		for (i =3D 0; i < sbi->s_ndevs; i++)
> >  +			sectors +=3D get_sectors_written(FDEV(i).bdev);
> >  +
> >  +		return sectors;
> >  +	}
> >  +
> >  +	return get_sectors_written(sbi->sb->s_bdev);
> >  +}
> >  +
> >   static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control =
*cpc)
> >   {
> >   	struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(sbi);
> > diff --cc fs/f2fs/f2fs.h
> > index 5cd1b9f7cc53,49681a8d2b14..000000000000
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > diff --cc fs/f2fs/super.c
> > index 47858e0c5e95,af9f449da64b..000000000000
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c =20
>=20
> Just a reminder that the above conflict still exists.

This is now a conflict between the f2fs tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/7aBkm0.Hp9j5LFM=MCycyk6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/auXwACgkQAVBC80lX
0GyLrQgAoCuanoJICnHeSBeLL2yPwy+WoXUXjEbMfk3Kv9FSvKHCX1Jk6vC0Zk9q
Bx+2d0iEMlh0KoVTCr6xgv6qr+qDxEuSCmRX2NQrUs9u/43xVE5pNA9+ulUy1yOl
h9UUU+M/zPgnu9xZ/Op4giDTRwLEgq9NVINJWfMwkFLj73U2zDmM3MymA09+kw1L
udJElsWxRLE/Gbym6wS64/mbSBg69IH3s04pyESB7OBp2qR3DYPW/khEi4GbUOAJ
BB5Cd8gGOKwlnWc1mvOTYHIoOcwx77a0/ECPjk/SvxuFpGYjmX5P3QzSjBZNmt7E
thGBPpj+SlCbjMOLV5SDOXw6kYoEgA==
=kRmc
-----END PGP SIGNATURE-----

--Sig_/7aBkm0.Hp9j5LFM=MCycyk6--
