Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E64AF0AD4
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 01:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbfKFACk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 19:02:40 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:44690 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfKFACk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 19:02:40 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA5NwnEL097487;
        Wed, 6 Nov 2019 00:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=by6LNx6WNtJ7JPgSY3hY6+LsTSFnwmTyPzoIFjvPop8=;
 b=riESuNN78i/R6qArs5ZSON/196AA6nLZ/QS8Qpy47fXf3IDP3D7XZMULUiZ7UTr44Ryf
 +XTaLmrwXr/6I4BhpnRd7zlJghiTPdPBFKts1A3TtxfXXlYkcE+1D94hPLlitmbDnO02
 7qwidmj2xJxYyfNiPorlmD1c3a3ksD7Tc7nq6HoYu8MNu7pmHGCBAoOKUm+gBFoVApG5
 AyHBdY9Y6Bqxn/JHJLHjzzMuhRwPjlKlkDTkpg2CeLa0arEq6teqPluubiIfYWJjSHs3
 SSZ8550skNb5JFisJU0H3k4M5gjnwwK5/a63T44WwHqfDR1vo38yXwiHBbLu4qHrYNoQ kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2w117u27ms-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Nov 2019 00:02:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA5Nwmh6129346;
        Wed, 6 Nov 2019 00:00:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2w333w76gc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 06 Nov 2019 00:00:24 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA600MOt005551;
        Wed, 6 Nov 2019 00:00:22 GMT
Received: from [192.168.1.206] (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 05 Nov 2019 16:00:22 -0800
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20191105211920.787df2ab@canb.auug.org.au>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <0892a018-152f-629d-3dd0-60ce79f2887b@oracle.com>
Date:   Tue, 5 Nov 2019 16:00:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105211920.787df2ab@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911050194
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911050194
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/5/19 2:19 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
> 
> In file included from arch/powerpc/mm/mem.c:30:
> include/linux/hugetlb.h:233:19: error: redefinition of 'pmd_huge'
>   233 | static inline int pmd_huge(pmd_t pmd)
>       |                   ^~~~~~~~
> In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:301,
>                  from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
>                  from arch/powerpc/include/asm/book3s/64/mmu.h:46,
>                  from arch/powerpc/include/asm/mmu.h:356,
>                  from arch/powerpc/include/asm/lppaca.h:47,
>                  from arch/powerpc/include/asm/paca.h:17,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/sched.h:12,
>                  from arch/powerpc/mm/mem.c:16:
> arch/powerpc/include/asm/book3s/64/pgtable-4k.h:74:19: note: previous definition of 'pmd_huge' was here
>    74 | static inline int pmd_huge(pmd_t pmd) { return 0; }
>       |                   ^~~~~~~~
> In file included from arch/powerpc/mm/mem.c:30:
> include/linux/hugetlb.h:238:19: error: redefinition of 'pud_huge'
>   238 | static inline int pud_huge(pud_t pud)
>       |                   ^~~~~~~~
> In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:301,
>                  from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
>                  from arch/powerpc/include/asm/book3s/64/mmu.h:46,
>                  from arch/powerpc/include/asm/mmu.h:356,
>                  from arch/powerpc/include/asm/lppaca.h:47,
>                  from arch/powerpc/include/asm/paca.h:17,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/sched.h:12,
>                  from arch/powerpc/mm/mem.c:16:
> arch/powerpc/include/asm/book3s/64/pgtable-4k.h:75:19: note: previous definition of 'pud_huge' was here
>    75 | static inline int pud_huge(pud_t pud) { return 0; }
>       |                   ^~~~~~~~
> 
> Caused by commit
> 
>   9823e12e021f ("hugetlbfs: convert macros to static inline, fix sparse warning")
> 
> I have reverted that commit for today.

Hello Michael,

When I started to look into this I noticed that you added commit aad71e3928be
("powerpc/mm: Fix build break with RADIX=y & HUGETLBFS=n") some time back.
It appears that all other architectures get the definition of pmd_huge and
pud_huge from <linux/hugetlb.h> in the !CONFIG_HUGETLB_PAGE case.  Previously,
this was not an issue as the #define pmd_huge/pud_huge did not conflict with
the static inline in the powerpc header files.  The conflicts above happened
when I converted the macros to also be static inlines.  Could you live with
a patch like the following to remove the stubs from powerpc header files and
fix your original build break by including  <linux/hugetlb.h>?  After the
below patch is applied, the above commit will not cause the build errors seen
in linux-next.

From 4b3ab017e639e4e583fff801e6d8e6727b7877e8 Mon Sep 17 00:00:00 2001
From: Mike Kravetz <mike.kravetz@oracle.com>
Date: Tue, 5 Nov 2019 15:12:15 -0800
Subject: [PATCH] powerpc/mm: remove pmd_huge/pud_huge stubs and include
 hugetlb.h

This removes the power specific stubs created by commit aad71e3928be
("powerpc/mm: Fix build break with RADIX=y & HUGETLBFS=n") used when
!CONFIG_HUGETLB_PAGE.  Instead, it addresses the build break by
getting the definitions from <linux/hugetlb.h>.

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable-4k.h  | 3 ---
 arch/powerpc/include/asm/book3s/64/pgtable-64k.h | 3 ---
 arch/powerpc/mm/book3s64/radix_pgtable.c         | 1 +
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
index a069dfcac9a9..4e697bc2f4cd 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
@@ -70,9 +70,6 @@ static inline int get_hugepd_cache_index(int index)
 	/* should not reach */
 }
 
-#else /* !CONFIG_HUGETLB_PAGE */
-static inline int pmd_huge(pmd_t pmd) { return 0; }
-static inline int pud_huge(pud_t pud) { return 0; }
 #endif /* CONFIG_HUGETLB_PAGE */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
index e3d4dd4ae2fa..34d1018896b3 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
@@ -59,9 +59,6 @@ static inline int get_hugepd_cache_index(int index)
 	BUG();
 }
 
-#else /* !CONFIG_HUGETLB_PAGE */
-static inline int pmd_huge(pmd_t pmd) { return 0; }
-static inline int pud_huge(pud_t pud) { return 0; }
 #endif /* CONFIG_HUGETLB_PAGE */
 
 static inline int remap_4k_pfn(struct vm_area_struct *vma, unsigned long addr,
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 6ee17d09649c..974109bb85db 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -13,6 +13,7 @@
 #include <linux/memblock.h>
 #include <linux/of_fdt.h>
 #include <linux/mm.h>
+#include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
 #include <linux/stop_machine.h>
 
-- 
2.23.0

