Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B0525133E
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 09:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbgHYHeH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 03:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgHYHeG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Aug 2020 03:34:06 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF49C061574
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2020 00:34:06 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id b12so3425470uae.9
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2020 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nv6CSGIbCknVAshl07j/5xGDdqtleXXUaO2AgALOcBQ=;
        b=Apqc+J7zJjLt7HIY9LJFORqtLChLWyXyW9OPPAm2IWuGKCEajOMJOtXt10DCqIEofM
         xvvHt+AE/VOWITfgJLQESVHUSXbl5SlmedCTjvNoU6i4abY1JLQs5mDoynT8Fpan7Hve
         URdOCRAMTN7YlABeKlRlIHyHB9fb7JRo8O2x66tNawMGyqBwQm9OQ4U9+CljGwOgEEum
         pN53ulxBMNpATD0T+DEUnY3jpR0IPiAa1DOZ2AtxLPw3InU5Wx2J0fgKInN09ExID/3P
         LkyET0zqDcSGBHVmedmDFcAy5zPKkEh8SiTsqt2rEpCJDplMY23oKHlDSsiyyxM6WRIa
         Cmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nv6CSGIbCknVAshl07j/5xGDdqtleXXUaO2AgALOcBQ=;
        b=lz1zRI9+KfR4lY+FISDc/zStGdQr6DDhr7YPwR+IHPh9cibtbEyNpYfBo5tZ0iqTch
         SjNRjhSH0D7fDMtlOzmKI7qBVSwfyDvnkbGJN/YrzN8BZwZfvjdaLfnx84k3gZ+9Uleo
         fx499PcBjlrGE3ER8I2xmmF1CkHtuu2k1Y7qnFsm8Yvd1QWOKjQfJgXRVgalgC5aHpdl
         ngwR67uEIC2fHcp/3kDD9WC5+yYeN+4BKPzkg6YkLvuvr/XQ4ZGjGqA3d/dT2f1Texje
         +iF9XH7QKTh2ru04oiuF1DjUMLs5/SC55aEOpUEMFJGFUpydPY0qAHD3YcaAEXHxoSgF
         jVOA==
X-Gm-Message-State: AOAM530Sm6AlG+qkZiInZQ4usjS8M3zxVJsghGDjaox2btHcZ3w+1HQV
        NAxfPf2E4YLVtLHLOB/hNfgvvNuCds12VH9QsY3vNQ==
X-Google-Smtp-Source: ABdhPJzaForEfiwBwHGNvHwRx3BWRXpyG8wDtoenb+p3GP/dDIygv4Sf8WgzvnHPl3pAkzXAJYtywlXsz8c7R9LZ5dk=
X-Received: by 2002:ab0:462:: with SMTP id 89mr4776164uav.34.1598340845625;
 Tue, 25 Aug 2020 00:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
 <20200824110645.GC17456@casper.infradead.org>
In-Reply-To: <20200824110645.GC17456@casper.infradead.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 25 Aug 2020 13:03:53 +0530
Message-ID: <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
Subject: Re: BUG: Bad page state in process true pfn:a8fed on arm
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        LTP List <ltp@lists.linux.it>, Arnd Bergmann <arnd@arndb.de>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Xu <peterx@redhat.com>, opendmb@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        afzal.mohd.ma@gmail.com, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 24 Aug 2020 at 16:36, Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote:
> > [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> > [   67.550767] page:9640c0ab refcount:0 mapcount:-1024
>
> Somebody freed a page table without calling __ClearPageTable() on it.

After running git bisect on this problem,
The first suspecting of this problem on arm architecture this patch.
424efe723f7717430bec7c93b4d28bba73e31cf6
("mm: account PMD tables like PTE tables ")

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Anders Roxell <anders.roxell@linaro.org>

Additional information:
We have tested linux next by reverting this patch and confirmed
that the reported BUG is not reproduced.

These configs enabled on the running device,

CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y


-- Suspecting patch --
commit 424efe723f7717430bec7c93b4d28bba73e31cf6
Author: Matthew Wilcox <willy@infradead.org>
Date:   Thu Aug 20 10:01:30 2020 +1000

    mm: account PMD tables like PTE tables

    We account the PTE level of the page tables to the process in order to
    make smarter OOM decisions and help diagnose why memory is fragmented.
    For these same reasons, we should account pages allocated for PMDs.  With
    larger process address spaces and ASLR, the number of PMDs in use is
    higher than it used to be so the inaccuracy is starting to matter.

    Link: http://lkml.kernel.org/r/20200627184642.GF25039@casper.infradead.org
    Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
    Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
    Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
    Cc: Andy Lutomirski <luto@kernel.org>
    Cc: Arnd Bergmann <arnd@arndb.de>
    Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
    Cc: Joerg Roedel <joro@8bytes.org>
    Cc: Max Filippov <jcmvbkbc@gmail.com>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
    Cc: Stafford Horne <shorne@gmail.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b0a15ee77b8a..a4e5b806347c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2239,7 +2239,7 @@ static inline spinlock_t *pmd_lockptr(struct
mm_struct *mm, pmd_t *pmd)
  return ptlock_ptr(pmd_to_page(pmd));
 }

-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool pmd_ptlock_init(struct page *page)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
  page->pmd_huge_pte = NULL;
@@ -2247,7 +2247,7 @@ static inline bool pgtable_pmd_page_ctor(struct
page *page)
  return ptlock_init(page);
 }

-static inline void pgtable_pmd_page_dtor(struct page *page)
+static inline void pmd_ptlock_free(struct page *page)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
  VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
@@ -2264,8 +2264,8 @@ static inline spinlock_t *pmd_lockptr(struct
mm_struct *mm, pmd_t *pmd)
  return &mm->page_table_lock;
 }

-static inline bool pgtable_pmd_page_ctor(struct page *page) { return true; }
-static inline void pgtable_pmd_page_dtor(struct page *page) {}
+static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline void pmd_ptlock_free(struct page *page) {}

 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)

@@ -2278,6 +2278,22 @@ static inline spinlock_t *pmd_lock(struct
mm_struct *mm, pmd_t *pmd)
  return ptl;
 }

+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+ if (!pmd_ptlock_init(page))
+ return false;
+ __SetPageTable(page);
+ inc_zone_page_state(page, NR_PAGETABLE);
+ return true;
+}
+
+static inline void pgtable_pmd_page_dtor(struct page *page)
+{
+ pmd_ptlock_free(page);
+ __ClearPageTable(page);
+ dec_zone_page_state(page, NR_PAGETABLE);
+}
+
 /*
  * No scalability reason to split PUD locks yet, but follow the same pattern
  * as the PMD locks to make it easier if we decide to.  The VM should not be




- Naresh
