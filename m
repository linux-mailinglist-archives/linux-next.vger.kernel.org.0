Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B74E21BA18
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 17:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgGJP63 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 11:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgGJP63 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 11:58:29 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074CAC08C5CE;
        Fri, 10 Jul 2020 08:58:29 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id h17so2804476qvr.0;
        Fri, 10 Jul 2020 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=igEQSjkv/sGS5wJNt9Cad8nGfSf4xH7n0lwAXj7sRnE=;
        b=N3gsW9S42BPFihzTkYozk9CpPbhU809QieweC4Tun2Hf2yHqNfKsPR1othe6LzGx14
         Jg3gmoDtNGosNHiH7k4JT2sH/J5cxoCMi+Dz86Dq3TQqn3VEagga/HmVutF10QQKsEXE
         IwgEn5/LbAQTskWDNxEt90xp4zryl99I+Fz4+Rvq5VuVlGqREzhEdNtjqY6zhxOHL8t6
         xM4EguJ05vAZIN99vnOiVUjOqIBQWM7zZZ5h78/MP/TtS6oeVrHbTgf4ZXE/EUunMsZ/
         dxO6MG47fMBWqmGZ22TzWeekU+ZjcPZvBajzwuAXtFmoE0k2xU4QbuHm/MZp2SfDCTKF
         6Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=igEQSjkv/sGS5wJNt9Cad8nGfSf4xH7n0lwAXj7sRnE=;
        b=qMtW3/xts1Gpo70gk1uTlLUiECGKwoKCuj4p+Yu5awk8r0dKbKWECOQTA2ZJjEy14H
         WTXAQpUSBxVOIMWwe4W/D94dRscPRTtOIJTxe7wtmAgRdl3CtlcS+0LTx44z8zjjmP1c
         zkWYlnTg21HM92RBD5wNydnPeUeRSmlpjyKLfJSFsc+vhm44frGrdG2udlpNmYm6+mjP
         PHQ+5ZPDtn03iE9lP+bC/wi6L2fGEYAEGaRbMKava5KnpnJwhGrA5E8o3cIrUMm8R/SM
         AGjqAzFDhIvAYmX7IxFOATiKT8Fm1F+4nFaZpM0T8m/IGxqb3b7Sf6768K1WIxO+8x2T
         FvJg==
X-Gm-Message-State: AOAM531J/Bl6hX5nO/mbXW5ECC8ghgF3mUHA3LmyelIZKrxVfbKrnmwF
        crPsYvSPSN1lHGk4KFhGiBY=
X-Google-Smtp-Source: ABdhPJzG2LvBmu5l1e9tQ7MdJvJUrTtm0Bo1F/8Ee6F0Lcgct3NUDdlFpGuKj2Volx8DLNdoImcf/g==
X-Received: by 2002:ad4:5148:: with SMTP id g8mr28746706qvq.173.1594396708022;
        Fri, 10 Jul 2020 08:58:28 -0700 (PDT)
Received: from dev.localdomain ([183.134.211.52])
        by smtp.gmail.com with ESMTPSA id k18sm7712313qki.30.2020.07.10.08.58.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jul 2020 08:58:27 -0700 (PDT)
From:   Yafang Shao <laoar.shao@gmail.com>
To:     mhocko@kernel.org, cai@lca.pw, rientjes@google.com,
        akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v3] mm, oom: make the calculation of oom badness more accurate
Date:   Fri, 10 Jul 2020 11:57:31 -0400
Message-Id: <1594396651-9931-1-git-send-email-laoar.shao@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Recently we found an issue on our production environment that when memcg
oom is triggered the oom killer doesn't chose the process with largest
resident memory but chose the first scanned process. Note that all
processes in this memcg have the same oom_score_adj, so the oom killer
should chose the process with largest resident memory.

