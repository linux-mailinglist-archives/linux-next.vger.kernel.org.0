Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126FF614C9A
	for <lists+linux-next@lfdr.de>; Tue,  1 Nov 2022 15:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiKAObp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Nov 2022 10:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiKAObo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Nov 2022 10:31:44 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4591B9E5
        for <linux-next@vger.kernel.org>; Tue,  1 Nov 2022 07:31:42 -0700 (PDT)
Received: by mail-io1-f70.google.com with SMTP id l9-20020a5d8f89000000b006bd33712128so11362605iol.17
        for <linux-next@vger.kernel.org>; Tue, 01 Nov 2022 07:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ygs0mKB1fjLyPQ63+4R+BXiguqPULsbpNgbQj+PvuGA=;
        b=WjfB4H8+u45NF3X/sWjnr3nHWO1tcWAs07XbUCqJQQ4nVoKPMDr7qI8xqsuxUw8kuL
         YRpL8/HmjfmGi8KcZouU1w7uzvFGaUQZYJoXUPX9JiyA2ilC5FhV2zXB57GDDUuoScx0
         AgG/BArWNOsalfLaGRhfDWIRqI7HXxC1/4IPo45eHeV+DvjJackoEn5ErMnXs4nxJPKD
         tqGKYz/63BwjNhYk86cS2DRQfJeqcISYiFAXCQ4Q/Ddxa5Ot2UWtJcdBzDYWDRTZqEvY
         AXaQMYRj8GdAf0LXVetkgdbHNBUSmZ1kke37Q67wdIDiGA9dU8vGj13AFilAeL7Us1nc
         6Rvg==
X-Gm-Message-State: ACrzQf3yzgJqENe8dChPVn/QGSU2bl386ENlV3TdRxgusWzgBoMoaBld
        Du8BzImZ6DwTTltSPwhMwFLUdMSEtLxXPKFr6KiDGzLIQv51
X-Google-Smtp-Source: AMsMyM6WI4uwOOvmwdAIslkJA7NhvLNZ7L/ZugYyrOs8ZfxMwj/8yj0ztJhRIjuctd9O8DpBgJ3mRj4rJt3Gh70x6Su6deYJWzJN
MIME-Version: 1.0
X-Received: by 2002:a05:6638:517:b0:375:16d:446b with SMTP id
 i23-20020a056638051700b00375016d446bmr11807404jar.86.1667313101928; Tue, 01
 Nov 2022 07:31:41 -0700 (PDT)
Date:   Tue, 01 Nov 2022 07:31:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002b83bf05ec699567@google.com>
Subject: [syzbot] linux-next boot error: BUG: unable to handle kernel paging
 request in corrupted
From:   syzbot <syzbot+4d9bcd45d5ca0a476cf7@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    e9d267f752f8 Add linux-next specific files for 20221101
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13c8fdb6880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d67fcb6fc8245f
dashboard link: https://syzkaller.appspot.com/bug?extid=4d9bcd45d5ca0a476cf7
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a6c3145cf385/disk-e9d267f7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3f34d7fed0ff/vmlinux-e9d267f7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/279836b50e84/bzImage-e9d267f7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4d9bcd45d5ca0a476cf7@syzkaller.appspotmail.com

