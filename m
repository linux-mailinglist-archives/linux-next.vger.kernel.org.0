Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3653C39F0
	for <lists+linux-next@lfdr.de>; Sun, 11 Jul 2021 05:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhGKDLM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 10 Jul 2021 23:11:12 -0400
Received: from ozlabs.org ([203.11.71.1]:42403 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhGKDLM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 10 Jul 2021 23:11:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GMsKh02Jfz9sV8;
        Sun, 11 Jul 2021 13:08:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625972905;
        bh=FCzrGFMTObuvMe3Hkq733uYhG0HSm0RVx+WqY/yPfWw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=h+SsfMmQ4gNTc+PzEIZ6fjMqWEyki1+Mj0XFkwk3NXOnNyObHtaZPNIjtvF0wS6TD
         wdq03+eQ9I7oy/ikUa6uCUv4QS/zUW2RYjIyGltqXTDqeci21/rduLkaKrrDbmUDIf
         m0PEMwTYtEjolrEWXJz6D0bymKqqqDEoelokDhhV550A3Uv2EYP7iYA2GDPCr6aQd4
         M+u4NxHf/4OyLufSC3ddUEslRIMsAkKgxfXuypAsofXxqXqNedNpoTjocwWoI95ngm
         qIsemn5QgR39rNm+RLgvc8MJFmA2pqYh0of/CvgBVnfWQ8SmewBsQbec101ZJe2Dzd
         UkkD1+p1bkSGQ==
Date:   Sun, 11 Jul 2021 13:08:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jan Kara <jack@suse.cz>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        Chao Yu <yuchao0@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the f2fs tree
Message-ID: <20210711130823.1a70c5a2@canb.auug.org.au>
In-Reply-To: <20210623104922.30a5a3fa@canb.auug.org.au>
References: <20210623104922.30a5a3fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dm/3KX=7WzPdsieGDeA=Wdh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Dm/3KX=7WzPdsieGDeA=Wdh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 23 Jun 2021 10:49:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the f2fs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> fs/f2fs/data.c: In function 'f2fs_migrate_blocks':
> fs/f2fs/data.c:3853:27: error: 'struct f2fs_inode_info' has no member nam=
ed 'i_mmap_sem'
>  3853 |  down_write(&F2FS_I(inode)->i_mmap_sem);
>       |                           ^~
> fs/f2fs/data.c:3895:25: error: 'struct f2fs_inode_info' has no member nam=
ed 'i_mmap_sem'
>  3895 |  up_write(&F2FS_I(inode)->i_mmap_sem);
>       |                         ^~
>=20
> Caused by commit
>=20
>   7cc52cc33717 ("f2fs: swap: support migrating swapfile in aligned write =
mode")
>=20
> interacting with commit
>=20
>   c3762b9d26e1 ("f2fs: Convert to using invalidate_lock")
>=20
> from the ext3 tree.
>=20
> I have applied the following merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 23 Jun 2021 10:40:54 +1000
> Subject: [PATCH] fix up for "f2fs: Convert to using invalidate_lock"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/f2fs/data.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2fc1b71c640b..acf2dea65abc 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3850,7 +3850,7 @@ static int f2fs_migrate_blocks(struct inode *inode,=
 block_t start_blk,
>  	int ret =3D 0;
> =20
>  	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> -	down_write(&F2FS_I(inode)->i_mmap_sem);
> +	filemap_invalidate_lock(inode->i_mapping);
> =20
>  	set_inode_flag(inode, FI_ALIGNED_WRITE);
> =20
> @@ -3892,7 +3892,7 @@ static int f2fs_migrate_blocks(struct inode *inode,=
 block_t start_blk,
>  	clear_inode_flag(inode, FI_DO_DEFRAG);
>  	clear_inode_flag(inode, FI_ALIGNED_WRITE);
> =20
> -	up_write(&F2FS_I(inode)->i_mmap_sem);
> +	filemap_invalidate_unlock(inode->i_mapping);
>  	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> =20
>  	return ret;

This is now a conflict between the ext3 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Dm/3KX=7WzPdsieGDeA=Wdh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDqYKcACgkQAVBC80lX
0GwfIwf/T2llTXLMj/1TNjpeCHjPXCMIBCN2tpIu9sjjvIt7/K4l+esJ5XP63p0B
AHxlN7LLMpZPEIJ9i4DJsSdGa2o0lXtK/9eR+8tQBA7i7n0/fo8PmY37kfK1cd8g
KoK5xfH+F0zqlwg/aNgeLu+gbsAiA28kjeieQQnqndQrcZZHnR6rJZLslkJ9ZZu8
LegsUGZ57Mmy5yIwu7O28VxzFRft0TbR7K5/MRThHKk94o2sDf2jmQ1nt9r1nQ6L
oE21IIhGVaKMzphqovPxSgM3dABiVcubi/i5RZsRwCJ2xjhgbX7XdLX0hx44ZnNm
oqBMJjEm8mHf1bzWVrzeM5Lw8BtcJA==
=zqFg
-----END PGP SIGNATURE-----

--Sig_/Dm/3KX=7WzPdsieGDeA=Wdh--
