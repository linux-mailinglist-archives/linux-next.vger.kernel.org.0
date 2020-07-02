Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0122F2125E0
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 16:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbgGBOOv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jul 2020 10:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729793AbgGBOOu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2020 10:14:50 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1257C08C5DD
        for <linux-next@vger.kernel.org>; Thu,  2 Jul 2020 07:14:49 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id k18so25723453qke.4
        for <linux-next@vger.kernel.org>; Thu, 02 Jul 2020 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RzUm9VxzKzkIyvUG74YkClh+nm0piu2thkPG5KLlZEQ=;
        b=Ova5dqxpfnBaFgc4ydCLeIXoIr2iQY4e2CQEU/16yply0i1tuSiMVsJnRmHmQk2vLb
         B3ynzsnj+3K7gWz9NTLsyaCtF5fOY9X3zpjyrsL3bYmxf/+ggZR+IkdSOtouWsJ1KzCF
         p2EMYvJwm19KH5XHMd1CbvkLHi4aEJrr/x8UAUioRnbiZ318SAPsLPlZRLHNWoXprOF1
         sdyerZrfpBvqntATvILWadp4vrpvVdZVexhi59pLJ2fYt7IO6BcM1YHn2262s1TT72sG
         xZwDKtKXXCQTDquIv1Q/xJaNezOgEMxVNV4f/kXOsyIXx41olLDJXWCw8x2zsKb9KMZb
         5B3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RzUm9VxzKzkIyvUG74YkClh+nm0piu2thkPG5KLlZEQ=;
        b=lGzG/LGcz/U6dH0lrmeqfQ3yeUcQjPYQ+tW1ekf0DGA/ZQ+2REg3Zi5vLAdP73l9nI
         bW+Rvg8XpH7iEbY+qO0gAeMFA2WguvgxgfHsWSvFELH2E2jcfJiV7BvLfRIqQE7Y4T9h
         Wq6/ZkROroCggDYB/RqDcMzCzAg+yL90R6F24TBsdPYx0/vlQ38yxUxxDockuVSGnywN
         t+zlJ7bjCHUQVxvDFtch9wjezP/PlcWGxcXv9oDHosFtR+bk8At4kPxC22l3R+rPVjBe
         k2w9b798pvM7ajXI82E2o1VbZE1JZdV0ir0scFOc7yY64lQ9BW6VaOuIe0RTtyWruALX
         cR4A==
X-Gm-Message-State: AOAM533aC3r9iDutjGord8TqPqnmdsvsCdVY6ikqdc9CKheim0sO/cNJ
        9ymY/PwX8kvu5MZRsgNZwyMIKw==
X-Google-Smtp-Source: ABdhPJxyfLrupSaU78RF5M1IjPeTSU911dUpEP27iP/ObDC4UnJ0McTslyCZcGDuU/8JiL2gHmGXiQ==
X-Received: by 2002:a05:620a:81c:: with SMTP id s28mr28901165qks.133.1593699288771;
        Thu, 02 Jul 2020 07:14:48 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id y40sm9042248qtc.29.2020.07.02.07.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:14:48 -0700 (PDT)
Date:   Thu, 2 Jul 2020 10:14:37 -0400
From:   Qian Cai <cai@lca.pw>
To:     syzbot <syzbot+bf04628c1f6179269b0b@syzkaller.appspotmail.com>
Cc:     axboe@kernel.dk, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Subject: Re: linux-next test error: KASAN: stack-out-of-bounds Read in
 bio_alloc_bioset
Message-ID: <20200702141437.GA4240@lca.pw>
References: <000000000000bcdeaa05a97280e4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000bcdeaa05a97280e4@google.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 02, 2020 at 03:02:14AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    d37d5704 Add linux-next specific files for 20200702
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=1549d0a3100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a0a0972a399422ff
> dashboard link: https://syzkaller.appspot.com/bug?extid=bf04628c1f6179269b0b
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+bf04628c1f6179269b0b@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: stack-out-of-bounds in bio_list_empty include/linux/bio.h:561 [inline]
> BUG: KASAN: stack-out-of-bounds in bio_alloc_bioset+0x5b2/0x5d0 block/bio.c:482
> Read of size 8 at addr ffffc90000fc7150 by task kworker/u4:4/169

