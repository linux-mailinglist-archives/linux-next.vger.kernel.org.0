Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4C1134577
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 15:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgAHO5S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 09:57:18 -0500
Received: from foss.arm.com ([217.140.110.172]:45718 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726556AbgAHO5S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 09:57:18 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D7531B;
        Wed,  8 Jan 2020 06:57:18 -0800 (PST)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com [10.1.194.52])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1BE13F703;
        Wed,  8 Jan 2020 06:57:16 -0800 (PST)
From:   Steven Price <steven.price@arm.com>
To:     Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        Steven Price <steven.price@arm.com>
Subject: [PATCH] x86: mm: Avoid allocating struct mm_struct on the stack
Date:   Wed,  8 Jan 2020 14:57:10 +0000
Message-Id: <20200108145710.34314-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108145248.GA2584@arm.com>
References: <20200108145248.GA2584@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

struct mm_struct is quite large (~1664 bytes) and so allocating on the
stack may cause problems as the kernel stack size is small.

Since ptdump_walk_pgd_level_core() was only allocating the structure so
that it could modify the pgd argument we can instead introduce a pgd
override in struct mm_walk and pass this down the call stack to where it
is needed.

Since the correct mm_struct is now being passed down, it is now also
unnecessary to take the mmap_sem semaphore because ptdump_walk_pgd()
will now take the semaphore on the real mm.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/mm/dump.c           |  4 ++--
 arch/x86/mm/debug_pagetables.c | 10 ++--------
 arch/x86/mm/dump_pagetables.c  | 18 +++++++-----------
 include/linux/pagewalk.h       |  3 +++
 include/linux/ptdump.h         |  2 +-
 mm/pagewalk.c                  |  7 ++++++-
 mm/ptdump.c                    |  4 ++--
 7 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/mm/dump.c b/arch/arm64/mm/dump.c
index ef4b3ca1e058..860c00ec8bd3 100644
--- a/arch/arm64/mm/dump.c
+++ b/arch/arm64/mm/dump.c
@@ -323,7 +323,7 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
 		}
 	};
 
-	ptdump_walk_pgd(&st.ptdump, info->mm);
+	ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
 }
 
 static void ptdump_initialize(void)
@@ -361,7 +361,7 @@ void ptdump_check_wx(void)
 		}
 	};
 
-	ptdump_walk_pgd(&st.ptdump, &init_mm);
+	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
 
 	if (st.wx_pages || st.uxn_pages)
 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",
diff --git a/arch/x86/mm/debug_pagetables.c b/arch/x86/mm/debug_pagetables.c
index d0efec713c6c..4a3b62f780b4 100644
--- a/arch/x86/mm/debug_pagetables.c
+++ b/arch/x86/mm/debug_pagetables.c
@@ -15,11 +15,8 @@ DEFINE_SHOW_ATTRIBUTE(ptdump);
 
 static int ptdump_curknl_show(struct seq_file *m, void *v)
 {
-	if (current->mm->pgd) {
-		down_read(&current->mm->mmap_sem);
+	if (current->mm->pgd)
 		ptdump_walk_pgd_level_debugfs(m, current->mm, false);
-		up_read(&current->mm->mmap_sem);
-	}
 	return 0;
 }
 
@@ -28,11 +25,8 @@ DEFINE_SHOW_ATTRIBUTE(ptdump_curknl);
 #ifdef CONFIG_PAGE_TABLE_ISOLATION
 static int ptdump_curusr_show(struct seq_file *m, void *v)
 {
-	if (current->mm->pgd) {
-		down_read(&current->mm->mmap_sem);
+	if (current->mm->pgd)
 		ptdump_walk_pgd_level_debugfs(m, current->mm, true);
-		up_read(&current->mm->mmap_sem);
-	}
 	return 0;
 }
 
diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 411f6a758998..64229dad7eab 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -357,7 +357,8 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	}
 }
 
