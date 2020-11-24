Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48602C1F30
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 08:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730241AbgKXHyX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Nov 2020 02:54:23 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:55939 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgKXHyX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2020 02:54:23 -0500
Received: by mail-io1-f71.google.com with SMTP id j10so14914165iog.22
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2020 23:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=vE5yN8jkABwOvuJlkLJukMYogJK/uuKbVJ8w3oE8WZE=;
        b=R9Q0IiVFwu2jeV/sTkiTjMclRwFeBDG/iBwh3QQR2UIaS72uZnTJHyqUdXqaDLPVs/
         Ks07z/xIU4NOHq4Pk4TRdsuht30qLHvvNDbUUUzQT7+a6vMQpG2QNHYQuX5zI0anz/P2
         iPugupMHF/KXjpPpD/9FXR1QQvgKZoUfAq1/PLdHSH2rs4qPvC645BMGstNs4vgkHqbs
         quBK7a0hkTxS8yzx0anQpDho8z87zrbqDxM283SMym/YBu+SIHx7yBPonEBF21lqD0pT
         tGYp3n1wbp7GJnsYCPWvSm32g/3ZRXshqmzeqIBgmHQw9luIgQKMd5H/DxAA83RIHJIW
         4RGA==
X-Gm-Message-State: AOAM532nn4w64BsZnPmIbbwSK/shqP5qoJJyvYJ3LRn/3tD8Q0E5Sxjj
        vLW7q0ncIXvm64P4cdxbFT4ruFUTSpRl6OqS/hM07K2img9n
X-Google-Smtp-Source: ABdhPJyOkMVHZj0OrLK9VaufgXLhcQ3psCij/+2VcOw5ViIh9zBGiUPC19JPKEvmcKgII/Ovb+PHK35sx+GCYujB29iFtLPWcyby
MIME-Version: 1.0
X-Received: by 2002:a5d:854f:: with SMTP id b15mr3023623ios.170.1606204460934;
 Mon, 23 Nov 2020 23:54:20 -0800 (PST)
Date:   Mon, 23 Nov 2020 23:54:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000054aea005b4d59e71@google.com>
Subject: linux-next boot error: WARNING in prepare_kswapd_sleep
From:   syzbot <syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    d9137320 Add linux-next specific files for 20201124
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17b14079500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ac6081150c8eac
dashboard link: https://syzkaller.appspot.com/bug?extid=ce635500093181f39c1c
compiler:       gcc (GCC) 10.1.0-syz 20200507

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 2192 at include/linux/memcontrol.h:621 arch_static_branch arch/x86/include/asm/jump_label.h:25 [inline]
WARNING: CPU: 1 PID: 2192 at include/linux/memcontrol.h:621 mem_cgroup_disabled include/linux/memcontrol.h:504 [inline]
WARNING: CPU: 1 PID: 2192 at include/linux/memcontrol.h:621 mem_cgroup_lruvec include/linux/memcontrol.h:616 [inline]
WARNING: CPU: 1 PID: 2192 at include/linux/memcontrol.h:621 clear_pgdat_congested mm/vmscan.c:3443 [inline]
WARNING: CPU: 1 PID: 2192 at include/linux/memcontrol.h:621 prepare_kswapd_sleep mm/vmscan.c:3480 [inline]
WARNING: CPU: 1 PID: 2192 at include/linux/memcontrol.h:621 prepare_kswapd_sleep+0xed/0x250 mm/vmscan.c:3456
Modules linked in:
CPU: 1 PID: 2192 Comm: kswapd0 Not tainted 5.10.0-rc5-next-20201124-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:mem_cgroup_lruvec include/linux/memcontrol.h:621 [inline]
RIP: 0010:clear_pgdat_congested mm/vmscan.c:3443 [inline]
RIP: 0010:prepare_kswapd_sleep mm/vmscan.c:3480 [inline]
RIP: 0010:prepare_kswapd_sleep+0xed/0x250 mm/vmscan.c:3456
Code: 89 ee 48 89 df e8 73 d3 ff ff 31 ff 41 89 c4 89 c6 e8 87 19 d7 ff 45 84 e4 74 cc e8 6d 21 d7 ff 0f 1f 44 00 00 e8 63 21 d7 ff <0f> 0b 48 c7 c0 28 8d ee 8c 48 ba 00 00 00 00 00 fc ff df 48 c1 e8
RSP: 0000:ffffc900085bfda0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88813fffb000 RCX: ffffffff81998e19
RDX: ffff8880168c1ac0 RSI: ffffffff81998e2d RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000ab3 R09: 0000000000000f89
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000004 R14: 0000000000000000 R15: 0000000000000003
FS:  0000000000000000(0000) GS:ffff8880b9f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000b08e000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 kswapd_try_to_sleep mm/vmscan.c:3784 [inline]
 kswapd+0x37d/0xdb0 mm/vmscan.c:3899
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 2192 Comm: kswapd0 Not tainted 5.10.0-rc5-next-20201124-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 panic+0x306/0x73d kernel/panic.c:231
 __warn.cold+0x35/0x44 kernel/panic.c:605
 report_bug+0x1bd/0x210 lib/bug.c:198
 handle_bug+0x3c/0x60 arch/x86/kernel/traps.c:239
 exc_invalid_op+0x14/0x40 arch/x86/kernel/traps.c:259
 asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:578
RIP: 0010:mem_cgroup_lruvec include/linux/memcontrol.h:621 [inline]
RIP: 0010:clear_pgdat_congested mm/vmscan.c:3443 [inline]
RIP: 0010:prepare_kswapd_sleep mm/vmscan.c:3480 [inline]
RIP: 0010:prepare_kswapd_sleep+0xed/0x250 mm/vmscan.c:3456
Code: 89 ee 48 89 df e8 73 d3 ff ff 31 ff 41 89 c4 89 c6 e8 87 19 d7 ff 45 84 e4 74 cc e8 6d 21 d7 ff 0f 1f 44 00 00 e8 63 21 d7 ff <0f> 0b 48 c7 c0 28 8d ee 8c 48 ba 00 00 00 00 00 fc ff df 48 c1 e8
RSP: 0000:ffffc900085bfda0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88813fffb000 RCX: ffffffff81998e19
RDX: ffff8880168c1ac0 RSI: ffffffff81998e2d RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000ab3 R09: 0000000000000f89
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000004 R14: 0000000000000000 R15: 0000000000000003
 kswapd_try_to_sleep mm/vmscan.c:3784 [inline]
 kswapd+0x37d/0xdb0 mm/vmscan.c:3899
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
