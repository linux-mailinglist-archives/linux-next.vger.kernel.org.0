Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77CD305B33
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 13:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237699AbhA0MYQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 07:24:16 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52419 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237410AbhA0MWF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 07:22:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQjPs54tSz9sW8;
        Wed, 27 Jan 2021 23:21:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611750082;
        bh=UfNGUfM995PcFnJYUV9J9+OfoDl0+xLA7gSY70r/wZo=;
        h=Date:From:To:Cc:Subject:From;
        b=AN1UymtRunCn3A0AVoZM7xjRfpxDgBp+XmHdHyzJ/jqe7WWiBuB5DGxEb9GITw7kU
         ebxwUTfMxVTx/XbLryuRd19Y57ivBwe+PfOGVTMAReBpy5P+HicoKERQQGSltggWcB
         xNCAlxckpfaR2evmgYN9KTe2tJjOP6uIEUZYM0+eQN3QPC/Xg8rPrKHMKxXSjlcfiS
         U7rWNDv9J/4U8kb456S3WmI2Q/hcPFCqccWKQvsScp56ZnO3T+UwyuF5vkkXuaFg/n
         s0bGxpr6AQvFpVxLOEGN9KDZ3FrLryh4Ve2GXvSwKMeW5VgF+vM4oMKuCF2/BuiW5P
         m9i8uQlDRhv1w==
Date:   Wed, 27 Jan 2021 23:21:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210127232118.668e1bb3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Rc3+lbp0viBXaM=JShX5kEQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Rc3+lbp0viBXaM=JShX5kEQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/ramfs/inode.c:175:13: error: initialization of 'int (*)(struct user_name=
space *, struct inode *, struct dentry *, umode_t)' {aka 'int (*)(struct us=
er_namespace *, struct inode *, struct dentry *, short unsigned int)'} from=
 incompatible pointer type 'int (*)(struct inode *, struct dentry *, umode_=
t)' {aka 'int (*)(struct inode *, struct dentry *, short unsigned int)'} [-=
Werror=3Dincompatible-pointer-types]
  175 |  .tmpfile =3D ramfs_tmpfile,
      |             ^~~~~~~~~~~~~
fs/ramfs/inode.c:175:13: note: (near initialization for 'ramfs_dir_inode_op=
erations.tmpfile')

Caused by commit

  5567a1a4b1c3 ("ramfs: support O_TMPFILE")

interacting with commit

  549c7297717c ("fs: make helpers idmap mount aware")

from the pidfd tree.

I have applied this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 27 Jan 2021 23:10:31 +1100
Subject: [PATCH] ramfs-support-O_TMPFILE-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/ramfs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ramfs/inode.c b/fs/ramfs/inode.c
index b4a37102adf2..ba8e20584811 100644
--- a/fs/ramfs/inode.c
+++ b/fs/ramfs/inode.c
@@ -151,7 +151,8 @@ static int ramfs_symlink(struct user_namespace *mnt_use=
rns, struct inode *dir,
 	return error;
 }
=20
-static int ramfs_tmpfile(struct inode *dir, struct dentry *dentry, umode_t=
 mode)
+static int ramfs_tmpfile(struct user_namespace *mnt_userns, struct inode *=
dir,
+			 struct dentry *dentry, umode_t mode)
 {
 	struct inode *inode;
=20
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/Rc3+lbp0viBXaM=JShX5kEQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmARWr4ACgkQAVBC80lX
0GyKHAgAj4pN8wLjECk3xPLVb5K1dRflADXlYTEGz355Ym1PwNZO2nXlrNsOgnqd
QMCARPEgSwCpK2uBpMmyax26XV7ZrOv7bYFDp4wwc1gD6P7abUYiOfjkMFeVxFx7
oJtnERYApfy5W7yHCCEEBx/cHtICS6hwRBdmw4PHW2qrv5s209NWNYfDICaWouuW
zqZAp4mvbdz51QqRnuW595vsPGIZhTL+7TgAFxI2fpLye4sJdlQcdfcGOTPVR00e
RMsqQJzpdwXSMWx9XxhWvsFGFiXUGM6KtA65RFVliyttb307kKtxA3fv2kTyPaH+
rB8JpJV3TyRZFdhuTvp/g2nS4N7FUg==
=k15L
-----END PGP SIGNATURE-----

--Sig_/Rc3+lbp0viBXaM=JShX5kEQ--
