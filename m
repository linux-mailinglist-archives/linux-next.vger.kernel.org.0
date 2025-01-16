Return-Path: <linux-next+bounces-5232-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02969A1388F
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 12:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C088F1886962
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 11:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746961DD525;
	Thu, 16 Jan 2025 11:08:22 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B101DC185
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2025 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025702; cv=none; b=W8LsxHPcRStjyjN6wvZ08zYIzxuzlhKlN36M+XQPGSRlwO7Ost6sjfQzqc9eC1rd1u9Q5H8mKCf75eEG9UV8dLZTGXenASGxm2U0afCgNPXakpbuhZcAGtmZcVz4Wy/sRNm5LnclpS7VsjyLYY59dwOJGR5ME5hCXF0cRFKc4pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025702; c=relaxed/simple;
	bh=/9hgJww7AhrVrhBKlJuY1075YAgVTF86TCUOm4JTt40=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=khHxt6uwCjALNasq+S7FAGCg7ya52CB8SsvHByoJFqIfB2EKrV4QLA0zHMJPuvZI+CxAJ4S2z8hNKlXSmLi5/5WEQZLaDTE7eRHIJIL+pmG52+Ehm9kKAFplo0swf0Za+SVyBn4KX1Uva/49B/Yxo6BkTDs7699zYLKlZKdjXzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ce7b6225aeso13053485ab.0
        for <linux-next@vger.kernel.org>; Thu, 16 Jan 2025 03:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737025700; x=1737630500;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0l3ZSo15kI+xjf7oDFKhX4HTlvkgY9xcJ0zfjSKT+A=;
        b=VfLhoKuff1fxx2bCcexsY+WMxPT/gMUotJ5j5VXv3ZwpGP4QjS8MyLZb4G+wOSXcPM
         k4zJdi3XTQ9MJKElMyt/qfhICgtl2z/ITULl8st2bYdTfIe4FL1wucMU4hhWLTUnwrgR
         s6aJkQ8+cam77XjV0NaZmcSb+q3JGctfVgm/YrfYI7nGsjOTVNSTXFN6GYKqMTfw+b00
         a8qyTTjrveGOBOjNtGK6hzAayVCQ0Go4ka66xkUi0WIXZiHK9lZ4ecyR5UGfQCWx0+l1
         6JwlZzeY2pp4ONT0kNRsEUn8IwfR/3XhkqWDUpKet+sLHV0RqPgfkMhyKIWQAUExVJDW
         IVIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWTAXfua+lmSr/4Kxran/4uqQwGaqSfGsBhjkK74q+3mObkIgpesqjmJYidnBarkfVpQcZOsw9NEx2@vger.kernel.org
X-Gm-Message-State: AOJu0YyMfvVZ953kGD8ByBVuLrw3aYt6ehht98iviD6ktRMNm4aq5g6y
	dPvNgiA+SRV+o2l5uXv1CBAgIDOK7lKxIufOhqyPx3xhbaGO/y4xSvED2sqL15Kqdb/jJddDQDA
	QtFKRJ/BFaFSDku2Hq3SEGMGh8AgeZhuMWL8uiCtJGvVn2NSp3J37R4I=
X-Google-Smtp-Source: AGHT+IFzUfH/cQBIE3OgLAqJUXQQNacRTKHFaqUDUFHHUeLDQSjWi9v5YlBxIZT7MK20QOONp/k3tR5HqnOTrnttPHG/DR+3ZBwG
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca49:0:b0:3ce:87a0:f8a4 with SMTP id
 e9e14a558f8ab-3ce87a1033emr54039565ab.9.1737025699812; Thu, 16 Jan 2025
 03:08:19 -0800 (PST)
Date: Thu, 16 Jan 2025 03:08:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6788e8a3.050a0220.20d369.0031.GAE@google.com>
Subject: [syzbot] [kernel?] linux-next test error: KASAN: slab-use-after-free
 Write in binder_add_device
From: syzbot <syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com>
To: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, maco@android.com, 
	sfr@canb.auug.org.au, surenb@google.com, syzkaller-bugs@googlegroups.com, 
	tkjos@android.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b323d8e7bc03 Add linux-next specific files for 20250116
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=139dc9df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76ebc49148908d34
dashboard link: https://syzkaller.appspot.com/bug?extid=7015dcf45953112c8b45
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a529f1184b45/disk-b323d8e7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/08db885c938e/vmlinux-b323d8e7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2ff92778e2b7/bzImage-b323d8e7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in hlist_add_head include/linux/list.h:1026 [inline]
BUG: KASAN: slab-use-after-free in binder_add_device+0x5f/0xa0 drivers/android/binder.c:6932
Write of size 8 at addr ffff888141fb9408 by task syz-executor/6310

