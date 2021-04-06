Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3ED355EBE
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 00:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbhDFW0B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 18:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhDFW0A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 18:26:00 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3F1C06174A;
        Tue,  6 Apr 2021 15:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Lv9inH6/JzKL+dsdFI0zhdYDt7kAUUz3xzcG22VTZYw=; b=mIDcijHeDBYowpdWP/OTXNBmWy
        Zsov5nniClxAdG8hN//oOh90fnDO8iLz4KgdajWkWVpoJLS8Wh44yCt/arsiVy8Lgm4oxVnubDfj2
        r2oyu9cycHWkokp45eazleopDeFPfj7jBepjK6UuMeaM51cpvkr9SA6Y1eNz0mCd/viDRuE1P/Shw
        5EsmWN80disLXDOqst24LYBUSpnqB6LVD78/+t9tl3gdLF9pkQ2T4HZDR809mQSinMZPwFLnaJ50t
        Mwr/JivQsxbJK9qlLQs2MRpJpSeDCxn3N8RahmD/mYcVMcc8RPRoHb61Z6RPBzVIptmsgH2wlxFN2
        mCdTpyXw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lTu8H-00DVrF-8x; Tue, 06 Apr 2021 22:25:20 +0000
Date:   Tue, 6 Apr 2021 23:25:13 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>
Subject: Re: linux-next: Tree for Apr 6 (arch/x86/mm/init_64.c)
Message-ID: <20210406222513.GV2531743@casper.infradead.org>
References: <20210406223109.50ebe35a@canb.auug.org.au>
 <58d0c74b-ef4d-447b-9285-3d2c192fd3eb@infradead.org>
 <a7895e6e-b00a-4b75-6506-ca38af495829@infradead.org>
 <YGy9DwRZ+dFKi9/c@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGy9DwRZ+dFKi9/c@localhost.localdomain>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 06, 2021 at 09:57:03PM +0200, Oscar Salvador wrote:
> On Tue, Apr 06, 2021 at 11:39:47AM -0700, Randy Dunlap wrote:
>  
> > > Looks like that compound "if" is too much for gcc 7.5.0 to handle:
> > > 
> > > 			} else if (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) &&
> > > 				   vmemmap_pmd_is_unused(addr, next)) {
> > > 					free_hugepage_table(pmd_page(*pmd),
> > > 							    altmap);
> > > 					spin_lock(&init_mm.page_table_lock);
> > > 					pmd_clear(pmd);
> > > 					spin_unlock(&init_mm.page_table_lock);
> > > 			}
> > > 
> > > 
> > 
> > This is what I am using for now:
> 
> Hi Randy
> 
> Yeah, that is what v4 was using [1].
> We decided to get rid of the ifdef for costimetic reasons but it seems
> it does not do the trick.
> 
> I will ask Andrew to squash that on top.

This is pretty ugly.  What I was doing was this:

+++ b/arch/x86/mm/init_64.c
@@ -862,6 +862,9 @@ static bool __meminit vmemmap_pmd_is_unused(unsigned long addr, unsigned long en
 
        return !memchr_inv((void *)start, PAGE_UNUSED, PMD_SIZE);
 }
+#else
+static inline bool vmemmap_pmd_is_unused(unsigned long addr, unsigned long end)
+{ return false; }
 #endif
 
 static void __meminit __vmemmap_use_sub_pmd(unsigned long start)
@@ -924,6 +927,9 @@ static void __meminit vmemmap_use_new_sub_pmd(unsigned long start, unsigned long
        if (!IS_ALIGNED(end, PMD_SIZE))
                unused_pmd_start = end;
 }
+#else
+static inline bool vmemmap_pmd_is_unused(unsigned long addr, unsigned long end)
+{ return false; }
 #endif
 
 /*

(whitespace damaged, but ...)
