Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4C2F7CE350
	for <lists+linux-next@lfdr.de>; Wed, 18 Oct 2023 19:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjJRREt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Oct 2023 13:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjJRREt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Oct 2023 13:04:49 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEA5B0;
        Wed, 18 Oct 2023 10:04:47 -0700 (PDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IGgHhj030890;
        Wed, 18 Oct 2023 17:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=UQ8bRRqWkcM/QrRf4fj3JJ71zdos9kuQtnHqJ+BFwHM=;
 b=dYA3PH53oRDIsPJWm5E6PMnA+4e3S1Pv1a3/MNJ2zzZt6O/hTbqZjfIw/yIG9MhpVEFl
 PqWwhGpvUvqsc7QKVmFrmRPXx1SzbAzeRYI6PLejNrlOt/vdC+XGRgfDZZ+jkGE/djIK
 Fl4PgCFvoCy9MG5pLadsy4NNsiEtEYyILYHQaXJ4oQOiAxjWu0ho12P5ULf5eElnSgKy
 9a8gnfgUJNyEWfrRfIC3KmE7ob08HPgsqVLHbak0szdUh0WW8HyzxOGSjKvMrXppXWdk
 YslwG1RJUiB2HNu24v2MQBEAcoNsVE9deLMqi7kMNfS6zYtf5+7AAXucPyKcqe0BhKos xA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttk470yd1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Oct 2023 17:04:32 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
        by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39IGg2Kj012949;
        Wed, 18 Oct 2023 17:04:30 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
        by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5pyjfwv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Oct 2023 17:04:30 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
        by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39IH4TLe22348288
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Oct 2023 17:04:30 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B61FE58060;
        Wed, 18 Oct 2023 17:04:29 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 017E05803F;
        Wed, 18 Oct 2023 17:04:24 +0000 (GMT)
Received: from [9.171.21.120] (unknown [9.171.21.120])
        by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
        Wed, 18 Oct 2023 17:04:23 +0000 (GMT)
Message-ID: <80a4706a-d33c-4a46-b93d-75b08aa5577e@linux.vnet.ibm.com>
Date:   Wed, 18 Oct 2023 22:34:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] [Bisected] [efeda3bf912f] OOPS crash while performing Block
 device module parameter test [qla2xxx / FC]
Content-Language: en-US
To:     Nilesh Javali <njavali@marvell.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc:     Quinn Tran <qutran@marvell.com>,
        "himanshu.madhani@oracle.com" <himanshu.madhani@oracle.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        GR-QLogic-Storage-Upstream <GR-QLogic-Storage-Upstream@marvell.com>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>,
        "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>,
        "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>
References: <24a8559c-cd35-4828-9d1b-458d82e4f3ec@linux.vnet.ibm.com>
 <CO6PR18MB45000CADE930729578C4FA26AFD5A@CO6PR18MB4500.namprd18.prod.outlook.com>
From:   Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
In-Reply-To: <CO6PR18MB45000CADE930729578C4FA26AFD5A@CO6PR18MB4500.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hMY1-JZeLz2wHK-JYuFyguCp7tJC0tGn
X-Proofpoint-GUID: hMY1-JZeLz2wHK-JYuFyguCp7tJC0tGn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_15,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180139
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks Nilesh. The patch fixes the issue.

