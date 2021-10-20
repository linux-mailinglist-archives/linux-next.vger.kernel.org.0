Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC024345FA
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 09:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhJTHlZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 03:41:25 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:57071 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhJTHlY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 03:41:24 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211020073908epoutp031eba82db775bca6a44c885de233be9ac~vrSFuG6LS1434514345epoutp03w
        for <linux-next@vger.kernel.org>; Wed, 20 Oct 2021 07:39:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211020073908epoutp031eba82db775bca6a44c885de233be9ac~vrSFuG6LS1434514345epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634715548;
        bh=1vYdfuEqilscmzJqEIEZCWZ7Nut5/mVSnIC6CF3scdk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ARLBecIZzd5ZKkgBWnyJcqhlEYacz1SxHLUzp/eZY7gXI5KHyPoXhddo7feYhSc5O
         AQgmnk3pMfWLQjh1u2sVzWUeystXbDv5Cb/jZFhD4qTIVLs9gaIjItj/izb3WzsEfO
         zUqh5lsH7rpQ8ufrDoeQexX862bCSkwh38qm0Rro=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211020073908epcas2p49275b50f949cd712fdc311bd380727fb~vrSFe9aes0937709377epcas2p4R;
        Wed, 20 Oct 2021 07:39:08 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HZ2YM3XjPz4x9Qs; Wed, 20 Oct
        2021 07:39:03 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        75.A9.10018.597CF616; Wed, 20 Oct 2021 16:39:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20211020073900epcas2p402043934d4ca8f04113bc5ce50d2f596~vrR_MA2QM0937409374epcas2p4V;
        Wed, 20 Oct 2021 07:39:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211020073900epsmtrp1d3068eab512ac97614ebe0c5649fe943~vrR_LYbQ_3124131241epsmtrp1M;
        Wed, 20 Oct 2021 07:39:00 +0000 (GMT)
X-AuditID: b6c32a46-a25ff70000002722-c9-616fc7957aae
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        31.E0.08902.497CF616; Wed, 20 Oct 2021 16:39:00 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211020073900epsmtip2bdd739f60f6f01430af31f420761e047~vrR9_DQFQ0348203482epsmtip2P;
        Wed, 20 Oct 2021 07:39:00 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     <axboe@kernel.dk>
Cc:     <sfr@canb.auug.org.au>, <linux-block@vger.kernel.org>,
        <linux-next@vger.kernel.org>
Subject: Regression of next-20211019
Date:   Wed, 20 Oct 2021 16:39:00 +0900
Message-ID: <00be01d7c585$8c5d3580$a517a080$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdfFhJmTkxVAqyFqRQuuM6bqKhopTQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBKsWRmVeSWpSXmKPExsWy7bCmue7U4/mJBqeXqlisvtvPZrH3lrbF
        wYVtjBZb915ld2DxaLxxg83j8tlSj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403N
        DAx1DS0tzJUU8hJzU22VXHwCdN0yc4B2KSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVIL
        UnIKzAv0ihNzi0vz0vXyUkusDA0MjEyBChOyM+7vEiw4o1tx9zBLA+NulS5GTg4JAROJ/6s/
        M3UxcnEICexglOi/84EVJCEk8IlR4tUdZYjEN0aJfRcWM8F0tL29yA6R2MsosXHbO2YI5wWj
        xI67a1hAqtgE9CVedmwDGsXBISIgKjFnUSVImFkgUmLa/mtsILawgIpE+9YesHIWAVWJr/su
        sIOU8wpYSsz9EQcS5hUQlDg58wkLRKu8xPa3c5ghblCQ+Pl0GdihIgJ6EpePXGaFqBGRmN3Z
        BnaOhMA1donPb3awQTS4SHxddo0dwhaWeHV8C5QtJfGyv40doqGbUaL10X+oxGpGic5GHwjb
        XuLX9C1gvzALaEqs36UPYkoIKEscuQV1G59Ex+G/7BBhXomONiGIRnWJA9uns0DYshLdcz6z
        QtgeEgt2zmacwKg4C8mXs5B8OQvJN7MQ9i5gZFnFKJZaUJybnlpsVGAEj+jk/NxNjOAkqOW2
        g3HK2w96hxiZOBgPMUpwMCuJ8O6uyE8U4k1JrKxKLcqPLyrNSS0+xGgKDPaJzFKiyfnANJxX
        Em9oYmlgYmZmaG5kamCuJM5rKZqdKCSQnliSmp2aWpBaBNPHxMEp1cAk3RNW+12f9+FOt7kn
        m5X2MhyYm6Nr7TJrUovK53nTJFocVX14+BlCLx62Ubp3ccJd6w6VbKnvBrw6s8999YmdEGPK
        78X2hbln37KGAp/k02ecvQ9GSBS9vy4n5TFZyvyxDsvkpmXa8Vtd/NoaBFdlftj63axUftWz
        H4z3i7eE7K3XNTRduveRQ0vwIYvzUR1e4koveA+xLL9bXLYl55TLizltajY3rsTKulQVbzmw
        1v/Xh00/74qJqTdPXzB53+n5ns37NLJ/LJ659dXjYyETy/79OSLPqqbmH3dpkej7uRNfXZr1
        7zXDrw5LBsFzHD971eXKIm6KV6d1n2POfnD7mt98dvab6+X9mZ88lE1VYinOSDTUYi4qTgQA
        C1wz/AsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWy7bCSvO6U4/mJBis+a1msvtvPZrH3lrbF
        wYVtjBZb915ld2DxaLxxg83j8tlSj8+b5AKYo7hsUlJzMstSi/TtErgy7u8SLDijW3H3MEsD
        426VLkZODgkBE4m2txfZuxi5OIQEdjNKHGx9ywaRkJV49m4HO4QtLHG/5QgrRNEzRolDq16A
        JdgE9CVedmwDSnBwiAiISsxZVAkSZhaIlmg9fYwZxBYWUJFo39rDAmKzCKhKfN13gR2knFfA
        UmLujziQMK+AoMTJmU9YQMLMAnoSbRsZIabIS2x/O4cZ4gIFiZ9Pl7GC2CJAJZePXGaFqBGR
        mN3ZxjyBUXAWkkmzECbNQjJpFpKOBYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcx
        goNbS3MH4/ZVH/QOMTJxMB5ilOBgVhLh3V2RnyjEm5JYWZValB9fVJqTWnyIUZqDRUmc90LX
        yXghgfTEktTs1NSC1CKYLBMHp1QDU1+GxOmtJ+Ms9k8+xfevIUJwVcnbwuB850tTXBgfK7gX
        35m/Q09nZrSP4MOe+nO3Kn62flDOFEzR2FLObMRguHve7m/nL/pLzA90bI5cpfLUbf5ugwcP
        v+6pfZie47yOwbno4X/ZT9pZvIyT1HITii0DPobv+fo04Mf7yRde9E4L1xZWurjqae65Kb+L
        5z7u3LD1uP2yTVeu8DgmzjV23Kk5veIB37tj2S3nzsaxpdYWGxscEle19W59UxPmeHbdiuuK
        7OzPV+1oWXDxWf96/ZIFOQFlVg9OpVfvfrzUZtnl7bxSjk+avYIWLWeLLFM5UNi19OSxN9M1
        JSb+qYzbvGpBuk2i5s6gOSz1FwL+T1ZiKc5INNRiLipOBACt6rE63QIAAA==
