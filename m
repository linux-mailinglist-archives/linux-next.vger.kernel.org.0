Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03DA305311
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 07:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbhA0F7R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 00:59:17 -0500
Received: from ozlabs.org ([203.11.71.1]:33411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235764AbhA0DZF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 22:25:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQTVC5dnlz9sSs;
        Wed, 27 Jan 2021 14:24:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611717861;
        bh=jGXNNioRjxhhBdPPzy6DBCKYQDkMAd7+JXFGN0Jy8+8=;
        h=Date:From:To:Cc:Subject:From;
        b=Um70XnqDdWg93cTcjjo7lchBYRC3VaKtJjp6dct8AEV6YjEvk1KYVnhkfsUN2JqdZ
         O14GQnMgec+ZiJPYiswap8B2R5lEHHl0rnEhVvkbw3SGEvj9u8IstabQk1viai2bzW
         ir7I6gSv6haKqBR5jBOfbidfw9lQLnX/36bwmMyGkJYJDQlJfpfBMPI/WLbhyCXvZ8
         sdB0oTVNeG7k6e3t4Sd6Zauy+I/T6NnVefjJ2c+Yng7XFNjuEAbf4Idwtf/3HXQPR5
         Dh12f2JISoNVPdcEXX0iOAcLeyz7md2iEbHyYgRLzE3ZI4Fr0a4utVw5myjvJUsGYK
         sTbhImx1LPH1A==
Date:   Wed, 27 Jan 2021 14:24:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>
Cc:     Eric Biggers <ebiggers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: manual merge of the block tree with the vfs tree
Message-ID: <20210127142418.460bcffc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zQLd6BQQ_sfHy6ZkmD6hko7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zQLd6BQQ_sfHy6ZkmD6hko7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  Documentation/filesystems/porting.rst

between commit:

  14e43bf43561 ("vfs: don't unnecessarily clone write access for writable f=
ds")

from the vfs tree and commits:

  9b2e0016d04c ("bvec/iter: disallow zero-length segment bvecs")
  c42bca92be92 ("bio: don't copy bvec for direct IO")

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

diff --cc Documentation/filesystems/porting.rst
index c2161de0f4ef,1f8cf8e10b34..000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -872,5 -870,14 +872,21 @@@ its result is kern_unmount() or kern_un
 =20
  **mandatory**
 =20
 +mnt_want_write_file() can now only be paired with mnt_drop_write_file(),
 +whereas previously it could be paired with mnt_drop_write() as well.
++
++---
++
++**mandatory**
++
+ zero-length bvec segments are disallowed, they must be filtered out before
+ passed on to an iterator.
+=20
+ ---
+=20
+ **mandatory**
+=20
+ For bvec based itererators bio_iov_iter_get_pages() now doesn't copy bvec=
s but
+ uses the one provided. Anyone issuing kiocb-I/O should ensure that the bv=
ec and
+ page references stay until I/O has completed, i.e. until ->ki_complete() =
has
+ been called or returned with non -EIOCBQUEUED code.

--Sig_/zQLd6BQQ_sfHy6ZkmD6hko7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQ3OIACgkQAVBC80lX
0Gxmzwf/TWyTUbUq4GQld2ZlD2RCvZxWVBMjvwSpmnGtfRw5+g9MN7BDVSrB4JiA
ghY3JzbK2x9rZ9H57K3rAyHrT74kUgyDIoUBj0WIEBg3KMOQHovJARJF29CSaNt8
KmUDr1AhAY8mgNtiGEJHphGtMs0mUfOAx1BMMKqDBWw+86dBjnr/cANiDhqCCzi3
dsoSkAToqUb3bD8hhLueAkObXoNVPINRnGYXoUPB+158HpjXMe9GFcaaVZ0EuRR4
Qa9mivBoYeegXg1exy4o7EAzre8d7vA5NNl0Q4SubaKjsyxWCN+EI8KGbkLKYLub
EN+BElVKLvkchIIsv7HGbnG2411WcA==
=esFZ
-----END PGP SIGNATURE-----

--Sig_/zQLd6BQQ_sfHy6ZkmD6hko7--
