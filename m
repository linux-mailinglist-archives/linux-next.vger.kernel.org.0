Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152D33CF86E
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 12:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238073AbhGTKOl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 06:14:41 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:48999 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238010AbhGTKKq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 06:10:46 -0400
Received: by mail-io1-f69.google.com with SMTP id f2-20020a6b62020000b02905094eaa65fdso15039352iog.15
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 03:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Ole8b2cR6lQoDSXLNb5l4NYhygBr3zVA6T0AtIVglTc=;
        b=l/L/YpDkWZ1opgwdiHQ+0jsSSZM/5+yOnzEsOKXxnxjmsVF17r2PqB7V+t2eA0NJE7
         7n2ZEf705DXoNOIqmpQuG4Y1t1xzhSb9T1UPGHCh3Q84YwUHcI3Kd3xHH9TuznuJ+Org
         lxZnT8nR2UcqcEe1BZ6XTWc9E7sHtnv1e6wybkBukYsz7Bqg/dqlsW/us/+rjk2ScI0L
         pXDWFaEyb/butlvxi7Irav10WicdlOqjRUB74tHVd+8vwYc/DnrBHGSpOJ/W95E11rF8
         Z8XJuO5caWQmMOsnmjuXGAMy35XtKCDJ5VSQJ72Ld070VaJj/sldLlEMRgR89l+FbRYb
         ladg==
X-Gm-Message-State: AOAM530MAPdSaZndve1paTbGew6IZwLuIx999ABWoRE5wBpb3Ie4FHie
        bMymWJcxjqZgbNHHtluf5AmTS13iW9mkk9Gtmmbeym7+WXnJ
X-Google-Smtp-Source: ABdhPJzrg1xbwj9UVISbQgfhQpJ0AXZpQnVvU/gpeRDUY2fKFNkOEYZTFzgFeOOaXAO+KHJa+QEprVV74Yx3q4DnDsSE2p1Jq8k1
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a46:: with SMTP id u6mr20003836ilv.135.1626778282613;
 Tue, 20 Jul 2021 03:51:22 -0700 (PDT)
Date:   Tue, 20 Jul 2021 03:51:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a9e38905c78bd588@google.com>
Subject: [syzbot] linux-next boot error: BUG: sleeping function called from
 invalid context in cgroup_rstat_flush
From:   syzbot <syzbot+0e2d06632863e7ddb1c7@syzkaller.appspotmail.com>
To:     cgroups@vger.kernel.org, hannes@cmpxchg.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        lizefan.x@bytedance.com, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    6e235535ce82 Add linux-next specific files for 20210716
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17f3d7e2300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b07a961928126747
dashboard link: https://syzkaller.appspot.com/bug?extid=0e2d06632863e7ddb1c7

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0e2d06632863e7ddb1c7@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at kernel/cgroup/rstat.c:200
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 39, name: kworker/u4:3
3 locks held by kworker/u4:3/39:
 #0: ffff888010869138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888010869138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:620 [inline]
 #0: ffff888010869138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
 #0: ffff888010869138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:617 [inline]
 #0: ffff888010869138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:644 [inline]
 #0: ffff888010869138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x871/0x1630 kernel/workqueue.c:2247
 #1: ffffc90000e2fdb0 (stats_flush_work){+.+.}-{0:0}, at: process_one_work+0x8a5/0x1630 kernel/workqueue.c:2251
 #2: ffffffff8bad45d8 (stats_flush_lock){+.+.}-{2:2}, at: spin_trylock include/linux/spinlock.h:369 [inline]
 #2: ffffffff8bad45d8 (stats_flush_lock){+.+.}-{2:2}, at: mem_cgroup_flush_stats mm/memcontrol.c:5358 [inline]
 #2: ffffffff8bad45d8 (stats_flush_lock){+.+.}-{2:2}, at: flush_memcg_stats_work+0xd/0x50 mm/memcontrol.c:5373
Preemption disabled at:
[<0000000000000000>] 0x0
CPU: 0 PID: 39 Comm: kworker/u4:3 Not tainted 5.14.0-rc1-next-20210716-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events_unbound flush_memcg_stats_work
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:105
 ___might_sleep.cold+0x1f3/0x239 kernel/sched/core.c:9182
 cgroup_rstat_flush+0x1c/0x50 kernel/cgroup/rstat.c:200
 mem_cgroup_flush_stats mm/memcontrol.c:5361 [inline]
 mem_cgroup_flush_stats mm/memcontrol.c:5356 [inline]
 flush_memcg_stats_work+0x39/0x50 mm/memcontrol.c:5373
 process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2422
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
