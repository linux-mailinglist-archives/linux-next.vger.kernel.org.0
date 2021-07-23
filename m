Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372C93D311D
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 03:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhGWAa4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 20:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232730AbhGWAaz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jul 2021 20:30:55 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DC4C061575;
        Thu, 22 Jul 2021 18:11:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GWB943lT8z9sT6;
        Fri, 23 Jul 2021 11:11:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1627002681;
        bh=gzVgbvloQdszwTAYgbtGh6vjuS3Z3QGzF5eiNunQcE4=;
        h=Date:From:To:Cc:Subject:From;
        b=K2e090P5W5CYCFxegfNfeBjmzNfYOnkpB/bBJLawGy8x3NQqkzvuyqIgGkXLx0Z2q
         8ZqpgdB69AKDxQ2E0wXdmsIiEpcaO/828NDZkspv/FUrH2nlRnGkJeSRNsSRPLYRnB
         9xQDpDgiSvnUbSsdfB3KQ4+6Vax52OhA86HJbyBOEcmA7Ycubu6SchRNj6/2MsOzRZ
         YlO8gV7CkLuHvfeDZDxFlUex9/77N7bdeNwCWgx+lFVvzBOKQB+kICSJsJQq5vSC2a
         /peIYgOA9SYJvEjLvs8mpAgCEo+noIah5oojPaOJQiwGuOgLB6Qg7uYnYClI7UhaaU
         6YsJ5d1tHi1hw==
Date:   Fri, 23 Jul 2021 11:11:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Jan Kara <jack@suse.cz>
Cc:     Eric Biggers <ebiggers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the f2fs tree
Message-ID: <20210723111119.6b2bf2ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OYT2+qHFpHm+gCfkzpPIRJM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OYT2+qHFpHm+gCfkzpPIRJM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the f2fs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/f2fs/data.c: In function 'f2fs_write_failed':
fs/f2fs/data.c:3144:27: error: 'mapping' undeclared (first use in this func=
tion)
 3144 |   filemap_invalidate_lock(mapping);
      |                           ^~~~~~~

Caused by commit

  ceddc02b7613 ("f2fs: make f2fs_write_failed() take struct inode")

interacting with commit

  edc6d01bad73 ("f2fs: Convert to using invalidate_lock")

from the ext3 tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 23 Jul 2021 10:47:23 +1000
Subject: [PATCH] fxup for "f2fs: Convert to using invalidate_lock"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/f2fs/data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2e6fee68f891..0fb7b69976f1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3141,12 +3141,12 @@ static void f2fs_write_failed(struct inode *inode, =
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
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/OYT2+qHFpHm+gCfkzpPIRJM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD6FzcACgkQAVBC80lX
0Gw+gwf/ef0gpKx8v/8G/Ix31qXzNZi20cXsNi0j+LQP19SRucfdO5LT3A9xi3hQ
inI0R3xaZseKpmA9DSOZedksMWrTGjq6e4LtOr4b3i7UEKeTNWvBmHzqJk7DQHZ6
FFgJjUhHq+N7TXiYNbxRC5gaM4/bauiKI6Wrx86lf6i69xXCe4XYqHTcSweUzSx5
skfzSFXvrYVPKz7yh2qJUdnosC0+xqByPymqNNJqDGRqwWLsuh3EBxziwPgPf0KG
tl5v1UYigmf4j3XerFHPvexBwMjI3xzkxpQa37LeKb5uJkLh5NEV6kZGpFwQQyog
6Eh6QmwgQ+yK/Ytxf9Cf9dyXkDF5vQ==
=4AJA
-----END PGP SIGNATURE-----

--Sig_/OYT2+qHFpHm+gCfkzpPIRJM--
