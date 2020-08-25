Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504CF2514A4
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 10:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbgHYIxl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 04:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbgHYIxg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Aug 2020 04:53:36 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00E9C061574
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2020 01:53:34 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so12901326ljc.3
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2020 01:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EtDubTWcya3bFNIMWt5cpovVHx+/aPFuncLPAlV9+q8=;
        b=hg6SynizBYW+QsJT+XYq5YMt+Nz9cUWGDuKfmhI4lW4tNZLzeavZKk99fUlOfxyi3K
         Xpd9KmZG48QT9+r1neCW3o7qMudIsjtFIcM+bIzkTcE0TIoXL7AZY/DZKfPQR6q4aStp
         Aw+O8kqksFZnlvLi/ts/FSdbod4DZn/D/i4Qc69TTNj3r3FB9Qm9KBePALuNWpXltBOL
         JMeBNp+Td70msn2CiW6D4fci8cxU8LWo/wVPF7q5RLXfyryBurHJYXOfm0AZ/jKgjGtO
         DfnjUAUme1d/Scto+d5AOyLGFXsAirGuVKhAWnINjL+U6DbWPP2d6wikmR8RyiRxUw40
         imMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EtDubTWcya3bFNIMWt5cpovVHx+/aPFuncLPAlV9+q8=;
        b=TeDQ8vjDZrHSsjQuU+BBBnWwomkE+kChBCusrosHnVZjRfwQpTfXgrczgKgRuhIwPw
         iZ5rYAI12VLqpzs6txFPmx6SRgF7ML0Az1hXHKKO3z44uyVoTM5M7tKG+kY5sbQw2bOD
         BHqsDvWnS0aXHrpc1DdjyFNyJkHMgidtsbmeHZyq3zp8eoNOdfNzyc0IsTjZTjg9s9Ll
         ogwuudabt0zsDPNk9yVVtwcC3lmH0scFfTXLfuuW2vcjQAS5qbVSfyegGvYsYSGlYfty
         0gXmMaDHT+Ni9ifJtMZ5/LRPyMVVtRv+NXJivi7POUlTSa/Jm+/NWXOFdg/GPrQoSaBR
         gI9Q==
X-Gm-Message-State: AOAM532Yxvk8amMRHQbOkJYDx9yKtaDrYpHxZ6NcxZr0eBPl+PgkQUnc
        Vc1ioPzE+nKIq44X1DG7RZuP3q8WQDGpz3qhp1LBNQ==
X-Google-Smtp-Source: ABdhPJzgd8VhaITc7beto8F5Oa1lQp4WYJZVsedInRAxlBWhJv7ZxzqrbHw+79LvHxCSjX2KcL7GkSO6u2tVrErxAxM=
X-Received: by 2002:a2e:920c:: with SMTP id k12mr4632919ljg.29.1598345613076;
 Tue, 25 Aug 2020 01:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
 <20200824110645.GC17456@casper.infradead.org> <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
 <20200825083119.GA69694@linux.ibm.com>
In-Reply-To: <20200825083119.GA69694@linux.ibm.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Tue, 25 Aug 2020 10:53:22 +0200
Message-ID: <CADYN=9+2RDeUdbNT+XT6WgTW70UCdsARqaAL7PQ0+OPLvrkNng@mail.gmail.com>
Subject: Re: BUG: Bad page state in process true pfn:a8fed on arm
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        LTP List <ltp@lists.linux.it>, Arnd Bergmann <arnd@arndb.de>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
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

