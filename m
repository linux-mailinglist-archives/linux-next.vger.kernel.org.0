Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DEE443634
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 20:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhKBTDD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 15:03:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32439 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229778AbhKBTDC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 15:03:02 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2HukkV008756;
        Tue, 2 Nov 2021 19:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=n5HvDYzj+N6YJoU8PLfBjtDHfe1NOnz+x0Bom07AF/g=;
 b=TbfJ8vk0KlxyItTbXGBS0tb/Q4qlUO35nlaVscG4mZry4jNeVEp5UM+FG8wJlelb8VET
 ufwgJ+ZAW8W6axR6tT+UJwbyfNnOj4Vs10XPoENw7qq0wN9YiBdyMkyjwcYbXJVBPbd4
 AW43tmd28OXof6QeRDpTrJSFrP9eYjro9TOWeG2L/V5YcfeU9pHybZz9LQQyB1SHvoFD
 24gNa5sglDceEto1R8NrgmMfg5SMIUmiFDfcCV5FEiJW3OXHQ/51pS9Zq/XtQRYQkxdu
 1iy3Nn0HhRJCRuNXhB/9pd7yq74BEKsz1XCvuESQzs8agImgjp/lFuJGcxGThC2OgOT+ Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3c35qes0q4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Nov 2021 19:00:26 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A2I05vB029317;
        Tue, 2 Nov 2021 19:00:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3c35qes0pc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Nov 2021 19:00:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A2IhTxD017393;
        Tue, 2 Nov 2021 19:00:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma03ams.nl.ibm.com with ESMTP id 3c0wp9ptgt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Nov 2021 19:00:24 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1A2J0Lng15532454
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 2 Nov 2021 19:00:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CA37B5206B;
        Tue,  2 Nov 2021 19:00:21 +0000 (GMT)
Received: from [9.145.187.87] (unknown [9.145.187.87])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7D00252063;
        Tue,  2 Nov 2021 19:00:21 +0000 (GMT)
Message-ID: <1cf57bc2-5283-a2ce-0bbc-db6a62953c8f@linux.ibm.com>
Date:   Tue, 2 Nov 2021 20:00:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [bug report] WARNING: CPU: 1 PID: 1386 at
 block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
Content-Language: en-US
To:     Yi Zhang <yi.zhang@redhat.com>,
        linux-block <linux-block@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>
References: <CAHj4cs-NUKzGj5pgzRhDgdrGGbgPBqUoQ44+xgvk6njH9a_RYQ@mail.gmail.com>
From:   Steffen Maier <maier@linux.ibm.com>
In-Reply-To: <CAHj4cs-NUKzGj5pgzRhDgdrGGbgPBqUoQ44+xgvk6njH9a_RYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0ms2rQTYn4LRjygvTyakFwh00kFmRF9c
X-Proofpoint-GUID: WzFHLHxjz2yychn8TTaSFvqtOEhgrZdt
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020101
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/2/21 07:42, Yi Zhang wrote:
> Below WARNING was triggered with blktests srp/001 on the latest
> linux-block/for-next, and it cannot be reproduced with v5.15, pls help
> check it, thanks.
> 
> 88d2c6ab15f7 (origin/for-next) Merge branch 'for-5.16/block' into for-next

Same warning here with a slightly different stack trace.
It breaks root-fs on zfcp-attached SCSI disks for us, because we run our CI 
intentionally with panic_on_warn.

