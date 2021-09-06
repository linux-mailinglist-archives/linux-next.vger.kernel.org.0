Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5608C401700
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 09:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239999AbhIFHfb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 03:35:31 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:40920 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240098AbhIFHfa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 03:35:30 -0400
Received: by mail-il1-f200.google.com with SMTP id f13-20020a056e02168d00b002244a6aa233so3598997ila.7
        for <linux-next@vger.kernel.org>; Mon, 06 Sep 2021 00:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=q/HxcyVp5EucpM+deS8Qmk0RVkmU6A9Zygc+jRDfO4M=;
        b=CHjv6K7DahYQGgN95QiXvwHsWVvKWAwvW7F6o79k6ZkWGNytbC57OoAvjUXEzp37ks
         PKTjqsWQ12GtD2pEHSrxGapDlx489M/awouzYEOSC+Vemp6esu3x5DoQlCEB1BZrsBz8
         lqhZRjykl9I/APmle3q0WzsfDwRoqNYwSKkb/gHjhiK6nfNAPtKtVags3zmd/58CRy/y
         b6NZPJhT4rxilpif2f3NvNyL5d0Bv6JF+tEUYtuNb7JFyLv7OGgHOV8QVlbzzWN8U7H/
         y46Gy8lyc4Z4HbbJtNRQkBicW/bNMj4yh7RG29Jmg+qzhpAvYr5uLAsVmWl9SIgZmYos
         nm2g==
X-Gm-Message-State: AOAM530n1vFRgzg0r284VYlqLNmxlX/s44xFXFbcBcd5gZtiz3++0ibr
        V7d4jne+/Sqet7rCWPkddSUK03WrogRM2aBJmGCazDLcDZKz
X-Google-Smtp-Source: ABdhPJwk0S8mNpHUplWBQgaHA7FBhX6wsQXjT+tX0Q2vrtFri6lo7KZwjURNZczVpFSLE4Zjqnbdtyley6IpslTx3rcXOkEyAKDk
MIME-Version: 1.0
X-Received: by 2002:a02:bb16:: with SMTP id y22mr9711093jan.129.1630913666256;
 Mon, 06 Sep 2021 00:34:26 -0700 (PDT)
Date:   Mon, 06 Sep 2021 00:34:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bc92ac05cb4ead3e@google.com>
Subject: [syzbot] linux-next test error: KASAN: null-ptr-deref Read in fuse_conn_put
From:   syzbot <syzbot+b304e8cb713be5f9d4e1@syzkaller.appspotmail.com>
To:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, miklos@szeredi.hu,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    14c6345e6e6c Add linux-next specific files for 20210903
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=164460ed300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c17400330d618d71
dashboard link: https://syzkaller.appspot.com/bug?extid=b304e8cb713be5f9d4e1
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b304e8cb713be5f9d4e1@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read include/linux/instrumented.h:71 [inline]
BUG: KASAN: null-ptr-deref in atomic_read include/linux/atomic/atomic-instrumented.h:27 [inline]
BUG: KASAN: null-ptr-deref in fuse_conn_put fs/fuse/inode.c:827 [inline]
BUG: KASAN: null-ptr-deref in fuse_conn_put+0x1d7/0x300 fs/fuse/inode.c:814
Read of size 4 at addr 0000000000000000 by task syz-fuzzer/6540

CPU: 0 PID: 6540 Comm: syz-fuzzer Not tainted 5.14.0-next-20210903-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 __kasan_report mm/kasan/report.c:446 [inline]
 kasan_report.cold+0x66/0xdf mm/kasan/report.c:459
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:71 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:27 [inline]
 fuse_conn_put fs/fuse/inode.c:827 [inline]
 fuse_conn_put+0x1d7/0x300 fs/fuse/inode.c:814
 fuse_dev_free+0x155/0x1f0 fs/fuse/inode.c:1324
 fuse_dev_release+0x2a8/0x3f0 fs/fuse/dev.c:2205
 __fput+0x288/0x9f0 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:209
 __syscall_exit_to_user_mode_work kernel/entry/common.c:291 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:302
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4af19b
Code: fb ff eb bd e8 a6 b6 fb ff e9 61 ff ff ff cc e8 9b 82 fb ff 48 8b 7c 24 10 48 8b 74 24 18 48 8b 54 24 20 48 8b 44 24 08 0f 05 <48> 3d 01 f0 ff ff 76 20 48 c7 44 24 28 ff ff ff ff 48 c7 44 24 30
RSP: 002b:000000c0000ef430 EFLAGS: 00000206 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 000000c00001c000 RCX: 00000000004af19b
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 000000c0000ef470 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000009
R13: 0000000000000008 R14: 0000000000000200 R15: 000000c0003fe000
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
