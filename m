Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB5E35B863
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 04:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235718AbhDLCDg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 22:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235543AbhDLCDg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Apr 2021 22:03:36 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF22C061574;
        Sun, 11 Apr 2021 19:03:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJX823Kxgz9sWP;
        Mon, 12 Apr 2021 12:03:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618192996;
        bh=zK2rifJ2b1jcytqoW+HjMaew1cdEO0OouTDOArvkOjk=;
        h=Date:From:To:Cc:Subject:From;
        b=n7IkWgvyk50MHG8g+bzTgTrIRMQskyoaidc2m9k6BvuBmrlubzDUQ5VprLUW0vlO4
         wnT5ziZhUUkEFYAbOEF0Pd/v5IR1dbD9MX06O+C8nWbLlkbg3R7ktjYf9WreAwSPRo
         xvn89hT5ALkgjpKgSUCReXmoLw/nj+dKrCJ567HXhlBtkErGZRgYly38eB1oHgpSR+
         /JZee948gE7p6HvhnQwyd6gTBE2hzaV8izpNkxkYGuN+m+wafu7Ttm6eesSBydKhfC
         cyQj4S3QhjwTTlU1oyMNyvddhAMT29dVWXUrrWuCdOHw7Vp9bOf+g3dikAGkkKz1I8
         2HCdI1oUsU+0g==
Date:   Mon, 12 Apr 2021 12:03:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        Miklos Szeredi <miklos@szeredi.hu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Sargun Dhillon <sargun@sargun.me>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Message-ID: <20210412120313.20efd984@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+w1075nm2+Vcvr//mzXJB=e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+w1075nm2+Vcvr//mzXJB=e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/overlayfs/file.c

between commit:

  d46b7cd68336 ("ovl: plumb through flush method")

from the overlayfs tree and commit:

  ae7db6c8bc98 ("ovl: remove unneeded ioctls")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/overlayfs/file.c
index 6e454a294046,9bd4167cc7fb..000000000000
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@@ -716,11 -590,6 +610,7 @@@ const struct file_operations ovl_file_o
  	.mmap		=3D ovl_mmap,
  	.fallocate	=3D ovl_fallocate,
  	.fadvise	=3D ovl_fadvise,
- 	.unlocked_ioctl	=3D ovl_ioctl,
 +	.flush		=3D ovl_flush,
- #ifdef CONFIG_COMPAT
- 	.compat_ioctl	=3D ovl_compat_ioctl,
- #endif
  	.splice_read    =3D generic_file_splice_read,
  	.splice_write   =3D iter_file_splice_write,
 =20

--Sig_/+w1075nm2+Vcvr//mzXJB=e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBzqmEACgkQAVBC80lX
0GwDqgf/SGhWvykOU7vDktHblrHcYxOlcqiRkeKNX5r9iDJD6+8mSF8uFdyksarq
MFd4AP7VtcNnfBM0WIdfXNt9zM9PvoloyB8by8ifxC+hMkn3ypugPjoGUdzOgJ+v
b4QQw5MeIR+RCSahP9pkDfvi/4nhxdbHe2UIxVP2g8M35fcWTevIN4eHMCB3ZZZO
TeQSoykxT8ioToEEwUKCuJ/YuiKHkt/PX+Qpw5ux2r0QuWT2qdBFCM4RVRIIpvit
qEQQYBZv0FT3lIMBnniBiJCwEvDarPnTuhJnO2YuRoJ9D0xADvhWqtLpSiXl6H8J
J9wmOE9kDr011MUvWRJU7SNUmOuiLg==
=LXFX
-----END PGP SIGNATURE-----

--Sig_/+w1075nm2+Vcvr//mzXJB=e--