> [    9.031740] ------------[ cut here ]------------
> [    9.031743] WARNING: CPU: 13 PID: 196 at block/blk-mq-sched.c:432 blk_mq_sched_insert_request+0x54/0x178
> [    9.031751] Modules linked in: nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) dm_service_time(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) ip_set(E) nf_tables(E) nfnetlink(E) sunrpc(E) zfcp(E) scsi_transport_fc(E) dm_multipath(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) s390_trng(E) vfio_ccw(E) mdev(E) vfio_iommu_type1(E) zcrypt_cex4(E) vfio(E) eadm_sch(E) sch_fq_codel(E) configfs(E) ip_tables(E) x_tables(E) ghash_s390(E) prng(E) aes_s390(E) des_s390(E) libdes(E) sha3_512_s390(E) sha3_256_s390(E) sha512_s390(E) sha256_s390(E) sha1_s390(E) sha_common(E) pkey(E) zcrypt(E) rng_core(E) autofs4(E)
> [    9.031785] CPU: 13 PID: 196 Comm: kworker/13:2 Tainted: G            E     5.16.0-20211102.rc0.git0.9febf1194306.300.fc34.s390x+next #1
> [    9.031789] Hardware name: IBM 3906 M04 704 (LPAR)
> [    9.031791] Workqueue: kaluad alua_rtpg_work [scsi_dh_alua]
> [    9.031795] Krnl PSW : 0704e00180000000 000000006558e948 (blk_mq_sched_insert_request+0x58/0x178)
> [    9.031800]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:2 PM:0 RI:0 EA:3
> [    9.031803] Krnl GPRS: 0000000000000080 00000000000004c6 00000000ade56000 0000000000000001
> [    9.031806]            0000000000000001 0000000000000000 00000000a2d6a400 0000000084003c00
> [    9.031808]            0000000000000000 0000000000000001 0000000000000001 00000000ade56000
> [    9.031810]            000000008aef0000 000003ff7af59400 000003800e3d7b00 000003800e3d7a90
> [    9.031817] Krnl Code: 000000006558e93c: a71effff		chi	%r1,-1
>                           000000006558e940: a7840004		brc	8,000000006558e948
>                          #000000006558e944: af000000		mc	0,0
>                          >000000006558e948: 5810b01c		l	%r1,28(%r11)
>                           000000006558e94c: ec213bbb0055	risbg	%r2,%r1,59,187,0
>                           000000006558e952: a7740057		brc	7,000000006558ea00
>                           000000006558e956: 5810b018		l	%r1,24(%r11)
>                           000000006558e95a: c01b000000ff	nilf	%r1,255
> [    9.031833] Call Trace:
> [    9.031835]  [<000000006558e948>] blk_mq_sched_insert_request+0x58/0x178 
> [    9.031838]  [<000000006557effe>] blk_execute_rq+0x56/0xd8 
> [    9.031841]  [<0000000065768708>] __scsi_execute+0x118/0x240 
> [    9.031847]  [<000003ff803c3788>] alua_rtpg+0x120/0x8f8 [scsi_dh_alua] 
> [    9.031849]  [<000003ff803c402c>] alua_rtpg_work+0xcc/0x648 [scsi_dh_alua] 
> [    9.031852]  [<0000000064f024d2>] process_one_work+0x1fa/0x470 
> [    9.031856]  [<0000000064f02c74>] worker_thread+0x64/0x498 
> [    9.031859]  [<0000000064f0a894>] kthread+0x17c/0x188 
> [    9.031861]  [<0000000064e933c4>] __ret_from_fork+0x3c/0x58 
> [    9.031864]  [<0000000065a71cea>] ret_from_fork+0xa/0x40 
> [    9.031868] Last Breaking-Event-Address:
> [    9.031869]  [<000000006557ef72>] blk_execute_rq_nowait+0x82/0x98
> [    9.031871] Kernel panic - not syncing: panic_on_warn set ...


