Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958E131285F
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 00:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhBGXef (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Feb 2021 18:34:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhBGXee (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 7 Feb 2021 18:34:34 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3065C061756;
        Sun,  7 Feb 2021 15:33:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DYlpj3RWhz9rx6;
        Mon,  8 Feb 2021 10:33:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612740830;
        bh=mUVAHkaKy3IiZ79jVV9e5g/cx4s3Sz9ehM7aiqphm7Y=;
        h=Date:From:To:Cc:Subject:From;
        b=aAzrvbRMXZmChzgc90gbY0JnzKbJaxXeV8oCfPNqDXgawaBshYHTrpDNdT3lktjwY
         J5Mh89e3SZyW8V7+jWqPKp0YPlW5ujxHTOIhngq1ZfG9YSIB+UvErQ7Qq/To9BDNVg
         Db0IYZ0VHMhrnFS6CRQlGANL10ELfPo9yT1vlBfSDfZYXXvz7E8U4LmZA3ZJ4+FFgm
         gbcieRCRR/cew5fDjBySzB2fgRttzftwzpd6vmDKHHyuuanC6vexIZNILv9myYBCtW
         lM96Xvd4cgSQxyUaod5CvYzIPGiFlr+lK8nqW3/YQy6OYtIqR0jrrjrp1IJfH6uf+d
         bZvjdTxS87htw==
Date:   Mon, 8 Feb 2021 10:33:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the xfs tree with the pidfd tree
Message-ID: <20210208103348.1a0beef9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ksx.y2CT98xmSoyaTgZuwYE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ksx.y2CT98xmSoyaTgZuwYE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xfs tree got a conflict in:

  fs/xfs/xfs_ioctl.c

between commit:

  f736d93d76d3 ("xfs: support idmapped mounts")

from the pidfd tree and commit:

  7317a03df703 ("xfs: refactor inode ownership change transaction/inode/quo=
ta allocation idiom")

from the xfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/xfs/xfs_ioctl.c
index 3d4c7ca080fb,248083ea0276..000000000000
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@@ -1280,9 -1275,9 +1280,10 @@@ xfs_ioctl_setattr_prepare_dax
   */
  static struct xfs_trans *
  xfs_ioctl_setattr_get_trans(
- 	struct file		*file)
 -	struct xfs_inode	*ip,
++	struct file		*file,
+ 	struct xfs_dquot	*pdqp)
  {
 +	struct xfs_inode	*ip =3D XFS_I(file_inode(file));
  	struct xfs_mount	*mp =3D ip->i_mount;
  	struct xfs_trans	*tp;
  	int			error =3D -EROFS;
@@@ -1470,9 -1461,9 +1469,9 @@@ xfs_ioctl_setattr
 =20
  	xfs_ioctl_setattr_prepare_dax(ip, fa);
 =20
- 	tp =3D xfs_ioctl_setattr_get_trans(file);
 -	tp =3D xfs_ioctl_setattr_get_trans(ip, pdqp);
++	tp =3D xfs_ioctl_setattr_get_trans(file, pdqp);
  	if (IS_ERR(tp)) {
- 		code =3D PTR_ERR(tp);
+ 		error =3D PTR_ERR(tp);
  		goto error_free_dquots;
  	}
 =20
@@@ -1615,7 -1599,7 +1606,7 @@@ xfs_ioc_setxflags
 =20
  	xfs_ioctl_setattr_prepare_dax(ip, &fa);
 =20
- 	tp =3D xfs_ioctl_setattr_get_trans(filp);
 -	tp =3D xfs_ioctl_setattr_get_trans(ip, NULL);
++	tp =3D xfs_ioctl_setattr_get_trans(filp, NULL);
  	if (IS_ERR(tp)) {
  		error =3D PTR_ERR(tp);
  		goto out_drop_write;

--Sig_/ksx.y2CT98xmSoyaTgZuwYE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAgeNwACgkQAVBC80lX
0GwQrwf7BhqxJ3pn3YyKDTWkgQVXqJ4FvUqr3Hdzwap+4rtKbLgi6hW7DF5SPcbk
svGdGbmTXwkr/64zSVBQ1K60srd8FdeLIvHxtapJJyjPnDjQgTToUVHf3U5cS3jY
S7mU5XKLOdT/FqnO1jBo9IDDuy5lnG9DAOz61GaXVhwJx+FqCgU4vSquhb+PS7Gc
Zez50ItYFptvbYGIaMd2IL057WqTk8HQY6OsR6eQO+THUvcqHPamK1JhqZnHA+V6
D4Rdx12ZTKQAeIezgRlLc0PlKaHcBF5MbGTLUjbs7qHCWRCUtfNzgY6PJ00otvVC
DyoHntBxbmgHTcnHU6bqi7nQcNkhMw==
=wxv3
-----END PGP SIGNATURE-----

--Sig_/ksx.y2CT98xmSoyaTgZuwYE--
