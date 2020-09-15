Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9176326A3AB
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 12:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIOKxd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 06:53:33 -0400
Received: from foss.arm.com ([217.140.110.172]:60712 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgIOKxd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Sep 2020 06:53:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69EEE1FB;
        Tue, 15 Sep 2020 03:53:32 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E2933F718;
        Tue, 15 Sep 2020 03:53:31 -0700 (PDT)
Date:   Tue, 15 Sep 2020 11:53:26 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20200915105326.GA3351@e121166-lin.cambridge.arm.com>
References: <20200909123710.50b16d37@canb.auug.org.au>
 <CAL_Jsq+tH+zAjdoC807Z7-89P5e6BUHVXd4Udbcp21a3XPx=VQ@mail.gmail.com>
 <20200915134721.45396e42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915134721.45396e42@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 15, 2020 at 01:47:21PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 9 Sep 2020 10:06:20 -0600 Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Sep 8, 2020 at 8:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the pci tree, today's linux-next build (arm
> > > multi_v7_defconfig) produced this warning:  
> > 
> > Uggg. I guess 0-day just doesn't do arm32 builds anymore as it caught
> > more obscure build issues, but not this one (and some others I've had
> > recently).
> > 
> > > drivers/pci/controller/dwc/pci-dra7xx.c: In function 'dra7xx_pcie_establish_link':
> > > drivers/pci/controller/dwc/pci-dra7xx.c:142:6: warning: unused variable 'exp_cap_off' [-Wunused-variable]
> > >   142 |  u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > >       |      ^~~~~~~~~~~
> > >
> > > Introduced by commit
> > >
> > >   3af45d34d30c ("PCI: dwc: Centralize link gen setting")
> 
> I am still getting this warning.

I have pushed out a fix-up on my pci/dwc branch, the warning should
disappear as soon as Bjorn pulls it.

Thanks,
Lorenzo
