Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCB131B2AD
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 22:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhBNVPZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 16:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhBNVPX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 16:15:23 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57016C061574;
        Sun, 14 Feb 2021 13:14:43 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df0Nx2DDTz9sBJ;
        Mon, 15 Feb 2021 08:14:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613337281;
        bh=O4f/XmPd5R6DBCRMbM/FNsfExxTs5zrL8gmFNjiXIfY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oX8vsHL0CMz3Z32TdljmoDrksiJu9iv5d6rk+u0+1sVV8ec21Yb32g/65o0T43Uxs
         Y2A4TwE9JF+yr/4X3+nxLdeiHI0qK6o8iNt0RpbghTBKzcBumEOvfKRRU8DMTQk21K
         e7HGwrnevh5DjRav2JBhWUIolwhIWnoRuW6+21mRzBoaHxBzPkPK98XLNVGAO7om3t
         jT3yRLrHaXu+BGL18KwOFJqL+X4Ts0OQeMGZG7NJjkfKd64k+bBnv6199BAoBH2AFf
         68qG586LjGEs7BbGxINqhM8Mazzji/NlJV6QWEFRjrWzrdvPN4CWLpzjswlQ+mGyyn
         VQPGLodmLU3kw==
Date:   Mon, 15 Feb 2021 08:14:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fscache tree with the pidfd
 tree
Message-ID: <20210215081439.1d0b2b33@canb.auug.org.au>
In-Reply-To: <20210127100038.1d04e444@canb.auug.org.au>
References: <20210127100038.1d04e444@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6MFrxJ==dvAl3=xOlfYk.+t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6MFrxJ==dvAl3=xOlfYk.+t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 27 Jan 2021 10:00:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the fscache tree got a conflict in:
>=20
>   include/linux/fs.h
>=20
> between commit:
>=20
>   ba73d98745be ("namei: handle idmapped mounts in may_*() helpers")
>=20
> from the pidfd tree and commit:
>=20
>   0de0bdfa19fa ("vfs: Export rw_verify_area() for use by cachefiles")
>=20
> from the fscache tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/fs.h
> index 7762d3d75230,493804856ab3..000000000000
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@@ -2839,22 -2756,11 +2839,23 @@@ static inline int bmap(struct inode *in
>   }
>   #endif
>  =20
>  -extern int notify_change(struct dentry *, struct iattr *, struct inode =
**);
>  -extern int inode_permission(struct inode *, int);
>  -extern int generic_permission(struct inode *, int);
>  -extern int __check_sticky(struct inode *dir, struct inode *inode);
>  +int notify_change(struct user_namespace *, struct dentry *,
>  +		  struct iattr *, struct inode **);
>  +int inode_permission(struct user_namespace *, struct inode *, int);
>  +int generic_permission(struct user_namespace *, struct inode *, int);
>  +static inline int file_permission(struct file *file, int mask)
>  +{
>  +	return inode_permission(file_mnt_user_ns(file),
>  +				file_inode(file), mask);
>  +}
>  +static inline int path_permission(const struct path *path, int mask)
>  +{
>  +	return inode_permission(mnt_user_ns(path->mnt),
>  +				d_inode(path->dentry), mask);
>  +}
>  +int __check_sticky(struct user_namespace *mnt_userns, struct inode *dir,
>  +		   struct inode *inode);
> + extern int rw_verify_area(int, struct file *, const loff_t *, size_t);
>  =20
>   static inline bool execute_ok(struct inode *inode)
>   {

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/6MFrxJ==dvAl3=xOlfYk.+t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApkr8ACgkQAVBC80lX
0GzFuQf+JyeYI1REWw+v41lt9MiP+7I7154SOYhs6P0X49ZhKR3xczyw1iNwpYYL
tZ4t361z8nN6iw57gejbXpVprs0o05kh2pgrSREXmFZUqwRrxnhelSjRRJy1zKo7
OKEqwwtybQL+de+Jq+B+bxNWXXWPPc1NjxXBpNORgqm6v79HoA4/+G27QPxzuPYI
dIJ9nqz7MZ4OMgxmSUZrUqMAuCzgeBr2k/390Rw3lbThR2bF+IGZHL5JztxdX+0j
ZTBeBq530mYNoHimwu/3WVR90MMVoNQbp2ysdylpF5S9D9GE9Pyb47S0oLffnStT
nuXo0f0b71fdW8KqqrWsUn40AGgefQ==
=wViA
-----END PGP SIGNATURE-----

--Sig_/6MFrxJ==dvAl3=xOlfYk.+t--
