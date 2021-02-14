Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADFB31B317
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 23:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhBNWmR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 17:42:17 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57501 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229793AbhBNWmQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 17:42:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df2K841kYz9rx8;
        Mon, 15 Feb 2021 09:41:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613342493;
        bh=QLZBeFxDio/kBYUVXICWtsw0jOXBe2K+8pgxtSzlIVs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Jo7lsxxSqfKMkqZOS+H/WoXGH9/HCgqkcmXuvcFy9REyapOoi/gKHyrw5P8WR+vuP
         lFs1eWNIi5/eCvOo6ZEIIkgJ751PXAeKTuGgVZkkL2KFukbsvwuT/Lz3oK4iHdRFM9
         w/P6rKHOMdc1WfZB/l11PjYYpO4el1F+np79X/8lo43u5ahU3hMoaEwVSv8GRPO1eh
         XH3GPe0Se1r9x9P1fEIY2q6oyGYPnCd8v8OZ4D7eQiF+cp1Y37AMCrfifkODA9zYql
         NS99rxFymkkfhM5BAJES6TSdojftnn/FbyuCJWuVzZwg7gYVDGR8IHo4Q5VwNXzCxb
         JI5M3BHK9CE3w==
Date:   Mon, 15 Feb 2021 09:41:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the xfs tree with the pidfd tree
Message-ID: <20210215094131.7b47c1c5@canb.auug.org.au>
In-Reply-To: <20210208103348.1a0beef9@canb.auug.org.au>
References: <20210208103348.1a0beef9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6AZ6gwpjRrqFrLqMtudqeMW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6AZ6gwpjRrqFrLqMtudqeMW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 8 Feb 2021 10:33:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the xfs tree got a conflict in:
>=20
>   fs/xfs/xfs_ioctl.c
>=20
> between commit:
>=20
>   f736d93d76d3 ("xfs: support idmapped mounts")
>=20
> from the pidfd tree and commit:
>=20
>   7317a03df703 ("xfs: refactor inode ownership change transaction/inode/q=
uota allocation idiom")
>=20
> from the xfs tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc fs/xfs/xfs_ioctl.c
> index 3d4c7ca080fb,248083ea0276..000000000000
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@@ -1280,9 -1275,9 +1280,10 @@@ xfs_ioctl_setattr_prepare_dax
>    */
>   static struct xfs_trans *
>   xfs_ioctl_setattr_get_trans(
> - 	struct file		*file)
>  -	struct xfs_inode	*ip,
> ++	struct file		*file,
> + 	struct xfs_dquot	*pdqp)
>   {
>  +	struct xfs_inode	*ip =3D XFS_I(file_inode(file));
>   	struct xfs_mount	*mp =3D ip->i_mount;
>   	struct xfs_trans	*tp;
>   	int			error =3D -EROFS;
> @@@ -1470,9 -1461,9 +1469,9 @@@ xfs_ioctl_setattr
>  =20
>   	xfs_ioctl_setattr_prepare_dax(ip, fa);
>  =20
> - 	tp =3D xfs_ioctl_setattr_get_trans(file);
>  -	tp =3D xfs_ioctl_setattr_get_trans(ip, pdqp);
> ++	tp =3D xfs_ioctl_setattr_get_trans(file, pdqp);
>   	if (IS_ERR(tp)) {
> - 		code =3D PTR_ERR(tp);
> + 		error =3D PTR_ERR(tp);
>   		goto error_free_dquots;
>   	}
>  =20
> @@@ -1615,7 -1599,7 +1606,7 @@@ xfs_ioc_setxflags
>  =20
>   	xfs_ioctl_setattr_prepare_dax(ip, &fa);
>  =20
> - 	tp =3D xfs_ioctl_setattr_get_trans(filp);
>  -	tp =3D xfs_ioctl_setattr_get_trans(ip, NULL);
> ++	tp =3D xfs_ioctl_setattr_get_trans(filp, NULL);
>   	if (IS_ERR(tp)) {
>   		error =3D PTR_ERR(tp);
>   		goto out_drop_write;

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/6AZ6gwpjRrqFrLqMtudqeMW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAppxsACgkQAVBC80lX
0GwZZAf/YbK/41Cdc4yYXPJk1ft3VGQWAqH4hk7tvT+ncycbyk/JAcm+HIvOVByo
oQ9kW89RXjF+AQ7RPTYZDUkI6vtauSwR+9TbAEWgMz2hRybCKID0oeBPHttdPFrR
kF1lGQivugLXrfJVLUBuxFMEIgSyFPcc9cNsjyncKPM67eTg7iRde/sdf6Y/Aocw
YOvcODmDxCgkFZkOyX+UWfz9cRFD7gBXep5MbBKbo70k1Q29kx3bVuyg2JZrAGBU
Hgn0i8Frs/WnasKlMAoOQu7HL+02gBXGPYOEI62y6DFCy1K/8aft3zo4kDef6BPi
yN8l8EZnPJdCEGWJvmSg/G0rbJX+jA==
=dApK
-----END PGP SIGNATURE-----

--Sig_/6AZ6gwpjRrqFrLqMtudqeMW--
