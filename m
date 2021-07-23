Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB193D3455
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 07:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbhGWFNX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Jul 2021 01:13:23 -0400
Received: from ozlabs.org ([203.11.71.1]:54589 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231949AbhGWFNX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Jul 2021 01:13:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GWJR6750Tz9sV8;
        Fri, 23 Jul 2021 15:53:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1627019636;
        bh=WoPtSDrgd4+nxPehyUOY84R2GRQnSOZORJvc76I7vwM=;
        h=Date:From:To:Cc:Subject:From;
        b=aYH/JWjGocUWZEargyee8KH0ndqgOQpy3Wdt77O6xRgm6dmqbb017efqrvnPCUSOr
         EfLMpHJsOSJV7GiiH/gDPCCMtOwKdsEoncdX1mm3HYuKO0CsADxC9oVZiW0W7gTIHy
         HmP2Ap3h7xOpqd+ughmXB2YiePpM2rSDvyzLEJYOmshdQcW1nzUfGS2tXiWvCAW66B
         Mu9NMpfGrRovozg7X/2lczs4eEnp80l+ECvPvEGLdFWkE6FFPVvue4jnXjGthXfftx
         cksk9FXGHRVHzlosmFDMNkBenhQ7AT/Zg2XFMHUdtRNSHLLKb4hzYLf0zjSFAY3OkH
         YCfAjqPl9aCJA==
Date:   Fri, 23 Jul 2021 15:53:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>, Greg KH <greg@kroah.com>
Cc:     Dave Jiang <dave.jiang@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Subject: linux-next: manual merge of the dmaengine tree with the driver-core
 tree
Message-ID: <20210723155354.082a62d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P=0+wHJOhCum63MsBUwgCR/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P=0+wHJOhCum63MsBUwgCR/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dmaengine tree got a conflict in:

  drivers/dma/idxd/sysfs.c

between commit:

  fc7a6209d571 ("bus: Make remove callback return void")

from the driver-core tree and commit:

  d9e5481fca74 ("dmaengine: dsa: move dsa_bus_type out of idxd driver to st=
andalone")

from the dmaengine tree.

I fixed it up (the latter moved the code updtaed by the former,
so I added the following merge fix patch) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 23 Jul 2021 15:49:33 +1000
Subject: [PATCH] fixup for "bus: Make remove callback return void"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/dma/idxd/bus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/idxd/bus.c b/drivers/dma/idxd/bus.c
index 02837f0fb3e4..6f84621053c6 100644
--- a/drivers/dma/idxd/bus.c
+++ b/drivers/dma/idxd/bus.c
@@ -58,14 +58,13 @@ static int idxd_config_bus_probe(struct device *dev)
 	return idxd_drv->probe(idxd_dev);
 }
=20
-static int idxd_config_bus_remove(struct device *dev)
+static void idxd_config_bus_remove(struct device *dev)
 {
 	struct idxd_device_driver *idxd_drv =3D
 		container_of(dev->driver, struct idxd_device_driver, drv);
 	struct idxd_dev *idxd_dev =3D confdev_to_idxd_dev(dev);
=20
 	idxd_drv->remove(idxd_dev);
-	return 0;
 }
=20
 struct bus_type dsa_bus_type =3D {
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/P=0+wHJOhCum63MsBUwgCR/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD6WXIACgkQAVBC80lX
0Gx2pQf/ZDmRQIMNu1RVTAAIb7KnxLKSjFH82TdCRkxZ7EPczRcXLstR1JNpU3q7
0Ubfs3KEe+vQ9Ut5F6OlGXC7jHZjaxjtNhFbbMHl1bmxsYpH0KxOM5q/qepclReE
LJAWmvBj1yRgMI8KKnXg8YwxjR9EoF0gStCrU56XSnKzwFXe7E6ArcY/YgEEtGfu
8P97TKwkExm3bTiUwTo81BT3aNE5ebI7RuFVPaN58v1UJysqb6w+Pyj10TTSxcRK
ZsNAQHqhGQSyj9FPI09EswV5+tuvBoZf5/gOeJ9V6OJENAAH1A7c6cRCxvhyWdBq
7iNY5DUIiRVeHWp55nJ8mOJmcYiJpA==
=MgDe
-----END PGP SIGNATURE-----

--Sig_/P=0+wHJOhCum63MsBUwgCR/--
