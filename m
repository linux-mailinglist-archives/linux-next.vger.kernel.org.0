Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D4B33844B
	for <lists+linux-next@lfdr.de>; Fri, 12 Mar 2021 04:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhCLDRy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Mar 2021 22:17:54 -0500
Received: from ozlabs.org ([203.11.71.1]:36771 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231643AbhCLDRu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Mar 2021 22:17:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DxWGL4R9Nz9sRR;
        Fri, 12 Mar 2021 14:17:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615519068;
        bh=r+w0f+rCOG7p9lEWxedgjApaW7EtjtBd4UVm/Y/TN8o=;
        h=Date:From:To:Cc:Subject:From;
        b=tIokTXFYuXpF7wHyZzKL2w9V+m3oeDyqQKWiIWVqNdctptvlcZ7BLEyBRrRxa1PKK
         E57MInQPOBf4LfJe0hSWTGb2JDCiGWNetbDLS26puCTSqdpzcL2RKear31LXvoXrn0
         ekFOP+BelXC0/Wae+GmCzawD+B1lu+VoEKPB7IIJgM7esqNwlZA9YgnknU18e2UcnI
         TajQ9kHjxmmK7tlkqixd8u27PsaKZGTTR58+etS0a4w4n4GfmPkwTHhplYqJBkLCYQ
         IMwhrtj/WneKSYYBxFdYtf4uZFGnAQJOQGj1ueuqbceuUn3euvKC/FxHOhPLFibO+L
         vqnn/CQ3zO1BA==
Date:   Fri, 12 Mar 2021 14:17:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Douglas Gilbert <dgilbert@interlog.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20210312141744.0022d5f5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gIuhuxoqy6sEVhOKYQ21qqG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gIuhuxoqy6sEVhOKYQ21qqG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:


drivers/scsi/sg.c: In function 'sg_mk_kern_bio':
drivers/scsi/sg.c:2958:17: error: 'BIO_MAX_PAGES' undeclared (first use in =
this function); did you mean 'BIO_MAX_VECS'?
 2958 |  if (bvec_cnt > BIO_MAX_PAGES)
      |                 ^~~~~~~~~~~~~
      |                 BIO_MAX_VECS

Caused by commit

  b32ac463cb59 ("scsi: sg: NO_DXFER move to/from kernel buffers")

interacting with commit

  a8affc03a9b3 ("block: rename BIO_MAX_PAGES to BIO_MAX_VECS")

from the block tree.

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 12 Mar 2021 14:11:16 +1100
Subject: [PATCH] scsi: sg: fix up for BIO_MAX_PAGES rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/sg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 2d4bbc1a1727..6b31b2bc8f9a 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -2955,7 +2955,7 @@ sg_mk_kern_bio(int bvec_cnt)
 {
 	struct bio *biop;
=20
-	if (bvec_cnt > BIO_MAX_PAGES)
+	if (bvec_cnt > BIO_MAX_VECS)
 		return NULL;
 	biop =3D bio_alloc(GFP_ATOMIC, bvec_cnt);
 	if (!biop)
--=20
2.30.0

Jens, maybe you could create a topic branch with that block tree change
in it (and any other necessary ones) for Martin to merge into his tree.
Of course, you should do that be rebasing it onto v5.12-rc2 first to
get rid of the swapfile booby trap.
--=20
Cheers,
Stephen Rothwell

--Sig_/gIuhuxoqy6sEVhOKYQ21qqG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBK3VgACgkQAVBC80lX
0GzrfQf8CRynrTvBPJvFuKFqeQNW3z/KBqggWO9QqbW0fcUYMqxzxNfhUV1PA3uz
ZOpFju4XuzY+HIep3naNWhaXWUgawJqvEt5cLyqMrdyPUZ5WCISL9fXdP8MeEaJ9
iSL74CCoLpV5NHnjNgrI3AezJJQ3YyPBQhnqsiG1v9wXWL4hwPruitUaQ9QP0CvT
E+SVkmIRBt800/LEP3H3e4DzR5xXUIJhYhzB4qNQen4M29CGKB3wSWttoBgWBCbl
0IcyfKTGd7/8g5gY/LKksg5UtemIY1055yqx3GvGI8eUKVm7vR+L6rwa4EzZzymG
FJFohxiYDsp6ffmumiSkrYLWpm9MxA==
=WHh1
-----END PGP SIGNATURE-----

--Sig_/gIuhuxoqy6sEVhOKYQ21qqG--