floppy0: no floppy controllers found
work still pending
BUG: unable to handle page fault for address: ffffed1018000000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 23ffee067 P4D 23ffee067 PUD 13fff5067 PMD 0 
Oops: 0002 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 11 Comm: kworker/u4:1 Not tainted 6.1.0-rc3-next-20221101-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/11/2022
Workqueue: events_unbound async_run_entry_fn
RIP: 0010:memset_orig-0x7/0xb0
Code: c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 f3 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 <f3> aa 4c 89 c8 c3 90 49 89 fa 40 0f b6 ce 48 b8 01 01 01 01 01 01
RSP: 0000:ffffc90000107a48 EFLAGS: 00010287
RAX: dffffc0000000000 RBX: ffff88801cd34100 RCX: fffff11014430738
RDX: fffff11028a89f18 RSI: 0000000000000000 RDI: ffffed1018000000
RBP: ffff88814544f8c0 R08: 0000000000000005 R09: ffffed10039a6820
R10: 0000000000000001 R11: 0000000000000000 R12: ffffffff81a702a0
R13: ffff88814544f8c0 R14: 0000000000000007 R15: ffff88801cd34100
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffed1018000000 CR3: 000000000bc8e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 kasan_unpoison mm/kasan/shadow.c:138 [inline]
 kasan_unpoison+0x40/0x70 mm/kasan/shadow.c:115
 kasan_unpoison_range include/linux/kasan.h:112 [inline]
 kasan_unpoison_element mm/mempool.c:115 [inline]
 remove_element mm/mempool.c:134 [inline]
 mempool_exit+0x1c4/0x320 mm/mempool.c:153
 bioset_exit+0x2d3/0x640 block/bio.c:1655
 disk_release+0x143/0x480 block/genhd.c:1169
 device_release+0x9f/0x240 drivers/base/core.c:2330
 kobject_cleanup lib/kobject.c:673 [inline]
 kobject_release lib/kobject.c:704 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1be/0x4c0 lib/kobject.c:721
 put_device+0x1b/0x30 drivers/base/core.c:3624
 blk_mark_disk_dead-0xf/0x60
 do_floppy_init drivers/block/floppy.c:4756 [inline]
 floppy_async_init+0x2169/0x21ca drivers/block/floppy.c:4765
 async_run_entry_fn+0x98/0x530 kernel/async.c:127
 process_one_work+0x9bf/0x1710 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>
Modules linked in:
CR2: ffffed1018000000
---[ end trace 0000000000000000 ]---
RIP: 0010:memset_orig-0x7/0xb0
Code: c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 f3 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 <f3> aa 4c 89 c8 c3 90 49 89 fa 40 0f b6 ce 48 b8 01 01 01 01 01 01
RSP: 0000:ffffc90000107a48 EFLAGS: 00010287
RAX: dffffc0000000000 RBX: ffff88801cd34100 RCX: fffff11014430738
RDX: fffff11028a89f18 RSI: 0000000000000000 RDI: ffffed1018000000
RBP: ffff88814544f8c0 R08: 0000000000000005 R09: ffffed10039a6820
R10: 0000000000000001 R11: 0000000000000000 R12: ffffffff81a702a0
R13: ffff88814544f8c0 R14: 0000000000000007 R15: ffff88801cd34100
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffed1018000000 CR3: 000000000bc8e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	c1 e9 03             	shr    $0x3,%ecx
   3:	40 0f b6 f6          	movzbl %sil,%esi
   7:	48 b8 01 01 01 01 01 	movabs $0x101010101010101,%rax
   e:	01 01 01
  11:	48 0f af c6          	imul   %rsi,%rax
  15:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  18:	89 d1                	mov    %edx,%ecx
  1a:	f3 aa                	rep stos %al,%es:(%rdi)
  1c:	4c 89 c8             	mov    %r9,%rax
  1f:	c3                   	retq
  20:	90                   	nop
  21:	49 89 f9             	mov    %rdi,%r9
  24:	40 88 f0             	mov    %sil,%al
  27:	48 89 d1             	mov    %rdx,%rcx
* 2a:	f3 aa                	rep stos %al,%es:(%rdi) <-- trapping instruction
  2c:	4c 89 c8             	mov    %r9,%rax
  2f:	c3                   	retq
  30:	90                   	nop
  31:	49 89 fa             	mov    %rdi,%r10
  34:	40 0f b6 ce          	movzbl %sil,%ecx
  38:	48                   	rex.W
  39:	b8 01 01 01 01       	mov    $0x1010101,%eax
  3e:	01 01                	add    %eax,(%rcx)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
