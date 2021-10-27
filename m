Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF50743C65D
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 11:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236358AbhJ0JYX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 05:24:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55697 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbhJ0JYW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 05:24:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfNVq6GTkz4xbW;
        Wed, 27 Oct 2021 20:21:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635326516;
        bh=elNCz4h0uELKfdL9FVEWHw7ypkrevedK/hgfDXaHWFI=;
        h=Date:From:To:Cc:Subject:From;
        b=rVEKk5rzdpRJ6Es4JsGlPR20SAOSu0ioDRiuAOlYDPn/AXAmupi8GQiYfeAYTTGST
         Otw2+cyzFfmEVDjKTli4vbJJyweLRv64QVzL2oV+LyV/HbPETsuPyYm97UnSQjGvvq
         i52nrVAGdUw9C1w3hpZ7T4C3UuEJbuIcY+S8grNdhn0N4FzMD2Vj/EZCzXO0Q2SoMk
         sVDqy9jMj7EXfe4pGKLREzP8QMGtqZnkAjHLp2LkDZnRXuduIP10EA0912YSajPPZQ
         v2/JyHemRDKMqoUrPkDCcotcyRnav2YE633of045YOXUOIKj0LrPZTlcVcqiQ7dd+E
         TUSkZb1HGLCzA==
Date:   Wed, 27 Oct 2021 20:21:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Alexander Gordeev <agordeev@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the s390
 tree
Message-ID: <20211027202149.2aae434d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_KU65k4ekwOtwCMcW=ajvBF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_KU65k4ekwOtwCMcW=ajvBF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/s390/kernel/setup.c

between commit:

  e035389b73b1 ("s390/setup: use virtual address for STSI instruction")

from the s390 tree and commits:

  0d52db59796e ("memblock: rename memblock_free to memblock_phys_free")
  13ab40b0e60e ("memblock: use memblock_free for freeing virtual pointers")

from the akpm-current tree.

I fixed it up (thanks, Vasily for the heads up and resolution) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/kernel/setup.c
index e738a45057ac,8a378d426239..000000000000
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@@ -878,12 -884,14 +879,12 @@@ static void __init setup_randomness(voi
  {
  	struct sysinfo_3_2_2 *vmms;
 =20
 -	vmms =3D (struct sysinfo_3_2_2 *) memblock_phys_alloc(PAGE_SIZE,
 -							    PAGE_SIZE);
 +	vmms =3D memblock_alloc(PAGE_SIZE, PAGE_SIZE);
  	if (!vmms)
  		panic("Failed to allocate memory for sysinfo structure\n");
 -
  	if (stsi(vmms, 3, 2, 2) =3D=3D 0 && vmms->count)
  		add_device_randomness(&vmms->vm, sizeof(vmms->vm[0]) * vmms->count);
- 	memblock_free_ptr(vmms, PAGE_SIZE);
 -	memblock_phys_free((unsigned long)vmms, PAGE_SIZE);
++	memblock_free(vmms, PAGE_SIZE);
  }
 =20
  /*

--Sig_/_KU65k4ekwOtwCMcW=ajvBF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF5Gi0ACgkQAVBC80lX
0Gwl3QgAndcznrCT1UNQ57kym+1+YOUYeA7Gxjhhzmdzg1JqS0yGH111lo1vN5x5
LAR4jDFCJ4Qu3eImYCixmoNddvQIEAncP0VDkmJOMD6cjSrV0whtTMGMLii8Im08
usERW9P2Ey6WACVuJYPCyaeQ8w3mhVcL7qA+bCpCCT53IWihZZpynmiwECK0Syjb
qgSARM2pRJnuDf0DrCidcm62fpDiHAG3UV/0It4VdC5uPuzYA4gWEanyGS1gWQ9u
bD0pUeNxKzU6GUAkT+jXfPaNmUpJeRz7GBjgqx9CIamtPVdVSsNgKEi4bFMXpOnl
/mXpUsJfEl60CvBI9xXJT+Jzdh0cEA==
=u/U0
-----END PGP SIGNATURE-----

--Sig_/_KU65k4ekwOtwCMcW=ajvBF--
