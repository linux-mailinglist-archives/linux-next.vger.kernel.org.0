Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DD331003F
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 23:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhBDWlT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 17:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhBDWlQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Feb 2021 17:41:16 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2DFEC061786;
        Thu,  4 Feb 2021 14:40:35 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWtmX1Ml3z9sXG;
        Fri,  5 Feb 2021 09:40:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612478429;
        bh=Q0CE8Ep1eu9fF9+Qul/4YD1KCn5puP7bmTMT9rt3CcE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AFLIlUPoZ8mmroqOHjOrUGJZtHTA3Ngr4ReexkLlfFPMmipbf31Uj7/QUGcaGVNpN
         VCpICLDfbUFeEPBaKgLeuPnR7uZP54yKAILPXlWZfKlB/fnteitQy3pNbqN3k+7bSE
         ezF2f4ilGHMT35yQJaXp4tBtN7tC+P/MQfA9i5lxxr3udTucgA6VjPTjFY5/2k/Xua
         Z06aelf5iANeeUD6P5VCYzXS/rn5ZVf2wJ5N5H8s4J5Fd+2Hljy8FWGV8VbTZgD0FP
         bAWOTQ7QfMgfO+6gExbDQ91yubPEkGtzzZKb8rJJLsM+g71c694f5lhXOk5qOJqrw7
         g6c8m6EHlXezQ==
Date:   Fri, 5 Feb 2021 09:40:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Miklos Szeredi <miklos@szeredi.hu>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Tycho Andersen <tycho@tycho.pizza>
Subject: Re: linux-next: manual merge of the pidfd tree with the overlayfs
 tree
Message-ID: <20210205094026.1fa71254@canb.auug.org.au>
In-Reply-To: <20210125170716.4d6d83f3@canb.auug.org.au>
References: <20210125170716.4d6d83f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jS/1bIyxCyyMt4+b20Rj_RL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jS/1bIyxCyyMt4+b20Rj_RL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 17:07:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   fs/overlayfs/inode.c
>=20
> between commit:
>=20
>   9c09be9e71c4 ("ovl: perform vfs_getxattr() with mounter creds")
>=20
> from the overlayfs tree and commit:
>=20
>   c7c7a1a18af4 ("xattr: handle idmapped mounts")
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
>=20
> diff --cc fs/overlayfs/inode.c
> index cf41bcb664bc,e78d45dfeaee..000000000000
> --- a/fs/overlayfs/inode.c
> +++ b/fs/overlayfs/inode.c
> @@@ -352,9 -354,7 +354,9 @@@ int ovl_xattr_set(struct dentry *dentry
>   		goto out;
>  =20
>   	if (!value && !upperdentry) {
>  +		old_cred =3D ovl_override_creds(dentry->d_sb);
> - 		err =3D vfs_getxattr(realdentry, name, NULL, 0);
> + 		err =3D vfs_getxattr(&init_user_ns, realdentry, name, NULL, 0);
>  +		revert_creds(old_cred);
>   		if (err < 0)
>   			goto out_drop_write;
>   	}

This is now a conflict between the pidfd tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jS/1bIyxCyyMt4+b20Rj_RL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAcd9oACgkQAVBC80lX
0GwKxgf/TZUI55jlmhdRVGty76Bb/MALu+P0ShEdXjle1sZiJ4snKNCY2pcB7718
1zqPyNx33im9OH/w7VcchMUQUHktv4OTBNE0xDqI+v2pFKW/IDgDWL9dsoftz4jw
Ju7HotlHqqcDcvtjUMLUWJglGoV8ObA0JTb5MC0AlJUUs5whR+vv11GngaaE0xks
l+IP5SnXRvDlfW4TQqPnYxL8I+Tv9Eo+f2LWy/p95WrZGMq0WxynajJ5sqdWGqez
uMujXE6ebxZ2jLssmDkYkyHl8Kt8+jdtJbRhIDw3N8AA8IpeeeZa3nRu8wAeMfbA
iSCzzWoENZVHZUVarUEMiFHUAya2zQ==
=/dYK
-----END PGP SIGNATURE-----

--Sig_/jS/1bIyxCyyMt4+b20Rj_RL--