I can also reproduce this. It needs to revert 3 commits,

https://lore.kernel.org/lkml/20200702141001.GA3834@lca.pw/

> 
> CPU: 0 PID: 169 Comm: kworker/u4:4 Not tainted 5.8.0-rc3-next-20200702-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: writeback wb_workfn (flush-8:0)
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x18f/0x20d lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0x5/0x436 mm/kasan/report.c:383
>  __kasan_report mm/kasan/report.c:513 [inline]
>  kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
>  bio_list_empty include/linux/bio.h:561 [inline]
>  bio_alloc_bioset+0x5b2/0x5d0 block/bio.c:482
>  bio_clone_fast+0x21/0x1b0 block/bio.c:710
>  bio_split+0xc7/0x2c0 block/bio.c:1477
>  blk_bio_segment_split block/blk-merge.c:281 [inline]
>  __blk_queue_split+0x10e2/0x1650 block/blk-merge.c:331
>  blk_mq_submit_bio+0x1b0/0x1760 block/blk-mq.c:2169
>  __submit_bio_noacct_mq block/blk-core.c:1181 [inline]
>  submit_bio_noacct+0xc9e/0x12d0 block/blk-core.c:1214
>  submit_bio+0x263/0x5b0 block/blk-core.c:1284
>  ext4_io_submit fs/ext4/page-io.c:382 [inline]
>  io_submit_add_bh fs/ext4/page-io.c:423 [inline]
>  ext4_bio_write_page+0x9a8/0x1c27 fs/ext4/page-io.c:550
>  mpage_submit_page+0x140/0x2c0 fs/ext4/inode.c:2082
>  mpage_map_and_submit_buffers fs/ext4/inode.c:2330 [inline]
>  mpage_map_and_submit_extent fs/ext4/inode.c:2469 [inline]
>  ext4_writepages+0x237e/0x3960 fs/ext4/inode.c:2782
>  do_writepages+0xec/0x290 mm/page-writeback.c:2352
>  __writeback_single_inode+0x125/0x1400 fs/fs-writeback.c:1461
>  writeback_sb_inodes+0x53d/0xf40 fs/fs-writeback.c:1721
>  __writeback_inodes_wb+0xc6/0x280 fs/fs-writeback.c:1790
>  wb_writeback+0x8bb/0xd40 fs/fs-writeback.c:1896
>  wb_check_background_flush fs/fs-writeback.c:1964 [inline]
>  wb_do_writeback fs/fs-writeback.c:2052 [inline]
>  wb_workfn+0xb20/0x13e0 fs/fs-writeback.c:2080
>  process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
>  kthread+0x3b5/0x4a0 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> 
> 
> addr ffffc90000fc7150 is located in stack of task kworker/u4:4/169 at offset 80 in frame:
>  arch_atomic64_read arch/x86/include/asm/atomic64_64.h:22 [inline]
>  arch_atomic64_fetch_add_unless include/linux/atomic-arch-fallback.h:2195 [inline]
>  arch_atomic64_add_unless include/linux/atomic-arch-fallback.h:2220 [inline]
>  arch_atomic64_inc_not_zero include/linux/atomic-arch-fallback.h:2236 [inline]
>  atomic64_inc_not_zero include/asm-generic/atomic-instrumented.h:1609 [inline]
>  atomic_long_inc_not_zero include/asm-generic/atomic-long.h:497 [inline]
>  percpu_ref_tryget_live include/linux/percpu-refcount.h:282 [inline]
>  submit_bio_noacct+0x0/0x12d0 block/blk-core.c:433
> 
> this frame has 3 objects:
>  [32, 40) 'bio'
>  [64, 80) 'bio_list'
>  [96, 128) 'bio_list_on_stack'
> 
> Memory state around the buggy address:
>  ffffc90000fc7000: 00 00 00 f2 f2 f2 00 00 00 00 00 f3 f3 f3 f3 f3
>  ffffc90000fc7080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >ffffc90000fc7100: f1 f1 f1 f1 00 f2 f2 f2 00 00 f2 f2 00 00 00 00
>                                                  ^
>  ffffc90000fc7180: f3 f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
>  ffffc90000fc7200: 00 00 00 f1 f1 f1 f1 00 f2 f2 f2 00 00 00 00 f3
> ==================================================================
> 
> 
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
