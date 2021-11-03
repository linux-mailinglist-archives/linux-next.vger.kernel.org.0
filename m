Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD444442F0
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 14:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhKCOB6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 10:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20007 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231393AbhKCOB4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 10:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635947959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CW8I3YZzsliNqyd8AhhXKy25DJAUmvGyHVBjOhq4wVA=;
        b=I6O2+8maU2tXObcLrRJW0QxuIxKToSDQF1/t4Cz1waC3eJOiQiDf+goUqSgZv3boetONXn
        MrffW/1TsZRsMAQ7HcXHnEoCIN12LZCvC+NYbYU9DwNaIIIFeo8kjISQLUQL6O5ht7vmfg
        i6LPAi1e8Sun6UT8b/fITmRz1yzTWP8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-92ZEk_tUOgm54hKkdiQZfw-1; Wed, 03 Nov 2021 09:59:17 -0400
X-MC-Unique: 92ZEk_tUOgm54hKkdiQZfw-1
Received: by mail-yb1-f199.google.com with SMTP id v7-20020a25ab87000000b005c2130838beso4187595ybi.0
        for <linux-next@vger.kernel.org>; Wed, 03 Nov 2021 06:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CW8I3YZzsliNqyd8AhhXKy25DJAUmvGyHVBjOhq4wVA=;
        b=7uPOG2bXV4xWpZTjWNBuZetcngpzTpSQsHC5BcSlhP8m7GU9M7Mr76iFbBVvoV0B0u
         NhGag7hb7+de798hG45mMdivXVitHp7i8o8q6CXAksgMy5hYRTYU3K9nHbxZA4xe0CcH
         2FhDwFLFYFYlPoU61ci22GKSR+/OnTVh5lrPeB93no6FjgxJILf9QvEoJgwZQHQkgBXQ
         pl99kjNxktlbQ2YcosrVLmVH/X8CSstplmvv10Ppo01n82ypiKrlTDjjMhTZ3VAL4mpx
         6xPtO6m/+EjHdFXxwgLzn2aZF4iHDGRwVX1sAAG3qwXb58bdX02b4KJ/A/RLJyuzooDy
         +JzA==
X-Gm-Message-State: AOAM532ysehPJklll6nmzI0tq6lL5dj01ZSjyjsyEFpw9DXJv57YxX9U
        ss6DH8GRjy9kwJnCtclCA6X3uu+95CxWjpwPdPQL21SKw8JFGwuWIdbhBYBf3W4mq+PoLrSKvMg
        WsNuIRDZ2TIxDqYq9I15Dg8Pk6KI8ZrknIFs5uA==
X-Received: by 2002:a5b:483:: with SMTP id n3mr33120963ybp.308.1635947956966;
        Wed, 03 Nov 2021 06:59:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtCq5l4TBaigElqPlG+k4txT3x0cFcKqC4i8+0Vdo2LIUCBbBX1KIZo7bvadaSUwBjulR1c6496m/iOSXOxcM=
X-Received: by 2002:a5b:483:: with SMTP id n3mr33120752ybp.308.1635947955236;
 Wed, 03 Nov 2021 06:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <YYIHXGSb2O5va0vA@T590> <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
 <733e1dcd-36a1-903e-709a-5ebe5f491564@kernel.dk>
In-Reply-To: <733e1dcd-36a1-903e-709a-5ebe5f491564@kernel.dk>
From:   Yi Zhang <yi.zhang@redhat.com>
Date:   Wed, 3 Nov 2021 21:59:02 +0800
Message-ID: <CAHj4cs8U-Tboc-i-ZpK2-7euPZNsHja_6SWs6Ap0ywddStLC_A@mail.gmail.com>
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at block/blk-mq-sched.c:432
 blk_mq_sched_insert_request+0x54/0x178
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Ming Lei <ming.lei@redhat.com>,
        Steffen Maier <maier@linux.ibm.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 3, 2021 at 7:59 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 11/2/21 9:54 PM, Jens Axboe wrote:
> > On Nov 2, 2021, at 9:52 PM, Ming Lei <ming.lei@redhat.com> wrote:
> >>
> >> =EF=BB=BFOn Tue, Nov 02, 2021 at 09:21:10PM -0600, Jens Axboe wrote:
> >>>> On 11/2/21 8:21 PM, Yi Zhang wrote:
> >>>>>>
> >>>>>> Can either one of you try with this patch? Won't fix anything, but=
 it'll
