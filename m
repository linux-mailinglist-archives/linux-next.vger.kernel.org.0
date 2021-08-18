Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8F03F0EB0
	for <lists+linux-next@lfdr.de>; Thu, 19 Aug 2021 01:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234919AbhHRXjw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Aug 2021 19:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234889AbhHRXjv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Aug 2021 19:39:51 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99176C061764;
        Wed, 18 Aug 2021 16:39:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GqkrH2g1Dz9sCD;
        Thu, 19 Aug 2021 09:39:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629329951;
        bh=kKEePCdpnsgLL0cYj2Gl6xKm6IynRHinLW/FV1ku9UA=;
        h=Date:From:To:Cc:Subject:From;
        b=iSX2uVw43RnKTCXWriXrPgz2oSpc6j2UvBSqm99Vhy88cqJPveNooJAreDR3LLKBP
         o/E7QKRFY1ovRESGPw3iH+FPqCrkWKX+yVupMnD2BSYhpC72pGipMN1QQf3hynjzni
         K/gg06BhE8Flmcy7FIv08MDZNQ4eSTjDNmaYeI4hii2NK+lF+O0ZRDrsFIS4r0xqse
         PvEnRf6KLxn/Fw3GwPOua7mOGu97haKebf6jjlvOP8NvrfOfJ4nVTuCz3Itk5Cfzmo
         Xp7TPH91F/ZcS+fcjlWJGobdADMP8FsEe35SsBT30xe5qU3TPQqhdjF0fkGes4Y5+i
         NLC87EoTUtISg==
Date:   Thu, 19 Aug 2021 09:39:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the overlayfs tree
Message-ID: <20210819093910.55f96720@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tZ.8Jlv1y24eJx6I72QWSVh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tZ.8Jlv1y24eJx6I72QWSVh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the overlayfs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/ntfs3/file.c:1231:13: error: initialization of 'struct posix_acl * (*)(s=
truct inode *, int,  bool)' {aka 'struct posix_acl * (*)(struct inode *, in=
t,  _Bool)'} from incompatible pointer type 'struct posix_acl * (*)(struct =
inode *, int)' [-Werror=3Dincompatible-pointer-types]
 1231 |  .get_acl =3D ntfs_get_acl,
      |             ^~~~~~~~~~~~
fs/ntfs3/file.c:1231:13: note: (near initialization for 'ntfs_file_inode_op=
erations.get_acl')

Caused by commit

  0cad6246621b ("vfs: add rcu argument to ->get_acl() callback")

interacting with commits

  4534a70b7056 ("fs/ntfs3: Add headers and misc files")
  82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
  4342306f0f0d ("fs/ntfs3: Add file operations and implementation")

from the ntfs3 tree.

I have added the following merge resolution patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 19 Aug 2021 09:31:21 +1000
Subject: [PATCH] ntfs3: fix up for "vfs: add rcu argument to ->get_acl() ca=
llback"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/ntfs3/ntfs_fs.h | 2 +-
 fs/ntfs3/xattr.c   | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 0c3ac89c3115..a0655b8b7be1 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -787,7 +787,7 @@ int ntfs_cmp_names_cpu(const struct cpu_str *uni1, cons=
t struct le_str *uni2,
=20
 /* globals from xattr.c */
 #ifdef CONFIG_NTFS3_FS_POSIX_ACL
-struct posix_acl *ntfs_get_acl(struct inode *inode, int type);
+struct posix_acl *ntfs_get_acl(struct inode *inode, int type, bool rcu);
 int ntfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
 		 struct posix_acl *acl, int type);
 int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 98871c895e77..9239c388050e 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -539,8 +539,11 @@ static struct posix_acl *ntfs_get_acl_ex(struct user_n=
amespace *mnt_userns,
  *
  * inode_operations::get_acl
  */
-struct posix_acl *ntfs_get_acl(struct inode *inode, int type)
+struct posix_acl *ntfs_get_acl(struct inode *inode, int type, bool rcu)
 {
+	if (rcu)
+		return ERR_PTR(-ECHILD);
+
 	/* TODO: init_user_ns? */
 	return ntfs_get_acl_ex(&init_user_ns, inode, type, 0);
 }
@@ -640,7 +643,7 @@ static int ntfs_xattr_get_acl(struct user_namespace *mn=
t_userns,
 	if (!(inode->i_sb->s_flags & SB_POSIXACL))
 		return -EOPNOTSUPP;
=20
-	acl =3D ntfs_get_acl(inode, type);
+	acl =3D ntfs_get_acl(inode, type, false);
 	if (IS_ERR(acl))
 		return PTR_ERR(acl);
=20
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/tZ.8Jlv1y24eJx6I72QWSVh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEdmh4ACgkQAVBC80lX
0GyR1wf/fTDmlk70M++s983WWXSug6CxcjOYauA/Z1xx5njKGwLEi24QDtskYI4H
z0Fedr/A69x9yMAWKLsOz6ewcrltK8shDZEKURKYz0DvATwJAYVN/R8erIBpj52D
ZD/ON89DRj9WCXrnmpEDEMWZFMs4oJ5iDjd3eXAHOJfDOhWgNe0YYxmPRTKtDGO/
O1jOp+rRHo7rt+p4K5Gz7+9iPUrgC23VxBhr+VWtHPkovOpn9TA4Znl+DWyBSuwC
EHVS3NL5pJpcgsK6xQktTfAiV3lgSf30tgBI1jf1DFG1h0kEvjCsM2KO45knAmfT
QEdG5MQXZ+MUg3GKWz2fxkzqv/0Xbw==
=S0dB
-----END PGP SIGNATURE-----

--Sig_/tZ.8Jlv1y24eJx6I72QWSVh--
