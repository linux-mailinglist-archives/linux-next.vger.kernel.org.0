Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF7C251441
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 10:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbgHYIcD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 04:32:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33004 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725936AbgHYIcB (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Aug 2020 04:32:01 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07P83DZY035721;
        Tue, 25 Aug 2020 04:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ul3LRDqOL5AX8hqIlLs89geF2pzCuEqTWsrxPKxeck8=;
 b=oLwpQPlwULQbO3ay8NLk0mAsq1cLc9yRWU0SbeUHAeOY3wNOuII7tHv/eXzSJTgQHZVw
 xpkeZENO46eXDU7fe6ePz73g9MEfFBnZfL9cv8beHSnEIJmC+nCv3/ByvkGNYRtj1HC2
 diAnlAG2jHb6OeMsnbBgt7Z8HanwReiy+Td5YRFuY+IKQrX9U6dl/+Le79g3q2nK9jN9
 2+kj4/RRFHv6dTBv2o8I4X5hDp7d0KJfJ0CYSuu2Qr8xa2Z3NKrZlInjB3vaPZ2nnIPP
 FdgZsFb0620VzakMxjiueGg2G1T7HAXhyJGrvHUWOPm/XVn/1ijqivZjqe0oNc9TX7TK tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 334xb91hc0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 04:31:28 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07P8VSFQ131986;
        Tue, 25 Aug 2020 04:31:28 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 334xb91han-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 04:31:28 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07P8Rdci026137;
        Tue, 25 Aug 2020 08:31:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma04ams.nl.ibm.com with ESMTP id 33498u94j3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 08:31:25 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07P8TrEM39059726
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Aug 2020 08:29:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 238D852051;
        Tue, 25 Aug 2020 08:31:23 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.152.21])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 3EAE05204E;
        Tue, 25 Aug 2020 08:31:21 +0000 (GMT)
Date:   Tue, 25 Aug 2020 11:31:19 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
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
Subject: Re: BUG: Bad page state in process true pfn:a8fed on arm
Message-ID: <20200825083119.GA69694@linux.ibm.com>
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
 <20200824110645.GC17456@casper.infradead.org>
 <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-24_12:2020-08-24,2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=7
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250057
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 25, 2020 at 01:03:53PM +0530, Naresh Kamboju wrote:
> On Mon, 24 Aug 2020 at 16:36, Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote:
> > > [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> > > [   67.550767] page:9640c0ab refcount:0 mapcount:-1024
> >
> > Somebody freed a page table without calling __ClearPageTable() on it.
> 
> After running git bisect on this problem,
> The first suspecting of this problem on arm architecture this patch.
> 424efe723f7717430bec7c93b4d28bba73e31cf6
> ("mm: account PMD tables like PTE tables ")
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
 
Can you please check if this fix helps?

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index 9415222b49ad..b8cbe03ad260 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -59,6 +59,7 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct page *page = virt_to_page(pmdp);
 
+	pgtable_pmd_page_dtor(page);
 	tlb_remove_table(tlb, page);
 #endif
 }

> Additional information:
> We have tested linux next by reverting this patch and confirmed
> that the reported BUG is not reproduced.
> 
> These configs enabled on the running device,
> 
> CONFIG_TRANSPARENT_HUGEPAGE=y
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> 
> 
> -- Suspecting patch --
> commit 424efe723f7717430bec7c93b4d28bba73e31cf6
> Author: Matthew Wilcox <willy@infradead.org>
> Date:   Thu Aug 20 10:01:30 2020 +1000
> 
>     mm: account PMD tables like PTE tables
> 
>     We account the PTE level of the page tables to the process in order to
>     make smarter OOM decisions and help diagnose why memory is fragmented.
>     For these same reasons, we should account pages allocated for PMDs.  With
>     larger process address spaces and ASLR, the number of PMDs in use is
>     higher than it used to be so the inaccuracy is starting to matter.
> 
>     Link: http://lkml.kernel.org/r/20200627184642.GF25039@casper.infradead.org
>     Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>     Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
>     Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
>     Cc: Andy Lutomirski <luto@kernel.org>
>     Cc: Arnd Bergmann <arnd@arndb.de>
>     Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>     Cc: Joerg Roedel <joro@8bytes.org>
>     Cc: Max Filippov <jcmvbkbc@gmail.com>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
>     Cc: Stafford Horne <shorne@gmail.com>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b0a15ee77b8a..a4e5b806347c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2239,7 +2239,7 @@ static inline spinlock_t *pmd_lockptr(struct
> mm_struct *mm, pmd_t *pmd)
>   return ptlock_ptr(pmd_to_page(pmd));
>  }
> 
> -static inline bool pgtable_pmd_page_ctor(struct page *page)
> +static inline bool pmd_ptlock_init(struct page *page)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   page->pmd_huge_pte = NULL;
> @@ -2247,7 +2247,7 @@ static inline bool pgtable_pmd_page_ctor(struct
> page *page)
>   return ptlock_init(page);
>  }
> 
> -static inline void pgtable_pmd_page_dtor(struct page *page)
> +static inline void pmd_ptlock_free(struct page *page)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
> @@ -2264,8 +2264,8 @@ static inline spinlock_t *pmd_lockptr(struct
> mm_struct *mm, pmd_t *pmd)
>   return &mm->page_table_lock;
>  }
> 
> -static inline bool pgtable_pmd_page_ctor(struct page *page) { return true; }
> -static inline void pgtable_pmd_page_dtor(struct page *page) {}
> +static inline bool pmd_ptlock_init(struct page *page) { return true; }
> +static inline void pmd_ptlock_free(struct page *page) {}
> 
>  #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
> 
> @@ -2278,6 +2278,22 @@ static inline spinlock_t *pmd_lock(struct
> mm_struct *mm, pmd_t *pmd)
>   return ptl;
>  }
> 
> +static inline bool pgtable_pmd_page_ctor(struct page *page)
> +{
> + if (!pmd_ptlock_init(page))
> + return false;
> + __SetPageTable(page);
> + inc_zone_page_state(page, NR_PAGETABLE);
> + return true;
> +}
> +
> +static inline void pgtable_pmd_page_dtor(struct page *page)
> +{
> + pmd_ptlock_free(page);
> + __ClearPageTable(page);
> + dec_zone_page_state(page, NR_PAGETABLE);
> +}
> +
>  /*
>   * No scalability reason to split PUD locks yet, but follow the same pattern
>   * as the PMD locks to make it easier if we decide to.  The VM should not be
> 
> 
> 
> 
> - Naresh

-- 
Sincerely yours,
Mike.
