Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920E731B2E9
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 22:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhBNVz0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 16:55:26 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44565 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229916AbhBNVzY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 16:55:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df1H56J3xz9sBJ;
        Mon, 15 Feb 2021 08:54:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613339683;
        bh=rSziHQV/XJEOgd3BmUVRbc/ESDHp9C1z4u52Aopv7C0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U64fYY+PSseT/EBzVVV/awLp02Y3jnX7ezr3dmF+4Mx9nconlSdNRj7RFwX0hCXrp
         LKk41lDNJqeOfbCOpiH9dMVuwsX30ae9EiJ54GTTmlClj3pJKHGpfoYYfF5YXdkzS+
         8ZmXgFfW7v3xzS80e/z3sz/UzD5gOZjm3Gh48/+TboD7wrz71WnWZytYIGDt3+7qw8
         lVkQX5Gli50ivKVXvzfnxCGZQX3lRm/upPMBLYBKSA91MfoCxkon+EFPs9YiKJP8t6
         T0ZGWmokpJ2zSlQYM3nbJWB3NoyUYT5i6qUy6F+ZYi7OA2IcQxdM6AUaoaOCBKruDs
         bpCGOWBQbkfKg==
Date:   Mon, 15 Feb 2021 08:54:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miaohe Lin <linmiaohe@huawei.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 pidfd tree
Message-ID: <20210215085441.48edb08f@canb.auug.org.au>
In-Reply-To: <20210127224351.486fd977@canb.auug.org.au>
References: <20210127224351.486fd977@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gXprDNJReIyVl2/Z1xMAvbJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gXprDNJReIyVl2/Z1xMAvbJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 27 Jan 2021 22:43:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   fs/hugetlbfs/inode.c
>=20
> between commit:
>=20
>   2f221d6f7b88 ("attr: handle idmapped mounts")
>=20
> from the pidfd tree and commit:
>=20
>   57d3629b7a9a ("hugetlbfs: remove useless BUG_ON(!inode) in hugetlbfs_se=
tattr()")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc fs/hugetlbfs/inode.c
> index c5c32eb59498,ca9e25427f2d..000000000000
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@@ -760,9 -766,7 +767,7 @@@ static int hugetlbfs_setattr(struct use
>   	unsigned int ia_valid =3D attr->ia_valid;
>   	struct hugetlbfs_inode_info *info =3D HUGETLBFS_I(inode);
>  =20
> - 	BUG_ON(!inode);
> -=20
>  -	error =3D setattr_prepare(dentry, attr);
>  +	error =3D setattr_prepare(&init_user_ns, dentry, attr);
>   	if (error)
>   		return error;
>  =20

With the merge window about to open, this is a reminder that this
conflict still exists.

The akpm-current commit is now

  b557c21f61f8 ("hugetlbfs: remove useless BUG_ON(!inode) in hugetlbfs_seta=
ttr()")

--=20
Cheers,
Stephen Rothwell

--Sig_/gXprDNJReIyVl2/Z1xMAvbJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApnCEACgkQAVBC80lX
0GxEIAf/ee0nvD4UNBcR0p6tOhjkeo5MnF6SHhDiSY8wmAXAHD510PovXrhtg0Z6
Zd5Hc7R7UQ5nDvsV9TIr/3pBzF2/5mSs+tObCDj8fTIGHaMzr3XtEUP7BCAnJ9Uf
s4wl2/xrSqkXNx9HJ7eEd7wK++83aXwuK7JWDJQFVL6pQlWCNlcw35t4kNBEC3NV
EoTq8ZAljjt01hoL/n1MPXWwSduLLM1s8lKIjImgtu440ghIVtfi2y3pY1Wn1yth
/8uY+iwjq3nJj8MqwRYiPj5H5qUKElp+5O95E7J8g6NDJ09UvMA0ftfo9f5GKks4
uxqLI07Qv4yirdG3mR7oxytDIV1u3A==
=T1mQ
-----END PGP SIGNATURE-----

--Sig_/gXprDNJReIyVl2/Z1xMAvbJ--
