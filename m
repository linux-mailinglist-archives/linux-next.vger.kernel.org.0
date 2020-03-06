Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269A117BE46
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 14:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbgCFNZu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 08:25:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46252 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727186AbgCFNZu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 08:25:50 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 026DLP8f067108
        for <linux-next@vger.kernel.org>; Fri, 6 Mar 2020 08:25:49 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ykd49vdeu-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2020 08:25:49 -0500
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Fri, 6 Mar 2020 13:25:47 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 6 Mar 2020 13:25:41 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 026DPef340173606
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 6 Mar 2020 13:25:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EA238A404D;
        Fri,  6 Mar 2020 13:25:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4DEC9A4057;
        Fri,  6 Mar 2020 13:25:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.0.1])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri,  6 Mar 2020 13:25:39 +0000 (GMT)
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     linux-next@vger.kernel.org, akpm@linux-foundation.org,
        jack@suse.cz, kirill@shutemov.name
Cc:     borntraeger@de.ibm.com, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: [PATCH v4 2/2] mm/gup/writeback: add callbacks for inaccessible pages
Date:   Fri,  6 Mar 2020 14:25:37 +0100
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306132537.783769-1-imbrenda@linux.ibm.com>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030613-0020-0000-0000-000003B11798
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030613-0021-0000-0000-0000220957FA
Message-Id: <20200306132537.783769-3-imbrenda@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-06_04:2020-03-06,2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=2 phishscore=0
 mlxscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=633 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060096
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

With the introduction of protected KVM guests on s390 there is now a
concept of inaccessible pages. These pages need to be made accessible
before the host can access them.

While cpu accesses will trigger a fault that can be resolved, I/O
accesses will just fail.  We need to add a callback into architecture
code for places that will do I/O, namely when writeback is started or
when a page reference is taken.

This is not only to enable paging, file backing etc, it is also
necessary to protect the host against a malicious user space.  For
example a bad QEMU could simply start direct I/O on such protected
memory.  We do not want userspace to be able to trigger I/O errors and
thus the logic is "whenever somebody accesses that page (gup) or does
I/O, make sure that this page can be accessed".  When the guest tries
to access that page we will wait in the page fault handler for
writeback to have finished and for the page_ref to be the expected
value.

On s390x the function is not supposed to fail, so it is ok to use a
WARN_ON on failure. If we ever need some more finegrained handling
we can tackle this when we know the details.

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 include/linux/gfp.h |  6 ++++++
 mm/gup.c            | 30 +++++++++++++++++++++++++++---
 mm/page-writeback.c |  9 ++++++++-
 3 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index e5b817cb86e7..be2754841369 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -485,6 +485,12 @@ static inline void arch_free_page(struct page *page, int order) { }
 #ifndef HAVE_ARCH_ALLOC_PAGE
 static inline void arch_alloc_page(struct page *page, int order) { }
 #endif
+#ifndef HAVE_ARCH_MAKE_PAGE_ACCESSIBLE
+static inline int arch_make_page_accessible(struct page *page)
+{
+	return 0;
+}
+#endif
 
 struct page *
 __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
diff --git a/mm/gup.c b/mm/gup.c
index 81a95fbe9901..d0c4c6f336bb 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -413,6 +413,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	struct page *page;
 	spinlock_t *ptl;
 	pte_t *ptep, pte;
+	int ret;
 
 	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
 	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
@@ -471,8 +472,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		if (is_zero_pfn(pte_pfn(pte))) {
 			page = pte_page(pte);
 		} else {
-			int ret;
-
 			ret = follow_pfn_pte(vma, address, ptep, flags);
 			page = ERR_PTR(ret);
 			goto out;
@@ -480,7 +479,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	}
 
 	if (flags & FOLL_SPLIT && PageTransCompound(page)) {
-		int ret;
 		get_page(page);
 		pte_unmap_unlock(ptep, ptl);
 		lock_page(page);
@@ -497,6 +495,19 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		page = ERR_PTR(-ENOMEM);
 		goto out;
 	}
+	/*
+	 * We need to make the page accessible if and only if we are going
+	 * to access its content (the FOLL_PIN case).  Please see
+	 * Documentation/core-api/pin_user_pages.rst for details.
+	 */
+	if (flags & FOLL_PIN) {
+		ret = arch_make_page_accessible(page);
+		if (ret) {
+			unpin_user_page(page);
+			page = ERR_PTR(ret);
+			goto out;
+		}
+	}
 	if (flags & FOLL_TOUCH) {
 		if ((flags & FOLL_WRITE) &&
 		    !pte_dirty(pte) && !PageDirty(page))
@@ -2162,6 +2173,19 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 
 		VM_BUG_ON_PAGE(compound_head(page) != head, page);
 
+		/*
+		 * We need to make the page accessible if and only if we are
+		 * going to access its content (the FOLL_PIN case).  Please
+		 * see Documentation/core-api/pin_user_pages.rst for
+		 * details.
+		 */
+		if (flags & FOLL_PIN) {
+			ret = arch_make_page_accessible(page);
+			if (ret) {
+				unpin_user_page(page);
+				goto pte_unmap;
+			}
+		}
 		SetPageReferenced(page);
 		pages[*nr] = page;
 		(*nr)++;
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index ab5a3cee8ad3..b7f3d0766a5f 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2764,7 +2764,7 @@ int test_clear_page_writeback(struct page *page)
 int __test_set_page_writeback(struct page *page, bool keep_write)
 {
 	struct address_space *mapping = page_mapping(page);
-	int ret;
+	int ret, access_ret;
 
 	lock_page_memcg(page);
 	if (mapping && mapping_use_writeback_tags(mapping)) {
@@ -2807,6 +2807,13 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
 		inc_zone_page_state(page, NR_ZONE_WRITE_PENDING);
 	}
 	unlock_page_memcg(page);
+	access_ret = arch_make_page_accessible(page);
+	/*
+	 * If writeback has been triggered on a page that cannot be made
+	 * accessible, it is too late to recover here.
+	 */
+	VM_BUG_ON_PAGE(access_ret != 0, page);
+
 	return ret;
 
 }
-- 
2.24.1

