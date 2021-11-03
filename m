Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8711443C14
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 05:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhKCEDZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 00:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33841 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229899AbhKCEDY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 00:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635912048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2BSPWZQMruRW/mKA0nL0R6gEAavXmbvIhxUFLaA63D4=;
        b=K2gvr0kNWEc4VKw2JfPg1rIBkLPinFuCg21ZQylDurZFz61pH8Tdp64m8kGgk8+pFRHZs4
        KIIRBWKJrF8HV662SMHeUYEyt+clDM0vNHkEXI55wks/+g2YAFzOapJbGZp6iTne2hJzX8
        2JJUOAXy06Yq0PUNqi2t+vcZoAJWCzg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-Eh6qmltUMO6qYDtSxjNItA-1; Wed, 03 Nov 2021 00:00:46 -0400
X-MC-Unique: Eh6qmltUMO6qYDtSxjNItA-1
Received: by mail-yb1-f197.google.com with SMTP id f92-20020a25a465000000b005bea37bc0baso2378598ybi.5
        for <linux-next@vger.kernel.org>; Tue, 02 Nov 2021 21:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2BSPWZQMruRW/mKA0nL0R6gEAavXmbvIhxUFLaA63D4=;
        b=xQQpa7QkDInQIPNwZbwCMkgbPOHX9D5btpkURkyeyW8Ltm9pplq+11hE4PxF9aHPNP
         w2o6+j/8PKaHXQE2vn2Zz0aY1BnJz2mPI4qzlfZ4aSNAdgpQlU+xbvzsjhC0JY3GRIbM
         VG7qFDxdVhvHv9Kcx1HmTMZiguzS0Zxz2oAp322qMRooxCp0EBuQqDyfYSiR2Fb4RdMl
         poBqf/MurRUVvZ+/dr6LOfsTmtZfMaPtxRGz/SL78/CKJvb8YmXVMECazFbAmtI6E7Wb
         3H3J9XYq+kjbBx4P5R84gydXHU+p1xweMVI9b1erqDnjhkiNy9qmPw1TrCrJV6SF5MUo
         bPmw==
X-Gm-Message-State: AOAM5311sudPHAxFiq4YMC2d2Chij/Cj1pe0cSSg/lN5pOO89vDmr886
        RzSu04cKQCWqYZOEw9QOCe4hN/ZphfvKCNdOEElStOrAFRJmpmxhMgqbUsMhssz3D1y6HFhtRaT
        rtq+MFpGkhE2lBB3Rwk6BCiEJVxePT7Yx/Wnnkw==
X-Received: by 2002:a25:b9cc:: with SMTP id y12mr21981211ybj.153.1635912046073;
        Tue, 02 Nov 2021 21:00:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG7CPF2gOUw9KSy0Skltd40MeRVRHWlGxFSx8KR+Na/vVkpLKea0aX1XOArOgCCHwooO598VJ/zTF6ntswmjc=
X-Received: by 2002:a25:b9cc:: with SMTP id y12mr21981173ybj.153.1635912045738;
 Tue, 02 Nov 2021 21:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <YYIHXGSb2O5va0vA@T590> <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
In-Reply-To: <85F2E9AC-385F-4BCA-BD3C-7A093442F87F@kernel.dk>
From:   Yi Zhang <yi.zhang@redhat.com>
Date:   Wed, 3 Nov 2021 12:00:34 +0800
Message-ID: <CAHj4cs-pTYoksSQDjfFpK13Xtg0jB6EOvhfOZu5cDHowZa=ueg@mail.gmail.com>
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

> >
> > Hello Jens,
> >
> > I guess the issue could be the following code run without grabbing
> > ->q_usage_counter from blk_mq_alloc_request() and blk_mq_alloc_request_=
hctx().
> >
> > .rq_flags       =3D q->elevator ? RQF_ELV : 0,
> >
> > then elevator is switched to real one from none, and check on q->elevat=
or
> > becomes not consistent.
>
> Indeed, that=E2=80=99s where I was going with this. I have a patch, testi=
ng it locally but it=E2=80=99s getting late. Will send it out tomorrow. The=
 nice benefit is that it allows dropping the weird ref get on plug flush, a=
nd batches getting the refs as well.
>

Hi Jens
Here is the log in case you still need it. :)

