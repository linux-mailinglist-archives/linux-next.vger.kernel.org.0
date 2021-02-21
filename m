Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79833320E66
	for <lists+linux-next@lfdr.de>; Sun, 21 Feb 2021 23:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhBUWye (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 17:54:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50491 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231779AbhBUWyd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Feb 2021 17:54:33 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkLG02hhJz9sRN;
        Mon, 22 Feb 2021 09:53:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613948030;
        bh=4/O2JiwVPVpuG+xm9BdGowJkGLilkAkyPpTRjEKIL68=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZJSVEFTjFVlsJNiPZROU0txPaE4rMdsUAY0eIMFcba3cJahR3R+1udt+rCd2hVdgJ
         FNb1BQuX0dnDTL6Yh7MxdneBjKA/zEmbaMRhXYgJp+g8hYh3O3bhiNDY1x/zPEVcp1
         t0t3ZmhQctAzSe9BPeKBqd2FwmlYVASuV7X6ZYaKUxpwKUwODQ1O/Tjjv9FoKIbuL4
         1h+GwugZ9+ff6iHibLvhjqWA3vLW/OEsZOvT21cBMT9/1f1Fmvy8C6tA9YSZd5vbVx
         KIhfj0VlSfyyP2+KkBNF6sGX1oP7CTmmHyF7fGSpCJr3OzmyEEbEg0Hjcmr83GphD9
         fn/C1ZZyYIYXg==
Date:   Mon, 22 Feb 2021 09:53:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>, linux-xfs@vger.kernel.org
Cc:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the xfs tree
Message-ID: <20210222095343.21b5a367@canb.auug.org.au>
In-Reply-To: <20210215084243.6e22abeb@canb.auug.org.au>
References: <20210125171414.41ed957a@canb.auug.org.au>
        <20210127112441.1d07c1d4@canb.auug.org.au>
        <20210215084243.6e22abeb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ENE1_RMIkp8vJ_Pq_Qhb=U8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ENE1_RMIkp8vJ_Pq_Qhb=U8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 08:42:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 27 Jan 2021 11:24:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > On Mon, 25 Jan 2021 17:14:14 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > Today's linux-next merge of the pidfd tree got a conflict in:
> > >=20
> > >   fs/xfs/xfs_inode.c
> > >=20
> > > between commit:
> > >=20
> > >   01ea173e103e ("xfs: fix up non-directory creation in SGID directori=
es")
> > >=20
> > > from the xfs tree and commit:
> > >=20
> > >   f736d93d76d3 ("xfs: support idmapped mounts")
> > >=20
> > > from the pidfd tree.
> > >=20
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your t=
ree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particula=
rly
> > > complex conflicts.
> > >=20
> > > diff --cc fs/xfs/xfs_inode.c
> > > index e2a1db4cee43,95b7f2ba4e06..000000000000
> > > --- a/fs/xfs/xfs_inode.c
> > > +++ b/fs/xfs/xfs_inode.c
> > > @@@ -809,13 -810,13 +810,13 @@@ xfs_init_new_inode
> > >   	inode->i_rdev =3D rdev;
> > >   	ip->i_d.di_projid =3D prid;
> > >  =20
> > >  -	if (pip && XFS_INHERIT_GID(pip)) {
> > >  -		inode->i_gid =3D VFS_I(pip)->i_gid;
> > >  -		if ((VFS_I(pip)->i_mode & S_ISGID) && S_ISDIR(mode))
> > >  -			inode->i_mode |=3D S_ISGID;
> > >  +	if (dir && !(dir->i_mode & S_ISGID) &&
> > >  +	    (mp->m_flags & XFS_MOUNT_GRPID)) {
> > >  +		inode->i_uid =3D current_fsuid();   =20
> >=20
> > Looking a bit harder, I replaced the above line with
> > 		inode->i_uid =3D fsuid_into_mnt(mnt_userns);
> >  =20
> > >  +		inode->i_gid =3D dir->i_gid;
> > >  +		inode->i_mode =3D mode;
> > >   	} else {
> > > - 		inode_init_owner(inode, dir, mode);
> > >  -		inode->i_gid =3D fsgid_into_mnt(mnt_userns);
> > > ++		inode_init_owner(mnt_userns, inode, dir, mode);
> > >   	}
> > >  =20
> > >   	/*   =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.

This is now a conflict between the pidfd tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ENE1_RMIkp8vJ_Pq_Qhb=U8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAy5HcACgkQAVBC80lX
0Gyqpgf+Jj8z5dtQ7dKf2smHeXzpAERxaIjjdhlb6d/6a6gcigP2gYlrur6hpaus
WeeimUG/TFpnqEuZ0cZ5YBvzattapDhnlh7tVDSmzYONudXXuqXKPphduv8GhsNj
28rWcJSd2KnsnBNN28uL66hI8ic+mTBBQGDNEM3gnqvcAJwQxo2BUNrB8e5qSsd6
ciWTuGvLAcrqHEgzDM1kb81cKMVapGSr0DIhzhUT1RaeDA5uKM5d1gCU2JuQMKAk
OUYxG8X1zLZZAe7n8yMo+aGhrPnYFPQGzj+8j5YshGBWJ13C07Z2pDEzaoUy4l8A
eq9Anenwc81RiRqWDXs5/Ycv3tQQYw==
=ykSr
-----END PGP SIGNATURE-----

--Sig_/ENE1_RMIkp8vJ_Pq_Qhb=U8--
