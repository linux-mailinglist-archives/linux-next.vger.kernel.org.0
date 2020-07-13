Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A394621CCFE
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 04:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgGMCEY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 22:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgGMCEY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jul 2020 22:04:24 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46119C061794;
        Sun, 12 Jul 2020 19:04:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B4n5L2lrmz9sDX;
        Mon, 13 Jul 2020 12:04:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594605862;
        bh=SLsNip8MzIuuBWxGNo3Aw7lVkmNmzXoSEeKWKbVijbc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kv0of1AhZpRE8Ddt03kqMyMEuV2G/jXj+/xAg75j0tsaoT3eR24zlNSuGZ/zcoMwJ
         jm4/bJa3AONTdanFr2ORQOP5uWscWbq0uSMamv0Q+0ffF4vRe0MsIiLZw4RKA2YtzV
         Kv6pDrHnRr1RV9Lt6smkH+p5D+DHkIe8aq/oVqmgiIHYGpJkkzqRXDXU6pmVvZPbah
         HOIHbtgjBlfoBQzQoEkNSDwEBQ4rvYxHdjqV9rFL0pGVePy7XxSRU0I7Nz48r2zAZ7
         klG5Zy0TJsxXXEIfrcXQPjVJiII4FvQCXMXRHPSpkS+ddReBxg53ZZmeCOGcA10yNu
         nhndeRue8Dr4w==
Date:   Mon, 13 Jul 2020 12:04:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Colascione <dancol@google.com>
Subject: Re: linux-next: build failure after merge of the security tree
Message-ID: <20200713120419.33cf7a87@canb.auug.org.au>
In-Reply-To: <20200708140034.546298ff@canb.auug.org.au>
References: <20200708140034.546298ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qz11.Q6hau/JLJMNRKX.pN+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qz11.Q6hau/JLJMNRKX.pN+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Jul 2020 14:00:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the security tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> fs/anon_inodes.c: In function 'anon_inode_make_secure_inode':
> fs/anon_inodes.c:70:10: error: implicit declaration of function 'security=
_inode_init_security_anon'; did you mean 'security_inode_init_security'? [-=
Werror=3Dimplicit-function-declaration]
>    70 |  error =3D security_inode_init_security_anon(
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |          security_inode_init_security
>=20
> Caused by commit
>=20
>   2749d3f84a70 ("Add a new LSM-supporting anonymous inode interface")
>=20
> # CONFIG_SECURITY is not set
>=20
> Also, the explicit include of linux/security.h is missing ...
>=20
> I have added the following patch for today.
>=20
> From b2bae25c9b715e06f7e802ec7b51cfbfec046e6c Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 8 Jul 2020 13:43:01 +1000
> Subject: [PATCH] fix up for "Add a new LSM-supporting anonymous inode int=
erface"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/anon_inodes.c         | 1 +
>  include/linux/security.h | 7 +++++++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
> index f87f221167cf..25d92c64411e 100644
> --- a/fs/anon_inodes.c
> +++ b/fs/anon_inodes.c
> @@ -21,6 +21,7 @@
>  #include <linux/magic.h>
>  #include <linux/anon_inodes.h>
>  #include <linux/pseudo_fs.h>
> +#include <linux/security.h>
> =20
>  #include <linux/uaccess.h>
> =20
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 95c133a8f8bb..7c6b3dcf4721 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -735,6 +735,13 @@ static inline int security_inode_init_security(struc=
t inode *inode,
>  	return 0;
>  }
> =20
> +static inline int security_inode_init_security_anon(struct inode *inode,
> +						    const struct qstr *name,
> +						    const struct inode *context_inode)
> +{
> +	return 0;
> +}
> +
>  static inline int security_old_inode_init_security(struct inode *inode,
>  						   struct inode *dir,
>  						   const struct qstr *qstr,

I am still applying the above patch ...

--=20
Cheers,
Stephen Rothwell

--Sig_/qz11.Q6hau/JLJMNRKX.pN+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8LwSMACgkQAVBC80lX
0GwOgwf/TADeRBMQ/21gx6jwnuTQSZAK2MgEwm/2/Pl0Vk2okh21ptnJ/ICbbGZY
wlfzxLYUx2NM6+oH4ucbJ5CZ/qoEw3Zgww6p+b9KY3X6lDsnovmIwOowC8+4xKIx
mxqjN7XgpSJBj1Dswx43AvSkfvhktdXyyUutgxbHGc2/v3HhoeCy+vXIyk8FKdDm
L6fTuc4gzVlF0WE7yrA9rHiW/Dt3/o47mT6aHgho1rt+fJqaFwq57jbu3tUd081k
41Bmql5XBO8RBECZOcS1NiSzJB/7OHdaT8H60vifvn4z9fXeg3NuDKJFPvFTzIt4
/xu+5+AjqXlIMqHftu2I22T3PU5IxA==
=ysEe
-----END PGP SIGNATURE-----

--Sig_/qz11.Q6hau/JLJMNRKX.pN+--
