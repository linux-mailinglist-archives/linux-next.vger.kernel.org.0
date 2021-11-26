Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8670045E7F3
	for <lists+linux-next@lfdr.de>; Fri, 26 Nov 2021 07:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358900AbhKZGnc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Nov 2021 01:43:32 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:43667 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358904AbhKZGlc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Nov 2021 01:41:32 -0500
Received: by mail-il1-f199.google.com with SMTP id j1-20020a056e02154100b002a181a1ce89so3421957ilu.10
        for <linux-next@vger.kernel.org>; Thu, 25 Nov 2021 22:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=VExpyIgqdaCzryc4TFabc+PLnHrJh8zh2aH26egvCug=;
        b=slVur1ykLcWQtFnkOTGkFFXR+1KaMmUBbiU3z1iy/KbI5OYS9JPmpX6WgeWl9L0wJF
         L0wcTDYykHZAHm1AJTQniNK6ptsm1igf07lCpLMongUIiR3GYSNvTye6YUKa5HqboRlM
         Uv4gzy+uZf4EyD9owmLUzgH4titF9MNGvwx1bRdaxfGjYM+U2I/P1zkbFE/B++wCn1vT
         +bDk3ngeaaZ4h12WR8JsmoB69f7pdCVJ9gwEzKG+FGyhEMCYbH+EvNjpLMVSlaSXrtsF
         6AXhitSK4UT3lwi77pMh47D6szBkapScDgjAA8UU4rNTmLpsfplgoo8wIUrPQD8KU9KI
         kwvQ==
X-Gm-Message-State: AOAM5318qZeXH0pzBYEZXUPmAHKl8N4Dq1qAc6jOzEtqsUVg9LLV0FXJ
        /RDtJIx4V3MFWZZ9oaq9YWW/UPZ7bh1weo+0i/XrkBeLtK6C
X-Google-Smtp-Source: ABdhPJyHKSJ1zXIJHFqLtCPfQH3QqpmPXMrEwCcAhDNdbmV5oAcai/gU2Q9RWXO+ujdiwn21QUiJXK+i3b/ueMXtgo6ahJd77E9U
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c46:: with SMTP id d6mr1970203ilg.140.1637908699751;
 Thu, 25 Nov 2021 22:38:19 -0800 (PST)
Date:   Thu, 25 Nov 2021 22:38:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000392b1305d1ab56ab@google.com>
Subject: [syzbot] linux-next test error: WARNING: held lock freed in kernfs_destroy_root
From:   syzbot <syzbot+9e5d9f74a10f9590610b@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    f30a24ed97b4 Add linux-next specific files for 20211126
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16802fa1b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=be9183de0824e4d7
dashboard link: https://syzkaller.appspot.com/bug?extid=9e5d9f74a10f9590610b
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9e5d9f74a10f9590610b@syzkaller.appspotmail.com

cgroup: Unknown subsys name 'net'
=========================
WARNING: held lock freed!
5.16.0-rc2-next-20211126-syzkaller #0 Not tainted
-------------------------
syz-executor/6532 is freeing memory ffff88807f06e400-ffff88807f06e5ff, with a lock still held there!
ffff88807f06e548 (&root->kernfs_rwsem){++++}-{3:3}, at: kernfs_remove fs/kernfs/dir.c:1396 [inline]
ffff88807f06e548 (&root->kernfs_rwsem){++++}-{3:3}, at: kernfs_destroy_root+0x81/0xb0 fs/kernfs/dir.c:964
2 locks held by syz-executor/6532:
 #0: ffffffff8bbc5d48 (cgroup_mutex){+.+.}-{3:3}, at: cgroup_lock_and_drain_offline+0xa5/0x900 kernel/cgroup/cgroup.c:2998
 #1: ffff88807f06e548 (&root->kernfs_rwsem){++++}-{3:3}, at: kernfs_remove fs/kernfs/dir.c:1396 [inline]
 #1: ffff88807f06e548 (&root->kernfs_rwsem){++++}-{3:3}, at: kernfs_destroy_root+0x81/0xb0 fs/kernfs/dir.c:964

