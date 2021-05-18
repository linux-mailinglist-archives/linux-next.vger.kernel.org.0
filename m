Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D30A387103
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 07:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239598AbhERFBX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 May 2021 01:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237133AbhERFBW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 May 2021 01:01:22 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED8EC061573;
        Mon, 17 May 2021 22:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=oSbqpt5D4K/W1amyexgttXZY/68G5PWLGU3dU5vVU9I=; b=QY4iRluRa834leZFNowWUTTJSI
        hD3/+/ywzp+t2vyj2VP9Z+5kN2smsCFFACa0HplY4ju1ot2oQNwg+OEpeHbg3CREyAKlxkso7z45M
        ZC3YLMwtukMJ2CNwDfWNTR2zTLVv7S3dbSiWjZzvEf0tTAz3Lkn1/cZwsL/c1wumxeyoEwtzndPSu
        bUlTvjiXg7pNp2bgns5wo29owXcGJi6PNfKgOX9dxMkcFFvUNYKFfFalmfKJH4jnhud5Z2+bPvjM/
        vBT2WsiGAyHGeqSBBFAAkjMi9QDKkzyCbcAkT3Nxubx7xWxlTx7zqDYbIW7xpqJ7F8JK1YXDGkVMk
        4B6jw7Cg==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lirpk-00EJSG-7R; Tue, 18 May 2021 04:59:56 +0000
Subject: Re: linux-next: Tree for May 13 (mm/page_alloc.c, <linux/mm.h>:
 sizeof(struct page))
To:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>
References: <20210513154418.2946f422@canb.auug.org.au>
 <b7ebb44d-5dd7-7941-234b-f727691ed1f4@infradead.org>
 <YJ2ZvZaR9PTyPp8S@casper.infradead.org>
 <06c8a6a6-9999-7f03-6bfb-34efb7ced637@arm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fce18700-9e98-b1fc-260d-60ebcfc9d150@infradead.org>
Date:   Mon, 17 May 2021 21:59:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <06c8a6a6-9999-7f03-6bfb-34efb7ced637@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/17/21 9:03 PM, Anshuman Khandual wrote:
> 
> 
> On 5/14/21 2:57 AM, Matthew Wilcox wrote:
>> On Thu, May 13, 2021 at 10:29:49AM -0700, Randy Dunlap wrote:
>>> On 5/12/21 10:44 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20210512:
>>>>
>>>
>>> on x86_64:
>>>
>>> In function ‘__mm_zero_struct_page.isra.75’,
>>>     inlined from ‘__init_single_page.isra.76’ at ../mm/page_alloc.c:1494:2:
>>> ./../include/linux/compiler_types.h:328:38: error: call to ‘__compiletime_assert_162’ declared with attribute error: BUILD_BUG_ON failed: sizeof(struct page) > 80
>>
>> Hmm.
>>
>>                 struct {
>>                         long unsigned int _pt_pad_1;     /*     8     8 */
>>                         pgtable_t  pmd_huge_pte;         /*    16     8 */
>>                         long unsigned int _pt_pad_2;     /*    24     8 */
>>                         union {
>>                                 struct mm_struct * pt_mm; /*    32     8 */
>>                                 atomic_t pt_frag_refcount; /*    32     4 */
>>                         };                               /*    32     8 */
>>                         spinlock_t ptl;                  /*    40    72 */
>>                 };                                       /*     8   104 */
>>
>> #if ALLOC_SPLIT_PTLOCKS
>>                         spinlock_t *ptl;
>> #else
>>                         spinlock_t ptl;
>> #endif
>>
>> something has disabled ALLOC_SPLIT_PTLOCKS when it ought to be enabled.
>>
>> #if USE_SPLIT_PTE_PTLOCKS
>> #define ALLOC_SPLIT_PTLOCKS     (SPINLOCK_SIZE > BITS_PER_LONG/8)
>> #else
>> #define ALLOC_SPLIT_PTLOCKS     0
>> #endif
>>
>> Oh.  This is Anshuman's fault.
>>
>> commit 9b8a39056e2472592a5e5897987387f43038b8ba
>> Author: Anshuman Khandual <anshuman.khandual@arm.com>
>> Date:   Tue May 11 15:06:01 2021 +1000
>>
>>     mm/thp: make ALLOC_SPLIT_PTLOCKS dependent on USE_SPLIT_PTE_PTLOCKS
>>
>>
> 
> Previously ALLOC_SPLIT_PTLOCKS was evaluated and the spin lock element
> in struct page was getting created independent of whether split pte
> locks are being used or not. AFAICS without USE_SPLIT_PTE_PTLOCKS, it
> does not really matter whether struct page has spinlock_t *ptl or ptl
> element because that is not going to be used. Should the BUILD_BUG_ON()
> evaluation be changed when USE_SPLIT_PTE_PTLOCKS is not enabled or we
> could something like this which drops the ptl element in such cases ?
> 
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -152,11 +152,13 @@ struct page {
>                                 struct mm_struct *pt_mm; /* x86 pgds only */
>                                 atomic_t pt_frag_refcount; /* powerpc */
>                         };
> +#if USE_SPLIT_PTE_PTLOCKS
>  #if ALLOC_SPLIT_PTLOCKS
>                         spinlock_t *ptl;
>  #else
>                         spinlock_t ptl;
>  #endif
> +#endif
>                 };
>                 struct {        /* ZONE_DEVICE pages */
>                         /** @pgmap: Points to the hosting device page map. */
> 

OK, that works.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


I guess you should send a proper patch to Andrew.  The code above
is whitespace-damaged (cut'n'paste).

-- 
~Randy

