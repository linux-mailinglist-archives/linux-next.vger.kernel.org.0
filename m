Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E04434E915
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 15:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhC3N1t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 09:27:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26298 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232062AbhC3N1n (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Mar 2021 09:27:43 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12UD44Zd128879;
        Tue, 30 Mar 2021 09:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aOVzWBBCLhY67nrw9K3SdcWpB6lvtbluYQSCYONLLY8=;
 b=ET+qW1DnD2kkJbeSjE330VRhTXU2jbrmRoc/phGoYF1k5YP7gZGDi+Us5N2Aji07H3lB
 65mnfM6mcVV0AVN0RnkjpOGVFjTgAt94fSp9aGyj5C9pdGnYPllAOMijzMacWaMVaj7m
 puvaYex0e+4BuQJ+jYCxxwD0QgjK5PNp6XVEwLOsjWWKzDSy9Pttyr0L/JfgbZFfSiK+
 lj9zUiLD92P0fQZATLrYeTXm0EenWk66Y3z/g73V6xRhB3V6o2PKUqFe3wXyfL+6TdNc
 +bAvjtyfcqR/q1tM5PstUnL54El/vt74PVoO+D2Vhq0g4gQDUUTxX9ORJ3TJHVqUkbx0 MA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37jhnmgnqe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Mar 2021 09:27:33 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12UD45fS128995;
        Tue, 30 Mar 2021 09:27:33 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37jhnmgnp4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Mar 2021 09:27:32 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12UDN34H006198;
        Tue, 30 Mar 2021 13:27:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma06ams.nl.ibm.com with ESMTP id 37huyharmd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Mar 2021 13:27:30 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12UDR8uQ37486946
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Mar 2021 13:27:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1ECB452050;
        Tue, 30 Mar 2021 13:27:28 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.62.62])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6B4BA5205A;
        Tue, 30 Mar 2021 13:27:27 +0000 (GMT)
Subject: Re: kernel warning percpu ref in obj_cgroup_release
From:   Christian Borntraeger <borntraeger@de.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yang Shi <shy828301@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Muchun Song <songmuchun@bytedance.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>, Roman Gushchin <guro@fb.com>,
        Shakeel Butt <shakeelb@google.com>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Xiongchun Duan <duanxiongchun@bytedance.com>
References: <20210329205249.6b557510@canb.auug.org.au>
 <83263d0d-1f3f-8a3c-8a95-49e0cfa15051@de.ibm.com>
Message-ID: <4419611b-3282-2197-884c-332025cdada8@de.ibm.com>
Date:   Tue, 30 Mar 2021 15:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <83263d0d-1f3f-8a3c-8a95-49e0cfa15051@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HHPnpCnmtrGmQL8rAct8LAIZkcXej4eM
X-Proofpoint-ORIG-GUID: 4Xek-2xrTJc8zZZV2QIrN8_4p3iAvWUl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-30_03:2021-03-30,2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103300094
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

So bisect shows this for belows warning:

636c3ef8229ecb4e7d045e86f36505d24a8f019a is the first bad commit
commit 636c3ef8229ecb4e7d045e86f36505d24a8f019a
Author: Muchun Song <songmuchun@bytedance.com>
Date:   Mon Mar 29 11:12:06 2021 +1100

     mm: memcontrol: use obj_cgroup APIs to charge kmem pages
     
     Since Roman's series "The new cgroup slab memory controller" applied.  All
     slab objects are charged via the new APIs of obj_cgroup.  The new APIs
     introduce a struct obj_cgroup to charge slab objects.  It prevents
     long-living objects from pinning the original memory cgroup in the memory.
     But there are still some corner objects (e.g.  allocations larger than
     order-1 page on SLUB) which are not charged via the new APIs.  Those
     objects (include the pages which are allocated from buddy allocator
     directly) are charged as kmem pages which still hold a reference to the
     memory cgroup.
     
     We want to reuse the obj_cgroup APIs to charge the kmem pages.  If we do
     that, we should store an object cgroup pointer to page->memcg_data for the
     kmem pages.
     
     Finally, page->memcg_data will have 3 different meanings.
     
       1) For the slab pages, page->memcg_data points to an object cgroups
          vector.
     
       2) For the kmem pages (exclude the slab pages), page->memcg_data
          points to an object cgroup.
     
       3) For the user pages (e.g. the LRU pages), page->memcg_data points
          to a memory cgroup.
     
     We do not change the behavior of page_memcg() and page_memcg_rcu().  They
     are also suitable for LRU pages and kmem pages.  Why?
     
     Because memory allocations pinning memcgs for a long time - it exists at a
     larger scale and is causing recurring problems in the real world: page
     cache doesn't get reclaimed for a long time, or is used by the second,
     third, fourth, ...  instance of the same job that was restarted into a new
     cgroup every time.  Unreclaimable dying cgroups pile up, waste memory, and
     make page reclaim very inefficient.
     
     We can convert LRU pages and most other raw memcg pins to the objcg
     direction to fix this problem, and then the page->memcg will always point
     to an object cgroup pointer.  At that time, LRU pages and kmem pages will
     be treated the same.  The implementation of page_memcg() will remove the
     kmem page check.
     
     This patch aims to charge the kmem pages by using the new APIs of
     obj_cgroup.  Finally, the page->memcg_data of the kmem page points to an
     object cgroup.  We can use the __page_objcg() to get the object cgroup
     associated with a kmem page.  Or we can use page_memcg() to get the memory
     cgroup associated with a kmem page, but caller must ensure that the
     returned memcg won't be released (e.g.  acquire the rcu_read_lock or
     css_set_lock).
     
     Link: https://lkml.kernel.org/r/20210319163821.20704-6-songmuchun@bytedance.com
     Signed-off-by: Muchun Song <songmuchun@bytedance.com>
     Acked-by: Johannes Weiner <hannes@cmpxchg.org>
     Cc: Michal Hocko <mhocko@kernel.org>
     Cc: Roman Gushchin <guro@fb.com>
     Cc: Shakeel Butt <shakeelb@google.com>
     Cc: Vladimir Davydov <vdavydov.dev@gmail.com>
     Cc: Xiongchun Duan <duanxiongchun@bytedance.com>
     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

  include/linux/memcontrol.h | 116 +++++++++++++++++++++++++++++++++++----------
  mm/memcontrol.c            | 110 +++++++++++++++++++++---------------------
  2 files changed, 145 insertions(+), 81 deletions(-)





