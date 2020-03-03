Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE2AE176E04
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 05:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgCCEan (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 23:30:43 -0500
Received: from foss.arm.com ([217.140.110.172]:42200 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726928AbgCCEan (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Mar 2020 23:30:43 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 545F52F;
        Mon,  2 Mar 2020 20:30:42 -0800 (PST)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com [10.162.16.51])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08C093F6CF;
        Mon,  2 Mar 2020 20:30:38 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        sfr@canb.auug.org.au, linux-next@vger.kernel.org
Subject: [PATCH] sched/fair: Conditionally enable test_idle_cores() forward declaration
Date:   Tue,  3 Mar 2020 10:00:26 +0530
Message-Id: <1583209826-28853-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

test_idle_cores()'s definition and all it's call sites are enclosed within
CONFIG_SCHED_SMT. Hence the forward declaration needs to be conditionally
enabled in order to prevent build warnings like the following.

kernel/sched/fair.c:1524:20: warning: ‘test_idle_cores’ declared ‘static’
but never defined [-Wunused-function]
 static inline bool test_idle_cores(int cpu, bool def);
                    ^~~~~~~~~~~~~~~

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch solves a build problem that exists on next-20200302.

 kernel/sched/fair.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 84594f8..827087f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1521,7 +1521,9 @@ static inline bool is_core_idle(int cpu)
 }
 
 /* Forward declarations of select_idle_sibling helpers */
+#ifdef CONFIG_SCHED_SMT
 static inline bool test_idle_cores(int cpu, bool def);
+#endif
 
 struct task_numa_env {
 	struct task_struct *p;
-- 
2.7.4

