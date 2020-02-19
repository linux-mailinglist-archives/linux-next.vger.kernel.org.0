Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C89D4165272
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2020 23:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgBSWXy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Feb 2020 17:23:54 -0500
Received: from ozlabs.org ([203.11.71.1]:53965 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727082AbgBSWXy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Feb 2020 17:23:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48NC1L4Sm0z9sRG;
        Thu, 20 Feb 2020 09:23:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582151031;
        bh=LUDgvdSwYxLSm2ujH88YLkYz8f+r7X9YUZvj7psSYMw=;
        h=Date:From:To:Cc:Subject:From;
        b=MdBwteHmzPo3JsgXveNOGoWTVkStnSrYU2WyiPZUaqRRhnZE+FXcXFE9T7qGBIpKo
         RESFvzDSWiRv7miPSKAggjvJUVvMiXR4PvApMahxIgTiyE7bnF0IK26cwrs2WP+ZED
         86/FSVgC5p5zUFo/UiVuGCjdJkIJOwVdBcIzAJ8DPsjstSQycZbXsrUyBfxzuMorOD
         +yIhOEoe7uNucs5NecgQlp1FLUlw/tuwprJxTl+TKnOHgZhtaH6ad8iGdIp9c+2rj0
         k0Yr8yEt63kWrJ2gttii9LJeL/AJXOg/SqfAJQRsJuPWac7/nuD1ka3+sp11gyKQth
         jfAQP25J2X05A==
Date:   Thu, 20 Feb 2020 09:23:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Nikolay Borisov <nborisov@suse.com>
Subject: linux-next: build failure after merge of the btrfs tree
Message-ID: <20200220092344.2a738574@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HhWZXL8A9/VOX789pJ1LhRS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HhWZXL8A9/VOX789pJ1LhRS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/btrfs/extent-tree.c: In function 'btrfs_alloc_logged_file_extent':
fs/btrfs/extent-tree.c:4425:20: error: passing argument 1 of 'btrfs_pin_ext=
ent' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
 4425 |   btrfs_pin_extent(fs_info, ins->objectid, ins->offset, 1);
      |                    ^~~~~~~
      |                    |
      |                    struct btrfs_fs_info *
fs/btrfs/extent-tree.c:2609:49: note: expected 'struct btrfs_trans_handle *=
' but argument is of type 'struct btrfs_fs_info *'
 2609 | int btrfs_pin_extent(struct btrfs_trans_handle *trans,
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~

Caused by commit

  4e2c2f96e6a3 ("btrfs: Make btrfs_pin_extent take trans handle")

interacting with commit

  bd727173e443 ("btrfs: handle logged extent failure properly")

from the btrfs-fixes tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 20 Feb 2020 09:20:33 +1100
Subject: [PATCH] btrfs: fix for btrfs_pin_extent() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/btrfs/extent-tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
index 56ad0a4ff5ba..9dcd70cc3ca3 100644
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@ -4422,7 +4422,7 @@ int btrfs_alloc_logged_file_extent(struct btrfs_trans=
_handle *trans,
 	ret =3D alloc_reserved_file_extent(trans, 0, root_objectid, 0, owner,
 					 offset, ins, 1);
 	if (ret)
-		btrfs_pin_extent(fs_info, ins->objectid, ins->offset, 1);
+		btrfs_pin_extent(trans, ins->objectid, ins->offset, 1);
 	btrfs_put_block_group(block_group);
 	return ret;
 }
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/HhWZXL8A9/VOX789pJ1LhRS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5NtXAACgkQAVBC80lX
0GxufQf/e3XdeaPJVdcDfX8oGy6W9crlHRnAli6kk/7TKllyFq0an9xB/7Rnq92d
A/UKsx2N4nKnKcJ2Stj8hq2zOzb1WpXVsCLniPkVxjY608ih9hm+sF4li/kvW8Z8
5xEPwNEm72AJn/iFt1WqefjNRI4p0QBfL8w/W2CWb5ZllN8wLjcF00rjb/Tjr5Yb
niPPgCLjLk0YTmxxOdLuqZxMFRxvOhF+1PDncMByWRAIpCrP/Yfb+zUwzpHITSsJ
zmJnR5R+PmRv6PxUwIhfBS75IQnGj/0o7WSD/OrXPV3tOa4YLMWTcYWu6S5T3VUv
DjnvCfuDAk7SkbQtfOF4D3V7VLAfDg==
=/xZK
-----END PGP SIGNATURE-----

--Sig_/HhWZXL8A9/VOX789pJ1LhRS--