On 30.03.21 13:32, Christian Borntraeger wrote:
[...]
> 
> This next (328 is fine) triggers several bugs during our KVM CI run:
> 
> [ 1506.494716] ------------[ cut here ]------------
> [ 1506.494730] percpu ref (obj_cgroup_release) <= 0 (-1) after switching to atomic
> [ 1506.494766] WARNING: CPU: 6 PID: 0 at lib/percpu-refcount.c:196 percpu_ref_switch_to_atomic_rcu+0x1ea/0x1f8
> [ 1506.494774] Modules linked in: kvm vhost_vsock vmw_vsock_virtio_transport_common vsock vhost vhost_iotlb xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT xt_tcpudp nft_compat nf_nat_tftp nft_objref nf_conntrack_tftp nft_counter bridge stp llc nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct dm_service_time nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink zfcp scsi_transport_fc rpcrdma sunrpc dm_multipath rdma_ucm scsi_dh_rdac scsi_dh_emc rdma_cm scsi_dh_alua iw_cm ib_cm mlx5_ib ib_uverbs dm_mod ib_core s390_trng vfio_ccw vfio_mdev mdev vfio_iommu_type1 zcrypt_cex4 vfio eadm_sch sch_fq_codel configfs ip_tables x_tables ghash_s390 prng aes_s390 des_s390 libdes sha3_512_s390 sha3_256_s390 mlx5_core sha512_s390 sha256_s390 sha1_s390 sha_common nvme nvme_core pkey zcrypt rng_core autofs4 [last unloaded: vfio_ap]
> [ 1506.494832] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 5.12.0-20210330.rc4.git0.9d49ed9ca93b.300.fc33.s390x+next #1
> [ 1506.494834] Hardware name: IBM 8561 T01 703 (LPAR)
> [ 1506.494836] Krnl PSW : 0704c00180000000 00000002d71dd21e (percpu_ref_switch_to_atomic_rcu+0x1ee/0x1f8)
> [ 1506.494840]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:0 PM:0 RI:0 EA:3
> [ 1506.494842] Krnl GPRS: c0000000fffeffff 00000002f7256818 0000000000000043 00000000fffeffff
> [ 1506.494844]            00000000ffffffea 0000038000000001 0000000000000000 000003800000017c
> [ 1506.494846]            00000002d7924988 0000000227eb97a0 000003ff5413c7e0 7fffffffffffffff
> [ 1506.494848]            0000000080360000 00000002f726b570 00000002d71dd21a 00000380000bba28
> [ 1506.494856] Krnl Code: 00000002d71dd20e: e3309fe8ff04        lg      %r3,-24(%r9)
>                            00000002d71dd214: c0e5001eb556        brasl   %r14,00000002d75b3cc0
>                           #00000002d71dd21a: af000000            mc      0,0
>                           >00000002d71dd21e: a7f4ffcc            brc     15,00000002d71dd1b6
>                            00000002d71dd222: 0707                bcr     0,%r7
>                            00000002d71dd224: 0707                bcr     0,%r7
>                            00000002d71dd226: 0707                bcr     0,%r7
>                            00000002d71dd228: eb6ff0480024        stmg    %r6,%r15,72(%r15)
> [ 1506.494928] Call Trace:
> [ 1506.494933]  [<00000002d71dd21e>] percpu_ref_switch_to_atomic_rcu+0x1ee/0x1f8
> [ 1506.494940] ([<00000002d71dd21a>] percpu_ref_switch_to_atomic_rcu+0x1ea/0x1f8)
> [ 1506.494942]  [<00000002d6b8a6c6>] rcu_do_batch+0x146/0x608
> [ 1506.494946]  [<00000002d6b8ec04>] rcu_core+0x124/0x1d0
> [ 1506.494948]  [<00000002d75d0222>] __do_softirq+0x13a/0x3c8
> [ 1506.494952]  [<00000002d6b05306>] irq_exit+0xce/0xf8
> [ 1506.494955]  [<00000002d75c1eb4>] do_ext_irq+0xdc/0x170
> [ 1506.494957]  [<00000002d75cdea4>] ext_int_handler+0xc4/0xf4
> [ 1506.494959]  [<0000000000000000>] 0x0
> [ 1506.494963]  [<00000002d75cd9c2>] default_idle_call+0x42/0x110
> [ 1506.494965]  [<00000002d6b411a0>] do_idle+0xd8/0x168
> [ 1506.494968]  [<00000002d6b413ee>] cpu_startup_entry+0x36/0x40
> [ 1506.494971]  [<00000002d6ac730a>] smp_start_secondary+0x82/0x88
> [ 1506.494974] Last Breaking-Event-Address:
> [ 1506.494975]  [<00000002d6b71898>] vprintk_emit+0xa8/0x110
> [ 1506.494978] Kernel panic - not syncing: panic_on_warn set ...
> 
> 
> 
> I will try to bisect this, but if anyone has an idea. CC some candidates.