X-CMS-MailID: 20211020073900epcas2p402043934d4ca8f04113bc5ce50d2f596
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211020073900epcas2p402043934d4ca8f04113bc5ce50d2f596
References: <CGME20211020073900epcas2p402043934d4ca8f04113bc5ce50d2f596@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

I found a NULL pointer dereference on next-20211019. It might be a
regression since next-20211015.
So, I did "git bisect" and found below commit. Are you already aware of
this?

$ git bisect bad
2ff0682da6e09c1e0db63a2d2abcd4efb531c8db is the first bad commit
commit 2ff0682da6e09c1e0db63a2d2abcd4efb531c8db
Author: Jens Axboe <axboe@kernel.dk>
Date:   Fri Oct 15 09:44:38 2021 -0600

    block: store elevator state in request
    
    Add an rq private RQF_ELV flag, which tells the block layer that this
    request was initialized on a queue that has an IO scheduler attached.
    This allows for faster checking in the fast path, rather than having to
    deference rq->q later on.
    
    Elevator switching does full quiesce of the queue before detaching an
    IO scheduler, so it's safe to cache this in the request itself.
    
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

 block/blk-mq-sched.h   | 27 ++++++++++++++++-----------
 block/blk-mq.c         | 20 +++++++++++---------
 include/linux/blk-mq.h |  2 ++
 3 files changed, 29 insertions(+), 20 deletions(-)