Bellow is part of the oom info, which is enough to analyze this issue.
[7516987.983223] memory: usage 16777216kB, limit 16777216kB, failcnt 52843037
[7516987.983224] memory+swap: usage 16777216kB, limit 9007199254740988kB, failcnt 0
[7516987.983225] kmem: usage 301464kB, limit 9007199254740988kB, failcnt 0
[...]
[7516987.983293] [ pid ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
[7516987.983510] [ 5740]     0  5740      257        1    32768        0          -998 pause
[7516987.983574] [58804]     0 58804     4594      771    81920        0          -998 entry_point.bas
[7516987.983577] [58908]     0 58908     7089      689    98304        0          -998 cron
[7516987.983580] [58910]     0 58910    16235     5576   163840        0          -998 supervisord
[7516987.983590] [59620]     0 59620    18074     1395   188416        0          -998 sshd
[7516987.983594] [59622]     0 59622    18680     6679   188416        0          -998 python
[7516987.983598] [59624]     0 59624  1859266     5161   548864        0          -998 odin-agent
[7516987.983600] [59625]     0 59625   707223     9248   983040        0          -998 filebeat
[7516987.983604] [59627]     0 59627   416433    64239   774144        0          -998 odin-log-agent
[7516987.983607] [59631]     0 59631   180671    15012   385024        0          -998 python3
[7516987.983612] [61396]     0 61396   791287     3189   352256        0          -998 client
[7516987.983615] [61641]     0 61641  1844642    29089   946176        0          -998 client
[7516987.983765] [ 9236]     0  9236     2642      467    53248        0          -998 php_scanner
[7516987.983911] [42898]     0 42898    15543      838   167936        0          -998 su
[7516987.983915] [42900]  1000 42900     3673      867    77824        0          -998 exec_script_vr2
[7516987.983918] [42925]  1000 42925    36475    19033   335872        0          -998 python
[7516987.983921] [57146]  1000 57146     3673      848    73728        0          -998 exec_script_J2p
[7516987.983925] [57195]  1000 57195   186359    22958   491520        0          -998 python2
[7516987.983928] [58376]  1000 58376   275764    14402   290816        0          -998 rosmaster
[7516987.983931] [58395]  1000 58395   155166     4449   245760        0          -998 rosout
[7516987.983935] [58406]  1000 58406 18285584  3967322 37101568        0          -998 data_sim
[7516987.984221] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=3aa16c9482ae3a6f6b78bda68a55d32c87c99b985e0f11331cddf05af6c4d753,mems_allowed=0-1,oom_memcg=/kubepods/podf1c273d3-9b36-11ea-b3df-246e9693c184,task_memcg=/kubepods/podf1c273d3-9b36-11ea-b3df-246e9693c184/1f246a3eeea8f70bf91141eeaf1805346a666e225f823906485ea0b6c37dfc3d,task=pause,pid=5740,uid=0
[7516987.984254] Memory cgroup out of memory: Killed process 5740 (pause) total-vm:1028kB, anon-rss:4kB, file-rss:0kB, shmem-rss:0kB
[7516988.092344] oom_reaper: reaped process 5740 (pause), now anon-rss:0kB, file-rss:0kB, shmem-rss:0kB

We can find that the first scanned process 5740 (pause) was killed, but its
rss is only one page. That is because, when we calculate the oom badness in
oom_badness(), we always ignore the negtive point and convert all of these
negtive points to 1. Now as oom_score_adj of all the processes in this
targeted memcg have the same value -998, the points of these processes are
all negtive value. As a result, the first scanned process will be killed.

The oom_socre_adj (-998) in this memcg is set by kubelet, because it is a
a Guaranteed pod, which has higher priority to prevent from being killed by
system oom.

To fix this issue, we should make the calculation of oom point more
accurate. We can achieve it by convert the chosen_point from 'unsigned
long' to 'long'.

[cai@lca.pw: reported a issue in the previous version]
[mhocko@suse.com: fixed the issue reported by Cai]
[mhocko@suse.com: add the comment in proc_oom_score()]
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Qian Cai <cai@lca.pw>

---
v2 -> v3:
- fix the type of variable 'point' in oom_evaluate_task()
- initialize oom_control->chosen_points in select_bad_process() per Michal
- update the comment in proc_oom_score() per Michal

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 fs/proc/base.c      | 11 ++++++++++-
 include/linux/oom.h |  4 ++--
 mm/oom_kill.c       | 22 ++++++++++------------
 3 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index d86c0af..10c2a26 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -551,8 +551,17 @@ static int proc_oom_score(struct seq_file *m, struct pid_namespace *ns,
 {
 	unsigned long totalpages = totalram_pages() + total_swap_pages;
 	unsigned long points = 0;
+	long badness;
+
+	badness = oom_badness(task, totalpages);
+	/*
+	 * Special case OOM_SCORE_ADJ_MIN for all others scale the
+	 * badness value into [0, 2000] range which we have been
+	 * exporting for a long time so userspace might depend on it.
+	 */
+	if (badness != LONG_MIN)
+		points = (1000 + badness * 1000 / (long)totalpages) * 2 / 3;
 
-	points = oom_badness(task, totalpages) * 1000 / totalpages;
 	seq_printf(m, "%lu\n", points);
 
 	return 0;
diff --git a/include/linux/oom.h b/include/linux/oom.h
index c696c26..f022f58 100644
--- a/include/linux/oom.h
+++ b/include/linux/oom.h
@@ -48,7 +48,7 @@ struct oom_control {
 	/* Used by oom implementation, do not set */
 	unsigned long totalpages;
 	struct task_struct *chosen;
-	unsigned long chosen_points;
+	long chosen_points;
 
 	/* Used to print the constraint info. */
 	enum oom_constraint constraint;
@@ -107,7 +107,7 @@ static inline vm_fault_t check_stable_address_space(struct mm_struct *mm)
 
 bool __oom_reap_task_mm(struct mm_struct *mm);
 
-extern unsigned long oom_badness(struct task_struct *p,
+long oom_badness(struct task_struct *p,
 		unsigned long totalpages);
 
 extern bool out_of_memory(struct oom_control *oc);
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 6e94962..b0ac617 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -196,17 +196,17 @@ static bool is_dump_unreclaim_slabs(void)
  * predictable as possible.  The goal is to return the highest value for the
  * task consuming the most memory to avoid subsequent oom failures.
  */
-unsigned long oom_badness(struct task_struct *p, unsigned long totalpages)
+long oom_badness(struct task_struct *p, unsigned long totalpages)
 {
 	long points;
 	long adj;
 
 	if (oom_unkillable_task(p))
-		return 0;
+		return LONG_MIN;
 
 	p = find_lock_task_mm(p);
 	if (!p)
-		return 0;
+		return LONG_MIN;
 
 	/*
 	 * Do not even consider tasks which are explicitly marked oom
@@ -218,7 +218,7 @@ unsigned long oom_badness(struct task_struct *p, unsigned long totalpages)
 			test_bit(MMF_OOM_SKIP, &p->mm->flags) ||
 			in_vfork(p)) {
 		task_unlock(p);
-		return 0;
+		return LONG_MIN;
 	}
 
 	/*
@@ -233,11 +233,7 @@ unsigned long oom_badness(struct task_struct *p, unsigned long totalpages)
 	adj *= totalpages / 1000;
 	points += adj;
 
-	/*
-	 * Never return 0 for an eligible task regardless of the root bonus and
-	 * oom_score_adj (oom_score_adj can't be OOM_SCORE_ADJ_MIN here).
-	 */
-	return points > 0 ? points : 1;
+	return points;
 }
 
 static const char * const oom_constraint_text[] = {
@@ -310,7 +306,7 @@ static enum oom_constraint constrained_alloc(struct oom_control *oc)
 static int oom_evaluate_task(struct task_struct *task, void *arg)
 {
 	struct oom_control *oc = arg;
-	unsigned long points;
+	long points;
 
 	if (oom_unkillable_task(task))
 		goto next;
@@ -336,12 +332,12 @@ static int oom_evaluate_task(struct task_struct *task, void *arg)
 	 * killed first if it triggers an oom, then select it.
 	 */
 	if (oom_task_origin(task)) {
-		points = ULONG_MAX;
+		points = LONG_MAX;
 		goto select;
 	}
 
 	points = oom_badness(task, oc->totalpages);
-	if (!points || points < oc->chosen_points)
+	if (points == LONG_MIN || points < oc->chosen_points)
 		goto next;
 
 select:
@@ -365,6 +361,8 @@ static int oom_evaluate_task(struct task_struct *task, void *arg)
  */
 static void select_bad_process(struct oom_control *oc)
 {
+	oc->chosen_points = LONG_MIN;
+
 	if (is_memcg_oom(oc))
 		mem_cgroup_scan_tasks(oc->memcg, oom_evaluate_task, oc);
 	else {
-- 
1.8.3.1

