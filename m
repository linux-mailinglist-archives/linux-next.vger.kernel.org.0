Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F16E3BE3BB
	for <lists+linux-next@lfdr.de>; Wed,  7 Jul 2021 09:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhGGHlE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Jul 2021 03:41:04 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:35771 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhGGHlD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Jul 2021 03:41:03 -0400
Received: by mail-il1-f200.google.com with SMTP id f5-20020a92b5050000b02901ff388acf98so953357ile.2
        for <linux-next@vger.kernel.org>; Wed, 07 Jul 2021 00:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=OP6EFmg3s8FiH5ZVC8SxNUqy422AeHEU5rxVsBInPdg=;
        b=uD7AMdT5dzfSQwFs/4Ppkd/Y2H1BYzeTh+wUYuL4qpvESHBz6hWk9dEYP+fZEgw10f
         R7yq14SPpiDWhm6vqVG3WNogXItvaycc2/liTQQXFOoNmT3t7zZ1jEzvVoShl/x2h1Mm
         z7wE/xfxOCg+b5pDgv2/Iu3rIUX41IQAhCHeP7SMt9f5GMhV3sXtR2yU9CMgyB4kz2w+
         3UXDFbWGiAeH8zTErGJ2GGb4YJfX+72gjNzlkW7C3n+Zyab3Nko8WRTd1Tm1UnxcImwx
         EAthb0501b+oyRLpsv6QKMz9XjZ2DnyS0W2u3JaaWDo+wxAQQJsAGcf6kF/6vzmENpv+
         KEQA==
X-Gm-Message-State: AOAM533fKhpP0IjTis7HdRRzkXIQAn+Jr5LB392YOUyKkOy5QhNDBQ4g
        UlQY3aXX6cfpM/lbkBDnnfzUhDmfByc6CyC+CJdMc8gQ6hov
X-Google-Smtp-Source: ABdhPJy5Int4WcBwrm7D/HUxKs/4ZLvetn25Y1GBXl69NFRN0Xez54Eey+hmaNC4Rb2gBW+6PUxLnnZ5tddEXFPZAqXRLZWfwIvx
MIME-Version: 1.0
X-Received: by 2002:a92:a80e:: with SMTP id o14mr17352758ilh.81.1625643503161;
 Wed, 07 Jul 2021 00:38:23 -0700 (PDT)
Date:   Wed, 07 Jul 2021 00:38:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008996be05c6839f13@google.com>
Subject: [syzbot] linux-next test error: possible deadlock in fs_reclaim_acquire
From:   syzbot <syzbot+96238133b569a5838d63@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    d72e6319 Add linux-next specific files for 20210706
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=160c5ee4300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=59e1e3bbc3afca75
dashboard link: https://syzkaller.appspot.com/bug?extid=96238133b569a5838d63

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+96238133b569a5838d63@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
5.13.0-next-20210706-syzkaller #0 Not tainted
------------------------------------------------------
syz-fuzzer/8441 is trying to acquire lock:
ffffffff8ba9f5c0 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire+0xf7/0x160 mm/page_alloc.c:4585

