Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE1A443B4D
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 03:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhKCCYp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 22:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40707 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229974AbhKCCYp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 22:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635906129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0hxTfec/foUJpZHNSlIIBB5iQ/0J05TFVrmWAYfwsaw=;
        b=BDGjI63mk8+O2QNLmWHDBtSPZ/ZSlcUCpVx08Y68kBEgnGmQpt+Zp6Rw7MGbuMQXw3Vcw2
        XEYfK40zbkpnj+dW/SVyQZyzOYx6R4GY8osR6Wt5meRckU32dzdunpqCpNZRfWxVlTMDoK
        vrTH1UYAafsEw448vwn6oMN+x01NEdw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-Vi66jMf-P5CPbIIm7vytiw-1; Tue, 02 Nov 2021 22:22:07 -0400
X-MC-Unique: Vi66jMf-P5CPbIIm7vytiw-1
Received: by mail-yb1-f198.google.com with SMTP id t24-20020a252d18000000b005c225ae9e16so1997792ybt.15
        for <linux-next@vger.kernel.org>; Tue, 02 Nov 2021 19:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0hxTfec/foUJpZHNSlIIBB5iQ/0J05TFVrmWAYfwsaw=;
        b=YyEn5P2pQ+kxv9SVpeYhXgCvEB0f0T5uenDwl4Zxo9WVz+y0Hz/VuK9SgC7QMmxqvS
         wIjX1WNnoG+CRAMJsBiQBN4pUMoyOnj3H75ihJhld0tmEGBXAvyBfhqdFS3jUmRfPX6q
         3YIy7e+DuT19Ud3cZ2rqpDAhgWg4/jnt2DWTIXgo5oF50BFuxkWfohlEEIJyQ4bWIcC7
         AWJ9lMpHD9HE28rAraE7afItpWdr6q2Ynh53uc+X6K7bnX1EYso6gA99w6sZZ9xSeF/r
         wp1UdCarW5q1nzsqYyYfWa8fIyqzA3ZI36y5RZ9jbDJwFaDJm4Y5WtXn9ufLYY5j2ZXe
         6uDw==
X-Gm-Message-State: AOAM530Auphi7DWO+A/jgj7mKO3JBhHMb2HCMbyIWvO/ufjH5OMGtFee
        JuQ1oWT7e491BH7lgQtWwGoUO+YRMEna6glg8JkDhYV3nfjlxPj/0yUcwGuUyFN4hVjxUf3A8wL
        D9V7jlHi5AmcWkrjK4NC3bOwJXzetiyr06FOTjw==
X-Received: by 2002:a25:f50b:: with SMTP id a11mr39866967ybe.241.1635906126927;
        Tue, 02 Nov 2021 19:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8/NVoMGxaKLjdMxgABPA16raKQKSQ+NYt/DcrrEsqF3bpi/etdtfthCplYtvygitTxScsWZoI61Kmux0mgz0=
X-Received: by 2002:a25:f50b:: with SMTP id a11mr39866936ybe.241.1635906126512;
 Tue, 02 Nov 2021 19:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHj4cs-NUKzGj5pgzRhDgdrGGbgPBqUoQ44+xgvk6njH9a_RYQ@mail.gmail.com>
 <1cf57bc2-5283-a2ce-0bbc-db6a62953c8f@linux.ibm.com> <e9965a7c-faba-496e-8110-dbe8f7065080@kernel.dk>
 <4f3811f6-88d9-c0c6-055f-1a3220357e22@kernel.dk>
In-Reply-To: <4f3811f6-88d9-c0c6-055f-1a3220357e22@kernel.dk>
From:   Yi Zhang <yi.zhang@redhat.com>
Date:   Wed, 3 Nov 2021 10:21:53 +0800
Message-ID: <CAHj4cs_+ZDe3KVbKYUK0XnupTxU2MqfA6ARxMkhkTwg9hYBiLg@mail.gmail.com>
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at block/blk-mq-sched.c:432
 blk_mq_sched_insert_request+0x54/0x178
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

>
> Can either one of you try with this patch? Won't fix anything, but it'll
> hopefully shine a bit of light on the issue.
>
Hi Jens

