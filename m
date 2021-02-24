Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7DDE324700
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 23:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbhBXWlM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 17:41:12 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55981 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233034AbhBXWlM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Feb 2021 17:41:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dm9qK1MwTz9sBJ;
        Thu, 25 Feb 2021 09:40:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614206429;
        bh=b05Fb7o6LzFTPcIbyK4o9E56pZmtjgEQ6n2K4zQbSaw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k0pzCgwMMXofPCNkKrzE0XRQMibJl83I4vaomicY0O1Diyra8Frd3dlEVMZ2Z6mvN
         mkFql5CqwiMa2HMrYul3SiZpNVvyxIJsLS+PN1ZQNcaJDNoCQyFD/25cgMXZ8qSOGj
         F4FF6034KVDROhbeNcWiRr+RanqsxkFXb6GTfOGoa/TbYAx7pRyVMwP5v/edEjkM9X
         M7KrEG6GKsLzXJGGtOk9SKnYdq8Qn6ZT13uPWFKrn5WU3zY3Hy3H/doR8aJScsRx7W
         DkdzZxS+WQbwaPxznYg8ZEWGXywynHgkRFWUUzMSxg9OTFkzq077tW/HCOlRZ5ND3b
         /R8UogAoR8mng==
Date:   Thu, 25 Feb 2021 09:40:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fscache tree with the pidfd
 tree
Message-ID: <20210225094028.63c86dab@canb.auug.org.au>
In-Reply-To: <20210215081439.1d0b2b33@canb.auug.org.au>
References: <20210127100038.1d04e444@canb.auug.org.au>
        <20210215081439.1d0b2b33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HIC8JEq5oElw6PPg1CiqS8=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HIC8JEq5oElw6PPg1CiqS8=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 08:14:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Wed, 27 Jan 2021 10:00:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the fscache tree got a conflict in:
> >=20
> >   include/linux/fs.h
> >=20
> > between commit:
> >=20
> >   ba73d98745be ("namei: handle idmapped mounts in may_*() helpers")
> >=20
> > from the pidfd tree and commit:
> >=20
> >   0de0bdfa19fa ("vfs: Export rw_verify_area() for use by cachefiles")
> >=20
> > from the fscache tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc include/linux/fs.h
> > index 7762d3d75230,493804856ab3..000000000000
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@@ -2839,22 -2756,11 +2839,23 @@@ static inline int bmap(struct inode =
*in
> >   }
> >   #endif
> >  =20
> >  -extern int notify_change(struct dentry *, struct iattr *, struct inod=
e **);
> >  -extern int inode_permission(struct inode *, int);
> >  -extern int generic_permission(struct inode *, int);
> >  -extern int __check_sticky(struct inode *dir, struct inode *inode);
> >  +int notify_change(struct user_namespace *, struct dentry *,
> >  +		  struct iattr *, struct inode **);
> >  +int inode_permission(struct user_namespace *, struct inode *, int);
> >  +int generic_permission(struct user_namespace *, struct inode *, int);
> >  +static inline int file_permission(struct file *file, int mask)
> >  +{
> >  +	return inode_permission(file_mnt_user_ns(file),
> >  +				file_inode(file), mask);
> >  +}
> >  +static inline int path_permission(const struct path *path, int mask)
> >  +{
> >  +	return inode_permission(mnt_user_ns(path->mnt),
> >  +				d_inode(path->dentry), mask);
> >  +}
> >  +int __check_sticky(struct user_namespace *mnt_userns, struct inode *d=
ir,
> >  +		   struct inode *inode);
> > + extern int rw_verify_area(int, struct file *, const loff_t *, size_t);
> >  =20
> >   static inline bool execute_ok(struct inode *inode)
> >   { =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.

This is now a conflict between the fscache tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/HIC8JEq5oElw6PPg1CiqS8=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA21dwACgkQAVBC80lX
0GwaGQf/Rc9zez9WB8nqNU03esDt5GlPIAotQyuzGgow68WnWlVV39YMKAnTBLJa
8fuJigsAHX6AjvkhK6TB+kuHjtY7f/t5RUZSGETwSMc9/7bId9uHa5m6VDZutqEc
Oz8Dxirp8MALjJFylkNyhsQDHHkqoIzUrSQktEcNVdMOsA1ZU/B9K71hS6rO+v1u
Jm8mPPYp5Bx+kUK7SwKK5dExA0R68l9MzQiV10pG1DFNu+XwEH/fZV1O9RxrGH/6
mBiMpKzpGAnb2iQ68BYX10GUJ63kvls8cYtbDMngaiJSVAj4k1zaR1TfK3HH2xAJ
yO+vjN1nx/khyXTcm6WmXjNvT1NLIw==
=6J6x
-----END PGP SIGNATURE-----

--Sig_/HIC8JEq5oElw6PPg1CiqS8=--
