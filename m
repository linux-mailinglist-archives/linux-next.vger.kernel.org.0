Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DF3302203
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 07:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbhAYGGA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 01:06:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58523 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbhAYGFV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Jan 2021 01:05:21 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPK7v325Wz9sCq;
        Mon, 25 Jan 2021 17:04:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611554667;
        bh=oNKvgq2rNTE1PwmFhGN8+vBHpglFTJ04NwD8amgRvCE=;
        h=Date:From:To:Cc:Subject:From;
        b=b2YeObJKn1Z9qdYXzaIXzQVqYf4YuCh+G70gfj9uIy8h7CDCdszsch7CS+j9skxfG
         OEyyKBW/JWUnxRs3BxZ0Lu9OCxHV4ytc4vMf6jjpMEomKBkBkHxnKekxEPtFys4uQl
         LFJUrCBSdvfJU9fnzVSlZ8Yg7uaaKJonBcwoZkNeyMudSuJjIu4ibUeeVsZfJVynXE
         LjKAXR0e/PTrU32Uq8Ndx7l5GW2LRBoHOgg03GeNsjHZlWYbP9ERB4HP4V+7fj2JPd
         Oh/YTV08vjMSmH6oDXE3rQ6JeBJCI72TLE8MhtxibH0cQzgMR0UMC/AWyZnPtEhzCL
         dStFL+Mmvc+YQ==
Date:   Mon, 25 Jan 2021 17:04:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Miklos Szeredi <miklos@szeredi.hu>
Cc:     Amir Goldstein <amir73il@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Tycho Andersen <tycho@tycho.pizza>
Subject: linux-next: manual merge of the pidfd tree with the overlayfs tree
Message-ID: <20210125170426.3b941eac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZD3FkCWVRI5ST.rEbw2o+Pm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZD3FkCWVRI5ST.rEbw2o+Pm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/overlayfs/copy_up.c

between commit:

  06896fa3193d ("ovl: skip getxattr of security labels")

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

diff --cc fs/overlayfs/copy_up.c
index 0fed532efa68,f81b836c2256..000000000000
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@@ -84,18 -84,10 +84,18 @@@ int ovl_copy_xattr(struct super_block *
 =20
  		if (ovl_is_private_xattr(sb, name))
  			continue;
 +
 +		error =3D security_inode_copy_up_xattr(name);
 +		if (error < 0 && error !=3D -EOPNOTSUPP)
 +			break;
 +		if (error =3D=3D 1) {
 +			error =3D 0;
 +			continue; /* Discard */
 +		}
  retry:
- 		size =3D vfs_getxattr(old, name, value, value_size);
+ 		size =3D vfs_getxattr(&init_user_ns, old, name, value, value_size);
  		if (size =3D=3D -ERANGE)
- 			size =3D vfs_getxattr(old, name, NULL, 0);
+ 			size =3D vfs_getxattr(&init_user_ns, old, name, NULL, 0);
 =20
  		if (size < 0) {
  			error =3D size;
@@@ -115,7 -107,14 +115,7 @@@
  			goto retry;
  		}
 =20
- 		error =3D vfs_setxattr(new, name, value, size, 0);
 -		error =3D security_inode_copy_up_xattr(name);
 -		if (error < 0 && error !=3D -EOPNOTSUPP)
 -			break;
 -		if (error =3D=3D 1) {
 -			error =3D 0;
 -			continue; /* Discard */
 -		}
+ 		error =3D vfs_setxattr(&init_user_ns, new, name, value, size, 0);
  		if (error) {
  			if (error !=3D -EOPNOTSUPP || ovl_must_copy_xattr(name))
  				break;

--Sig_/ZD3FkCWVRI5ST.rEbw2o+Pm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOX2oACgkQAVBC80lX
0GzdKwf/RlgrLSZvbXuM0qIBbR5xfJDcpHMama2K1ZR3ATai8Wv+wcz2FTk+NGeO
/7jXOo2p6N/ffJejoQ3e5AJKjhnawo6WqDLAkuCfUGkqrm9UWOsFxsZC/fueTg+x
tHTdo6rRk56apmHnsLyAzUFz3XKmmKBLApfgiSqrnu7c+maV9dEWGgCPabe6sldD
yy8pMApdBfgUqASH4hQ4JrI/pS3CKSHuJ4O9r6Ji+kj0m73w0TVQ3ihnqS1MTEtt
cAA5Pg1Siwye8ZPLnE1a067EIPmEtnEEBGiqMYBa43ctR/7hHdY+k+3TMO2X9+v5
koOkYfUapL/nWbuU1zRIPvXe3RR1eg==
=Uk4p
-----END PGP SIGNATURE-----

--Sig_/ZD3FkCWVRI5ST.rEbw2o+Pm--
