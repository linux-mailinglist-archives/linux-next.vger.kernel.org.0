Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AFA2C50BE
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 09:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbgKZIvV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 03:51:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:52274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbgKZIvV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Nov 2020 03:51:21 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8EE0208CA;
        Thu, 26 Nov 2020 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606380680;
        bh=ZyUmz/13i0s91hvWopdVBdTzFRNuMAsz2RYvLQ+8THk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uoHagiOEf62vrKbA1Lt9R9qVdY7x7pftAx+gGSOK02uCqyFK4Lai1CEmrpzqUOEMh
         dq/xDznizqt+no1IDZ09r3W0gu2E2LtpZXgyw7XrzhzW2V85lmRotzc4yijvch97Lr
         NoNmQVyYHLQOUkhZAcQjh0DE+YJxIEszVOO57pwY=
Date:   Thu, 26 Nov 2020 08:51:15 +0000
From:   Will Deacon <will@kernel.org>
To:     Lu Baolu <baolu.lu@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the arm64 tree
Message-ID: <20201126085115.GA17797@willie-the-truck>
References: <20201126174851.200e0e58@canb.auug.org.au>
 <701c6589-b263-98bf-e48f-1eb890ff5856@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701c6589-b263-98bf-e48f-1eb890ff5856@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 26, 2020 at 04:46:31PM +0800, Lu Baolu wrote:
> On 2020/11/26 14:48, Stephen Rothwell wrote:
> > After merging the arm64 tree, today's linux-next build (htmldocs)
> > produced these warnings:
> > 
> > Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Unexpected indentation.
> > Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Block quote ends without a blank line; unexpected unindent.
> > Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Enumerated list ends without a blank line; unexpected unindent.
> > Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Unexpected indentation.
> > Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Block quote ends without a blank line; unexpected unindent.
> > 
> > Caused by commit
> > 
> >    63a816749d86 ("iommu: Document usage of "/sys/kernel/iommu_groups/<grp_id>/type" file")
> > 
> 
> Thanks for letting us know this. I will post a patch to fix it.

Thanks Baolu. I'll see if I can get htmldocs building locally as well...

Will
