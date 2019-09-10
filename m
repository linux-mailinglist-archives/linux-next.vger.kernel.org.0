Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D38E3AE8F3
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 13:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392850AbfIJLRr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 07:17:47 -0400
Received: from foss.arm.com ([217.140.110.172]:33130 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730842AbfIJLRq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 07:17:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F164B1000;
        Tue, 10 Sep 2019 04:17:45 -0700 (PDT)
Received: from red-moon.cambridge.arm.com (unknown [10.37.12.160])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69DCE3F59C;
        Tue, 10 Sep 2019 04:17:44 -0700 (PDT)
Date:   Tue, 10 Sep 2019 12:17:37 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Haiyang Zhang <haiyangz@microsoft.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20190910111737.GA4382@red-moon.cambridge.arm.com>
References: <20190821071939.11382b44@canb.auug.org.au>
 <20190821090249.GA28112@e121166-lin.cambridge.arm.com>
 <DM6PR21MB13377560DB091B7F7C68E5E1CAB70@DM6PR21MB1337.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR21MB13377560DB091B7F7C68E5E1CAB70@DM6PR21MB1337.namprd21.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 09, 2019 at 11:10:06PM +0000, Haiyang Zhang wrote:
> 
> 
> > -----Original Message-----
> > From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Sent: Wednesday, August 21, 2019 5:03 AM
> > To: Stephen Rothwell <sfr@canb.auug.org.au>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>; Linux Next Mailing List <linux-
> > next@vger.kernel.org>; Linux Kernel Mailing List <linux-
> > kernel@vger.kernel.org>; Sasha Levin <sashal@kernel.org>; Haiyang Zhang
> > <haiyangz@microsoft.com>
> > Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
> > 
> > On Wed, Aug 21, 2019 at 07:19:39AM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Commit
> > >
> > >   c4a29fbba415 ("PCI: hv: Use bytes 4 and 5 from instance ID as the PCI
> > domain numbers")
> > >
> > > is missing a Signed-off-by from its committer.
> > >
> > > Also, all the tags should be kept together, please.
> > 
> > Fixed it up in my pci/hv branch, apologies.
> > 
> > Lorenzo
> 
> Hi thanks for fixing this, but I found the following commit now has the Subject line
> and commit message same as a previous patch.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers?id=87b20a08dcc265959f5c59f18603ea0487fe609b
> 
> The correct message for the patch should be the msg below. Any possibility to 
> fix it again?  Thanks.

I updated my pci/hv branch and rewrote the commit log, I will ask
Bjorn to update it so that it shows up in -next.

Lorenzo
