Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D850431B29C
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 22:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhBNVC1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 16:02:27 -0500
Received: from ozlabs.org ([203.11.71.1]:58829 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229642AbhBNVC1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 16:02:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df06130T4z9sBJ;
        Mon, 15 Feb 2021 08:01:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613336505;
        bh=sIk4vHboqvRVldd+TriIN4WMI80LaVIeq9aKW5jZe7o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EKQwDPs8lrxCnTgDiKyRUCRPSldem+en03QljK0SaOAGJLK9i2dV+qlKTOranvdVS
         54mPS+yj+pH6IY6oGmSgJ7CzepmeBpzRDFrAOq9GDfGBDRQ/kZwIxhuGKEynOBqO7o
         zZG701LYVIfNOSrs7+9r4HIeP5KRPl9nFSRMCx8uhuMDfRWMHt9O8yAgopiFtqjEPV
         +zuOE7eAqlBhPcNVsEfxObuKtVTR2Yzuyr+1jM175WcyV0z0tdxvahpSwNE+caKmzW
         h0NB2PPRRx4P2orUvKOQKjE8YaAArCUn7xmQ3QNIok+iEvC9lcsYeOfOtccQceSjsF
         tdAiHA/ul3aBg==
Date:   Mon, 15 Feb 2021 08:01:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the f2fs tree
Message-ID: <20210215080144.73ef0ab5@canb.auug.org.au>
In-Reply-To: <20210125164806.436d51a6@canb.auug.org.au>
References: <20210125164806.436d51a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X_k3QbH70cJunKrMo5drW4t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X_k3QbH70cJunKrMo5drW4t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 16:48:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   fs/f2fs/file.c
>=20
> between commits:
>=20
>   19bb7075d1a9 ("f2fs: fix out-of-repair __setattr_copy()")
>   7cf2e6173b2d ("f2fs: enhance to update i_mode and acl atomically in f2f=
s_setattr()")
>=20
> from the f2fs tree and commit:
>=20
>   2f221d6f7b88 ("attr: handle idmapped mounts")
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
> diff --cc fs/f2fs/file.c
> index 7db27c81d034,8f1e97e7d242..000000000000
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@@ -851,9 -848,9 +852,10 @@@ static void __setattr_copy(struct user_
>   		inode->i_ctime =3D attr->ia_ctime;
>   	if (ia_valid & ATTR_MODE) {
>   		umode_t mode =3D attr->ia_mode;
> + 		kgid_t kgid =3D i_gid_into_mnt(mnt_userns, inode);
>  =20
> - 		if (!in_group_p(inode->i_gid) &&
> - 			!capable_wrt_inode_uidgid(inode, CAP_FSETID))
>  -		if (!in_group_p(kgid) && !capable(CAP_FSETID))
> ++		if (!in_group_p(kgid) &&
> ++			!capable_wrt_inode_uidgid(mnt_userns, inode, CAP_FSETID))
>   			mode &=3D ~S_ISGID;
>   		set_acl_inode(inode, mode);
>   	}
> @@@ -958,14 -948,13 +961,14 @@@ int f2fs_setattr(struct user_namespace=20
>   		spin_unlock(&F2FS_I(inode)->i_size_lock);
>   	}
>  =20
> - 	__setattr_copy(inode, attr);
> + 	__setattr_copy(&init_user_ns, inode, attr);
>  =20
>   	if (attr->ia_valid & ATTR_MODE) {
> - 		err =3D posix_acl_chmod(inode, f2fs_get_inode_mode(inode));
> -=20
> + 		err =3D posix_acl_chmod(&init_user_ns, inode,
> + 				      f2fs_get_inode_mode(inode));
>  -		if (err || is_inode_flag_set(inode, FI_ACL_MODE)) {
>  -			inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
>  +		if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>  +			if (!err)
>  +				inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
>   			clear_inode_flag(inode, FI_ACL_MODE);
>   		}
>   	}

With the merge window about to open, this is a reminder that this
conflict still exists.

The fsf2 tree commits are now

  17232e830afb ("f2fs: enhance to update i_mode and acl atomically in f2fs_=
setattr()")
  2562515f0ad7 ("f2fs: fix out-of-repair __setattr_copy()")

--=20
Cheers,
Stephen Rothwell

--Sig_/X_k3QbH70cJunKrMo5drW4t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApj7gACgkQAVBC80lX
0GwP2Af7BMPnNNFztn/Qdc7NovzbFHd4dWmZhdg5UVW5xhfhvjjZMyB8dnHjwz7h
ZIOztE3srFdGQqmscj4K3TnN9I0NukVhJUziZ5CJ+8sAi7BmkL9W255nanjfV5Vu
uz/Hgf4vTc8VClnFjyOMx4LAWPwMqAqTc+LbU2AdzwDjhOXbG/FrvFiFwuh+4LlV
WnPxFAIMG0llr7oXPXeElLwFoqh9DyU0qgAHeJ0/UoH2EyXBP/kWHVKH/5VDhtWm
Rb/qcHK1FXi8c4qmXqy5nKjIi8uotjB5l11AneZNFdN8/D4Nmi8tPFYnNpSX+39J
L/fs9PgvDQFhpwal9zU/jl/ozUQBUw==
=wbmB
-----END PGP SIGNATURE-----

--Sig_/X_k3QbH70cJunKrMo5drW4t--