[  147.962222] run blktests srp/001 at 2021-11-02 23:57:02
[  148.220309] alua: device handler registered
[  148.223332] emc: device handler registered
[  148.226203] rdac: device handler registered
[  148.231724] null_blk: module loaded
[  150.275727] rdma_rxe: loaded
[  150.281728] infiniband enc8000_rxe: set active
[  150.281732] infiniband enc8000_rxe: added enc8000
[  150.381380] scsi_debug:sdebug_add_store: dif_storep 524288 bytes @ 00000=
00098
4c2b06
[  150.382109] scsi_debug:sdebug_driver_probe: scsi_debug: trim poll_queues=
 to 0
. poll_q/nr_hw =3D (0/1)
[  150.382112] scsi_debug:sdebug_driver_probe: host protection DIF3 DIX3
[  150.382116] scsi host0: scsi_debug: version 0190 [20200710]
[  150.382116]   dev_size_mb=3D32, opts=3D0x0, submit_queues=3D1, statistic=
s=3D0
[  150.382802] scsi 0:0:0:0: Direct-Access     Linux    scsi_debug       01=
90 PQ
: 0 ANSI: 7
[  150.383007] sd 0:0:0:0: Power-on or device reset occurred
[  150.383029] sd 0:0:0:0: [sda] Enabling DIF Type 3 protection
[  150.383053] sd 0:0:0:0: [sda] 65536 512-byte logical blocks: (33.6 MB/32=
.0 Mi
B)
[  150.383061] sd 0:0:0:0: [sda] Write Protect is off
[  150.383075] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 supp
orts DPO and FUA
[  150.383093] sd 0:0:0:0: [sda] Optimal transfer size 524288 bytes
[  150.383104] sd 0:0:0:0: Attached scsi generic sg0 type 0
[  150.467327] sd 0:0:0:0: [sda] Enabling DIX T10-DIF-TYPE3-CRC protection
[  150.467332] sd 0:0:0:0: [sda] DIF application tag size 6
[  150.547390] sd 0:0:0:0: [sda] Attached SCSI disk
[  150.655136] Rounding down aligned max_sectors from 4294967295 to 4294967=
288
[  151.972911] Rounding down aligned max_sectors from 255 to 248
[  151.982162] Rounding down aligned max_sectors from 255 to 248
[  151.991500] Rounding down aligned max_sectors from 4294967295 to 4294967=
288
[  153.254537] ib_srpt Received SRP_LOGIN_REQ with i_port_id fe80:0000:0000=
:0000
:00de:bdff:febe:ef80, t_port_id 00de:bdff:febe:ef80:00de:bdff:febe:ef80 and=
 it_i
u_len 8260 on port 1 (guid=3Dfe80:0000:0000:0000:00de:bdff:febe:ef80); pkey=
 0xffff

[  153.262242] ib_srpt Received SRP_LOGIN_REQ with i_port_id fe80:0000:0000=
:0000
:00de:bdff:febe:ef80, t_port_id 00de:bdff:febe:ef80:00de:bdff:febe:ef80 and=
 it_i
u_len 8260 on port 1 (guid=3Dfe80:0000:0000:0000:00de:bdff:febe:ef80); pkey=
 0xffff

