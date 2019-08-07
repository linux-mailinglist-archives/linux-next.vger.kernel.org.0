Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C85E8855E7
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 00:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387999AbfHGWhZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 18:37:25 -0400
Received: from verein.lst.de ([213.95.11.211]:41024 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387536AbfHGWhZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 18:37:25 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 3363368CEE; Thu,  8 Aug 2019 00:37:22 +0200 (CEST)
Date:   Thu, 8 Aug 2019 00:37:22 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dma-mapping-fixes
 tree
Message-ID: <20190807223722.GA22875@lst.de>
References: <20190808082948.781f0033@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808082948.781f0033@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 08, 2019 at 08:29:48AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the dma-mapping-fixes tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
> 
> /home/sfr/next/next/mm/migrate.c: In function 'migrate_vma_collect':
> /home/sfr/next/next/mm/migrate.c:2350:61: error: 'mm_walk' undeclared (first use in this function)
>   mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL, mm_walk.mm,
>                                                              ^~~~~~~
> 
> Caused by commit
> 
>   f4c1f66bf710 ("pagewalk: seperate function pointers from iterator data")
> 
> I have applied the following patch for today:

That commit should not have been in that tree at all, let me check what
went wrong.
