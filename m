Return-Path: <linux-next+bounces-5136-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68880A089F5
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 09:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72790166D5B
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 08:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FD72080EC;
	Fri, 10 Jan 2025 08:23:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA2207A2C
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497407; cv=none; b=fixZDqZCt8HhvTjL+l1OAJMcM+figiYTba1e/3i9N2Q5ks0g23Mkbze6gwPxcd2RL1um3qk4VyRo0SSOYWGDR8kicgR9VMueHFPMiGsmWUswHnMsPy2QQlsYkk7hzGLPAT/c37Pg+EzKng57VDm1HKVN9nDfJMXyiys8sioteRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497407; c=relaxed/simple;
	bh=vQUga7wN9sYJzr3zmj0FALDqzd7npC1fdeHaJKrSM/k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=N/NFDZ7iJ8z7hnHC7ebb1aDqOV7SS+KB3Mp0JK34lUpuv9ZKVKQvwiLeXB/S8A/L2IOUWBT37kUl217IU6DnBU+kfYxOhk6ekZBMQr84gDrpEm+kjkhdno6u0brLXgfg4KISKV0jiwXk/cF8ix6Ed97Js2GnW0nnXDZ5BsWRwMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3a9cd0b54c1so15264525ab.0
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 00:23:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736497404; x=1737102204;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U7/4FL8kYgI9lR5zgsufPl1DLX3WKUBwumIMlSOsROw=;
        b=LK1+OrghVvfFupVKfRghD9sutIvjSgNbVNuP8BjC36kqrbDFElz3xDLWXkTHU02nBJ
         GF5BWrEMlAtEUFEjxUs8HBDwy0Q3XVmwl9cWJ2se2RGGTPq+MZUyB3uY15pje77RWQqi
         LfdvxA/Y5LSARlxyBct525A2r/kiHIq+yOCHl7IV/e94ZLPDDR02lM7og0jSoqB2s5gt
         ogXK6xwSoLM5EiC/uk9kJNykywhylXmxLiCR/cYk56N8pBGiZzdF1sNIip/r6EIrLrqy
         ErJ3713+K+i/K651jC5Eso7sDpOmX3s2tlk48s0spsjfozlUShfy+nzwqg/zu6mkM6A4
         nNPw==
X-Forwarded-Encrypted: i=1; AJvYcCWBBRBunjrOtcJMvjUOhKukrVFNcNBBs3kK7riRuoVOHWC8O9t9UuWJQiolbR1hB75QvBJanxJMl2Rd@vger.kernel.org
X-Gm-Message-State: AOJu0YzAH5S6wYUK+hO4AAd4ifVh6ICuNspSB8YiwbaTapIjBUa+4DRh
	vj8eTtoXV+Ky7GPSv+C+u7zkXshWoc5pEOqSq+F2orO7omwTM3lRhul0i8JwyKOLEsYX0Uywmf2
	0Zoq4+uCQkSFNdvexaGfXNwKV7wYbPMPje/pKApWB4Q4SUcR4ak0YDBM=
X-Google-Smtp-Source: AGHT+IGiEisFy5AALA/WHz0VYuKf3GPKTEwvQU0nNGmRSyfxvhShzQ+T/Fipyba0aakq2Jz/21+EEmJ5PIkFi9tkQmjU/v7ydBKD
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18cc:b0:3a7:1c73:e18e with SMTP id
 e9e14a558f8ab-3ce3a8e0a69mr82024215ab.21.1736497404462; Fri, 10 Jan 2025
 00:23:24 -0800 (PST)
Date: Fri, 10 Jan 2025 00:23:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6780d8fc.050a0220.d0267.0026.GAE@google.com>
Subject: [syzbot] [mm?] linux-next test error: WARNING in enable_work
From: syzbot <syzbot+722a07ef96b37455090d@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4e16367cfe0c Add linux-next specific files for 20250106
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=143344b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ab790aab796d34a9
dashboard link: https://syzkaller.appspot.com/bug?extid=722a07ef96b37455090d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/403cb64e30da/disk-4e16367c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ccd3dbdc32f4/vmlinux-4e16367c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/32256ded47b5/bzImage-4e16367c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+722a07ef96b37455090d@syzkaller.appspotmail.com

------------[ cut here ]------------
workqueue: work disable count underflowed
WARNING: CPU: 1 PID: 22 at kernel/workqueue.c:4317 work_offqd_enable kernel/workqueue.c:4317 [inline]
WARNING: CPU: 1 PID: 22 at kernel/workqueue.c:4317 enable_work+0x34d/0x360 kernel/workqueue.c:4488
Modules linked in:
CPU: 1 UID: 0 PID: 22 Comm: cpuhp/1 Not tainted 6.13.0-rc5-next-20250106-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:work_offqd_enable kernel/workqueue.c:4317 [inline]
RIP: 0010:enable_work+0x34d/0x360 kernel/workqueue.c:4488
Code: d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc e8 08 69 37 00 c6 05 e3 0b 7d 0e 01 90 48 c7 c7 80 d7 09 8c e8 74 23 f8 ff 90 <0f> 0b 90 90 e9 56 ff ff ff e8 a5 6a 6a 0a 0f 1f 44 00 00 90 90 90
RSP: 0000:ffffc900001c7b20 EFLAGS: 00010046
RAX: c75b2868096bc700 RBX: 0000000000000000 RCX: ffff88801d683c00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900001c7be8 R08: ffffffff817ff732 R09: 1ffffffff1cfa188
R10: dffffc0000000000 R11: fffffbfff1cfa189 R12: 1ffff92000038f68
R13: 1ffff92000038f70 R14: 001fffffffc00001 R15: ffff8880b87383f0
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000e736000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vmstat_cpu_online+0xbb/0xe0 mm/vmstat.c:2151
 cpuhp_invoke_callback+0x48d/0x830 kernel/cpu.c:194
 cpuhp_thread_fun+0x41c/0x810 kernel/cpu.c:1103
 smpboot_thread_fn+0x544/0xa30 kernel/smpboot.c:164
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
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

