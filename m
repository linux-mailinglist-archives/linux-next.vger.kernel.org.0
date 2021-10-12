Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5997742A31E
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 13:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236149AbhJLLYL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 07:24:11 -0400
Received: from foss.arm.com ([217.140.110.172]:36466 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236177AbhJLLYL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Oct 2021 07:24:11 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 745921FB;
        Tue, 12 Oct 2021 04:22:09 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5989B3F694;
        Tue, 12 Oct 2021 04:22:08 -0700 (PDT)
Date:   Tue, 12 Oct 2021 12:21:58 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Marc Zyngier <maz@kernel.org>, bhelgaas@google.com
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: linux-next: build failure after merge of the iommu tree
Message-ID: <20211012112150.GA27560@lpieralisi>
References: <20211012144639.0af3457c@canb.auug.org.au>
 <87ily2prpv.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ily2prpv.wl-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 12, 2021 at 09:33:48AM +0100, Marc Zyngier wrote:
> [+ Sven]
> 
> On Tue, 12 Oct 2021 04:46:39 +0100,
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > Hi all,
> > 
> > After merging the iommu tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/iommu/apple-dart.c: In function 'apple_dart_get_resv_regions':
> > drivers/iommu/apple-dart.c:758:2: error: implicit declaration of function 'iommu_dma_get_resv_regions'; did you mean 'iommu_get_resv_regions'? [-Werror=implicit-function-declaration]
> >   758 |  iommu_dma_get_resv_regions(dev, head);
> >       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |  iommu_get_resv_regions
> > cc1: all warnings being treated as errors
> > 
> > Caused by commit
> > 
> >   b2b2781a9755 ("iommu/dart: Clean up IOVA cookie crumbs")
> > 
> > interactig with commit
> > 
> >   05dc551614a4 ("iommu/dart: Exclude MSI doorbell from PCIe device IOVA range")
> > 
> > from the pci tree.
> > 
> > I have applied the following merge fix patch.
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 12 Oct 2021 14:40:49 +1100
> > Subject: [PATCH] fix for "iommu/dart: Exclude MSI doorbell from PCIe device
> >  IOVA range"
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/iommu/apple-dart.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> > index 912be9b7669c..280ff8df728d 100644
> > --- a/drivers/iommu/apple-dart.c
> > +++ b/drivers/iommu/apple-dart.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/dev_printk.h>
> > +#include <linux/dma-iommu.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/err.h>
> >  #include <linux/interrupt.h>
> 
> Thanks for fixing this. Lorenzo, do you mind slapping this on top of
> the Apple PCIe series?

I think this will have to be done by Bjorn at PR time, depending on
IOMMU<->PCI trees PRs timing, please correct me if I am wrong, we
have to reintroduce the line above since it is deleted by:

b2b2781a9755 ("iommu/dart: Clean up IOVA cookie crumbs")

in the IOMMU tree.

Lorenzo

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
