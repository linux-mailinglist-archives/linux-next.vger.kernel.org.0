Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22959387071
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 06:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbhEREDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 May 2021 00:03:45 -0400
Received: from foss.arm.com ([217.140.110.172]:40346 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230378AbhEREDo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 May 2021 00:03:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44BF631B;
        Mon, 17 May 2021 21:02:27 -0700 (PDT)
Received: from [10.163.79.24] (unknown [10.163.79.24])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75FD33F73D;
        Mon, 17 May 2021 21:02:24 -0700 (PDT)
Subject: Re: linux-next: Tree for May 13 (mm/page_alloc.c, <linux/mm.h>:
 sizeof(struct page))
To:     Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>
References: <20210513154418.2946f422@canb.auug.org.au>
 <b7ebb44d-5dd7-7941-234b-f727691ed1f4@infradead.org>
 <YJ2ZvZaR9PTyPp8S@casper.infradead.org>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <06c8a6a6-9999-7f03-6bfb-34efb7ced637@arm.com>
Date:   Tue, 18 May 2021 09:33:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YJ2ZvZaR9PTyPp8S@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 5/14/21 2:57 AM, Matthew Wilcox wrote:
> On Thu, May 13, 2021 at 10:29:49AM -0700, Randy Dunlap wrote:
>> On 5/12/21 10:44 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20210512:
>>>
>>
>> on x86_64:
>>
>> In function ‘__mm_zero_struct_page.isra.75’,
>>     inlined from ‘__init_single_page.isra.76’ at ../mm/page_alloc.c:1494:2:
>> ./../include/linux/compiler_types.h:328:38: error: call to ‘__compiletime_assert_162’ declared with attribute error: BUILD_BUG_ON failed: sizeof(struct page) > 80
> 
> Hmm.
> 
>                 struct {
>                         long unsigned int _pt_pad_1;     /*     8     8 */
>                         pgtable_t  pmd_huge_pte;         /*    16     8 */
>                         long unsigned int _pt_pad_2;     /*    24     8 */
>                         union {
>                                 struct mm_struct * pt_mm; /*    32     8 */
>                                 atomic_t pt_frag_refcount; /*    32     4 */
>                         };                               /*    32     8 */
>                         spinlock_t ptl;                  /*    40    72 */
>                 };                                       /*     8   104 */
> 
> #if ALLOC_SPLIT_PTLOCKS
>                         spinlock_t *ptl;
> #else
>                         spinlock_t ptl;
> #endif
> 
> something has disabled ALLOC_SPLIT_PTLOCKS when it ought to be enabled.
> 
> #if USE_SPLIT_PTE_PTLOCKS
> #define ALLOC_SPLIT_PTLOCKS     (SPINLOCK_SIZE > BITS_PER_LONG/8)
> #else
> #define ALLOC_SPLIT_PTLOCKS     0
> #endif
> 
> Oh.  This is Anshuman's fault.
> 
> commit 9b8a39056e2472592a5e5897987387f43038b8ba
> Author: Anshuman Khandual <anshuman.khandual@arm.com>
> Date:   Tue May 11 15:06:01 2021 +1000
> 
>     mm/thp: make ALLOC_SPLIT_PTLOCKS dependent on USE_SPLIT_PTE_PTLOCKS
> 
> 

Previously ALLOC_SPLIT_PTLOCKS was evaluated and the spin lock element
in struct page was getting created independent of whether split pte
locks are being used or not. AFAICS without USE_SPLIT_PTE_PTLOCKS, it
does not really matter whether struct page has spinlock_t *ptl or ptl
element because that is not going to be used. Should the BUILD_BUG_ON()
evaluation be changed when USE_SPLIT_PTE_PTLOCKS is not enabled or we
could something like this which drops the ptl element in such cases ?

--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -152,11 +152,13 @@ struct page {
                                struct mm_struct *pt_mm; /* x86 pgds only */
                                atomic_t pt_frag_refcount; /* powerpc */
                        };
+#if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
                        spinlock_t *ptl;
 #else
                        spinlock_t ptl;
 #endif
+#endif
                };
                struct {        /* ZONE_DEVICE pages */
                        /** @pgmap: Points to the hosting device page map. */
