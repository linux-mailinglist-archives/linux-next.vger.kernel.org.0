Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505FD2DA138
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502963AbgLNUNk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503086AbgLNUM4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:12:56 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516DFC0613D3;
        Mon, 14 Dec 2020 12:12:16 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvsxT4rXxz9sSC;
        Tue, 15 Dec 2020 07:12:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607976734;
        bh=SU7b1V6EG24XZl9vVlq5d3Y4Ir/oFzQ9rKpHOm1QFWU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fsHQxxdlNzmsEAo4JCF7skiT9TSNpvXCMXcjRMwQ/lxZ/0KBalCvDh5LuZiUTDHzf
         mJdxdN6X0LeCJJ+oBpS84rEjO3PrTv5ZClqZNqTkflx2pkbl6SXsTyXtIWkjywELEj
         20HLSAbtyyBhcs1hpx3j6HZNEcwmMaL5bKjWOK/kEjIiB2w6ZmxWHfBqr1c0tFjc4h
         TT5Ttqs6k1kzVUfhtMAFk5rZThSMunTJOwWImmPzwdAVzducK+ImE/Ad4U2pKzhR2u
         AHDnm4hMwL8U9PXJ2VvAf9cFdrjEcbce+E2HnYA2Gn9xqUNeF/RQhNFwrfziru4+t7
         htReU3Z+ad9/w==
Date:   Tue, 15 Dec 2020 07:12:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the f2fs tree
Message-ID: <20201215071212.7a83aade@canb.auug.org.au>
In-Reply-To: <20201203144348.70f139a9@canb.auug.org.au>
References: <20201203144348.70f139a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yCpfLPQDDZ9nFjJj8zrYkrI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yCpfLPQDDZ9nFjJj8zrYkrI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Dec 2020 14:43:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the block tree got conflicts in:
>=20
>   fs/f2fs/checkpoint.c
>   fs/f2fs/f2fs.h
>   fs/f2fs/super.c
>=20
> between commit:
>=20
>   5c0602188dc7 ("f2fs: fix kbytes written stat for multi-device case")
>=20
> from the f2fs tree and commits:
>=20
>   8446fe9255be ("block: switch partition lookup to use struct block_devic=
e")
>   9499ffc75217 ("f2fs: remove a few bd_part checks")
>=20
> from the block tree.
>=20
> I fixed it up (I think, see below, fs/f2fs/f2fs.h and fs/f2fs/super.c
> used the versions from the f2fs tree) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc fs/f2fs/checkpoint.c
> index 14ba1519639e,54a1905af052..000000000000
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@@ -1385,27 -1385,6 +1385,26 @@@ static void commit_checkpoint(struct f2
>   	f2fs_submit_merged_write(sbi, META_FLUSH);
>   }
>  =20
>  +static inline u64 get_sectors_written(struct block_device *bdev)
>  +{
> - 	return bdev->bd_part ?
> - 		(u64)part_stat_read(bdev->bd_part, sectors[STAT_WRITE]) : 0;
> ++	return (u64)part_stat_read(bdev, sectors[STAT_WRITE]) : 0;
                                                             ^^^^
With this rmeoved.

>  +}
>  +
>  +u64 f2fs_get_sectors_written(struct f2fs_sb_info *sbi)
>  +{
>  +	if (f2fs_is_multi_device(sbi)) {
>  +		u64 sectors =3D 0;
>  +		int i;
>  +
>  +		for (i =3D 0; i < sbi->s_ndevs; i++)
>  +			sectors +=3D get_sectors_written(FDEV(i).bdev);
>  +
>  +		return sectors;
>  +	}
>  +
>  +	return get_sectors_written(sbi->sb->s_bdev);
>  +}
>  +
>   static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *c=
pc)
>   {
>   	struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(sbi);
> diff --cc fs/f2fs/f2fs.h
> index 5cd1b9f7cc53,49681a8d2b14..000000000000
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> diff --cc fs/f2fs/super.c
> index 47858e0c5e95,af9f449da64b..000000000000
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c

Just a reminder that the above conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/yCpfLPQDDZ9nFjJj8zrYkrI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XxxwACgkQAVBC80lX
0Gw6fgf+KbraBx1jjwvQm/fHrY51Azzhobf/rlWhg5CzNZyaxnKPPoF/efqu9PaF
AYqOWO6+Cd1K8WxOUbnHhQC9s/X63mm1uJbklE+k3mrQJbzvSXZ7pNhfzQVFaoAh
aI31HJdtl2txXbcHzqBvsMu9vZGKLYsIfZJePaqmYkYvNQ7PrKCJRQ1G45CrFKWL
vo9WihOJyvlxhUXzL7OhQE7VBs8cp9vR0B4us5Ra6KGrU4aa2AHeN8eet9AmVEIx
rwpsycnvnlykzUJQcPmDdLFXrtGrYb4/vPbSYMY0lsway/EDLR8zQJ3F7Obugz0t
V90MhFmhQKBu6eCz1+OJpxe94ZOKRQ==
=yKM8
-----END PGP SIGNATURE-----

--Sig_/yCpfLPQDDZ9nFjJj8zrYkrI--
