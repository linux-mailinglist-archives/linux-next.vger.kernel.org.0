Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554D035E63B
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 20:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345963AbhDMSXb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 14:23:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347629AbhDMSXb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Apr 2021 14:23:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21CA46052B;
        Tue, 13 Apr 2021 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618338191;
        bh=bWq8ZQzZGaqBvk3wr+VfKRVf4HmZjBRS1lMu/ifIRA0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HJlGS8J0O4m5aoN7qIMoKCldIQC/7d6e4v5CrhOndqHlfpyfSByTNQkKFot90JbXC
         Rc77GMwbwPQcGRhgeuhw1xbkB0iVfsMRezHL1r9GwQ3pR07pR2pGWUkpxfbfhtRyt1
         Gagw4Kx3HK4dPC+TQlPa6Pk4t6jdMq795426v3oukrbU+RDo1udTUExuFPJtgbhCty
         aNOKfXw6+gjf1u31j1mrfZnEfOuNyN8INO8MWE+rimL1JUtnrXRptxEkZeapdf5iu7
         62u54e+9lKZzmPhac39ft7CIesRhxETsny6JuQKwH5F6UZHuT8ELaBFHfZGoNmMKgq
         HR6rnHlLbBqoA==
Date:   Tue, 13 Apr 2021 21:23:02 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Subject: Re: linux-next: Tree for Apr 9 (x86 boot problem)
Message-ID: <YHXhhtCVf0RsgsDs@kernel.org>
References: <20210409215103.03999588@canb.auug.org.au>
 <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org>
 <YHPlTifk6jST5auY@kernel.org>
 <aa83b81e-a03d-b835-6b45-01efc7e08dce@infradead.org>
 <YHR86T15BzETVHhk@kernel.org>
 <d56ebb95-1c40-5994-383f-70d8f226e8c3@infradead.org>
 <YHU03AIwrpHCUlU/@kernel.org>
 <7cec048d-26f0-104a-6bca-d9afc6a7d1e8@infradead.org>
 <YHXNyVVUwZbVDBrr@kernel.org>
 <7bc072c0-bf10-bd0f-95db-0f0a7db47b93@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bc072c0-bf10-bd0f-95db-0f0a7db47b93@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 13, 2021 at 10:34:25AM -0700, Randy Dunlap wrote:
