Return-Path: <linux-next+bounces-3123-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B40EF93B66D
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 20:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DDAD1F23B37
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 18:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8777F16848C;
	Wed, 24 Jul 2024 18:05:24 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB20616A94B
	for <linux-next@vger.kernel.org>; Wed, 24 Jul 2024 18:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721844324; cv=none; b=sI9599CmatavlOJPjlAzHCIBRi3RNm/EFleiCoEa87Od0oBsmGkXDbZf17R2grRYD18JQso21MQVFBzLQryNum5wp5vpKXpyQtMD87C3VAQRgvGBFS1L9+fQ5KMMC7nDHfg/CKja4+qYN+jDk9ZVwVpKgF8PqTt5/+2C9FPGvSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721844324; c=relaxed/simple;
	bh=VzXjMp5k+SPFdRYrl5RM7T8PgFtw64yuGJ/Ri6DT0gk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jWq/jZrmNv7kRlnQLrSRtxZ/iHyMOUhJScsMlXpBu9bVBJnc5sMu8Xs7A+jEpopA9dBQChUgU6JKsiJhcjLZgvjEnaa4qXvhdDYg1D6Fho1WAcNCtd1PvJyFetHinCBeY6bntMXrGT8tahQIX4b+KvTsAYF3nEX8zwO4/D4/RuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-39915b8e08dso267315ab.0
        for <linux-next@vger.kernel.org>; Wed, 24 Jul 2024 11:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721844322; x=1722449122;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPKB0U44LTcI9V9+hT91gpV1G96u0YLiKeqsF+lrKL4=;
        b=c0SDZ9tgrj20O8yoGjo3mQWHtSMi6FmIPPG0FIekTewFy8G/AupWOrD3VP8b/uJfnU
         MnVdkp1gmhWwOwLBKzmldXWbLo1eqxpi6Q+rZldZFkZ9PNQYDfI6BAXd3YJEUMLUmXIT
         MHIeXGk25Ut23zkwcQhfh2FBaQgriz0MtcsPOFbyK/Nff7jmiCi+VwoXOu+XWqda6/tC
         xpQSKFnRiItZPPUpHIsLvT7muUBGbqoPe6aRKsJ2Aw0KBMW2tuaK0frQ1kl1+dsmx+Fy
         cvSLHcpMadqHB6pg5Vib8XIj8ig89L6mHRd/+kxPs7sCNeQN8C4y3DI4H1qOEYYn1U99
         3uhw==
X-Forwarded-Encrypted: i=1; AJvYcCVQCZ35bYpuixGPk2FXbFbmL8NUnpc73YbAZUetWwWq0nR88i91XvwGgLJYcFnHy4kLOhxdkdbbo5GDxGBog3Qzet/Hxwg84Xj4hA==
X-Gm-Message-State: AOJu0Yxkgh7S2J48jvMWnphNWCmzPIjFcPLbj08PV0bF6Wu+CpAsllnj
	wC9jctatiCtNnxAp5OayJk7fRThdB3Bdk9p2E1uwmo8euDPXApRMns2NqikN8JQ2sADih3F+82l
	lwAHn+MgvD3fJvMLW3GftsRHTISUQmu1Ap9bgbt7HV+2vy/CX8PtQgfY=
X-Google-Smtp-Source: AGHT+IH+SHw1L7YMCevrbrS68LEDfViTtLn66nb9T+7uxh/T8P0ozsNHCaZXvPBDD3L0OZw+PdG78HFQMRgVRGYEPyFLchhLLifG
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c89:b0:39a:1b94:9733 with SMTP id
 e9e14a558f8ab-39a217cc2fbmr424805ab.2.1721844321987; Wed, 24 Jul 2024
 11:05:21 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:05:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002bbff4061e021f01@google.com>
Subject: [syzbot] [kernel?] linux-next test error: WARNING in tmigr_cpu_prepare
From: syzbot <syzbot+198e5d62f814bce1e600@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2347b4c79f5e Add linux-next specific files for 20240723
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10d8ad3d980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=befe10ad51f9f2bb
dashboard link: https://syzkaller.appspot.com/bug?extid=198e5d62f814bce1e600
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9ccc2b0cb372/disk-2347b4c7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/469c95cf67be/vmlinux-2347b4c7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/25b4013add8e/bzImage-2347b4c7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+198e5d62f814bce1e600@syzkaller.appspotmail.com

smpboot: CPU0: Intel(R) Xeon(R) CPU @ 2.20GHz (family: 0x6, model: 0x4f, stepping: 0x0)
Running RCU Tasks wait API self tests
Running RCU Tasks Trace wait API self tests
Performance Events: unsupported p6 CPU model 79 no PMU driver, software events only.
signal: max sigframe size: 1776
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 1000.
Timer migration: 1 hierarchy levels; 8 children per group; 0 crossnode level
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at kernel/time/timer_migration.c:1714 tmigr_cpu_prepare+0x10e4/0x1330 kernel/time/timer_migration.c:1714
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.10.0-next-20240723-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
RIP: 0010:tmigr_cpu_prepare+0x10e4/0x1330 kernel/time/timer_migration.c:1714
Code: 0d 00 e9 41 fe ff ff e8 ea d3 0d 00 e9 37 fe ff ff 80 3d 81 ea 13 0e 01 75 26 e8 d7 d3 0d 00 e9 24 fe ff ff e8 cd d3 0d 00 90 <0f> 0b 90 e9 a8 ef ff ff e8 bf d3 0d 00 90 0f 0b 90 e9 6e ff ff ff
RSP: 0000:ffffc900000676f0 EFLAGS: 00010293
RAX: ffffffff8185f723 RBX: 0000000000000000 RCX: ffff8880172a8000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff8880b942d2a0 R08: ffffffff8185e6c6 R09: 1ffffffff1f5f34d
R10: dffffc0000000000 R11: ffffffff8185e640 R12: dffffc0000000000
R13: 0000000000000040 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000e134000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 cpuhp_invoke_callback+0x48d/0x830 kernel/cpu.c:194
 cpuhp_issue_call+0x46f/0x7e0
 __cpuhp_setup_state_cpuslocked+0x464/0x730 kernel/cpu.c:2505
 __cpuhp_setup_state+0x3f/0x60 kernel/cpu.c:2534
 cpuhp_setup_state include/linux/cpuhotplug.h:277 [inline]
 tmigr_init+0x231/0x2a0 kernel/time/timer_migration.c:1794
 do_one_initcall+0x248/0x880 init/main.c:1267
 do_pre_smp_initcalls+0x57/0xa0 init/main.c:1373
 kernel_init_freeable+0x40d/0x5d0 init/main.c:1567
 kernel_init+0x1d/0x2b0 init/main.c:1467
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:144
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
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

