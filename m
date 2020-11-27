Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB8732C61C3
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 10:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgK0JdI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 04:33:08 -0500
Received: from verein.lst.de ([213.95.11.211]:37002 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbgK0JdH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Nov 2020 04:33:07 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id C59F368B05; Fri, 27 Nov 2020 10:33:04 +0100 (CET)
Date:   Fri, 27 Nov 2020 10:33:04 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20201127093304.GA14976@lst.de>
References: <20201127175801.538fbb30@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127175801.538fbb30@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I fixed this as shown:

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index c724548ca295c0..111249fd619de8 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <asm/iommu.h>
 
+#ifdef CONFIG_ARCH_HAS_DMA_MAP_DIRECT
 #define can_map_direct(dev, addr) \
 	((dev)->bus_dma_limit >= phys_to_dma((dev), (addr)))
 
@@ -64,6 +65,7 @@ bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
 
 	return true;
 }
+#endif /* CONFIG_ARCH_HAS_DMA_MAP_DIRECT */
 
 /*
  * Generic iommu implementation
