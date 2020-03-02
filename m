Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0BA9175C69
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 14:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgCBNyy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 08:54:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39534 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726890AbgCBNyy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2020 08:54:54 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022DnSTQ072889
        for <linux-next@vger.kernel.org>; Mon, 2 Mar 2020 08:54:53 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2yfjf3w76r-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 02 Mar 2020 08:54:53 -0500
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <rppt@linux.ibm.com>;
        Mon, 2 Mar 2020 13:54:50 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 2 Mar 2020 13:54:47 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 022Dskmq57475226
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 2 Mar 2020 13:54:46 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 37EC64C046;
        Mon,  2 Mar 2020 13:54:46 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1642B4C050;
        Mon,  2 Mar 2020 13:54:45 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.207.124])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon,  2 Mar 2020 13:54:44 +0000 (GMT)
Date:   Mon, 2 Mar 2020 15:54:43 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Will Deacon <will@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        anshuman.khandual@arm.com, catalin.marinas@arm.com,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        suzuki.poulose@arm.com, Anders Roxell <anders.roxell@linaro.org>
Subject: Re: Linux-next-20200302: arm64 build failed
References: <CA+G9fYtAM-m0jygud+i0ymU+XknV9_GcAbDQChiD2NZjvQ+D3w@mail.gmail.com>
 <20200302104726.GA7995@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302104726.GA7995@willie-the-truck>
X-TM-AS-GCONF: 00
x-cbid: 20030213-0020-0000-0000-000003AF9840
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030213-0021-0000-0000-00002207C383
Message-Id: <20200302135443.GA24831@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_04:2020-03-02,2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=5 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020101
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 02, 2020 at 10:47:27AM +0000, Will Deacon wrote:
> [+Anshuman and Catalin]
> 
> On Mon, Mar 02, 2020 at 01:58:26PM +0530, Naresh Kamboju wrote:
> > Linux-Next 20200302 arm64 build failed due to below errors,
> > Suspecting patch causing this build break.
> > 
> > 87d900aef3e2  arm/arm64: add support for folded p4d page tables
> > 
> > Error log,
> > -------------
> > arch/arm64/mm/mmu.c: In function 'unmap_hotplug_pud_range':
> > include/linux/compiler.h:284:1: error: incompatible type for argument
> > 1 of 'p4d_page_paddr'
> >  ({         \
> >  ^
> > arch/arm64/include/asm/memory.h:270:45: note: in definition of macro
> > '__phys_to_virt'
> >  #define __phys_to_virt(x) ((unsigned long)((x) - physvirt_offset))
> >                                              ^
> > arch/arm64/include/asm/pgtable.h:629:42: note: in expansion of macro '__va'
> >  #define pud_offset(dir, addr)  ((pud_t *)__va(pud_offset_phys((dir), (addr))))
> >                                           ^~~~
> > include/linux/compiler.h:293:22: note: in expansion of macro '__READ_ONCE'
> >  #define READ_ONCE(x) __READ_ONCE(x, 1)
> >                       ^~~~~~~~~~~
> > arch/arm64/include/asm/pgtable.h:628:52: note: in expansion of macro 'READ_ONCE'
> >  #define pud_offset_phys(dir, addr) (p4d_page_paddr(READ_ONCE(*(dir)))
> > + pud_index(addr) * sizeof(pud_t))
> >                                                     ^~~~~~~~~
> > arch/arm64/include/asm/pgtable.h:629:47: note: in expansion of macro
> > 'pud_offset_phys'
> >  #define pud_offset(dir, addr)  ((pud_t *)__va(pud_offset_phys((dir), (addr))))
> >                                                ^~~~~~~~~~~~~~~
> > arch/arm64/mm/mmu.c:827:10: note: in expansion of macro 'pud_offset'
> >    pudp = pud_offset(pgdp, addr);
> >           ^~~~~~~~~~
> 
> Looks like we need an implementation of unmap_hotplug_p4d_range() to
> walk the dummy p4d level. Unfortunately, we don't have the folded p4d
> patches in the arm64 tree so we'll either need a common branch or the
> hotplug patches will need to be dropped for the moment.

unmap_hotplug_p4d_range() is easy :)

From c7a5d08ff51ca2057b6b0289c4423bdfd7643518 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Mon, 2 Mar 2020 15:53:17 +0200
Subject: [PATCH] arm64/mm: implement unmap_hotplug_p4d_range

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm64/mm/mmu.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 05ec8e5f1436..c76b11577558 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -840,6 +840,24 @@ static void unmap_hotplug_pud_range(pgd_t *pgdp, unsigned long addr,
 	} while (addr = next, addr < end);
 }
 
+static void unmap_hotplug_p4d_range(pgd_t *pgd, unsigned long addr,
+				unsigned long end, bool free_mapped)
+{
+	unsigned long next;
+	pgd_t *p4dp, p4d;
+
+	do {
+		next = p4d_addr_end(addr, end);
+		p4dp = p4d_offset(pgd, addr);
+		p4d = READ_ONCE(*p4dp);
+		if (p4d_none(p4d))
+			continue;
+
+		WARN_ON(!p4d_present(p4d));
+		unmap_hotplug_pud_range(p4dp, addr, next, free_mapped);
+	} while (addr = next, addr < end);
+}
+
 static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 				bool free_mapped)
 {
@@ -854,7 +872,7 @@ static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 			continue;
 
 		WARN_ON(!pgd_present(pgd));
-		unmap_hotplug_pud_range(pgdp, addr, next, free_mapped);
+		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped);
 	} while (addr = next, addr < end);
 }
 
-- 
2.21.1

 
> Will

-- 
Sincerely yours,
Mike.

