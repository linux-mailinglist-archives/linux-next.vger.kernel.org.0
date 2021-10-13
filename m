Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856F142B255
	for <lists+linux-next@lfdr.de>; Wed, 13 Oct 2021 03:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236401AbhJMBpk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 21:45:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:59392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236387AbhJMBpk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Oct 2021 21:45:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70A9A60BD3;
        Wed, 13 Oct 2021 01:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634089417;
        bh=BtVXasb17gQoO1yUdHSlSuTzUpMomgI5u9AN5Is0OHI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=ns9gpzDZ2u0VvxxihGESKjy8uR2zYJebJ+ZAl/0fTDj3urjPlGXvB0IdrLlget9r5
         fMmlCeprovRbfigXEADRqVWgRPMv7q5hG9XiN+PCJt0SgKZNtAkWrgj1E3MKSl6FrM
         AncOxQOI7lU4sVcLa7+58dwEypUH2HYaDEcouBotxogelqnTEA3E8xKDArHW1rJkNl
         OvrpnX2tevTzLf4zjrG63zgYbie3zL+sqtFT/tmWUPW7rr/0Mpkt0oqZCtibNJULwY
         BKHjiTL3exbXtvv90kJlsuH3vCpMta/DPAq+TWU7TgVy0VxiLNy12a6XdLKhyCLane
         tvlGTwsTCaOdg==
Date:   Tue, 12 Oct 2021 20:43:35 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Marc Zyngier <maz@kernel.org>, bhelgaas@google.com,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: linux-next: build failure after merge of the iommu tree
Message-ID: <20211013014335.GA1861225@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012112150.GA27560@lpieralisi>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 12, 2021 at 12:21:58PM +0100, Lorenzo Pieralisi wrote:
> On Tue, Oct 12, 2021 at 09:33:48AM +0100, Marc Zyngier wrote:
> > [+ Sven]
> > 
> > On Tue, 12 Oct 2021 04:46:39 +0100,
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > Hi all,
> > > 
> > > After merging the iommu tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/iommu/apple-dart.c: In function 'apple_dart_get_resv_regions':
> > > drivers/iommu/apple-dart.c:758:2: error: implicit declaration of function 'iommu_dma_get_resv_regions'; did you mean 'iommu_get_resv_regions'? [-Werror=implicit-function-declaration]
> > >   758 |  iommu_dma_get_resv_regions(dev, head);
> > >       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > >       |  iommu_get_resv_regions
> > > cc1: all warnings being treated as errors
> > > 
> > > Caused by commit
> > > 
> > >   b2b2781a9755 ("iommu/dart: Clean up IOVA cookie crumbs")
> > > 
> > > interactig with commit
> > > 
> > >   05dc551614a4 ("iommu/dart: Exclude MSI doorbell from PCIe device IOVA range")
> > > 
> > > from the pci tree.
> > > 
> > > I have applied the following merge fix patch.
> > > 
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Tue, 12 Oct 2021 14:40:49 +1100
> > > Subject: [PATCH] fix for "iommu/dart: Exclude MSI doorbell from PCIe device
> > >  IOVA range"
> > > 
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/iommu/apple-dart.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> > > index 912be9b7669c..280ff8df728d 100644
> > > --- a/drivers/iommu/apple-dart.c
> > > +++ b/drivers/iommu/apple-dart.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/bitfield.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/dev_printk.h>
> > > +#include <linux/dma-iommu.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/err.h>
> > >  #include <linux/interrupt.h>
> > 
> > Thanks for fixing this. Lorenzo, do you mind slapping this on top of
> > the Apple PCIe series?
> 
> I think this will have to be done by Bjorn at PR time, depending on
> IOMMU<->PCI trees PRs timing, please correct me if I am wrong, we
> have to reintroduce the line above since it is deleted by:
> 
> b2b2781a9755 ("iommu/dart: Clean up IOVA cookie crumbs")
> 
> in the IOMMU tree.

Sure, no problem.  I made a note to check for this when I send the
pull request and fix it up or mention it to Joerg and/or Linus as
necessary.

Thanks for the heads-up!

Bjorn
