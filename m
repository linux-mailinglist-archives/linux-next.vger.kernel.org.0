Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3F5320E5F
	for <lists+linux-next@lfdr.de>; Sun, 21 Feb 2021 23:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhBUWwY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 17:52:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbhBUWwX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Feb 2021 17:52:23 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A25FC061574;
        Sun, 21 Feb 2021 14:51:43 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkLCc6gm3z9sRN;
        Mon, 22 Feb 2021 09:51:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613947901;
        bh=p7ZtKSbkGUQws4We3zbipV3v+EKzfwfSXclU5GNJ+zc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SQNCNPt3XSH8A9LQpcC4bPnPCj6k55pKmJPYMGA8kUoijFtbBS0E+H6LBZm/5WHtz
         eypHCHR6opyoWIQCaWG0+rrViT9wOU+MDyswRbetQ7h9JxSaLPtcd18STKy7bgD+dB
         JhTIvg9jWA5ZBM+tygNF8HC6J5MYQUFArjHHg9chTOEQs+ziCOYbbIey7gvxD1dvqL
         j0TS0ihWxo7SoNZW5HA5oZ4iSeAXcLoW5yH6qTgakvNkdmqE5X1uixl37YLKKTmht3
         AE8s9shcUeX7m/GvnR5cK/1pQ+Lr6IL099vSxRcdHM/90xKLvZBSDF4B8UhpFp5VDA
         pdf2myCr9nMFw==
Date:   Mon, 22 Feb 2021 09:51:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the vfs tree
Message-ID: <20210222095140.53d1aaea@canb.auug.org.au>
In-Reply-To: <20210215080521.45f7a061@canb.auug.org.au>
References: <20210125170054.54869988@canb.auug.org.au>
        <20210215080521.45f7a061@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zCPMrAh4GUVFq6VCkQ2L3gH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zCPMrAh4GUVFq6VCkQ2L3gH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 08:05:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 25 Jan 2021 17:00:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the pidfd tree got a conflict in:
> >=20
> >   fs/namei.c
> >=20
> > between commit:
> >=20
> >   e36cffed20a3 ("fs: make unlazy_walk() error handling consistent")
> >   1e8f44f159b3 ("do_tmpfile(): don't mess with finish_open()")
> >=20
> > from the vfs tree and commit:
> >=20
> >   47291baa8ddf ("namei: make permission helpers idmapped mount aware")
> >   ba73d98745be ("namei: handle idmapped mounts in may_*() helpers")
> >   549c7297717c ("fs: make helpers idmap mount aware")
> >=20
> > from the pidfd tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc fs/namei.c
> > index 4cae88733a5c,dbf53b325ac9..000000000000
> > --- a/fs/namei.c
> > +++ b/fs/namei.c
> > @@@ -1568,14 -1639,18 +1644,16 @@@ static struct dentry *lookup_slow(co=
ns
> >   	return res;
> >   }
> >  =20
> > - static inline int may_lookup(struct nameidata *nd)
> > + static inline int may_lookup(struct user_namespace *mnt_userns,
> > + 			     struct nameidata *nd)
> >   {
> >   	if (nd->flags & LOOKUP_RCU) {
> > - 		int err =3D inode_permission(nd->inode, MAY_EXEC|MAY_NOT_BLOCK);
> > + 		int err =3D inode_permission(mnt_userns, nd->inode,
> > + 					   MAY_EXEC | MAY_NOT_BLOCK);
> >  -		if (err !=3D -ECHILD)
> >  +		if (err !=3D -ECHILD || !try_to_unlazy(nd))
> >   			return err;
> >  -		if (unlazy_walk(nd))
> >  -			return -ECHILD;
> >   	}
> > - 	return inode_permission(nd->inode, MAY_EXEC);
> > + 	return inode_permission(mnt_userns, nd->inode, MAY_EXEC);
> >   }
> >  =20
> >   static int reserve_stack(struct nameidata *nd, struct path *link, uns=
igned seq)
> > @@@ -3324,9 -3453,11 +3453,9 @@@ static int do_tmpfile(struct nameidata=
=20
> >   	path.dentry =3D child;
> >   	audit_inode(nd->name, child, 0);
> >   	/* Don't check for other permissions, the inode was just created */
> > - 	error =3D may_open(&path, 0, op->open_flag);
> > + 	error =3D may_open(mnt_userns, &path, 0, op->open_flag);
> >  -	if (error)
> >  -		goto out2;
> >  -	file->f_path.mnt =3D path.mnt;
> >  -	error =3D finish_open(file, child, NULL);
> >  +	if (!error)
> >  +		error =3D vfs_open(&path, file);
> >   out2:
> >   	mnt_drop_write(path.mnt);
> >   out: =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.
>=20
> Those vfs tree commits have also been merged into the block tree.

This is now a conflict between the pidfd tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/zCPMrAh4GUVFq6VCkQ2L3gH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAy4/wACgkQAVBC80lX
0GzpXAf/bWvZLid2Oswe57Ysca6i52pUbchZsBOaqBiqSWbpUs5daXbK1NU2x+EQ
B7ROsurzBjWhoj24gE+JVwSr2cylIyv7+5JAklMxnlo6mhjnOHCKaceCO2uBPd8L
qD0RmfiTebzFAbtldQT/fHydSreNw0f9/YPd1eI9eXPpJX78sirt3vMfg2nBGH8M
7skD67q4Dg0cRAqWkq9XDSiIjHldJ7rIl3ozVOXEOsiD0PUFjQ4PPIeHcfwiu0fO
gGzN0KPLcx6JL0CAPor+X81Ep8QHeZ8Xa9Znz9rAZBD7l6zawNPGqul9kf9zaZm2
aLqUNodEr568YAEcqrylTzyuEhipfQ==
=GeRJ
-----END PGP SIGNATURE-----

--Sig_/zCPMrAh4GUVFq6VCkQ2L3gH--
