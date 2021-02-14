Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CA931B2DF
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 22:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhBNVne (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 16:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhBNVnc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 16:43:32 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0981DC061574;
        Sun, 14 Feb 2021 13:42:52 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df11J0Q0dz9sBJ;
        Mon, 15 Feb 2021 08:42:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613338970;
        bh=2qGQUjtjiY5szmUBqDyEdQtZEt/wvLqBTFy56y1L9H8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QOyTpv5Hsm5C0v7dOnO6XdjIym0ttR+qSz7T9avCK3ncajo6AonNYycUIIW4oB32I
         uuOsOX1vUCm06kJ2ZzAxqL9fUANDlHDOu/QLKxRMMkZ2R/ndwBrHZSmyPXBQVfd6UB
         TIEhvd7U1oZLVkNu4JABrh9ttpsQDgS12hyPcfx4jm0eHexcMSubp2EEDM/6lyaQ9E
         Y/A0UVPk6pa2ymI9LRNHCr6nHab7y2roUQu7SgipXVgeKK5PYSqiVVWy7MyHR2Y+f6
         rX+z3JkZoLKh/t/ClPhktr9aKMRzdPhhulX1rLmFnP+sGPGOMns6jeCEjOndGeZavQ
         Jbb2SR21t8QMw==
Date:   Mon, 15 Feb 2021 08:42:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the xfs tree
Message-ID: <20210215084243.6e22abeb@canb.auug.org.au>
In-Reply-To: <20210127112441.1d07c1d4@canb.auug.org.au>
References: <20210125171414.41ed957a@canb.auug.org.au>
        <20210127112441.1d07c1d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/17JN_MAADh.ZdXqJ=k+5Czd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/17JN_MAADh.ZdXqJ=k+5Czd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 27 Jan 2021 11:24:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Mon, 25 Jan 2021 17:14:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the pidfd tree got a conflict in:
> >=20
> >   fs/xfs/xfs_inode.c
> >=20
> > between commit:
> >=20
> >   01ea173e103e ("xfs: fix up non-directory creation in SGID directories=
")
> >=20
> > from the xfs tree and commit:
> >=20
> >   f736d93d76d3 ("xfs: support idmapped mounts")
> >=20
> > from the pidfd tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc fs/xfs/xfs_inode.c
> > index e2a1db4cee43,95b7f2ba4e06..000000000000
> > --- a/fs/xfs/xfs_inode.c
> > +++ b/fs/xfs/xfs_inode.c
> > @@@ -809,13 -810,13 +810,13 @@@ xfs_init_new_inode
> >   	inode->i_rdev =3D rdev;
> >   	ip->i_d.di_projid =3D prid;
> >  =20
> >  -	if (pip && XFS_INHERIT_GID(pip)) {
> >  -		inode->i_gid =3D VFS_I(pip)->i_gid;
> >  -		if ((VFS_I(pip)->i_mode & S_ISGID) && S_ISDIR(mode))
> >  -			inode->i_mode |=3D S_ISGID;
> >  +	if (dir && !(dir->i_mode & S_ISGID) &&
> >  +	    (mp->m_flags & XFS_MOUNT_GRPID)) {
> >  +		inode->i_uid =3D current_fsuid(); =20
>=20
> Looking a bit harder, I replaced the above line with
> 		inode->i_uid =3D fsuid_into_mnt(mnt_userns);
>=20
> >  +		inode->i_gid =3D dir->i_gid;
> >  +		inode->i_mode =3D mode;
> >   	} else {
> > - 		inode_init_owner(inode, dir, mode);
> >  -		inode->i_gid =3D fsgid_into_mnt(mnt_userns);
> > ++		inode_init_owner(mnt_userns, inode, dir, mode);
> >   	}
> >  =20
> >   	/* =20

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/17JN_MAADh.ZdXqJ=k+5Czd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApmVMACgkQAVBC80lX
0GxW+gf/YjbyJMqn4j4RJwsjc4x2qocPc5otsKvcJ4b/cwtMMZSsK1iQZ4arcYhE
38Z9AthLVwOS7L6BFcjhfIb7kGjryOANzNBcb/XezlUr+0da4e2Sf6yCfKqAZf0O
qgk/KSnUwDRuhJ4SR0k9G1aAzIuChQunPu6xrjg01tTHPMUqzx0kSZcrvVPeZB60
u5V/IDDm9Dqj1aCXLwj65y8M1jWnSN8BCeNy4gpXsYnn5UHA2dvTpi4VbIQRRJDJ
5A8PjhN3/lJnNX41iQYUU5XniYTX5KylGIgO2KHUiiCDjoRmm4mhnEmP6FHRCvJX
cUTHbwQB1czbIas/ML0WAi2c2egz7w==
=VakU
-----END PGP SIGNATURE-----

--Sig_/17JN_MAADh.ZdXqJ=k+5Czd--
