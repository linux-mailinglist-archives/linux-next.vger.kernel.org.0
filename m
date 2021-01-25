Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B913021EB
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 06:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbhAYFs4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 00:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbhAYFsw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 00:48:52 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C26AC061573;
        Sun, 24 Jan 2021 21:48:10 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPJn32BWJz9sCq;
        Mon, 25 Jan 2021 16:48:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611553688;
        bh=Yy97OW1HlRRT+zIS6E9LGuV9vpYiIk3aU2c0XBfOFyM=;
        h=Date:From:To:Cc:Subject:From;
        b=S4XQtpYyVIa2E/6+9u/JO6b4lyIEuAdcf/3y+uHRSi60bEfSfvIpSieH8Nts5CnrV
         MhRZ6Z9xyeEFB/QT6T+WEsVMBISg5Mk/HIeUyUOeI9ib3YVmEt+egOJMooNCEexfzE
         UtmkojpevRx9HqpJpMWcZbETyBqci2pDJgrG1eQrs5cubOZrsLSdRQq316Q9pf+zr8
         Z25QzDb5Vk5plCDCDq/pMUKgYBWOx+L1afViX50AhixLbxTaXge3/+ebMbY9ynAAru
         5UKmhFMH9q5QZ3NkLVlpohRCUvSjiMdPnI4DQF5OeGnIImVMxX8KDOL5dQ3hTbR7eS
         WNv/+MqQ+MqOA==
Date:   Mon, 25 Jan 2021 16:48:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the f2fs tree
Message-ID: <20210125164806.436d51a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vvzOnjdL9kLkBZRXGQJq9Ru";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vvzOnjdL9kLkBZRXGQJq9Ru
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/f2fs/file.c

between commits:

  19bb7075d1a9 ("f2fs: fix out-of-repair __setattr_copy()")
  7cf2e6173b2d ("f2fs: enhance to update i_mode and acl atomically in f2fs_=
setattr()")

from the f2fs tree and commit:

  2f221d6f7b88 ("attr: handle idmapped mounts")
  e65ce2a50cf6 ("acl: handle idmapped mounts")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/file.c
index 7db27c81d034,8f1e97e7d242..000000000000
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@@ -851,9 -848,9 +852,10 @@@ static void __setattr_copy(struct user_
  		inode->i_ctime =3D attr->ia_ctime;
  	if (ia_valid & ATTR_MODE) {
  		umode_t mode =3D attr->ia_mode;
+ 		kgid_t kgid =3D i_gid_into_mnt(mnt_userns, inode);
 =20
- 		if (!in_group_p(inode->i_gid) &&
- 			!capable_wrt_inode_uidgid(inode, CAP_FSETID))
 -		if (!in_group_p(kgid) && !capable(CAP_FSETID))
++		if (!in_group_p(kgid) &&
++			!capable_wrt_inode_uidgid(mnt_userns, inode, CAP_FSETID))
  			mode &=3D ~S_ISGID;
  		set_acl_inode(inode, mode);
  	}
@@@ -958,14 -948,13 +961,14 @@@ int f2fs_setattr(struct user_namespace=20
  		spin_unlock(&F2FS_I(inode)->i_size_lock);
  	}
 =20
- 	__setattr_copy(inode, attr);
+ 	__setattr_copy(&init_user_ns, inode, attr);
 =20
  	if (attr->ia_valid & ATTR_MODE) {
- 		err =3D posix_acl_chmod(inode, f2fs_get_inode_mode(inode));
-=20
+ 		err =3D posix_acl_chmod(&init_user_ns, inode,
+ 				      f2fs_get_inode_mode(inode));
 -		if (err || is_inode_flag_set(inode, FI_ACL_MODE)) {
 -			inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
 +		if (is_inode_flag_set(inode, FI_ACL_MODE)) {
 +			if (!err)
 +				inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
  			clear_inode_flag(inode, FI_ACL_MODE);
  		}
  	}

--Sig_/vvzOnjdL9kLkBZRXGQJq9Ru
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOW5YACgkQAVBC80lX
0GwZKAf9HLOgagwstBoKCeZa0RCVHIzmmg1872d0BhB6tuBpu1gJ/9rPMVy7CKfT
8NtpY+1D9qRvSRadDrFTJRwjkskM+idAplxiQXqB50AMqlgSkT1iY/X2GmCUMCH9
3M0E1ejRS1c+UKTcnMTi0h2YzBRq28toRzyLJRCgsWd6ox6X08PjpyPOTfh+w8Yi
VKewXQ8v2UKgPuIcC/YuThdaD392z9Rv7dfIUpfGXbI20ORpYuoaGZyPVUx4e7ub
Hd9YRDw0L2PyRE358u7mFm8Xh09zsjmTAJzO59J6gPZmQ3+foWYyXxf0tZD1Cd28
G+e8gfsYJgTE7q/8lGjdNjWl5DIBbA==
=3NbC
-----END PGP SIGNATURE-----

--Sig_/vvzOnjdL9kLkBZRXGQJq9Ru--
