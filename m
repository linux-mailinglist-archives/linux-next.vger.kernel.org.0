Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FC8212082
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 12:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgGBKCQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jul 2020 06:02:16 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:41946 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgGBKCP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2020 06:02:15 -0400
Received: by mail-io1-f70.google.com with SMTP id n3so17178058iob.8
        for <linux-next@vger.kernel.org>; Thu, 02 Jul 2020 03:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=I2TZiyWWg+x4g0ftnTY+ci49EZOdDdJP5dPgJjQJwsY=;
        b=mTZoFct6VF/xmHjQM1XcOAW+/PbAx4HDUA/nIaxMsAEn6r1oGaJxlT90x6wemHzeGw
         BNVAkj7yLRfAcpZ82DF19DwsE5ZdwD/elkNRFPOqJlpJvpRweTcwvroUhtxDu491KtCJ
         +varjwrTAEh1DLYDNATDSoxz/NQbGDYswYsI/3GDCXprrMKMKCWbaMOhh5HTXAgiSxJL
         Wqoi2msNe15eLP8d7RfRmTMbSxLIpoxYvx28Yv2oioLENuW6QiT7WD72UpMCzK/AbcsG
         1E1ayOrwtuZrtp7+80V7/C7Sqz/1L6YeEfb74VkA3aOFWI8VlAOO6mJ2NybFfyQUhRS4
         EH3Q==
X-Gm-Message-State: AOAM531B0XHvou8rZh858ouF++MHk1Iw/fGcS9UwIX+8RW9VqkiIdeuL
        SUQ1S4CNl3IgAwbmxpGK8MEKpex9q/jPPxz+AU2rQbmx+Lgb
X-Google-Smtp-Source: ABdhPJwWFsGZdUwNgwwL/ZmJRM0bbrRycFiGovtXtYUFJl3vRmUcVyotoaJKtU4bmn1JJjWjWZoSBiqDMEqogG9ysN5+HCIvwtaR
MIME-Version: 1.0
X-Received: by 2002:a6b:4409:: with SMTP id r9mr6501262ioa.158.1593684134778;
 Thu, 02 Jul 2020 03:02:14 -0700 (PDT)
Date:   Thu, 02 Jul 2020 03:02:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bcdeaa05a97280e4@google.com>
Subject: linux-next test error: KASAN: stack-out-of-bounds Read in bio_alloc_bioset
From:   syzbot <syzbot+bf04628c1f6179269b0b@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    d37d5704 Add linux-next specific files for 20200702
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1549d0a3100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a0a0972a399422ff
dashboard link: https://syzkaller.appspot.com/bug?extid=bf04628c1f6179269b0b
compiler:       gcc (GCC) 10.1.0-syz 20200507

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+bf04628c1f6179269b0b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: stack-out-of-bounds in bio_list_empty include/linux/bio.h:561 [inline]
BUG: KASAN: stack-out-of-bounds in bio_alloc_bioset+0x5b2/0x5d0 block/bio.c:482
Read of size 8 at addr ffffc90000fc7150 by task kworker/u4:4/169

CPU: 0 PID: 169 Comm: kworker/u4:4 Not tainted 5.8.0-rc3-next-20200702-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: writeback wb_workfn (flush-8:0)
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x436 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 bio_list_empty include/linux/bio.h:561 [inline]
 bio_alloc_bioset+0x5b2/0x5d0 block/bio.c:482
 bio_clone_fast+0x21/0x1b0 block/bio.c:710
 bio_split+0xc7/0x2c0 block/bio.c:1477
 blk_bio_segment_split block/blk-merge.c:281 [inline]
 __blk_queue_split+0x10e2/0x1650 block/blk-merge.c:331
 blk_mq_submit_bio+0x1b0/0x1760 block/blk-mq.c:2169
 __submit_bio_noacct_mq block/blk-core.c:1181 [inline]
 submit_bio_noacct+0xc9e/0x12d0 block/blk-core.c:1214
 submit_bio+0x263/0x5b0 block/blk-core.c:1284
 ext4_io_submit fs/ext4/page-io.c:382 [inline]
 io_submit_add_bh fs/ext4/page-io.c:423 [inline]
 ext4_bio_write_page+0x9a8/0x1c27 fs/ext4/page-io.c:550
 mpage_submit_page+0x140/0x2c0 fs/ext4/inode.c:2082
 mpage_map_and_submit_buffers fs/ext4/inode.c:2330 [inline]
 mpage_map_and_submit_extent fs/ext4/inode.c:2469 [inline]
 ext4_writepages+0x237e/0x3960 fs/ext4/inode.c:2782
 do_writepages+0xec/0x290 mm/page-writeback.c:2352
 __writeback_single_inode+0x125/0x1400 fs/fs-writeback.c:1461
 writeback_sb_inodes+0x53d/0xf40 fs/fs-writeback.c:1721
 __writeback_inodes_wb+0xc6/0x280 fs/fs-writeback.c:1790
 wb_writeback+0x8bb/0xd40 fs/fs-writeback.c:1896
 wb_check_background_flush fs/fs-writeback.c:1964 [inline]
 wb_do_writeback fs/fs-writeback.c:2052 [inline]
 wb_workfn+0xb20/0x13e0 fs/fs-writeback.c:2080
 process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
 kthread+0x3b5/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294


addr ffffc90000fc7150 is located in stack of task kworker/u4:4/169 at offset 80 in frame:
 arch_atomic64_read arch/x86/include/asm/atomic64_64.h:22 [inline]
 arch_atomic64_fetch_add_unless include/linux/atomic-arch-fallback.h:2195 [inline]
 arch_atomic64_add_unless include/linux/atomic-arch-fallback.h:2220 [inline]
 arch_atomic64_inc_not_zero include/linux/atomic-arch-fallback.h:2236 [inline]
 atomic64_inc_not_zero include/asm-generic/atomic-instrumented.h:1609 [inline]
 atomic_long_inc_not_zero include/asm-generic/atomic-long.h:497 [inline]
 percpu_ref_tryget_live include/linux/percpu-refcount.h:282 [inline]
 submit_bio_noacct+0x0/0x12d0 block/blk-core.c:433

this frame has 3 objects:
 [32, 40) 'bio'
 [64, 80) 'bio_list'
 [96, 128) 'bio_list_on_stack'

Memory state around the buggy address:
 ffffc90000fc7000: 00 00 00 f2 f2 f2 00 00 00 00 00 f3 f3 f3 f3 f3
 ffffc90000fc7080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90000fc7100: f1 f1 f1 f1 00 f2 f2 f2 00 00 f2 f2 00 00 00 00
                                                 ^
 ffffc90000fc7180: f3 f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90000fc7200: 00 00 00 f1 f1 f1 f1 00 f2 f2 f2 00 00 00 00 f3
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
