Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A0828C929
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 09:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389829AbgJMHUb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 03:20:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18414 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389874AbgJMHUa (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 03:20:30 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09D738J2080310;
        Tue, 13 Oct 2020 03:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FZHTquJP5o/KmCGNFbXWEAQnDLJpGs0M20H+4SQ4hCg=;
 b=lvVrvjujqfvmGUu6a7Ni7QNGc+j0PvfFvDn/IRnRSNKaz99iTdDtOAyD4PcWIx6/O8SX
 jZ4asGQ4OOpRALr/9iyaUHQ9WFU9aHnKt2xT0yQS/69hANW/+0VngpiO+TdEMBCf2iPf
 +53ZKhv5WAP25bnX2vkgW12NpSlqUNElcV1+yJv8AmK1CmcOsw78eG2L6w6Wo6FXBR+8
 RHNFu2XvwIhPbiRCDq8Ti2icKk9GDeJDveJpGXP3jpNXoAvgFnHmFtduTJgeeHtezprf
 5le52OD21efFArvHk4/o5zVY2HuSL1VaF2lwBAyvz/5PyOMHQUS1/n7R1V+nSc8UdcLn zg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3457ge8g56-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Oct 2020 03:20:18 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09D7ELZ8008498;
        Tue, 13 Oct 2020 07:20:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma04ams.nl.ibm.com with ESMTP id 3434k7ttdu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Oct 2020 07:20:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09D7KDks24904136
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Oct 2020 07:20:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7234C4C044;
        Tue, 13 Oct 2020 07:20:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CAE664C052;
        Tue, 13 Oct 2020 07:20:12 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.67.18])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 13 Oct 2020 07:20:12 +0000 (GMT)
Subject: Re: autofs crash with latest linux-next
To:     Sven Schnelle <svens@linux.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
References: <yt9d1ri3nakg.fsf@linux.ibm.com>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Message-ID: <8a4c7324-4637-7f25-82b6-2fd30aacb73e@de.ibm.com>
Date:   Tue, 13 Oct 2020 09:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <yt9d1ri3nakg.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-13_02:2020-10-13,2020-10-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1031 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010130055
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

CC linux-next, Al Viro.