-static void ptdump_walk_pgd_level_core(struct seq_file *m, pgd_t *pgd,
+static void ptdump_walk_pgd_level_core(struct seq_file *m,
+				       struct mm_struct *mm, pgd_t *pgd,
 				       bool checkwx, bool dmesg)
 {
 	const struct ptdump_range ptdump_ranges[] = {
@@ -386,12 +387,7 @@ static void ptdump_walk_pgd_level_core(struct seq_file *m, pgd_t *pgd,
 		.seq		= m
 	};
 
-	struct mm_struct fake_mm = {
-		.pgd = pgd
-	};
-	init_rwsem(&fake_mm.mmap_sem);
-
-	ptdump_walk_pgd(&st.ptdump, &fake_mm);
+	ptdump_walk_pgd(&st.ptdump, mm, pgd);
 
 	if (!checkwx)
 		return;
@@ -404,7 +400,7 @@ static void ptdump_walk_pgd_level_core(struct seq_file *m, pgd_t *pgd,
 
 void ptdump_walk_pgd_level(struct seq_file *m, struct mm_struct *mm)
 {
-	ptdump_walk_pgd_level_core(m, mm->pgd, false, true);
+	ptdump_walk_pgd_level_core(m, mm, mm->pgd, false, true);
 }
 
 void ptdump_walk_pgd_level_debugfs(struct seq_file *m, struct mm_struct *mm,
@@ -415,7 +411,7 @@ void ptdump_walk_pgd_level_debugfs(struct seq_file *m, struct mm_struct *mm,
 	if (user && boot_cpu_has(X86_FEATURE_PTI))
 		pgd = kernel_to_user_pgdp(pgd);
 #endif
-	ptdump_walk_pgd_level_core(m, pgd, false, false);
+	ptdump_walk_pgd_level_core(m, mm, pgd, false, false);
 }
 EXPORT_SYMBOL_GPL(ptdump_walk_pgd_level_debugfs);
 
@@ -430,13 +426,13 @@ void ptdump_walk_user_pgd_level_checkwx(void)
 
 	pr_info("x86/mm: Checking user space page tables\n");
 	pgd = kernel_to_user_pgdp(pgd);
-	ptdump_walk_pgd_level_core(NULL, pgd, true, false);
+	ptdump_walk_pgd_level_core(NULL, &init_mm, pgd, true, false);
 #endif
 }
 
 void ptdump_walk_pgd_level_checkwx(void)
 {
-	ptdump_walk_pgd_level_core(NULL, INIT_PGD, true, false);
+	ptdump_walk_pgd_level_core(NULL, &init_mm, INIT_PGD, true, false);
 }
 
 static int __init pt_dump_init(void)
diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 745a654c6ea7..b1cb6b753abb 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -74,6 +74,7 @@ enum page_walk_action {
  * mm_walk - walk_page_range data
  * @ops:	operation to call during the walk
  * @mm:		mm_struct representing the target process of page table walk
+ * @pgd:	pointer to PGD; only valid with no_vma (otherwise set to NULL)
  * @vma:	vma currently walked (NULL if walking outside vmas)
  * @action:	next action to perform (see enum page_walk_action)
  * @no_vma:	walk ignoring vmas (vma will always be NULL)
@@ -84,6 +85,7 @@ enum page_walk_action {
 struct mm_walk {
 	const struct mm_walk_ops *ops;
 	struct mm_struct *mm;
+	pgd_t *pgd;
 	struct vm_area_struct *vma;
 	enum page_walk_action action;
 	bool no_vma;
@@ -95,6 +97,7 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
 		void *private);
 int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
 			  unsigned long end, const struct mm_walk_ops *ops,
+			  pgd_t *pgd,
 			  void *private);
 int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
 		void *private);
diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
index b28f3f2acf90..a67065c403c3 100644
--- a/include/linux/ptdump.h
+++ b/include/linux/ptdump.h
@@ -17,6 +17,6 @@ struct ptdump_state {
 	const struct ptdump_range *range;
 };
 
-void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm);
+void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd);
 
 #endif /* _LINUX_PTDUMP_H */
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 5895ce4f1a85..928df1638c30 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -206,7 +206,10 @@ static int walk_pgd_range(unsigned long addr, unsigned long end,
 	const struct mm_walk_ops *ops = walk->ops;
 	int err = 0;
 
-	pgd = pgd_offset(walk->mm, addr);
+	if (walk->pgd)
+		pgd = walk->pgd + pgd_index(addr);
+	else
+		pgd = pgd_offset(walk->mm, addr);
 	do {
 		next = pgd_addr_end(addr, end);
 		if (pgd_none_or_clear_bad(pgd)) {
@@ -436,11 +439,13 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
  */
 int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
 			  unsigned long end, const struct mm_walk_ops *ops,
+			  pgd_t *pgd,
 			  void *private)
 {
 	struct mm_walk walk = {
 		.ops		= ops,
 		.mm		= mm,
+		.pgd		= pgd,
 		.private	= private,
 		.no_vma		= true
 	};
diff --git a/mm/ptdump.c b/mm/ptdump.c
index ad18a9839d6f..26208d0d03b7 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -122,14 +122,14 @@ static const struct mm_walk_ops ptdump_ops = {
 	.pte_hole	= ptdump_hole,
 };
 
-void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm)
+void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 {
 	const struct ptdump_range *range = st->range;
 
 	down_read(&mm->mmap_sem);
 	while (range->start != range->end) {
 		walk_page_range_novma(mm, range->start, range->end,
-				      &ptdump_ops, st);
+				      &ptdump_ops, pgd, st);
 		range++;
 	}
 	up_read(&mm->mmap_sem);
-- 
2.20.1