but task is already holding lock:
ffff8880b9d4d660 (lock#2){-.-.}-{2:2}, at: __alloc_pages_bulk+0x4ad/0x1870 mm/page_alloc.c:5290

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (lock#2){-.-.}-{2:2}:
       local_lock_acquire include/linux/local_lock_internal.h:42 [inline]
       rmqueue_pcplist mm/page_alloc.c:3674 [inline]
       rmqueue mm/page_alloc.c:3712 [inline]
       get_page_from_freelist+0x4aa/0x2f80 mm/page_alloc.c:4174
       __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5385
       alloc_page_interleave+0x1e/0x200 mm/mempolicy.c:2119
       alloc_pages+0x238/0x2a0 mm/mempolicy.c:2242
       stack_depot_save+0x39d/0x4e0 lib/stackdepot.c:303
       kasan_save_stack+0x32/0x40 mm/kasan/common.c:40
       kasan_record_aux_stack+0xe5/0x110 mm/kasan/generic.c:348
       insert_work+0x48/0x370 kernel/workqueue.c:1332
       __queue_work+0x5c1/0xed0 kernel/workqueue.c:1498
       __queue_delayed_work+0x1c8/0x270 kernel/workqueue.c:1645
       mod_delayed_work_on+0xdd/0x220 kernel/workqueue.c:1719
       kblockd_mod_delayed_work_on+0x26/0x30 block/blk-core.c:1633
       __blk_mq_delay_run_hw_queue+0x38d/0x640 block/blk-mq.c:1585
       blk_mq_run_hw_queue+0x16c/0x2f0 block/blk-mq.c:1630
       blk_mq_sched_insert_request+0x368/0x450 block/blk-mq-sched.c:479
       blk_mq_submit_bio+0xe5f/0x1860 block/blk-mq.c:2296
       __submit_bio_noacct_mq block/blk-core.c:1011 [inline]
       submit_bio_noacct block/blk-core.c:1044 [inline]
       submit_bio_noacct+0xad2/0xf20 block/blk-core.c:1027
       submit_bio+0x1ea/0x470 block/blk-core.c:1106
       submit_bh_wbc+0x5eb/0x7f0 fs/buffer.c:3087
       __ext4_read_bh fs/ext4/super.c:156 [inline]
       ext4_read_bh+0x152/0x300 fs/ext4/super.c:180
       ext4_read_bh_lock+0x82/0x180 fs/ext4/super.c:192
       __ext4_sb_bread_gfp.isra.0+0xf3/0x1b0 fs/ext4/super.c:224
       ext4_sb_bread_unmovable fs/ext4/super.c:241 [inline]
       ext4_fill_super+0x233d/0xe3f0 fs/ext4/super.c:4474
       mount_bdev+0x34d/0x410 fs/super.c:1368
       legacy_get_tree+0x105/0x220 fs/fs_context.c:592
       vfs_get_tree+0x89/0x2f0 fs/super.c:1498
       do_new_mount fs/namespace.c:2905 [inline]
       path_mount+0x132a/0x1fa0 fs/namespace.c:3235
       init_mount+0xaa/0xf4 fs/init.c:25
       do_mount_root+0x9c/0x25b init/do_mounts.c:386
       mount_block_root+0x32e/0x4dd init/do_mounts.c:417
       mount_root+0x1af/0x1f5 init/do_mounts.c:555
       prepare_namespace+0x1ff/0x234 init/do_mounts.c:607
       kernel_init_freeable+0x729/0x741 init/main.c:1611
       kernel_init+0x1a/0x1d0 init/main.c:1490
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

-> #1 (&pool->lock){-.-.}-{2:2}:
       __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
       _raw_spin_lock+0x2a/0x40 kernel/locking/spinlock.c:151
       __queue_work+0x366/0xed0 kernel/workqueue.c:1455
       queue_work_on+0xee/0x110 kernel/workqueue.c:1525
       queue_work include/linux/workqueue.h:507 [inline]
       schedule_work include/linux/workqueue.h:568 [inline]
       __vfree_deferred mm/vmalloc.c:2609 [inline]
       vfree_atomic+0xac/0xe0 mm/vmalloc.c:2627
       free_thread_stack kernel/fork.c:292 [inline]
       release_task_stack kernel/fork.c:432 [inline]
       put_task_stack+0x2e0/0x4e0 kernel/fork.c:443
       finish_task_switch.isra.0+0x75a/0xa20 kernel/sched/core.c:4601
       context_switch kernel/sched/core.c:4703 [inline]
       __schedule+0x942/0x26f0 kernel/sched/core.c:5957
       preempt_schedule_irq+0x4e/0x90 kernel/sched/core.c:6345
       irqentry_exit+0x31/0x80 kernel/entry/common.c:427
       asm_sysvec_reschedule_ipi+0x12/0x20 arch/x86/include/asm/idtentry.h:643
       lock_acquire+0x1ef/0x510 kernel/locking/lockdep.c:5593
       __fs_reclaim_acquire mm/page_alloc.c:4563 [inline]
       fs_reclaim_acquire+0x117/0x160 mm/page_alloc.c:4577
       might_alloc include/linux/sched/mm.h:219 [inline]
       slab_pre_alloc_hook mm/slab.h:485 [inline]
       slab_alloc_node mm/slub.c:2902 [inline]
       slab_alloc mm/slub.c:2989 [inline]
       kmem_cache_alloc+0x3e/0x3a0 mm/slub.c:2994
       kmem_cache_zalloc include/linux/slab.h:711 [inline]
       __kernfs_new_node+0xd4/0x8b0 fs/kernfs/dir.c:583
       kernfs_new_node+0x93/0x120 fs/kernfs/dir.c:645
       __kernfs_create_file+0x51/0x350 fs/kernfs/file.c:985
       sysfs_add_file_mode_ns+0x226/0x540 fs/sysfs/file.c:317
       create_files fs/sysfs/group.c:64 [inline]
       internal_create_group+0x328/0xb20 fs/sysfs/group.c:149
       kernel_add_sysfs_param kernel/params.c:796 [inline]
       param_sysfs_builtin kernel/params.c:833 [inline]
       param_sysfs_init+0x39a/0x498 kernel/params.c:952
       do_one_initcall+0x103/0x650 init/main.c:1285
       do_initcall_level init/main.c:1360 [inline]
       do_initcalls init/main.c:1376 [inline]
       do_basic_setup init/main.c:1396 [inline]
       kernel_init_freeable+0x6b8/0x741 init/main.c:1598
       kernel_init+0x1a/0x1d0 init/main.c:1490
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

-> #0 (fs_reclaim){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3051 [inline]
       check_prevs_add kernel/locking/lockdep.c:3174 [inline]
       validate_chain kernel/locking/lockdep.c:3789 [inline]
       __lock_acquire+0x2a07/0x54a0 kernel/locking/lockdep.c:5015
       lock_acquire kernel/locking/lockdep.c:5625 [inline]
       lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5590
       __fs_reclaim_acquire mm/page_alloc.c:4563 [inline]
       fs_reclaim_acquire+0x117/0x160 mm/page_alloc.c:4577
       prepare_alloc_pages+0x15c/0x580 mm/page_alloc.c:5175
       __alloc_pages+0x12f/0x500 mm/page_alloc.c:5374
       alloc_pages+0x18c/0x2a0 mm/mempolicy.c:2244
       stack_depot_save+0x39d/0x4e0 lib/stackdepot.c:303
       save_stack+0x15e/0x1e0 mm/page_owner.c:120
       __set_page_owner+0x50/0x290 mm/page_owner.c:181
       prep_new_page mm/page_alloc.c:2444 [inline]
       __alloc_pages_bulk+0x8b9/0x1870 mm/page_alloc.c:5312
       alloc_pages_bulk_array_node include/linux/gfp.h:557 [inline]
       vm_area_alloc_pages mm/vmalloc.c:2793 [inline]
       __vmalloc_area_node mm/vmalloc.c:2863 [inline]
       __vmalloc_node_range+0x39d/0x960 mm/vmalloc.c:2966
       __vmalloc_node mm/vmalloc.c:3015 [inline]
       vzalloc+0x67/0x80 mm/vmalloc.c:3085
       n_tty_open+0x16/0x170 drivers/tty/n_tty.c:1848
       tty_ldisc_open+0x9b/0x110 drivers/tty/tty_ldisc.c:449
       tty_ldisc_setup+0x43/0x100 drivers/tty/tty_ldisc.c:766
       tty_init_dev.part.0+0x1f4/0x610 drivers/tty/tty_io.c:1453
       tty_init_dev include/linux/err.h:36 [inline]
       tty_open_by_driver drivers/tty/tty_io.c:2098 [inline]
       tty_open+0xb16/0x1000 drivers/tty/tty_io.c:2146
       chrdev_open+0x266/0x770 fs/char_dev.c:414
       do_dentry_open+0x4c8/0x11d0 fs/open.c:826
       do_open fs/namei.c:3374 [inline]
       path_openat+0x1c23/0x27f0 fs/namei.c:3507
       do_filp_open+0x1aa/0x400 fs/namei.c:3534
       do_sys_openat2+0x16d/0x420 fs/open.c:1204
       do_sys_open fs/open.c:1220 [inline]
       __do_sys_openat fs/open.c:1236 [inline]
       __se_sys_openat fs/open.c:1231 [inline]
       __x64_sys_openat+0x13f/0x1f0 fs/open.c:1231
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x44/0xae

other info that might help us debug this:

Chain exists of:
  fs_reclaim --> &pool->lock --> lock#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(lock#2);
                               lock(&pool->lock);
                               lock(lock#2);
  lock(fs_reclaim);

 *** DEADLOCK ***

4 locks held by syz-fuzzer/8441:
 #0: ffffffff8c37b7c8 (tty_mutex){+.+.}-{3:3}, at: tty_open_by_driver drivers/tty/tty_io.c:2062 [inline]
 #0: ffffffff8c37b7c8 (tty_mutex){+.+.}-{3:3}, at: tty_open+0x55e/0x1000 drivers/tty/tty_io.c:2146
 #1: ffff8880301c01c0 (&tty->legacy_mutex){+.+.}-{3:3}, at: tty_lock+0xbd/0x120 drivers/tty/tty_mutex.c:20
 #2: ffff8880301c0098 (&tty->ldisc_sem){++++}-{0:0}, at: __tty_ldisc_lock drivers/tty/tty_ldisc.c:300 [inline]
 #2: ffff8880301c0098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_lock+0x61/0xb0 drivers/tty/tty_ldisc.c:324
 #3: ffff8880b9d4d660 (lock#2){-.-.}-{2:2}, at: __alloc_pages_bulk+0x4ad/0x1870 mm/page_alloc.c:5290

stack backtrace:
CPU: 1 PID: 8441 Comm: syz-fuzzer Not tainted 5.13.0-next-20210706-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:105
 check_noncircular+0x25f/0x2e0 kernel/locking/lockdep.c:2131
 check_prev_add kernel/locking/lockdep.c:3051 [inline]
 check_prevs_add kernel/locking/lockdep.c:3174 [inline]
 validate_chain kernel/locking/lockdep.c:3789 [inline]
 __lock_acquire+0x2a07/0x54a0 kernel/locking/lockdep.c:5015
 lock_acquire kernel/locking/lockdep.c:5625 [inline]
 lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5590
 __fs_reclaim_acquire mm/page_alloc.c:4563 [inline]
 fs_reclaim_acquire+0x117/0x160 mm/page_alloc.c:4577
 prepare_alloc_pages+0x15c/0x580 mm/page_alloc.c:5175
 __alloc_pages+0x12f/0x500 mm/page_alloc.c:5374
 alloc_pages+0x18c/0x2a0 mm/mempolicy.c:2244
 stack_depot_save+0x39d/0x4e0 lib/stackdepot.c:303
 save_stack+0x15e/0x1e0 mm/page_owner.c:120
 __set_page_owner+0x50/0x290 mm/page_owner.c:181
 prep_new_page mm/page_alloc.c:2444 [inline]
 __alloc_pages_bulk+0x8b9/0x1870 mm/page_alloc.c:5312
 alloc_pages_bulk_array_node include/linux/gfp.h:557 [inline]
 vm_area_alloc_pages mm/vmalloc.c:2793 [inline]
 __vmalloc_area_node mm/vmalloc.c:2863 [inline]
 __vmalloc_node_range+0x39d/0x960 mm/vmalloc.c:2966
 __vmalloc_node mm/vmalloc.c:3015 [inline]
 vzalloc+0x67/0x80 mm/vmalloc.c:3085
 n_tty_open+0x16/0x170 drivers/tty/n_tty.c:1848
 tty_ldisc_open+0x9b/0x110 drivers/tty/tty_ldisc.c:449
 tty_ldisc_setup+0x43/0x100 drivers/tty/tty_ldisc.c:766
 tty_init_dev.part.0+0x1f4/0x610 drivers/tty/tty_io.c:1453
 tty_init_dev include/linux/err.h:36 [inline]
 tty_open_by_driver drivers/tty/tty_io.c:2098 [inline]
 tty_open+0xb16/0x1000 drivers/tty/tty_io.c:2146
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4c8/0x11d0 fs/open.c:826
 do_open fs/namei.c:3374 [inline]
 path_openat+0x1c23/0x27f0 fs/namei.c:3507
 do_filp_open+0x1aa/0x400 fs/namei.c:3534
 do_sys_openat2+0x16d/0x420 fs/open.c:1204
 do_sys_open fs/open.c:1220 [inline]
 __do_sys_openat fs/open.c:1236 [inline]
 __se_sys_openat fs/open.c:1231 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1231
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4af20a
Code: e8 3b 82 fb ff 48 8b 7c 24 10 48 8b 74 24 18 48 8b 54 24 20 4c 8b 54 24 28 4c 8b 44 24 30 4c 8b 4c 24 38 48 8b 44 24 08 0f 05 <48> 3d 01 f0 ff ff 76 20 48 c7 44 24 40 ff ff ff ff 48 c7 44 24 48
RSP: 002b:000000c00036f3f8 EFLAGS: 00000216 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 000000c00001c000 RCX: 00000000004af20a
RDX: 0000000000000000 RSI: 000000c000167a70 RDI: ffffffffffffff9c
RBP: 000000c00036f470 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000216 R12: 00000000000001a8
R13: 00000000000001a7 R14: 0000000000000200 R15: 000000c0004a9180
BUG: sleeping function called from invalid context at mm/page_alloc.c:5178
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 8441, name: syz-fuzzer
INFO: lockdep is turned off.
irq event stamp: 100212
hardirqs last  enabled at (100211): [<ffffffff892c0320>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160 [inline]
hardirqs last  enabled at (100211): [<ffffffff892c0320>] _raw_spin_unlock_irqrestore+0x50/0x70 kernel/locking/spinlock.c:191
hardirqs last disabled at (100212): [<ffffffff81b277e7>] __alloc_pages_bulk+0x1017/0x1870 mm/page_alloc.c:5290
softirqs last  enabled at (96960): [<ffffffff8146389e>] invoke_softirq kernel/softirq.c:432 [inline]
softirqs last  enabled at (96960): [<ffffffff8146389e>] __irq_exit_rcu+0x16e/0x1c0 kernel/softirq.c:636
softirqs last disabled at (96847): [<ffffffff8146389e>] invoke_softirq kernel/softirq.c:432 [inline]
softirqs last disabled at (96847): [<ffffffff8146389e>] __irq_exit_rcu+0x16e/0x1c0 kernel/softirq.c:636
CPU: 1 PID: 8441 Comm: syz-fuzzer Not tainted 5.13.0-next-20210706-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:105
 ___might_sleep.cold+0x1f1/0x237 kernel/sched/core.c:9171
 prepare_alloc_pages+0x3da/0x580 mm/page_alloc.c:5178
 __alloc_pages+0x12f/0x500 mm/page_alloc.c:5374
 alloc_pages+0x18c/0x2a0 mm/mempolicy.c:2244
 stack_depot_save+0x39d/0x4e0 lib/stackdepot.c:303
 save_stack+0x15e/0x1e0 mm/page_owner.c:120
 __set_page_owner+0x50/0x290 mm/page_owner.c:181
 prep_new_page mm/page_alloc.c:2444 [inline]
 __alloc_pages_bulk+0x8b9/0x1870 mm/page_alloc.c:5312
 alloc_pages_bulk_array_node include/linux/gfp.h:557 [inline]
 vm_area_alloc_pages mm/vmalloc.c:2793 [inline]
 __vmalloc_area_node mm/vmalloc.c:2863 [inline]
 __vmalloc_node_range+0x39d/0x960 mm/vmalloc.c:2966
 __vmalloc_node mm/vmalloc.c:3015 [inline]
 vzalloc+0x67/0x80 mm/vmalloc.c:3085
 n_tty_open+0x16/0x170 drivers/tty/n_tty.c:1848
 tty_ldisc_open+0x9b/0x110 drivers/tty/tty_ldisc.c:449
 tty_ldisc_setup+0x43/0x100 drivers/tty/tty_ldisc.c:766
 tty_init_dev.part.0+0x1f4/0x610 drivers/tty/tty_io.c:1453
 tty_init_dev include/linux/err.h:36 [inline]
 tty_open_by_driver drivers/tty/tty_io.c:2098 [inline]
 tty_open+0xb16/0x1000 drivers/tty/tty_io.c:2146
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4c8/0x11d0 fs/open.c:826
 do_open fs/namei.c:3374 [inline]
 path_openat+0x1c23/0x27f0 fs/namei.c:3507
 do_filp_open+0x1aa/0x400 fs/namei.c:3534
 do_sys_openat2+0x16d/0x420 fs/open.c:1204
 do_sys_open fs/open.c:1220 [inline]
 __do_sys_openat fs/open.c:1236 [inline]
 __se_sys_openat fs/open.c:1231 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1231
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4af20a
Code: e8 3b 82 fb ff 48 8b 7c 24 10 48 8b 74 24 18 48 8b 54 24 20 4c 8b 54 24 28 4c 8b 44 24 30 4c 8b 4c 24 38 48 8b 44 24 08 0f 05 <48> 3d 01 f0 ff ff 76 20 48 c7 44 24 40 ff ff ff ff 48 c7 44 24 48
RSP: 002b:000000c00036f3f8 EFLAGS: 00000216 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 000000c00001c000 RCX: 00000000004af20a
RDX: 0000000000000000 RSI: 000000c000167a70 RDI: ffffffffffffff9c
RBP: 000000c00036f470 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000216 R12: 00000000000001a8
R13: 00000000000001a7 R14: 0000000000000200 R15: 000000c0004a9180
can: request_module (can-proto-0) failed.
can: request_module (can-proto-0) failed.
can: request_module (can-proto-0) failed.
base_sock_release(ffff8880223a5a00) sk=ffff888022d04000


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
