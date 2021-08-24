Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8AF3F53F8
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 02:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhHXAIY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 20:08:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58785 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233260AbhHXAIY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Aug 2021 20:08:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtqDp62THz9sXV;
        Tue, 24 Aug 2021 10:07:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629763659;
        bh=gBHbL1jLvzywBmlq970c89meGcxBD6vc6e4gIiN0SAg=;
        h=Date:From:To:Cc:Subject:From;
        b=mwqM9vbzE6UDsPqTeM5badgJfLBaXiLvIJF8S0W4La5AVztQvZ48QKwH/+nkqqB8a
         8q3huCNj7QKMhQfY9AyyoykLlK4ksFvpI6kvKovlEUYWc5EQk8x3trY9yNJUUyKk+9
         Ekm9DAYpXkS8NO3UkXR+A04P0hcmvk6/LA6HY7zxdG89nceMfl77Cu41/0neGhsjdx
         9JAeBfn0TysahNTdaXbLRgX5K4VTnKnIJYEYBz0AZhWkDuNoY5knjMuF/PVpg9wYFi
         c1AoQDzZmR+au2l470skcKkoh9y4Jlyr8jzXXxQ5IofLtvQFwF+qgAKgx/tGmD9+yM
         Jm2VrdpQwhf5A==
Date:   Tue, 24 Aug 2021 10:07:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jeff Layton <jlayton@kernel.org>,
        Chuck Lever <chuck.lever@oracle.com>
Cc:     "J. Bruce Fields" <bfields@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the file-locks tree with the cel tree
Message-ID: <20210824100737.4bd6d815@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8/NlOoMWk5HiqmmcC9Xr98g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8/NlOoMWk5HiqmmcC9Xr98g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the file-locks tree got a conflict in:

  fs/nfs/file.c

between commit:

  c045f1c40a48 ("nfs: don't allow reexport reclaims")

from the cel tree and commit:

  f7e33bdbd6d1 ("fs: remove mandatory file locking support")

from the file-locks tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/nfs/file.c
index 7411658f8b05,514be5d28d70..000000000000
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@@ -806,13 -806,6 +806,9 @@@ int nfs_lock(struct file *filp, int cmd
 =20
  	nfs_inc_stats(inode, NFSIOS_VFSLOCK);
 =20
 +	if (fl->fl_flags & FL_RECLAIM)
 +		return -ENOGRACE;
 +
- 	/* No mandatory locks over NFS */
- 	if (__mandatory_lock(inode) && fl->fl_type !=3D F_UNLCK)
- 		goto out_err;
-=20
  	if (NFS_SERVER(inode)->flags & NFS_MOUNT_LOCAL_FCNTL)
  		is_local =3D 1;
 =20

--Sig_/8/NlOoMWk5HiqmmcC9Xr98g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkOEoACgkQAVBC80lX
0GwAEwf/evAG/xXRXo59g1drpfK9QzvRF/IIMdnjB+TPJfA78KmPJAhEjTB7DOAM
m7sw1GJqYS1Zv+t/Aw+Oi7maJaZ/oJxbp0Txl0uoFxQMpUmBQXaVZeqsbJOMbNi9
xHPDWyEkRabf/wV3rW42ROt2yXjC7Kin85+E3J9Z/fTwvy5EHQgsZ3haNOU1CJ0q
rKvo3RJLqnesCWJcrALN6VXztCMPqloAkuw1Ptl9ad7eZlPAAK2PbHeNvR44JmPi
a9q6GKiPL01HdXcHn5cKquIppJAcXbAVrux7VvSZFwgMq8QXJYpldnkvL8+OwYiv
ZnCY5wfJIy+Aw9BOBC2nNpRntMYT5Q==
=MQMC
-----END PGP SIGNATURE-----

--Sig_/8/NlOoMWk5HiqmmcC9Xr98g--
