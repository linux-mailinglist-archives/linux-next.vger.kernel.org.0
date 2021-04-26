Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976FD36BAC5
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 22:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241771AbhDZUiA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 16:38:00 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:51915 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238112AbhDZUh7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Apr 2021 16:37:59 -0400
Received: by mail-io1-f72.google.com with SMTP id 5-20020a6b14050000b02903f01f27777eso19966018iou.18
        for <linux-next@vger.kernel.org>; Mon, 26 Apr 2021 13:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=gD0jePeeRSuW3Us7tJA17C2eKRmazht2OsZnhiR008g=;
        b=ZBhBOGD4Z4wgt7LgARjF+amC4mw2Pc2R77Gl/nRBXBsw+ds6Y3y2c5Qon+cutylk2y
         m3XtUhnwrAPlpi25trmSnkDvBeDoHw3wums6KFfTxZKLNhZ7YMRe+w/I5jtOyqfAP/eg
         Ezl2wNxYnnQDlOi6rH1wjGF4UL5puyact11GpMZrK3wA9NHZtBS2J0PmRD0LPeVSf/Wk
         cMGjGtRvu70MUXz0ZX5XqqzW6SJ86I6Vd8DOBMdzLuUIMEZSH1Rl6qdDgu/K8cJPH5em
         fv5m2xGtRR8sHo9uOHXF+SlMEbIlBOzCyZb1IVCpVNSDb0PRPH8u/aQ0ZturM9DXoCod
         BB0w==
X-Gm-Message-State: AOAM530b2S2yY8bu/yzhs6EQsMPlWRaiEACp+5p9C0MCbtapWv2DFKx1
        icvQHsi+FokKciXlXltQt+cbCtL+Wro4Xp5c/Cl97Ft0xHeA
X-Google-Smtp-Source: ABdhPJxmcKChZ8aU2DWkS8AvpQu4OvKO9n2rt9jxvTP2OwD1YA9e6tmmDV+ZyorD7ARAA9gOsIyEVPjDi2itWvt7Nw2jndkvU64O
MIME-Version: 1.0
X-Received: by 2002:a02:c908:: with SMTP id t8mr18533787jao.78.1619469437584;
 Mon, 26 Apr 2021 13:37:17 -0700 (PDT)
Date:   Mon, 26 Apr 2021 13:37:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008d4a9d05c0e61cb2@google.com>
Subject: [syzbot] linux-next boot error: general protection fault in bio_add_hw_page
From:   syzbot <syzbot+27916005c4a9d0d06bce@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    3f1fee3e Add linux-next specific files for 20210426
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12103059d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=286cd40bcb4d1f3a
dashboard link: https://syzkaller.appspot.com/bug?extid=27916005c4a9d0d06bce

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+27916005c4a9d0d06bce@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc00000000c5: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000628-0x000000000000062f]
CPU: 0 PID: 86 Comm: kworker/u4:2 Not tainted 5.12.0-next-20210426-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events_unbound async_run_entry_fn
RIP: 0010:bio_max_size block/bio.c:260 [inline]
RIP: 0010:bio_full include/linux/bio.h:124 [inline]
RIP: 0010:bio_full include/linux/bio.h:119 [inline]
RIP: 0010:bio_add_hw_page+0x198/0x830 block/bio.c:778
Code: 48 c1 e9 03 80 3c 01 00 0f 85 b1 05 00 00 48 b9 00 00 00 00 00 fc ff df 48 8b 43 08 48 8d b8 28 06 00 00 48 89 fe 48 c1 ee 03 <80> 3c 0e 00 0f 85 9d 05 00 00 48 8b 80 28 06 00 00 48 b9 00 00 00
RSP: 0000:ffffc900010cf6a8 EFLAGS: 00010206
RAX: 0000000000000000 RBX: ffff8880133ffc00 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 00000000000000c5 RDI: 0000000000000628
RBP: 0000000000000024 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff83b75207 R11: 0000000000000001 R12: 0000000000000000
R13: ffff88801b594560 R14: 0000000000000000 R15: ffffea00050de340
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000bc8e000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 bio_add_pc_page+0xb8/0x100 block/bio.c:812
 bio_map_kern block/blk-map.c:374 [inline]
 blk_rq_map_kern+0x2bd/0x750 block/blk-map.c:642
 __scsi_execute+0x4c1/0x600 drivers/scsi/scsi_lib.c:224
 scsi_execute_req include/scsi/scsi_device.h:462 [inline]
 scsi_probe_lun drivers/scsi/scsi_scan.c:610 [inline]
 scsi_probe_and_add_lun+0x521/0x34e0 drivers/scsi/scsi_scan.c:1104
 __scsi_scan_target+0x21f/0xdb0 drivers/scsi/scsi_scan.c:1578
 scsi_scan_channel drivers/scsi/scsi_scan.c:1666 [inline]
 scsi_scan_channel+0x148/0x1e0 drivers/scsi/scsi_scan.c:1642
 scsi_scan_host_selected+0x2df/0x3b0 drivers/scsi/scsi_scan.c:1695
 do_scsi_scan_host+0x1e8/0x260 drivers/scsi/scsi_scan.c:1834
 do_scan_async+0x3e/0x500 drivers/scsi/scsi_scan.c:1844
 async_run_entry_fn+0x9d/0x550 kernel/async.c:127
 process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:313
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
Modules linked in:
---[ end trace a9f7e41e48b80dca ]---
RIP: 0010:bio_max_size block/bio.c:260 [inline]
RIP: 0010:bio_full include/linux/bio.h:124 [inline]
RIP: 0010:bio_full include/linux/bio.h:119 [inline]
RIP: 0010:bio_add_hw_page+0x198/0x830 block/bio.c:778
Code: 48 c1 e9 03 80 3c 01 00 0f 85 b1 05 00 00 48 b9 00 00 00 00 00 fc ff df 48 8b 43 08 48 8d b8 28 06 00 00 48 89 fe 48 c1 ee 03 <80> 3c 0e 00 0f 85 9d 05 00 00 48 8b 80 28 06 00 00 48 b9 00 00 00
RSP: 0000:ffffc900010cf6a8 EFLAGS: 00010206
RAX: 0000000000000000 RBX: ffff8880133ffc00 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 00000000000000c5 RDI: 0000000000000628
RBP: 0000000000000024 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff83b75207 R11: 0000000000000001 R12: 0000000000000000
R13: ffff88801b594560 R14: 0000000000000000 R15: ffffea00050de340
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000bc8e000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
