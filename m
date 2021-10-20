Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6D243467B
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 10:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhJTIKD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 04:10:03 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:16201 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhJTIKD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 04:10:03 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211020080747euoutp02ec7f192289e46d5bc4d1837754ba0b31~vrrGYce8H2128121281euoutp02V
        for <linux-next@vger.kernel.org>; Wed, 20 Oct 2021 08:07:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211020080747euoutp02ec7f192289e46d5bc4d1837754ba0b31~vrrGYce8H2128121281euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634717267;
        bh=DQ6QJZhtKD58PE4aFBmRmAeDHrxVin67VLSCfOfs+G4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=u/bIFuaKq9u7lpGC5B5S3T4aTKCqzBbsaxSUDBl2a8XB4AH9SFK+sOGB5B/iRJGDn
         AV2R769gcsppX72ivJhpejFrt0LN/+Vcjb0OH2iT+oT2cdm5WDwvIAEjQAnM487THB
         UNOpBSsVt+oFdPqgJ2msOgJtiI9usm3AjzCp23FQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211020080747eucas1p2517ffd4df9d8c0fc1b1b901bafd2d8d6~vrrGMyyyU2205822058eucas1p2c;
        Wed, 20 Oct 2021 08:07:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 78.60.45756.35ECF616; Wed, 20
        Oct 2021 09:07:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211020080746eucas1p2241ce43c8e0303eec99e332362593239~vrrFqJ4yN1918619186eucas1p2t;
        Wed, 20 Oct 2021 08:07:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211020080746eusmtrp10fb0a6a455ac0f94ca700519954915f6~vrrFpdH1H0905709057eusmtrp13;
        Wed, 20 Oct 2021 08:07:46 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-eb-616fce5365a8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9E.82.20981.25ECF616; Wed, 20
        Oct 2021 09:07:46 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211020080746eusmtip2c495ff127c823ae2b836d131b220c8b7~vrrFR0Axm2738827388eusmtip2b;
        Wed, 20 Oct 2021 08:07:46 +0000 (GMT)
Subject: Re: Regression of next-20211019
To:     Chanho Park <chanho61.park@samsung.com>, axboe@kernel.dk
Cc:     sfr@canb.auug.org.au, linux-block@vger.kernel.org,
        linux-next@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ce5dcc95-8609-b1d9-81a0-f8d6cd6a3e7b@samsung.com>
