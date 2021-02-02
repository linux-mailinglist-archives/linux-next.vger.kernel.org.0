Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D3C30B575
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 03:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhBBCqr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 21:46:47 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41921 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231389AbhBBCqr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Feb 2021 21:46:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DV8MH6K7Vz9t5G;
        Tue,  2 Feb 2021 13:46:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612233965;
        bh=HzKerq39gTK1H0Uw/utsxgEZ3XEdHGcO7RhRXVMnzyQ=;
        h=Date:From:To:Cc:Subject:From;
        b=Ol5J6L8bjz3DMr8kVnZ1EkoHUWvitPjvSEkgp+V8cGgSV8JIQ97/FCGRXwS0NA9Uc
         M66YPijjSe6E05fbk9m0qc4HtU45i+Y4BRgYdD3wBfwLatNbCdqFqERs5XPqKRx+TD
         qiGzGadUFLHY2ay66Kd7YMF536afXMgt6esokK46ry+j0qkwxZ1uRiEu9FQhwOc9Zh
         w+zgjOxXCHbHrOp5MaooMi7qvAWL0bGLCFDhZ9VyXnhuvrZQj0TyAOB7M1CwfKvrcJ
         Ae/z4aj8cxaF3F9t8SXWbjTGd2OEQu59q0dpTqM8KLcxqod6bsG9ILA3Fg4rokkLVg
         AarZR7wh5I6hQ==
Date:   Tue, 2 Feb 2021 13:45:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc:     David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: manual merge of the block tree with the btrfs tree
Message-ID: <20210202134559.175ae62f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U/7pu9QxejG/iBRYLTsv+1s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/U/7pu9QxejG/iBRYLTsv+1s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/iomap/direct-io.c

between commit:

  dffd1df2d29a ("iomap: support REQ_OP_ZONE_APPEND")

from the btrfs tree and commit:

  3e1a88ec9625 ("bio: add a helper calculating nr segments to alloc")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/iomap/direct-io.c
index e4c258a2cefc,ea1e8f696076..000000000000
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@@ -292,13 -260,7 +289,14 @@@ iomap_dio_bio_actor(struct inode *inode
  			iomap_dio_zero(dio, iomap, pos - pad, pad);
  	}
 =20
 +	/*
 +	 * Set the operation flags early so that bio_iov_iter_get_pages
 +	 * can set up the page vector appropriately for a ZONE_APPEND
 +	 * operation.
 +	 */
 +	bio_opf =3D iomap_dio_bio_opflags(dio, iomap, use_fua);
 +
+ 	nr_pages =3D bio_iov_vecs_to_alloc(dio->submit.iter, BIO_MAX_PAGES);
  	do {
  		size_t n;
  		if (dio->error) {

--Sig_/U/7pu9QxejG/iBRYLTsv+1s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAYvOcACgkQAVBC80lX
0GzdOQf/fY8IvhnRPrbsaDb83v7enQ6QuNqfg/RQ2iEnMaMHAxZPfbvAGuNIaGIx
qffEPvbjF678KT6QDhk8Z2OC8onbFRZlWKff+1opCX97K7nh5LXfuB8cbqTIulPB
b0YMtnNoe5ZOOd7XCXvChWZ3pzOFbCl6Rr59KaqoGCodcAded/N8aVqq9jPq+uEv
McOJR3tH55ma+4KJaU1m8NzKWkGqQJFybV8oVkyry2/iIYArk94IIhx0RglD0lNx
EiCvo7ejImVyRuMA6NwxsgivWuNa1P8siRvof2/KxGClWKwN+mroI8BinmCNwLQR
N4dCrdzh7DqPZqOZZNP1+zhkFZ5SYg==
=wXQv
-----END PGP SIGNATURE-----

--Sig_/U/7pu9QxejG/iBRYLTsv+1s--
