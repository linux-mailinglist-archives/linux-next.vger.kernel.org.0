Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE2D3F0FDC
	for <lists+linux-next@lfdr.de>; Thu, 19 Aug 2021 03:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbhHSBNw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Aug 2021 21:13:52 -0400
Received: from ozlabs.org ([203.11.71.1]:35979 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234194AbhHSBNv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Aug 2021 21:13:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gqmwp5lvzz9sW8;
        Thu, 19 Aug 2021 11:13:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629335595;
        bh=7u0wdeh6ACq9jBfGv825le5pDJKccJA0CgcBvvgek88=;
        h=Date:From:To:Cc:Subject:From;
        b=sRP8PVYDGoxrDH2BQ48Lk0XAa0un4jljv1UPj40lcg44TZg6ahY/0F2qmLK0u8+nU
         eI9sYc49udwlrUpw+y0J9kDf3S1gsAm1moTfZwKnAWTxlU1N5YSigJ/WXtyTCM/ieZ
         S+S0PVHTEe0JXIG0CtQ6Qy9jW/aQy3Rf6Ya/i2ki1JNqk4SVA0xLUoXhaNNuVAUqBP
         F2EcjDbX+KWij28w1JI76m4kwcZleUOSWYQ174Hxgv8RuvBnkPegKw9eP5bo6MuEUc
         OFgo5TwXBj67ESR/tSIpuyhPTe7+Gf7q+JH9GjFVbAA1NbADoJsv8qICY5eqRlQqHC
         FxopVVQBSp6MQ==
Date:   Thu, 19 Aug 2021 11:13:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     Claire Chang <tientzu@chromium.org>,
        Konrad Rzeszutek Wilk <konrad@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the swiotlb tree with the dma-mapping
 tree
Message-ID: <20210819111312.697fc48f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0mLg.F44icl/ZW12lEmMpko";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0mLg.F44icl/ZW12lEmMpko
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the swiotlb tree got a conflict in:

  kernel/dma/direct.c

between commit:

  faf4ef823ac5 ("dma-direct: add support for dma_coherent_default_memory")

from the dma-mapping tree and commit:

  f4111e39a52a ("swiotlb: Add restricted DMA alloc/free support")

from the swiotlb tree.

I fixed it up (see below, though more may be needed) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/dma/direct.c
index 8dca4f97d12d,2de33e5d302b..000000000000
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@@ -155,15 -174,10 +174,16 @@@ void *dma_direct_alloc(struct device *d
  	}
 =20
  	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
 -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
 +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
 +	    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
- 	    !dev_is_dma_coherent(dev))
++	    !dev_is_dma_coherent(dev) &&
+ 	    !is_swiotlb_for_alloc(dev))
  		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
 =20
 +	if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
 +	    !dev_is_dma_coherent(dev))
 +		return dma_alloc_from_global_coherent(dev, size, dma_handle);
 +
  	/*
  	 * Remapping or decrypting memory may block. If either is required and
  	 * we can't block, allocate the memory from the atomic pools.
@@@ -259,9 -278,8 +284,10 @@@ void dma_direct_free(struct device *dev
  	}
 =20
  	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
 -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
 +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
 +	    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
- 	    !dev_is_dma_coherent(dev)) {
++	    !dev_is_dma_coherent(dev) &&
+ 	    !is_swiotlb_for_alloc(dev)) {
  		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
  		return;
  	}

--Sig_/0mLg.F44icl/ZW12lEmMpko
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEdsCkACgkQAVBC80lX
0GyPwAgAjVBKqHuPcc3QJt51ZEqbtRfX9HRJDpTEv3OPCL9h+8Jw72ApDgQuFK7o
Yh1GsqeKG0Q9WL1Y+xDbrLDZD12aTIHosJhs8XjOApQqtt7OKelgrLSA8qeeThR7
9z9upYoBL1wfrYivvgoqex0f0zxskLXjhbmbQnXIaspyp+v59wjkFlSFFPYZU2l3
Y3/Rk0JKxkEVEWLJf79g6MO7id9mhfnN7NhER9/9UgvBRmRMCFo9jpnE460W2vPP
MaBZdUZWmuO1nmhEVs0LUr9MHIZAutd+kRuEfDZ0UddlRVb3A/2KJcekEyTP4avC
D547ETBDmShm3+OzbUHHBFJp7uUhHQ==
=yHFk
-----END PGP SIGNATURE-----

--Sig_/0mLg.F44icl/ZW12lEmMpko--
