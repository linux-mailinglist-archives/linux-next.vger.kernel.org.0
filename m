Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3B93B1123
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 02:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhFWAvr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 20:51:47 -0400
Received: from ozlabs.org ([203.11.71.1]:34569 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbhFWAvq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 20:51:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8l5b0DMCz9sS8;
        Wed, 23 Jun 2021 10:49:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624409364;
        bh=YdkEJgsORvn1PaXEMnVX3ZVxplLEgLM5bOYVMsSeeY0=;
        h=Date:From:To:Cc:Subject:From;
        b=HEgH2AwnKcazyBaX2A/3/R22nXFhsGDSt+IutNCz/HRL+he9ESZXw4ULqUhjHpUq6
         K8EX/5D/DswT8ncgaJNnmU2UVsSVUdxNYDd6iPT/nGIvh68Pr32ZRXWkwKx5QK9rSB
         XxmzURoRdOEa0IMdlz8OGZJxt0m5zqpWXftEkGiUP4bABWh6nS91djl46WD2SKU62t
         e1NVN4wtfth98q7tEQvIy8bkx68ThNNm3HrwAGJYQGgD3jzwZaDG6pIq5P3tyKj4BF
         SS/vMUIYNe0Iro7lT30/iPOQtISbGMWb4mzTfMaR3+pkpKkt33wWwyC6WXlDYAi/9K
         N0JxuKwh6giMQ==
Date:   Wed, 23 Jun 2021 10:49:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Jan Kara <jack@suse.cz>
Cc:     Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the f2fs tree
Message-ID: <20210623104922.30a5a3fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/st8K.Kvp/4WqFNY==dY70J0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/st8K.Kvp/4WqFNY==dY70J0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the f2fs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/f2fs/data.c: In function 'f2fs_migrate_blocks':
fs/f2fs/data.c:3853:27: error: 'struct f2fs_inode_info' has no member named=
 'i_mmap_sem'
 3853 |  down_write(&F2FS_I(inode)->i_mmap_sem);
      |                           ^~
fs/f2fs/data.c:3895:25: error: 'struct f2fs_inode_info' has no member named=
 'i_mmap_sem'
 3895 |  up_write(&F2FS_I(inode)->i_mmap_sem);
      |                         ^~

Caused by commit

  7cc52cc33717 ("f2fs: swap: support migrating swapfile in aligned write mo=
de")

interacting with commit

  c3762b9d26e1 ("f2fs: Convert to using invalidate_lock")

from the ext3 tree.

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 23 Jun 2021 10:40:54 +1000
Subject: [PATCH] fix up for "f2fs: Convert to using invalidate_lock"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/f2fs/data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2fc1b71c640b..acf2dea65abc 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3850,7 +3850,7 @@ static int f2fs_migrate_blocks(struct inode *inode, b=
lock_t start_blk,
 	int ret =3D 0;
=20
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	down_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_lock(inode->i_mapping);
=20
 	set_inode_flag(inode, FI_ALIGNED_WRITE);
=20
@@ -3892,7 +3892,7 @@ static int f2fs_migrate_blocks(struct inode *inode, b=
lock_t start_blk,
 	clear_inode_flag(inode, FI_DO_DEFRAG);
 	clear_inode_flag(inode, FI_ALIGNED_WRITE);
=20
-	up_write(&F2FS_I(inode)->i_mmap_sem);
+	filemap_invalidate_unlock(inode->i_mapping);
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
=20
 	return ret;
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/st8K.Kvp/4WqFNY==dY70J0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDShRIACgkQAVBC80lX
0GzdWQf9HyNWdrhmCfenE9eySb7gpIHSz++WMhKpO0XU/zKDQydqEKkR/Guzhtrb
fhCwkkseKfGFDlKLoRgmYV7YJ9ebA1mPcSWw0valYt+J3xuOzmQbridZUCQiTHse
B9u+xgORDMIc/RFco319iwtTxF8UmG4mJ10HEfVinv0mCFGP1i3U86wnbP2BpF2V
GAZem4n/X+7VsY7yCEC4crDNJ0XknWRTlIL6YxDThxUZQeTvG0QYYPWGTy7j6IIJ
aScVRbkXRF9kC82t+vxW78ox/fzgl8FVX+gDEUox4Qlbmr/GQKRy7cqn9kzXG1vt
zOiHuBKRXbQfV6SWOk2sIaX6lCStKA==
=SjXT
-----END PGP SIGNATURE-----

--Sig_/st8K.Kvp/4WqFNY==dY70J0--
