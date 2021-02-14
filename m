Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F1E31B2A0
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 22:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhBNVGH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 16:06:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229642AbhBNVGG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 16:06:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df0BB1Tr7z9s1l;
        Mon, 15 Feb 2021 08:05:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613336723;
        bh=WB9O3NwLwluqeoZbjk/n4nOKWMZeRe834YwItodk8ts=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RwBCt1f91KLgqr9Bzz7P2JZgoOau9Yo+2osRtt8DP1MKfrID/27xofpR0IYCDOBZ3
         +UbXp+5PkW0tRjRIJgYLuviSYi9q2JYCj5ZzxALk99kusKMt5+L64gtnat2eAyXwUk
         36hBh5JlFUQyRq5CJJ8apZ/eUs9aZ4qL0iYa6jxNDx7p0eAe2t4ilJpMOq+o1QxsKP
         7FQ3h6wq6e7wQYvvnQsH+mNiGuZr86l4iLMqDnJILr4HCtsWUpyk91G9nl3/HS8RWK
         /wIisOhaqVLK5ZC/xvQo3bqE2s7uNwUV3amO3mda0qFhcmCs88sbI3thuFG1EiPHry
         UKhJqaYO5UQ5g==
Date:   Mon, 15 Feb 2021 08:05:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the pidfd tree with the vfs tree
Message-ID: <20210215080521.45f7a061@canb.auug.org.au>
In-Reply-To: <20210125170054.54869988@canb.auug.org.au>
References: <20210125170054.54869988@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YsonmP97_aE=7xy61ZbHC=t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YsonmP97_aE=7xy61ZbHC=t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 17:00:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   fs/namei.c
>=20
> between commit:
>=20
>   e36cffed20a3 ("fs: make unlazy_walk() error handling consistent")
>   1e8f44f159b3 ("do_tmpfile(): don't mess with finish_open()")
>=20
> from the vfs tree and commit:
>=20
>   47291baa8ddf ("namei: make permission helpers idmapped mount aware")
>   ba73d98745be ("namei: handle idmapped mounts in may_*() helpers")
>   549c7297717c ("fs: make helpers idmap mount aware")
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
> diff --cc fs/namei.c
> index 4cae88733a5c,dbf53b325ac9..000000000000
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@@ -1568,14 -1639,18 +1644,16 @@@ static struct dentry *lookup_slow(cons
>   	return res;
>   }
>  =20
> - static inline int may_lookup(struct nameidata *nd)
> + static inline int may_lookup(struct user_namespace *mnt_userns,
> + 			     struct nameidata *nd)
>   {
>   	if (nd->flags & LOOKUP_RCU) {
> - 		int err =3D inode_permission(nd->inode, MAY_EXEC|MAY_NOT_BLOCK);
> + 		int err =3D inode_permission(mnt_userns, nd->inode,
> + 					   MAY_EXEC | MAY_NOT_BLOCK);
>  -		if (err !=3D -ECHILD)
>  +		if (err !=3D -ECHILD || !try_to_unlazy(nd))
>   			return err;
>  -		if (unlazy_walk(nd))
>  -			return -ECHILD;
>   	}
> - 	return inode_permission(nd->inode, MAY_EXEC);
> + 	return inode_permission(mnt_userns, nd->inode, MAY_EXEC);
>   }
>  =20
>   static int reserve_stack(struct nameidata *nd, struct path *link, unsig=
ned seq)
> @@@ -3324,9 -3453,11 +3453,9 @@@ static int do_tmpfile(struct nameidata=20
>   	path.dentry =3D child;
>   	audit_inode(nd->name, child, 0);
>   	/* Don't check for other permissions, the inode was just created */
> - 	error =3D may_open(&path, 0, op->open_flag);
> + 	error =3D may_open(mnt_userns, &path, 0, op->open_flag);
>  -	if (error)
>  -		goto out2;
>  -	file->f_path.mnt =3D path.mnt;
>  -	error =3D finish_open(file, child, NULL);
>  +	if (!error)
>  +		error =3D vfs_open(&path, file);
>   out2:
>   	mnt_drop_write(path.mnt);
>   out:

With the merge window about to open, this is a reminder that this
conflict still exists.

Those vfs tree commits have also been merged into the block tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YsonmP97_aE=7xy61ZbHC=t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApkJEACgkQAVBC80lX
0GwAUwf/dIyjjuYTjmpBpzql0624vvwC31bdowDzGYVDARYWotqxqlLCBZ1xFn5f
LrwA3QWIc4cHs1F0Kv5z7Cu/u3EtRWo/osuNQZoytbdySNbuCQSmtQuWb6ZgEeV+
U78CfUtseMEgCEFZLf+Zq7mFngtpoy0pfkrIwht+znZT8IFTgOAcr3hphWkBg/0V
Ou0/F75pzrnB19kY7n61zp2AhagOalpRovpxPKK+9eeM+YEu01qrY5XB777+SeQS
SK2Kk14HU90KlvbS0qmbNWIytdmsUubcKjx0RaJHZqJanal9zbtdSVfFTQlMsbfS
whUm21jxaBwuCk+2CO/5lM3owOdELA==
=dScR
-----END PGP SIGNATURE-----

--Sig_/YsonmP97_aE=7xy61ZbHC=t--
