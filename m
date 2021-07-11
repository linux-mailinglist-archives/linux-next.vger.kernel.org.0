Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D73B3C3B3B
	for <lists+linux-next@lfdr.de>; Sun, 11 Jul 2021 10:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhGKI5L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Jul 2021 04:57:11 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:42515 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhGKI5L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Jul 2021 04:57:11 -0400
Received: by mail-io1-f72.google.com with SMTP id v21-20020a5d90550000b0290439ea50822eso9537371ioq.9
        for <linux-next@vger.kernel.org>; Sun, 11 Jul 2021 01:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=HZ9eJXdff4hUgy6B3FUPxsf4D0BH4h3zoABzOZUQOoo=;
        b=qrcHJWwvBQfGrHD7e9C6NSpEiA7ujQk/fsRVIFuaUfEspP65a5DYBIydnZWk/Pjnck
         37HmIpwMvyVgJiLYtLr/yVMJqfuXAgxSygFlSICzspSmMnCJFC1U5eLaruGFWEcULCmG
         tMBtqr2EF6J6fwhsmpOqVeOohpKO8xkmAYGkZNTiZ+YxKcFK35HoSR8RKrM+eeOLxpdT
         W5HdNHcAW9TK5ubNoYGrRZCL/yAAVJdGitZ1mVPDraNtc+X47QnoQig5ERILu2ladYBw
         j8xDp4VxjHM5iOfq1K5PjcfMUXWmB/0+4bEVpUyA3d2Mdm0tMLx8D/Mx1uWAe27JPUML
         AjgA==
X-Gm-Message-State: AOAM5316KxKEufBFxm5kbWyaE2b7RJsQja9rW/BAlxPDqxq4x2NYYfAw
        fmasV6jzyhxnACDDGTkuouPlm1zXFj3odZKQPs8mmuHJmzS8
X-Google-Smtp-Source: ABdhPJxttJ5+IE4VKoJ5IrMWBfWhngFtpFkpLVl1ev6xX5+d3JwRro3/Yb6X9OTbPFJ/FipuA+wuiop8Bpcv2dEIrPassiL5TUhA
MIME-Version: 1.0
X-Received: by 2002:a92:700b:: with SMTP id l11mr32853114ilc.48.1625993663929;
 Sun, 11 Jul 2021 01:54:23 -0700 (PDT)
Date:   Sun, 11 Jul 2021 01:54:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bee44405c6d5269b@google.com>
Subject: [syzbot] linux-next test error: BUG: sleeping function called from
 invalid context in stack_depot_save
From:   syzbot <syzbot+70e88b8ebb12fa2bdedf@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    e2f74b13 Add linux-next specific files for 20210708
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15458794300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=59e1e3bbc3afca75
dashboard link: https://syzkaller.appspot.com/bug?extid=70e88b8ebb12fa2bdedf

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+70e88b8ebb12fa2bdedf@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at mm/page_alloc.c:5178
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 8439, name: syz-fuzzer
INFO: lockdep is turned off.
irq event stamp: 0
hardirqs last  enabled at (0): [<0000000000000000>] 0x0
hardirqs last disabled at (0): [<ffffffff8144098d>] copy_process+0x1dcd/0x74d0 kernel/fork.c:2112
softirqs last  enabled at (0): [<ffffffff814409ce>] copy_process+0x1e0e/0x74d0 kernel/fork.c:2116
softirqs last disabled at (0): [<0000000000000000>] 0x0
CPU: 0 PID: 8439 Comm: syz-fuzzer Tainted: G        W         5.13.0-next-20210708-syzkaller #0
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
 __vmalloc+0x69/0x80 mm/vmalloc.c:3029
 snd_dma_vmalloc_alloc+0x57/0xa0 sound/core/memalloc.c:236
 __snd_dma_alloc_pages+0xc1/0x130 sound/core/memalloc.c:38
 snd_dma_alloc_pages+0x13b/0x230 sound/core/memalloc.c:71
 do_alloc_pages+0x9b/0x160 sound/core/pcm_memory.c:43
 snd_pcm_lib_malloc_pages+0x3f6/0x880 sound/core/pcm_memory.c:383
 snd_pcm_hw_params+0x1408/0x1990 sound/core/pcm_native.c:705
 snd_pcm_kernel_ioctl+0xd1/0x240 sound/core/pcm_native.c:3338
 snd_pcm_oss_change_params_locked+0x1958/0x3990 sound/core/oss/pcm_oss.c:947
 snd_pcm_oss_change_params sound/core/oss/pcm_oss.c:1091 [inline]
 snd_pcm_oss_make_ready+0xe7/0x1b0 sound/core/oss/pcm_oss.c:1150
 snd_pcm_oss_sync+0x1de/0x800 sound/core/oss/pcm_oss.c:1717
 snd_pcm_oss_release+0x276/0x300 sound/core/oss/pcm_oss.c:2571
 __fput+0x288/0x920 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:209
 __syscall_exit_to_user_mode_work kernel/entry/common.c:291 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:302
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4af19b
Code: fb ff eb bd e8 a6 b6 fb ff e9 61 ff ff ff cc e8 9b 82 fb ff 48 8b 7c 24 10 48 8b 74 24 18 48 8b 54 24 20 48 8b 44 24 08 0f 05 <48> 3d 01 f0 ff ff 76 20 48 c7 44 24 28 ff ff ff ff 48 c7 44 24 30
RSP: 002b:000000c000331430 EFLAGS: 00000206 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 000000c00001e800 RCX: 00000000004af19b
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 000000c000331470 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 000000000000013f
R13: 000000000000013e R14: 0000000000000200 R15: 000000c0004cc0a0
can: request_module (can-proto-0) failed.
can: request_module (can-proto-0) failed.
can: request_module (can-proto-0) failed.


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
