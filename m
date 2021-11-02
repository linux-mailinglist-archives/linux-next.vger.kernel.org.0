Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C956443638
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 20:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhKBTEt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 15:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhKBTEs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 15:04:48 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C29AC061203
        for <linux-next@vger.kernel.org>; Tue,  2 Nov 2021 12:02:13 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id h2so53619ili.11
        for <linux-next@vger.kernel.org>; Tue, 02 Nov 2021 12:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=p1ZO8DjhoPYlCBnJdK0oB0Gtbblw58C5W0XZSe5j8qw=;
        b=gOBOVyi2mG/m29GEoMbRVQlmaDU1ae6Y0eMYJ2LKgfFOV2TZmp/j4vxSU2Aq+nj0fT
         nQwelkOnLtOiyA54pjqrMwYoezZnsMFZSbn6GFEwD9oLOuz87UXrRlPsxLMB1mZ534dq
         VNZI6o9OPVLkqhmqCN1n5Ycy3TebDWzha/3DfmVh0KIZDO6CusvK3JIvefeAEJdg8vhf
         y0ye5l1NFYopjDGOyCFUXlzY17PxkKo8L0vHU0gM4cZFuK4sqioMtzJb6zd9f3HazziF
         BM81tzfi9FvshaByjxp4PNuBfodB9OEEWuyOEPruT4IBHgeMEZ+6eJ5fdySjKgBiw0Un
         Flug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p1ZO8DjhoPYlCBnJdK0oB0Gtbblw58C5W0XZSe5j8qw=;
        b=XeY/8MI1eQSjXFQuUljmM3qpKO+GHSE2OjHbUtahykse5fV2Pq5O6gmXgzMsy4etcV
         1H4T3QT8al1HKs1+NENF0oCWtoe8nDf5ymiz0OFk8UBxCk/1T54v4X7dWWIC0jEGSTJO
         23TaTpXL+hxOu63f4eWWCUvofz+nRWRBUZuMc7p/+WHiPh4FO4jI9W4sDchXww9MXo4t
         vuJb6Kcl35R+FbgL1OHozb/Ca2JS7fsEaQQM49BfCdCNJeh0zhtayym7TNHZCpzy1qNf
         gCHxUOOS6zeNVNTaet1p7DqEfp7/yffBBg0A2rkb07illN5yhqTYOnrtBgZU6QYZFgZ7
         r/OQ==
X-Gm-Message-State: AOAM531Xi57HTBebX3VvGsQKA8nS2mBCS2uaJciB/+JsoT+Tb013bcXU
        w9cIgM/QFVGaEMgxbResgsYgR5AtoYPiTQ==
X-Google-Smtp-Source: ABdhPJz/SLeGY0LX6QEbXJ6xmURQBtwkpoAwWQ8j3kk9iwLLH8zuB/srcRfKQ5kqvQ56tZRMGc7hRw==
X-Received: by 2002:a05:6e02:b22:: with SMTP id e2mr5047164ilu.73.1635879732818;
        Tue, 02 Nov 2021 12:02:12 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id l14sm457670iow.31.2021.11.02.12.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 12:02:12 -0700 (PDT)
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
To:     Steffen Maier <maier@linux.ibm.com>,
        Yi Zhang <yi.zhang@redhat.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
References: <CAHj4cs-NUKzGj5pgzRhDgdrGGbgPBqUoQ44+xgvk6njH9a_RYQ@mail.gmail.com>
 <1cf57bc2-5283-a2ce-0bbc-db6a62953c8f@linux.ibm.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <e9965a7c-faba-496e-8110-dbe8f7065080@kernel.dk>
