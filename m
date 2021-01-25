Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDC03021A2
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 06:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbhAYFYX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 00:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbhAYFYW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 00:24:22 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F51EC061573;
        Sun, 24 Jan 2021 21:23:42 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPJDm5KT6z9sVS;
        Mon, 25 Jan 2021 16:23:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611552218;
        bh=FPt1PXLmp2TZo2ef/NIp7OyF/2BaOYxPd9SrPJl1dyY=;
        h=Date:From:To:Cc:Subject:From;
        b=NKwgbUVtfoVdC7+3vf+GgDlL90j2rd0k2mcOHgydF3bz8jOIO9lQgsBNE94H3riKL
         XG2r6iYxGGkZYO5HpCYKyJZ3i1hg2rb28zz//SVdPGLYOvw+paNePJlS/2TpCw4CH4
         8+p7ia7nX68v1qXk2pbnu1gsiD31v2F9XYKYX0bQjIeOmc/YHZH/hP486msq3tnshA
         wg592U0gFBLld1cfl1xNiKPR8tNqDez3Ncoyg60mqn0ryg78B28icrYXcSwFStrFwM
         7rMLH9lolZ0Wrh6LQuNuO7BzQwrabe+ToniW/MUtqzEiKTxnPHMtALHlXz6du+KMaE
         pq+V0u2BovI3g==
Date:   Mon, 25 Jan 2021 16:23:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Miklos Szeredi <miklos@szeredi.hu>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Tycho Andersen <tycho@tycho.pizza>
Subject: linux-next: manual merge of the pidfd tree with the overlayfs tree
Message-ID: <20210125162336.470e3183@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YvLZhwTuqxN6yof2SjV4/Nc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YvLZhwTuqxN6yof2SjV4/Nc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/ecryptfs/inode.c

between commit:

  176cfe865da6 ("ecryptfs: fix uid translation for setxattr on security.cap=
ability")

from the overlayfs tree and commit:

  c7c7a1a18af4 ("xattr: handle idmapped mounts")

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

diff --cc fs/ecryptfs/inode.c
index 58d0f7187997,55da9a91f51a..000000000000
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@@ -1024,11 -1043,10 +1045,12 @@@ ecryptfs_setxattr(struct dentry *dentry
  		rc =3D -EOPNOTSUPP;
  		goto out;
  	}
 -	rc =3D vfs_setxattr(&init_user_ns, lower_dentry, name, value, size,
 -			  flags);
 +	inode_lock(lower_inode);
- 	rc =3D __vfs_setxattr_locked(lower_dentry, name, value, size, flags, NUL=
L);
++	rc =3D __vfs_setxattr_locked(&init_user_ns, lower_dentry, name,
++				   value, size, flags, NULL);
 +	inode_unlock(lower_inode);
  	if (!rc && inode)
 -		fsstack_copy_attr_all(inode, d_inode(lower_dentry));
 +		fsstack_copy_attr_all(inode, lower_inode);
  out:
  	return rc;
  }

--Sig_/YvLZhwTuqxN6yof2SjV4/Nc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOVdgACgkQAVBC80lX
0GxG+Af9GzZ7SSGXPeMBJXxkpNAq6LewBXOlbJCGA09W5N7NpXyx/55e649AtkDL
ugz3gSIUDGyxYx6K1h4pU6FAADpHsAi5d92SnYMrfgS1Gpw+oyrLGPOrBZYbnWm6
RGl9ZnMjulGzfefss1U2WxfNZ3iDIGnaGqP3k6nreRbcCbzF/2aJvX8t/NKvJnEE
T92DSQAxT3fTHPaSERIJ6XEdN6zbfxO44CsrUDBy0vfYs7U4NdfbUbqPGHNA3Qz0
/6hv90jwcv1VgMYvX9WfLzG0GYwj7UkMiOiD2ef/ehmclc2EPzvpiliwg8vi4sfY
td47eFbkOpfGDZq/ZW4Mq++qwJnPFw==
=dVMD
-----END PGP SIGNATURE-----

--Sig_/YvLZhwTuqxN6yof2SjV4/Nc--
