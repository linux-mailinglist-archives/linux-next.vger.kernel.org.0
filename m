Return-Path: <linux-next+bounces-6823-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6778ABA594
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 23:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 463B44E6A03
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 21:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB54D280A2B;
	Fri, 16 May 2025 21:54:30 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9E21E097
	for <linux-next@vger.kernel.org>; Fri, 16 May 2025 21:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747432470; cv=none; b=BKjXfLyS/k5SqVKBk8VbUgi+YAiS+MkaF5WuWSsLtyGohwDrUmbkOcR+Kanc/fpLtXgFGz6f+lPAEaLtLwvpDQuKULxuqeu6L00eqLc1It80TVWgAQ76+9Q1gomaMD+puDEKBIUQaSGxEPxc55wZk5aO7MKftvcz2OgzSAd/X2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747432470; c=relaxed/simple;
	bh=P5Ni+dBilLCyQrZ92BwrRT7Cv369EfiFco3E1zSSTJA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IDHL6x5KazVBhYeLUWe2mgv2+YYLA92d4Z067CJ3maROdWIWYjORqXltthMEj7Ly37EeOD6MTRI33wFLUGad74SiI/ikAvDuyIVZhPzLalAopzEZkUCM1tK35zjyDRz/tNURADZJ3p5o80AKjdDF/UuENS5zq6HE4h14mO4oZ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85b402f69d4so273969639f.3
        for <linux-next@vger.kernel.org>; Fri, 16 May 2025 14:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747432468; x=1748037268;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZdCjcOJH5JOQHpEwM8QMYotYTAt8Wij2onCcoSJiFPU=;
        b=CbQhDHfyPtSYCGrqPQUMAoLIKZR4zKT6/drIfwaEI4IOv7uVza0giQ3vv5tcnszd5M
         XJNO4j5dOgw3wTAWbspnjbD6TRauhY/Bc/+G4GlNJxU/7B3d0FtqGN1Lcdy8BN6Suzow
         y+VoUzLpJoBKLz8SsFdeMbRnor8KEELMiKvpZWX92cxwPrdxwY0uPMybYnVIwRrDf633
         lMjISThChjr3pvHz/W1cB9LDbRIL6K9e8l9RzCJlyeNr6p8woMXX+Wx9XGmoOMgKwDxb
         9qUalSAU4aA/cR49j4HPiK1e6Quz6jY5HDZ/36HWWrRgsQs+ERBjEhphyzNqD6hIT6Pu
         t4YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSjoOtapqhYHAhia1/SAH/eGcs+6Q4rBEsRCGQ/sP3OLedLbmX+80pUebZ+J0TEOt0IVzNBBf5edqr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/D/W9swmfNHgKwdmctb16eDttA2zgoJTcTiBEVGfyQT+ZcmD6
	vcTavIZL6Wua4r/fPPTY9LcSOwtUhmBoqzl6OEyqwZSOgL8fQeeEuDy/BnkgGpEs7EtItfLdq5M
	vRuxqCXMZWMspJKKMdMM1lttjFvORyi9LDU6k8ENa/GW9gJSP7EX61TdI1xk=
X-Google-Smtp-Source: AGHT+IFP5LJQzwBWmhtO8LqzDpdx/ubYFVPeH0FzqCeixHyZv0GI5qosuXrmGzFFOWzMVSMLCUYvQUYFb+w5yJ58/NOuubJS5g+n
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:388b:b0:85b:b82f:965b with SMTP id
 ca18e2360f4ac-86a24cd615cmr539834839f.12.1747432468128; Fri, 16 May 2025
 14:54:28 -0700 (PDT)
Date: Fri, 16 May 2025 14:54:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6827b414.a70a0220.38f255.0008.GAE@google.com>
Subject: [syzbot] [kernel?] linux-next test error: KASAN: slab-use-after-free
 Write in binderfs_evict_inode
From: syzbot <syzbot+c3763f82ee2ceaf93340@syzkaller.appspotmail.com>
To: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, joelagnelf@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, maco@android.com, 
	sfr@canb.auug.org.au, surenb@google.com, syzkaller-bugs@googlegroups.com, 
	tkjos@android.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8566fc3b9653 Add linux-next specific files for 20250516
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10b776f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa3444b6d01e5afb
dashboard link: https://syzkaller.appspot.com/bug?extid=c3763f82ee2ceaf93340
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ac394ca3c315/disk-8566fc3b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/170dd88bde87/vmlinux-8566fc3b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c097fa83c7d7/bzImage-8566fc3b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c3763f82ee2ceaf93340@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __hlist_del include/linux/list.h:982 [inline]
BUG: KASAN: slab-use-after-free in hlist_del_init include/linux/list.h:1008 [inline]
BUG: KASAN: slab-use-after-free in binderfs_evict_inode+0x1ac/0x280 drivers/android/binderfs.c:277
Write of size 8 at addr ffff88814d3a8008 by task syz-executor/6351

