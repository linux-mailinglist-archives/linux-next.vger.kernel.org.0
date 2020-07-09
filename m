Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BF821968D
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 05:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgGIDWB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 23:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgGIDWB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2020 23:22:01 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39138C061A0B;
        Wed,  8 Jul 2020 20:22:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2M0l2l7Bz9sDX;
        Thu,  9 Jul 2020 13:21:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594264919;
        bh=EFOv/tGLEhs9ibyg95vEdYz7g89lLSFxVbREKqjK2n0=;
        h=Date:From:To:Cc:Subject:From;
        b=sVv5b/4uhuvEhGWVrm74HUa+DFsWGUqNnol7pvYfWPHudjXymbmUXF4XcYBBDb2YT
         9PbpOb4o0E9oM6/DCOiuDct0yBzrp5wwlYw9l8aXtk19MhF39vN8st/YqTKtXYzHvy
         3jdB0NshqeIIur9oqf3NnS6izzaLDdUywqwhJ4wBXRHnw4sLCGOKkIUVRVcd4bR8M7
         BnvpujuUfZ5CGbal0ZOtL/f/ALX4uCaHO2qBiC3LBcLVi/hzWtF2/ttOF++nAGTITe
         wYTrWZa/HLTEPgdFWq/2tgEpsekmq8VZV1v5nNi0pYOMhw0lxT392+cOlZaFyvbF8g
         kISeJM5pMVmPw==
Date:   Thu, 9 Jul 2020 13:21:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Ignat Korchagin <ignat@cloudflare.com>
Subject: linux-next: manual merge of the device-mapper tree with the block
 tree
Message-ID: <20200709132158.698042a8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wGyrKYCkNBOXWp_/iN5q1lF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wGyrKYCkNBOXWp_/iN5q1lF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the device-mapper tree got a conflict in:

  drivers/md/dm-crypt.c

between commit:

  ed00aabd5eb9 ("block: rename generic_make_request to submit_bio_noacct")

from the block tree and commit:

  202b8d712016 ("dm crypt: add flags to optionally bypass kcryptd workqueue=
s")

from the device-mapper tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/md/dm-crypt.c
index b437a14c4942,bad05c5ed3b5..000000000000
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@@ -1892,8 -1896,9 +1896,9 @@@ static void kcryptd_crypt_write_io_subm
 =20
  	clone->bi_iter.bi_sector =3D cc->start + io->sector;
 =20
- 	if (likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) {
+ 	if ((likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) ||
+ 	    test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags)) {
 -		generic_make_request(clone);
 +		submit_bio_noacct(clone);
  		return;
  	}
 =20

--Sig_/wGyrKYCkNBOXWp_/iN5q1lF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8GjVYACgkQAVBC80lX
0GyLdQf+KG5YZwnK2CKs7iKXRwOUdoWAUKq6dGVgASdDfqDJcotFtWbHAQl7FgGd
y3nVXWGpRBvXxMRxQ8y0qQRVeW5fxJlOC7E/fly8wm+3MaQhGJRwXbxMz5z/HpdE
n+Wbtn2U9fzl6SKUCw0jD4adSszX8KhUczhv8GI8TPGEvyHEKRfSL3GAQIIfWKPQ
zlABDxCbkpMfazl8at5HhC68uTnbjYUcb4fo1Uzha+PpNsGSt/i3PNx2+rWjv0d5
AJxUU99CbnbwtuGmJuvPl4PTlylIijPY3hxt3+0/jm7qLBn1OcR11b2yNvRIVLoE
vT8Xf/R+EAvOmxergdJxKM5rvW/1mw==
=3TbQ
-----END PGP SIGNATURE-----

--Sig_/wGyrKYCkNBOXWp_/iN5q1lF--
