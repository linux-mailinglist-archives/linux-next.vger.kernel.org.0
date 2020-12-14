Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884782D95D5
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 11:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgLNKHF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 05:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728795AbgLNKGx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 05:06:53 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76B1C0613CF
        for <linux-next@vger.kernel.org>; Mon, 14 Dec 2020 02:06:12 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id w1so17071958ejf.11
        for <linux-next@vger.kernel.org>; Mon, 14 Dec 2020 02:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Dfpl+xnnZL7cARepjaVYRTkVhQ5rwhvYyRNzWC4tl3A=;
        b=ynvDNYUfBU55Zg9TysabJIl3Dc0fwoyuCofmuwAtSQNRUAANmV/n6+LoXO5k1gChAL
         xLKGdOZTEDk0Jvk9zgKdYcRo2eSSe4PPsBliD+EmAQouBdfilOCKwI0Y1T/Pm+xuOYMT
         JGLzts6OG6jpDZ3RAIPkU4ucHfPRqetwv7d0rr28N0nWPxtYJN1on/9O6p1D177lHQWv
         6MtSsYXEcM/ZPnOPF3C8fhbbGTwyEBEmyVqdsTN4jyilXgpQzrugvSJumB1Hlyj7fgHK
         chUqOGfy8Tl6Wr8DWGVgUbf+zNvhzK+zU/20YYf5jejTl65d8QaO7fQG7LEG3OeWUkzX
         /FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Dfpl+xnnZL7cARepjaVYRTkVhQ5rwhvYyRNzWC4tl3A=;
        b=WCP8vPMTn0WGkE6ayFXer4HGpwe1lQBvHySWkxGQz2yUSDMOYfGfheeGUGX14MOOtK
         guOd/YzIQ8/Xvsux/luVR5i451LAymmTrmnKVkG2UUuvmp5c9MzlIlbXdrYb0DkB9yfI
         pGgM+n0JeXNkkIVUH8z36JIFdp2rusT8K8IhKWe3fDXidC0Sk04Qju/3XOlduFKTdH7k
         +gymOnZjD7D7UAskkWeON0Qs9pAvvIDX2z6VqCR/lXJirOkDydL1SGaq7ctTuJWkxuq7
         k+TCASYyrw4pRitrK3+OYjZ65jSvHFQrOG6L5FxBtjjl6pCQniTSzOX6Gtx4n9WbM79I
         oc+A==
X-Gm-Message-State: AOAM531KfQf3XP4lDAaHM1a6VvCItTHFyc8i89M0QTp5/hWcVuzrnt4v
        fhvjwY5yrbw8AekC06Y9mh9UvsiQUzJ+ev2OoTRnTA==
X-Google-Smtp-Source: ABdhPJw2k1mH0g39BdAK2gt/uF21MLLz1jwTyxgis2Oy6Hn0KozO8VLTJGVa3OOtK0C38gX7cdyZlCJVwRJXVjCq24w=
X-Received: by 2002:a17:906:edc8:: with SMTP id sb8mr22090008ejb.247.1607940371408;
 Mon, 14 Dec 2020 02:06:11 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 14 Dec 2020 15:35:58 +0530
Message-ID: <CA+G9fYthX8_TmqjDXWRMhi+QHrBtSTDPtyiAmDapEgEvo5bLsg@mail.gmail.com>
Subject: BUG: KASAN: slab-out-of-bounds in swiotlb_tbl_sync_single
To:     ommu@lists.linux-foundation.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Lu Baolu <baolu.lu@linux.intel.com>, konrad.wilk@oracle.com,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While booting qemu_x86_64 KASAN enabled kernel version 5.10.0-rc7-next-20201211
the following kernel BUG reported.
This bug reproduced 3 times out of 14 runs.

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20201211
  make_kernelversion: 5.10.0-rc7
  kernel-config: https://builds.tuxbuild.com/1lVdrFbcgado8oNkCnff3PyKwr8/config

Crash log:
-----------
[    5.788405] ata1.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
[    5.790244] ata1.00: 6217030 sectors, multi 16: LBA48
[    5.792453] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
[    5.797823] scsi 0:0:0:0: Direct-Access     ATA      QEMU HARDDISK
  2.5+ PQ: 0 ANSI: 5
[    5.803276] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    5.804310] sd 0:0:0:0: [sda] 6217030 512-byte logical blocks:
(3.18 GB/2.96 GiB)
[    5.807632] sd 0:0:0:0: [sda] Write Protect is off
[    5.808940] scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM
  2.5+ PQ: 0 ANSI: 5
