Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9669730220B
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 07:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbhAYGPA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 01:15:00 -0500
Received: from ozlabs.org ([203.11.71.1]:47377 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbhAYGO5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Jan 2021 01:14:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPKMB6CVXz9sS8;
        Mon, 25 Jan 2021 17:14:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611555255;
        bh=Ut/fFn4kETlfw8FIktdwRPKBuDMq0Oo4wQyuP+bntZc=;
        h=Date:From:To:Cc:Subject:From;
        b=s6Ymgs0YRnNq1q5dSLIuvBWbpMUwfl9H3gj+jHjUlRHPFR29+w4pFJ5U0oVY3Izf8
         eenRt7+XpU0sO+jdSrBEji0aDbgAQMDNZWhVs66BXzyKOwPndeFqv4g4PIQJzvT8Aq
         UdXENZiTwRZAFbRVCJ/ZP9YGpNED/oQQfqHnhqYUYQMRKmpCYhuliPYyjlyO3DuLMC
         OeXfR5rNX0JK3d0YtVOmXfwPXPctw5qdKcAlGWOLh4E1kPdno/bdPIm1EPcFfQB03o
         k4vF686bXixKmMwurx0z/qVv+W1F3GT749UJe7kwhkAi4GAMwGF6VHi2TSqYuDlfQn
         zInvDdmxUeuTg==
Date:   Mon, 25 Jan 2021 17:14:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the xfs tree
Message-ID: <20210125171414.41ed957a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z_k.r3XxHa=_3.RlzMH+/Th";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z_k.r3XxHa=_3.RlzMH+/Th
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/xfs/xfs_inode.c

between commit:

  01ea173e103e ("xfs: fix up non-directory creation in SGID directories")

from the xfs tree and commit:

  f736d93d76d3 ("xfs: support idmapped mounts")

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

diff --cc fs/xfs/xfs_inode.c
index e2a1db4cee43,95b7f2ba4e06..000000000000
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@@ -809,13 -810,13 +810,13 @@@ xfs_init_new_inode
  	inode->i_rdev =3D rdev;
  	ip->i_d.di_projid =3D prid;
 =20
 -	if (pip && XFS_INHERIT_GID(pip)) {
 -		inode->i_gid =3D VFS_I(pip)->i_gid;
 -		if ((VFS_I(pip)->i_mode & S_ISGID) && S_ISDIR(mode))
 -			inode->i_mode |=3D S_ISGID;
 +	if (dir && !(dir->i_mode & S_ISGID) &&
 +	    (mp->m_flags & XFS_MOUNT_GRPID)) {
 +		inode->i_uid =3D current_fsuid();
 +		inode->i_gid =3D dir->i_gid;
 +		inode->i_mode =3D mode;
  	} else {
- 		inode_init_owner(inode, dir, mode);
 -		inode->i_gid =3D fsgid_into_mnt(mnt_userns);
++		inode_init_owner(mnt_userns, inode, dir, mode);
  	}
 =20
  	/*

--Sig_/Z_k.r3XxHa=_3.RlzMH+/Th
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOYbYACgkQAVBC80lX
0Gwalwf+Jb/6xvzPgL/wE/D9U352Cd/j3gmeB/rrkmZt71DHqlNT4aNkeXg8E20r
Cm2uk8J9CUodQ70VNWbhOF1o8kpGouLvk8q43QUGk9SrkfswpMzYRbcGaGeahQ2D
994wCjRkGhEiKGEZRMeH/9SEOMNnzVHAGtHU67P+43wIx52ohd+l432xi18dIFN/
SeZ6dN4wpJnLsaQyuICjF/qJlA0XL1E93zeAfiFVQH5hBVEQd4Kn32cxl7970lu0
qcOLjt6Wqn/P6hKh60V+bwTsvyZUDHkkiUrVA+ziBI4ZXuSv1txYa7bPBHIhTmxg
t7NX/YDbmA9KwhxBGBprnJLgJp7mCQ==
=bBhL
-----END PGP SIGNATURE-----

--Sig_/Z_k.r3XxHa=_3.RlzMH+/Th--
