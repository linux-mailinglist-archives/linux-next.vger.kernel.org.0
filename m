Return-Path: <linux-next+bounces-2580-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 700F790C820
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 13:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAEDE1F253CF
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 11:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67212157E9F;
	Tue, 18 Jun 2024 09:36:25 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B513B587
	for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718703385; cv=none; b=sL243JryMLn8zXelIp1FGpwZ+iidgtI/CakKqFEdr/SmIcNl2D56huJSOHLd683mjH9r6VpqXeaDAduQl+C3gmcdAMzzpqqi4GwYxQzqItu73UFApWfu7VXBS8IlLdmnPqGkRHOrSwswlV8UTBTZ2ylO6IeVSnL3OxG0mXB4WSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718703385; c=relaxed/simple;
	bh=YRKT9K0asnRkYt5r/3EdqIBUPtFmM7vDzFRxrQhMFxo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TyXiau6/cvEOOxwMAgBixyQ1XZDKvKnxjLdJJW7Z7LcGlQH5SxoWiEww3hq5iTs4DgvjbVZk2T62BR51J6VIyYQF2+fQz7OroQ4tQXXJWAuenHKaSNYjs0vTrzxS4dveNhbq7TJpQ5u618KkbLMyfUCzgwmlrt0C63WCPgiOE3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-7eb846f49adso653788839f.3
        for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 02:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718703383; x=1719308183;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sq8R+hXp0mefQc+SvrsLY3X8c0UoF9IaNpUbknhGGOs=;
        b=Qs3Hfb9ZmynVjtSUQQJfBQLRTf0SPBEERYsxQFZCQKEo955tKigdjQdSMSMLuqxirP
         r7vLBTfmTTU3QLm8LLKZNoOjAxGh6eaNiLPilBJmN+QThhRWy4XBkNY4SERV0SxORfGD
         KDLE+GEdUl8K3n4vR8i+o1Jw2BN/P1ATOXfOiMhnUo8EUSJuXIuN/DxNNzSnEisI3tC0
         JWBKfOXto6MmfSq/78VverMzvihdbV69nuMQXn/k71U3LjjSGy9JVakJMPB4LhPWzfj/
         UFazXYAzxlzhk8ksNQnKKeonueQv+JJMawyBSoJyiBw0xJ4zbgV+xNxcnXrAgCqyymHl
         oljw==
X-Forwarded-Encrypted: i=1; AJvYcCVqGNegFJ9kdwvNBByDqH8FHIqTm2kZheBvt17O1Df8nf9zk2KbzIjWfqtEz4Eu058oeJIDQ7Gopc+goCmW8kVwDFJvnUrGMiwNGw==
X-Gm-Message-State: AOJu0YwG+Zl5DO3a1tU8jAAT5uL8D1bbkT0wmxJGn0VTWz9VNjGDHVrv
	GN5vQ5Xfl5y2wAhsgWLQEoYR6KLfOlcm9RgleaUE6fr475qvzmNZmuQWd4m2kUXk5n33AZHlUVV
	rqbvcv4zl32D3sskFxKFfralAO5hEgw8bD9MO222JZ6rqhvIoAfWQ4P0=
X-Google-Smtp-Source: AGHT+IElxyf0p6s5USujm+0+aWtyJDbnvk2dxf2XMn5BBlp3Dh8I3UEHK/uLTzel+Ou+MZ2ByUfhBKiBvrvqdMu919DiiiyyTnJ7
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:22c4:b0:4b9:2092:c7c9 with SMTP id
 8926c6da1cb9f-4b96414f9aamr414729173.5.1718703382967; Tue, 18 Jun 2024
 02:36:22 -0700 (PDT)
