Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F25429C0E
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 05:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhJLDss (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 23:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhJLDsr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 23:48:47 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F65C061570;
        Mon, 11 Oct 2021 20:46:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HT1mx1kCLz4xbX;
        Tue, 12 Oct 2021 14:46:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634010401;
        bh=PIC4BSEKnCvQwkHth6WKNqu0xVPqlnAt0cs3pKbCgD8=;
        h=Date:From:To:Cc:Subject:From;
        b=Xyi/KwD0+zHyQxw7CbCEOxc6fNqyucmO4pvGWDDvlBg8TBf82PQTZlkxYuUjZg1GE
         Jzj8QFQ8trGXkmU6rlAsUgMAwyciv65n13QiAeORE2QSiGT8qJ5vbZ2hlbvBIVVnnH
         mBqnEU5qZofBLGZSV/yHo+BlDg+UaMx5sgzpqdPNnWXzZnL3jLo6GgMBlPhrLlgLfq
         fdi3hAWGN561IYRbKbhx3xyjz8evWE947WL98UmAQbDfeQ0iRSnFY25Tllv4I8crZu
         PphLDBkandmA6e7xEjPGEhUB3FDV3KE5dNx3IWQONYdsIEPeG14zOhFw9TFMPrU7EP
         0fiiQIQkR8scQ==
Date:   Tue, 12 Oct 2021 14:46:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the iommu tree
Message-ID: <20211012144639.0af3457c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ljwz=aOq0fN5CTerz2Y83Fy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ljwz=aOq0fN5CTerz2Y83Fy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/iommu/apple-dart.c: In function 'apple_dart_get_resv_regions':
drivers/iommu/apple-dart.c:758:2: error: implicit declaration of function '=
iommu_dma_get_resv_regions'; did you mean 'iommu_get_resv_regions'? [-Werro=
r=3Dimplicit-function-declaration]
  758 |  iommu_dma_get_resv_regions(dev, head);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |  iommu_get_resv_regions
cc1: all warnings being treated as errors

Caused by commit

  b2b2781a9755 ("iommu/dart: Clean up IOVA cookie crumbs")

interactig with commit

  05dc551614a4 ("iommu/dart: Exclude MSI doorbell from PCIe device IOVA ran=
ge")

from the pci tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 Oct 2021 14:40:49 +1100
Subject: [PATCH] fix for "iommu/dart: Exclude MSI doorbell from PCIe device
 IOVA range"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iommu/apple-dart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 912be9b7669c..280ff8df728d 100644
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

--Sig_/ljwz=aOq0fN5CTerz2Y83Fy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFlBR8ACgkQAVBC80lX
0GxvgQgAoSue+NksAmcxW49jy2puuTJgg5+d5/8YOyZWd7xQEpW1G8P/6SJ+2vrk
ghXdw9Ux45xrJ45Pqm0t4ZVbYMMjLrXDjv4MQdhJfOUclqHjtHgMIEG6W+uTzMg3
Lb2XTyduaRtSjLMO4QPfeEFUktpglEfm9bmCvIeUoI64gAxelM8jKbia49XHWb5Y
s52dQI+B913qkf4i0N9bnNs4u+HRBCYvPJySrGFHGSCjePxqXAluMFnLC4QKG3va
+oGb3LGHm1RsQzPfwfaNa0k9XPnKJUDL2/jwH0vhJr7otdDOwX1F22bqWCYeLzIa
cEc6CYConhlazf+JHkrrqi58nhbjhA==
=NOYp
-----END PGP SIGNATURE-----

--Sig_/ljwz=aOq0fN5CTerz2Y83Fy--
