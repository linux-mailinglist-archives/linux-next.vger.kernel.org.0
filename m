Return-Path: <linux-next+bounces-3214-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F794595B
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 09:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F9991F23EAD
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 07:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9071C0DD6;
	Fri,  2 Aug 2024 07:58:30 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D31C0DC0
	for <linux-next@vger.kernel.org>; Fri,  2 Aug 2024 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722585510; cv=none; b=WIiQ68qHhv+5v3Ygwpc4KONKZ4rQuQopYgn3Onqwfxh9w7t9RKD6rlr3BqazlukD5aqbbTw7ztefJfK/DP/9z71hdRPzcPbZ3osDA9huXQsAGM1yqVvbo7CkqS14qla9ya55/vhb/d9Nu4w27AD3iS/4gmMHNM+uD+GcCmcV4w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722585510; c=relaxed/simple;
	bh=+4gSI2UNRs4upqPARucmyft/k33qUDqvjIa8TSLj6qM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LGMw61aSfxbIrtyVRmGwh1mw2Xo+ZASloM5b4QY5z3LPArxS6GK+XDIHeWwO9B5BSDSJhDDq3eSoMFvxufmByd9vbAeUeM6zd2uLtx4MZsPWlciRRrxA6LA5mjZBIoiW/wzcxi1NPxfAljtw89RpXOnDwTujA38ltcg7319/R0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3994393abd5so120536205ab.0
        for <linux-next@vger.kernel.org>; Fri, 02 Aug 2024 00:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722585508; x=1723190308;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/bDTbpx8tospXfPirh54si5d7WTpm3zbJ+fWB6NgvA=;
        b=IJUc0ncm6Ma+E2pSetjIXq77AzUf2YN9FhOpurodfn1WLUpWwA9jqcCMaDpHsp7U1I
         +BRUDOuw+QXDBjshgveAI9IfUaUdNou8kLacWTmC6JRhOgV/lfxm9Z2cvYTXz8d+2Pl7
         7ciTfx8Zvj8VKs29zmsbxDyilpco0eI1AEpzYEcghLNKHgStRTXbeulNB5eYGWiWGfDz
         fN9R+zRe/r+BkUq1ZPsSbf/sSvi2YZ7cEbJT3LBRoI376KotGVT9NlNRQIU9cKYcRZAE
         eZE8gq4MP/CazflHUDl4Jz0dMbjfWDA5clEgBBMIiyYinUhHtWX43EYuBwFDmFLoy4nk
         JF1g==
X-Forwarded-Encrypted: i=1; AJvYcCXVmMbqqkjYmnsEqbEZVDq5+LfS6k+AQViVxPGQxcX1n4azxvdC+6j7Sy0QNSqYl/hX/sppxgL1LpHFWQE32MuYzWs4ETWXinyXow==
X-Gm-Message-State: AOJu0YxYCKJ/AhZQgC2WRbzzhKVaAOTNzYmtE4dHUh9dSm1Iyrgus4V6
	UVKYoLJ76J1z52haTSUxh0+IzC51c6zaGjgycLKCFAxmRfWQldVpjZh04gNbKBbtRFMXGkkHg7O
	ipqAe10hdw9ruaCOYo2k5T3vSVBjvPfmlcffkve3oKS16pgl0sFCB8Do=
X-Google-Smtp-Source: AGHT+IE5Ri0RbHWoBSQiuL56yiyOhFm8+/JaNvp0HYI8l8IpaKFnQ5apssdKMGGB5+sm1xgW/i9wVye5Eh12nykbA7UDH8RblUBQ
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d05:b0:381:c5f0:20ef with SMTP id
 e9e14a558f8ab-39b1f78de5dmr2027965ab.0.1722585508386; Fri, 02 Aug 2024
 00:58:28 -0700 (PDT)
