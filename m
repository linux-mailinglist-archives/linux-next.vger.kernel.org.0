Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFC235E479
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 18:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347083AbhDMQ7d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 12:59:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347027AbhDMQ7Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Apr 2021 12:59:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 549B261369;
        Tue, 13 Apr 2021 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618333136;
        bh=88sxkTyTYXWLYzDFmz+5zZjfypnmUNRe54tb4TzzXuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BGifDH0+LRI4gqrat5z5WqjW3NUyxkx6fQlp29sBMsCaQ9nOSEFtAam2/C4qyryve
         hMKTAEMB5cFTodZB0y8R2Yqj/BNP4PQLV09TgNcnbLUxc04VuxL/J1ur4dqqCpU2gu
         BTMZPKQZCM+8olTGsMoxuyuccu8fnnFkh5FVCg9jhuI0rJHDwG3WEMztHJOQXEag70
         8fBqWMRZXJ7U7fcPpu4cmUYaaMWLm7YWQLn1YXk8ofLcPPzQ7aXcOq5lY4vvsrTfNy
         LIiARWJuyEkWhDGxTMZJHcOKIC1DqL1TOgfvCQyrDf8Xf6qNU0KgaZI98bz3rzYsqQ
         C7xW9ItkUdRLw==
Date:   Tue, 13 Apr 2021 19:58:49 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Subject: Re: linux-next: Tree for Apr 9 (x86 boot problem)
Message-ID: <YHXNyVVUwZbVDBrr@kernel.org>
References: <20210409215103.03999588@canb.auug.org.au>
 <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org>
 <YHPlTifk6jST5auY@kernel.org>
 <aa83b81e-a03d-b835-6b45-01efc7e08dce@infradead.org>
 <YHR86T15BzETVHhk@kernel.org>
 <d56ebb95-1c40-5994-383f-70d8f226e8c3@infradead.org>
 <YHU03AIwrpHCUlU/@kernel.org>
 <7cec048d-26f0-104a-6bca-d9afc6a7d1e8@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cec048d-26f0-104a-6bca-d9afc6a7d1e8@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 12, 2021 at 11:21:48PM -0700, Randy Dunlap wrote:
> On 4/12/21 11:06 PM, Mike Rapoport wrote:
> > Hi Randy,
> > 
> > On Mon, Apr 12, 2021 at 01:53:34PM -0700, Randy Dunlap wrote:
> >> On 4/12/21 10:01 AM, Mike Rapoport wrote:
> >>> On Mon, Apr 12, 2021 at 08:49:49AM -0700, Randy Dunlap wrote:
> >>>  
> >>> I thought about adding some prints to see what's causing the hang, the
> >>> reservations or their absence. Can you replace the debug patch with this
> >>> one:
> >>>
> >>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> >>> index 776fc9b3fafe..a10ac252dbcc 100644
> >>> --- a/arch/x86/kernel/setup.c
> >>> +++ b/arch/x86/kernel/setup.c
> >>> @@ -600,10 +600,13 @@ static bool __init snb_gfx_workaround_needed(void)
> >>>  		return false;
> >>>  
> >>>  	vendor = read_pci_config_16(0, 2, 0, PCI_VENDOR_ID);
> >>> +	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
> >>> +
> >>> +	pr_info("%s: vendor: %x, device: %x\n", __func__, vendor, device);
> >>
> >> s/device)/devid)/
> >  
> > Oh, sorry.
> > 
> >>> +
> >>>  	if (vendor != 0x8086)
> >>>  		return false;
> >>>  
> >>> -	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
> >>>  	for (i = 0; i < ARRAY_SIZE(snb_ids); i++)
> >>>  		if (devid == snb_ids[i])
> >>>  			return true;
> >>
> >> That prints:
> >>
> >> [    0.000000] snb_gfx_workaround_needed: vendor: 8086, device: 126
> >> [    0.000000] early_reserve_memory: snb_gfx: 1
> >> ...
> >> [    0.014061] snb_gfx_workaround_needed: vendor: 8086, device: 126
> >> [    0.014064] reserving inaccessible SNB gfx pages
> >>
> >>
> >> The full boot log is attached.
> >  
> > Can you please send the log with memblock=debug added to the kernel command
> > line?
> > 
> > Probably should have started from this...
> > 
> 
> It's attached.

Honestly, I can't see any reason why moving these reservations around would
cause your laptop to hang.
Let's try moving the reservations back to their original place one by
one, e.g something like this:

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 776fc9b3fafe..892ad20b8557 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -632,12 +632,6 @@ static void __init trim_snb_memory(void)
 
 	printk(KERN_DEBUG "reserving inaccessible SNB gfx pages\n");
 
-	/*
-	 * Reserve all memory below the 1 MB mark that has not
-	 * already been reserved.
-	 */
-	memblock_reserve(0, 1<<20);
-	
 	for (i = 0; i < ARRAY_SIZE(bad_pages); i++) {
 		if (memblock_reserve(bad_pages[i], PAGE_SIZE))
 			printk(KERN_WARNING "failed to reserve 0x%08lx\n",
@@ -1081,6 +1075,12 @@ void __init setup_arch(char **cmdline_p)
 
 	reserve_real_mode();
 
+	/*
+	 * Reserve all memory below the 1 MB mark that has not
+	 * already been reserved.
+	 */
+	memblock_reserve(0, 1<<20);
+
 	init_mem_mapping();
 
 	idt_setup_early_pf();

-- 
Sincerely yours,
Mike.
