Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5614B3054BB
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 08:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhA0Hcm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 02:32:42 -0500
Received: from ozlabs.org ([203.11.71.1]:45449 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S317618AbhA0AZ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 19:25:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQPVz6zzKz9sVn;
        Wed, 27 Jan 2021 11:24:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611707084;
        bh=wxcrmcFKLcpmBfDwHHqxzsVjsKMNHYMHtVTwR7K7A8M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KBqDiHsTqz6q07nKZ/c4wL2/JyZRz3SAZNgRtdXBQ7TPEhQfFbiuPew74EIRRu73U
         m+quntsAzwvjgIaHUsJEOI81gmx2vWNNeXC1hGM3cF2UcX8MLxNsKOOcky60sOWBqD
         H7ZdowInjEY9Pk+RfrV7TIDivRmnlwKy/0fyvV7HulDdcDkWi+wF/hJsWUiA2NZTke
         2MCG8cEkScqna03raVHJMeU09ViL4TAMmoY2Lh1fsW/k9bOLlKSG6cSTRJ07qF5qwr
         BCcH6U1CwDHIFsy5d/GU0wLD9EMLt7NidO9zQhvQK4OAsHBscanrI693mrFXSxbf9e
         3jwctmL3DyfsQ==
Date:   Wed, 27 Jan 2021 11:24:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the xfs tree
Message-ID: <20210127112441.1d07c1d4@canb.auug.org.au>
In-Reply-To: <20210125171414.41ed957a@canb.auug.org.au>
References: <20210125171414.41ed957a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/is=.Kudvs87+PhegErpkY=s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/is=.Kudvs87+PhegErpkY=s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 17:14:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   fs/xfs/xfs_inode.c
>=20
> between commit:
>=20
>   01ea173e103e ("xfs: fix up non-directory creation in SGID directories")
>=20
> from the xfs tree and commit:
>=20
>   f736d93d76d3 ("xfs: support idmapped mounts")
>=20
> from the pidfd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc fs/xfs/xfs_inode.c
> index e2a1db4cee43,95b7f2ba4e06..000000000000
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@@ -809,13 -810,13 +810,13 @@@ xfs_init_new_inode
>   	inode->i_rdev =3D rdev;
>   	ip->i_d.di_projid =3D prid;
>  =20
>  -	if (pip && XFS_INHERIT_GID(pip)) {
>  -		inode->i_gid =3D VFS_I(pip)->i_gid;
>  -		if ((VFS_I(pip)->i_mode & S_ISGID) && S_ISDIR(mode))
>  -			inode->i_mode |=3D S_ISGID;
>  +	if (dir && !(dir->i_mode & S_ISGID) &&
>  +	    (mp->m_flags & XFS_MOUNT_GRPID)) {
>  +		inode->i_uid =3D current_fsuid();

Looking a bit harder, I replaced the above line with
		inode->i_uid =3D fsuid_into_mnt(mnt_userns);

>  +		inode->i_gid =3D dir->i_gid;
>  +		inode->i_mode =3D mode;
>   	} else {
> - 		inode_init_owner(inode, dir, mode);
>  -		inode->i_gid =3D fsgid_into_mnt(mnt_userns);
> ++		inode_init_owner(mnt_userns, inode, dir, mode);
>   	}
>  =20
>   	/*

--=20
Cheers,
Stephen Rothwell

--Sig_/is=.Kudvs87+PhegErpkY=s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQsskACgkQAVBC80lX
0Gyopwf+MTSEq9Q8h1tsi2YkgSc6nKqer6DFyTX7rMlvCMpiDX8OpVp54nZ7oZAl
HDo4Q4soJs887yjd23HL+4nLBIl4xYx39IRbJnkfPjPROu56xGgUKEwESBU3daLn
KFIQX26KvxK6y7Sl9iwTJWom0kwQBJSkGb7GSSrwLoerAdvil7vUwROV3Pbqg0+L
Fr59B/5cP6PfJpk6YqxBI3MrLn5q+y1ANyBU87RWTnCc6pIeqvHR6ppIqIRf19vA
XOGoHJ6T+mzoxxW9L6juii11MT0u8+MGnAjSKJJH/12T4WGXViiZw9NP2m5qB3nZ
ja6ck9FfT24AHQQlMpxEjhm3kQEbaw==
=Dkxo
-----END PGP SIGNATURE-----

--Sig_/is=.Kudvs87+PhegErpkY=s--
