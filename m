Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85EE7232B51
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 07:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgG3FUK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 01:20:10 -0400
Received: from ozlabs.org ([203.11.71.1]:46997 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgG3FUK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jul 2020 01:20:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHJdN0ss3z9sRX;
        Thu, 30 Jul 2020 15:20:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596086408;
        bh=ODeRgtMKT9jb1AW+U70iuR+0CpBcYdgaLgF+n3GXCP4=;
        h=Date:From:To:Cc:Subject:From;
        b=BVHxBkPZYUUs2Y6tuyHj5/gZZ98M9TqcWwGpfOpIihsQ0Z9MSdbw4YcTaPA5xqGiJ
         bXmHaVtsWKLxTYTJIkUnCz1M5J0honBwSb4a9XhHl6RmyS6YnBg0uRrEEYvqvFqYda
         /lOe12lKSibmolA6r2GVWamN6PRUmOU3Ovq6PdKfapT8UKdwwDbrKiSHWOkohLFDq/
         xtgkl0Ydp9K7YfmH4ZtWrCMLAO/uqRGe7ghqqHligX7Vq/xIfeGw90AxSZsZ3gEkTD
         4TMYsUBALOiNM7ZMi8GUKx/Qdpp/4L7ZLiGF31v+HB7qWH/SuKtftMFryESdzMWO0r
         B2gUjy+qTJzjg==
Date:   Thu, 30 Jul 2020 15:20:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>, Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jerry Snitselaar <jsnitsel@redhat.com>
Subject: linux-next: manual merge of the iommu tree with the dma-mapping
 tree
Message-ID: <20200730152006.7d012668@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.gygsxj+xJnStLtg1iKpndV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.gygsxj+xJnStLtg1iKpndV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommu tree got a conflict in:

  drivers/iommu/Kconfig

between commit:

  2f9237d4f6df ("dma-mapping: make support for dma ops optional")

from the dma-mapping tree and commit:

  ab65ba57e3ac ("iommu/vt-d: Move Kconfig and Makefile bits down into intel=
 directory")

from the iommu tree.

I fixed it up (I used the ;atter and applied the folowing merge fix
patch as well) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 30 Jul 2020 15:14:18 +1000
Subject: [PATCH] merge fix for "dma-mapping: make support for dma ops optio=
nal"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iommu/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/intel/Kconfig b/drivers/iommu/intel/Kconfig
index 877beec9d987..5337ee1584b0 100644
--- a/drivers/iommu/intel/Kconfig
+++ b/drivers/iommu/intel/Kconfig
@@ -6,6 +6,7 @@ config DMAR_TABLE
 config INTEL_IOMMU
 	bool "Support for Intel IOMMU using DMA Remapping Devices"
 	depends on PCI_MSI && ACPI && (X86 || IA64)
+	select DMA_OPS
 	select IOMMU_API
 	select IOMMU_IOVA
 	select NEED_DMA_MAP_STATE
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/.gygsxj+xJnStLtg1iKpndV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8iWIYACgkQAVBC80lX
0GxylAf3V+eKlEHqQi+SBPIXWiaFumZKs8Zr6vyqoeeu1NhsHKGmfRuUs7DI5Rd0
ss5/FvPXlbnmqsZT0KoCeS9ZwAIjlh8OJ/9eiR1q9bgkAAEBrFNIC2BaP47/O433
Hd/BlGhnbFpyZQ5hWv9cn+GGP5TwSGyDHa87nkhh3vBzh4ScRTjYkT+KKC5z54Au
rAq2MYLvqaJBBCHLb28Si1aO/OFGxhDJGXmy03p/Qo7Ds98uCfqIEWiJMdE0yvro
jkkk0mfrnchgof/iQllMoppkoHAJ7nEXZgSlpLVE+M3egM9svMd4VMkDNoC1yzCx
7Ax+PJ7DYjJdhGmQ1BNsQJjfskf/
=yw64
-----END PGP SIGNATURE-----

--Sig_/.gygsxj+xJnStLtg1iKpndV--