Date:   Tue, 2 Nov 2021 13:02:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1cf57bc2-5283-a2ce-0bbc-db6a62953c8f@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/2/21 1:00 PM, Steffen Maier wrote:
> On 11/2/21 07:42, Yi Zhang wrote:
>> Below WARNING was triggered with blktests srp/001 on the latest
>> linux-block/for-next, and it cannot be reproduced with v5.15, pls help
>> check it, thanks.
>>
>> 88d2c6ab15f7 (origin/for-next) Merge branch 'for-5.16/block' into for-next
> 
> Same warning here with a slightly different stack trace.
> It breaks root-fs on zfcp-attached SCSI disks for us, because we run our CI 
> intentionally with panic_on_warn.
> 
>> [    9.031740] ------------[ cut here ]------------
>> [    9.031743] WARNING: CPU: 13 PID: 196 at block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
>> [    9.031751] Modules linked in: nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) dm_service_time(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) ip_set(E) nf_tables(E) nfnetlink(E) sunrpc(E) zfcp(E) scsi_transport_fc(E) dm_multipath(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) s390_trng(E) vfio_ccw(E) mdev(E) vfio_iommu_type1(E) zcrypt_cex4(E) vfio(E) eadm_sch(E) sch_fq_codel(E) configfs(E) ip_tables(E) x_tables(E) ghash_s390(E) prng(E) aes_s390(E) des_s390(E) libdes(E) sha3_512_s390(E) sha3_256_s390(E) sha512_s390(E) sha256_s390(E) sha1_s390(E) sha_common(E) pkey(E) zcrypt(E) rng_core(E) autofs4(E)
>> [    9.031785] CPU: 13 PID: 196 Comm: kworker/13:2 Tainted: G            E     5.16.0-20211102.rc0.git0.9febf1194306.300.fc34.s390x+next #1
>> [    9.031789] Hardware name: IBM 3906 M04 704 (LPAR)
>> [    9.031791] Workqueue: kaluad alua_rtpg_work [scsi_dh_alua]
>> [    9.031795] Krnl PSW : 0704e00180000000 000000006558e948 (blk_mq_sched_insert_request+0x58/0x178)
>> [    9.031800]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:2 PM:0 RI:0 EA:3
>> [    9.031803] Krnl GPRS: 0000000000000080 00000000000004c6 00000000ade56000 0000000000000001
>> [    9.031806]            0000000000000001 0000000000000000 00000000a2d6a400 0000000084003c00
>> [    9.031808]            0000000000000000 0000000000000001 0000000000000001 00000000ade56000
>> [    9.031810]            000000008aef0000 000003ff7af59400 000003800e3d7b00 000003800e3d7a90
>> [    9.031817] Krnl Code: 000000006558e93c: a71effff		chi	%r1,-1
>>                           000000006558e940: a7840004		brc	8,000000006558e948
>>                          #000000006558e944: af000000		mc	0,0
>>                          >000000006558e948: 5810b01c		l	%r1,28(%r11)
>>                           000000006558e94c: ec213bbb0055	risbg	%r2,%r1,59,187,0
>>                           000000006558e952: a7740057		brc	7,000000006558ea00
>>                           000000006558e956: 5810b018		l	%r1,24(%r11)
>>                           000000006558e95a: c01b000000ff	nilf	%r1,255
>> [    9.031833] Call Trace:
>> [    9.031835]  [<000000006558e948>] blk_mq_sched_insert_request+0x58/0x178 
>> [    9.031838]  [<000000006557effe>] blk_execute_rq+0x56/0xd8 
>> [    9.031841]  [<0000000065768708>] __scsi_execute+0x118/0x240 
>> [    9.031847]  [<000003ff803c3788>] alua_rtpg+0x120/0x8f8 [scsi_dh_alua] 
>> [    9.031849]  [<000003ff803c402c>] alua_rtpg_work+0xcc/0x648 [scsi_dh_alua] 
>> [    9.031852]  [<0000000064f024d2>] process_one_work+0x1fa/0x470 
>> [    9.031856]  [<0000000064f02c74>] worker_thread+0x64/0x498 
>> [    9.031859]  [<0000000064f0a894>] kthread+0x17c/0x188 
>> [    9.031861]  [<0000000064e933c4>] __ret_from_fork+0x3c/0x58 
>> [    9.031864]  [<0000000065a71cea>] ret_from_fork+0xa/0x40 
>> [    9.031868] Last Breaking-Event-Address:
>> [    9.031869]  [<000000006557ef72>] blk_execute_rq_nowait+0x82/0x98
>> [    9.031871] Kernel panic - not syncing: panic_on_warn set ...

I'm looking into this one, it's a bit puzzling. The WARN is:

WARN_ON(e && (rq->tag != BLK_MQ_NO_TAG));

which is "we have an elevator", yet the tag isn't initialized to BLK_MQ_NO_TAG.
That seems to hint at the initialization changes there, but nothing sticks out
there for me.

I'll keep looking.

-- 
Jens Axboe

