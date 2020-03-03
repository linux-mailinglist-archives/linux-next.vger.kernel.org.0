Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A13E3177BE9
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 17:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbgCCQ2v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 11:28:51 -0500
Received: from foss.arm.com ([217.140.110.172]:49430 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730115AbgCCQ2u (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Mar 2020 11:28:50 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 251F22F;
        Tue,  3 Mar 2020 08:28:50 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.71])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 962FE3F6C4;
        Tue,  3 Mar 2020 08:28:48 -0800 (PST)
Date:   Tue, 3 Mar 2020 16:28:46 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        suzuki.poulose@arm.com, Anders Roxell <anders.roxell@linaro.org>
Subject: Re: Linux-next-20200302: arm64 build failed
Message-ID: <20200303162846.GE823373@arrakis.emea.arm.com>
References: <CA+G9fYtAM-m0jygud+i0ymU+XknV9_GcAbDQChiD2NZjvQ+D3w@mail.gmail.com>
 <20200302104726.GA7995@willie-the-truck>
 <20200302135443.GA24831@linux.ibm.com>
 <20200302174553.GC4166275@arrakis.emea.arm.com>
 <c4c6b363-62a8-db27-6ab3-ca2f2d4d082c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4c6b363-62a8-db27-6ab3-ca2f2d4d082c@arm.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 03, 2020 at 09:34:45AM +0530, Anshuman Khandual wrote:
> On 03/02/2020 11:15 PM, Catalin Marinas wrote:
> > On Mon, Mar 02, 2020 at 03:54:43PM +0200, Mike Rapoport wrote:
> >> On Mon, Mar 02, 2020 at 10:47:27AM +0000, Will Deacon wrote:
> >>> [+Anshuman and Catalin]
> >>>
> >>> On Mon, Mar 02, 2020 at 01:58:26PM +0530, Naresh Kamboju wrote:
> >>>> Linux-Next 20200302 arm64 build failed due to below errors,
> >>>> Suspecting patch causing this build break.
> >>>>
> >>>> 87d900aef3e2  arm/arm64: add support for folded p4d page tables
> >>>>
> >>>> Error log,
> >>>> -------------
> >>>> arch/arm64/mm/mmu.c: In function 'unmap_hotplug_pud_range':
> >>>> include/linux/compiler.h:284:1: error: incompatible type for argument
> >>>> 1 of 'p4d_page_paddr'
> >>>>  ({         \
> >>>>  ^
> >>>> arch/arm64/include/asm/memory.h:270:45: note: in definition of macro
> >>>> '__phys_to_virt'
> >>>>  #define __phys_to_virt(x) ((unsigned long)((x) - physvirt_offset))
> >>>>                                              ^
> >>>> arch/arm64/include/asm/pgtable.h:629:42: note: in expansion of macro '__va'
> >>>>  #define pud_offset(dir, addr)  ((pud_t *)__va(pud_offset_phys((dir), (addr))))
> >>>>                                           ^~~~
> >>>> include/linux/compiler.h:293:22: note: in expansion of macro '__READ_ONCE'
> >>>>  #define READ_ONCE(x) __READ_ONCE(x, 1)
> >>>>                       ^~~~~~~~~~~
> >>>> arch/arm64/include/asm/pgtable.h:628:52: note: in expansion of macro 'READ_ONCE'
> >>>>  #define pud_offset_phys(dir, addr) (p4d_page_paddr(READ_ONCE(*(dir)))
> >>>> + pud_index(addr) * sizeof(pud_t))
> >>>>                                                     ^~~~~~~~~
> >>>> arch/arm64/include/asm/pgtable.h:629:47: note: in expansion of macro
> >>>> 'pud_offset_phys'
> >>>>  #define pud_offset(dir, addr)  ((pud_t *)__va(pud_offset_phys((dir), (addr))))
> >>>>                                                ^~~~~~~~~~~~~~~
> >>>> arch/arm64/mm/mmu.c:827:10: note: in expansion of macro 'pud_offset'
> >>>>    pudp = pud_offset(pgdp, addr);
> >>>>           ^~~~~~~~~~
> >>>
> >>> Looks like we need an implementation of unmap_hotplug_p4d_range() to
> >>> walk the dummy p4d level. Unfortunately, we don't have the folded p4d
> >>> patches in the arm64 tree so we'll either need a common branch or the
> >>> hotplug patches will need to be dropped for the moment.
> >>
> >> unmap_hotplug_p4d_range() is easy :)
> >>
> >> From c7a5d08ff51ca2057b6b0289c4423bdfd7643518 Mon Sep 17 00:00:00 2001
> >> From: Mike Rapoport <rppt@linux.ibm.com>
> >> Date: Mon, 2 Mar 2020 15:53:17 +0200
> >> Subject: [PATCH] arm64/mm: implement unmap_hotplug_p4d_range
> >>
> >> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> >> ---
> >>  arch/arm64/mm/mmu.c | 20 +++++++++++++++++++-
> >>  1 file changed, 19 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >> index 05ec8e5f1436..c76b11577558 100644
> >> --- a/arch/arm64/mm/mmu.c
> >> +++ b/arch/arm64/mm/mmu.c
> >> @@ -840,6 +840,24 @@ static void unmap_hotplug_pud_range(pgd_t *pgdp, unsigned long addr,
> >>  	} while (addr = next, addr < end);
> >>  }
> >>  
> >> +static void unmap_hotplug_p4d_range(pgd_t *pgd, unsigned long addr,
> >> +				unsigned long end, bool free_mapped)
> >> +{
> >> +	unsigned long next;
> >> +	pgd_t *p4dp, p4d;
> >> +
> >> +	do {
> >> +		next = p4d_addr_end(addr, end);
> >> +		p4dp = p4d_offset(pgd, addr);
> >> +		p4d = READ_ONCE(*p4dp);
> >> +		if (p4d_none(p4d))
> >> +			continue;
> >> +
> >> +		WARN_ON(!p4d_present(p4d));
> >> +		unmap_hotplug_pud_range(p4dp, addr, next, free_mapped);
> >> +	} while (addr = next, addr < end);
> >> +}
> >> +
> >>  static void unmap_hotplug_range(unsigned long addr, unsigned long end,
> >>  				bool free_mapped)
> >>  {
> >> @@ -854,7 +872,7 @@ static void unmap_hotplug_range(unsigned long addr, unsigned long end,
> >>  			continue;
> >>  
> >>  		WARN_ON(!pgd_present(pgd));
> >> -		unmap_hotplug_pud_range(pgdp, addr, next, free_mapped);
> >> +		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped);
> >>  	} while (addr = next, addr < end);
> >>  }
> > 
> > Thanks Mike. With the additional diff below, I can get it to build with
> > and without the p4d clean-up patches in -next. If Anshuman confirms that
> > they work, I can add them on top of the arm64 for-next/memory-hotremove
> > branch.
> 
> These two patches applied on next-20200302 works fine for hot-remove.

Do they also work on top of the vanilla kernel + your hotremove patches
(i.e. not on top of -next)?

> As the second patch also fixes the first one, IMHO both should be
> folded into a single one instead. Just wondering if this combined
> patch which enables P4D page table should be posted on the list or do
> I need to respin original hot remove patches again.

If your unmap patches plus the fixes from Mike and me work fine on top
of 5.6-rc3 (as well as when combined with linux-next), I'd prefer you
respin your patches to include the p4d support from start. Otherwise, we
create a single patch that Andrew can merge on top of the -mm tree.

-- 
Catalin
