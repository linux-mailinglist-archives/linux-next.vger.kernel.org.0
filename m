Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80E534E655
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 13:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbhC3Lcn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 07:32:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41446 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231701AbhC3Lc3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Mar 2021 07:32:29 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12UBIxN0051726;
        Tue, 30 Mar 2021 07:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=p+iO3VZ4/BiPCmooO1OLT1+0zsH+fRj9FYHHnvDjCHA=;
 b=DkveH01Dgvpwt9nFtptsc0pE3m48GJT9/R+KyJoIk8niFGwOy+6wurIMxo7vuDToTRaS
 /eBv/FtrFE8HxLvNM6Pf4Lkfyd4tC8Fy5r3qeko2+iXur1HhB4s2ccEPfJIs1SA/iMxu
 a1TCjedsQCypZ/xPdYLLofJmxG/ax7tAaCQ8K3+Y5QLSiZIaCWxKmkDvH6U3zKWgIb/n
 6X75q02I2rOhwcVC5/Rm980/G9F8ZlEnxQ4G1SIyRjChG418CMpwFlvbPEKiZKq3avpJ
 oISPYZE/ck/8jybtHVYE2DOJm7/qYTdO5jS2bCw3Mfy4WC/NNaiQugFO/mu4NLtQiimj ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37jhrv5u5d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Mar 2021 07:32:22 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12UBJZ20054049;
        Tue, 30 Mar 2021 07:32:21 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37jhrv5u3y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Mar 2021 07:32:21 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
        by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12UBRsom017053;
        Tue, 30 Mar 2021 11:32:19 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma01fra.de.ibm.com with ESMTP id 37hvb89d8w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Mar 2021 11:32:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12UBWH0P39453144
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Mar 2021 11:32:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1254A11C054;
        Tue, 30 Mar 2021 11:32:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 816ED11C04C;
        Tue, 30 Mar 2021 11:32:16 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.62.62])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 30 Mar 2021 11:32:16 +0000 (GMT)
Subject: kernel warning percpu ref in obj_cgroup_release (was: Re: linux-next:
 Tree for Mar 29)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yang Shi <shy828301@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Muchun Song <songmuchun@bytedance.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>
