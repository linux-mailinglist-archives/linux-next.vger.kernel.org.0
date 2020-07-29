Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6C0232822
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 01:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgG2XfF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 19:35:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51911 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgG2XfE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 19:35:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BH8z96Wy2z9sR4;
        Thu, 30 Jul 2020 09:35:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596065702;
        bh=ndcwEaucb4vCdDAXRw1ne6kVv2n1hBIl3IfbJ5rJC8g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FsXHO1+D7htEoKBHw4W0kOquovx7MLiT0mEdg8Y0KrHzJvBojP7ptzJF87hSamzP0
         LpZ/yxx/u2Ax/OLYDTFSlnzepkDsO1uZttZ5Gr3RE6fj8YwMZggs4Y3lkrwDxbWEwk
         gvLvVYN9OvlHwrFVFjNmUp5cu3/mf6NHSjAAd+K4GmQIYPn8L3HPjQ/qWbPYfStrIb
         jJfrTd6bOZ1VJhyhXX6kAwsoFi5FaMA0qWQ12ISZnjhnX0ffn+ChoLIPxEQSBCjZuP
         A8NtK92lebZvfchHPL4Cx9UJOT9Mez574SUeNs3RMWyfSnJty/BK4zFU1O/r/cHwyq
         d+g0lMXkde19A==
Date:   Thu, 30 Jul 2020 09:35:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the security tree
Message-ID: <20200730093500.334c56cb@canb.auug.org.au>
In-Reply-To: <20200713120419.33cf7a87@canb.auug.org.au>
References: <20200708140034.546298ff@canb.auug.org.au>
        <20200713120419.33cf7a87@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pRcpjNCa9fHwRuWJfEekUaG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pRcpjNCa9fHwRuWJfEekUaG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Jul 2020 12:04:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 8 Jul 2020 14:00:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the security tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > fs/anon_inodes.c: In function 'anon_inode_make_secure_inode':
> > fs/anon_inodes.c:70:10: error: implicit declaration of function 'securi=
ty_inode_init_security_anon'; did you mean 'security_inode_init_security'? =
[-Werror=3Dimplicit-function-declaration]
> >    70 |  error =3D security_inode_init_security_anon(
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |          security_inode_init_security
> >=20
> > Caused by commit
> >=20
> >   2749d3f84a70 ("Add a new LSM-supporting anonymous inode interface")
> >=20
> > # CONFIG_SECURITY is not set
> >=20
> > Also, the explicit include of linux/security.h is missing ...
> >=20
> > I have added the following patch for today.
> >=20
> > From b2bae25c9b715e06f7e802ec7b51cfbfec046e6c Mon Sep 17 00:00:00 2001
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 8 Jul 2020 13:43:01 +1000
> > Subject: [PATCH] fix up for "Add a new LSM-supporting anonymous inode i=
nterface"
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  fs/anon_inodes.c         | 1 +
> >  include/linux/security.h | 7 +++++++
> >  2 files changed, 8 insertions(+)
> >=20
> > diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
> > index f87f221167cf..25d92c64411e 100644
> > --- a/fs/anon_inodes.c
> > +++ b/fs/anon_inodes.c
> > @@ -21,6 +21,7 @@
> >  #include <linux/magic.h>
> >  #include <linux/anon_inodes.h>
> >  #include <linux/pseudo_fs.h>
> > +#include <linux/security.h>
> > =20
> >  #include <linux/uaccess.h>
> > =20
> > diff --git a/include/linux/security.h b/include/linux/security.h
> > index 95c133a8f8bb..7c6b3dcf4721 100644
> > --- a/include/linux/security.h
> > +++ b/include/linux/security.h
> > @@ -735,6 +735,13 @@ static inline int security_inode_init_security(str=
uct inode *inode,
> >  	return 0;
> >  }
> > =20
> > +static inline int security_inode_init_security_anon(struct inode *inod=
e,
> > +						    const struct qstr *name,
> > +						    const struct inode *context_inode)
> > +{
> > +	return 0;
> > +}
> > +
> >  static inline int security_old_inode_init_security(struct inode *inode,
> >  						   struct inode *dir,
> >  						   const struct qstr *qstr, =20
>=20
> I am still applying the above patch ...

The merge window is coming up fast ... is anything happening about this
failure?
--=20
Cheers,
Stephen Rothwell

--Sig_/pRcpjNCa9fHwRuWJfEekUaG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8iB6QACgkQAVBC80lX
0GzbZwgAkghEOIqkc38lNpR+3G5zGuPqdm+/87RV6a8h0Tx4qepWoDDftp5GfM/B
tajGT9dBDA0viLU+zOxjI+sLRPMmVKkI0Yc8y92/JPyGRYllQGaqJ4S7MQIHQIjE
u+zh/38Yz5HsrCnaJ0JjEahG6n60svVkMywMzoM/Qc8GX3QU2a6WAWVJjp0/c36n
0MKoti9Mm9uNUBjpV4m4gBzfBzcb6cSR2E4qGb5ghjvCNXNcmOy7hW/PFEOuvDM3
Mc4WJeMBoFKAu5rU6ijqJl/7ZPq95V+pJqxRrRxQPqUsbNFnEUJOHzDMCvhthfQk
W7xwwSpHvGpsAsQQOZGkDgynz1ZDAw==
=pAvy
-----END PGP SIGNATURE-----

--Sig_/pRcpjNCa9fHwRuWJfEekUaG--