CPU: 1 UID: 0 PID: 6351 Comm: syz-executor Not tainted 6.15.0-rc6-next-20250516-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0xfc/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xb4/0x290 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 __hlist_del include/linux/list.h:982 [inline]
 hlist_del_init include/linux/list.h:1008 [inline]
 binderfs_evict_inode+0x1ac/0x280 drivers/android/binderfs.c:277
 evict+0x446/0x850 fs/inode.c:810
 __dentry_kill+0x194/0x510 fs/dcache.c:660
 shrink_kill+0x6c/0x1b0 fs/dcache.c:1105
 shrink_dentry_list+0x241/0x4c0 fs/dcache.c:1132
 shrink_dcache_parent+0xa1/0x220 fs/dcache.c:-1
 do_one_tree+0x1b/0xd0 fs/dcache.c:1595
 shrink_dcache_for_umount+0x77/0x120 fs/dcache.c:1612
 generic_shutdown_super+0x61/0x260 fs/super.c:621
 kill_anon_super fs/super.c:1280 [inline]
 kill_litter_super+0x62/0xa0 fs/super.c:1290
 binderfs_kill_super+0x40/0x80 drivers/android/binderfs.c:792
 deactivate_locked_super+0x9a/0x100 fs/super.c:474
 cleanup_mnt+0x1de/0x3d0 fs/namespace.c:1417
 task_work_run+0x14d/0x1f0 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x5ae/0x1cf0 kernel/exit.c:955
 do_group_exit+0x1b1/0x280 kernel/exit.c:1104
 get_signal+0xe09/0xea0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x95/0x5b0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2b8/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f833eb8d33d
Code: Unable to access opcode bytes at 0x7f833eb8d313.
RSP: 002b:00007ffecdff5b68 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: fffffffffffffe00 RBX: 0000000000000003 RCX: 00007f833eb8d33d
RDX: 0000000000000030 RSI: 00007ffecdff5c00 RDI: 00000000000000f9
RBP: 00007ffecdff5bac R08: 00007ffecdff549c R09: 0079746972756365
R10: 00007ffecdff5500 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000000927c0 R14: 00000000000101ae R15: 00007ffecdff5c00
 </TASK>

Allocated by task 6352:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4358
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 binderfs_binder_device_create+0x1b9/0xae0 drivers/android/binderfs.c:147
 binderfs_fill_super+0x924/0xd00 drivers/android/binderfs.c:730
 vfs_get_super fs/super.c:1323 [inline]
 get_tree_nodev+0xa7/0x120 fs/super.c:1342
 vfs_get_tree+0x84/0x260 fs/super.c:1802
 do_new_mount+0x1c7/0x850 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x222/0x2b0 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6352:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x193/0x440 mm/slub.c:4841
 evict+0x446/0x850 fs/inode.c:810
 __dentry_kill+0x194/0x510 fs/dcache.c:660
 shrink_kill+0x6c/0x1b0 fs/dcache.c:1105
 shrink_dentry_list+0x241/0x4c0 fs/dcache.c:1132
 shrink_dcache_parent+0xa1/0x220 fs/dcache.c:-1
 do_one_tree+0x1b/0xd0 fs/dcache.c:1595
 shrink_dcache_for_umount+0x77/0x120 fs/dcache.c:1612
 generic_shutdown_super+0x61/0x260 fs/super.c:621
 kill_anon_super fs/super.c:1280 [inline]
 kill_litter_super+0x62/0xa0 fs/super.c:1290
 binderfs_kill_super+0x40/0x80 drivers/android/binderfs.c:792
 deactivate_locked_super+0x9a/0x100 fs/super.c:474
 cleanup_mnt+0x1de/0x3d0 fs/namespace.c:1417
 task_work_run+0x14d/0x1f0 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x5ae/0x1cf0 kernel/exit.c:955
 do_group_exit+0x1b1/0x280 kernel/exit.c:1104
 get_signal+0xe09/0xea0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x95/0x5b0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2b8/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88814d3a8000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 8 bytes inside of
 freed 512-byte region [ffff88814d3a8000, ffff88814d3a8200)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x14d3a8
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x57ff00000000040(head|node=1|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 057ff00000000040 ffff888018441c80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 057ff00000000040 ffff888018441c80 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 057ff00000000002 ffffea000534ea01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 13748235608, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1d8/0x230 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
 alloc_pages_mpol+0x150/0x360 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_node_track_caller_noprof+0x2f8/0x4e0 mm/slub.c:4346
 __do_krealloc mm/slub.c:4904 [inline]
 krealloc_noprof+0x122/0x330 mm/slub.c:4957
 add_sysfs_param+0xc4/0xac0 kernel/params.c:654
 kernel_add_sysfs_param+0x7f/0xe0 kernel/params.c:811
 param_sysfs_builtin+0x18a/0x230 kernel/params.c:850
 param_sysfs_builtin_init+0x23/0x30 kernel/params.c:986
 do_one_initcall+0x1ad/0x5b0 init/main.c:1273
 do_initcall_level+0x104/0x190 init/main.c:1335
 do_initcalls+0x59/0xa0 init/main.c:1351
 kernel_init_freeable+0x334/0x4a0 init/main.c:1583
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88814d3a7f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88814d3a7f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88814d3a8000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff88814d3a8080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88814d3a8100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