On Tue, 25 Aug 2020 at 10:32, Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Tue, Aug 25, 2020 at 01:03:53PM +0530, Naresh Kamboju wrote:
> > On Mon, 24 Aug 2020 at 16:36, Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote:
> > > > [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> > > > [   67.550767] page:9640c0ab refcount:0 mapcount:-1024
> > >
> > > Somebody freed a page table without calling __ClearPageTable() on it.
> >
> > After running git bisect on this problem,
> > The first suspecting of this problem on arm architecture this patch.
> > 424efe723f7717430bec7c93b4d28bba73e31cf6
> > ("mm: account PMD tables like PTE tables ")
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Reported-by: Anders Roxell <anders.roxell@linaro.org>
>
> Can you please check if this fix helps?

That fixed the problem.

Cheers,
Anders

>
> diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
> index 9415222b49ad..b8cbe03ad260 100644
> --- a/arch/arm/include/asm/tlb.h
> +++ b/arch/arm/include/asm/tlb.h
> @@ -59,6 +59,7 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
>  #ifdef CONFIG_ARM_LPAE
>         struct page *page = virt_to_page(pmdp);
>
> +       pgtable_pmd_page_dtor(page);
>         tlb_remove_table(tlb, page);
>  #endif
>  }
>
> > Additional information:
> > We have tested linux next by reverting this patch and confirmed
> > that the reported BUG is not reproduced.
> >
> > These configs enabled on the running device,
> >
> > CONFIG_TRANSPARENT_HUGEPAGE=y
> > CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> >
> >
> > -- Suspecting patch --
> > commit 424efe723f7717430bec7c93b4d28bba73e31cf6
> > Author: Matthew Wilcox <willy@infradead.org>
> > Date:   Thu Aug 20 10:01:30 2020 +1000
> >
> >     mm: account PMD tables like PTE tables
> >
> >     We account the PTE level of the page tables to the process in order to
> >     make smarter OOM decisions and help diagnose why memory is fragmented.
> >     For these same reasons, we should account pages allocated for PMDs.  With
> >     larger process address spaces and ASLR, the number of PMDs in use is
> >     higher than it used to be so the inaccuracy is starting to matter.
> >
> >     Link: http://lkml.kernel.org/r/20200627184642.GF25039@casper.infradead.org
> >     Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> >     Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
> >     Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> >     Cc: Andy Lutomirski <luto@kernel.org>
> >     Cc: Arnd Bergmann <arnd@arndb.de>
> >     Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >     Cc: Joerg Roedel <joro@8bytes.org>
> >     Cc: Max Filippov <jcmvbkbc@gmail.com>
> >     Cc: Peter Zijlstra <peterz@infradead.org>
> >     Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> >     Cc: Stafford Horne <shorne@gmail.com>
> >     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> >     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index b0a15ee77b8a..a4e5b806347c 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2239,7 +2239,7 @@ static inline spinlock_t *pmd_lockptr(struct
> > mm_struct *mm, pmd_t *pmd)
> >   return ptlock_ptr(pmd_to_page(pmd));
> >  }
> >
> > -static inline bool pgtable_pmd_page_ctor(struct page *page)
> > +static inline bool pmd_ptlock_init(struct page *page)
> >  {
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >   page->pmd_huge_pte = NULL;
> > @@ -2247,7 +2247,7 @@ static inline bool pgtable_pmd_page_ctor(struct
> > page *page)
> >   return ptlock_init(page);
> >  }
> >
> > -static inline void pgtable_pmd_page_dtor(struct page *page)
> > +static inline void pmd_ptlock_free(struct page *page)
> >  {
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >   VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
> > @@ -2264,8 +2264,8 @@ static inline spinlock_t *pmd_lockptr(struct
> > mm_struct *mm, pmd_t *pmd)
> >   return &mm->page_table_lock;
> >  }
> >
> > -static inline bool pgtable_pmd_page_ctor(struct page *page) { return true; }
> > -static inline void pgtable_pmd_page_dtor(struct page *page) {}
> > +static inline bool pmd_ptlock_init(struct page *page) { return true; }
> > +static inline void pmd_ptlock_free(struct page *page) {}
> >
> >  #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
> >
> > @@ -2278,6 +2278,22 @@ static inline spinlock_t *pmd_lock(struct
> > mm_struct *mm, pmd_t *pmd)
> >   return ptl;
> >  }
> >
> > +static inline bool pgtable_pmd_page_ctor(struct page *page)
> > +{
> > + if (!pmd_ptlock_init(page))
> > + return false;
> > + __SetPageTable(page);
> > + inc_zone_page_state(page, NR_PAGETABLE);
> > + return true;
> > +}
> > +
> > +static inline void pgtable_pmd_page_dtor(struct page *page)
> > +{
> > + pmd_ptlock_free(page);
> > + __ClearPageTable(page);
> > + dec_zone_page_state(page, NR_PAGETABLE);
> > +}
> > +
> >  /*
> >   * No scalability reason to split PUD locks yet, but follow the same pattern
> >   * as the PMD locks to make it easier if we decide to.  The VM should not be
> >
> >
> >
> >
> > - Naresh
>
> --
> Sincerely yours,
> Mike.
