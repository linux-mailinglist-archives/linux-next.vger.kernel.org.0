Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A961AD75E
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 09:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgDQH1b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 03:27:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:38386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728419AbgDQH1a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 03:27:30 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0043E214D8;
        Fri, 17 Apr 2020 07:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587108450;
        bh=sZPdquSmWObvcVprXcu9wp/fXhiv+7HVz8zcOSI5lYk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nXAWKkYp/UkrVCH9PRC4m6yPfP0o7CM8ohKlA6NsAB3F3Ps/gOE/TtfzWkqVdxfia
         tkGophg2WGSXLhDMrovmtlNK5kg7w1LmpyfQBw6pFFNcDLyskbYysMPm0BvPAAsE4e
         BeSypltYjjRE1QUpIQWjCk+meDIsEymN7Q/cpumA=
Date:   Fri, 17 Apr 2020 09:27:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>
Subject: Re: linux-next: Tree for Apr 17
Message-ID: <20200417092725.4876a832@coco.lan>
In-Reply-To: <aeedbf33-2dc1-0577-301d-535f49ba287e@de.ibm.com>
References: <20200417145017.3932443d@canb.auug.org.au>
        <aeedbf33-2dc1-0577-301d-535f49ba287e@de.ibm.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Fri, 17 Apr 2020 09:19:58 +0200
Christian Borntraeger <borntraeger@de.ibm.com> escreveu:

> On 17.04.20 06:50, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200416:
> > 
> > My fixes tree contains:
> > 
> >   6b038bdcd3d1 sh: mm: Fix build error
> > 
> > The qcom tree still had its build failure for which I reverted a commit.
> > 
> > The sound-asoc tree still has its failures so I used the version from
> > next-20200414.
> > 
> > The crypto tree gained a build failure for which I reverted 5 commits.
> > 
> > Non-merge commits (relative to Linus' tree): 2255
> >  3007 files changed, 64848 insertions(+), 29193 deletions(-)
> >   
> 
> 
> This fails for s390 already in kconfig
> 
> $ make defconfig
> *** Default configuration is based on 'defconfig'
> drivers/pci/Kconfig:16:error: recursive dependency detected!
> drivers/pci/Kconfig:16:	symbol PCI is selected by CEC_SECO
> drivers/media/cec/platform/Kconfig:100:	symbol CEC_SECO depends on MEDIA_CEC_SUPPORT
> drivers/media/cec/Kconfig:27:	symbol MEDIA_CEC_SUPPORT default is visible depending on MEDIA_SUPPORT_FILTER
> drivers/media/Kconfig:25:	symbol MEDIA_SUPPORT_FILTER depends on MEDIA_SUPPORT
> drivers/media/Kconfig:12:	symbol MEDIA_SUPPORT depends on HAS_IOMEM
> arch/s390/Kconfig:722:	symbol HAS_IOMEM default value contains PCI
> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> subsection "Kconfig recursive dependency limitations"

Just pushed a patch addressing the reported Kconfig issues on media.

Sorry for the Kconfig noise. We did a major rework at media Kconfig, with
has a very complex dependency chain. 

Thanks,
Mauro
