Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E6097353
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 09:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfHUH2I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 03:28:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47769 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbfHUH2I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Aug 2019 03:28:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Czln1f9yz9s3Z;
        Wed, 21 Aug 2019 17:28:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566372485;
        bh=wPWeN1x/xnP2KeMD0qC6khrfGWbyj7Ob6i60Qp2pX38=;
        h=Date:From:To:Cc:Subject:From;
        b=BvIHC8jM3AWxHvFBXed15QpJsxTc5Exq/T54DRsnbedQv7EWJu+9f+Sp+FTeQv0zX
         AhzAiplFZidFgRPL1CCLpXNC/W445yzI2+Yl8q5eV7R0HXaiRd1YpLT1ZEmTLEIDue
         YK0jsn/CZ4F3XA3X9e3yqTwFhOuDFLSg0KNUEvBka5E68hQ00PRr12UoY0fD/GwYYp
         nTXLib6ER4XixIIMxSh8Li4mPYTQUvWD7aAcdtX3LQINZASrDw/kt1t7eT8QUPbYgo
         rCxDArTKRTg20X0NiQkh1stpWV+hAoggETnLDVmblyqUru5Mvlavvojl1/uiLGewUT
         OxU4NEGm8Sowg==
Date:   Wed, 21 Aug 2019 17:28:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>
Subject: linux-next: manual merge of the akpm-current tree with the
 dma-mapping tree
Message-ID: <20190821172803.4dabc39a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1s5hQAxbmcyWfp1DMq3QwL3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1s5hQAxbmcyWfp1DMq3QwL3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm/Kconfig

between commit:

  936376f88ff1 ("arm: select the dma-noncoherent symbols for all swiotlb bu=
ilds")

from the dma-mapping tree and commit:

  83286f0dcb91 ("arm: use generic mmap top-down layout and brk randomizatio=
n")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/Kconfig
index dcf46f0e45c2,81b08b027e4e..000000000000
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@@ -7,9 -7,6 +7,8 @@@ config AR
  	select ARCH_HAS_BINFMT_FLAT
  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
  	select ARCH_HAS_DEVMEM_IS_ALLOWED
 +	select ARCH_HAS_DMA_COHERENT_TO_PFN if SWIOTLB
 +	select ARCH_HAS_DMA_MMAP_PGPROT if SWIOTLB
- 	select ARCH_HAS_ELF_RANDOMIZE
  	select ARCH_HAS_FORTIFY_SOURCE
  	select ARCH_HAS_KEEPINITRD
  	select ARCH_HAS_KCOV

--Sig_/1s5hQAxbmcyWfp1DMq3QwL3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1c8oMACgkQAVBC80lX
0GyvJAf+NUwZ4PS6pJ8uI8ebuOEGyGE3YBTnaPVIZgxwu9rI7UBZag0dnDQmf1N9
VPqh8x3gegKhRFW+xUo0yqXcXpXJVOLg3k2RBMJXnZ9qS4IaG43+N9yb6aQLMeMF
77juWGz+dlRU3Xyw7CYTjZ22e6AnwOPVzdUb9OliGFFNZ85oBobskx/A3rQ0q02F
RFZ10BgG7oA4YX2fDwdQoQbthN9rlXr1VtzHL3HZyCchm9un3NQINaw+YVzH4mFr
aj15iPx+SK04qU4sF1wVEwyQegKCFRStPHGdR3iz8JlV4V6Ib4mDEUk6cb0dkKJ+
Zj4yA/BCKeFhVFTFOIHW2uWkD3of4A==
=2tOc
-----END PGP SIGNATURE-----

--Sig_/1s5hQAxbmcyWfp1DMq3QwL3--
