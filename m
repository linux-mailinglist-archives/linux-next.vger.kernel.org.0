Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABEA445C72
	for <lists+linux-next@lfdr.de>; Thu,  4 Nov 2021 23:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbhKDW67 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Nov 2021 18:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbhKDW67 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Nov 2021 18:58:59 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CFEC061714;
        Thu,  4 Nov 2021 15:56:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HlfBl1gqGz4xd8;
        Fri,  5 Nov 2021 09:56:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636066576;
        bh=grcmNFBX6Zg8EjXAyRbS7cvifulEVMPhW4wGYPqFZpo=;
        h=Date:From:To:Cc:Subject:From;
        b=FpJBo9U2tgsR3Gxadiz2PIAO1+/NOW7HC0GSYz9svyzJx4iih7DHRgNc+IaUnwjZg
         UZOcL2DBZDNJoK8ovwUc3hSGiS7d6dMORrMem261SnZl1FiuAx4r1zV524RgcC8Xk1
         didyKvcdoWknhV9kR1Jf3wlFweCqapNSDlKQ3tBa2vEZWU1iMh9nS5jw238HBTk1kl
         sDTBqnRBtNImyVw86OssrDTjE7ZETZ5LsmTRZnm6XC/YGhqfQLlFoC3b2wX8GojUxo
         8jTl0wLJ2s8vvCumS1ksNGuvcJBltCDNX8VVBtEaXxTycmIcYSAkdEAkjKnWpbnb7Q
         aqBFGXe2UGwYA==
Date:   Fri, 5 Nov 2021 09:56:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Marc Zyngier <maz@kernel.org>, Joerg Roedel <jroedel@suse.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20211105095614.6bc6fc96@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qdt613cmfmMZgU7Svgtyos_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qdt613cmfmMZgU7Svgtyos_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/iommu/apple-dart.c: In function 'apple_dart_get_resv_regions':
drivers/iommu/apple-dart.c:762:2: error: implicit declaration of function '=
iommu_dma_get_resv_regions'; did you mean 'iommu_get_resv_regions'? [-Werro=
r=3Dimplicit-function-declaration]
  762 |  iommu_dma_get_resv_regions(dev, head);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |  iommu_get_resv_regions

Caused by commit

  946d619fa25f ("iommu/dart: Exclude MSI doorbell from PCIe device IOVA ran=
ge")

Unfortunately, the linux/dma-iommu.h include was removed by commit

  b2b2781a9755 ("iommu/dart: Clean up IOVA cookie crumbs")

which is now in Linus' tree.

I have added this merge fixup for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 5 Nov 2021 09:51:19 +1100
Subject: [PATCH] iommu/dart: restore include of linux/dma-iommu.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iommu/apple-dart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index b7265a8e9540..565ef5598811 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -15,6 +15,7 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
+#include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/qdt613cmfmMZgU7Svgtyos_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGEZQ4ACgkQAVBC80lX
0Gy78AgAhesX5qd981QechtQbh6vkMpBaEJTO6DBC23V9UXnZUbqcs/wbP/0Jtlz
YSWkhU6cHhS8FWnr591+T/fB9lq/lE5TmOisUWC5WlwkXBiEXnEVFZ/vYLR1iIh0
4OPpgBOSbZu4efKENIBwb9p7E7Mh7Ldc9nc14BWIbdd3e47DKs7qjJbvO/bx+/nM
qnEDqs418R5XiLqdqpfhHkeT2lVlEYXsoFZHsb2FRQO3cgtc+vPDk8/zshQdg7Jl
Lh37uTUszSlg86XKdG9b762gowadLnLzxEbf4L5seUPD4+f3Z5MJD0+Y2msbekbl
wX3dy8H5JEJukE5URb2f5Bh6vp/SYw==
=yQqQ
-----END PGP SIGNATURE-----

--Sig_/qdt613cmfmMZgU7Svgtyos_--