> >>>>>> hopefully shine a bit of light on the issue.
> >>>>>>
> >>>> Hi Jens
> >>>>
> >>>> Here is the full log:
> >>>
> >>> Thanks! I think I see what it could be - can you try this one as well=
,
> >>> would like to confirm that the condition I think is triggering is wha=
t
> >>> is triggering.
> >>>
> >>> diff --git a/block/blk-mq.c b/block/blk-mq.c
> >>> index 07eb1412760b..81dede885231 100644
> >>> --- a/block/blk-mq.c
> >>> +++ b/block/blk-mq.c
> >>> @@ -2515,6 +2515,8 @@ void blk_mq_submit_bio(struct bio *bio)
> >>>    if (plug && plug->cached_rq) {
> >>>        rq =3D rq_list_pop(&plug->cached_rq);
> >>>        INIT_LIST_HEAD(&rq->queuelist);
> >>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
> >>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
> >>>    } else {
> >>>        struct blk_mq_alloc_data data =3D {
> >>>            .q        =3D q,
> >>> @@ -2535,6 +2537,8 @@ void blk_mq_submit_bio(struct bio *bio)
> >>>                bio_wouldblock_error(bio);
> >>>            goto queue_exit;
> >>>        }
> >>> +        WARN_ON_ONCE(q->elevator && !(rq->rq_flags & RQF_ELV));
> >>> +        WARN_ON_ONCE(!q->elevator && (rq->rq_flags & RQF_ELV));
> >>
> >> Hello Jens,
> >>
> >> I guess the issue could be the following code run without grabbing
> >> ->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request=
_hctx().
> >>
> >> .rq_flags       =3D q->elevator ? RQF_ELV : 0,
> >>
> >> then elevator is switched to real one from none, and check on q->eleva=
tor
> >> becomes not consistent.
> >
> > Indeed, that=E2=80=99s where I was going with this. I have a patch, tes=
ting it
> > locally but it=E2=80=99s getting late. Will send it out tomorrow. The n=
ice
> > benefit is that it allows dropping the weird ref get on plug flush,
> > and batches getting the refs as well.
>
> Yi/Steffen, can you try pulling this into your test kernel:
>
> git://git.kernel.dk/linux-block for-next
>
> and see if it fixes the issue for you. Thanks!

It still can be reproduced with the latest linux-block/for-next, here is th=
e log

fab2914e46eb (HEAD, new/for-next) Merge branch 'for-5.16/drivers' into for-=
next

[  965.892911] run blktests srp/001 at 2021-11-03 09:54:14
[  966.069421] alua: device handler registered
[  966.072163] emc: device handler registered
[  966.074955] rdac: device handler registered
[  966.079931] null_blk: module loaded
[  966.207798] rdma_rxe: loaded
[  966.213462] infiniband enc8000_rxe: set active
[  966.213467] infiniband enc8000_rxe: added enc8000
[  966.259104] scsi_debug:sdebug_add_store: dif_storep 524288 bytes @
00000000340c6f55
[  966.259306] scsi_debug:sdebug_driver_probe: scsi_debug: trim
poll_queues to 0. poll_q/nr_hw =3D (0/1)
[  966.259309] scsi_debug:sdebug_driver_probe: host protection DIF3 DIX3
[  966.259314] scsi host0: scsi_debug: version 0190 [20200710]
                 dev_size_mb=3D32, opts=3D0x0, submit_queues=3D1, statistic=
s=3D0
[  966.259933] scsi 0:0:0:0: Direct-Access     Linux    scsi_debug
  0190 PQ: 0 ANSI: 7
[  966.260273] sd 0:0:0:0: Power-on or device reset occurred
[  966.260299] sd 0:0:0:0: [sda] Enabling DIF Type 3 protection
[  966.260327] sd 0:0:0:0: [sda] 65536 512-byte logical blocks: (33.6
MB/32.0 MiB)
[  966.260337] sd 0:0:0:0: [sda] Write Protect is off
[  966.260341] sd 0:0:0:0: [sda] Mode Sense: 73 00 10 08
[  966.260352] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
enabled, supports DPO and FUA
[  966.260372] sd 0:0:0:0: [sda] Optimal transfer size 524288 bytes
[  966.261748] sd 0:0:0:0: Attached scsi generic sg0 type 0
[  966.350416] sd 0:0:0:0: [sda] Enabling DIX T10-DIF-TYPE3-CRC protection
[  966.350422] sd 0:0:0:0: [sda] DIF application tag size 6
[  966.450576] sd 0:0:0:0: [sda] Attached SCSI disk
[  966.667676] Rounding down aligned max_sectors from 4294967295 to 4294967=
288
[  966.703431] ib_srpt:srpt_add_one: ib_srpt device =3D 00000000d6a9642e
[  966.703441] ib_srpt:srpt_use_srq: ib_srpt
srpt_use_srq(enc8000_rxe): use_srq =3D 0; ret =3D 0
[  966.703443] ib_srpt:srpt_add_one: ib_srpt Target login info:
id_ext=3D00debdfffebeef80,ioc_guid=3D00debdfffebeef80,pkey=3Dffff,service_i=
d=3D00debdfffebeef80
[  966.703499] ib_srpt:srpt_add_one: ib_srpt added enc8000_rxe.
[  967.002396] Rounding down aligned max_sectors from 255 to 248
[  967.011605] Rounding down aligned max_sectors from 255 to 248
[  967.037191] Rounding down aligned max_sectors from 4294967295 to 4294967=
288
[  967.130091] ib_srp:srp_add_one: ib_srp: srp_add_one:
18446744073709551615 / 4096 =3D 4503599627370495 <> 512
[  967.130097] ib_srp:srp_add_one: ib_srp: enc8000_rxe: mr_page_shift
=3D 12, device->max_mr_size =3D 0xffffffffffffffff,
device->max_fast_reg_page_list_len =3D 512, max_pages_per_mr =3D 512,
mr_max_size =3D 0x200000
[  967.148347] ib_srp:srp_parse_in: ib_srp: 10.16.69.39 -> 10.16.69.39:0
[  967.148352] ib_srp:srp_parse_in: ib_srp: 10.16.69.39:5555 -> 10.16.69.39=
:5555
[  967.148355] ib_srp:add_target_store: ib_srp: max_sectors =3D 1024;
max_pages_per_mr =3D 512; mr_page_size =3D 4096; max_sectors_per_mr =3D
4096; mr_per_cmd =3D 2
[  967.148358] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len =3D 8260
[  967.148754] ib_srpt Received SRP_LOGIN_REQ with i_port_id
fe80:0000:0000:0000:00de:bdff:febe:ef80, t_port_id
00de:bdff:febe:ef80:00de:bdff:febe:ef80 and it_iu_len 8260 on port 1
(guid=3Dfe80:0000:0000:0000:00de:bdff:febe:ef80); pkey 0xffff
[  967.148856] ib_srpt:srpt_cm_req_recv: ib_srpt imm_data_offset =3D 68
[  967.151639] ib_srpt:srpt_create_ch_ib: ib_srpt srpt_create_ch_ib:
max_cqe=3D 8191 max_sge=3D 32 sq_size =3D 4096 ch=3D 00000000d562fdc1
[  967.151654] ib_srpt:srpt_cm_req_recv: ib_srpt registering src addr
10.16.69.39 or i_port_id 0xfe8000000000000000debdfffebeef80
[  967.151674] ib_srpt:srpt_cm_req_recv: ib_srpt Establish connection
sess=3D0000000047d911b7 name=3D10.16.69.39 ch=3D00000000d562fdc1
[  967.151699] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len =3D 8260
[  967.151702] scsi host1: ib_srp: using immediate data
[  967.152088] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-18:
queued zerolength write
[  967.152101] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-18 wc->status 0
[  967.152444] ib_srpt Received SRP_LOGIN_REQ with i_port_id
fe80:0000:0000:0000:00de:bdff:febe:ef80, t_port_id
00de:bdff:febe:ef80:00de:bdff:febe:ef80 and it_iu_len 8260 on port 1
(guid=3Dfe80:0000:0000:0000:00de:bdff:febe:ef80); pkey 0xffff
[  967.152538] ib_srpt:srpt_cm_req_recv: ib_srpt imm_data_offset =3D 68
[  967.154559] ib_srpt:srpt_create_ch_ib: ib_srpt srpt_create_ch_ib:
max_cqe=3D 8191 max_sge=3D 32 sq_size =3D 4096 ch=3D 000000001d71a872
[  967.154572] ib_srpt:srpt_cm_req_recv: ib_srpt registering src addr
10.16.69.39 or i_port_id 0xfe8000000000000000debdfffebeef80
[  967.154586] ib_srpt:srpt_cm_req_recv: ib_srpt Establish connection
sess=3D00000000af249bba name=3D10.16.69.39 ch=3D000000001d71a872
[  967.154607] ib_srp:srp_max_it_iu_len: ib_srp: max_iu_len =3D 8260
[  967.154609] scsi host1: ib_srp: using immediate data
[  967.155020] ib_srpt:srpt_zerolength_write: ib_srpt 10.16.69.39-20:
queued zerolength write
[  967.155031] ib_srpt:srpt_zerolength_write_done: ib_srpt
10.16.69.39-20 wc->status 0
[  967.155036] scsi host1: SRP.T10:00DEBDFFFEBEEF80
[  967.155533] scsi 1:0:0:0: Direct-Access     LIO-ORG  IBLOCK
  4.0  PQ: 0 ANSI: 6
[  967.155909] scsi 1:0:0:0: alua: supports implicit and explicit TPGS
[  967.155914] scsi 1:0:0:0: alua: device
naa.60014056e756c6c62300000000000000 port group 0 rel port 1
[  967.156070] sd 1:0:0:0: Warning! Received an indication that the
LUN assignments on this target have changed. The Linux SCSI layer does
not automatical
[  967.156091] sd 1:0:0:0: Attached scsi generic sg1 type 0
[  967.170537] sd 1:0:0:0: alua: transition timeout set to 60 seconds
[  967.170543] sd 1:0:0:0: alua: port group 00 state A non-preferred
supports TOlUSNA
[  967.170806] sd 1:0:0:0: [sdb] 65536 512-byte logical blocks: (33.6
MB/32.0 MiB)
[  967.170855] sd 1:0:0:0: [sdb] Write Protect is off
[  967.170858] sd 1:0:0:0: [sdb] Mode Sense: 43 00 00 08
[  967.170907] sd 1:0:0:0: [sdb] Write cache: disabled, read cache:
enabled, doesn't support DPO or FUA
[  967.170918] srpt/10.16.69.39: Unsupported SCSI Opcode 0xa3, sending
CHECK_CONDITION.
[  967.170956] sd 1:0:0:0: [sdb] Optimal transfer size 126976 bytes
[  967.172013] scsi 1:0:0:2: Direct-Access     LIO-ORG  IBLOCK
  4.0  PQ: 0 ANSI: 6
[  967.172138] scsi 1:0:0:2: alua: supports implicit and explicit TPGS
[  967.172142] scsi 1:0:0:2: alua: device
naa.60014057363736964626700000000000 port group 0 rel port 1
[  967.172205] sd 1:0:0:2: Attached scsi generic sg2 type 0
[  967.172404] sd 1:0:0:2: [sdc] 65536 512-byte logical blocks: (33.6
MB/32.0 MiB)
[  967.172425] scsi 1:0:0:1: Direct-Access     LIO-ORG  IBLOCK
  4.0  PQ: 0 ANSI: 6
[  967.172434] sd 1:0:0:2: [sdc] Write Protect is off
[  967.172437] sd 1:0:0:2: [sdc] Mode Sense: 43 00 10 08
[  967.172488] sd 1:0:0:2: [sdc] Write cache: enabled, read cache:
enabled, supports DPO and FUA
[  967.172499] srpt/10.16.69.39: Unsupported SCSI Opcode 0xa3, sending
CHECK_CONDITION.
[  967.172538] sd 1:0:0:2: [sdc] Optimal transfer size 524288 bytes
[  967.172542] scsi 1:0:0:1: alua: supports implicit and explicit TPGS
[  967.172546] scsi 1:0:0:1: alua: device
naa.60014056e756c6c62310000000000000 port group 0 rel port 1
[  967.172624] sd 1:0:0:1: Attached scsi generic sg3 type 0
[  967.172648] ib_srp:srp_add_target: ib_srp: host1: SCSI scan
succeeded - detected 3 LUNs
[  967.172650] scsi host1: ib_srp: new target: id_ext 00debdfffebeef80
ioc_guid 00debdfffebeef80 sgid fe80:0000:0000:0000:00de:bdff:febe:ef80
dest 10.16.69.39
[  967.173447] sd 1:0:0:1: Warning! Received an indication that the
LUN assignments on this target have changed. The Linux SCSI layer does
not automatical
[  967.175069] ib_srp:srp_parse_in: ib_srp: 10.16.69.39 -> 10.16.69.39:0
[  967.175073] ib_srp:srp_parse_in: ib_srp: 10.16.69.39:5555 -> 10.16.69.39=
:5555
[  967.175080] ib_srp:srp_parse_in: ib_srp:
[2620:52:0:1040:de:bdff:febe:ef80] ->
[2620:52:0:1040:de:bdff:febe:ef80]:0/168838439%0
[  967.175085] ib_srp:srp_parse_in: ib_srp:
[2620:52:0:1040:de:bdff:febe:ef80]:5555 ->
[2620:52:0:1040:de:bdff:febe:ef80]:5555/168838439%0
[  967.175087] scsi host2: ib_srp: Already connected to target port
with id_ext=3D00debdfffebeef80;ioc_guid=3D00debdfffebeef80;dest=3D2620:0052=
:0000:1040:00de:bdff:febe:ef80
[  967.190459] sd 1:0:0:1: alua: transition timeout set to 60 seconds
[  967.190464] sd 1:0:0:1: alua: port group 00 state A non-preferred
supports TOlUSNA
[  967.190612] sd 1:0:0:1: [sdd] 65536 512-byte logical blocks: (33.6
MB/32.0 MiB)
[  967.190639] sd 1:0:0:1: [sdd] Write Protect is off
[  967.190642] sd 1:0:0:1: [sdd] Mode Sense: 43 00 00 08
[  967.190688] sd 1:0:0:1: [sdd] Write cache: disabled, read cache:
enabled, doesn't support DPO or FUA
[  967.190698] srpt/10.16.69.39: Unsupported SCSI Opcode 0xa3, sending
CHECK_CONDITION.
[  967.190735] sd 1:0:0:1: [sdd] Optimal transfer size 126976 bytes
[  967.230346] sd 1:0:0:2: alua: transition timeout set to 60 seconds
[  967.230351] sd 1:0:0:2: alua: port group 00 state A non-preferred
supports TOlUSNA
[  967.232123] ib_srp:srp_parse_in: ib_srp: 10.16.69.39 -> 10.16.69.39:0
[  967.232127] ib_srp:srp_parse_in: ib_srp: 10.16.69.39:5555 -> 10.16.69.39=
:5555
[  967.232133] ib_srp:srp_parse_in: ib_srp:
[2620:52:0:1040:de:bdff:febe:ef80] ->
[2620:52:0:1040:de:bdff:febe:ef80]:0/168838439%0
[  967.232137] ib_srp:srp_parse_in: ib_srp:
[2620:52:0:1040:de:bdff:febe:ef80]:5555 ->
[2620:52:0:1040:de:bdff:febe:ef80]:5555/168838439%0
[  967.232143] ib_srp:srp_parse_in: ib_srp:
[fe80::de:bdff:febe:ef80%2] -> [fe80::de:bdff:febe:ef80]:0/168838439%2
[  967.232147] ib_srp:srp_parse_in: ib_srp:
[fe80::de:bdff:febe:ef80%2]:5555 ->
[fe80::de:bdff:febe:ef80]:5555/168838439%2
[  967.232150] scsi host2: ib_srp: Already connected to target port
with id_ext=3D00debdfffebeef80;ioc_guid=3D00debdfffebeef80;dest=3Dfe80:0000=
:0000:0000:00de:bdff:febe:ef80
[  967.295512] ------------[ cut here ]------------
[  967.295517] WARNING: CPU: 1 PID: 8 at block/blk-mq-sched.c:432
blk_mq_sched_insert_request+0x54/0x178
[  967.295529] Modules linked in: ib_srp scsi_transport_srp
target_core_pscsi target_core_file ib_srpt target_core_iblock
target_core_mod rdma_cm iw_cm ib_cm ib_umad scsi_debug rdma_rxe
ib_uverbs ip6_udp_tunnel udp_tunnel null_blk scsi_dh_rdac scsi_dh_emc
scsi_dh_alua dm_multipath ib_core sunrpc qeth_l2 bridge stp llc qeth
zcrypt_cex4 qdio ccwgroup vfio_ccw mdev vfio_iommu_type1 vfio drm fb
font drm_panel_orientation_quirks i2c_core fuse backlight zram
ip_tables xfs crc32_vx_s390 ghash_s390 prng aes_s390 des_s390 libdes
sha512_s390 sha256_s390 sha1_s390 sha_common dasd_eckd_mod dasd_mod
pkey zcrypt
[  967.295579] CPU: 1 PID: 8 Comm: kworker/u128:0 Not tainted 5.15.0.v3+ #6
[  967.295582] Hardware name: IBM 2964 N96 400 (z/VM 6.4.0)
[  967.295584] Workqueue: events_unbound async_run_entry_fn
[  967.295591] Krnl PSW : 0704e00180000000 000000004feaa208
(blk_mq_sched_insert_request+0x58/0x178)
[  967.295596]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3
CC:2 PM:0 RI:0 EA:3
[  967.295600] Krnl GPRS: 0000000000000040 000000000000001d
000000001eb37400 0000000000000001
[  967.295603]            0000000000000001 0000000000000000
000000001dbea800 000000001c739800
[  967.295605]            0000000000000000 0000000000000001
0000000000000001 000000001eb37400
[  967.295607]            00000000006ba100 000003ff7e82da00
0000038000047818 00000380000477a8
[  967.295615] Krnl Code: 000000004feaa1fc: a71effff chi %r1,-1
                          000000004feaa200: a7840004 brc 8,000000004feaa208
                         #000000004feaa204: af000000 mc 0,0
                         >000000004feaa208: 5810b01c l %r1,28(%r11)
                          000000004feaa20c: ec213bbb0055 risbg %r2,%r1,59,1=
87,0
                          000000004feaa212: a7740057 brc 7,000000004feaa2c0
                          000000004feaa216: 5810b018 l %r1,24(%r11)
                          000000004feaa21a: c01b000000ff nilf %r1,255
[  967.295635] Call Trace:
[  967.295637]  [<000000004feaa208>] blk_mq_sched_insert_request+0x58/0x178
[  967.295643]  [<000000004fe9aa2e>] blk_execute_rq+0x56/0xd8
[  967.295649]  [<000000005005cea0>] __scsi_execute+0x110/0x230
[  967.295654]  [<00000000500534bc>] scsi_vpd_inquiry+0x7c/0xc0
[  967.295660]  [<000000005005354a>] scsi_get_vpd_page+0x4a/0xf8
[  967.295663]  [<000000005006ebdc>] sd_revalidate_disk.isra.0+0xf14/0x2240
[  967.295667]  [<000000005007043a>] sd_probe+0x312/0x4b0
[  967.295670]  [<0000000050023830>] really_probe+0xd0/0x4b0
[  967.295675]  [<0000000050023dc0>] driver_probe_device+0x40/0xf0
[  967.295679]  [<00000000500244cc>] __device_attach_driver+0xa4/0x128
[  967.295682]  [<0000000050020bd0>] bus_for_each_drv+0x88/0xc0
[  967.295685]  [<0000000050022d30>] __device_attach_async_helper+0x90/0xf0
[  967.295688]  [<000000004f8fcd1e>] async_run_entry_fn+0x4e/0x1b0
[  967.295691]  [<000000004f8ef62a>] process_one_work+0x21a/0x498
[  967.295695]  [<000000004f8efdd4>] worker_thread+0x64/0x498
[  967.295697]  [<000000004f8f871c>] kthread+0x184/0x190
[  967.295702]  [<000000004f883468>] __ret_from_fork+0x40/0x58
[  967.295706]  [<00000000503d144a>] ret_from_fork+0xa/0x30
[  967.295712] Last Breaking-Event-Address:
[  967.295713]  [<0000000000000003>] 0x3
[  967.295716] ---[ end trace faff7345b32090bf ]---


>
> --
> Jens Axboe
>


--=20
Best Regards,
  Yi Zhang

