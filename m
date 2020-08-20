Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B6124C6C5
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 22:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgHTUcM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 16:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbgHTUcJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Aug 2020 16:32:09 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35145C061385;
        Thu, 20 Aug 2020 13:32:09 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q93so1639547pjq.0;
        Thu, 20 Aug 2020 13:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G3xCXzeUDIhCl6owaiUBzRZG/Sfi/OOI40JT8zMVERQ=;
        b=LrvBm3zli7Ms8zRyZKSzRIeqErF/PBZRswt+dMOiW8+pwctmZ838SG2Kji8iImez3t
         K6d+IHn4O0FHe6xXgsIkkf7xF1AUdl6d/060277krMkym1ctH6mgpxSXcFm58RDD9yP2
         56H0k+ZpyL1e9sAgo/Glsjqo1EEs4k48bK5nOAaBxWjHA/PEP/R14OwQAfrTHFReoSBK
         R5aK1/4KanAPIFxgeScUiQXPX9lwNvdbN8/5XkRSAmiQdOoAcrodsIaW5EyUttONw/rB
         j16n/NksBOagHTsKC+MJoQ7dlYSt9izZqQot25nllQfkMBgAowe/295tlKNAXjtw2Goi
         Bf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G3xCXzeUDIhCl6owaiUBzRZG/Sfi/OOI40JT8zMVERQ=;
        b=UM2dw88wOP0JGnaLxesz421Gv8HtOmGpGi6QUk8Ti5p0hNHItUtZeVpsc6hH2Fx7J5
         DcrcT/vXsRnqeTrJ+5W25qQtJgyY6/ryD9xrbqRn7Ima7w8hR9tozDS94Ow5bygLnwSr
         kUcedaAHSu8JXMvbvL7beJYe2J5ABWmDP2KCImy4F72hrakTBre/xyO4d0JvyhwStOCb
         Xhz6tDKMGMhe5IExCp8WShqyKfoJ/9M6W4uK6wr4bjlX/94I5roXOBa8twM6ls2gdw48
         LjbLHsc85l+gWF7nFt48w8tAqwMhBidiXg3s/FPVUhmoZXGMEzx2XTeLfC0d2VkJ5PwG
         O4sw==
X-Gm-Message-State: AOAM5304JKNP9Y6rBSE+YRHDai8N+p/WmavV4D13Cg86X9M0KF6ZrdaJ
        4Psr1IAoTfkSS4bmKEmu5XzUs+gKr9etIg==
X-Google-Smtp-Source: ABdhPJwcTX8qLks5xw2PCSfN+/HPbMeilOKASUrn6up2ACzHypzCNxOPD+Tf4vwZK6uSXiLTEaNy7A==
X-Received: by 2002:a17:90a:39c8:: with SMTP id k8mr32027pjf.19.1597955528429;
        Thu, 20 Aug 2020 13:32:08 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id bv17sm2894418pjb.0.2020.08.20.13.32.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 13:32:08 -0700 (PDT)
Date:   Thu, 20 Aug 2020 13:31:53 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the dma-mapping tree
Message-ID: <20200820203153.GA13251@Asurada-Nvidia>
References: <20200820155112.29459f41@canb.auug.org.au>
 <20200820083617.GA6124@Asurada>
 <20200820154941.GA11349@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820154941.GA11349@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 20, 2020 at 05:49:41PM +0200, Christoph Hellwig wrote:
> On Thu, Aug 20, 2020 at 01:36:17AM -0700, Nicolin Chen wrote:
> > Took a quick look -- the boundary_size is seemingly passed from
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/powerpc/kernel/iommu.c#n240
> > 
> > 	boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
> > 			1 << tbl->it_page_shift);
> > 
> > Looks like an overflow happens due to (ULONG_MAX + 1). Should
> > we fix here instead (or also)?
> 
> Yes, please.  I'll drop the patch again for now, but once we've
> got this sorted out I'll readd it.

I'll send a series of changes, as I found these...

   1    145  arch/alpha/kernel/pci_iommu.c <<iommu_arena_find_pages>>
             boundary_size = dma_get_seg_boundary(dev) + 1;
   2    488  arch/ia64/hp/common/sba_iommu.c <<sba_search_bitmap>>
             boundary_size = (unsigned long long )dma_get_seg_boundary(dev) + 1;
   3    266  arch/s390/pci/pci_dma.c <<__dma_alloc_iommu>>
             boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
   4    170  arch/sparc/kernel/iommu-common.c <<iommu_tbl_range_alloc>>
             boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
   5    475  arch/sparc/kernel/iommu.c <<dma_4u_map_sg>>
             seg_boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
   6    511  arch/sparc/kernel/pci_sun4v.c <<dma_4v_map_sg>>
             seg_boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
   7     97  arch/x86/kernel/amd_gart_64.c <<alloc_iommu>>
             base_index = ALIGN(iommu_bus_base & dma_get_seg_boundary(dev),
   8     99  arch/x86/kernel/amd_gart_64.c <<alloc_iommu>>
             boundary_size = ALIGN((u64)dma_get_seg_boundary(dev) + 1,
   9    359  drivers/parisc/ccio-dma.c <<ccio_alloc_range>>
             boundary_size = ALIGN((unsigned long long )dma_get_seg_boundary(dev) + 1,
  10    110  drivers/parisc/iommu-helpers.h <<iommu_coalesce_chunks>>
             unsigned int max_seg_boundary = dma_get_seg_boundary(dev) + 1;
  11    345  drivers/parisc/sba_iommu.c <<sba_search_bitmap>>
             boundary_size = ALIGN((unsigned long long )dma_get_seg_boundary(dev) + 1,
