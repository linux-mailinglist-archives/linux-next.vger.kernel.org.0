Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3D42C603A
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 07:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387814AbgK0G6E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 01:58:04 -0500
Received: from ozlabs.org ([203.11.71.1]:48469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbgK0G6E (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Nov 2020 01:58:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cj56x6QBpz9sSn;
        Fri, 27 Nov 2020 17:58:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606460282;
        bh=czbpifdgKwbNrta/fpkG8YF+9ju5jmWzMWXBcBXauCo=;
        h=Date:From:To:Cc:Subject:From;
        b=uAUd+HVbAzVVmbxYcMFwhGjCUTY1Hs20QH1RUo/2v5GZYJwdqci4m0lj9IfaWs/1v
         QuH+Vty2Q9ZnHneBF0iJ1r2KJDgLQHm4abe/a95eBI95hdrZT620Gck4DtWiFVwlyn
         eP66Cwz+ZrNwHhCeVmR5wczIBagxmrB7aiAr3llZBbq0ZBXvet4OXYbFmas51zULWl
         MhTln1xGOetDpDYo68FUFTi+L36COTYHUOgJy0lmjRpr7zeee75Nou9y1yVCNIU0x8
         w/exAod98YDSu+KzHHQF5V7K1ErFgDwr3sMevkCBGjZ/DtS71uZ8nbmVmuHDmQwjqU
         cS1J4qO0klwVQ==
Date:   Fri, 27 Nov 2020 17:58:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Alexey Kardashevskiy <aik@ozlabs.ru>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20201127175801.538fbb30@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UeGbi9WUl5IjfbsLMyXKu1l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UeGbi9WUl5IjfbsLMyXKu1l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping tree, today's linux-next build (powerpc64
allnoconfig) failed like this:

In file included from include/linux/dma-direct.h:10,
                 from arch/powerpc/kernel/dma-iommu.c:9:
include/linux/dma-map-ops.h:328:41: error: expected identifier or '(' befor=
e numeric constant
  328 | #define arch_dma_map_page_direct(d, a) (0)
      |                                         ^
arch/powerpc/kernel/dma-iommu.c:16:6: note: in expansion of macro 'arch_dma=
_map_page_direct'
   16 | bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dma-map-ops.h:329:43: error: expected identifier or '(' befor=
e numeric constant
  329 | #define arch_dma_unmap_page_direct(d, a) (0)
      |                                           ^
arch/powerpc/kernel/dma-iommu.c:26:6: note: in expansion of macro 'arch_dma=
_unmap_page_direct'
   26 | bool arch_dma_unmap_page_direct(struct device *dev, dma_addr_t dma_=
handle)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dma-map-ops.h:330:42: error: expected identifier or '(' befor=
e numeric constant
  330 | #define arch_dma_map_sg_direct(d, s, n) (0)
      |                                          ^
arch/powerpc/kernel/dma-iommu.c:34:6: note: in expansion of macro 'arch_dma=
_map_sg_direct'
   34 | bool arch_dma_map_sg_direct(struct device *dev, struct scatterlist =
*sg,
      |      ^~~~~~~~~~~~~~~~~~~~~~
include/linux/dma-map-ops.h:331:44: error: expected identifier or '(' befor=
e numeric constant
  331 | #define arch_dma_unmap_sg_direct(d, s, n) (0)
      |                                            ^
arch/powerpc/kernel/dma-iommu.c:51:6: note: in expansion of macro 'arch_dma=
_unmap_sg_direct'
   51 | bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlis=
t *sg,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  4e52b96ac85c ("powerpc/dma: Fallback to dma_ops when persistent memory pr=
esent")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 27 Nov 2020 17:49:28 +1100
Subject: [PATCH] powerpc/dma: fix for "powerpc/dma: Fallback to dma_ops when
 persistent memory present"

Fixes: 4e52b96ac85c ("powerpc/dma: Fallback to dma_ops when persistent memo=
ry present")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/dma-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iomm=
u.c
index c724548ca295..6364311eb6e9 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -10,6 +10,8 @@
 #include <linux/pci.h>
 #include <asm/iommu.h>
=20
+#ifdef CONFIG_ARCH_HAS_DMA_MAP_DIRECT
+
 #define can_map_direct(dev, addr) \
 	((dev)->bus_dma_limit >=3D phys_to_dma((dev), (addr)))
=20
@@ -64,6 +66,7 @@ bool arch_dma_unmap_sg_direct(struct device *dev, struct =
scatterlist *sg,
=20
 	return true;
 }
+#endif /* CONFIG_ARCH_HAS_DMA_MAP_DIRECT */
=20
 /*
  * Generic iommu implementation
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/UeGbi9WUl5IjfbsLMyXKu1l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Ao3kACgkQAVBC80lX
0GyMaQf7Bs68XJVVI64v3WvzDcaYyEsvPX4weiDxX2f8VMlNxlzOoeHiFZrjkc66
0Li5ZbT4h0ou2tZGjggcpuQz47rP/G6hYRDGg9iIb1uT3TP6IPHLH6glWFGBRKcq
tPaZNwQgMGNjTmDsnDss6xokFCZsImkQsaKv8RcHQX54AM6OU/VyXNSZ2Xxu0kD0
thgPIoIdcQpuPqdreb+JdZHDJCKYHfz9kw8xxBzQBPG9cuwhPNPxNGTlBY6dOeP4
E1fhDBGgj9gh8dWURPZB0N0Qi/dz8v8i4YGlFfmNPcBPE3YPkcgb0CC3KkAkvY3V
M97C7NlyLEqgEl3eQhmgyntQdAAClg==
=7Ucg
-----END PGP SIGNATURE-----

--Sig_/UeGbi9WUl5IjfbsLMyXKu1l--