[  153.264644] scsi host1: SRP.T10:00DEBDFFFEBEEF80
[  153.265188] scsi 1:0:0:0: Direct-Access     LIO-ORG  IBLOCK           4.=
0  PQ
: 0 ANSI: 6
[  153.265611] scsi 1:0:0:0: alua: supports implicit and explicit TPGS
[  153.265618] scsi 1:0:0:0: alua: device naa.60014056e756c6c62300000000000=
000
ort group 0 rel port 1
[  153.265765] sd 1:0:0:0: Warning! Received an indication that the LUN ass=
ignme
nts on this target have changed. The Linux SCSI layer does not automatical
[  153.265782] sd 1:0:0:0: Attached scsi generic sg1 type 0
[  153.287283] sd 1:0:0:0: alua: transition timeout set to 60 seconds
[  153.287299] sd 1:0:0:0: alua: port group 00 state A non-preferred suppor=
ts TO
lUSNA
[  153.287479] scsi 1:0:0:2: Direct-Access     LIO-ORG  IBLOCK           4.=
0  PQ
: 0 ANSI: 6
[  153.287656] sd 1:0:0:0: [sdb] 65536 512-byte logical blocks: (33.6 MB/32=
.0 Mi
B)
[  153.287687] scsi 1:0:0:2: alua: supports implicit and explicit TPGS
[  153.287691] scsi 1:0:0:2: alua: device naa.60014057363736964626700000000=
000 p
ort group 0 rel port 1
[  153.287824] sd 1:0:0:2: Attached scsi generic sg2 type 0
[  153.288006] sd 1:0:0:0: [sdb] Write Protect is off
[  153.288133] scsi 1:0:0:1: Direct-Access     LIO-ORG  IBLOCK           4.=
0  PQ
: 0 ANSI: 6
[  153.288161] sd 1:0:0:0: [sdb] Write cache: disabled, read cache: enabled=
, doe
sn't support DPO or FUA
[  153.288171] srpt/10.16.69.39: Unsupported SCSI Opcode 0xa3, sending CHEC=
K_CON
DITION.
[  153.288817] sd 1:0:0:0: [sdb] Optimal transfer size 126976 bytes
[  153.289825] sd 1:0:0:2: [sdc] 65536 512-byte logical blocks: (33.6 MB/32=
.0 Mi
B)
[  153.289853] scsi 1:0:0:1: alua: supports implicit and explicit TPGS
[  153.289857] scsi 1:0:0:1: alua: device naa.60014056e756c6c62310000000000=
000 p
ort group 0 rel port 1
[  153.289981] sd 1:0:0:1: Warning! Received an indication that the LUN ass=
ignme
nts on this target have changed. The Linux SCSI layer does not automatical
[  153.289993] sd 1:0:0:1: Attached scsi generic sg3 type 0
[  153.291415] sd 1:0:0:2: [sdc] Write Protect is off
[  153.291574] sd 1:0:0:2: [sdc] Write cache: enabled, read cache: enabled,=
 supp
orts DPO and FUA
[  153.291584] srpt/10.16.69.39: Unsupported SCSI Opcode 0xa3, sending CHEC=
K_CON
DITION.
[  153.291634] sd 1:0:0:2: [sdc] Optimal transfer size 524288 bytes
[  153.293587] scsi host2: ib_srp: Already connected to target port with id=
_ext=3D
00debdfffebeef80;ioc_guid=3D00debdfffebeef80;dest=3D2620:0052:0000:1040:00d=
e:bdff:fe
be:ef80
[  153.327364] sd 1:0:0:2: alua: transition timeout set to 60 seconds
[  153.327371] sd 1:0:0:2: alua: port group 00 state A non-preferred suppor=
ts TO
lUSNA
[  153.329782] scsi host2: ib_srp: Already connected to target port with id=
_ext=3D
00debdfffebeef80;ioc_guid=3D00debdfffebeef80;dest=3Dfe80:0000:0000:0000:00d=
e:bdff:fe
be:ef80
[  153.347178] sd 1:0:0:1: alua: transition timeout set to 60 seconds
[  153.347183] sd 1:0:0:1: alua: port group 00 state A non-preferred suppor=
ts TO
lUSNA
[  153.347301] sd 1:0:0:1: [sdd] 65536 512-byte logical blocks: (33.6 MB/32=
.0 Mi
B)
[  153.347327] sd 1:0:0:1: [sdd] Write Protect is off
[  153.347376] sd 1:0:0:1: [sdd] Write cache: disabled, read cache: enabled=
, doe
sn't support DPO or FUA
[  153.347386] srpt/10.16.69.39: Unsupported SCSI Opcode 0xa3, sending CHEC=
K_CON
DITION.
[  153.347423] sd 1:0:0:1: [sdd] Optimal transfer size 126976 bytes
[  153.397703] ------------[ cut here ]------------
[  153.397707] WARNING: CPU: 1 PID: 38 at block/blk-mq-sched.c:432 blk_mq_s=
ched_
insert_request+0x54/0x178
[  153.397719] Modules linked in: ib_srp scsi_transport_srp target_core_psc=
si ta
rget_core_file ib_srpt target_core_iblock target_core_mod rdma_cm iw_cm ib_=
cm ib
_umad scsi_debug rdma_rxe ib_uverbs ip6_udp_tunnel udp_tunnel null_blk scsi=
_dh_r
dac scsi_dh_emc scsi_dh_alua dm_multipath ib_core sunrpc qeth_l2 bridge stp=
 llc