stack backtrace:
CPU: 0 PID: 6532 Comm: syz-executor Not tainted 5.16.0-rc2-next-20211126-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_freed_lock_bug kernel/locking/lockdep.c:6388 [inline]
 debug_check_no_locks_freed.cold+0x9d/0xa9 kernel/locking/lockdep.c:6421
 slab_free_hook mm/slub.c:1695 [inline]
 slab_free_freelist_hook+0x73/0x1c0 mm/slub.c:1749
 slab_free mm/slub.c:3513 [inline]
 kfree+0xe0/0x430 mm/slub.c:4561
 kernfs_put.part.0+0x331/0x540 fs/kernfs/dir.c:548
 kernfs_put+0x42/0x50 fs/kernfs/dir.c:513
 __kernfs_remove+0x7a3/0xb20 fs/kernfs/dir.c:1382
 kernfs_remove fs/kernfs/dir.c:1397 [inline]
 kernfs_destroy_root+0x89/0xb0 fs/kernfs/dir.c:964
 cgroup_setup_root+0x3a6/0xad0 kernel/cgroup/cgroup.c:2077
 cgroup1_root_to_use kernel/cgroup/cgroup-v1.c:1194 [inline]
 cgroup1_get_tree+0xd33/0x1390 kernel/cgroup/cgroup-v1.c:1211
 vfs_get_tree+0x89/0x2f0 fs/super.c:1500
 do_new_mount fs/namespace.c:2988 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3318
 do_mount fs/namespace.c:3331 [inline]
 __do_sys_mount fs/namespace.c:3539 [inline]
 __se_sys_mount fs/namespace.c:3516 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3516
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f517c6f401a
Code: 48 c7 c2 bc ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe8ba71698 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffe8ba71828 RCX: 00007f517c6f401a
RDX: 00007f517c756fd6 RSI: 00007f517c74d29a RDI: 00007f517c74bd71
RBP: 00007f517c74d29a R08: 00007f517c74d3f7 R09: 0000000000000026
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe8ba716a0
R13: 00007ffe8ba71848 R14: 00007ffe8ba71770 R15: 00007f517c74d3f1
 </TASK>
==================================================================
BUG: KASAN: use-after-free in __up_write kernel/locking/rwsem.c:1318 [inline]
BUG: KASAN: use-after-free in up_write+0x3ac/0x470 kernel/locking/rwsem.c:1576
Read of size 8 at addr ffff88807f06e540 by task syz-executor/6532

CPU: 1 PID: 6532 Comm: syz-executor Not tainted 5.16.0-rc2-next-20211126-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xa5/0x3ed mm/kasan/report.c:247
 __kasan_report mm/kasan/report.c:433 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:450
 __up_write kernel/locking/rwsem.c:1318 [inline]
 up_write+0x3ac/0x470 kernel/locking/rwsem.c:1576
 cgroup_setup_root+0x3a6/0xad0 kernel/cgroup/cgroup.c:2077
 cgroup1_root_to_use kernel/cgroup/cgroup-v1.c:1194 [inline]
 cgroup1_get_tree+0xd33/0x1390 kernel/cgroup/cgroup-v1.c:1211
 vfs_get_tree+0x89/0x2f0 fs/super.c:1500
 do_new_mount fs/namespace.c:2988 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3318
 do_mount fs/namespace.c:3331 [inline]
 __do_sys_mount fs/namespace.c:3539 [inline]
 __se_sys_mount fs/namespace.c:3516 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3516
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f517c6f401a
Code: 48 c7 c2 bc ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe8ba71698 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffe8ba71828 RCX: 00007f517c6f401a
RDX: 00007f517c756fd6 RSI: 00007f517c74d29a RDI: 00007f517c74bd71
RBP: 00007f517c74d29a R08: 00007f517c74d3f7 R09: 0000000000000026
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe8ba716a0
R13: 00007ffe8ba71848 R14: 00007ffe8ba71770 R15: 00007f517c74d3f1
 </TASK>

Allocated by task 6532:
 kasan_save_stack+0x1e/0x50 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:434 [inline]
 ____kasan_kmalloc mm/kasan/common.c:513 [inline]
 ____kasan_kmalloc mm/kasan/common.c:472 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:522
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:724 [inline]
 kernfs_create_root+0x4c/0x410 fs/kernfs/dir.c:913
 cgroup_setup_root+0x243/0xad0 kernel/cgroup/cgroup.c:2018
 cgroup1_root_to_use kernel/cgroup/cgroup-v1.c:1194 [inline]
 cgroup1_get_tree+0xd33/0x1390 kernel/cgroup/cgroup-v1.c:1211
 vfs_get_tree+0x89/0x2f0 fs/super.c:1500
 do_new_mount fs/namespace.c:2988 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3318
 do_mount fs/namespace.c:3331 [inline]
 __do_sys_mount fs/namespace.c:3539 [inline]
 __se_sys_mount fs/namespace.c:3516 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3516
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Freed by task 6532:
 kasan_save_stack+0x1e/0x50 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:46
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:366 [inline]
 ____kasan_slab_free mm/kasan/common.c:328 [inline]
 __kasan_slab_free+0x103/0x170 mm/kasan/common.c:374
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:1723 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1749
 slab_free mm/slub.c:3513 [inline]
 kfree+0xe0/0x430 mm/slub.c:4561
 kernfs_put.part.0+0x331/0x540 fs/kernfs/dir.c:548
 kernfs_put+0x42/0x50 fs/kernfs/dir.c:513
 __kernfs_remove+0x7a3/0xb20 fs/kernfs/dir.c:1382
 kernfs_remove fs/kernfs/dir.c:1397 [inline]
 kernfs_destroy_root+0x89/0xb0 fs/kernfs/dir.c:964
 cgroup_setup_root+0x3a6/0xad0 kernel/cgroup/cgroup.c:2077
 cgroup1_root_to_use kernel/cgroup/cgroup-v1.c:1194 [inline]
 cgroup1_get_tree+0xd33/0x1390 kernel/cgroup/cgroup-v1.c:1211
 vfs_get_tree+0x89/0x2f0 fs/super.c:1500
 do_new_mount fs/namespace.c:2988 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3318
 do_mount fs/namespace.c:3331 [inline]
 __do_sys_mount fs/namespace.c:3539 [inline]
 __se_sys_mount fs/namespace.c:3516 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3516
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

