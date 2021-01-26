Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04A1E305110
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239317AbhA0ElA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:41:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44379 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388608AbhAZXYc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 18:24:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQN8b40sjz9sS8;
        Wed, 27 Jan 2021 10:23:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611703424;
        bh=1F47ItOEb0qiNrst9O4+9KjL6Os/ZVAcyvvVvnqtNKg=;
        h=Date:From:To:Cc:Subject:From;
        b=YwG226NQUqWc9LksHMxp94qRIjdQw+2S9dhR2pwu+nw9J1RoA6P3J1CfS2XfW1/zT
         Rrj34i/vXUpXYgTEALs9GfmkxRS8J+9B5LmCh/CwCkn27XKwb66XPaPSXB1RCbJAX/
         qk0OLs7HmFr1HQ9FFpP7BjpWjR9H8/pHVyKdt9ViR60s6etHjalBphguL/em6+vMiX
         0qiCG9pJp9IRH/vOhWMh6IJZYQ6X189P0/Idz/Hx12k2k3h9uEWhlZV68pb/0R2ByC
         roXpnS956Ydo7BRyPeGCWHdrNwLT7Xkw/2DjHBCp6CHHJL+8sp092MvBnm+oRnf5CA
         SnIUHOWRPJ1xA==
Date:   Wed, 27 Jan 2021 10:23:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tyler Hicks <tyhicks@canonical.com>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Tycho Andersen <tycho@tycho.pizza>,
        Tyler Hicks <code@tyhicks.com>
Subject: linux-next: manual merge of the ecryptfs tree with the pidfd tree
Message-ID: <20210127102342.0d1852e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/enlKnjlSczDmijv4BS7Bzbs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/enlKnjlSczDmijv4BS7Bzbs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ecryptfs tree got a conflict in:

  fs/ecryptfs/inode.c

between commit:

  c7c7a1a18af4 ("xattr: handle idmapped mounts")

from the pidfd tree and commit:

  0b964446c63f ("ecryptfs: fix uid translation for setxattr on security.cap=
ability")

from the ecryptfs tree.

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
index 55da9a91f51a,58d0f7187997..000000000000
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@@ -1043,10 -1024,11 +1045,11 @@@ ecryptfs_setxattr(struct dentry *dentry
  		rc =3D -EOPNOTSUPP;
  		goto out;
  	}
- 	rc =3D vfs_setxattr(&init_user_ns, lower_dentry, name, value, size,
- 			  flags);
+ 	inode_lock(lower_inode);
 -	rc =3D __vfs_setxattr_locked(lower_dentry, name, value, size, flags, NUL=
L);
++	rc =3D __vfs_setxattr_locked(&init_user_ns, lower_dentry, name, value, s=
ize, flags, NULL);
+ 	inode_unlock(lower_inode);
  	if (!rc && inode)
- 		fsstack_copy_attr_all(inode, d_inode(lower_dentry));
+ 		fsstack_copy_attr_all(inode, lower_inode);
  out:
  	return rc;
  }

--Sig_/enlKnjlSczDmijv4BS7Bzbs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQpH4ACgkQAVBC80lX
0GxBMAf7BTDylCaFc5kcpALvrtiuFnT6pwkJJ8T2dfMpTBB4lFBZTA25ZBt1Rd6S
rT1pgGY2Ig09/GJ7uVtXmuO5qWLXV39Fy41Kl8RV+5Za057icNv7AQYW/7Q1CqSB
VesR4Lks4lS5maGps7eKhKGKcw1Cz5zP3INSWg8azWcbvz23iuVfNO627q3KNGtG
tn58MDaNIk71Ck5z/XjMjQwtzqI9Ivrv4YwzlfRLUpp4ifkXUAoOrUY+6PHzC/sc
f08kYwo8ltFtYJJwfke9kqcrzv5I7xudWcle+OcqUSWGnL2zK86v/+mYv0dwKi9m
uLLzcAEqFAaIZaLNT8Q6K2YVRppa8g==
=kiF9
-----END PGP SIGNATURE-----

--Sig_/enlKnjlSczDmijv4BS7Bzbs--
