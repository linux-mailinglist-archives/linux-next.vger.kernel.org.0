Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA891F4BFB
	for <lists+linux-next@lfdr.de>; Wed, 10 Jun 2020 06:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgFJEBj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Jun 2020 00:01:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725927AbgFJEBj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Jun 2020 00:01:39 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80B3220734;
        Wed, 10 Jun 2020 04:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591761697;
        bh=JgoxUrLGdtIT0rdQEolneUeAu0VWld204OmTx7TWZ6g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LpYD6v/zcuwQgpKRHtGYTbseMzq/O+zOZRzvj7M5x7Zb0QwrMmIack+kWn+pXZFZg
         3e8JV7AGFScc5BL2MA5SDBGuM1iQLGgyKol7JVEEBuP6OZ2RuPbthS+M72RGp12LTy
         H+SQ5YwqhFlA4pzrvAaXKqQY6YMuEDGWn/b0B4Nw=
Date:   Tue, 9 Jun 2020 21:01:37 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-Id: <20200609210137.e7aaf4efa9f8b9ff0bcdc1dc@linux-foundation.org>
In-Reply-To: <20200610134425.6dd32bf6@canb.auug.org.au>
References: <20200609224252.1704eff3@canb.auug.org.au>
        <20200610134425.6dd32bf6@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 10 Jun 2020 13:44:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Tue, 9 Jun 2020 22:42:52 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the akpm-current tree, today's linux-next build (sparc
> > defconfig) failed like this:
> > 
> > In file included from include/linux/mm.h:32:0,
> >                  from include/linux/memblock.h:13,
> >                  from arch/sparc/mm/srmmu.c:14:
> > include/linux/pgtable.h:74:27: error: redefinition of 'pte_offset_kernel'
> >  #define pte_offset_kernel pte_offset_kernel
> >                            ^
> > arch/sparc/mm/srmmu.c:144:8: note: in expansion of macro 'pte_offset_kernel'
> >  pte_t *pte_offset_kernel(pmd_t *dir, unsigned long address)
> >         ^~~~~~~~~~~~~~~~~
> > include/linux/pgtable.h:70:22: note: previous definition of 'pte_offset_kernel' was here
> >  static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
> >                       ^~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   292aa65ed13a ("mm: consolidate pte_index() and pte_offset_*() definitions")
> 
> This breakage is now in Linus' tree :-(

I've sent this in as well:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: arch/sparc/mm/srmmu.c: fix build

"mm: consolidate pte_index() and pte_offset_*() definitions" was supposed
to remove arch/sparc/mm/srmmu.c:pte_offset_kernel().

Fixes: 974b9b2c68f3d35 ("mm: consolidate pte_index() and pte_offset_*() definitions")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/sparc/mm/srmmu.c |   10 ----------
 1 file changed, 10 deletions(-)

--- a/arch/sparc/mm/srmmu.c~arch-sparc-mm-srmmuc-fix-build
+++ a/arch/sparc/mm/srmmu.c
@@ -140,16 +140,6 @@ void pmd_set(pmd_t *pmdp, pte_t *ptep)
 	set_pte((pte_t *)&pmd_val(*pmdp), __pte(SRMMU_ET_PTD | ptp));
 }
 
-/* Find an entry in the third-level page table.. */
-pte_t *pte_offset_kernel(pmd_t *dir, unsigned long address)
-{
-	void *pte;
-
-	pte = __nocache_va((pmd_val(*dir) & SRMMU_PTD_PMASK) << 4);
-	return (pte_t *) pte +
-	    ((address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1));
-}
-
 /*
  * size: bytes to allocate in the nocache area.
  * align: bytes, number to align at.
_

