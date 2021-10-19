Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5FE14333D4
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 12:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbhJSKuh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 06:50:37 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:53933 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235224AbhJSKug (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 06:50:36 -0400
Received: by mail-il1-f198.google.com with SMTP id x4-20020a923004000000b00258f6abf8feso9823544ile.20
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 03:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=UWIi3pnUrmEQTuQ0UZIjXZ1rL1sw7AgitngmCJAfh/4=;
        b=c2/9/h1WNa8CfE83KcGoW9PjLwZVi6pvZCyPEZxmAIuS5vBkN1r5cP2NrDHNjx1JoO
         t0/ori3OC79wgwjJjTL1LF48MOQkQ9N/CNFeUxB8uFoyo/m7N8Zq+KiIy8klHGsiA6HI
         8acdYax8CoOAosyyi7BqfGILBa2vQbTNwumZopWzFyZaVCMrLq72Z6meZ0LzBk2ukW9I
         UDSK9iUWZgXLCgzcheX9NA/pPM7juXmGs1xvsRKvkQanHQOpj9Kh1BB0YNAQJMM13UVI
         fk00Kbl+ABcMHY0ZIpNfz8SWMAig+xTsI0m6a9Y+o+F3+W/3n8CdyAgzmUR6n0LxepDx
         qeUw==
X-Gm-Message-State: AOAM5319JyMQHYZlST9HcC6Got+rbeqzAHCgUf3x1JJpMYrsnIC7VBwD
        Tum/swK4gzJ0/0Q6ebId6d2L8vDoA6IIbUSgj/YAcCjo/s/f
X-Google-Smtp-Source: ABdhPJyfqWW7p9K4+BOg8sz1vB98Fe68VrSTiqXwlw7UcTuyopw+vceFyfSzRauK5S1+d1MFEpVKhH0WQe/3Nxl7PsEG94s9SdGY
MIME-Version: 1.0
X-Received: by 2002:a5d:8c83:: with SMTP id g3mr17761115ion.24.1634640504015;
 Tue, 19 Oct 2021 03:48:24 -0700 (PDT)
Date:   Tue, 19 Oct 2021 03:48:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000093cf1905ceb26639@google.com>
Subject: [syzbot] linux-next boot error: general protection fault in blk_mq_free_request
From:   syzbot <syzbot+eb8104072aeab6cc1195@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    5b27c149257d Add linux-next specific files for 20211019
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=125634e8b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e67e30f30c1889f3
dashboard link: https://syzkaller.appspot.com/bug?extid=eb8104072aeab6cc1195
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eb8104072aeab6cc1195@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 1 PID: 2958 Comm: (journald) Not tainted 5.15.0-rc6-next-20211019-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:blk_mq_free_request+0x16d/0x5d0 block/blk-mq.c:589
Code: 48 8b 9d d8 00 00 00 48 85 db 0f 84 7c 02 00 00 e8 48 3d b3 fd 48 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 34 04 00 00 48 8b 7b 08 e8 90 97 fe ff 4c 89 fa
RSP: 0000:ffffc90000dc0ca0 EFLAGS: 00010003
RAX: dffffc0000000000 RBX: 0000000000000007 RCX: 0000000000000100
RDX: 0000000000000001 RSI: ffffffff83c437a8 RDI: 000000000000000f
RBP: ffff88801ccbc800 R08: 0000000000000001 R09: ffff88801c9de0bf
R10: ffffffff83ce54c3 R11: 0000000000000000 R12: ffff88801a9ae0b0
R13: ffff88801ccbc81c R14: ffff88801abe1800 R15: ffff88801ccbc8d8
FS:  00007fb7e5580500(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb7e3e08358 CR3: 000000001d7ec000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 __blk_mq_end_request+0x339/0x580 block/blk-mq.c:782
 blk_flush_complete_seq+0x561/0x1040 block/blk-flush.c:204
 flush_end_io+0x76e/0xbf0 block/blk-flush.c:259
 __blk_mq_end_request+0x123/0x580 block/blk-mq.c:780
 scsi_end_request+0x485/0x980 drivers/scsi/scsi_lib.c:577
 scsi_io_completion+0x24f/0x1650 drivers/scsi/scsi_lib.c:939
 scsi_complete+0x129/0x3b0 drivers/scsi/scsi_lib.c:1433
 blk_complete_reqs+0xad/0xe0 block/blk-mq.c:852
 __do_softirq+0x29b/0x9c2 kernel/softirq.c:558
 invoke_softirq kernel/softirq.c:432 [inline]
 __irq_exit_rcu+0x123/0x180 kernel/softirq.c:637
 irq_exit_rcu+0x5/0x20 kernel/softirq.c:649
 common_interrupt+0xa9/0xc0 arch/x86/kernel/irq.c:240
 </IRQ>
 <TASK>
 asm_common_interrupt+0x1e/0x40 arch/x86/include/asm/idtentry.h:629
RIP: 0010:lock_is_held_type+0xff/0x140 kernel/locking/lockdep.c:5685
Code: 00 00 b8 ff ff ff ff 65 0f c1 05 4c dc b4 76 83 f8 01 75 29 9c 58 f6 c4 02 75 3d 48 f7 04 24 00 02 00 00 74 01 fb 48 83 c4 08 <44> 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 45 31 ed eb b9 0f 0b 48
RSP: 0000:ffffc90001b4fe00 EFLAGS: 00000296
RAX: 0000000000000046 RBX: 0000000000000002 RCX: 0000000000000001
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffffff8bbc5198 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff81abc441 R11: 0000000000000000 R12: ffff88807b49ba00
R13: 0000000000000000 R14: 00000000ffffffff R15: ffff88807b49c490
 lock_is_held include/linux/lockdep.h:283 [inline]
 task_css include/linux/cgroup.h:494 [inline]
 mem_cgroup_from_task+0x83/0x120 mm/memcontrol.c:896
 count_memcg_event_mm.part.0+0xa6/0x2d0 include/linux/memcontrol.h:1096
 count_memcg_event_mm include/linux/memcontrol.h:615 [inline]
 handle_mm_fault+0xcf/0x790 mm/memory.c:4755
 do_user_addr_fault+0x489/0x11c0 arch/x86/mm/fault.c:1397
 handle_page_fault arch/x86/mm/fault.c:1485 [inline]
 exc_page_fault+0x9e/0x180 arch/x86/mm/fault.c:1541
 asm_exc_page_fault+0x1e/0x30 arch/x86/include/asm/idtentry.h:568
RIP: 0033:0x7fb7e3ae6ea5
Code: 00 00 00 00 00 89 f1 c1 e9 04 8d 44 09 fe 48 98 49 8d 44 c7 68 48 8b 38 4c 8d 40 f0 89 c8 ba 01 00 00 00 c1 f8 05 d3 e2 48 98 <41> 09 94 87 58 08 00 00 83 ed 01 4d 89 46 18 49 89 7e 10 4c 89 77
RSP: 002b:00007ffc07855dc0 EFLAGS: 00010202
RAX: 0000000000000000 RBX: 00007fb7e3e07b58 RCX: 0000000000000007
RDX: 0000000000000080 RSI: 0000000000000070 RDI: 00007fb7e3e07bb8
RBP: 0000000000002710 R08: 00007fb7e3e07bb8 R09: 0000000000008040
R10: 0000000000000020 R11: 0000000000000246 R12: 0000000000008040
R13: 00007fb7e3e07b58 R14: 0000562c5b836a30 R15: 00007fb7e3e07b00
 </TASK>
Modules linked in:
---[ end trace 82b2abb412dfdcfe ]---
RIP: 0010:blk_mq_free_request+0x16d/0x5d0 block/blk-mq.c:589
Code: 48 8b 9d d8 00 00 00 48 85 db 0f 84 7c 02 00 00 e8 48 3d b3 fd 48 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 34 04 00 00 48 8b 7b 08 e8 90 97 fe ff 4c 89 fa
RSP: 0000:ffffc90000dc0ca0 EFLAGS: 00010003
RAX: dffffc0000000000 RBX: 0000000000000007 RCX: 0000000000000100
RDX: 0000000000000001 RSI: ffffffff83c437a8 RDI: 000000000000000f
RBP: ffff88801ccbc800 R08: 0000000000000001 R09: ffff88801c9de0bf
R10: ffffffff83ce54c3 R11: 0000000000000000 R12: ffff88801a9ae0b0
R13: ffff88801ccbc81c R14: ffff88801abe1800 R15: ffff88801ccbc8d8
FS:  00007fb7e5580500(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb7e3e08358 CR3: 000000001d7ec000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	48 8b 9d d8 00 00 00 	mov    0xd8(%rbp),%rbx
   7:	48 85 db             	test   %rbx,%rbx
   a:	0f 84 7c 02 00 00    	je     0x28c
  10:	e8 48 3d b3 fd       	callq  0xfdb33d5d
  15:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 34 04 00 00    	jne    0x468
  34:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  38:	e8 90 97 fe ff       	callq  0xfffe97cd
  3d:	4c 89 fa             	mov    %r15,%rdx


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