Date:   Wed, 20 Oct 2021 10:07:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <00be01d7c585$8c5d3580$a517a080$@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduzned3gc/mJBts6OCxW3+1ns7i8X9ti
        7y1ti4ML2xgttu69yu7A6tF44wabx+WzpR59W1YxenzeJBfAEsVlk5Kak1mWWqRvl8CVMbN/
        OnvBaZOKphfrWRoYb2p2MXJySAiYSBz8spa5i5GLQ0hgBaPEku132EASQgJfGCW2b4uBSHxm
        lPg44RYbTEfH+lZGiKLljBLvDmdAFH1klOh4fJAZJCEsoCGx8+0dpi5GDg4RARuJjfcrQMLM
        AsESM2buYQWx2QQMJbredoHN5BWwk+iYsBWslUVAVWJD/3qwGlGBZIlpf5uYIWoEJU7OfMIC
        YnMKWEkcW/CEEWKmvMT2t3OYIWxxiVtP5jOB3CMhcIBDYtHPN0wQR7tInN/RzwphC0u8Or6F
        HcKWkTg9uYcFoqGZUeLhubXsEE4Po8TlphmMEFXWEnfO/WID+YZZQFNi/S59iLCjxJ1lH8Ce
        lBDgk7jxVhDiCD6JSdumM0OEeSU62oQgqtUkZh1fB7f24IVLzBMYlWYheW0WkndmIXlnFsLe
        BYwsqxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3MQKTy+l/xz/tYJz76qPeIUYmDsZDjBIc
        zEoivLsr8hOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ866avSZeSCA9sSQ1OzW1ILUIJsvEwSnV
        wGS/rqdsWp3tRLnX3lsN0yqVLzB8Pq5iKVhlo3L14vp4FvkFt0LW5P8QPGV7j7WAbWa4RtOp
        eR+mnuGXPaaz8FmRVty/xPyyfb95LX5dNM6U+7P82Z6XtgtPx0w65rnp+T2huC4nz5bIDX7a
        06qNQ09Isd4LshTz6cvIcnvXfHLNvEtLP27bNiMmO/w26838CjH9+V75P2fM0bOUW8njv7BZ
        5c5xvpsLarW/6TwVddUu2V90JvitUqxXjDRDFOvmrh3upWKTLYJFBUt+OWs+iJi+8LjYmrOy
        Ui3Xv4htX2PzknWOZHqEnPc1LaXqK9caw69Gvl1Z23Uy7a6d37P4U8oRB932uivfa9Z78rl9
        nRJLcUaioRZzUXEiABGRdvKdAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xe7pB5/ITDZo7lC1W3+1ns7i8X9ti
        7y1ti4ML2xgttu69yu7A6tF44wabx+WzpR59W1YxenzeJBfAEqVnU5RfWpKqkJFfXGKrFG1o
        YaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXMbN/OnvBaZOKphfrWRoYb2p2MXJy
        SAiYSHSsb2XsYuTiEBJYyihx/eM/FoiEjMTJaQ2sELawxJ9rXWwQRe8ZJZZP+8AGkhAW0JDY
        +fYOUxcjB4eIgI3ExvsVIGFmgWCJR50N7BD1vYwSiz//YQJJsAkYSnS97QLr5RWwk+iYsJUZ
        xGYRUJXY0L8ebJmoQLLE29ffmSBqBCVOznwCdhCngJXEsQVPGCEWmEnM2/yQGcKWl9j+dg6U
        LS5x68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbU
        tmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8uyvyE4V4UxIrq1KL8uOLSnNSiw8xmgL9M5FZSjQ5
        HxjTeSXxhmYGpoYmZpYGppZmxkrivCZH1sQLCaQnlqRmp6YWpBbB9DFxcEo1MLWd9Jrbml31
        RXomU/dkIY+zmgesPySsLC4Wbzl3/Pvt+f5WJ6Kt0uQ7N1UanLuRdfSzrXaWeNTbdrVD7pu8
        PnT8u53UMmNaAldat3XDqby2+968e47snu9S5xXD9ULxU9bWiNgXrmmu5ika/2w8l0XGv56t
        GbapdJpLe9WMDV+Xhb0+qt75pqH8DV9hvm8g+4S2Ty9kroqLt3e3WUwQSzUMWxM+86RV17uU
        SKvCkGmT98zVEl0d9oMhZeLTv9ceHxLsMv+hYdr8/LyV5pkgpRvfhOZrGvpzTrlbP6mqaO8i
        gf2bkwqXZpdmPfCPP/bqxaHnN6Lcf8td/RM4L9/f67hM7YytZbdK3A4tEzPgUmIpzkg01GIu
        Kk4EANBFTJoxAwAA
X-CMS-MailID: 20211020080746eucas1p2241ce43c8e0303eec99e332362593239
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211020073900epcas2p402043934d4ca8f04113bc5ce50d2f596
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211020073900epcas2p402043934d4ca8f04113bc5ce50d2f596
References: <CGME20211020073900epcas2p402043934d4ca8f04113bc5ce50d2f596@epcas2p4.samsung.com>
        <00be01d7c585$8c5d3580$a517a080$@samsung.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Chanho,

On 20.10.2021 09:39, Chanho Park wrote:
> Hi,
>
> I found a NULL pointer dereference on next-20211019. It might be a
> regression since next-20211015.
> So, I did "git bisect" and found below commit. Are you already aware of
> this?

