Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C466A3A09D7
	for <lists+linux-next@lfdr.de>; Wed,  9 Jun 2021 04:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233695AbhFICPu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 22:15:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233597AbhFICPu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Jun 2021 22:15:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G09dW2cXpz9sRK;
        Wed,  9 Jun 2021 12:13:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623204835;
        bh=bXuTb1ueSomSD65NEmeoVPQYFtjdthhrhXcI2UWfZV8=;
        h=Date:From:To:Cc:Subject:From;
        b=PclM2nqmHi3yvM1ib1ox+Kc591/Xf0YNfdyXeSt4vAgBVUQHn5Xc7V2sjShDyBar/
         +bPb/9ixibfvwXpKrfB+Vpa7f3vJ39L3tHQR6D42+jdhZBcLLuZRmZ/uEvkXpBuoG6
         kKPLzVms+0ZlCZSTPVs301gRIUR8UwQnqelhKeUbdLCmLcLdvHcEWe0Cfz1c0/sRXb
         B+rleDt1Eo+u2dqvUrZUVGlI6z9FstBHzOaZmq1wBQUeFImn8HfCg4b5SubCwc6Ew4
         kq9XF8rys2+digQdJKj78pGQZkDeF1KY8pdLTHUoQuis8O1qYDQVxqePnsimtQI79C
         cV/+TfBraYpjg==
Date:   Wed, 9 Jun 2021 12:13:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gfs2 tree with the vfs tree
Message-ID: <20210609121349.74ba0b69@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4Z8LU8p1cBUmeB6w0D7CaZJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4Z8LU8p1cBUmeB6w0D7CaZJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gfs2 tree got conflicts in:

  include/linux/uio.h
  lib/iov_iter.c

between commit:

  c8129a6f6ed1 ("sanitize iov_iter_fault_in_readable()")

from the vfs tree and commit:

  f8524fce6a88 ("iov_iter: Add iov_iter_fault_in_writeable()")

from the gfs2 tree.

I fixed it up (see below - both commits fixed up the indentation in
iov_iter_fault_in_readable()) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/uio.h
index fd88d9911dad,6811eb6ac6e3..000000000000
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@@ -115,11 -119,12 +115,12 @@@ static inline struct iovec iov_iter_iov
  	};
  }
 =20
 -size_t iov_iter_copy_from_user_atomic(struct page *page,
 -		struct iov_iter *i, unsigned long offset, size_t bytes);
 +size_t copy_page_from_iter_atomic(struct page *page, unsigned offset,
 +				  size_t bytes, struct iov_iter *i);
  void iov_iter_advance(struct iov_iter *i, size_t bytes);
  void iov_iter_revert(struct iov_iter *i, size_t bytes);
 -int iov_iter_fault_in_readable(struct iov_iter *i, size_t bytes);
 +int iov_iter_fault_in_readable(const struct iov_iter *i, size_t bytes);
+ int iov_iter_fault_in_writeable(struct iov_iter *i, size_t bytes);
  size_t iov_iter_single_seg_count(const struct iov_iter *i);
  size_t copy_page_to_iter(struct page *page, size_t offset, size_t bytes,
  			 struct iov_iter *i);
diff --cc lib/iov_iter.c
index 8842ca6995c3,317c94eac907..000000000000
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c

--Sig_/4Z8LU8p1cBUmeB6w0D7CaZJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDAI94ACgkQAVBC80lX
0GwEIAf/RCrlUFEDmzaKLh9/mnRES9gAcMCooVf5DErUWZT7vTBVPx8cveL4o6GY
Nx3/o6eZF4Hot5Ak2r7Eswp9gdiBsn+fAtKbY4n56D85ANbXP6SLojSLe5HOboVR
xMdMlR2SL11iX4K8BPl84u5PCJylH8nC5Y42U9AR5UU4f8bW7t0Q1rRPWDGHsf5O
kghy7vkRJbOC4RfruooibUDWagxtRCDWwS8Jbe5FnYaevpK7mGZ9GtEL1oTt5Fws
pbN5k/mLYwEW/zgc9Ib4T9dfBF2p4k6w17K8Vysjz+LlHlUPEMc0CshA386jnmci
EsK2iXRo7TaNifqY7y0AW1HfvKPFJw==
=QAEa
-----END PGP SIGNATURE-----

--Sig_/4Z8LU8p1cBUmeB6w0D7CaZJ--