[    1.908677] BUG: kernel NULL pointer dereference, address:
000000000000000f
[    1.911614] #PF: supervisor read access in kernel mode
[    1.913748] #PF: error_code(0x0000) - not-present page
[    1.916034] PGD 0 P4D 0 
[    1.917125] Oops: 0000 [#1] SMP PTI
[    1.918638] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 5.15.0-rc6+ #14
[    1.921381] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.12.0-0-ga698c8995f-prebuilt.qemu.org 04/01/2014
[    1.925974] RIP: 0010:blk_mq_free_request+0x3f/0x140
[    1.928272] Code: 47 1c 00 10 40 00 74 36 49 8b 44 24 08 48 8b 00 48 8b
40 68 48 85 c0 74 05 e8 2d 14 a3 00 48 8b 85 b8 00 00 00 48 85 c0 74 14 <48>
8b 78 08 e8 28 9f ff ff 48 c7 85 b8 00 00 00 00 00 00 00 8b 55
[    1.936950] RSP: 0000:ffffb5f5c010ce70 EFLAGS: 00010002
[    1.939287] RAX: 0000000000000007 RBX: ffff981afbdaed80 RCX:
000000000002eec8
[    1.941312] RDX: ffff981ac0314c00 RSI: 00000000fffb72c8 RDI:
ffff981ac02e6300
[    1.943345] RBP: ffff981ac02e6300 R08: 000000000000006d R09:
ffff981ac02e6300
[    1.944984] R10: 0000000000000008 R11: 000000006cdbb244 R12:
ffff981ac1148000
[    1.946545] R13: ffff981ac10c6400 R14: ffff981ac03c6528 R15:
ffff981ac03c64e0
[    1.948372] FS:  0000000000000000(0000) GS:ffff981afbd80000(0000)
knlGS:0000000000000000
[    1.949867] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.950892] CR2: 000000000000000f CR3: 000000005060c000 CR4:
00000000000006e0
[    1.952145] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[    1.953406] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[    1.954713] Call Trace:
[    1.955093]  <IRQ>
[    1.955406]  blk_flush_complete_seq+0x223/0x2b0
[    1.956096]  flush_end_io+0x18f/0x250
[    1.956643]  scsi_end_request+0x7d/0xf0
[    1.957238]  scsi_io_completion+0x12b/0x570
[    1.957868]  blk_complete_reqs+0x3b/0x50
[    1.958472]  __do_softirq+0xd4/0x27f
[    1.958999]  irq_exit_rcu+0x69/0x90
[    1.959460]  sysvec_call_function_single+0x6a/0x90
[    1.960085]  </IRQ>
[    1.960367]  asm_sysvec_call_function_single+0x12/0x20
[    1.961036] RIP: 0010:default_idle+0xb/0x10
[    1.961581] Code: 85 c9 fe ff ff c6 43 08 00 fb eb 88 48 89 df e8 eb 44
92 ff eb ca e8 04 8c ff ff cc cc cc cc eb 07 0f 00 2d ff ad 46 00 fb f4 <c3>
0f 1f 40 00 65 48 8b 04 25 00 6d 01 00 f0 80 48 02 20 48 8b 10
[    1.963958] RSP: 0000:ffffb5f5c007fee8 EFLAGS: 00000206
[    1.964749] RAX: ffffffff8d99b6c0 RBX: 0000000000000003 RCX:
0000000000000001
[    1.965553] RDX: ffff981afbda64a0 RSI: 0000000000000083 RDI:
0000000000000fd8
[    1.966397] RBP: ffff981ac0203600 R08: 0000000000000fd7 R09:
0000000000000001
[    1.967208] R10: ffff981afbda5740 R11: 0000000000000800 R12:
ffff981ac0203600
[    1.968012] R13: ffff981ac0203600 R14: 0000000000000000 R15:
0000000000000000
[    1.968818]  ? __sched_text_end+0x4/0x4
[    1.969211]  ? __sched_text_end+0x4/0x4
[    1.969608]  default_idle_call+0x2c/0xa0
[    1.970009]  do_idle+0x1d9/0x230
[    1.970352]  cpu_startup_entry+0x14/0x20
[    1.970764]  secondary_startup_64_no_verify+0xc2/0xcb
[    1.971287] Modules linked in:
[    1.971605] CR2: 000000000000000f
[    1.971951] ---[ end trace 1d285559d26682a4 ]---
[    1.972422] RIP: 0010:blk_mq_free_request+0x3f/0x140
[    1.972917] Code: 47 1c 00 10 40 00 74 36 49 8b 44 24 08 48 8b 00 48 8b
40 68 48 85 c0 74 05 e8 2d 14 a3 00 48 8b 85 b8 00 00 00 48 85 c0 74 14 <48>
8b 78 08 e8 28 9f ff ff 48 c7 85 b8 00 00 00 00 00 00 00 8b 55
[    1.975093] RSP: 0000:ffffb5f5c010ce70 EFLAGS: 00010002
[    1.975650] RAX: 0000000000000007 RBX: ffff981afbdaed80 RCX:
000000000002eec8
[    1.976411] RDX: ffff981ac0314c00 RSI: 00000000fffb72c8 RDI:
ffff981ac02e6300
[    1.977184] RBP: ffff981ac02e6300 R08: 000000000000006d R09:
ffff981ac02e6300
[    1.977931] R10: 0000000000000008 R11: 000000006cdbb244 R12:
ffff981ac1148000
[    1.978790] R13: ffff981ac10c6400 R14: ffff981ac03c6528 R15:
ffff981ac03c64e0
[    1.979577] FS:  0000000000000000(0000) GS:ffff981afbd80000(0000)
knlGS:0000000000000000
[    1.980391] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.981011] CR2: 000000000000000f CR3: 000000005060c000 CR4:
00000000000006e0
[    1.981916] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[    1.982643] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[    1.983365] Kernel panic - not syncing: Fatal exception in interrupt
[    1.984122] Kernel Offset: 0xbe00000 from 0xffffffff81000000 (relocation
range: 0xffffffff80000000-0xffffffffbfffffff)
[    1.985243] ---[ end Kernel panic - not syncing: Fatal exception in
interrupt ]---