References: <20210329205249.6b557510@canb.auug.org.au>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <83263d0d-1f3f-8a3c-8a95-49e0cfa15051@de.ibm.com>
Date:   Tue, 30 Mar 2021 13:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210329205249.6b557510@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cIbXEw_jVX9rVwmTzU6Y0zbxTazyy6ZA
X-Proofpoint-ORIG-GUID: hMJhI5vGoJ_G8s952ot8w-saOfQG5k60
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-30_03:2021-03-30,2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103300079
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 29.03.21 11:52, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release on Friday or the following
> Monday.
> 
> Changes since 20210326:
> 
> The arm64 tree gained a conflict against Linus' tree.
> 
> I applied a supplied patch for clang brakage in the kbuild tree.
> 
> The net-next tree gained a conflict against the bpf tree.
> 
> The drm tree gained a conflict against Linus' tree.
> 
> The staging tree gained a conflict against the scmi tree and a semantic
> conflict against the spi tree.
> 
> The rust tree gained a conflict against the kbuild tree.
> 
> The akpm-current tree lost its its build failure and gained a conflict
> against the gpio-brgl tree.
> 
> Non-merge commits (relative to Linus' tree): 7289
>   7213 files changed, 432170 insertions(+), 147471 deletions(-)
> 

This next (328 is fine) triggers several bugs during our KVM CI run:

[ 1506.494716] ------------[ cut here ]------------
[ 1506.494730] percpu ref (obj_cgroup_release) <= 0 (-1) after switching to atomic
[ 1506.494766] WARNING: CPU: 6 PID: 0 at lib/percpu-refcount.c:196 percpu_ref_switch_to_atomic_rcu+0x1ea/0x1f8
[ 1506.494774] Modules linked in: kvm vhost_vsock vmw_vsock_virtio_transport_common vsock vhost vhost_iotlb xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT xt_tcpudp nft_compat nf_nat_tftp nft_objref nf_conntrack_tftp nft_counter bridge stp llc nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct dm_service_time nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink zfcp scsi_transport_fc rpcrdma sunrpc dm_multipath rdma_ucm scsi_dh_rdac scsi_dh_emc rdma_cm scsi_dh_alua iw_cm ib_cm mlx5_ib ib_uverbs dm_mod ib_core s390_trng vfio_ccw vfio_mdev mdev vfio_iommu_type1 zcrypt_cex4 vfio eadm_sch sch_fq_codel configfs ip_tables x_tables ghash_s390 prng aes_s390 des_s390 libdes sha3_512_s390 sha3_256_s390 mlx5_core sha512_s390 sha256_s390 sha1_s390 sha_common nvme nvme_core pkey zcrypt rng_core autofs4 [last unloaded: vfio_ap]
[ 1506.494832] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 5.12.0-20210330.rc4.git0.9d49ed9ca93b.300.fc33.s390x+next #1
[ 1506.494834] Hardware name: IBM 8561 T01 703 (LPAR)
[ 1506.494836] Krnl PSW : 0704c00180000000 00000002d71dd21e (percpu_ref_switch_to_atomic_rcu+0x1ee/0x1f8)
[ 1506.494840]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:0 PM:0 RI:0 EA:3
[ 1506.494842] Krnl GPRS: c0000000fffeffff 00000002f7256818 0000000000000043 00000000fffeffff
[ 1506.494844]            00000000ffffffea 0000038000000001 0000000000000000 000003800000017c
[ 1506.494846]            00000002d7924988 0000000227eb97a0 000003ff5413c7e0 7fffffffffffffff
[ 1506.494848]            0000000080360000 00000002f726b570 00000002d71dd21a 00000380000bba28
[ 1506.494856] Krnl Code: 00000002d71dd20e: e3309fe8ff04        lg      %r3,-24(%r9)
                           00000002d71dd214: c0e5001eb556        brasl   %r14,00000002d75b3cc0
                          #00000002d71dd21a: af000000            mc      0,0
                          >00000002d71dd21e: a7f4ffcc            brc     15,00000002d71dd1b6
                           00000002d71dd222: 0707                bcr     0,%r7
                           00000002d71dd224: 0707                bcr     0,%r7
                           00000002d71dd226: 0707                bcr     0,%r7
                           00000002d71dd228: eb6ff0480024        stmg    %r6,%r15,72(%r15)
[ 1506.494928] Call Trace:
[ 1506.494933]  [<00000002d71dd21e>] percpu_ref_switch_to_atomic_rcu+0x1ee/0x1f8
[ 1506.494940] ([<00000002d71dd21a>] percpu_ref_switch_to_atomic_rcu+0x1ea/0x1f8)
[ 1506.494942]  [<00000002d6b8a6c6>] rcu_do_batch+0x146/0x608
[ 1506.494946]  [<00000002d6b8ec04>] rcu_core+0x124/0x1d0
[ 1506.494948]  [<00000002d75d0222>] __do_softirq+0x13a/0x3c8
[ 1506.494952]  [<00000002d6b05306>] irq_exit+0xce/0xf8
[ 1506.494955]  [<00000002d75c1eb4>] do_ext_irq+0xdc/0x170
[ 1506.494957]  [<00000002d75cdea4>] ext_int_handler+0xc4/0xf4
[ 1506.494959]  [<0000000000000000>] 0x0
[ 1506.494963]  [<00000002d75cd9c2>] default_idle_call+0x42/0x110
[ 1506.494965]  [<00000002d6b411a0>] do_idle+0xd8/0x168
[ 1506.494968]  [<00000002d6b413ee>] cpu_startup_entry+0x36/0x40
[ 1506.494971]  [<00000002d6ac730a>] smp_start_secondary+0x82/0x88
[ 1506.494974] Last Breaking-Event-Address:
[ 1506.494975]  [<00000002d6b71898>] vprintk_emit+0xa8/0x110
[ 1506.494978] Kernel panic - not syncing: panic_on_warn set ...



I will try to bisect this, but if anyone has an idea. CC some candidates.
