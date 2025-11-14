Return-Path: <linux-next+bounces-9016-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761FC5F070
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 20:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1851435351C
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 19:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E60F2EFD81;
	Fri, 14 Nov 2025 19:19:26 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED0B2DCF69
	for <linux-next@vger.kernel.org>; Fri, 14 Nov 2025 19:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147966; cv=none; b=mEdWRQm+8YwhbeSuIzXORe2bAuunUCAn06vGMPnOm/KlOZNNn9wMyLt8cSl7M67wZq6K0h6MNi8y+MBs/emne7A7LX8m6stPepwwgL+6y+u2BZvOzTIOPgau/FA5QtLXg4rLEwgxn6bqR09FhsrICRVKz5h4BbHsYl6rKTJlcWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147966; c=relaxed/simple;
	bh=OoRmaiKa36zA3YC77Us4pKXvwWyIWpxitV5L1AXVD4M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dtWFdkzs/5gMfbM1EGsxrC9+DUdDV3IFQR7DJOMNT/2IcY47QUPLzZjlrDFmsAu84m8EXsSeF5QALXZc34swCm3s80iYvaH5yEX8nlNZOlUhnjrz0x3ozICSnDid+ywgivzyeDyZd5I7i1AAhTqmnMNwGBVFrgIxiJl1V59HeTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-43329b607e0so26470855ab.2
        for <linux-next@vger.kernel.org>; Fri, 14 Nov 2025 11:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763147964; x=1763752764;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=12HZxk4Xy6K9Y7F0HDh4kKZZntS7w69hZTeDQmJyBtg=;
        b=Otxf5oRB3zEJ1M+hmVqPvbXzeC2pD2Mn0HSCXvo1AyW6p09ocSFPO9oiNEpejijj0X
         a9zyABJ4qjdX+9NGEfF6S2ObLkvSoRlJdVx4Ja95amPyuApDw2s4Bg1BoJ60p+cERMR5
         yma+/+eejTJlj6OkxSAEv5Kfl7gjRg7yyjO0V+XjM4qA7O0Wq9D531LF+ARJ24YYPTb4
         I6bDvyszeok6S/XTDvEQigOU9hdBitu8LgSj7F5j0Bi4iaCTDGb1CwGjwmGKvJ3st7y+
         Q7O2YtKI2aVO27qnTqAI+pDtRZUs2jc+0jF3g2VsdxYLKQ48DuuyJH8AaM7YxyzN8bGF
         WTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlcM3s5t6ioP3W+M5Za3tESy6G5QkSIiJ/XGC3pzgBcTAMdp54ZkA7t0RNqZHz59pc5MT4jsOotdvj@vger.kernel.org
X-Gm-Message-State: AOJu0YzjpXueZygRHqsxj6l8lylzdyem8VdGy7qJcH+0TqPksPODYeXG
	XAWjrb5LV/lCTygbMBJf8eHdPaZE6GfVXQR/H00BArkzN2ym3i3i0Fy7MBq6r/BFwjVJgGZYgk3
	GvCd3lp+4IkgJ92et1nI0+KVdh18FEqSXxJ/Nd77xq0eFvA+KF7Ad9kRSKUw=
X-Google-Smtp-Source: AGHT+IGWviQ/hE9cOJ2+LHpGGrQhY5lvn5bJF4j9iFr0Q/F2SCzrARCxuUIT9xMLeO3nsAAPMXZhKAj3+8+jk21gVsCIQQTyPcWc
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca86:0:b0:434:96ea:ff67 with SMTP id
 e9e14a558f8ab-43496eb013bmr10444895ab.40.1763147963687; Fri, 14 Nov 2025
 11:19:23 -0800 (PST)
Date: Fri, 14 Nov 2025 11:19:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <691780bb.050a0220.3565dc.0042.GAE@google.com>
Subject: [syzbot] [bluetooth?] linux-next test error: KASAN:
 slab-use-after-free Read in hci_cmd_work
From: syzbot <syzbot+25e9c406cbd26c66c417@syzkaller.appspotmail.com>
To: johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0f2995693867 Add linux-next specific files for 20251114
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12eb497c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=29b24388a21e66c8
dashboard link: https://syzkaller.appspot.com/bug?extid=25e9c406cbd26c66c417
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5c41eeba33d0/disk-0f299569.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f7188c6a90b9/vmlinux-0f299569.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3c2ae5e022bf/bzImage-0f299569.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+25e9c406cbd26c66c417@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in hci_cmd_work+0x5d0/0x7b0 net/bluetooth/hci_core.c:4174
Read of size 2 at addr ffff8880298b47b8 by task kworker/u9:0/52

CPU: 0 UID: 0 PID: 52 Comm: kworker/u9:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: hci0 hci_cmd_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 hci_cmd_work+0x5d0/0x7b0 net/bluetooth/hci_core.c:4174
 process_one_work+0x93a/0x15e0 kernel/workqueue.c:3261
 process_scheduled_works kernel/workqueue.c:3344 [inline]
 worker_thread+0x9b0/0xee0 kernel/workqueue.c:3425
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>