qeth qdio ccwgroup vfio_ccw mdev vfio_iommu_type1 vfio zcrypt_cex4 drm fb f=
ont d
rm_panel_orientation_quirks i2c_core fuse backlight zram ip_tables xfs crc3=
2_vx_
s390 ghash_s390 prng aes_s390 des_s390 libdes sha512_s390 sha256_s390 sha1_=
s390
sha_common dasd_eckd_mod dasd_mod pkey zcrypt
[  153.397770] CPU: 1 PID: 38 Comm: kworker/u128:1 Not tainted 5.15.0.v2+ #=
5
[  153.397774] Hardware name: IBM 2964 N96 400 (z/VM 6.4.0)
[  153.397776] Workqueue: events_unbound async_run_entry_fn
[  153.397783] Krnl PSW : 0704e00180000000 000000002bd6e0c0 (blk_mq_sched_i=
nsert
_request+0x58/0x178)
[  153.397788]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:2 PM:=
0 RI:
0 EA:3
[  153.397792] Krnl GPRS: 0000000000000004 0000000000000022 000000001da6880=
0 000
0000000000001
[  153.397794]            0000000000000001 0000000000000000 000000000c99f80=
0 000
00000168b1c00
[  153.397796]            0000000000000000 0000000000000001 000000000000000=
1 000
000001da68800
[  153.397799]            0000000000f5c200 000003ff7e82b000 000003800035383=
0 00
00380003537c0
[  153.397807] Krnl Code: 000000002bd6e0b4: a71effff            chi     %r1=
,-1
[  153.397807]            000000002bd6e0b8: a7840004            brc     8,0=
00000
002bd6e0c0
[  153.397807]           #000000002bd6e0bc: af000000            mc      0,0
[  153.397807]           >000000002bd6e0c0: 5810b01c            l       %r1=
,28(%
r11)
[  153.397807]            000000002bd6e0c4: ec213bbb0055        risbg   %r2=
,%r1,
59,187,0
[  153.397807]            000000002bd6e0ca: a7740057            brc     7,0=
00000
002bd6e178
[  153.397807]            000000002bd6e0ce: 5810b018            l       %r1=
,24(%
r11)
[  153.397807]            000000002bd6e0d2: c01b000000ff        nilf    %r1=
,255
[  153.397827] Call Trace:
[  153.397829]  [<000000002bd6e0c0>] blk_mq_sched_insert_request+0x58/0x178
[  153.397834]  [<000000002bd5e926>] blk_execute_rq+0x56/0xd8
[  153.397840]  [<000000002bf20d50>] __scsi_execute+0x110/0x230
[  153.397846]  [<000000002bf20fb2>] scsi_mode_sense+0x142/0x340
[  153.397849]  [<000000002bf322c6>] sd_revalidate_disk.isra.0+0x74e/0x2240
[  153.397853]  [<000000002bf342ea>] sd_probe+0x312/0x4b0
[  153.397856]  [<000000002bee76e0>] really_probe+0xd0/0x4b0
[  153.397862]  [<000000002bee7c70>] driver_probe_device+0x40/0xf0
[  153.397865]  [<000000002bee837c>] __device_attach_driver+0xa4/0x128
[  153.397869]  [<000000002bee4a80>] bus_for_each_drv+0x88/0xc0
[  153.397872]  [<000000002bee6be0>] __device_attach_async_helper+0x90/0xf0
[  153.397875]  [<000000002b7c0d1e>] async_run_entry_fn+0x4e/0x1b0
[  153.397878]  [<000000002b7b362a>] process_one_work+0x21a/0x498
[  153.397881]  [<000000002b7b3dd4>] worker_thread+0x64/0x498
[  153.397884]  [<000000002b7bc71c>] kthread+0x184/0x190
[  153.397889]  [<000000002b747468>] __ret_from_fork+0x40/0x58
[  153.397892]  [<000000002c2952fa>] ret_from_fork+0xa/0x30
[  153.397899] Last Breaking-Event-Address:
[  153.397901]  [<0000000000000000>] 0x0
[  153.397903] ---[ end trace e8c7933cbb1a7d90 ]---
[  153.398050] sd 1:0:0:0: [sdb] Attached SCSI disk
[  153.428144] ------------[ cut here ]------------
[  153.428148] WARNING: CPU: 0 PID: 7 at block/blk-mq-sched.c:432 blk_mq_sc=
hed_i
nsert_request+0x54/0x178
[  153.428154] Modules linked in: ib_srp scsi_transport_srp target_core_psc=
si ta
rget_core_file ib_srpt target_core_iblock target_core_mod rdma_cm iw_cm ib_=
cm i
_umad scsi_debug rdma_rxe ib_uverbs ip6_udp_tunnel udp_tunnel null_blk scsi=
_dh_r
dac scsi_dh_emc scsi_dh_alua dm_multipath ib_core sunrpc qeth_l2 bridge stp=
 llc
