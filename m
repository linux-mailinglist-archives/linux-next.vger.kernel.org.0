Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E1737FFCD
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 23:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbhEMV33 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 May 2021 17:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbhEMV32 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 May 2021 17:29:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 380A6C06175F;
        Thu, 13 May 2021 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=V1rOYMT9k8A/s4ml+UdcdvoHKOVvK0OalWOKj1zAbw4=; b=RUDS28TunEHfrf3zmImQUjPJVw
        rHn1CGTDnwJJAyI5ULHPZ8RueWmcrTL3lSPv7qEAdxvbgDttyIb/zSZmusU6ZOwxthy+JdlH73H/P
        9fk85iN61NvwZ0WeKPlC1EbRjgjmXwyZMloKdSc1APDCXvmNL/HSGNxJylB4f/43jrXhKb/0r1QkV
        oNTT9zisgQBrj36tmKbXQEDbpL2BLTVqv+cmFjoxf6oL/4Rm1EoWZJAcC5psGxcd8Oz2TH1Yv3zC9
        yVGffF2KFDFXKun2CsvmRKCjrEAv6DNjKOoTsSiBHvpFR1TT/MSpmxzV4XLHB1hFB4ZhlFEonNphK
        4+stMZ4Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lhIrd-009n39-8x; Thu, 13 May 2021 21:27:38 +0000
Date:   Thu, 13 May 2021 22:27:25 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: linux-next: Tree for May 13 (mm/page_alloc.c, <linux/mm.h>:
 sizeof(struct page))
Message-ID: <YJ2ZvZaR9PTyPp8S@casper.infradead.org>
References: <20210513154418.2946f422@canb.auug.org.au>
 <b7ebb44d-5dd7-7941-234b-f727691ed1f4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7ebb44d-5dd7-7941-234b-f727691ed1f4@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 13, 2021 at 10:29:49AM -0700, Randy Dunlap wrote:
> On 5/12/21 10:44 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210512:
> > 
> 
> on x86_64:
> 
> In function ‘__mm_zero_struct_page.isra.75’,
>     inlined from ‘__init_single_page.isra.76’ at ../mm/page_alloc.c:1494:2:
> ./../include/linux/compiler_types.h:328:38: error: call to ‘__compiletime_assert_162’ declared with attribute error: BUILD_BUG_ON failed: sizeof(struct page) > 80

Hmm.

                struct {
                        long unsigned int _pt_pad_1;     /*     8     8 */
                        pgtable_t  pmd_huge_pte;         /*    16     8 */
                        long unsigned int _pt_pad_2;     /*    24     8 */
                        union {
                                struct mm_struct * pt_mm; /*    32     8 */
                                atomic_t pt_frag_refcount; /*    32     4 */
                        };                               /*    32     8 */
                        spinlock_t ptl;                  /*    40    72 */
                };                                       /*     8   104 */

#if ALLOC_SPLIT_PTLOCKS
                        spinlock_t *ptl;
#else
                        spinlock_t ptl;
#endif

something has disabled ALLOC_SPLIT_PTLOCKS when it ought to be enabled.

#if USE_SPLIT_PTE_PTLOCKS
#define ALLOC_SPLIT_PTLOCKS     (SPINLOCK_SIZE > BITS_PER_LONG/8)
#else
#define ALLOC_SPLIT_PTLOCKS     0
#endif

Oh.  This is Anshuman's fault.

commit 9b8a39056e2472592a5e5897987387f43038b8ba
Author: Anshuman Khandual <anshuman.khandual@arm.com>
Date:   Tue May 11 15:06:01 2021 +1000

    mm/thp: make ALLOC_SPLIT_PTLOCKS dependent on USE_SPLIT_PTE_PTLOCKS