On 12.10.20 09:54, Sven Schnelle wrote:
> Hi,
> 
> on s390 i see the following crash with linux-next:
> 
> [ 4525.432605] Unable to handle kernel pointer dereference in virtual kernel address space
> [ 4525.432612] Failing address: 0000000000000000 TEID: 0000000000000483
> [ 4525.432613] Fault in home space mode while using kernel ASCE.
> [ 4525.432616] AS:00000000cf048007 R3:00000001fffec007 S:00000001ffff1800 P:000000000000003d 
> [ 4525.432640] Oops: 0004 ilc:3 [#1] SMP 
> [ 4525.432644] Modules linked in: dm_crypt encrypted_keys lcs ctcm fsm nfsv3 nfs_acl nfs lockd grace quota_v2 quota_tree tun overlay ntfs exfat vfat fat sctp vfio_pci irqbypass vfio_virqfd scsi_debug vhost_vsock vmw_vsock_virtio_transport_common vsock vhost vhost_iotlb vfio_ap kvm loop nft_counter bridge stp llc dm_service_time nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink sunrpc dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua s390_trng vfio_ccw vfio_mdev mdev vfio_iommu_type1 vfio zcrypt_cex4 eadm_sch sch_fq_codel ip_tables x_tables ghash_s390 prng aes_s390 des_s390 libdes sha3_512_s390 sha3_256_s390 sha512_s390 sha256_s390 sha1_s390 sha_common pkey zcrypt rng_core autofs4 [last unloaded: dummy_del_mod]
> [ 4525.432691] CPU: 9 PID: 1050921 Comm: find Tainted: G           OE     5.9.0-20201011.rc8.git0.d67bc7812221.300.fc32.s390x+next #1
> [ 4525.432693] Hardware name: IBM 3906 M04 704 (LPAR)
> [ 4525.432694] Krnl PSW : 0704d00180000000 00000000cde29f70 (__kernel_write+0x1a0/0x2a0)
> [ 4525.432702]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:1 PM:0 RI:0 EA:3
> [ 4525.432704] Krnl GPRS: 0000000100067343 0000000000000000 0000000000000130 0000000000000001
> [ 4525.432705]            0000000000000006 000000005f82be2f 0000000000000130 000000008c6ab568
> [ 4525.432728]            0000000084441f00 0000000000000000 0000000000000130 0000000084441f00
> [ 4525.432729]            0000000081476000 0000000000000001 00000000cde29ef4 000003e002f5b6f0
> [ 4525.432735] Krnl Code: 00000000cde29f62: a7280000		lhi	%r2,0
>                           00000000cde29f66: a7f4ff9d		brc	15,00000000cde29ea0
>                          #00000000cde29f6a: e310f0f00004	lg	%r1,240(%r15)
>                          >00000000cde29f70: e31090000024	stg	%r1,0(%r9)
>                           00000000cde29f76: 9104b044		tm	68(%r11),4
>                           00000000cde29f7a: a784000f		brc	8,00000000cde29f98
>                           00000000cde29f7e: e31003400004	lg	%r1,832
>                           00000000cde29f84: b904002a		lgr	%r2,%r10
> [ 4525.432748] Call Trace:
> [ 4525.432750]  [<00000000cde29f70>] __kernel_write+0x1a0/0x2a0 
> [ 4525.432752] ([<00000000cde29ef4>] __kernel_write+0x124/0x2a0)
> [ 4525.432756]  [<000003ff80004cfa>] autofs_write+0x5a/0x140 [autofs4] 
> [ 4525.432758]  [<000003ff80005262>] autofs_notify_daemon.constprop.0+0x10a/0x1c8 [autofs4] 
> [ 4525.432760]  [<000003ff80005872>] autofs_wait+0x552/0x718 [autofs4] 
> [ 4525.432762]  [<000003ff800033ca>] autofs_mount_wait+0x5a/0xb0 [autofs4] 
> [ 4525.432764]  [<000003ff800048b2>] autofs_d_automount+0x102/0x278 [autofs4] 
> [ 4525.432766]  [<00000000cde398fe>] __traverse_mounts+0x9e/0x270 
> [ 4525.432768]  [<00000000cde3e7ee>] step_into+0x1de/0x280 
> [ 4525.432770]  [<00000000cde3f000>] open_last_lookups+0xb8/0x3f8 
> [ 4525.432772]  [<00000000cde3f726>] path_openat+0x86/0x1d0 
> [ 4525.432773]  [<00000000cde425b0>] do_filp_open+0x78/0x118 
> [ 4525.432776]  [<00000000cde278d0>] do_sys_openat2+0xa8/0x168 
> [ 4525.432778]  [<00000000cde27cfa>] __s390x_sys_openat+0x6a/0x98 
> [ 4525.432781]  [<00000000ce64f2e8>] system_call+0xdc/0x2a4 
> [ 4525.432782] Last Breaking-Event-Address:
> [ 4525.432783]  [<00000000cde29efc>] __kernel_write+0x12c/0x2a0
> 
> This seems to be caused by the result of merging 0fb702791bf ("autofs:
> use __kernel_write() for the autofs pipe writing") and 4d03e3cc5982

I cannot find the first commit ids. To me it looks like this should be 

commit 90fb702791bf99b959006972e8ee7bb4609f441b
Author:     Linus Torvalds <torvalds@linux-foundation.org>
AuthorDate: Tue Sep 29 17:18:34 2020 -0700
Commit:     Linus Torvalds <torvalds@linux-foundation.org>
CommitDate: Tue Sep 29 17:18:34 2020 -0700

    autofs: use __kernel_write() for the autofs pipe writing

instead?


> ("fs: don't allow kernel reads and writes without iter
> ops"). __kernel_write() gets now called with a NULL pointer as pos
> argument, but __kernel_write expects a valid pointer as it
> fetches/stores the pos value there. Is there a fix pending somewhere?
> 
> Thanks
> Sven
> 