Allocated by task 5146:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 unpoison_slab_object mm/kasan/common.c:339 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:365
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4948 [inline]
 slab_alloc_node mm/slub.c:5258 [inline]
 kmem_cache_alloc_node_noprof+0x43c/0x710 mm/slub.c:5310
 __alloc_skb+0x112/0x2d0 net/core/skbuff.c:664
 alloc_skb include/linux/skbuff.h:1383 [inline]
 bt_skb_alloc include/net/bluetooth/bluetooth.h:510 [inline]
 hci_cmd_sync_alloc+0x3d/0x3b0 net/bluetooth/hci_sync.c:58
 hci_cmd_sync_add net/bluetooth/hci_sync.c:99 [inline]
 __hci_cmd_sync_sk+0x1a7/0xc70 net/bluetooth/hci_sync.c:168
 __hci_cmd_sync_status_sk net/bluetooth/hci_sync.c:263 [inline]
 __hci_cmd_sync_status net/bluetooth/hci_sync.c:287 [inline]
 hci_reset_sync+0x4a/0x140 net/bluetooth/hci_sync.c:3664
 hci_init1_sync net/bluetooth/hci_sync.c:3750 [inline]
 hci_init_sync net/bluetooth/hci_sync.c:4874 [inline]
 hci_dev_init_sync net/bluetooth/hci_sync.c:5066 [inline]
 hci_dev_open_sync+0xec5/0x2dc0 net/bluetooth/hci_sync.c:5144
 hci_dev_do_open net/bluetooth/hci_core.c:430 [inline]
 hci_power_on+0x1b4/0x720 net/bluetooth/hci_core.c:959
 process_one_work+0x93a/0x15e0 kernel/workqueue.c:3261
 process_scheduled_works kernel/workqueue.c:3344 [inline]
 worker_thread+0x9b0/0xee0 kernel/workqueue.c:3425
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Freed by task 6466:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free mm/slub.c:6663 [inline]
 kmem_cache_free+0x197/0x640 mm/slub.c:6774
 kfree_skb_reason include/linux/skbuff.h:1322 [inline]
 kfree_skb include/linux/skbuff.h:1331 [inline]
 vhci_read+0x49a/0x5b0 drivers/bluetooth/hci_vhci.c:593
 vfs_read+0x200/0xa30 fs/read_write.c:570
 ksys_read+0x145/0x250 fs/read_write.c:715
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880298b4780
 which belongs to the cache skbuff_head_cache of size 240
The buggy address is located 56 bytes inside of
 freed 240-byte region [ffff8880298b4780, ffff8880298b4870)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x298b4
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff888140a83a00 ffffea0000a62800 dead000000000004
raw: 0000000000000000 00000000000c000c 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5204, tgid 5204 (udevd), ts 26856381311, free_ts 26853873462
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x2365/0x2440 mm/page_alloc.c:3920
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5215
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2486
 alloc_slab_page mm/slub.c:3075 [inline]
 allocate_slab+0x86/0x3b0 mm/slub.c:3248
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xf56/0x1990 mm/slub.c:4651
 __slab_alloc+0x65/0x100 mm/slub.c:4774
 __slab_alloc_node mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:5246 [inline]
 kmem_cache_alloc_node_noprof+0x4ce/0x710 mm/slub.c:5310
 __alloc_skb+0x112/0x2d0 net/core/skbuff.c:664
 alloc_skb include/linux/skbuff.h:1383 [inline]
 alloc_skb_with_frags+0xca/0x890 net/core/skbuff.c:6694
 sock_alloc_send_pskb+0x84d/0x980 net/core/sock.c:2995
 unix_dgram_sendmsg+0x461/0x1850 net/unix/af_unix.c:2133
 sock_sendmsg_nosec net/socket.c:727 [inline]
 __sock_sendmsg+0x21c/0x270 net/socket.c:746
 sock_write_iter+0x279/0x360 net/socket.c:1199
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x5c9/0xb30 fs/read_write.c:686
 ksys_write+0x145/0x250 fs/read_write.c:738
page last free pid 5197 tgid 5197 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0xbc8/0xd30 mm/page_alloc.c:2948
 discard_slab mm/slub.c:3346 [inline]
 __put_partials+0x146/0x170 mm/slub.c:3886
 put_cpu_partial+0x1f2/0x2e0 mm/slub.c:3961
 __slab_free+0x288/0x2a0 mm/slub.c:5947
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:349
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4948 [inline]
 slab_alloc_node mm/slub.c:5258 [inline]
 kmem_cache_alloc_noprof+0x37d/0x700 mm/slub.c:5265
 getname_flags+0xb8/0x540 fs/namei.c:146
 getname include/linux/fs.h:2522 [inline]
 do_sys_openat2+0xbc/0x1c0 fs/open.c:1428
 do_sys_open fs/open.c:1449 [inline]
 __do_sys_openat fs/open.c:1465 [inline]
 __se_sys_openat fs/open.c:1460 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1460
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880298b4680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880298b4700: fb fb fb fb fb fb fc fc fc fc fc fc fc fc fc fc
>ffff8880298b4780: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff8880298b4800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc
 ffff8880298b4880: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
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