CPU: 0 UID: 0 PID: 6310 Comm: syz-executor Not tainted 6.13.0-rc7-next-20250116-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 hlist_add_head include/linux/list.h:1026 [inline]
 binder_add_device+0x5f/0xa0 drivers/android/binder.c:6932
 binderfs_binder_device_create+0x7bf/0x9c0 drivers/android/binderfs.c:210
 binderfs_fill_super+0x944/0xd90 drivers/android/binderfs.c:729
 vfs_get_super fs/super.c:1280 [inline]
 get_tree_nodev+0xb7/0x140 fs/super.c:1299
 vfs_get_tree+0x90/0x2b0 fs/super.c:1814
 do_new_mount+0x2be/0xb40 fs/namespace.c:3560
 do_mount fs/namespace.c:3900 [inline]
 __do_sys_mount fs/namespace.c:4111 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:4088
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f909d3874ca
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe0c3c1d18 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f909d401ecb RCX: 00007f909d3874ca
RDX: 00007f909d40ec27 RSI: 00007f909d401ecb RDI: 00007f909d40ec27
RBP: 00007f909d4020c3 R08: 0000000000000000 R09: 00000000000001ff
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f909d3e41c8
R13: 00007f909d3e41a8 R14: 0000000000000009 R15: 0000000000000000
 </TASK>

Allocated by task 5832:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x243/0x390 mm/slub.c:4325
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 binderfs_binder_device_create+0x16c/0x9c0 drivers/android/binderfs.c:147
 binderfs_fill_super+0x944/0xd90 drivers/android/binderfs.c:729
 vfs_get_super fs/super.c:1280 [inline]
 get_tree_nodev+0xb7/0x140 fs/super.c:1299
 vfs_get_tree+0x90/0x2b0 fs/super.c:1814
 do_new_mount+0x2be/0xb40 fs/namespace.c:3560
 do_mount fs/namespace.c:3900 [inline]
 __do_sys_mount fs/namespace.c:4111 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:4088
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5832:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x196/0x430 mm/slub.c:4757
 evict+0x4e8/0x9a0 fs/inode.c:796
 __dentry_kill+0x20d/0x630 fs/dcache.c:625
 shrink_kill+0xa9/0x2c0 fs/dcache.c:1070
 shrink_dentry_list+0x2c0/0x5b0 fs/dcache.c:1097
 shrink_dcache_parent+0xcb/0x3b0
 do_one_tree+0x23/0xe0 fs/dcache.c:1560
 shrink_dcache_for_umount+0xb4/0x180 fs/dcache.c:1577
 generic_shutdown_super+0x6a/0x2d0 fs/super.c:620
 kill_anon_super fs/super.c:1237 [inline]
 kill_litter_super+0x76/0xb0 fs/super.c:1247
 binderfs_kill_super+0x44/0x90 drivers/android/binderfs.c:791
 deactivate_locked_super+0xc4/0x130 fs/super.c:473
 cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1413
 task_work_run+0x24f/0x310 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xa2a/0x28e0 kernel/exit.c:938
 do_group_exit+0x207/0x2c0 kernel/exit.c:1087
 get_signal+0x16b2/0x1750 kernel/signal.c:3036
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xce/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888141fb9400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 8 bytes inside of
 freed 512-byte region [ffff888141fb9400, ffff888141fb9600)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888141fba800 pfn:0x141fb8
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x57ff00000000240(workingset|head|node=1|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 057ff00000000240 ffff88801ac41c80 ffffea0005337a10 ffffea0005345c10
raw: ffff888141fba800 000000000010000f 00000000f5000000 0000000000000000
head: 057ff00000000240 ffff88801ac41c80 ffffea0005337a10 ffffea0005345c10
head: ffff888141fba800 000000000010000f 00000000f5000000 0000000000000000
head: 057ff00000000002 ffffea000507ee01 ffffffffffffffff 0000000000000000
head: 0000000000000004 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 6801495950, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x292/0x710 mm/page_alloc.c:4739
 alloc_pages_mpol+0x311/0x660 mm/mempolicy.c:2270
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab+0x8f/0x3a0 mm/slub.c:2587
 new_slab mm/slub.c:2640 [inline]
 ___slab_alloc+0xc27/0x14a0 mm/slub.c:3826
 __slab_alloc+0x58/0xa0 mm/slub.c:3916
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 __kmalloc_cache_noprof+0x27b/0x390 mm/slub.c:4320
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 device_private_init drivers/base/core.c:3510 [inline]
 device_add+0xc1/0xbf0 drivers/base/core.c:3561
 device_create_groups_vargs drivers/base/core.c:4347 [inline]
 device_create+0x257/0x2e0 drivers/base/core.c:4386
 bdi_register_va+0x8b/0x760 mm/backing-dev.c:1094
 bdi_register+0xd5/0x120 mm/backing-dev.c:1126
 add_disk_fwnode+0x759/0xfc0 block/genhd.c:510
 add_disk include/linux/blkdev.h:759 [inline]
 brd_alloc+0x547/0x790 drivers/block/brd.c:401
 brd_init+0x126/0x1b0 drivers/block/brd.c:481
 do_one_initcall+0x248/0x870 init/main.c:1257
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888141fb9300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888141fb9380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888141fb9400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff888141fb9480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888141fb9500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