Date: Fri, 02 Aug 2024 00:58:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000052aa15061eaeb1fd@google.com>
Subject: [syzbot] [trace?] linux-next test error: WARNING in rcu_core
From: syzbot <syzbot+263726e59eab6b442723@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, mhiramat@kernel.org, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f524a5e4dfb7 Add linux-next specific files for 20240802
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=174c896d980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a66a5509e9947c4c
dashboard link: https://syzkaller.appspot.com/bug?extid=263726e59eab6b442723
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8c0255b9a6ad/disk-f524a5e4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/71d89466ea60/vmlinux-f524a5e4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ba8fcf059463/bzImage-f524a5e4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+263726e59eab6b442723@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at mm/slub.c:4550 slab_free_after_rcu_debug+0x18b/0x270 mm/slub.c:4550
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc1-next-20240802-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
RIP: 0010:slab_free_after_rcu_debug+0x18b/0x270 mm/slub.c:4550
Code: 48 89 04 19 48 8d 4a 08 49 8b 34 24 65 48 0f c7 0e 75 c8 4c 89 f7 48 83 c4 08 5b 41 5c 41 5d 41 5e 41 5f 5d e9 36 55 ff ff 90 <0f> 0b 90 eb 92 90 0f 0b 90 eb 8c 90 0f 0b 90 eb 86 41 8b 54 24 1c
RSP: 0000:ffffc90000007bc0 EFLAGS: 00010286
RAX: ffff88823bc00000 RBX: ffff88802bcee5c0 RCX: 00000000000a0fe0
RDX: ffffea0000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90000007e30 R08: ffffffff8142b2ec R09: 1ffffffff26e8ce3
R10: dffffc0000000000 R11: ffffffff81f0bb80 R12: dffffc0000000000
R13: ffffffff817bd996 R14: ffff88823bca0fe0 R15: ffffea0000af3a00
FS:  0000000000000000(0000) GS:ffff8880b9200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000e734000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 rcu_do_batch kernel/rcu/tree.c:2569 [inline]
 rcu_core+0xafd/0x1830 kernel/rcu/tree.c:2843
 handle_softirqs+0x2c4/0x970 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu+0xf4/0x1c0 kernel/softirq.c:637
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1043
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_acquire+0x264/0x550 kernel/locking/lockdep.c:5826
Code: 2b 00 74 08 4c 89 f7 e8 8a 32 8c 00 f6 44 24 61 02 0f 85 85 01 00 00 41 f7 c7 00 02 00 00 74 01 fb 48 c7 44 24 40 0e 36 e0 45 <4b> c7 44 25 00 00 00 00 00 43 c7 44 25 09 00 00 00 00 43 c7 44 25
RSP: 0000:ffffc900000675a0 EFLAGS: 00000206
RAX: 0000000000000001 RBX: 1ffff9200000cec0 RCX: 455ccde0f6bffc00
RDX: dffffc0000000000 RSI: ffffffff8c0ae6a0 RDI: ffffffff8c609240
RBP: ffffc90000067700 R08: ffffffff93746717 R09: 1ffffffff26e8ce2
R10: dffffc0000000000 R11: fffffbfff26e8ce3 R12: 1ffff9200000cebc
R13: dffffc0000000000 R14: ffffc90000067600 R15: 0000000000000246
 __fs_reclaim_acquire mm/page_alloc.c:3856 [inline]
 fs_reclaim_acquire+0x88/0x140 mm/page_alloc.c:3870
 might_alloc include/linux/sched/mm.h:334 [inline]
 slab_pre_alloc_hook mm/slub.c:3979 [inline]
 slab_alloc_node mm/slub.c:4057 [inline]
 __do_kmalloc_node mm/slub.c:4197 [inline]
 __kmalloc_noprof+0xa9/0x400 mm/slub.c:4210
 kmalloc_noprof include/linux/slab.h:685 [inline]
 kzalloc_noprof include/linux/slab.h:807 [inline]
 kobject_get_path+0xb8/0x230 lib/kobject.c:161
 kobject_uevent_env+0x2a5/0x8e0 lib/kobject_uevent.c:545
 kernel_add_sysfs_param+0x10a/0x130 kernel/params.c:821
 param_sysfs_builtin+0x16e/0x1f0 kernel/params.c:856
 param_sysfs_builtin_init+0x31/0x40 kernel/params.c:990
 do_one_initcall+0x248/0x880 init/main.c:1267
 do_initcall_level+0x157/0x210 init/main.c:1329
 do_initcalls+0x3f/0x80 init/main.c:1345
 kernel_init_freeable+0x435/0x5d0 init/main.c:1578
 kernel_init+0x1d/0x2b0 init/main.c:1467
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:144
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
----------------
Code disassembly (best guess):
   0:	2b 00                	sub    (%rax),%eax
   2:	74 08                	je     0xc
   4:	4c 89 f7             	mov    %r14,%rdi
   7:	e8 8a 32 8c 00       	call   0x8c3296
   c:	f6 44 24 61 02       	testb  $0x2,0x61(%rsp)
  11:	0f 85 85 01 00 00    	jne    0x19c
  17:	41 f7 c7 00 02 00 00 	test   $0x200,%r15d
  1e:	74 01                	je     0x21
  20:	fb                   	sti
  21:	48 c7 44 24 40 0e 36 	movq   $0x45e0360e,0x40(%rsp)
  28:	e0 45
* 2a:	4b c7 44 25 00 00 00 	movq   $0x0,0x0(%r13,%r12,1) <-- trapping instruction
  31:	00 00
  33:	43 c7 44 25 09 00 00 	movl   $0x0,0x9(%r13,%r12,1)
  3a:	00 00
  3c:	43                   	rex.XB
  3d:	c7                   	.byte 0xc7
  3e:	44                   	rex.R
  3f:	25                   	.byte 0x25


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

