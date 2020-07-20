Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E090022562E
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 05:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgGTDfL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jul 2020 23:35:11 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60976 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726109AbgGTDfL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Jul 2020 23:35:11 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 30396483EE3751D14E82;
        Mon, 20 Jul 2020 11:35:07 +0800 (CST)
Received: from huawei.com (10.175.100.227) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Jul 2020
 11:35:05 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <linux-mm@kvack.org>
CC:     <linux-next@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <akpm@linux-foundation.org>
Subject: [PATCH -next] mm/gup.c: Fix the comment of return value for populate_vma_page_range()
Date:   Mon, 20 Jul 2020 11:43:03 +0800
Message-ID: <20200720034303.29920-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The return value of populate_vma_page_range() is consistent with
__get_user_pages(), and so is the function comment of return value.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 mm/gup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index 2cc5eba44362..a55f1ec712e9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1386,7 +1386,8 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
  *
  * This takes care of mlocking the pages too if VM_LOCKED is set.
  *
- * return 0 on success, negative error code on error.
+ * Return either number of pages pinned in the vma, or a negative error
+ * code on error.
  *
  * vma->vm_mm->mmap_lock must be held.
  *
-- 
2.17.1