Here is the full log:
[  566.964613] run blktests srp/001 at 2021-11-02 22:09:12
[  567.372541] alua: device handler registered
[  567.375340] emc: device handler registered
[  567.388737] rdac: device handler registered
[  567.403792] null_blk: module loaded
[  567.624077] rdma_rxe: loaded
[  567.629083] infiniband enc8000_rxe: set active
[  567.629087] infiniband enc8000_rxe: added enc8000
[  567.699017] scsi_debug:sdebug_add_store: dif_storep 524288 bytes @
000000005c9bf0dc
[  567.699682] scsi_debug:sdebug_driver_probe: scsi_debug: trim
poll_queues to 0. poll_q/nr_hw = (0/1)
[  567.699686] scsi_debug:sdebug_driver_probe: host protection DIF3 DIX3
[  567.699691] scsi host0: scsi_debug: version 0190 [20200710]
                 dev_size_mb=32, opts=0x0, submit_queues=1, statistics=0
[  567.700433] scsi 0:0:0:0: Direct-Access     Linux    scsi_debug
  0190 PQ: 0 ANSI: 7
[  567.700588] sd 0:0:0:0: Power-on or device reset occurred
[  567.700610] sd 0:0:0:0: [sda] Enabling DIF Type 3 protection
[  567.700634] sd 0:0:0:0: [sda] 65536 512-byte logical blocks: (33.6
MB/32.0 MiB)
[  567.700643] sd 0:0:0:0: [sda] Write Protect is off
[  567.700648] sd 0:0:0:0: [sda] Mode Sense: 73 00 10 08
[  567.700658] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
enabled, supports DPO and FUA
[  567.700679] sd 0:0:0:0: [sda] Optimal transfer size 524288 bytes
[  567.700807] sd 0:0:0:0: Attached scsi generic sg0 type 0
[  567.787563] sd 0:0:0:0: [sda] Enabling DIX T10-DIF-TYPE3-CRC protection
[  567.787568] sd 0:0:0:0: [sda] DIF application tag size 6
[  567.887644] sd 0:0:0:0: [sda] Attached SCSI disk
[  568.453337] Rounding down aligned max_sectors from 4294967295 to 4294967288
[  568.488877] ib_srpt:srpt_add_one: ib_srpt device = 00000000dd1cba21
[  568.488883] ib_srpt:srpt_use_srq: ib_srpt
srpt_use_srq(enc8000_rxe): use_srq = 0; ret = 0
[  568.488885] ib_srpt:srpt_add_one: ib_srpt Target login info:
id_ext=00debdfffebeef80,ioc_guid=00debdfffebeef80,pkey=ffff,service_id=00debdfffebeef80
[  568.488924] ib_srpt:srpt_add_one: ib_srpt added enc8000_rxe.
[  568.933299] Rounding down aligned max_sectors from 255 to 248
[  568.942144] Rounding down aligned max_sectors from 255 to 248
[  568.951076] Rounding down aligned max_sectors from 4294967295 to 4294967288
[  569.055204] ib_srp:srp_add_one: ib_srp: srp_add_one:
18446744073709551615 / 4096 = 4503599627370495 <> 512
[  569.055208] ib_srp:srp_add_one: ib_srp: enc8000_rxe: mr_page_shift
= 12, device->max_mr_size = 0xffffffffffffffff,
device->max_fast_reg_page_list_len = 512, max_pages_per_mr = 512,
mr_max_size = 0x200000
[  569.072666] ib_srp:srp_parse_in: ib_srp: 10.16.69.39 -> 10.16.69.39:0
[  569.072672] ib_srp:srp_parse_in: ib_srp: 10.16.69.39:5555 -> 10.16.69.39:5555
[  569.072674] ib_srp:add_target_store: ib_srp: max_sectors = 1024;
max_pages_per_mr = 512; mr_page_size = 4096; max_sectors_per_mr =
4096; mr_per_cmd = 2
[  569.072676] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  569.073279] ib_srpt Received SRP_LOGIN_REQ with i_port_id
fe80:0000:0000:0000:00de:bdff:febe:ef80, t_port_id
00de:bdff:febe:ef80:00de:bdff:febe:ef80 and it_iu_len 8260 on port 1
(guid=fe80:0000:0000:0000:00de:bdff:febe:ef80); pkey 0xffff
[  569.073366] ib_srpt:srpt_cm_req_recv: ib_srpt imm_data_offset = 68
[  569.076164] ib_srpt:srpt_create_ch_ib: ib_srpt srpt_create_ch_ib:
max_cqe= 8191 max_sge= 32 sq_size = 4096 ch= 0000000097d2923d
[  569.076177] ib_srpt:srpt_cm_req_recv: ib_srpt registering src addr
10.16.69.39 or i_port_id 0xfe8000000000000000debdfffebeef80
[  569.076201] ib_srpt:srpt_cm_req_recv: ib_srpt Establish connection
sess=00000000ffaa765e name=10.16.69.39 ch=0000000097d2923d
[  569.076233] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  569.076236] scsi host1: ib_srp: using immediate data
[  569.076606] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-18:
queued zerolength write
[  569.076620] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-18 wc->status 0
[  569.076907] ib_srpt Received SRP_LOGIN_REQ with i_port_id
fe80:0000:0000:0000:00de:bdff:febe:ef80, t_port_id
00de:bdff:febe:ef80:00de:bdff:febe:ef80 and it_iu_len 8260 on port 1
(guid=fe80:0000:0000:0000:00de:bdff:febe:ef80); pkey 0xffff
[  569.076989] ib_srpt:srpt_cm_req_recv: ib_srpt imm_data_offset = 68
[  569.079227] ib_srpt:srpt_create_ch_ib: ib_srpt srpt_create_ch_ib:
max_cqe= 8191 max_sge= 32 sq_size = 4096 ch= 0000000078d4dcf5
[  569.079240] ib_srpt:srpt_cm_req_recv: ib_srpt registering src addr
10.16.69.39 or i_port_id 0xfe8000000000000000debdfffebeef80
[  569.079255] ib_srpt:srpt_cm_req_recv: ib_srpt Establish connection
sess=0000000015a0b0b5 name=10.16.69.39 ch=0000000078d4dcf5
[  569.079311] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  569.079313] scsi host1: ib_srp: using immediate data
[  569.079669] scsi host1: SRP.T10:00DEBDFFFEBEEF80
[  569.079675] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-20:
queued zerolength write
[  569.079686] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-20 wc->status 0
[  569.080892] scsi 1:0:0:0: Direct-Access     LIO-ORG  IBLOCK
  4.0  PQ: 0 ANSI: 6
