Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283D7274FB5
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 06:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgIWEFu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 00:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgIWEFu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2020 00:05:50 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA5AC061755;
        Tue, 22 Sep 2020 21:05:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bx4NB1pzpz9sTC;
        Wed, 23 Sep 2020 14:05:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600833946;
        bh=UbtABaqo3IdOzZ8/rLfod3wFdsK0twa5i3Wj2dd/S20=;
        h=Date:From:To:Cc:Subject:From;
        b=Ga2JA53fTb6toD0GvydeBpeXb9kIlzNYAjMr4PpdUKXiibHN6KyvTJiplD6F1+X0+
         Pvv9Y+eoOXboi3/DuVF5y/mTmSxRQ9DTss9kcXEXFrT+iZYaxRLLXs/SSU32iK7ar+
         BvSVO7OWKp1kN3dqqffL2/idl7PP3+w5pfptRUWjXBFYWYYIP791VENQ5Fao7cZUCQ
         9HGYDuczx5DBrpAG1phTJ3OEkPk7Ctq2nZB8aZJKY57o7fwCLNTAzvuDjCOLcsJYCs
         /CNtr3piFBNu7GmWvcfX1STcZR0VpPdeC3f9CZ4hGm8MH9MXsad04d4pXKqWht+8o1
         /GR5ilRlryChA==
Date:   Wed, 23 Sep 2020 14:05:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20200923140544.37c8fe99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L3vxaORa8IH.W4o06UufqxW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L3vxaORa8IH.W4o06UufqxW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/io_uring.c

between commits:

  4eb8dded6b82 ("io_uring: fix openat/openat2 unified prep handling")
  f5cac8b156e8 ("io_uring: don't use retry based buffered reads for non-asy=
nc bdev")

from Linus' tree and commit:

  76c917267129 ("io_uring: get rid of req->io/io_async_ctx union")
  8f95cf7f28bf ("io_uring: enable file table usage for SQPOLL rings")

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

diff --cc fs/io_uring.c
index c9aea6c44372,7ee5e18218c2..000000000000
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@@ -3128,12 -3172,12 +3187,13 @@@ static int io_read(struct io_kiocb *req
  	struct iovec inline_vecs[UIO_FASTIOV], *iovec =3D inline_vecs;
  	struct kiocb *kiocb =3D &req->rw.kiocb;
  	struct iov_iter __iter, *iter =3D &__iter;
+ 	struct io_async_rw *rw =3D req->async_data;
  	ssize_t io_size, ret, ret2;
  	size_t iov_count;
 +	bool no_async;
 =20
- 	if (req->io)
- 		iter =3D &req->io->rw.iter;
+ 	if (rw)
+ 		iter =3D &rw->iter;
 =20
  	ret =3D io_import_iovec(READ, req, &iovec, iter, !force_nonblock);
  	if (ret < 0)
@@@ -3193,8 -3236,7 +3253,9 @@@ copy_iov
  		ret =3D ret2;
  		goto out_free;
  	}
 +	if (no_async)
 +		return -EAGAIN;
+ 	rw =3D req->async_data;
  	/* it's copied and will be cleaned with ->io */
  	iovec =3D NULL;
  	/* now use our persistent iterator, if we aren't already */

--Sig_/L3vxaORa8IH.W4o06UufqxW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9qyZkACgkQAVBC80lX
0GzerQf/dlQ4G0KrQwrIbsnsZVzmv7E4GuNTxdtT3PhmZOj0G2x9zoE+P4JN4ygs
jexR4JgtBeawiNNLuwY+ZwkGexCEsT0lAmzHCIhg4YWuephsREZx+AZ7ZNO4Ld4P
ixAT4SC0F93Kvm5bnWQhk+0a53jBE4FY4pXOlOdByj505Xq4qGaQWEWRtlQLdMvh
h62Kk90KDvPvpbdx6i3u7kiQqwiuF5mw9HP1OubRNu4Wv5cxOXx60m8MC5Tm96t0
DAdwqnIu4khksKHVGzwUKL9k7beVO3qbRpaPWqfB3L5J7xvn/Bg9es9R3PsTlQIT
6/Acgva1fVJ4DeHbqWvx2SRwm0Z3cg==
=IWsB
-----END PGP SIGNATURE-----

--Sig_/L3vxaORa8IH.W4o06UufqxW--