> On 4/13/21 9:58 AM, Mike Rapoport wrote:
> > On Mon, Apr 12, 2021 at 11:21:48PM -0700, Randy Dunlap wrote:
> >> On 4/12/21 11:06 PM, Mike Rapoport wrote:
> >>> Hi Randy,
> >>>
> >>> On Mon, Apr 12, 2021 at 01:53:34PM -0700, Randy Dunlap wrote:
> >>>> On 4/12/21 10:01 AM, Mike Rapoport wrote:
> >>>>> On Mon, Apr 12, 2021 at 08:49:49AM -0700, Randy Dunlap wrote:
> >>>>>  
> >>>>> I thought about adding some prints to see what's causing the hang, the
> >>>>> reservations or their absence. Can you replace the debug patch with this
> >>>>> one:
> >>>>>
> >>>>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> >>>>> index 776fc9b3fafe..a10ac252dbcc 100644
> >>>>> --- a/arch/x86/kernel/setup.c
> >>>>> +++ b/arch/x86/kernel/setup.c
> >>>>> @@ -600,10 +600,13 @@ static bool __init snb_gfx_workaround_needed(void)
> >>>>>  		return false;
> >>>>>  
> >>>>>  	vendor = read_pci_config_16(0, 2, 0, PCI_VENDOR_ID);
> >>>>> +	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
> >>>>> +
> >>>>> +	pr_info("%s: vendor: %x, device: %x\n", __func__, vendor, device);
> >>>>
> >>>> s/device)/devid)/
> >>>  
> >>> Oh, sorry.
> >>>
> >>>>> +
> >>>>>  	if (vendor != 0x8086)
> >>>>>  		return false;
> >>>>>  
> >>>>> -	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
> >>>>>  	for (i = 0; i < ARRAY_SIZE(snb_ids); i++)
> >>>>>  		if (devid == snb_ids[i])
> >>>>>  			return true;
> >>>>
> >>>> That prints:
> >>>>
> >>>> [    0.000000] snb_gfx_workaround_needed: vendor: 8086, device: 126
> >>>> [    0.000000] early_reserve_memory: snb_gfx: 1
> >>>> ...
> >>>> [    0.014061] snb_gfx_workaround_needed: vendor: 8086, device: 126
> >>>> [    0.014064] reserving inaccessible SNB gfx pages
> >>>>
> >>>>
> >>>> The full boot log is attached.
> >>>  
> >>> Can you please send the log with memblock=debug added to the kernel command
> >>> line?
> >>>
> >>> Probably should have started from this...
> >>>
> >>
> >> It's attached.
> > 
> > Honestly, I can't see any reason why moving these reservations around would
> > cause your laptop to hang.
> > Let's try moving the reservations back to their original place one by
> > one, e.g something like this:
> > 
> > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > index 776fc9b3fafe..892ad20b8557 100644
> > --- a/arch/x86/kernel/setup.c
> > +++ b/arch/x86/kernel/setup.c
> > @@ -632,12 +632,6 @@ static void __init trim_snb_memory(void)
> >  
> >  	printk(KERN_DEBUG "reserving inaccessible SNB gfx pages\n");
> >  
> > -	/*
> > -	 * Reserve all memory below the 1 MB mark that has not
> > -	 * already been reserved.
> > -	 */
> > -	memblock_reserve(0, 1<<20);
> > -	
> >  	for (i = 0; i < ARRAY_SIZE(bad_pages); i++) {
> >  		if (memblock_reserve(bad_pages[i], PAGE_SIZE))
> >  			printk(KERN_WARNING "failed to reserve 0x%08lx\n",
> > @@ -1081,6 +1075,12 @@ void __init setup_arch(char **cmdline_p)
> >  
> >  	reserve_real_mode();
> >  
> > +	/*
> > +	 * Reserve all memory below the 1 MB mark that has not
> > +	 * already been reserved.
> > +	 */
> > +	memblock_reserve(0, 1<<20);
> > +
> >  	init_mem_mapping();
> >  
> >  	idt_setup_early_pf();
> > 
> 
> Mike,
> That works.
> 
> Please send the next test.

I think I've found the reason. trim_snb_memory() reserved the entire first
megabyte very early leaving no room for real mode trampoline allocation.
Since this reservation is needed only to make sure integrated gfx does not
access some memory, it can be safely done after memblock allocations are
possible.

I don't know if it can be fixed on the graphics device driver side, but
from the setup_arch() perspective I think this would be the proper fix:

From c05f6046137abbcbb700571ce1ac54e7abb56a7d Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Tue, 13 Apr 2021 21:08:39 +0300
Subject: [PATCH] x86/setup: move trim_snb_memory() later in setup_arch to fix
 boot hangs

Commit a799c2bd29d1 ("x86/setup: Consolidate early memory reservations")
moved reservation of the memory inaccessible by Sandy Bride integrated
graphics very early and as the result on systems with such devices the
first 1M was reserved by trim_snb_memory() which prevented the allocation
of the real mode trampoline and made the boot hang very early.

Since the purpose of trim_snb_memory() is to prevent problematic pages ever
reaching the graphics device, it is safe to reserve these pages after
memblock allocations are possible.

Move trim_snb_memory later in boot so that it will be called after
reserve_real_mode() and make comments describing trim_snb_memory()
operation more elaborate.

Fixes: a799c2bd29d1 ("x86/setup: Consolidate early memory reservations")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/kernel/setup.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 59e5e0903b0c..ccdcfb19df1e 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -633,11 +633,16 @@ static void __init trim_snb_memory(void)
 	printk(KERN_DEBUG "reserving inaccessible SNB gfx pages\n");
 
 	/*
-	 * Reserve all memory below the 1 MB mark that has not
-	 * already been reserved.
+	 * SandyBridge integrated graphic devices have a bug that prevents
+	 * them from accessing certain memory ranges, namely anything below
+	 * 1M and in the pages listed in the bad_pages.
+	 *
+	 * To avoid these pages being ever accessed by SNB gfx device
+	 * reserve all memory below the 1 MB mark and bad_pages that have
+	 * not already been reserved at boot time.
 	 */
 	memblock_reserve(0, 1<<20);
-	
+
 	for (i = 0; i < ARRAY_SIZE(bad_pages); i++) {
 		if (memblock_reserve(bad_pages[i], PAGE_SIZE))
 			printk(KERN_WARNING "failed to reserve 0x%08lx\n",
@@ -746,8 +751,6 @@ static void __init early_reserve_memory(void)
 
 	reserve_ibft_region();
 	reserve_bios_regions();
-
-	trim_snb_memory();
 }
 
 /*
@@ -1083,6 +1086,13 @@ void __init setup_arch(char **cmdline_p)
 
 	reserve_real_mode();
 
+	/*
+	 * Reserving memory causing GPU hangs on Sandy Bridge integrated
+	 * graphic devices should be done after we allocated memory under
+	 * 1M for the real mode trampoline
+	 */
+	trim_snb_memory();
+
 	init_mem_mapping();
 
 	idt_setup_early_pf();
-- 
2.28.0

-- 
Sincerely yours,
Mike.
