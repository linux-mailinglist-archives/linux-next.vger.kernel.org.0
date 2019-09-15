Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03087B3108
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2019 19:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbfIORFg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 13:05:36 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:35330 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfIORFg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 13:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=From:Date:Message-Id:Subject:Cc:To
        :Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AuyiDl8MDIGY+YbRU7Ob/LNbuZpmlRDPfc8s26NwqD0=; b=rLov94ayWD0TEgXKeNyuxm8M/
        K1Y9Ti7XIGyDhTniykL7jHqIIx889o5Ak48DqAcGpJY7Jw97pGRbwkQsDAr5g58gBd0CDhjd23n2z
        NPpPHs0GGB92EzM6NeJKzZwgyAgDLd9mxf5RqXvm137i6oL8BVUvc2p5hmzMQEvF/cZGk=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9Xxo-0000hO-LD; Sun, 15 Sep 2019 17:05:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id CCE4A274154D; Sun, 15 Sep 2019 18:05:26 +0100 (BST)
To:     "Luck, Tony" <tony.luck@intel.com>, Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the ia64 tree with the dma-mapping tree
Message-Id: <20190915170526.CCE4A274154D@ypsilon.sirena.org.uk>
Date:   Sun, 15 Sep 2019 18:05:26 +0100 (BST)
From:   Mark Brown <broonie@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the ia64 tree got a conflict in:

   arch/ia64/hp/common/sba_iommu.c

between commit:

   f9f3232a7d0ab73 ("dma-mapping: explicitly wire up ->mmap and ->get_sgtable")

from the dma-mapping tree and commit:

   974f83ec1e5afee ("ia64: rework iommu probing")

from the ia64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/ia64/hp/common/sba_iommu.c
index 4c0ea6c2833d4,a7eff5e6d2606..0000000000000
--- a/arch/ia64/hp/common/sba_iommu.c
+++ b/arch/ia64/hp/common/sba_iommu.c
@@@ -2062,6 -2055,22 +2055,24 @@@ static int __init acpi_sba_ioc_init_acp
  /* This has to run before acpi_scan_init(). */
  arch_initcall(acpi_sba_ioc_init_acpi);
  
+ static int sba_dma_supported (struct device *dev, u64 mask)
+ {
+ 	/* make sure it's at least 32bit capable */
+ 	return ((mask & 0xFFFFFFFFUL) == 0xFFFFFFFFUL);
+ }
+ 
+ static const struct dma_map_ops sba_dma_ops = {
+ 	.alloc			= sba_alloc_coherent,
+ 	.free			= sba_free_coherent,
+ 	.map_page		= sba_map_page,
+ 	.unmap_page		= sba_unmap_page,
+ 	.map_sg			= sba_map_sg_attrs,
+ 	.unmap_sg		= sba_unmap_sg_attrs,
+ 	.dma_supported		= sba_dma_supported,
++	.mmap			= dma_common_mmap,
++	.get_sgtable		= dma_common_get_sgtable,
+ };
+ 
  static int __init
  sba_init(void)
  {
