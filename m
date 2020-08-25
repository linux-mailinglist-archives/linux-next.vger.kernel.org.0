Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE45251730
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 13:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbgHYLNe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 07:13:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65236 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728117AbgHYLNc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Aug 2020 07:13:32 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07PB3t0f068199;
        Tue, 25 Aug 2020 07:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=NCSDhqHannG42tt3LoU0vm6cDgbpbWzA2ffRChqRUg4=;
 b=BW+nd92dnKCyZloBrICqlkJTdmuycQOr7iExT3merVZMCYJM0XCTmCtIzuhOuX6PRfzW
 2DTftP8QqK8nX0FosShB4ISQe9QIVTVY55S5g2LnbBq0ZsKTwBoM4/hfVYhEJxEbDxY0
 7dOAVt4I4eiVMxZWG1Zaw3qzx1KMifRUvoraJIK26cumeAySATSCHhdpAOthRiOZ+wDc
 s2ZnAiU1B27REZfW2qkiSpHtXsdQIS9LIq1NZrjh3VYrmtNmKnmkw1EXG5F1B3f+TAlY
 frI+t60DqFmEWiqcOlBLcdBTNmKVQaJkhaehoKCfDv/EoUVOGHtNJjfChyBwFaWQv9VA Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33515vrp39-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 07:13:11 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07PB4VL5070334;
        Tue, 25 Aug 2020 07:13:11 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33515vrp2k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 07:13:11 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07PBD9Qk000946;
        Tue, 25 Aug 2020 11:13:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma03fra.de.ibm.com with ESMTP id 332utq21hu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 11:13:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07PBD7Eh31326598
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Aug 2020 11:13:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0B6844C059;
        Tue, 25 Aug 2020 11:13:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0EBB74C040;
        Tue, 25 Aug 2020 11:13:05 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.152.21])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 25 Aug 2020 11:13:04 +0000 (GMT)
Date:   Tue, 25 Aug 2020 14:13:03 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Anders Roxell <anders.roxell@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Xu <peterx@redhat.com>, opendmb@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        afzal.mohd.ma@gmail.com, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] arm: __pmd_free_tlb(): call page table desctructor (Was:
 BUG: Bad page state in process true pfn:a8fed on arm)
Message-ID: <20200825111303.GB69694@linux.ibm.com>
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
 <20200824110645.GC17456@casper.infradead.org>
 <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
 <20200825083119.GA69694@linux.ibm.com>
 <CADYN=9+2RDeUdbNT+XT6WgTW70UCdsARqaAL7PQ0+OPLvrkNng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADYN=9+2RDeUdbNT+XT6WgTW70UCdsARqaAL7PQ0+OPLvrkNng@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_02:2020-08-25,2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=5
 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250079
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 25, 2020 at 10:53:22AM +0200, Anders Roxell wrote:
> On Tue, 25 Aug 2020 at 10:32, Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > On Tue, Aug 25, 2020 at 01:03:53PM +0530, Naresh Kamboju wrote:
> > > On Mon, 24 Aug 2020 at 16:36, Matthew Wilcox <willy@infradead.org> wrote:
> > > >
> > > > On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote:
> > > > > [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> > > > > [   67.550767] page:9640c0ab refcount:0 mapcount:-1024
> > > >
> > > > Somebody freed a page table without calling __ClearPageTable() on it.
> > >
> > > After running git bisect on this problem,
> > > The first suspecting of this problem on arm architecture this patch.
> > > 424efe723f7717430bec7c93b4d28bba73e31cf6
> > > ("mm: account PMD tables like PTE tables ")
> > >
> > > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > > Reported-by: Anders Roxell <anders.roxell@linaro.org>
> >
> > Can you please check if this fix helps?
> 
> That fixed the problem.

Since this is still in -mm tree, I've omitted commit sha and Fixes.

Andrew, is it possible to add this as a fixup to for the original
commit?


From db2efd7b89b1d943eb250e7e195c8cbaaa2e6ac9 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Tue, 25 Aug 2020 13:57:12 +0300
Subject: [PATCH] arm: __pmd_free_tlb(): call page table desctructor

As long as PMD tables are accounted as PTE tables ("mm: account PMD tables
like PTE tables") they can be freed only after pgtable_pmd_page_dtor() is
called.

Add the missing call in ARM's version of __pmd_free_tlb for
CONFIG_ARM_LPAE=y case.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm/include/asm/tlb.h | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.26.2
