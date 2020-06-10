Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303791F4B44
	for <lists+linux-next@lfdr.de>; Wed, 10 Jun 2020 04:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgFJCRM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Jun 2020 22:17:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725798AbgFJCRL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Jun 2020 22:17:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49hVxJ15qVz9sRR;
        Wed, 10 Jun 2020 12:17:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591755430;
        bh=+/Na9XECsFlkHA1EyyS2aYZ5J+5X/KFhBFECUZGFuDc=;
        h=Date:From:To:Cc:Subject:From;
        b=fVvCEO4Hfk+a3L1gEUM0UyHbHWrIziGAeL+49KqYWthC1VgzLopQEy4sCIMQpVv8l
         3vdDmRpr2WlXNJWWZObGGdkJBYR88fI43E2kyMGNO0CBEGic4/AJZNCs5YCwe+QjKH
         upimPDafeR0MlpB1iVxyNOPtEszZyCoDifFevYpPoKceu0V0pscVN1kMoUytSI/Gcv
         kNljZJiQ6Ais+HIDzdf+mlWtU394lGf9iuSvWgAxbP2MCdBX/XiceilMv46U9c6E8J
         ZSnMxa/ye+NSaLpQWeIQrk3Kw8eGSPwi7eelHyAuX8Ht4mXhgIlvfCXCn8DtzuUE4E
         95fMYcY1xwQIw==
Date:   Wed, 10 Jun 2020 12:17:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Arlott <simon@octiron.net>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20200610121707.1f4c4355@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fW.RteAK.CvtbhyjeSxIS8O";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fW.RteAK.CvtbhyjeSxIS8O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/sr.c

between commit:

  a711d91cd97e ("block: add a cdrom_device_info pointer to struct gendisk")

from Linus' tree and commit:

  6555781b3fde ("scsi: sr: Fix sr_probe() missing deallocate of device mino=
r")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/sr.c
index 4dcd735ea49e,b9cff27e2c81..000000000000
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@@ -790,9 -790,10 +790,9 @@@ static int sr_probe(struct device *dev
  	set_capacity(disk, cd->capacity);
  	disk->private_data =3D &cd->driver;
  	disk->queue =3D sdev->request_queue;
 -	cd->cdi.disk =3D disk;
 =20
 -	if (register_cdrom(&cd->cdi))
 +	if (register_cdrom(disk, &cd->cdi))
- 		goto fail_put;
+ 		goto fail_minor;
 =20
  	/*
  	 * Initialize block layer runtime PM stuffs before the

--Sig_/fW.RteAK.CvtbhyjeSxIS8O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7gQqMACgkQAVBC80lX
0GzDYQf/YYkB+SFMb3nfh3Eu7nX9Ry0+qnnJDNRhstxIQrj3a0oC+Uv8JgTuEMe4
+O8j3TnFtzhdHUyyF398QxY20N2BCXKtNhVsGTS58thPEuC9xAZjF7gGaDbl+l1v
e7RYZ5VQ+N9QEvWhRzrT8i4hzcmYj7VmL2BdFJcMq0SZUaHay5PlkdlRtlNdS977
r0vdAf5/5+QmdFIqAEQO3bTuHE3XwXCcVeNBH2hNdE1cXF1AnVMX9Wxz1yG6513L
40eM23Tukga66Fg1QZBWE6MoKoxl2BB8EjdyQ+DiIfFSAAChvQrXwjQEseBMYWj0
K6EziS0dCVF7073gkeVTByiKPOm5Jg==
=bLev
-----END PGP SIGNATURE-----

--Sig_/fW.RteAK.CvtbhyjeSxIS8O--
