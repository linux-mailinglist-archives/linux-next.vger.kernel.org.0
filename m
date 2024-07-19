Return-Path: <linux-next+bounces-3085-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1579374C1
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 10:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434C02822C8
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 08:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12BF757E0;
	Fri, 19 Jul 2024 08:09:26 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D2F6F2F0
	for <linux-next@vger.kernel.org>; Fri, 19 Jul 2024 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721376566; cv=none; b=S1lg8KuROqKVYEBzjP1QRtfoMh9OEwwif2Tye/DbBQiQv6Wck79d7lVXGfAjySqwZUFmhGs5EDbHNDywP3qZxsMlv8KOuhXfNfaLmgIfpqW+dySoTvQJ61//RycmbA17i4VDhqbShy5ua/73YAmb41pJpPfz9U8mYaJ54FIM4fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721376566; c=relaxed/simple;
	bh=zppiAnThdZspTUmKRRbRnbURZpttoW86/psZYaaTlHg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=A92DZGrg5J9C3bTcXZKRge4VMmqWnGzRKq7oIO1gavw31k9GclJno+X0uZDyVb5L5wTvtQf5bniWQrudpExPMVGfFM8bbU0dX3xIe9cf41HcoyPGKcoUtASCtFCDMO79mGFgO+INbl2NC/1qzd70xnSNuWBcbs29Ki9Z5Yrk8ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-803aad60527so244286139f.1
        for <linux-next@vger.kernel.org>; Fri, 19 Jul 2024 01:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721376564; x=1721981364;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sEUeDIvYZeQZf7H7CtG1lFokqc2+xsoXZs8lyUFTTdI=;
        b=sfBDsYz3EvTASxUoISvFMBNhpLUmtLppVUstxQlt0O5cvYoT+uszc79RsukRvfOyC3
         oroWme01KHrcZ3TUCeOGpsQf+XSqdpoptE0yn7086bkYkonpRrStU2nwH4U8xw+nG1gj
         KkQ4J9CiScruRcz0jbTBi3RPG5urla13uzaDnwv0K74f+bqIgyroIlgKlshQZiU4kCtZ
         +hhKwzUq40dtsY1z9FwVhWJ6YEyDikvsxELUKvolWJ3pBlC7PrR5k8yH3m+oVmilDAXk
         E6UQBe4Sxnp0JLeXzBKMr1RTnJvVfEM2cViLXq2rO/k++bCG5tblCGaZruKui/kZz/KO
         ezPA==
X-Forwarded-Encrypted: i=1; AJvYcCXqzI1iwkIh5AdbndrzCqu1Hx5Gxuutl4vlcQjOtGEqk9KCEDH2FK27Jn2fcq2wreuG0ba4UX4oeHGAs1udJ5LC9+698/12JYVd4w==
X-Gm-Message-State: AOJu0YywyhL0BJNIHIM2JuuG1CVsbg7GzKXTautxEqhDWS+FhoFWRAnS
	E6Wu9v5IT7EN79tlAHsnhwYAwMxFmJ0h7cp8UVJSiJvFTUVP5iNYoqJBg/MhK662ifp/RvL3u3O
	XaSZfUwhp0IwIRnPqaOC/eS3vk3Ns+ezj8brmBlrSScD/cUQSL+yiiw0=
X-Google-Smtp-Source: AGHT+IGF5KuIlLUm3CeNe4r5ENtLQN4kAyO1WMKrQ8alhyAkSM+0yWOjGvXnLIUV1ahmhU6wXLPDAHRICIG6n5Sb677IfaWsMvlI
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:300d:b0:4c0:bcff:656b with SMTP id
 8926c6da1cb9f-4c2158c611dmr267397173.2.1721376564482; Fri, 19 Jul 2024
 01:09:24 -0700 (PDT)
Date: Fri, 19 Jul 2024 01:09:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a6a7d6061d95361a@google.com>
Subject: [syzbot] [kernel?] linux-next test error: WARNING in alloc_workqueue
From: syzbot <syzbot+0140d5dae274b92d2400@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	peterz@infradead.org, sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    91e3b24eb7d2 Add linux-next specific files for 20240715
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1700fb31980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7b6bd2d463871440
dashboard link: https://syzkaller.appspot.com/bug?extid=0140d5dae274b92d2400
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b844ec41aa74/disk-91e3b24e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/391d0a06ddd9/vmlinux-91e3b24e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/71388f4b21d9/bzImage-91e3b24e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0140d5dae274b92d2400@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 5097 at kernel/cpu.c:527 lockdep_assert_cpus_held+0xad/0x100 kernel/cpu.c:527
Modules linked in:
CPU: 1 UID: 0 PID: 5097 Comm: syz-executor Not tainted 6.10.0-next-20240715-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
RIP: 0010:lockdep_assert_cpus_held+0xad/0x100 kernel/cpu.c:527
Code: 0a 89 c3 31 ff 89 c6 e8 81 17 3e 00 85 db 74 14 e8 38 13 3e 00 eb 05 e8 31 13 3e 00 5b 41 5e c3 cc cc cc cc e8 24 13 3e 00 90 <0f> 0b 90 eb ed 48 c7 c1 40 ad af 8f 80 e1 07 80 c1 03 38 c1 0f 8c
RSP: 0018:ffffc9000354f8a8 EFLAGS: 00010293
RAX: ffffffff8155b7cc RBX: 0000000000000000 RCX: ffff888028341e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc9000354fa80 R08: ffffffff8155b7af R09: 1ffffffff1f6000d
R10: dffffc0000000000 R11: fffffbfff1f6000e R12: dffffc0000000000
R13: ffff88801fc28800 R14: dffffc0000000000 R15: ffff8881426f9880
FS:  0000555557025500(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564978912b08 CR3: 0000000021990000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 alloc_and_link_pwqs kernel/workqueue.c:5437 [inline]
 alloc_workqueue+0xbc8/0x1fe0 kernel/workqueue.c:5703
 tipc_crypto_start+0xd2/0x620 net/tipc/crypto.c:1472
 tipc_init_net+0x211/0x330 net/tipc/core.c:72
 ops_init+0x359/0x610 net/core/net_namespace.c:139
 setup_net+0x515/0xca0 net/core/net_namespace.c:343
 copy_net_ns+0x4e2/0x7b0 net/core/net_namespace.c:508
 create_new_namespaces+0x425/0x7b0 kernel/nsproxy.c:110
 unshare_nsproxy_namespaces+0x124/0x180 kernel/nsproxy.c:228
 ksys_unshare+0x619/0xc10 kernel/fork.c:3316
 __do_sys_unshare kernel/fork.c:3387 [inline]
 __se_sys_unshare kernel/fork.c:3385 [inline]
 __x64_sys_unshare+0x38/0x40 kernel/fork.c:3385
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4a15177337
Code: 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 10 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff67fdb2c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000110
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f4a15177337
RDX: 00007f4a15175bd9 RSI: 00007fff67fdb290 RDI: 0000000040000000
RBP: 00007fff67fdb2f8 R08: 00007f4a152c3a30 R09: 00007f4a152c3a30
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff67fdb2f0
R13: 00007fff67fdb578 R14: 0000000000000009 R15: 0000000000000009
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

