Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D30D4B4F76
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 15:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbfIQNim convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 17 Sep 2019 09:38:42 -0400
Received: from foss.arm.com ([217.140.110.172]:56090 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727715AbfIQNil (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Sep 2019 09:38:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C81928;
        Tue, 17 Sep 2019 06:38:41 -0700 (PDT)
Received: from e110439-lin (e110439-lin.cambridge.arm.com [10.1.194.43])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 382903F575;
        Tue, 17 Sep 2019 06:38:40 -0700 (PDT)
References: <20190916223850.GQ4352@sirena.co.uk> <1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org> <20190917075242.GB49590@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Patrick Bellasi <patrick.bellasi@arm.com>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Sep 16 (kernel/sched/core.c)
In-reply-to: <20190917075242.GB49590@gmail.com>
Date:   Tue, 17 Sep 2019 14:38:28 +0100
Message-ID: <8736gv2gbv.fsf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On Tue, Sep 17, 2019 at 08:52:42 +0100, Ingo Molnar wrote...

> * Randy Dunlap <rdunlap@infradead.org> wrote:
>
>> On 9/16/19 3:38 PM, Mark Brown wrote:
>> > Hi all,
>> > 
>> > Changes since 20190915:
>> > 
>> 
>> on x86_64:
>> 
>> when CONFIG_CGROUPS is not set:

Hi Randy,
thanks for the report.

>>   CC      kernel/sched/core.o
>> ../kernel/sched/core.c: In function ‘uclamp_update_active_tasks’:
>> ../kernel/sched/core.c:1081:23: error: storage size of ‘it’ isn’t known
>>   struct css_task_iter it;
>>                        ^~
>>   CC      kernel/printk/printk_safe.o
>> ../kernel/sched/core.c:1084:2: error: implicit declaration of function ‘css_task_iter_start’; did you mean ‘__sg_page_iter_start’? [-Werror=implicit-function-declaration]
>>   css_task_iter_start(css, 0, &it);
>>   ^~~~~~~~~~~~~~~~~~~
>>   __sg_page_iter_start
>> ../kernel/sched/core.c:1085:14: error: implicit declaration of function ‘css_task_iter_next’; did you mean ‘__sg_page_iter_next’? [-Werror=implicit-function-declaration]
>>   while ((p = css_task_iter_next(&it))) {
>>               ^~~~~~~~~~~~~~~~~~
>>               __sg_page_iter_next
>> ../kernel/sched/core.c:1091:2: error: implicit declaration of function ‘css_task_iter_end’; did you mean ‘get_task_cred’? [-Werror=implicit-function-declaration]
>>   css_task_iter_end(&it);
>>   ^~~~~~~~~~~~~~~~~
>>   get_task_cred
>> ../kernel/sched/core.c:1081:23: warning: unused variable ‘it’ [-Wunused-variable]
>>   struct css_task_iter it;
>>                        ^~
>> 
>
> I cannot reproduce this build failue: I took Linus's latest which has all 
> the -next scheduler commits included (ad062195731b), and an x86-64 "make 
> defconfig" and a disabling of CONFIG_CGROUPS still resuls in a kernel 
> that builds fine.

Same here Ingo, I cannot reproduce on arm64 and !CONFIG_CGROUPS and
testing on tip/sched/core.

However, if you like, the following patch can make that code a
bit more "robust".

Best,
Patrick

---8<---
From 7e17b7bb08dd8dfc57e01c2a7b6875439eb47cbe Mon Sep 17 00:00:00 2001
From: Patrick Bellasi <patrick.bellasi@arm.com>
Date: Tue, 17 Sep 2019 14:12:10 +0100
Subject: [PATCH 1/1] sched/core: uclamp: Fix compile error on !CONFIG_CGROUPS

Randy reported a compiler error on x86_64 and !CONFIG_CGROUPS which is due
to uclamp_update_active_tasks() using the undefined css_task_iter().

Since uclamp_update_active_tasks() is used only when cgroup support is
enabled, fix that by properly guarding that function at compile time.

Signed-off-by: Patrick Bellasi <patrick.bellasi@arm.com>
Link: https://lore.kernel.org/lkml/1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org/
Fixes: commit babbe170e05 ("sched/uclamp: Update CPU's refcount on TG's clamp changes")
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3c7b90bcbe4e..14873ad4b34a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1043,6 +1043,7 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
 		uclamp_rq_dec_id(rq, p, clamp_id);
 }
 
+#ifdef CONFIG_UCLAMP_TASK_GROUP
 static inline void
 uclamp_update_active(struct task_struct *p, enum uclamp_id clamp_id)
 {
@@ -1091,7 +1092,6 @@ uclamp_update_active_tasks(struct cgroup_subsys_state *css,
 	css_task_iter_end(&it);
 }
 
-#ifdef CONFIG_UCLAMP_TASK_GROUP
 static void cpu_util_update_eff(struct cgroup_subsys_state *css);
 static void uclamp_update_root_tg(void)
 {
-- 
2.22.0
---8<---

-- 
#include <best/regards.h>

Patrick Bellasi
