Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB46C31B294
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 21:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhBNU6v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 15:58:51 -0500
Received: from ozlabs.org ([203.11.71.1]:45385 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229793AbhBNU6v (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 15:58:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df01q6qNWz9s1l;
        Mon, 15 Feb 2021 07:58:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613336288;
        bh=S20dwKB7J1DZIwKxyV5nBgybKjkHri0MVz3GQG3VMK4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KXM7C+hEX6G/dlA4EtR0oJgaUQHiCtM0B1zSvDQqkeEEQGdia8kyj4aFfrUhHhDmD
         ZAEHFH6OVHwqAFmbPMMmZ/Ej9ZE0hvwszVUmzrsvsJY6mRwV3xoPDgnAb10na7TPEN
         N/0TpFOvXpUt7yA7/31Y1lMGV3xfa6uhN8Fpdoqo6TJKTroCc33C+yb7Tk8HO5eBYm
         ZTUlsNm28S5jzuRvOxbHH6KzlecovhjOEFL6uYHncMzh4MrE0Zu+8Ly5WbSFR6+4Iy
         dgKTNRGOara4cGYN1Hf5hQOXRySDXCQJ4gOHx6IEuiJQ10qOzTAFanVpNHR0I/ZGcM
         oZVz+83wL1emQ==
Date:   Mon, 15 Feb 2021 07:58:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the f2fs tree
Message-ID: <20210215075806.6bdb990c@canb.auug.org.au>
In-Reply-To: <20210125163255.1a87bba4@canb.auug.org.au>
References: <20210125163255.1a87bba4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/phq6OF9FbTSb8sRHXbnEUYf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/phq6OF9FbTSb8sRHXbnEUYf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 16:32:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   fs/f2fs/acl.c
>=20
> between commit:
>=20
>   7cf2e6173b2d ("f2fs: enhance to update i_mode and acl atomically in f2f=
s_setattr()")
>=20
> from the f2fs tree and commit:
>=20
>   e65ce2a50cf6 ("acl: handle idmapped mounts")
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
> diff --cc fs/f2fs/acl.c
> index 732ec10e7890,a19e86c9adac..000000000000
> --- a/fs/f2fs/acl.c
> +++ b/fs/f2fs/acl.c
> @@@ -200,27 -200,6 +200,27 @@@ struct posix_acl *f2fs_get_acl(struct i
>   	return __f2fs_get_acl(inode, type, NULL);
>   }
>  =20
>  +static int f2fs_acl_update_mode(struct inode *inode, umode_t *mode_p,
>  +			  struct posix_acl **acl)
>  +{
>  +	umode_t mode =3D inode->i_mode;
>  +	int error;
>  +
>  +	if (is_inode_flag_set(inode, FI_ACL_MODE))
>  +		mode =3D F2FS_I(inode)->i_acl_mode;
>  +
>  +	error =3D posix_acl_equiv_mode(*acl, &mode);
>  +	if (error < 0)
>  +		return error;
>  +	if (error =3D=3D 0)
>  +		*acl =3D NULL;
> - 	if (!in_group_p(inode->i_gid) &&
> - 	    !capable_wrt_inode_uidgid(inode, CAP_FSETID))
> ++	if (!in_group_p(i_gid_into_mnt(&init_user_ns, inode)) &&
> ++	    !capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_FSETID))
>  +		mode &=3D ~S_ISGID;
>  +	*mode_p =3D mode;
>  +	return 0;
>  +}
>  +
>   static int __f2fs_set_acl(struct inode *inode, int type,
>   			struct posix_acl *acl, struct page *ipage)
>   {

With the merge window about to open, this is a reminder that this
conflict still exists.

The f2fs tree commit is now

  17232e830afb ("f2fs: enhance to update i_mode and acl atomically in f2fs_=
setattr()")

--=20
Cheers,
Stephen Rothwell

--Sig_/phq6OF9FbTSb8sRHXbnEUYf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApjt4ACgkQAVBC80lX
0GxPSwf9G0wF6SYjgscITgT9JfqUN+WzQGna/uBkj90PKDBtOE+ZZF6Jkpag3tNx
+rpfzvgENq6QyjAhnb6qC3TqD0K0t5OYmG57n1DOEkJ4rystIrS4BNg+qX5KGlLs
FPOmKvFN4q/ZcnIoOIVlODOqQP/G++n06jgfvMiihvlCLferCNsLau0POmmmxAnN
ryQ+I0tvX+x3RMTct1dzXrgHGfi9LSEAKU3mAoa81EQbZilkTrrc6AqfLosED6Do
Wm9asxjLZoqeWqSal7xkC45F8apSxy+JiJahOwa4LW0wiW+rSHBBFlwyI+U/vUDk
6o8fDq+Yhgvn0PpHYaeCXwz/tyHkOg==
=N6Cb
-----END PGP SIGNATURE-----

--Sig_/phq6OF9FbTSb8sRHXbnEUYf--
