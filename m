Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00807261AFB
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 20:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731498AbgIHSvp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 14:51:45 -0400
Received: from foss.arm.com ([217.140.110.172]:33472 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbgIHSuP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 14:50:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEDFB1045;
        Tue,  8 Sep 2020 11:50:12 -0700 (PDT)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A7E103F73C;
        Tue,  8 Sep 2020 11:50:11 -0700 (PDT)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, mingo@kernel.org,
        peterz@infradead.org, vincent.guittot@linaro.org,
        Juri Lelli <juri.lelli@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] sched/topology: Move sd_flag_debug out of #ifdef CONFIG_SYSCTL
Date:   Tue,  8 Sep 2020 19:49:56 +0100
Message-Id: <20200908184956.23369-1-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The last sd_flag_debug shuffle inadvertently moved its definition within
an #ifdef CONFIG_SYSCTL region. While CONFIG_SYSCTL is indeed required to
produce the sched domain ctl interface (which uses sd_flag_debug to output
flag names), it isn't required to run any assertion on the sched_domain
hierarchy itself.

Move the definition of sd_flag_debug to a CONFIG_SCHED_DEBUG region of
topology.c.

Now at long last we have:
o sd_flag_debug declared in include/linux/sched/topology.h iff
  CONFIG_SCHED_DEBUG=y
o sd_flag_debug defined in kernel/sched/topology.c, conditioned by:
  o CONFIG_SCHED_DEBUG, with an explicit #ifdef block
  o CONFIG_SMP, as a requirement to compile topology.c

With this change, all symbols pertaining to SD flag metadata (with the
exception of __SD_FLAG_CNT) are now defined exclusively within topology.c

Fixes: 8fca9494d4b4 ("sched/topology: Move sd_flag_debug out of linux/sched/topology.h")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
---
@Randy I didn't keep your Acked-by given that this is a slightly different
shuffle.
---
 kernel/sched/debug.c    | 6 ------
 kernel/sched/topology.c | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 0d7896d2a0b2..0655524700d2 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -245,12 +245,6 @@ set_table_entry(struct ctl_table *entry,
 	entry->proc_handler = proc_handler;
 }
 
-#define SD_FLAG(_name, mflags) [__##_name] = { .meta_flags = mflags, .name = #_name },
-const struct sd_flag_debug sd_flag_debug[] = {
-#include <linux/sched/sd_flags.h>
-};
-#undef SD_FLAG
-
 static int sd_ctl_doflags(struct ctl_table *table, int write,
 			  void *buffer, size_t *lenp, loff_t *ppos)
 {
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index da3cd60e4b78..55c453d140e9 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -25,6 +25,12 @@ static inline bool sched_debug(void)
 	return sched_debug_enabled;
 }
 
+#define SD_FLAG(_name, mflags) [__##_name] = { .meta_flags = mflags, .name = #_name },
+const struct sd_flag_debug sd_flag_debug[] = {
+#include <linux/sched/sd_flags.h>
+};
+#undef SD_FLAG
+
 static int sched_domain_debug_one(struct sched_domain *sd, int cpu, int level,
 				  struct cpumask *groupmask)
 {
-- 
2.27.0

