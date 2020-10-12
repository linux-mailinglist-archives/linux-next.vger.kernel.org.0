Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCC428C563
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 01:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389155AbgJLXsN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 19:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388855AbgJLXsN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 19:48:13 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B2CC0613D0;
        Mon, 12 Oct 2020 16:48:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9Fjd73Frz9sTf;
        Tue, 13 Oct 2020 10:48:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602546486;
        bh=tsA+FpAYJ79DdkImsUuB55VqWEvgtK9G7BhifvUYuIg=;
        h=Date:From:To:Cc:Subject:From;
        b=R7fu8uy5xHzwglAwVG/HCIY6UElV04dIg1VvkgInLNDOKwhvshfQwDAj7Nkggj9qO
         Ri2ncW8x2vQ8KE6craIsjzM65npAVMWDE7OsSKevpljiu4mQHuLP1pJuR7jV8D0Ps1
         eCZ949jKPWtyhrpYwwkFZ4+ab4QMi9DuRmf5uzoj7JGdXYDiPRATzC3gZX/HhjA5vU
         jOYSQRRyww5LyMnWqLvWktMj6LmPyY/lpPdOrMJMLbpMDhErxWToJ5mRqM6dXZrmWQ
         1HiXm23iUMvQKsbVvKdLpe4OyhF4W1xtDPULDW8hZQy2JaAfP1NJnns2AKlxL5ZToc
         I86B43phnIhtQ==
Date:   Tue, 13 Oct 2020 10:47:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Max Reitz <mreitz@redhat.com>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the fuse tree with Linus' tree
Message-ID: <20201013104747.559128e7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h5hLElEIrFzfhb0L6gQk4_x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h5hLElEIrFzfhb0L6gQk4_x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fuse tree got a conflict in:

  fs/fuse/file.c

between commit:

  933a3752babc ("fuse: fix the ->direct_IO() treatment of iov_iter")

from Linus' tree and commit:

  fcee216beb9c ("fuse: split fuse_mount off of fuse_conn")

from the fuse tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/fuse/file.c
index 43c165e796da,53d4dd1ab992..000000000000
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@@ -3120,17 -3156,10 +3146,18 @@@ fuse_direct_IO(struct kiocb *iocb, stru
  	 * By default, we want to optimize all I/Os with async request
  	 * submission to the client filesystem if supported.
  	 */
- 	io->async =3D ff->fc->async_dio;
 -	io->async =3D async_dio;
++	io->async =3D ff->fm->fc->async_dio;
  	io->iocb =3D iocb;
  	io->blocking =3D is_sync_kiocb(iocb);
 =20
 +	/* optimization for short read */
 +	if (io->async && !io->write && offset + count > i_size) {
- 		iov_iter_truncate(iter, fuse_round_up(ff->fc, i_size - offset));
++		iov_iter_truncate(iter, fuse_round_up(ff->fm->fc,
++				  i_size - offset));
 +		shortened =3D count - iov_iter_count(iter);
 +		count -=3D shortened;
 +	}
 +
  	/*
  	 * We cannot asynchronously extend the size of a file.
  	 * In such case the aio will behave exactly like sync io.

--Sig_/h5hLElEIrFzfhb0L6gQk4_x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+E6yMACgkQAVBC80lX
0GwVLQf/Xcp+10ogecx1mL8vumFkhv4KP7guIxHq5/gp+XTvjgpU0mS9VlBnzb6W
pEhSG+PIlw7mzy2tahwFJkYA4ljF5rhBVk/NQi7r6t8GMQdR2XCx5IUF8blSS925
eBFQW5Ww4VjvfyUXxz/PCylw695nCicM8J8IGensszB1GYRwnr0mT0JMieybdJOY
m+xg5ove3Alp2gSHIC+t0I9cbpb0W7qCQCWWeuUztv+4Mjpym6atzwCnDa8reX6D
4xkKPhVL0DBKsEupWUzXMFYcQQpF/hHgWgQ7GRSw7QYiUOFEMMHg4PDZENdfyK6N
SV+P9lcwpY/d3gMq0NwUBLKbKMN42w==
=GCQ+
-----END PGP SIGNATURE-----

--Sig_/h5hLElEIrFzfhb0L6gQk4_x--