[    5.811086] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    5.816238] ==================================================================
[    5.817148] BUG: KASAN: slab-out-of-bounds in
swiotlb_tbl_sync_single+0xc0/0xe0
[    5.817148] Write of size 2048 at addr ffff888104a7d000 by task swapper/3/0
[    5.817148]
[    5.817148] CPU: 3 PID: 0 Comm: swapper/3 Not tainted
5.10.0-rc7-next-20201211 #2
[    5.817148] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[    5.817148] Call Trace:
[    5.817148]  <IRQ>
[    5.817148]  dump_stack+0xa4/0xd9
[    5.817148]  print_address_description.constprop.0+0x21/0x140
[    5.817148]  ? swiotlb_tbl_sync_single+0xc0/0xe0
[    5.817148]  kasan_report.cold+0x7d/0x10a
[    5.817148]  ? swiotlb_tbl_sync_single+0xc0/0xe0
[    5.817148]  check_memory_region+0x18c/0x1f0
[    5.817148]  memcpy+0x3c/0x60
[    5.817148]  swiotlb_tbl_sync_single+0xc0/0xe0
[    5.817148]  dma_direct_unmap_sg+0x241/0x290
[    5.817148]  ? put_cred_rcu+0x114/0x180
[    5.817148]  dma_unmap_sg_attrs+0x78/0xc0
[    5.817148]  __ata_qc_complete+0x215/0x270
[    5.817148]  ata_qc_complete+0x1a5/0x4c0
[    5.817148]  ata_hsm_qc_complete+0x6d/0x120
[    5.817148]  ata_sff_hsm_move+0x201/0xb10
[    5.817148]  ? quarantine_put+0xed/0x180
[    5.817148]  ? ____kasan_slab_free+0xfe/0x120
[    5.817148]  ? get_task_cred+0x90/0x90
[    5.817148]  ? trace_hardirqs_on+0x38/0x100
[    5.817148]  __ata_sff_port_intr+0x105/0x1c0
[    5.817148]  ata_bmdma_port_intr+0x63/0x190
[    5.817148]  ata_bmdma_interrupt+0x160/0x2e0
[    5.817148]  ? ata_bmdma_port_intr+0x190/0x190
[    5.817148]  __handle_irq_event_percpu+0xbf/0x2b0
[    5.817148]  handle_irq_event_percpu+0x70/0xf0
[    5.844430]  ? __handle_irq_event_percpu+0x2b0/0x2b0
[    5.844430]  ? __kasan_check_write+0x14/0x20
[    5.844430]  ? _raw_spin_lock+0x82/0xd0
[    5.844430]  handle_irq_event+0x68/0xa0
[    5.844430]  handle_edge_irq+0x108/0x2f0
[    5.844430]  asm_call_irq_on_stack+0x12/0x20
[    5.844430]  </IRQ>
[    5.844430]  common_interrupt+0xc3/0x130
[    5.844430]  asm_common_interrupt+0x1e/0x40
[    5.844430] RIP: 0010:default_idle+0x17/0x20
[    5.844430] Code: ff eb c2 e8 4b 30 ff ff cc cc cc cc cc cc cc cc
cc cc cc 0f 1f 44 00 00 55 48 89 e5 e9 07 00 00 00 0f 00 2d 0b 63 59
00 fb f4 <5d> c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 55 be 08 00 00 00
48 89
[    5.844430] RSP: 0018:ffff888100327da8 EFLAGS: 00000206
[    5.844430] RAX: ffffffffb50b3c00 RBX: ffff8881002d4ec0 RCX: ffffffffb50a6e1e
[    5.844430] RDX: 0000000000004dd2 RSI: 0000000000000004 RDI: ffff8881179b2720
[    5.844430] RBP: ffff888100327da8 R08: 0000000000000001 R09: ffffed1022f364e5
[    5.844430] R10: ffff8881179b2723 R11: ffffed1022f364e4 R12: 0000000000000003
[    5.844430] R13: ffffffffb688d388 R14: 0000000000000000 R15: ffff8881002d4ec0
[    5.844430]  ? __cpuidle_text_start+0x8/0x8
[    5.844430]  ? rcu_eqs_enter.constprop.0+0x9e/0xc0
[    5.844430]  arch_cpu_idle+0x15/0x20
[    5.844430]  default_idle_call+0x6f/0x180
[    5.844430]  do_idle+0x396/0x450
[    5.844430]  ? _raw_spin_unlock_irqrestore+0x34/0x40
[    5.844430]  ? arch_cpu_idle_exit+0x40/0x40
[    5.844430]  ? complete+0x47/0x50
[    5.844430]  cpu_startup_entry+0x20/0x30
[    5.844430]  start_secondary+0x1ca/0x220
[    5.844430]  ? set_cpu_sibling_map+0xc90/0xc90
[    5.844430]  secondary_startup_64_no_verify+0xc2/0xcb
[    5.844430]
[    5.844430] Allocated by task 258:
[    5.844430]  kasan_save_stack+0x23/0x50
[    5.844430]  ____kasan_kmalloc.constprop.0+0x88/0xb0
[    5.844430]  __kasan_slab_alloc+0xe/0x10
[    5.844430]  kmem_cache_alloc_node+0x161/0x4c0
[    5.844430]  create_task_io_context+0x25/0x1f0
[    5.844430]  submit_bio_checks+0x853/0x9e0
[    5.844430]  submit_bio_noacct+0x7d/0x6c0
[    5.844430]  submit_bio+0xba/0x2e0
[    5.844430]  submit_bh_wbc+0x357/0x390
[    5.844430]  block_read_full_page+0x3e5/0x6d0
[    5.844430]  blkdev_readpage+0x18/0x20
[    5.844430]  do_read_cache_page+0x48b/0xb30
[    5.844430]  read_cache_page+0x3c/0x50
[    5.844430]  read_part_sector+0x97/0x1b0
[    5.844430]  read_lba+0x1f5/0x2a0
[    5.844430]  efi_partition+0x313/0xab0
[    5.844430]  blk_add_partitions+0x1f5/0x600
[    5.844430]  bdev_disk_changed+0xc2/0x150
[    5.844430]  __blkdev_get+0x14a/0x4d0
[    5.876332]  blkdev_get_by_dev+0xe9/0x280
[    5.876332]  __device_add_disk+0x786/0x8a0
[    5.876332]  device_add_disk+0x13/0x20
[    5.876332]  sd_probe+0x55b/0x6a0
[    5.876332]  really_probe+0x179/0x5a0
[    5.876332]  driver_probe_device+0x14a/0x1d0
[    5.876332]  __device_attach_driver+0xbd/0x110
[    5.876332]  bus_for_each_drv+0xfd/0x160
[    5.876332]  __device_attach_async_helper+0x144/0x1a0
[    5.876332]  async_run_entry_fn+0x70/0x2a0
[    5.876332]  process_one_work+0x488/0x790
[    5.876332]  worker_thread+0x80/0x6d0
[    5.876332]  kthread+0x1bd/0x210
[    5.876332]  ret_from_fork+0x22/0x30
[    5.876332]
[    5.876332] The buggy address belongs to the object at ffff888104a7d000
[    5.876332]  which belongs to the cache blkdev_ioc of size 88
[    5.876332] The buggy address is located 0 bytes inside of
[    5.876332]  88-byte region [ffff888104a7d000, ffff888104a7d058)
[    5.876332] The buggy address belongs to the page:
[    5.876332] page:000000004397bed6 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x104a7d
[    5.876332] flags: 0x200000000000200(slab)
[    5.876332] raw: 0200000000000200 dead000000000100 dead000000000122
ffff888100dbbc80
[    5.876332] raw: 0000000000000000 0000000080220022 00000001ffffffff
0000000000000000
[    5.876332] page dumped because: kasan: bad access detected
[    5.876332]
[    5.876332] Memory state around the buggy address:
[    5.876332]  ffff888104a7cf00: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[    5.876332]  ffff888104a7cf80: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[    5.876332] >ffff888104a7d000: 00 00 00 00 00 00 00 00 00 00 00 fc
fc fc fc fc
[    5.876332]                                                     ^
[    5.876332]  ffff888104a7d080: fc fc fc fc fc fc fc fc fc fc fc fc
fc fc fc fc
[    5.876332]  ffff888104a7d100: fc fc fc fc fc fc fc fc fc fc fc fc
fc fc fc fc
[    5.876332] ==================================================================
[    5.876332] Disabling lock debugging due to kernel taint
[    5.906281] sr 1:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tray

Reported-by: Naresh kamboju <naresh.kamboju@linaro.org>

Full test log link,
-------------------
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201211/testrun/3571515/suite/linux-log-parser/test/check-kernel-bug-2037535/log
https://lkft.validation.linaro.org/scheduler/job/2037535#L588
https://lkft.validation.linaro.org/scheduler/job/2037534#L588
https://lkft.validation.linaro.org/scheduler/job/2037539#L589

-- 
Linaro LKFT
https://lkft.linaro.org
