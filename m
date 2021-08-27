Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A05B3F9153
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 02:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243853AbhH0A3c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 20:29:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54359 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230522AbhH0A3c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Aug 2021 20:29:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwgYk0Gxwz9sVq;
        Fri, 27 Aug 2021 10:28:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630024123;
        bh=ba/WX581s3nrnsRLf23mdp32UzwwN0XGlSwedK1OmqA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O+UDBGuHfNTr3cc4y236nGvtcLrz7yZsdGP9QGU/xn8aWZpH7RxWUPqI8LFoI9/IK
         CBgW8OJ3XU/01e3mDBiz+5g79TWigohsJv3QIyXivDMifoDDMrCZZeAc/OzU4qc076
         b7xXPq+J/xFfxXUVBSmnghxBKTAEyoNBd/wbcGugFRXNb6pCPJk5DdDtP2PW9mK6v7
         eheSJAPYfJszGZgk6c5CyPQhD62BojE1uhtWgICyIiTezkyRzc+32PIfNRwp9GKMMP
         FIgov8Pn39VY2eawI2A5ip6tbAgxgqam/BmKGNpe0j4jzVanIW/+vCZligunalLDtc
         b9KmVpMuv4yqA==
Date:   Fri, 27 Aug 2021 10:28:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Jan Kara <jack@suse.cz>
Cc:     Eric Biggers <ebiggers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the f2fs tree
Message-ID: <20210827102840.386cdf1b@canb.auug.org.au>
In-Reply-To: <20210723111119.6b2bf2ca@canb.auug.org.au>
References: <20210723111119.6b2bf2ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=zd67Dy6Or6wtgpygpXKrqt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=zd67Dy6Or6wtgpygpXKrqt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 23 Jul 2021 11:11:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the f2fs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> fs/f2fs/data.c: In function 'f2fs_write_failed':
> fs/f2fs/data.c:3144:27: error: 'mapping' undeclared (first use in this fu=
nction)
>  3144 |   filemap_invalidate_lock(mapping);
>       |                           ^~~~~~~
>=20
> Caused by commit
>=20
>   ceddc02b7613 ("f2fs: make f2fs_write_failed() take struct inode")
>=20
> interacting with commit
>=20
>   edc6d01bad73 ("f2fs: Convert to using invalidate_lock")
>=20
> from the ext3 tree.
>=20
> I have applied the following merge fix patch.
>=20

This fix up patch is now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 27 Aug 2021 10:10:01 +1000
Subject: [PATCH] fxup for "f2fs: Convert to using invalidate_lock"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/f2fs/data.c | 4 ++--
 fs/f2fs/file.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b03ec36cce1c..0facb5eb0acb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3260,12 +3260,12 @@ static void f2fs_write_failed(struct inode *inode, =
loff_t to)
 	/* In the fs-verity case, f2fs_end_enable_verity() does the truncate */
 	if (to > i_size && !f2fs_verity_in_progress(inode)) {
 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-		filemap_invalidate_lock(mapping);
+		filemap_invalidate_lock(inode->i_mapping);
=20
 		truncate_pagecache(inode, i_size);
 		f2fs_truncate_blocks(inode, i_size, true);
=20
-		filemap_invalidate_unlock(mapping);
+		filemap_invalidate_unlock(inode->i_mapping);
 		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	}
 }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 884a165e70eb..9c8ef33bd8d3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1112,7 +1112,7 @@ static int punch_hole(struct inode *inode, loff_t off=
set, loff_t len)
 			blk_end =3D (loff_t)pg_end << PAGE_SHIFT;
=20
 			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-			filemap_invalidate_lock(mapping);
+			filemap_invalidate_lock(inode->i_mapping);
=20
 			truncate_pagecache_range(inode, blk_start, blk_end - 1);
=20
@@ -1120,7 +1120,7 @@ static int punch_hole(struct inode *inode, loff_t off=
set, loff_t len)
 			ret =3D f2fs_truncate_hole(inode, pg_start, pg_end);
 			f2fs_unlock_op(sbi);
=20
-			filemap_invalidate_unlock(mapping);
+			filemap_invalidate_unlock(inode->i_mapping);
 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		}
 	}
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/=zd67Dy6Or6wtgpygpXKrqt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEoMbgACgkQAVBC80lX
0GwChAgAoqZc+XTR+YgJAbXa5v7L826LVZhfQVHAqkBHqiEUqVEfxBSu/SyR7zFr
JrnoCflv21w2T8WVXTI0JJTg75dDC1s2qenIgx6I7fXQeoJEAqQyWQiR9NuWjAqT
eP3QhA3+I6f2E2uI8jUvKdhnhffkEr8el77RQ+viGOuj4VD+Ph+pNtuDJwnRNv59
wDcZ82aOKQWG74s2pbXexKNfqI+nYol9zzTCY4zLJ/XyyaR60/uGON/LAxbz4VPd
e4itzX8BhpJe5f8tArrjDIXiCRS7lrfwambE8B3FyY8/vHNFh/vXq7JxU58OnfCJ
8QPEWQqE1J+fph2MCaNLS9LEUF3FRQ==
=5Ob8
-----END PGP SIGNATURE-----

--Sig_/=zd67Dy6Or6wtgpygpXKrqt--
