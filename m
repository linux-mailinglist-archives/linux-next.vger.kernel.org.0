Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DC526149F
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 18:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731975AbgIHQ2l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 12:28:41 -0400
Received: from foss.arm.com ([217.140.110.172]:57508 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731964AbgIHQ2g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 12:28:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AD081045;
        Tue,  8 Sep 2020 09:28:35 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8F03F68F;
        Tue,  8 Sep 2020 09:28:34 -0700 (PDT)
References: <20200908205659.361b0a1b@canb.auug.org.au> <ddc76403-4b00-66ba-43ea-7889b9a32bb5@infradead.org> <CAKfTPtB-br6iKAMnofbPEmPVF-fpQpjkbXtfTcNkNzbc1Kdtug@mail.gmail.com> <jhj4ko86zk4.mognet@arm.com> <b6e6f676-d61b-5109-759f-4b4f2c24bab1@infradead.org> <jhj363s6ylu.mognet@arm.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>
Subject: Re: linux-next: Tree for Sep 8 (sched/topology.c)
In-reply-to: <jhj363s6ylu.mognet@arm.com>
Date:   Tue, 08 Sep 2020 17:28:32 +0100
Message-ID: <jhj1rjc6xn3.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 08/09/20 17:07, Valentin Schneider wrote:
> On 08/09/20 16:50, Randy Dunlap wrote:
>> Sure, here it is again.  And
>> CONFIG_SMP=y
>> CONFIG_SCHED_DEBUG=y
>>
>> thanks.
>
> Okay so I can reproduce that with GCC-10.1, now to figure out WTH is going on...

Yet another fail from my end, the declaration is conditioned by:

  CONFIG_SCHED_DEBUG
  CONFIG_SMP
  CONFIG_SYSCTL

that last one being ofc stupid. Below lets me build; I'll go get
something with caffeine in it and double-check the shuffles I've done
before sending an actual patch.

Thanks for the report!

---
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 0d7896d2a0b2..0ca486aa296b 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -185,6 +185,12 @@ late_initcall(sched_init_debug);

 #ifdef CONFIG_SMP

+#define SD_FLAG(_name, mflags) [__##_name] = { .meta_flags = mflags, .name = #_name },
+const struct sd_flag_debug sd_flag_debug[] = {
+#include <linux/sched/sd_flags.h>
+};
+#undef SD_FLAG
+
 #ifdef CONFIG_SYSCTL

 static struct ctl_table sd_ctl_dir[] = {
@@ -245,12 +251,6 @@ set_table_entry(struct ctl_table *entry,
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
---
