Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2992CA436C
	for <lists+linux-next@lfdr.de>; Sat, 31 Aug 2019 10:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfHaItZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 31 Aug 2019 04:49:25 -0400
Received: from foss.arm.com ([217.140.110.172]:39376 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbfHaItZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 31 Aug 2019 04:49:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C85128;
        Sat, 31 Aug 2019 01:49:24 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82FA53F59C;
        Sat, 31 Aug 2019 01:49:23 -0700 (PDT)
Date:   Sat, 31 Aug 2019 09:49:17 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Vidya Sagar <vidyas@nvidia.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Krzysztof Wilczynski <kw@linux.com>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <20190831084917.GA27466@e121166-lin.cambridge.arm.com>
References: <20190830132311.7190ccc3@canb.auug.org.au>
 <CAErSpo618ewbJQHS3E3KWhTLe6T47u=Xjx9E-gYKMzjn=MmujA@mail.gmail.com>
 <9ae74244-f1e1-de7f-6d03-b2cca012f6fc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae74244-f1e1-de7f-6d03-b2cca012f6fc@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Aug 31, 2019 at 09:51:05AM +0530, Vidya Sagar wrote:
> On 8/30/2019 6:00 PM, Bjorn Helgaas wrote:
> > [+cc Krzysztof]
> > 
> > On Thu, Aug 29, 2019 at 10:23 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > Hi all,
> > > 
> > > After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > > 
> > > drivers/pci/controller/dwc/pcie-tegra194.c:24:10: fatal error: linux/pci-aspm.h: No such file or directory
> > >     24 | #include <linux/pci-aspm.h>
> > >        |          ^~~~~~~~~~~~~~~~~~
> > > 
> > > Caused by commit
> > > 
> > >    81564976b1a9 ("PCI: tegra: Add Tegra194 PCIe support")
> > > 
> > > I have reverted that commit for todat.
> > 
> > Thanks, Stephen.
> > 
> > I *could* fix this by removing that include in the merge, since the
> > contents of linux/pci-aspm.h were moved into linux/pci.h by
> > https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?id=7ce2e76a0420
> > 
> > But as far as I can tell, pcie-tegra194.c doesn't actually require
> > anything from linux/pci-aspm.h, so I'd rather amend the tegra194
> > commit https://git.kernel.org/cgit/linux/kernel/git/lpieralisi/pci.git/commit/?id=81564976b1a9
> > so it doesn't include pci-aspm.h in the first place.
> Thanks Bjorn for the reply.
> Yes. This header file is not required for now and can be removed.
> Is there any action required from my side for this?

I updated my pci/tegra branch so that Bjorn can pull it.

Lorenzo