The buggy address belongs to the object at ffff88807f06e400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 320 bytes inside of
 512-byte region [ffff88807f06e400, ffff88807f06e600)
The buggy address belongs to the page:
page:ffffea0001fc1b00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7f06c
head:ffffea0001fc1b00 order:2 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 ffffea00008d1b00 dead000000000002 ffff888010c41c80
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5789, ts 47991282663, free_ts 38208673784
 prep_new_page mm/page_alloc.c:2433 [inline]
 get_page_from_freelist+0xa72/0x2f40 mm/page_alloc.c:4164
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5376
 alloc_pages+0x1a7/0x300 mm/mempolicy.c:2192
 alloc_slab_page mm/slub.c:1793 [inline]
 allocate_slab mm/slub.c:1930 [inline]
 new_slab+0x261/0x460 mm/slub.c:1993
 ___slab_alloc+0x798/0xf30 mm/slub.c:3022
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3109
 slab_alloc_node mm/slub.c:3200 [inline]
 slab_alloc mm/slub.c:3242 [inline]
 __kmalloc+0x2fb/0x340 mm/slub.c:4419
 kmalloc include/linux/slab.h:595 [inline]
 load_elf_phdrs+0x103/0x210 fs/binfmt_elf.c:479
 load_elf_binary+0x18f4/0x4da0 fs/binfmt_elf.c:959
 search_binary_handler fs/exec.c:1724 [inline]
 exec_binprm fs/exec.c:1765 [inline]
 bprm_execve fs/exec.c:1834 [inline]
 bprm_execve+0x7ef/0x19b0 fs/exec.c:1796
 do_execveat_common+0x5e3/0x780 fs/exec.c:1923
 do_execve fs/exec.c:1991 [inline]
 __do_sys_execve fs/exec.c:2067 [inline]
 __se_sys_execve fs/exec.c:2062 [inline]
 __x64_sys_execve+0x8f/0xc0 fs/exec.c:2062
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1351 [inline]
 free_pcp_prepare+0x414/0xb60 mm/page_alloc.c:1403
 free_unref_page_prepare mm/page_alloc.c:3324 [inline]
 free_unref_page+0x19/0x690 mm/page_alloc.c:3403
 qlink_free mm/kasan/quarantine.c:146 [inline]
 qlist_free_all+0x5a/0xf0 mm/kasan/quarantine.c:165
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:272
 __kasan_slab_alloc+0xa2/0xc0 mm/kasan/common.c:444
 kasan_slab_alloc include/linux/kasan.h:259 [inline]
 slab_post_alloc_hook mm/slab.h:519 [inline]
 slab_alloc_node mm/slub.c:3234 [inline]
 slab_alloc mm/slub.c:3242 [inline]
 __kmalloc+0x1e7/0x340 mm/slub.c:4419
 kmalloc include/linux/slab.h:595 [inline]
 tomoyo_realpath_from_path+0xc3/0x620 security/tomoyo/realpath.c:254
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x21b/0x400 security/tomoyo/file.c:822
 security_inode_getattr+0xcf/0x140 security/security.c:1334
 vfs_getattr fs/stat.c:157 [inline]
 vfs_statx+0x164/0x390 fs/stat.c:225
 vfs_fstatat fs/stat.c:243 [inline]
 vfs_lstat include/linux/fs.h:3358 [inline]
 __do_sys_newlstat+0x91/0x110 fs/stat.c:398
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Memory state around the buggy address:
 ffff88807f06e400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807f06e480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88807f06e500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                           ^
 ffff88807f06e580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807f06e600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
