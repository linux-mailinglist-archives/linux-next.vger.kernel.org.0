Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5D5320E6A
	for <lists+linux-next@lfdr.de>; Sun, 21 Feb 2021 23:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhBUW4t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 17:56:49 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38379 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232059AbhBUW4r (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Feb 2021 17:56:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkLJh4glwz9sRN;
        Mon, 22 Feb 2021 09:56:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613948164;
        bh=mDb9WwHcqGhZ4bPpDkU7BjvQ4JztEbZDcd5OtQn9M60=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Hh6SoziSSNowpGMX3kRkdtK2fRkUhdvZZb+gVDkARtzE2EWm8DzV2J2WK2oDEsF5Q
         n/MRR+hfzHbAXuSvlZrZ683u6Si/jO20uR1zBPDMekZWrmnEib96bUyRqNjkKrF/CX
         D48ybrYBPq9bZ7ivsMym8My9ckkCGySlkrbwk7WkAIABhYrix7UBqy4eOx/TxAaLBy
         dvkz3uskIrBdcXi3lGyaVv++pH+8ryeihLJ0jiPo7bYfCEehHRFUpEmsC48jD8+Ynf
         UyRlc4a/H2+gU3uiCWUCREajKAJxA46mbdmL0LxaFeK3ZZWcoi/l+JiA6w1UvnrGCM
         +sZ1wjx7MvDxg==
Date:   Mon, 22 Feb 2021 09:56:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the xfs tree with the pidfd tree
Message-ID: <20210222095604.1e63eaaf@canb.auug.org.au>
In-Reply-To: <20210215094131.7b47c1c5@canb.auug.org.au>
References: <20210208103348.1a0beef9@canb.auug.org.au>
        <20210215094131.7b47c1c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RZeV=9Mhs3FldC0XQDQoHZI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RZeV=9Mhs3FldC0XQDQoHZI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 09:41:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 8 Feb 2021 10:33:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the xfs tree got a conflict in:
> >=20
> >   fs/xfs/xfs_ioctl.c
> >=20
> > between commit:
> >=20
> >   f736d93d76d3 ("xfs: support idmapped mounts")
> >=20
> > from the pidfd tree and commit:
> >=20
> >   7317a03df703 ("xfs: refactor inode ownership change transaction/inode=
/quota allocation idiom")
> >=20
> > from the xfs tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc fs/xfs/xfs_ioctl.c
> > index 3d4c7ca080fb,248083ea0276..000000000000
> > --- a/fs/xfs/xfs_ioctl.c
> > +++ b/fs/xfs/xfs_ioctl.c
> > @@@ -1280,9 -1275,9 +1280,10 @@@ xfs_ioctl_setattr_prepare_dax
> >    */
> >   static struct xfs_trans *
> >   xfs_ioctl_setattr_get_trans(
> > - 	struct file		*file)
> >  -	struct xfs_inode	*ip,
> > ++	struct file		*file,
> > + 	struct xfs_dquot	*pdqp)
> >   {
> >  +	struct xfs_inode	*ip =3D XFS_I(file_inode(file));
> >   	struct xfs_mount	*mp =3D ip->i_mount;
> >   	struct xfs_trans	*tp;
> >   	int			error =3D -EROFS;
> > @@@ -1470,9 -1461,9 +1469,9 @@@ xfs_ioctl_setattr
> >  =20
> >   	xfs_ioctl_setattr_prepare_dax(ip, fa);
> >  =20
> > - 	tp =3D xfs_ioctl_setattr_get_trans(file);
> >  -	tp =3D xfs_ioctl_setattr_get_trans(ip, pdqp);
> > ++	tp =3D xfs_ioctl_setattr_get_trans(file, pdqp);
> >   	if (IS_ERR(tp)) {
> > - 		code =3D PTR_ERR(tp);
> > + 		error =3D PTR_ERR(tp);
> >   		goto error_free_dquots;
> >   	}
> >  =20
> > @@@ -1615,7 -1599,7 +1606,7 @@@ xfs_ioc_setxflags
> >  =20
> >   	xfs_ioctl_setattr_prepare_dax(ip, &fa);
> >  =20
> > - 	tp =3D xfs_ioctl_setattr_get_trans(filp);
> >  -	tp =3D xfs_ioctl_setattr_get_trans(ip, NULL);
> > ++	tp =3D xfs_ioctl_setattr_get_trans(filp, NULL);
> >   	if (IS_ERR(tp)) {
> >   		error =3D PTR_ERR(tp);
> >   		goto out_drop_write; =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.

This is now a conflict between the pidfd tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/RZeV=9Mhs3FldC0XQDQoHZI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAy5QQACgkQAVBC80lX
0Gyt/QgAg6nywpR7+H3R+TIxr7Ww32PrnCqnq3RwYLG+y8N4hMR3B4WPqMR99UWs
YljuazspcYx4n/T13b06yVMfmvkgt8xE54nT3vLG4ghv8zLlBu4sCBnii/8+QSak
z78WGednA8sVQEdiu2Xd7bXdKczQlcWb7RTjJhSEXnZG+Ru69IjGqyCwam1pshfF
wP7gpK3qs3MYpVGfbWow+fYlkcOksoxCmmhclQgwKatV3eYPw7zSxm4UduPcjxEr
P+LjOPOk4FvCAo+unHpxi80XOSQUssixgk2+SMa0/mRr9oRVLo/ToyIzRikFcIyS
bNT+3+fKJYdEo5bm+II950JLFgjtTw==
=Lzdc
-----END PGP SIGNATURE-----

--Sig_/RZeV=9Mhs3FldC0XQDQoHZI--