> [ 3881.829489] ------------[ cut here ]------------
> [ 3881.829493] WARNING: CPU: 1 PID: 1386 at block/blk-mq-sched.c:432
> blk_mq_sched_insert_request+0x54/0x178
> [ 3881.829504] Modules linked in: ib_srp scsi_transport_srp
> target_core_pscsi target_core_file ib_srpt target_core_iblock
> target_core_mod rdma_cm iw_cm ib_cm ib_umad scsi_debug rdma_rxe
> ib_uverbs ip6_udp_tunnel udp_tunnel null_blk scsi_dh_rdac scsi_dh_emc
> scsi_dh_alua dm_multipath ib_core sunrpc qeth_l2 bridge stp llc qeth
> qdio ccwgroup vfio_ccw mdev vfio_iommu_type1 vfio zcrypt_cex4 drm fb
> fuse font drm_panel_orientation_quirks i2c_core backlight zram
> ip_tables xfs crc32_vx_s390 ghash_s390 prng aes_s390 des_s390 libdes
> sha512_s390 sha256_s390 sha1_s390 sha_common dasd_eckd_mod dasd_mod
> pkey zcrypt
> [ 3881.829553] CPU: 1 PID: 1386 Comm: kworker/u128:2 Not tainted 5.15.0+ #3
> [ 3881.829556] Hardware name: IBM 2964 N96 400 (z/VM 6.4.0)
> [ 3881.829558] Workqueue: events_unbound async_run_entry_fn
> [ 3881.829564] Krnl PSW : 0704e00180000000 000000001055afc0
> (blk_mq_sched_insert_request+0x58/0x178)
> [ 3881.829569]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3
> CC:2 PM:0 RI:0 EA:3
> [ 3881.829572] Krnl GPRS: 0000000000000004 000000000000003d
> 00000000448bf400 0000000000000001
> [ 3881.829575]            0000000000000001 0000000000000000
> 000000004352bc00 000000002e0f3000
> [ 3881.829577]            0000000000000000 0000000000000001
> 0000000000000001 00000000448bf400
> [ 3881.829580]            000000001ee72100 000003ff7e82dd00
> 00000380022f7838 00000380022f77c8
> [ 3881.829587] Krnl Code: 000000001055afb4: a71effff chi %r1,-1
>                            000000001055afb8: a7840004 brc 8,000000001055afc0
>                           #000000001055afbc: af000000 mc 0,0
>                           >000000001055afc0: 5810b01c l %r1,28(%r11)
>                            000000001055afc4: ec213bbb0055 risbg %r2,%r1,59,187,0
>                            000000001055afca: a7740057 brc 7,000000001055b078
>                            000000001055afce: 5810b018 l %r1,24(%r11)
>                            000000001055afd2: c01b000000ff nilf %r1,255
> [ 3881.829607] Call Trace:
> [ 3881.829609]  [<000000001055afc0>] blk_mq_sched_insert_request+0x58/0x178
> [ 3881.829616]  [<000000001054b876>] blk_execute_rq+0x56/0xd8
> [ 3881.829620]  [<000000001070e3a0>] __scsi_execute+0x110/0x230
> [ 3881.829625]  [<000000001070e602>] scsi_mode_sense+0x142/0x340
> [ 3881.829627]  [<000000001071f8ee>] sd_revalidate_disk.isra.0+0x74e/0x2240
> [ 3881.829632]  [<0000000010721912>] sd_probe+0x312/0x4b0
> [ 3881.829634]  [<00000000106d4c30>] really_probe+0xd0/0x4b0
> [ 3881.829639]  [<00000000106d51c0>] driver_probe_device+0x40/0xf0
> [ 3881.829642]  [<00000000106d58cc>] __device_attach_driver+0xa4/0x128
> [ 3881.829645]  [<00000000106d1fd0>] bus_for_each_drv+0x88/0xc0
> [ 3881.829649]  [<00000000106d4130>] __device_attach_async_helper+0x90/0xf0
> [ 3881.829652]  [<000000000ffb0f46>] async_run_entry_fn+0x4e/0x1b0
> [ 3881.829655]  [<000000000ffa384a>] process_one_work+0x21a/0x498
> [ 3881.829658]  [<000000000ffa3ff4>] worker_thread+0x64/0x498
> [ 3881.829661]  [<000000000ffac8e0>] kthread+0x150/0x160
> [ 3881.829665]  [<000000000ff37468>] __ret_from_fork+0x40/0x58
> [ 3881.829670]  [<0000000010a8550a>] ret_from_fork+0xa/0x30
> [ 3881.829675] Last Breaking-Event-Address:
> [ 3881.829676]  [<0000000000000007>] 0x7
> [ 3881.829679] ---[ end trace a501db666d088cc7 ]---



-- 
Mit freundlichen Gruessen / Kind regards
Steffen Maier

Linux on IBM Z and LinuxONE

https://www.ibm.com/privacy/us/en/
IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen
Geschaeftsfuehrung: Dirk Wittkopp
Sitz der Gesellschaft: Boeblingen
Registergericht: Amtsgericht Stuttgart, HRB 243294