[  569.081009] scsi 1:0:0:0: alua: supports implicit and explicit TPGS
[  569.081014] scsi 1:0:0:0: alua: device
naa.60014056e756c6c62300000000000000 port group 0 rel port 1
[  569.081143] sd 1:0:0:0: Warning! Received an indication that the
LUN assignments on this target have changed. The Linux SCSI layer does
not automatical
[  569.081849] sd 1:0:0:0: Attached scsi generic sg1 type 0
[  569.097426] sd 1:0:0:0: alua: transition timeout set to 60 seconds
[  569.097431] sd 1:0:0:0: alua: port group 00 state A non-preferred
supports TOlUSNA
[  569.097619] sd 1:0:0:0: [sdb] 65536 512-byte logical blocks: (33.6
MB/32.0 MiB)
[  569.097649] sd 1:0:0:0: [sdb] Write Protect is off
[  569.097652] sd 1:0:0:0: [sdb] Mode Sense: 43 00 00 08
[  569.097680] scsi 1:0:0:2: Direct-Access     LIO-ORG  IBLOCK
  4.0  PQ: 0 ANSI: 6
[  569.097702] sd 1:0:0:0: [sdb] Write cache: disabled, read cache:
enabled, doesn't support DPO or FUA
[  569.097714] srpt/10.16.69.39: Unsupported SCSI Opcode 0xa3, sending
CHECK_CONDITION.
[  569.097753] sd 1:0:0:0: [sdb] Optimal transfer size 126976 bytes
[  569.097794] scsi 1:0:0:2: alua: supports implicit and explicit TPGS
[  569.097798] scsi 1:0:0:2: alua: device
naa.60014057363736964626700000000000 port group 0 rel port 1
[  569.098042] sd 1:0:0:2: [sdc] 65536 512-byte logical blocks: (33.6
MB/32.0 MiB)
[  569.098068] sd 1:0:0:2: [sdc] Write Protect is off
[  569.098070] sd 1:0:0:2: [sdc] Mode Sense: 43 00 10 08
[  569.098117] sd 1:0:0:2: [sdc] Write cache: enabled, read cache:
enabled, supports DPO and FUA
[  569.098129] srpt/10.16.69.39: Unsupported SCSI Opcode 0xa3, sending
CHECK_CONDITION.
[  569.098169] sd 1:0:0:2: [sdc] Optimal transfer size 524288 bytes
[  569.099162] sd 1:0:0:2: Attached scsi generic sg2 type 0
[  569.099412] scsi 1:0:0:1: Direct-Access     LIO-ORG  IBLOCK
  4.0  PQ: 0 ANSI: 6