On 10/18/23 19:59, Nilesh Javali wrote:
> Hi Tasmiya,
>
>> -----Original Message-----
>> From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
>> Sent: Wednesday, October 18, 2023 6:51 PM
>> To: linux-scsi@vger.kernel.org; linux-kernel@vger.kernel.org; linuxppc-
>> dev@lists.ozlabs.org; linux-block@vger.kernel.org; linux-next@vger.kernel.org
>> Cc: Quinn Tran <qutran@marvell.com>; Nilesh Javali <njavali@marvell.com>;
>> himanshu.madhani@oracle.com; martin.petersen@oracle.com; GR-QLogic-
>> Storage-Upstream <GR-QLogic-Storage-Upstream@marvell.com>;
>> jejb@linux.ibm.com; abdhalee@linux.vnet.ibm.com; mputtash@linux.vnet.com;
>> sachinp@linux.vnet.com
>> Subject: [EXT] [Bisected] [efeda3bf912f] OOPS crash while performing Block
>> device module parameter test [qla2xxx / FC]
>>
>> External Email
>>
>> ----------------------------------------------------------------------
>> Greetings,
>>
>> OOPs Kernel crash while performing Block device module parameter test
>> [qla2xxx / FC] on linux-next 6.6.0-rc5-next-20231010
>>
>> --- Traces ---
>>
>> [30876.431678] Kernel attempted to read user page (30) - exploit
>> attempt? (uid: 0)
>> [30876.431687] BUG: Kernel NULL pointer dereference on read at 0x00000030
>> [30876.431692] Faulting instruction address: 0xc0080000018e3180
>> [30876.431697] Oops: Kernel access of bad area, sig: 11 [#1]
>> [30876.431700] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=8192 NUMA
>> pSeries
>> [30876.431705] Modules linked in: qla2xxx(+) nvme_fc nvme_fabrics
>> nvme_core dm_round_robin dm_queue_length exfat vfat fat btrfs
>> blake2b_generic zstd_compress loop raid10 raid456 async_raid6_recov
>> async_memcpy async_pq async_xor async_tx xor raid6_pq raid1 linear xfs
>> libcrc32c raid0 nvram rpadlpar_io rpaphp xsk_diag bonding tls rfkill
>> vmx_crypto pseries_rng binfmt_misc ext4 mbcache jbd2 dm_service_time
>> sd_mod sg ibmvfc ibmveth t10_pi crc64_rocksoft crc64 scsi_transport_fc
>> dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse [last unloaded:
>> nvme_core]
>> [30876.431767] CPU: 0 PID: 1289400 Comm: kworker/0:2 Kdump: loaded Not
>> tainted 6.6.0-rc5-next-20231010-auto #1
>> [30876.431773] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200
>> 0xf000006 of:IBM,FW1030.30 (NH1030_062) hv:phyp pSeries
>> [30876.431779] Workqueue: events work_for_cpu_fn
>> [30876.431788] NIP:  c0080000018e3180 LR: c0080000018e3128 CTR:
>> c000000000513f80
>> [30876.431792] REGS: c000000062a8b930 TRAP: 0300   Not tainted
>> (6.6.0-rc5-next-20231010-auto)
>> [30876.431797] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>
>> CR: 28000482  XER: 2004000f
>> [30876.431811] CFAR: c0080000018e3138 DAR: 0000000000000030 DSISR:
>> 40000000 IRQMASK: 0
>> [30876.431811] GPR00: c0080000018e3128 c000000062a8bbd0
>> c008000000eb8300
>> 0000000000000000
>> [30876.431811] GPR04: 0000000000000000 0000000000000000
>> 0000000000000000
>> 000000000017bbac
>> [30876.431811] GPR08: 0000000000000000 0000000000000030
>> 0000000000000000
>> c0080000019a6d68
>> [30876.431811] GPR12: 0000000000000000 c000000002ff0000
>> c00000000019cb98
>> c000000082a97980
>> [30876.431811] GPR16: 0000000000000000 0000000000000000
>> 0000000000000000
>> c000000003071ab0
>> [30876.431811] GPR20: c000000003491c0d c000000063bb9a00
>> c000000063bb30c0
>> c0000001d8b52928
>> [30876.431811] GPR24: c008000000eb63a8 ffffffffffffffed c0000001d8b52000
>> 0000000000000102
>> [30876.431811] GPR28: c008000000ebaf00 c0000001d8b52890
>> 0000000000000000
>> c0000001d8b58000
>> [30876.431856] NIP [c0080000018e3180] qla2x00_mem_free+0x298/0x6b0
>> [qla2xxx]
>> [30876.431876] LR [c0080000018e3128] qla2x00_mem_free+0x240/0x6b0
>> [qla2xxx]
>> [30876.431895] Call Trace:
>> [30876.431897] [c000000062a8bbd0] [c0080000018e2f1c]
>> qla2x00_mem_free+0x34/0x6b0 [qla2xxx] (unreliable)
>> [30876.431917] [c000000062a8bc20] [c0080000018eed30]
>> qla2x00_probe_one+0x16d8/0x2640 [qla2xxx]
>> [30876.431937] [c000000062a8bd90] [c0000000008c589c]
>> local_pci_probe+0x6c/0x110
>> [30876.431943] [c000000062a8be10] [c000000000189ba8]
>> work_for_cpu_fn+0x38/0x60
>> [30876.431948] [c000000062a8be40] [c00000000018d0d0]
>> process_scheduled_works+0x230/0x4f0
>> [30876.431952] [c000000062a8bf10] [c00000000018fe14]
>> worker_thread+0x1e4/0x500
>> [30876.431955] [c000000062a8bf90] [c00000000019ccc8]
>> kthread+0x138/0x140
>> [30876.431960] [c000000062a8bfe0] [c00000000000df98]
>> start_kernel_thread+0x14/0x18
>> [30876.431965] Code: 4082000c a09f0198 78841b68 e8df0278 38e00000
>> 480c3b8d e8410018 39200000 e91f0178 f93f0280 f93f0278 39280030
>> <e9480030> 7fa95040 419e00b8 ebc80030
>> [30876.431977] ---[ end trace 0000000000000000 ]---
>> [30876.480385] pstore: backend (nvram) writing error (-1)
>>
>>
>> Git bisect points to below commit. Reverting this commit fixes the problem.
>> commit efeda3bf912f269bcae16816683f432f58d68075
>>       scsi: qla2xxx: Move resource to allow code reuse
>>
>> --
>> Regards,
>> Tasmiya Nalatwad
>> IBM Linux Technology Center
> We have recently posted a fix for the commit that you have pointed here,
> https://marc.info/?l=linux-scsi&m=169750508721982&w=2
>
> Thanks,
> Nilesh

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

