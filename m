Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 223091DA9A3
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 07:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgETFDU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 01:03:20 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:38725 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgETFDS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 01:03:18 -0400
Received: by mail-io1-f72.google.com with SMTP id l2so1416iok.5
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 22:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=KKgpOKZwELuxAnKHctzG/iEg8ibbzoWmWk7hnpPP3cQ=;
        b=bN9FAHhrg3Fv91oRoxr4eLX6YfeL5Fyx3rQA07pVLlXkEwNAqojY6ztPp7FPoBATxC
         KqyyjiUU1B0IzHuik1f4h9DJIToI01LCadnqq9CT6T7imBS7aoKtWidxICPleqftC8Eq
         kVZPsn8897+Zz3gdA2GwRcVZiGj9sOxPN7Cbk5d6efaZHeJxl5H1nXG4k9SBT3pxY/4l
         XNq8604hwGYYaBjHEmpx/ChRMZnJooLqeDeBQnmYK7SC52b0BxxE257Gvz1CfLFXLBxr
         jmET6DtsnNAq9XQUEOgx7i7xO8I6Ps+Vs5h0XEzqEfLkD8HBIrnNAj7+Y3J9eg0sS0kS
         78Jg==
X-Gm-Message-State: AOAM5309ydAP/1cvtnC5NF2huiI9uBzLFLAg7/HNs6pyUTiVlB9EaxOu
        A03sD6oXQxYzXJ8auejYwgqYYyDGXXSvmSKLOsGxSJ1OdfMj
X-Google-Smtp-Source: ABdhPJxopgL1zEcZOcU59HLHWz43TElGucsI8/UssZcE40lENvPiZ9TsT8wLI64hDgwvohzGfeGdBCq8hnB1sX2+jjt8SjsFv0AH
MIME-Version: 1.0
X-Received: by 2002:a5d:84d4:: with SMTP id z20mr2123671ior.36.1589950996382;
 Tue, 19 May 2020 22:03:16 -0700 (PDT)
Date:   Tue, 19 May 2020 22:03:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000598a2905a60d50cd@google.com>
Subject: linux-next boot error: BUG: Invalid wait context ]
From:   syzbot <syzbot+08003d278f04ed0944e0@syzkaller.appspotmail.com>
To:     fweisbec@gmail.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, mingo@kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    fb57b1fa Add linux-next specific files for 20200519
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17c9196e100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2522f758a3588c2d
dashboard link: https://syzkaller.appspot.com/bug?extid=08003d278f04ed0944e0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+08003d278f04ed0944e0@syzkaller.appspotmail.com

=============================
[ BUG: Invalid wait context ]
5.7.0-rc6-next-20200519-syzkaller #0 Not tainted
-----------------------------
swapper/1/0 is trying to lock:
ffff8880ae737518 (&pool->lock){..-.}-{3:3}, at: spin_lock include/linux/spinlock.h:353 [inline]
ffff8880ae737518 (&pool->lock){..-.}-{3:3}, at: __queue_work+0x2bf/0x1350 kernel/workqueue.c:1448
other info that might help us debug this:
context-{2:2}
1 lock held by swapper/1/0:
 #0: ffffffff89bc0040 (rcu_read_lock){....}-{1:3}, at: __queue_work+0x175/0x1350 kernel/workqueue.c:1411
stack backtrace:
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.7.0-rc6-next-20200519-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_lock_invalid_wait_context kernel/locking/lockdep.c:3988 [inline]
 check_wait_context kernel/locking/lockdep.c:4049 [inline]
 __lock_acquire.cold+0x26c/0x458 kernel/locking/lockdep.c:4286
 lock_acquire+0x20e/0x960 kernel/locking/lockdep.c:4915
 __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
 _raw_spin_lock+0x2a/0x40 kernel/locking/spinlock.c:151
 spin_lock include/linux/spinlock.h:353 [inline]
 __queue_work+0x2bf/0x1350 kernel/workqueue.c:1448
 queue_work_on+0x18b/0x200 kernel/workqueue.c:1517
 tick_nohz_activate kernel/time/tick-sched.c:1244 [inline]
 tick_nohz_activate kernel/time/tick-sched.c:1237 [inline]
 tick_setup_sched_timer+0x20e/0x380 kernel/time/tick-sched.c:1378
 hrtimer_switch_to_hres kernel/time/hrtimer.c:739 [inline]
 hrtimer_run_queues+0x327/0x3e0 kernel/time/hrtimer.c:1746
 run_local_timers+0x49/0x130 kernel/time/timer.c:1798
 update_process_times+0x1e/0x60 kernel/time/timer.c:1725
 tick_periodic+0x79/0x170 kernel/time/tick-common.c:99
 tick_handle_periodic+0x41/0x130 kernel/time/tick-common.c:111
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1080 [inline]
 smp_apic_timer_interrupt+0x1ad/0x6a0 arch/x86/kernel/apic/apic.c:1105
 apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:828
 </IRQ>
RIP: 0010:native_safe_halt+0xe/0x10 arch/x86/include/asm/irqflags.h:61
Code: cc cc cc cc cc cc cc cc cc cc cc cc e9 07 00 00 00 0f 00 2d 74 91 59 00 f4 c3 66 90 e9 07 00 00 00 0f 00 2d 64 91 59 00 fb f4 <c3> cc 48 b8 00 00 00 00 00 fc ff df 41 57 41 56 41 55 41 54 55 53
RSP: 0000:ffffc90000d3fd50 EFLAGS: 00000286 ORIG_RAX: ffffffffffffff13
RAX: 1ffffffff1369a43 RBX: 1ffff920001a7fab RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000006 RDI: ffff8880a95f0c0c
RBP: dffffc0000000000 R08: ffff8880a95f0340 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffed10152be068
R13: 0000000000000001 R14: ffffffff8aabeb08 R15: 0000000000000000
 arch_safe_halt arch/x86/include/asm/paravirt.h:150 [inline]
 default_idle+0x91/0x3d0 arch/x86/kernel/process.c:708
 cpuidle_idle_call kernel/sched/idle.c:154 [inline]
 do_idle+0x393/0x690 kernel/sched/idle.c:269
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:361
 start_secondary+0x2f8/0x410 arch/x86/kernel/smpboot.c:268
 secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:242
random: fast init done
random: 7 urandom warning(s) missed due to ratelimiting


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