qeth qdio ccwgroup vfio_ccw mdev vfio_iommu_type1 vfio zcrypt_cex4 drm fb f=
ont d
rm_panel_orientation_quirks i2c_core fuse backlight zram ip_tables xfs crc3=
2_vx_
s390 ghash_s390 prng aes_s390 des_s390 libdes sha512_s390 sha256_s390 sha1_=
s390
sha_common dasd_eckd_mod dasd_mod pkey zcrypt
[  153.428200] CPU: 0 PID: 7 Comm: kworker/u128:0 Tainted: G        W      =
   5.
15.0.v2+ #5
[  153.428203] Hardware name: IBM 2964 N96 400 (z/VM 6.4.0)
[  153.428205] Workqueue: events_unbound async_run_entry_fn
[  153.428208] Krnl PSW : 0704e00180000000 000000002bd6e0c0 (blk_mq_sched_i=
nsert
_request+0x58/0x178)
[  153.428214]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:2 PM:=
0 RI:
0 EA:3
[  153.428218] Krnl GPRS: 0000000000000004 000000000000003a 000000001d86e80=
0 000
0000000000001
[  153.428220]            0000000000000001 0000000000000000 000000001d83d80=
0 000
000001e74dc00
[  153.428222]            0000000000000000 0000000000000001 000000000000000=
1 000
000001d86e800
[  153.428225]            00000000006ba100 000003ff7e80b700 000003800003f83=
0 000
003800003f7c0
[  153.428231] Krnl Code: 000000002bd6e0b4: a71effff            chi     %r1=
,-1
[  153.428231]            000000002bd6e0b8: a7840004            brc     8,0=
00000
002bd6e0c0
[  153.428231]           #000000002bd6e0bc: af000000            mc      0,0
[  153.428231]           >000000002bd6e0c0: 5810b01c            l       %r1=
,28(%
r11)
[  153.428231]            000000002bd6e0c4: ec213bbb0055        risbg   %r2=
,%r1,
59,187,0
[  153.428231]            000000002bd6e0ca: a7740057            brc     7,0=
00000
002bd6e178
[  153.428231]            000000002bd6e0ce: 5810b018            l       %r1=
,24(%
r11)
[  153.428231]            000000002bd6e0d2: c01b000000ff        nilf    %r1=
,255
[  153.428251] Call Trace:
[  153.428253]  [<000000002bd6e0c0>] blk_mq_sched_insert_request+0x58/0x178
[  153.428257]  [<000000002bd5e926>] blk_execute_rq+0x56/0xd8
[  153.428261]  [<000000002bf20d50>] __scsi_execute+0x110/0x230
[  153.428264]  [<000000002bf20fb2>] scsi_mode_sense+0x142/0x340
[  153.428267]  [<000000002bf322c6>] sd_revalidate_disk.isra.0+0x74e/0x2240
[  153.428270]  [<000000002bf342ea>] sd_probe+0x312/0x4b0
[  153.428273]  [<000000002bee76e0>] really_probe+0xd0/0x4b0
[  153.428277]  [<000000002bee7c70>] driver_probe_device+0x40/0xf0
[  153.428280]  [<000000002bee837c>] __device_attach_driver+0xa4/0x128
[  153.428283]  [<000000002bee4a80>] bus_for_each_drv+0x88/0xc0
[  153.428286]  [<000000002bee6be0>] __device_attach_async_helper+0x90/0xf0
[  153.428289]  [<000000002b7c0d1e>] async_run_entry_fn+0x4e/0x1b0
[  153.428292]  [<000000002b7b362a>] process_one_work+0x21a/0x498
[  153.428295]  [<000000002b7b3dd4>] worker_thread+0x64/0x498
[  153.428298]  [<000000002b7bc71c>] kthread+0x184/0x190
[  153.428301]  [<000000002b747468>] __ret_from_fork+0x40/0x58
[  153.428304]  [<000000002c2952fa>] ret_from_fork+0xa/0x30
[  153.428308] Last Breaking-Event-Address:
[  153.428309]  [<0000000000000000>] 0x0
[  153.428311] ---[ end trace e8c7933cbb1a7d91 ]---

--=20
Best Regards,
  Yi Zhang

