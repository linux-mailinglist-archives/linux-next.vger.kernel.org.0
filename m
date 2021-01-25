Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A33C302206
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 07:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbhAYGIn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 01:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbhAYGIA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 01:08:00 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7057C061574;
        Sun, 24 Jan 2021 22:07:19 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPKC94XSxz9sCq;
        Mon, 25 Jan 2021 17:07:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611554837;
        bh=YNGIiy5HIRty63YJbrDvd9psEI1QXn5MWQCckq6LnSk=;
        h=Date:From:To:Cc:Subject:From;
        b=m4biPjo0hIZFHHyies25O2qFrrRVHTFNz0Dh6ETZio1bB8ObO0HSPJkr7MUJ4uwlW
         LAnTW5h/Zpbc7+lv6BeqoSQXW2t6RDpPHTE5XOUN6ejy/CBmGqz4cf9UPm14oDxwZH
         50gmhvd2Q2CIvzpSKwyD2gghJuZ3ENsFVq+x5xPSnKbPz6+JCCB1Z1AMIGib2Ywwt+
         rpthUnpyupCis7pCcDER/YfQ9CPjiMpZHfdVdY0oSzt9GvQlc9MoCZ5M7Ui93BhMx0
         sdhD/yN5P9Qpd8RAx1NCdaMFvvU13QX3EA8QWWtfkghLJdu11SlVyOnJxh+G2UdrFl
         OED4rS5Uoq87g==
Date:   Mon, 25 Jan 2021 17:07:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Miklos Szeredi <miklos@szeredi.hu>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Tycho Andersen <tycho@tycho.pizza>
Subject: linux-next: manual merge of the pidfd tree with the overlayfs tree
Message-ID: <20210125170716.4d6d83f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vELCzHqfxqPljGf9ghZvfTp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vELCzHqfxqPljGf9ghZvfTp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/overlayfs/inode.c

between commit:

  9c09be9e71c4 ("ovl: perform vfs_getxattr() with mounter creds")

from the overlayfs tree and commit:

  c7c7a1a18af4 ("xattr: handle idmapped mounts")

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

diff --cc fs/overlayfs/inode.c
index cf41bcb664bc,e78d45dfeaee..000000000000
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@@ -352,9 -354,7 +354,9 @@@ int ovl_xattr_set(struct dentry *dentry
  		goto out;
 =20
  	if (!value && !upperdentry) {
 +		old_cred =3D ovl_override_creds(dentry->d_sb);
- 		err =3D vfs_getxattr(realdentry, name, NULL, 0);
+ 		err =3D vfs_getxattr(&init_user_ns, realdentry, name, NULL, 0);
 +		revert_creds(old_cred);
  		if (err < 0)
  			goto out_drop_write;
  	}

--Sig_/vELCzHqfxqPljGf9ghZvfTp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOYBUACgkQAVBC80lX
0GyspAf/RAli+2J02d1bkONyazKYo7McEP49jKXqt3hdZnUl1QshHvvQO1UGgtXf
1AzkdM0hbcGTZAOPOcbp/jyceBxOjpZJK1310dsW5mi1v23e91Dpi20PNPTP7PDQ
cAAJp2/6RVz0Rroyk3fx/U1y/A286OtO8O3gLk4FvuTBNHzxI1WKISiniusOoHv+
gGphjIGi9hri1BiQRPRW55PtAztr/73fsE5PZIOXaARBEKoU9lF3suNXwQZp2ft1
xveaEfJE1zvoGegClg1mgNJOokozUgN0kVaZz5vlpFbTqmCXg+tlT602iEAaq1Y8
nBdBMm34Pl9v8Uj9K9aKJMskorlFkA==
=r+pF
-----END PGP SIGNATURE-----

--Sig_/vELCzHqfxqPljGf9ghZvfTp--
