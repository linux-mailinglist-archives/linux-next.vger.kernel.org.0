Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B97EDA58B7
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 16:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730218AbfIBODt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 10:03:49 -0400
Received: from 8bytes.org ([81.169.241.247]:52798 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729865AbfIBODt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 10:03:49 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A99D71AD; Mon,  2 Sep 2019 16:03:47 +0200 (CEST)
Date:   Mon, 2 Sep 2019 16:03:47 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Tom Lendacky <thomas.lendacky@amd.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Message-ID: <20190902140347.GA23482@8bytes.org>
References: <20190902163951.6280e030@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902163951.6280e030@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

tl;dr: And IOMMU commit introduces a new user for sme_active() in
       generic code, and commit

       	284e21fab2cf x86, s390/mm: Move sme_active() and sme_me_mask to x86-specific header

       breaks the build of drivers/iommu/ for all architectures not
       implementing sme_active().

On Mon, Sep 02, 2019 at 04:39:51PM +1000, Stephen Rothwell wrote:
> drivers/iommu/iommu.c: In function 'iommu_subsys_init':
> drivers/iommu/iommu.c:123:38: error: implicit declaration of function 'sme_active'; did you mean 'cpu_active'? [-Werror=implicit-function-declaration]
>   123 |   if (iommu_default_passthrough() && sme_active()) {
>       |                                      ^~~~~~~~~~
>       |                                      cpu_active
> 
> Caused by commit
> 
>   2cc13bb4f59f ("iommu: Disable passthrough mode when SME is active")


Actually it is caused by:

	commit 284e21fab2cfcf90dacce565e0b12f29e5df00c1
	Author: Thiago Jung Bauermann <bauerman@linux.ibm.com>
	Date:   Tue Aug 6 01:49:17 2019 -0300

	    x86, s390/mm: Move sme_active() and sme_me_mask to x86-specific header

which removes the sme_active prototype from the generic headers. The
iommu commit is in next already for a couple of days and didn't cause
problems before.

> sme_active() seems to be only relevant to X86.

It has an implementation on x86 and s390.

> I have reverted that commit for today.

Thanks, but I suggest reverting above commit instead.


Regards,

	Joerg