Date: Tue, 18 Jun 2024 02:36:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009dc8a5061b26d066@google.com>
Subject: [syzbot] [kernfs?] linux-next test error: BUG: key ADDR has not been registered!
From: syzbot <syzbot+b2c37bfe1276a38db24f@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    76db4c64526c Add linux-next specific files for 20240617
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15e7ed0e980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=40a62461e8f6102
dashboard link: https://syzkaller.appspot.com/bug?extid=b2c37bfe1276a38db24f
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c821f6b56371/disk-76db4c64.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/efb2d2cbe799/vmlinux-76db4c64.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7be14777af71/bzImage-76db4c64.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b2c37bfe1276a38db24f@syzkaller.appspotmail.com

cgroup: Unknown subsys name 'net'
BUG: key ffff88801b2e00d8 has not been registered!
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 0 PID: 5091 at kernel/locking/lockdep.c:4945 lockdep_init_map_type+0x4e3/0x910 kernel/locking/lockdep.c:4945
Modules linked in:
CPU: 0 PID: 5091 Comm: syz-executor Not tainted 6.10.0-rc4-next-20240617-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
RIP: 0010:lockdep_init_map_type+0x4e3/0x910 kernel/locking/lockdep.c:4945
Code: 00 00 83 3d 0e ee 3f 0e 00 75 23 90 48 c7 c7 c0 bf ca 8b 48 c7 c6 60 c2 ca 8b e8 98 12 e6 ff 48 ba 00 00 00 00 00 fc ff df 90 <0f> 0b 90 90 90 e9 0d ff ff ff 48 c7 c7 00 c2 ca 8b 4c 89 fe e8 d4
RSP: 0018:ffffc9000392f560 EFLAGS: 00010246
RAX: fd5a9d02d6690300 RBX: ffff88802b44f2fa RCX: ffff888027300000
RDX: dffffc0000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc9000392f630 R08: ffffffff81552402 R09: fffffbfff1c39afc
R10: dffffc0000000000 R11: fffffbfff1c39afc R12: ffff88802b44f2d8
R13: 1ffff92000725eb0 R14: 0000000000000000 R15: ffff88801b2e00d8
FS:  000055557db2c480(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055f3fa310918 CR3: 000000001f034000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lockdep_init_map_waits include/linux/lockdep.h:135 [inline]
 lockdep_init_map_wait include/linux/lockdep.h:142 [inline]
 lockdep_init_map include/linux/lockdep.h:148 [inline]
 __kernfs_create_file+0x112/0x2e0 fs/kernfs/file.c:1046
 cgroup_add_file kernel/cgroup/cgroup.c:4216 [inline]
 cgroup_addrm_files+0xab8/0xe50 kernel/cgroup/cgroup.c:4270
 css_populate_dir+0x120/0x3b0 kernel/cgroup/cgroup.c:1761
 cgroup_apply_control_enable+0x621/0xaf0 kernel/cgroup/cgroup.c:3240
 cgroup_apply_control+0x97/0x800 kernel/cgroup/cgroup.c:3314
 rebind_subsystems+0x10a0/0x1500 kernel/cgroup/cgroup.c:1882
 cgroup_setup_root+0x3d3/0xb30 kernel/cgroup/cgroup.c:2132
 cgroup1_root_to_use kernel/cgroup/cgroup-v1.c:1224 [inline]
 cgroup1_get_tree+0x582/0x8c0 kernel/cgroup/cgroup-v1.c:1244
 vfs_get_tree+0x90/0x2a0 fs/super.c:1789
 do_new_mount+0x2be/0xb40 fs/namespace.c:3379
 do_mount fs/namespace.c:3719 [inline]
 __do_sys_mount fs/namespace.c:3925 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:3902
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7e4547e62a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 09 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcd9331ab8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffcd9331c70 RCX: 00007f7e4547e62a
RDX: 00007f7e454e51a6 RSI: 00007f7e454daa7e RDI: 00007f7e454d99b9
RBP: 00007f7e454daa7e R08: 00007f7e454dac2a R09: 006f6972705f7465
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f7e454d99b9
R13: 00007f7e454e51a6 R14: 00007ffcd9331c88 R15: 00007ffcd9331ac0
 </TASK>


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

