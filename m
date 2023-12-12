Return-Path: <linux-next+bounces-360-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C153D80EDA0
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 14:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6661F1F2169C
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 13:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D11161FC3;
	Tue, 12 Dec 2023 13:31:36 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3213B7
	for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 05:31:32 -0800 (PST)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6d8541e6cafso6946578a34.0
        for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 05:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702387892; x=1702992692;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEwhSkiCAHEXWU6GFKtWKs3hHe1hKKgZ81tIqA3x4I4=;
        b=SV74MhV+BZVTaqKpZGtGEJwWGvqGmAR0CZwjB0wYujH2bEaJNUMko3WcMbr1uR8LLb
         NZr2jHlnamP5nq8ozWiEdxseRjXJ6KV31YSkgxBN/GPZaHV/4RbeaAgbXNj30lG14qJJ
         0mioWWUl1myzb6/h/hkZLr5Q+6iNgbPWYSo3HHh5GF1xWeKc+lvCEmPFwvPcOdHr+3lD
         LL8wgc1dX615JPCGHKbSaGuW8bcLUhP21Sw7A7sEcgI4O55mYp7AeVSVWBGoCaK/zql9
         t5//2hX/jHvKxN8kSZtt1+SxE3u2fmxsQS9SMk2ScnCEDlCcyvB/czNWhXCFruWr7oIv
         DVgA==
X-Gm-Message-State: AOJu0YxpGdJ3gBec/R90easVPQO+LqkDUygekHxaWLNbjQf2VkaFa9Mq
	3MB0uX9DXpi4LZXpjpem9xku3K+fCiSPmfWdfclp+suz+LwX
X-Google-Smtp-Source: AGHT+IET/f8AEfECjWNt0wUJv335xzyALho0HZKH6uXH2GPYGpdS/AWIw3EKbrqgop2+MV/cXc2CFfCB/Y6ma0sV0XD/0+oMASJj
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6830:3492:b0:6d9:ce5d:19a7 with SMTP id
 c18-20020a056830349200b006d9ce5d19a7mr5756216otu.1.1702387892047; Tue, 12 Dec
 2023 05:31:32 -0800 (PST)
Date: Tue, 12 Dec 2023 05:31:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009354da060c5011d7@google.com>
Subject: [syzbot] linux-next test error: INFO: rcu detected stall in corrupted (2)
From: syzbot <syzbot+3ed86348059ea02052e6@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Level: **

Hello,

syzbot found the following issue on:

HEAD commit:    bbd220ce4e29 Add linux-next specific files for 20231211
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=147dc36ce80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=857c7631aa489aff
dashboard link: https://syzkaller.appspot.com/bug?extid=3ed86348059ea02052e6
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5772438d8d39/disk-bbd220ce.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7580482c8fd0/vmlinux-bbd220ce.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b26f5e4254af/bzImage-bbd220ce.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3ed86348059ea02052e6@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 0-...D } 2680 jiffies s: 601 root: 0x1/.
rcu: blocking rcu_node structures (internal RCU debug):
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 1148 Comm: kworker/0:3 Not tainted 6.7.0-rc4-next-20231211-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/10/2023
Workqueue: events linkwatch_event
RIP: 0010:__sanitizer_cov_trace_pc+0x0/0x60 kernel/kcov.c:200
Code: 56 c1 dd 02 66 0f 1f 44 00 00 f3 0f 1e fa 48 8b be b0 01 00 00 e8 b0 ff ff ff 31 c0 c3 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 <f3> 0f 1e fa 65 48 8b 15 f4 9a 7b 7e 65 8b 05 f5 9a 7b 7e a9 00 01
RSP: 0018:ffffc90005447c38 EFLAGS: 00000087
RAX: ffff8880743b86a8 RBX: ffff888068bbc6a8 RCX: ffffffff887dd5c0
RDX: ffff888020ac3b80 RSI: ffffffff887dd463 RDI: 0000000000000001
RBP: dffffc0000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000003 R12: 00000000000000bd
R13: 0000000000000001 R14: ffff888068ba06a8 R15: ffff888068bbc6b0
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055f5683fd000 CR3: 0000000068b32000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <TASK>
 __linkwatch_run_queue+0x14b/0x460 net/core/link_watch.c:216
 linkwatch_event+0x8f/0xc0 net/core/link_watch.c:273
 process_one_work+0x8a4/0x15f0 kernel/workqueue.c:2633
 process_scheduled_works kernel/workqueue.c:2706 [inline]
 worker_thread+0x8b6/0x1290 kernel/workqueue.c:2787
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242
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

