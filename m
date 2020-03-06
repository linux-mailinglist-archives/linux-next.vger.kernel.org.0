Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1088A17BE48
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 14:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgCFNZ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 08:25:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57390 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726167AbgCFNZr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 08:25:47 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 026DLINY087864
        for <linux-next@vger.kernel.org>; Fri, 6 Mar 2020 08:25:45 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ykmr6e48v-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2020 08:25:45 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Fri, 6 Mar 2020 13:25:43 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 6 Mar 2020 13:25:40 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 026DOebk23920902
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 6 Mar 2020 13:24:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 39C4AA4051;
        Fri,  6 Mar 2020 13:25:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9C523A4057;
        Fri,  6 Mar 2020 13:25:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.0.1])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri,  6 Mar 2020 13:25:38 +0000 (GMT)
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     linux-next@vger.kernel.org, akpm@linux-foundation.org,
        jack@suse.cz, kirill@shutemov.name
Cc:     borntraeger@de.ibm.com, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: [PATCH v4 1/2] mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track FOLL_PIN pages"
Date:   Fri,  6 Mar 2020 14:25:36 +0100
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306132537.783769-1-imbrenda@linux.ibm.com>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030613-4275-0000-0000-000003A8FA56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030613-4276-0000-0000-000038BE0CFD
Message-Id: <20200306132537.783769-2-imbrenda@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-06_04:2020-03-06,2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060096
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

In case pin fails, we need to unpin, a simple put_page will not be enough

fixup for commit 9947ea2c1e608e32 ("mm/gup: track FOLL_PIN pages")

it can be simply squashed in

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f589299b0d4a..81a95fbe9901 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -116,6 +116,28 @@ static __maybe_unused struct page *try_grab_compound_head(struct page *page,
 	return NULL;
 }
 
+static void put_compound_head(struct page *page, int refs, unsigned int flags)
+{
+	if (flags & FOLL_PIN) {
+		mod_node_page_state(page_pgdat(page), NR_FOLL_PIN_RELEASED,
+				    refs);
+
+		if (hpage_pincount_available(page))
+			hpage_pincount_sub(page, refs);
+		else
+			refs *= GUP_PIN_COUNTING_BIAS;
+	}
+
+	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
+	/*
+	 * Calling put_page() for each ref is unnecessarily slow. Only the last
+	 * ref needs a put_page().
+	 */
+	if (refs > 1)
+		page_ref_sub(page, refs - 1);
+	put_page(page);
+}
+
 /**
  * try_grab_page() - elevate a page's refcount by a flag-dependent amount
  *
@@ -2134,7 +2156,7 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 			goto pte_unmap;
 
 		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
-			put_page(head);
+			put_compound_head(head, 1, flags);
 			goto pte_unmap;
 		}
 
@@ -2267,28 +2289,6 @@ static int record_subpages(struct page *page, unsigned long addr,
 	return nr;
 }
 
-static void put_compound_head(struct page *page, int refs, unsigned int flags)
-{
-	if (flags & FOLL_PIN) {
-		mod_node_page_state(page_pgdat(page), NR_FOLL_PIN_RELEASED,
-				    refs);
-
-		if (hpage_pincount_available(page))
-			hpage_pincount_sub(page, refs);
-		else
-			refs *= GUP_PIN_COUNTING_BIAS;
-	}
-
-	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
-	/*
-	 * Calling put_page() for each ref is unnecessarily slow. Only the last
-	 * ref needs a put_page().
-	 */
-	if (refs > 1)
-		page_ref_sub(page, refs - 1);
-	put_page(page);
-}
-
 #ifdef CONFIG_ARCH_HAS_HUGEPD
 static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
 				      unsigned long sz)
-- 
2.24.1

