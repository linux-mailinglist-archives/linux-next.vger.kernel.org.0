Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEA3443BD5
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 04:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhKCDax (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 23:30:53 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:15627 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhKCDax (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 23:30:53 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211103032814epoutp022298bcbbcf53e00892c3b43082fbf248~z65A_d9CC0406304063epoutp02C
        for <linux-next@vger.kernel.org>; Wed,  3 Nov 2021 03:28:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211103032814epoutp022298bcbbcf53e00892c3b43082fbf248~z65A_d9CC0406304063epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635910094;
        bh=q2hxJ8Io+M3axlbGZLqT7L+r6uh+Np+MrNNkOdf5zVI=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=nowopN1J4Z43UV0lP00APLq2emk6xBnPmJk901qny4Z4wV3vv1+fnzBA8t7KJVvSj
         tDlxtUaarH1p67Uxosns7fYB0p6pSaXJcI+ef4PF861KpBt8Zz0Jts8dJosmuGl33C
         1+RR/+HiURWLcvIJC9nIeBLEnx0uUf5OZ8inI2a8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211103032813epcas2p403a1535aa6b59239e0e1ea8f90c66225~z65AZ2Zxn2404624046epcas2p4Y;
        Wed,  3 Nov 2021 03:28:13 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.98]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HkXKQ40byz4x9QM; Wed,  3 Nov
        2021 03:28:10 +0000 (GMT)
X-AuditID: b6c32a48-d5dff70000002f6d-81-618201caad2a
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        7B.B4.12141.AC102816; Wed,  3 Nov 2021 12:28:10 +0900 (KST)
Mime-Version: 1.0
Subject: RE:(2) [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
Reply-To: daejun7.park@samsung.com
Sender: Daejun Park <daejun7.park@samsung.com>
From:   Daejun Park <daejun7.park@samsung.com>
To:     Jens Axboe <axboe@kernel.dk>, Yi Zhang <yi.zhang@redhat.com>,
        Daejun Park <daejun7.park@samsung.com>
CC:     Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <cb1c00aa-8d06-ef04-4621-0f7b02f54d93@kernel.dk>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20211103032808epcms2p2acd69292225406bb3a9498e4d067e7c7@epcms2p2>
Date:   Wed, 03 Nov 2021 12:28:08 +0900
X-CMS-MailID: 20211103032808epcms2p2acd69292225406bb3a9498e4d067e7c7
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdljTXPcUY1OiwdY2eYvVd/vZLF4e0rRY
        9SDcYu8tbYuDC9sYLbqv72CzuNj7ldni+rlpbA4cHpfPlnpMWHSA0eP9vqtsHn1bVjF6fN4k
        F8AalW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SH
        kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSo
        MCE74+P5RtaCNp6KuzuXsDcwzuXoYuTkkBAwkZh/cDYriC0ksINRYv2z2i5GDg5eAUGJvzuE
        QcLCAtUS+3e3MkGUKEmsvziLHSKuJ3Hr4RpGEJtNQEdi+on7YHERgSyJsx/egMWZBbYCjVyU
        BLGKV2JG+1MWCFtaYvvyrWA1nAK2EvtWX2aCiGtI/FjWywxhi0rcXP2WHcZ+f2w+I4QtItF6
        7yxUjaDEg5+7oeKSEsd2f4CaUy+x9c4voDgXkN3DKHF45y1WiIS+xLWOjWBH8Ar4ShxdPAVs
        AYuAqsSfe4uglrlIbLk7DeoBeYntb+cwg8KEWUBTYv0ufRBTQkBZ4sgtFpi3Gjb+ZkdnMwvw
        SXQc/gsX3zHvCdRpahLrfq5nmsCoPAsR0LOQ7JqFsGsBI/MqRrHUguLc9NRiowITeNQm5+du
        YgQnSC2PHYyz337QO8TIxMF4iFGCg1lJhJf5aEOiEG9KYmVValF+fFFpTmrxIUZToC8nMkuJ
        JucDU3ReSbyhiaWBiZmZobmRqYG5kjivpWh2opBAemJJanZqakFqEUwfEwenVAPT7MOtLRsP
        HHFhUqqQCAtQvalfyL+0KWdWRouCpu3UW5f/ffzjPv3t6e+lNs31XydnTLSKD3hs9mPNuTkX
        X7i7K7IYXrS0S8kJn6veOm9dl9Utz6tHVwdozb2qvviN25e9cld6jpVdOrW9P/SRU+R9ceab
        jfKdqyw3rN3I+3Lt7bnGdedXrA0MW1Sx+IwJ78PA/G2a7azrb4ns61WcvW33/1L1z0kXdOpW
        /agqbK7MSX3lt3vFa/XHITNEkuak8Sy/HHSrV1hJrOnLnBUX5nIubKm0vDNPNk5TZ4bZX99Q
        a/VbDbyKW5Oarwv+uD7n5O0XCtr+pgbKpmVMrs9PWVb36glrdbpPK5iRf+1RqvdRJZbijERD
        Leai4kQANJfhphkEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211103032116epcas2p13b9f3fad0fe84f58c9b7f36320c71854
References: <cb1c00aa-8d06-ef04-4621-0f7b02f54d93@kernel.dk>
        <CAHj4cs-NUKzGj5pgzRhDgdrGGbgPBqUoQ44+xgvk6njH9a_RYQ@mail.gmail.com>
        <1cf57bc2-5283-a2ce-0bbc-db6a62953c8f@linux.ibm.com>
        <e9965a7c-faba-496e-8110-dbe8f7065080@kernel.dk>
        <4f3811f6-88d9-c0c6-055f-1a3220357e22@kernel.dk>
        <CAHj4cs_+ZDe3KVbKYUK0XnupTxU2MqfA6ARxMkhkTwg9hYBiLg@mail.gmail.com>
        <CGME20211103032116epcas2p13b9f3fad0fe84f58c9b7f36320c71854@epcms2p2>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jens,

>>> Can either one of you try with this patch? Won't fix anything, but it'll
>>> hopefully shine a bit of light on the issue.
>>>
>> Hi Jens
>> 
>> Here is the full log:
> 
>Thanks! I think I see what it could be - can you try this one as well,
>would like to confirm that the condition I think is triggering is what
>is triggering.
> 
>diff --git a/block/blk-mq.c b/block/blk-mq.c
>index 07eb1412760b..81dede885231 100644
>--- a/block/blk-mq.c
>+++ b/block/blk-mq.c
>@@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
>         if (plug && plug->cached_rq) {
>                 rq = rq_list_pop(&plug->cached_rq);
>                 INIT_LIST_HEAD(&rq->queuelist);
>+                WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>+                WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>         } else {
>                 struct blk_mq_alloc_data data = {
>                         .q                = q,
>@@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
>                                 bio_wouldblock_error(bio);
>                         goto queue_exit;
>                 }
>+                WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
>+                WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
>         }
> 
>         trace_block_getrq(bio);
> 
>-- 
>Jens Axboe

The first reported warning was started from calling scsi_execute(), so how
about add the checking code in __scsi_execute()?

Thanks,
Daejun
