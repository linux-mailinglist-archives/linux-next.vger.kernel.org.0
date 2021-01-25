Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F35B5302200
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 07:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbhAYGCW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 01:02:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbhAYGBi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 01:01:38 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBC9C061573;
        Sun, 24 Jan 2021 22:00:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPK3q1WB9z9sCq;
        Mon, 25 Jan 2021 17:00:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611554455;
        bh=aGerqqcrdC2bral7pD0/SwErNADuJZb1XqK5GjHTiqQ=;
        h=Date:From:To:Cc:Subject:From;
        b=MDdvNXldxM4J5+ts3O//IG1gA+m1KT4MLt9kgmoByf+vh+vtlRUKB21leuEaP9gOi
         t8gWOH9oCiCXX32gB6X6eSbS2WTz0fNrNZQW8Ap9IrIihtjaAAzK6zCOzkMBPywETH
         1s8K+Q6VNRyJ73X6UmmJU+ge2aF2P/9M6UPqSN0CLnRGuISjexy6rtZEDpIpe03iY3
         4PUUta0POBg/61Cm/VMu0Nmv1H/gsAi4QO82BchI4XMyQNLhbNX0jMFiQjMkOhhX0a
         3UgywILjwVJHPkVvSZRR/6pRP4qPldX269/iUqNYwRkLXwQaY/cIancr85FZAJyyy/
         +RPxyfkmnEd8A==
Date:   Mon, 25 Jan 2021 17:00:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the vfs tree
Message-ID: <20210125170054.54869988@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vW2ugBdppZA8cautaJgyn3C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vW2ugBdppZA8cautaJgyn3C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/namei.c

between commit:

  e36cffed20a3 ("fs: make unlazy_walk() error handling consistent")
  1e8f44f159b3 ("do_tmpfile(): don't mess with finish_open()")

from the vfs tree and commit:

  47291baa8ddf ("namei: make permission helpers idmapped mount aware")
  ba73d98745be ("namei: handle idmapped mounts in may_*() helpers")
  549c7297717c ("fs: make helpers idmap mount aware")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/namei.c
index 4cae88733a5c,dbf53b325ac9..000000000000
--- a/fs/namei.c
+++ b/fs/namei.c
@@@ -1568,14 -1639,18 +1644,16 @@@ static struct dentry *lookup_slow(cons
  	return res;
  }
 =20
- static inline int may_lookup(struct nameidata *nd)
+ static inline int may_lookup(struct user_namespace *mnt_userns,
+ 			     struct nameidata *nd)
  {
  	if (nd->flags & LOOKUP_RCU) {
- 		int err =3D inode_permission(nd->inode, MAY_EXEC|MAY_NOT_BLOCK);
+ 		int err =3D inode_permission(mnt_userns, nd->inode,
+ 					   MAY_EXEC | MAY_NOT_BLOCK);
 -		if (err !=3D -ECHILD)
 +		if (err !=3D -ECHILD || !try_to_unlazy(nd))
  			return err;
 -		if (unlazy_walk(nd))
 -			return -ECHILD;
  	}
- 	return inode_permission(nd->inode, MAY_EXEC);
+ 	return inode_permission(mnt_userns, nd->inode, MAY_EXEC);
  }
 =20
  static int reserve_stack(struct nameidata *nd, struct path *link, unsigne=
d seq)
@@@ -3324,9 -3453,11 +3453,9 @@@ static int do_tmpfile(struct nameidata=20
  	path.dentry =3D child;
  	audit_inode(nd->name, child, 0);
  	/* Don't check for other permissions, the inode was just created */
- 	error =3D may_open(&path, 0, op->open_flag);
+ 	error =3D may_open(mnt_userns, &path, 0, op->open_flag);
 -	if (error)
 -		goto out2;
 -	file->f_path.mnt =3D path.mnt;
 -	error =3D finish_open(file, child, NULL);
 +	if (!error)
 +		error =3D vfs_open(&path, file);
  out2:
  	mnt_drop_write(path.mnt);
  out:

--Sig_/vW2ugBdppZA8cautaJgyn3C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOXpYACgkQAVBC80lX
0GygXAf/WT0/KH7AtnFMC7AeVGIPHPhsDdt4XR0TFaqy3adAAp2o+VpLoB6+qAKi
N22b0W0Cxx207vR+AddkM/JShk9QofgTUrX34Urw5JukmAj2+8l9LU4Z0/KAzrOK
EPQwxn3MXDgCthdpfjqKaaLDIxjIWue8VAfROQTP7UelonSTJjukWq27fmMX0wMZ
fNSoJDttqTp+/cM+k4DsIs2DuIBfkDe/gml4OwBOGplF1pEwUudvHzHwIWUzsECq
35TKjJFvNfuTvanWm00aZIcAserUZZ+7vthj3T1VvDGSWGDap5fGetsrYgXk1BbJ
Gt6jx5N34MZ9MyMGK84AAiLlTgy2Pw==
=yhuk
-----END PGP SIGNATURE-----

--Sig_/vW2ugBdppZA8cautaJgyn3C--