I also found this issue in yesterday's linux-next. Then I found that is 
has been already fixed by this patch: 
https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=3039417eec780c6bbb119ae5598fdca2d4a957ec 
so I decided that there is no point in reporting it.

In today's linux-next it has been fixed by the commit 
https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e70feb8b3e6886c525c88943b5f1508d02f5a683

> $ git bisect bad
> 2ff0682da6e09c1e0db63a2d2abcd4efb531c8db is the first bad commit
> commit 2ff0682da6e09c1e0db63a2d2abcd4efb531c8db
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Fri Oct 15 09:44:38 2021 -0600
>
>      block: store elevator state in request
>      
>      Add an rq private RQF_ELV flag, which tells the block layer that this
>      request was initialized on a queue that has an IO scheduler attached.
>      This allows for faster checking in the fast path, rather than having to
>      deference rq->q later on.
>      
>      Elevator switching does full quiesce of the queue before detaching an
>      IO scheduler, so it's safe to cache this in the request itself.
>      
>      Signed-off-by: Jens Axboe <axboe@kernel.dk>
>
>   block/blk-mq-sched.h   | 27 ++++++++++++++++-----------
>   block/blk-mq.c         | 20 +++++++++++---------
>   include/linux/blk-mq.h |  2 ++
>   3 files changed, 29 insertions(+), 20 deletions(-)
>
>
> [    1.908677] BUG: kernel NULL pointer dereference, address:
> 000000000000000f
> [    1.911614] #PF: supervisor read access in kernel mode
> [    1.913748] #PF: error_code(0x0000) - not-present page
> [    1.916034] PGD 0 P4D 0
> [    1.917125] Oops: 0000 [#1] SMP PTI
> [    1.918638] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 5.15.0-rc6+ #14
> [    1.921381] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.12.0-0-ga698c8995f-prebuilt.qemu.org 04/01/2014
> [    1.925974] RIP: 0010:blk_mq_free_request+0x3f/0x140
> [    1.928272] Code: 47 1c 00 10 40 00 74 36 49 8b 44 24 08 48 8b 00 48 8b
> 40 68 48 85 c0 74 05 e8 2d 14 a3 00 48 8b 85 b8 00 00 00 48 85 c0 74 14 <48>
> 8b 78 08 e8 28 9f ff ff 48 c7 85 b8 00 00 00 00 00 00 00 8b 55
> [    1.936950] RSP: 0000:ffffb5f5c010ce70 EFLAGS: 00010002
> [    1.939287] RAX: 0000000000000007 RBX: ffff981afbdaed80 RCX:
> 000000000002eec8
> [    1.941312] RDX: ffff981ac0314c00 RSI: 00000000fffb72c8 RDI:
> ffff981ac02e6300
> [    1.943345] RBP: ffff981ac02e6300 R08: 000000000000006d R09:
> ffff981ac02e6300
> [    1.944984] R10: 0000000000000008 R11: 000000006cdbb244 R12:
> ffff981ac1148000
> [    1.946545] R13: ffff981ac10c6400 R14: ffff981ac03c6528 R15:
> ffff981ac03c64e0
> [    1.948372] FS:  0000000000000000(0000) GS:ffff981afbd80000(0000)
> knlGS:0000000000000000
> [    1.949867] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.950892] CR2: 000000000000000f CR3: 000000005060c000 CR4:
> 00000000000006e0
> [    1.952145] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [    1.953406] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [    1.954713] Call Trace:
> [    1.955093]  <IRQ>
> [    1.955406]  blk_flush_complete_seq+0x223/0x2b0
> [    1.956096]  flush_end_io+0x18f/0x250
> [    1.956643]  scsi_end_request+0x7d/0xf0
> [    1.957238]  scsi_io_completion+0x12b/0x570
> [    1.957868]  blk_complete_reqs+0x3b/0x50
> [    1.958472]  __do_softirq+0xd4/0x27f
> [    1.958999]  irq_exit_rcu+0x69/0x90
> [    1.959460]  sysvec_call_function_single+0x6a/0x90
> [    1.960085]  </IRQ>
> [    1.960367]  asm_sysvec_call_function_single+0x12/0x20
> [    1.961036] RIP: 0010:default_idle+0xb/0x10
> [    1.961581] Code: 85 c9 fe ff ff c6 43 08 00 fb eb 88 48 89 df e8 eb 44
> 92 ff eb ca e8 04 8c ff ff cc cc cc cc eb 07 0f 00 2d ff ad 46 00 fb f4 <c3>
> 0f 1f 40 00 65 48 8b 04 25 00 6d 01 00 f0 80 48 02 20 48 8b 10
> [    1.963958] RSP: 0000:ffffb5f5c007fee8 EFLAGS: 00000206
> [    1.964749] RAX: ffffffff8d99b6c0 RBX: 0000000000000003 RCX:
> 0000000000000001
> [    1.965553] RDX: ffff981afbda64a0 RSI: 0000000000000083 RDI:
> 0000000000000fd8
> [    1.966397] RBP: ffff981ac0203600 R08: 0000000000000fd7 R09:
> 0000000000000001
> [    1.967208] R10: ffff981afbda5740 R11: 0000000000000800 R12:
> ffff981ac0203600
> [    1.968012] R13: ffff981ac0203600 R14: 0000000000000000 R15:
> 0000000000000000
> [    1.968818]  ? __sched_text_end+0x4/0x4
> [    1.969211]  ? __sched_text_end+0x4/0x4
> [    1.969608]  default_idle_call+0x2c/0xa0
> [    1.970009]  do_idle+0x1d9/0x230
> [    1.970352]  cpu_startup_entry+0x14/0x20
> [    1.970764]  secondary_startup_64_no_verify+0xc2/0xcb
> [    1.971287] Modules linked in:
> [    1.971605] CR2: 000000000000000f
> [    1.971951] ---[ end trace 1d285559d26682a4 ]---
> [    1.972422] RIP: 0010:blk_mq_free_request+0x3f/0x140
> [    1.972917] Code: 47 1c 00 10 40 00 74 36 49 8b 44 24 08 48 8b 00 48 8b
> 40 68 48 85 c0 74 05 e8 2d 14 a3 00 48 8b 85 b8 00 00 00 48 85 c0 74 14 <48>
> 8b 78 08 e8 28 9f ff ff 48 c7 85 b8 00 00 00 00 00 00 00 8b 55
> [    1.975093] RSP: 0000:ffffb5f5c010ce70 EFLAGS: 00010002
> [    1.975650] RAX: 0000000000000007 RBX: ffff981afbdaed80 RCX:
> 000000000002eec8
> [    1.976411] RDX: ffff981ac0314c00 RSI: 00000000fffb72c8 RDI:
> ffff981ac02e6300
> [    1.977184] RBP: ffff981ac02e6300 R08: 000000000000006d R09:
> ffff981ac02e6300
> [    1.977931] R10: 0000000000000008 R11: 000000006cdbb244 R12:
> ffff981ac1148000
> [    1.978790] R13: ffff981ac10c6400 R14: ffff981ac03c6528 R15:
> ffff981ac03c64e0
> [    1.979577] FS:  0000000000000000(0000) GS:ffff981afbd80000(0000)
> knlGS:0000000000000000
> [    1.980391] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.981011] CR2: 000000000000000f CR3: 000000005060c000 CR4:
> 00000000000006e0
> [    1.981916] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [    1.982643] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [    1.983365] Kernel panic - not syncing: Fatal exception in interrupt
> [    1.984122] Kernel Offset: 0xbe00000 from 0xffffffff81000000 (relocation
> range: 0xffffffff80000000-0xffffffffbfffffff)
> [    1.985243] ---[ end Kernel panic - not syncing: Fatal exception in
> interrupt ]---
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

