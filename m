Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1AD310045
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 23:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhBDWmv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 17:42:51 -0500
Received: from ozlabs.org ([203.11.71.1]:51715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229570AbhBDWmu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Feb 2021 17:42:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWtpP6f3Tz9sXV;
        Fri,  5 Feb 2021 09:42:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612478526;
        bh=kgPiXobXWCzpuQ5Qby9aTYfVkJGLPUyeovINaG7dujc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZgYRlS17iBcW0Zbei/z/SxT3z+Rgua7LjucEIInw1Gg2wUAKN2a+XIqiyYT+Zutug
         Kgpvdsb/AyZz1t4qiQHGbLcpFS3iQQp44SZQ+DSyfvBbqWdzhbUAE1paAOh1NBWrbn
         rmlcsQZMoy+IkAJMhuR5TU34/14IH3atcKRpXwWt4I5+EG9yxHxnrR3SYE13fyy3SQ
         8vcvcZv6wBVNqLrJRm/7MIR3YPNYvGVMt0mmEaUX4NDiklOppnZgy75LMrcEUFjQbD
         UaKcfI013F67sgMZ55+PLfpE5Lnw+wSEzdQk+uOJTaK2x3fXW97Ldj2hnmcSao/RFS
         KUCfKjZ8DBXqQ==
Date:   Fri, 5 Feb 2021 09:42:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Miklos Szeredi <miklos@szeredi.hu>,
        Amir Goldstein <amir73il@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Tycho Andersen <tycho@tycho.pizza>
Subject: Re: linux-next: manual merge of the pidfd tree with the overlayfs
 tree
Message-ID: <20210205094205.6a7490b4@canb.auug.org.au>
In-Reply-To: <20210125170426.3b941eac@canb.auug.org.au>
References: <20210125170426.3b941eac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6vsz7iF=v0ud_Wv=RC2zKlJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6vsz7iF=v0ud_Wv=RC2zKlJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 17:04:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   fs/overlayfs/copy_up.c
>=20
> between commit:
>=20
>   06896fa3193d ("ovl: skip getxattr of security labels")
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
> diff --cc fs/overlayfs/copy_up.c
> index 0fed532efa68,f81b836c2256..000000000000
> --- a/fs/overlayfs/copy_up.c
> +++ b/fs/overlayfs/copy_up.c
> @@@ -84,18 -84,10 +84,18 @@@ int ovl_copy_xattr(struct super_block *
>  =20
>   		if (ovl_is_private_xattr(sb, name))
>   			continue;
>  +
>  +		error =3D security_inode_copy_up_xattr(name);
>  +		if (error < 0 && error !=3D -EOPNOTSUPP)
>  +			break;
>  +		if (error =3D=3D 1) {
>  +			error =3D 0;
>  +			continue; /* Discard */
>  +		}
>   retry:
> - 		size =3D vfs_getxattr(old, name, value, value_size);
> + 		size =3D vfs_getxattr(&init_user_ns, old, name, value, value_size);
>   		if (size =3D=3D -ERANGE)
> - 			size =3D vfs_getxattr(old, name, NULL, 0);
> + 			size =3D vfs_getxattr(&init_user_ns, old, name, NULL, 0);
>  =20
>   		if (size < 0) {
>   			error =3D size;
> @@@ -115,7 -107,14 +115,7 @@@
>   			goto retry;
>   		}
>  =20
> - 		error =3D vfs_setxattr(new, name, value, size, 0);
>  -		error =3D security_inode_copy_up_xattr(name);
>  -		if (error < 0 && error !=3D -EOPNOTSUPP)
>  -			break;
>  -		if (error =3D=3D 1) {
>  -			error =3D 0;
>  -			continue; /* Discard */
>  -		}
> + 		error =3D vfs_setxattr(&init_user_ns, new, name, value, size, 0);
>   		if (error) {
>   			if (error !=3D -EOPNOTSUPP || ovl_must_copy_xattr(name))
>   				break;

This is now a conflict between the pidfd tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6vsz7iF=v0ud_Wv=RC2zKlJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAceD0ACgkQAVBC80lX
0GxIogf+K010SSwvpw7+SIrrJ1SLRwfOvwHgNKvoY0UXHUIl6Wjw93RJceDzxkI/
Q4hO5UvGLHs+pp6oXR9EwQ6ZLG3UIbkcLsgurn6nj+c8bBM+0b4MSdJhoHIUbdr3
QWQytdViSQRro3qxr7A3alS9gQfP7SAVukv5LWScAsj7jIiWekMy0/zRu8OZLEcH
4DkJiPSPmBsyqgr/l7Q8/SmbzyaMfLgZFIGtWXh44g+YTzaB4aVAuUyJDiaafvj1
lzhaiyrPp92QzFt+evChRMFf6mtJ6Y+/EQFeZHnRo7Rlnlbm0FYZDbtc3Bl7R5Ym
S2sejF/19q+6+O6WSmre13j0bGBgFg==
=svTN
-----END PGP SIGNATURE-----

--Sig_/6vsz7iF=v0ud_Wv=RC2zKlJ--
