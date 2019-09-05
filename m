Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC208A977C
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2019 02:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfIEAHC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 20:07:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56031 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbfIEAHC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Sep 2019 20:07:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46P1Fv4Vv9z9sBF;
        Thu,  5 Sep 2019 10:06:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567642019;
        bh=SGjMHE7u3hE2p7kKCzoJBEwTshTmrciNLgevu3T309c=;
        h=Date:From:To:Cc:Subject:From;
        b=pmHcEEEi+CCReKy7ZedCQubqPJs07QLbVMomVmnj7Iwbs9+8tkXW0be6dHCaB2DRa
         tfWB5Um8tN1SgmLh6qxRt35442P7OVEjPTIw9qbK9HJvu3Du/1yYlqwkMdwBHrPdJj
         WlrpoC58Yxf9E4IVF4ujJeJQ1oSLKqN6D8ESH0yQretPSxk1cWkrnB1VpWPn33Po/X
         3JU+t95BX8P9W2RwEVD8LW4fUWtl8m41KfyOyyIDWpDA3msPV6zt4cMYnnHFbxaMSQ
         L520DgXsHk+f7qufSwJoa/vs0H58f0qyh98+AQ6+FF6JG8lfcol2gZC7DoRP7w1NRd
         4kxQAibLrgKZw==
Date:   Thu, 5 Sep 2019 10:06:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Luck, Tony" <tony.luck@intel.com>, Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the ia64 tree with the dma-mapping tree
Message-ID: <20190905100654.6aaee8fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tCI0Wb7/=cLMW9_qg+_WW6U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tCI0Wb7/=cLMW9_qg+_WW6U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ia64 tree got a conflict in:

  arch/ia64/hp/common/sba_iommu.c
  arch/ia64/sn/pci/pci_dma.c

between commit:

  f9f3232a7d0a ("dma-mapping: explicitly wire up ->mmap and ->get_sgtable")

from the dma-mapping tree and commits:

  974f83ec1e5a ("ia64: rework iommu probing")
  cf07cb1ff4ea ("ia64: remove support for the SGI SN2 platform")

from the ia64 tree.

I fixed it up (I removed the second file and see below) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/ia64/hp/common/sba_iommu.c
index 4c0ea6c2833d,a7eff5e6d260..000000000000
--- a/arch/ia64/hp/common/sba_iommu.c
+++ b/arch/ia64/hp/common/sba_iommu.c
@@@ -2062,6 -2055,22 +2055,24 @@@ static int __init acpi_sba_ioc_init_acp
  /* This has to run before acpi_scan_init(). */
  arch_initcall(acpi_sba_ioc_init_acpi);
 =20
+ static int sba_dma_supported (struct device *dev, u64 mask)
+ {
+ 	/* make sure it's at least 32bit capable */
+ 	return ((mask & 0xFFFFFFFFUL) =3D=3D 0xFFFFFFFFUL);
+ }
+=20
+ static const struct dma_map_ops sba_dma_ops =3D {
+ 	.alloc			=3D sba_alloc_coherent,
+ 	.free			=3D sba_free_coherent,
+ 	.map_page		=3D sba_map_page,
+ 	.unmap_page		=3D sba_unmap_page,
+ 	.map_sg			=3D sba_map_sg_attrs,
+ 	.unmap_sg		=3D sba_unmap_sg_attrs,
+ 	.dma_supported		=3D sba_dma_supported,
++	.mmap			=3D dma_common_mmap,
++	.get_sgtable		=3D dma_common_get_sgtable,
+ };
+=20
  static int __init
  sba_init(void)
  {

--Sig_/tCI0Wb7/=cLMW9_qg+_WW6U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1wUZ4ACgkQAVBC80lX
0Gzy2Af/QJxrkI7hblDI7/YLcPR6lW27giUDSzjkBNoQYXfmZCFHM9+/YT7JuqMi
NfeHUGSxySWHOJ/fbZS+kSXcyEJ6TJUU5TUQ4ZBKRD9kvvKmR89Un+a+vPigGTBI
Jsre0ql+jHzzI2lZzJNgKgnjexYZswvcAi4x32VtpHiA21z0JTIH8+yXDaBWhsSx
YGLHPsD9wyaaikkNu0QKlIsz1flcops1IfmfYphtUytkNGHe/2fp+tRx4K8d9fY9
Xoy366uIxQsQAbG5H6xG90mK0ASiFaJQY44FzmEjMHxM1oiIF1Iy4PwWeWRJDepp
9yluK6Y2jrhh0RE0U1Jn0w7YhVoNNw==
=npfI
-----END PGP SIGNATURE-----

--Sig_/tCI0Wb7/=cLMW9_qg+_WW6U--