[  569.099531] scsi 1:0:0:1: alua: supports implicit and explicit TPGS
[  569.099535] scsi 1:0:0:1: alua: device
naa.60014056e756c6c62310000000000000 port group 0 rel port 1
[  569.102434] sd 1:0:0:1: Warning! Received an indication that the
LUN assignments on this target have changed. The Linux SCSI layer does
not automatical
[  569.102913] sd 1:0:0:1: Attached scsi generic sg3 type 0
[  569.102941] ib_srp:srp_add_target: ib_srp: host1: SCSI scan
succeeded - detected 3 LUNs
[  569.102943] scsi host1: ib_srp: new target: id_ext 00debdfffebeef80
ioc_guid 00debdfffebeef80 sgid fe80:0000:0000:0000:00de:bdff:febe:ef80
dest 10.16.69.39
[  569.104669] ib_srp:srp_parse_in: ib_srp: 10.16.69.39 -> 10.16.69.39:0
[  569.104673] ib_srp:srp_parse_in: ib_srp: 10.16.69.39:5555 -> 10.16.69.39:5555
[  569.104679] ib_srp:srp_parse_in: ib_srp:
[2620:52:0:1040:de:bdff:febe:ef80] ->
[2620:52:0:1040:de:bdff:febe:ef80]:0/168838439%0
[  569.104683] ib_srp:srp_parse_in: ib_srp:
[2620:52:0:1040:de:bdff:febe:ef80]:5555 ->
[2620:52:0:1040:de:bdff:febe:ef80]:5555/168838439%0
[  569.104686] scsi host2: ib_srp: Already connected to target port
with id_ext=00debdfffebeef80;ioc_guid=00debdfffebeef80;dest=2620:0052:0000:1040:00de:bdff:febe:ef80
[  569.127417] sd 1:0:0:1: alua: transition timeout set to 60 seconds
[  569.127422] sd 1:0:0:1: alua: port group 00 state A non-preferred
supports TOlUSNA
[  569.127518] sd 1:0:0:2: alua: transition timeout set to 60 seconds
[  569.127523] sd 1:0:0:2: alua: port group 00 state A non-preferred
supports TOlUSNA
[  569.127803] sd 1:0:0:1: [sdd] 65536 512-byte logical blocks: (33.6
MB/32.0 MiB)
[  569.128220] sd 1:0:0:1: [sdd] Write Protect is off
[  569.128223] sd 1:0:0:1: [sdd] Mode Sense: 43 00 00 08
[  569.128273] sd 1:0:0:1: [sdd] Write cache: disabled, read cache:
enabled, doesn't support DPO or FUA
[  569.128284] srpt/10.16.69.39: Unsupported SCSI Opcode 0xa3, sending
CHECK_CONDITION.
[  569.128320] sd 1:0:0:1: [sdd] Optimal transfer size 126976 bytes
[  569.140904] ib_srp:srp_parse_in: ib_srp: 10.16.69.39 -> 10.16.69.39:0
[  569.140909] ib_srp:srp_parse_in: ib_srp: 10.16.69.39:5555 -> 10.16.69.39:5555
[  569.140914] ib_srp:srp_parse_in: ib_srp:
[2620:52:0:1040:de:bdff:febe:ef80] ->
[2620:52:0:1040:de:bdff:febe:ef80]:0/168838439%0
[  569.140919] ib_srp:srp_parse_in: ib_srp:
[2620:52:0:1040:de:bdff:febe:ef80]:5555 ->
[2620:52:0:1040:de:bdff:febe:ef80]:5555/168838439%0
[  569.140926] ib_srp:srp_parse_in: ib_srp:
[fe80::de:bdff:febe:ef80%2] -> [fe80::de:bdff:febe:ef80]:0/168838439%2
[  569.140932] ib_srp:srp_parse_in: ib_srp:
[fe80::de:bdff:febe:ef80%2]:5555 ->
[fe80::de:bdff:febe:ef80]:5555/168838439%2
[  569.140934] scsi host2: ib_srp: Already connected to target port
with id_ext=00debdfffebeef80;ioc_guid=00debdfffebeef80;dest=fe80:0000:0000:0000:00de:bdff:febe:ef80
[  569.197816] tag=31/-1, e=16ac2000, rq cmd_flags 22, rq_flags 2800
[  569.247577] sd 1:0:0:2: [sdc] Attached SCSI disk
[  569.248420] tag=25/-1, e=1c08c400, rq cmd_flags 22, rq_flags 2800
[  569.248569] sd 1:0:0:1: [sdd] Attached SCSI disk
[  569.248931] tag=29/-1, e=16ac0800, rq cmd_flags 22, rq_flags 2800
[  569.249108] sd 1:0:0:0: [sdb] Attached SCSI disk
[  569.305302] rdma_rxe: rxe_invalidate_mr: rkey (0x84f6) doesn't
match mr->ibmr.rkey (0x84f7)
[  569.305315] scsi host1: ib_srp: failed RECV status WR flushed (5)
for CQE 00000000a216794f
[  569.367710] scsi 1:0:0:0: alua: Detached
[  576.367413] scsi host1: SRP abort called
[  579.907417] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  579.907624] ib_srpt receiving failed for ioctx 000000005e721910 with status 5
[  579.907631] ib_srpt receiving failed for ioctx 0000000056beb878 with status 5
[  579.907634] ib_srpt receiving failed for ioctx 000000001f2eb0be with status 5
[  579.907636] ib_srpt receiving failed for ioctx 00000000338f74b5 with status 5
[  579.907639] ib_srpt receiving failed for ioctx 00000000d57a4874 with status 5
[  579.907642] ib_srpt receiving failed for ioctx 00000000806f7498 with status 5
[  579.907646] ib_srpt receiving failed for ioctx 00000000330004a8 with status 5
[  579.907649] ib_srpt receiving failed for ioctx 00000000833f52ea with status 5
[  579.907652] ib_srpt receiving failed for ioctx 00000000a4a4cd8e with status 5
[  579.907656] ib_srpt receiving failed for ioctx 000000006f7d8b81 with status 5
[  580.127744] ib_srpt Received SRP_LOGIN_REQ with i_port_id
fe80:0000:0000:0000:00de:bdff:febe:ef80, t_port_id
00de:bdff:febe:ef80:00de:bdff:febe:ef80 and it_iu_len 8260 on port 1
(guid=fe80:0000:0000:0000:00de:bdff:febe:ef80); pkey 0xffff
[  580.127890] ib_srpt:srpt_cm_req_recv: ib_srpt imm_data_offset = 68
[  580.130681] ib_srpt:srpt_create_ch_ib: ib_srpt srpt_create_ch_ib:
max_cqe= 8191 max_sge= 32 sq_size = 4096 ch= 000000003dffffde
[  580.130694] ib_srpt:srpt_cm_req_recv: ib_srpt registering src addr
10.16.69.39 or i_port_id 0xfe8000000000000000debdfffebeef80
[  580.130714] ib_srpt:srpt_cm_req_recv: ib_srpt Establish connection
sess=00000000d7a559cb name=10.16.69.39 ch=000000003dffffde
[  580.130737] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  580.130740] scsi host1: ib_srp: using immediate data
[  580.130785] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-23:
queued zerolength write
[  580.130801] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-23 wc->status 0
[  580.130825] ib_srpt Received SRP_LOGIN_REQ with i_port_id
fe80:0000:0000:0000:00de:bdff:febe:ef80, t_port_id
00de:bdff:febe:ef80:00de:bdff:febe:ef80 and it_iu_len 8260 on port 1
(guid=fe80:0000:0000:0000:00de:bdff:febe:ef80); pkey 0xffff
[  580.130926] ib_srpt:srpt_cm_req_recv: ib_srpt imm_data_offset = 68
[  580.132805] ib_srpt:srpt_create_ch_ib: ib_srpt srpt_create_ch_ib:
max_cqe= 8191 max_sge= 32 sq_size = 4096 ch= 00000000518459a5
[  580.132820] ib_srpt:srpt_cm_req_recv: ib_srpt registering src addr
10.16.69.39 or i_port_id 0xfe8000000000000000debdfffebeef80
[  580.132832] ib_srpt:srpt_cm_req_recv: ib_srpt Establish connection
sess=00000000292cad95 name=10.16.69.39 ch=00000000518459a5
[  580.132851] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  580.132852] scsi host1: ib_srp: using immediate data
[  580.132875] scsi host1: ib_srp: reconnect succeeded
[  580.132883] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-24:
queued zerolength write
[  580.132894] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-24 wc->status 0
[  582.027396] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-20:
queued zerolength write
[  582.027406] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-18:
queued zerolength write
[  582.027425] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-20 wc->status 5
[  582.027429] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-18 wc->status 5
[  582.027432] ib_srpt:srpt_release_channel_work: ib_srpt 10.16.69.39-20
[  582.027440] ib_srpt:srpt_release_channel_work: ib_srpt 10.16.69.39-18
[  614.717672] ib_srpt Closing channel 10.16.69.39-23 because target
enc8000_rxe_1 has been disabled
[  614.717687] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-23:
queued zerolength write
[  614.717693] ib_srpt Closing channel 10.16.69.39-24 because target
enc8000_rxe_1 has been disabled
[  614.717696] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-24:
queued zerolength write
[  614.717802] srpt_recv_done: 246 callbacks suppressed
[  614.717803] ib_srpt receiving failed for ioctx 000000005b444422 with status 5
[  614.717809] ib_srpt receiving failed for ioctx 00000000776294fd with status 5
[  614.717812] ib_srpt receiving failed for ioctx 000000002feadcfd with status 5
[  614.717815] ib_srpt receiving failed for ioctx 000000006a886bb2 with status 5
[  614.717818] ib_srpt receiving failed for ioctx 0000000016397dad with status 5
[  614.717822] ib_srpt receiving failed for ioctx 00000000740fece1 with status 5
[  614.717825] ib_srpt receiving failed for ioctx 00000000e7518963 with status 5
[  614.717829] ib_srpt receiving failed for ioctx 00000000eb32ccfd with status 5
[  614.717833] ib_srpt receiving failed for ioctx 000000009d275157 with status 5
[  614.717837] ib_srpt receiving failed for ioctx 00000000549482a1 with status 5
[  614.717865] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-23 wc->status 5
[  614.717880] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-24 wc->status 5
[  614.717894] ib_srpt:srpt_release_channel_work: ib_srpt 10.16.69.39-23
[  614.717902] ib_srpt:srpt_release_channel_work: ib_srpt 10.16.69.39-24
[  614.717915] scsi host1: ib_srp: received DREQ
[  614.717997] scsi host1: ib_srp: failed RECV status WR flushed (5)
for CQE 000000005a1c1db0
[  614.721889] scsi host1: ib_srp: received DREQ
[  614.721905] ib_srpt:srpt_close_ch: ib_srpt 10.16.69.39: already closed
[  614.721964] ib_srpt:srpt_close_ch: ib_srpt 10.16.69.39: already closed
[  616.827436] scsi host1: ib_srp: connection closed
[  616.827446] scsi host1: ib_srp: connection closed
[  625.347390] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  625.567932] scsi host1: ib_srp: REJ received
[  625.567935] scsi host1:   REJ reason 0x8
[  625.567953] scsi host1: reconnect attempt 1 failed (-104)
[  629.787421] fast_io_fail_tmo expired for SRP port-1:1 / host1.
[  636.187360] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  636.407959] scsi host1: ib_srp: REJ received
[  636.407963] scsi host1:   REJ reason 0x8
[  636.407982] scsi host1: reconnect attempt 2 failed (-104)
[  646.427427] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  646.647993] scsi host1: ib_srp: REJ received
[  646.647997] scsi host1:   REJ reason 0x8
[  646.648017] scsi host1: reconnect attempt 3 failed (-104)
[  656.667405] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  656.887953] scsi host1: ib_srp: REJ received
[  656.887958] scsi host1:   REJ reason 0x8
[  656.887979] scsi host1: reconnect attempt 4 failed (-104)
[  666.907388] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  667.127961] scsi host1: ib_srp: REJ received
[  667.127965] scsi host1:   REJ reason 0x8
[  667.127989] scsi host1: reconnect attempt 5 failed (-104)
[  677.147368] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  677.377871] scsi host1: ib_srp: REJ received
[  677.377874] scsi host1:   REJ reason 0x8
[  677.377892] scsi host1: reconnect attempt 6 failed (-104)
[  687.387428] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  687.607973] scsi host1: ib_srp: REJ received
[  687.607977] scsi host1:   REJ reason 0x8
[  687.608006] scsi host1: reconnect attempt 7 failed (-104)
[  687.608014] sd 1:0:0:1: rejecting I/O to offline device
[  697.627395] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  697.848018] scsi host1: ib_srp: REJ received
[  697.848022] scsi host1:   REJ reason 0x8
[  697.848070] ------------[ cut here ]------------
[  697.848076] WARNING: CPU: 1 PID: 1973 at block/blk-mq.c:294
blk_mq_unquiesce_queue+0xb2/0xc8
[  697.848087] Modules linked in: ib_srp scsi_transport_srp rdma_cm
iw_cm ib_cm ib_umad scsi_debug rdma_rxe ib_uverbs ip6_udp_tunnel
udp_tunnel null_blk scsi_dh_rdac scsi_dh_emc scsi_dh_alua dm_multipath
ib_core sunrpc qeth_l2 bridge stp llc qeth qdio ccwgroup vfio_ccw mdev
zcrypt_cex4 vfio_iommu_type1 vfio drm fb fuse font
drm_panel_orientation_quirks i2c_core backlight zram ip_tables xfs
crc32_vx_s390 ghash_s390 prng aes_s390 des_s390 libdes sha512_s390
sha256_s390 sha1_s390 sha_common dasd_eckd_mod dasd_mod pkey zcrypt
[last unloaded: target_core_mod]
[  697.848149] CPU: 1 PID: 1973 Comm: kworker/1:5 Not tainted 5.15.0+ #4
[  697.848154] Hardware name: IBM 2964 N96 400 (z/VM 6.4.0)
[  697.848158] Workqueue: events_long srp_reconnect_work [scsi_transport_srp]
[  697.848168] Krnl PSW : 0404c00180000000 000000003253c696
(blk_mq_unquiesce_queue+0xb6/0xc8)
[  697.848183]            R:0 T:1 IO:0 EX:0 Key:0 M:1 W:0 P:0 AS:3
CC:0 PM:0 RI:0 EA:3
[  697.848187] Krnl GPRS: 00000000000000d4 0000000000000000
00000000078b4f30 0000000000000002
[  697.848190]            0000000000000004 0000000000000009
ffffffffffffff98 00000000326f7df0
[  697.848192]            000003800729fcdc 0000000000000007
070003800729fb00 00000000078b4ec0
[  697.848194]            000000001b9b2100 0000000000000000
000003800729fb00 000003800729fac0
[  697.848203] Krnl Code: 000000003253c68a: a7180001 lhi %r1,1
                          000000003253c68e: a7f4ffd7 brc 15,000000003253c63c
                         #000000003253c692: af000000 mc 0,0
                         >000000003253c696: a7180000 lhi %r1,0
                          000000003253c69a: a7f4ffd1 brc 15,000000003253c63c
                          000000003253c69e: c0e500071f89 brasl
%r14,00000000326205b0
                          000000003253c6a4: a7f4ffbe brc 15,000000003253c620
                          000000003253c6a8: c004002ce124 brcl 0,0000000032ad88f0
[  697.848221] Call Trace:
[  697.848224]  [<000000003253c696>] blk_mq_unquiesce_queue+0xb6/0xc8
[  697.848230]  [<00000000326f7da0>]
scsi_internal_device_unblock_nowait+0x50/0xa0
[  697.848235]  [<00000000326f7e30>] device_unblock+0x40/0x50
[  697.848238]  [<00000000326ef9c8>] starget_for_each_device+0xa8/0xd0
[  697.848244]  [<00000000326f862e>] target_unblock+0x56/0x68
[  697.848247]  [<00000000326b7018>] device_for_each_child+0x60/0xa0
[  697.848251]  [<00000000326f7ea6>] scsi_target_unblock+0x66/0x78
[  697.848253]  [<000003ff808e3872>] srp_reconnect_rport+0x202/0x238
[scsi_transport_srp]
[  697.848340]  [<000003ff808e3902>] srp_reconnect_work+0x5a/0xf0
[scsi_transport_srp]
[  697.848345]  [<0000000031f8b62a>] process_one_work+0x21a/0x498
[  697.848349]  [<0000000031f8bdd4>] worker_thread+0x64/0x498
[  697.848351]  [<0000000031f9471c>] kthread+0x184/0x190
[  697.848356]  [<0000000031f1f468>] __ret_from_fork+0x40/0x58
[  697.848359]  [<0000000032a6d2da>] ret_from_fork+0xa/0x30
[  697.848365] Last Breaking-Event-Address:
[  697.848367]  [<0000000000000000>] 0x0
[  697.848370] ---[ end trace 270726b44805023e ]---
[  697.848374] scsi host1: reconnect attempt 8 failed (-104)
[  707.867368] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  708.087976] scsi host1: ib_srp: REJ received
[  708.087981] scsi host1:   REJ reason 0x8
[  708.088024] scsi host1: reconnect attempt 9 failed (-104)
[  718.107392] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  718.327884] scsi host1: ib_srp: REJ received
[  718.327888] scsi host1:   REJ reason 0x8
[  718.327929] scsi host1: reconnect attempt 10 failed (-104)
[  728.347398] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  728.567888] scsi host1: ib_srp: REJ received
[  728.567891] scsi host1:   REJ reason 0x8
[  728.567931] scsi host1: reconnect attempt 11 failed (-104)
[  735.447460] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  738.587419] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  738.807992] scsi host1: ib_srp: REJ received
[  738.807995] scsi host1:   REJ reason 0x8
[  738.808049] scsi host1: reconnect attempt 12 failed (-104)
[  759.067426] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  759.288047] scsi host1: ib_srp: REJ received
[  759.288051] scsi host1:   REJ reason 0x8
[  759.288103] scsi host1: reconnect attempt 13 failed (-104)
[  789.787399] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  790.007875] scsi host1: ib_srp: REJ received
[  790.007878] scsi host1:   REJ reason 0x8
[  790.007922] scsi host1: reconnect attempt 14 failed (-104)
[  830.107393] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  830.329148] scsi host1: ib_srp: REJ received
[  830.329152] scsi host1:   REJ reason 0x8
[  830.329221] scsi host1: reconnect attempt 15 failed (-104)
[  883.867389] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  884.087954] scsi host1: ib_srp: REJ received
[  884.087958] scsi host1:   REJ reason 0x8
[  884.088004] scsi host1: reconnect attempt 16 failed (-104)
[  945.307398] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[  945.527867] scsi host1: ib_srp: REJ received
[  945.527870] scsi host1:   REJ reason 0x8
[  945.527914] scsi host1: reconnect attempt 17 failed (-104)
[ 1016.987360] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[ 1017.207882] scsi host1: ib_srp: REJ received
[ 1017.207885] scsi host1:   REJ reason 0x8
[ 1017.207937] scsi host1: reconnect attempt 18 failed (-104)
[ 1098.907436] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len = 8260
[ 1099.127947] scsi host1: ib_srp: REJ received
[ 1099.127951] scsi host1:   REJ reason 0x8
[ 1099.128003] scsi host1: reconnect attempt 19 failed (-104)


>
> diff --git a/block/blk-mq-sched.c b/block/blk-mq-sched.c
> index 4a6789e4398b..1b7647722ec0 100644
> --- a/block/blk-mq-sched.c
> +++ b/block/blk-mq-sched.c
> @@ -429,7 +429,8 @@ void blk_mq_sched_insert_request(struct request *rq, bool at_head,
>         struct blk_mq_ctx *ctx = rq->mq_ctx;
>         struct blk_mq_hw_ctx *hctx = rq->mq_hctx;
>
> -       WARN_ON(e && (rq->tag != BLK_MQ_NO_TAG));
> +       if (e && (rq->tag != BLK_MQ_NO_TAG))
> +               printk("tag=%d/%d, e=%lx, rq cmd_flags %x, rq_flags %x\n", rq->tag, rq->internal_tag, (long) e, rq->cmd_flags, rq->rq_flags);
>
>         if (blk_mq_sched_bypass_insert(hctx, rq)) {
>                 /*
>
> --
> Jens Axboe
>


-- 
Best Regards,
  Yi Zhang

