Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF64A34E99C
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 15:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhC3Nt6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 09:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232136AbhC3Nty (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 09:49:54 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25731C061574
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 06:49:53 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id h8so6200785plt.7
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=moxvsMHK2zOVbc87uG3eKkqwPrcev9tXTe25E/6NN30=;
        b=tW/m4jp3zS8MJZTbS+EvcGIH1goNx9PwYxoVQt3NERHR24r757T3jul85M+ozaCj2H
         M7+nwLau/Qk/x/3jq0638Oe1XqFbi0omwi1OY/pmG2vFhwXZAIMnahzEWyLORcf/8l5s
         sY4seCtflhvUOdIU5JDzUBt6HIGTTe3weXUOiBYx/XI1V2pR7jk4uaTp258kDI1toHvZ
         YXb9HVR3D3KK6tlMeI/xABW9zsv0X2km24G5zO3+8up2XDTVwGQWMEf6Xob7VCQAwv72
         LReTOJnwqhdyLHNXGCH1kJ/o4OZwFqRsH9yjo4uacsBSmt8ArnkavF4Xdx/OUkESEWVJ
         7dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=moxvsMHK2zOVbc87uG3eKkqwPrcev9tXTe25E/6NN30=;
        b=IGkTVM+aR1H4HejY+rilX7n+SmhEL5/j3vpat2F/CebUJ7ctZaMakqSbJLk2BkA990
         4WcQ3BJuDHaevyntlAEVqVvv1ZQ5wGzgPLXxd2jLMF2F6JnsHtkWUByZ29WmlxBdeRdT
         VRmzvzCVsPl1niM5lgyyKqa7pHUtJ/0eUWlGLMmRVtzBqUHtwK4BhVOEu7SQ3kNwnQfs
         A1cu9AfY+LWbrun3w0g8L1VPzg/xiIwCuCANa39a7sxMGhMPCjsyUU7ufuVKY8VJg8uz
         YMYzUs8hHop/Laon9ASP9HWWp41D5P+BlED9g7mQxaj5raHyJ4r8sfDwc0cmboiWHH0S
         PvPA==
X-Gm-Message-State: AOAM532vMZMtzFIKKjbPEDQQjUp0q52I65QDl7qYlJN6M49HCIab+yDW
        6q9Il0ivMU9EO4BfwOU9ov0YDzyEz22WOrYFJSwVjA==
X-Google-Smtp-Source: ABdhPJwlQwC6rHellbfo93aI6BsglsrNcqJsLJ45aAJJ8oP8hee5f9CPF5w2mGZMlZihqRDXyWpvGtGs7AbuWuMF8Hk=
X-Received: by 2002:a17:90a:f008:: with SMTP id bt8mr4496549pjb.13.1617112192641;
 Tue, 30 Mar 2021 06:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210329205249.6b557510@canb.auug.org.au> <83263d0d-1f3f-8a3c-8a95-49e0cfa15051@de.ibm.com>
 <4419611b-3282-2197-884c-332025cdada8@de.ibm.com>
In-Reply-To: <4419611b-3282-2197-884c-332025cdada8@de.ibm.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 30 Mar 2021 21:49:15 +0800
Message-ID: <CAMZfGtUaTdmpcw1dr_rWQZTz3UTh9ZFavr0WBSa_obENPasgFw@mail.gmail.com>
Subject: Re: [External] Re: kernel warning percpu ref in obj_cgroup_release
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yang Shi <shy828301@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>, Roman Gushchin <guro@fb.com>,
        Shakeel Butt <shakeelb@google.com>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Xiongchun Duan <duanxiongchun@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 30, 2021 at 9:27 PM Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
>
> So bisect shows this for belows warning:

Thanks for your effort on this. Can you share your config?

>
> 636c3ef8229ecb4e7d045e86f36505d24a8f019a is the first bad commit
> commit 636c3ef8229ecb4e7d045e86f36505d24a8f019a
> Author: Muchun Song <songmuchun@bytedance.com>
> Date:   Mon Mar 29 11:12:06 2021 +1100
>
>      mm: memcontrol: use obj_cgroup APIs to charge kmem pages
>
>      Since Roman's series "The new cgroup slab memory controller" applied=
.  All
>      slab objects are charged via the new APIs of obj_cgroup.  The new AP=
Is
>      introduce a struct obj_cgroup to charge slab objects.  It prevents
>      long-living objects from pinning the original memory cgroup in the m=
emory.
>      But there are still some corner objects (e.g.  allocations larger th=
an
>      order-1 page on SLUB) which are not charged via the new APIs.  Those
>      objects (include the pages which are allocated from buddy allocator
>      directly) are charged as kmem pages which still hold a reference to =
the
>      memory cgroup.
>
>      We want to reuse the obj_cgroup APIs to charge the kmem pages.  If w=
e do
>      that, we should store an object cgroup pointer to page->memcg_data f=
or the
>      kmem pages.
>
>      Finally, page->memcg_data will have 3 different meanings.
>
>        1) For the slab pages, page->memcg_data points to an object cgroup=
s
>           vector.
>
>        2) For the kmem pages (exclude the slab pages), page->memcg_data
>           points to an object cgroup.
>
>        3) For the user pages (e.g. the LRU pages), page->memcg_data point=
s
>           to a memory cgroup.
>
>      We do not change the behavior of page_memcg() and page_memcg_rcu(). =
 They
>      are also suitable for LRU pages and kmem pages.  Why?
>
>      Because memory allocations pinning memcgs for a long time - it exist=
s at a
>      larger scale and is causing recurring problems in the real world: pa=
ge
>      cache doesn't get reclaimed for a long time, or is used by the secon=
d,
>      third, fourth, ...  instance of the same job that was restarted into=
 a new
>      cgroup every time.  Unreclaimable dying cgroups pile up, waste memor=
y, and
>      make page reclaim very inefficient.
>
>      We can convert LRU pages and most other raw memcg pins to the objcg
>      direction to fix this problem, and then the page->memcg will always =
point
>      to an object cgroup pointer.  At that time, LRU pages and kmem pages=
 will
>      be treated the same.  The implementation of page_memcg() will remove=
 the
>      kmem page check.
>
>      This patch aims to charge the kmem pages by using the new APIs of
>      obj_cgroup.  Finally, the page->memcg_data of the kmem page points t=
o an
>      object cgroup.  We can use the __page_objcg() to get the object cgro=
up
>      associated with a kmem page.  Or we can use page_memcg() to get the =
memory
>      cgroup associated with a kmem page, but caller must ensure that the
>      returned memcg won't be released (e.g.  acquire the rcu_read_lock or
>      css_set_lock).
>
>      Link: https://lkml.kernel.org/r/20210319163821.20704-6-songmuchun@by=
tedance.com
>      Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>      Acked-by: Johannes Weiner <hannes@cmpxchg.org>
>      Cc: Michal Hocko <mhocko@kernel.org>
>      Cc: Roman Gushchin <guro@fb.com>
>      Cc: Shakeel Butt <shakeelb@google.com>
>      Cc: Vladimir Davydov <vdavydov.dev@gmail.com>
>      Cc: Xiongchun Duan <duanxiongchun@bytedance.com>
>      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>      Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
>   include/linux/memcontrol.h | 116 +++++++++++++++++++++++++++++++++++---=
-------
>   mm/memcontrol.c            | 110 +++++++++++++++++++++-----------------=
----
>   2 files changed, 145 insertions(+), 81 deletions(-)
>
>
>
>
>
> On 30.03.21 13:32, Christian Borntraeger wrote:
> [...]
> >
> > This next (328 is fine) triggers several bugs during our KVM CI run:
> >
> > [ 1506.494716] ------------[ cut here ]------------
> > [ 1506.494730] percpu ref (obj_cgroup_release) <=3D 0 (-1) after switch=
ing to atomic
> > [ 1506.494766] WARNING: CPU: 6 PID: 0 at lib/percpu-refcount.c:196 perc=
pu_ref_switch_to_atomic_rcu+0x1ea/0x1f8
> > [ 1506.494774] Modules linked in: kvm vhost_vsock vmw_vsock_virtio_tran=
sport_common vsock vhost vhost_iotlb xt_CHECKSUM xt_MASQUERADE xt_conntrack=
 ipt_REJECT xt_tcpudp nft_compat nf_nat_tftp nft_objref nf_conntrack_tftp n=
ft_counter bridge stp llc nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nf=
t_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct dm_service_ti=
me nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set n=
f_tables nfnetlink zfcp scsi_transport_fc rpcrdma sunrpc dm_multipath rdma_=
ucm scsi_dh_rdac scsi_dh_emc rdma_cm scsi_dh_alua iw_cm ib_cm mlx5_ib ib_uv=
erbs dm_mod ib_core s390_trng vfio_ccw vfio_mdev mdev vfio_iommu_type1 zcry=
pt_cex4 vfio eadm_sch sch_fq_codel configfs ip_tables x_tables ghash_s390 p=
rng aes_s390 des_s390 libdes sha3_512_s390 sha3_256_s390 mlx5_core sha512_s=
390 sha256_s390 sha1_s390 sha_common nvme nvme_core pkey zcrypt rng_core au=
tofs4 [last unloaded: vfio_ap]
> > [ 1506.494832] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 5.12.0-2021033=
0.rc4.git0.9d49ed9ca93b.300.fc33.s390x+next #1
> > [ 1506.494834] Hardware name: IBM 8561 T01 703 (LPAR)
> > [ 1506.494836] Krnl PSW : 0704c00180000000 00000002d71dd21e (percpu_ref=
_switch_to_atomic_rcu+0x1ee/0x1f8)
> > [ 1506.494840]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:0=
 PM:0 RI:0 EA:3
> > [ 1506.494842] Krnl GPRS: c0000000fffeffff 00000002f7256818 00000000000=
00043 00000000fffeffff
> > [ 1506.494844]            00000000ffffffea 0000038000000001 00000000000=
00000 000003800000017c
> > [ 1506.494846]            00000002d7924988 0000000227eb97a0 000003ff541=
3c7e0 7fffffffffffffff
> > [ 1506.494848]            0000000080360000 00000002f726b570 00000002d71=
dd21a 00000380000bba28
> > [ 1506.494856] Krnl Code: 00000002d71dd20e: e3309fe8ff04        lg     =
 %r3,-24(%r9)
> >                            00000002d71dd214: c0e5001eb556        brasl =
  %r14,00000002d75b3cc0
> >                           #00000002d71dd21a: af000000            mc    =
  0,0
> >                           >00000002d71dd21e: a7f4ffcc            brc   =
  15,00000002d71dd1b6
> >                            00000002d71dd222: 0707                bcr   =
  0,%r7
> >                            00000002d71dd224: 0707                bcr   =
  0,%r7
> >                            00000002d71dd226: 0707                bcr   =
  0,%r7
> >                            00000002d71dd228: eb6ff0480024        stmg  =
  %r6,%r15,72(%r15)
> > [ 1506.494928] Call Trace:
> > [ 1506.494933]  [<00000002d71dd21e>] percpu_ref_switch_to_atomic_rcu+0x=
1ee/0x1f8
> > [ 1506.494940] ([<00000002d71dd21a>] percpu_ref_switch_to_atomic_rcu+0x=
1ea/0x1f8)
> > [ 1506.494942]  [<00000002d6b8a6c6>] rcu_do_batch+0x146/0x608
> > [ 1506.494946]  [<00000002d6b8ec04>] rcu_core+0x124/0x1d0
> > [ 1506.494948]  [<00000002d75d0222>] __do_softirq+0x13a/0x3c8
> > [ 1506.494952]  [<00000002d6b05306>] irq_exit+0xce/0xf8
> > [ 1506.494955]  [<00000002d75c1eb4>] do_ext_irq+0xdc/0x170
> > [ 1506.494957]  [<00000002d75cdea4>] ext_int_handler+0xc4/0xf4
> > [ 1506.494959]  [<0000000000000000>] 0x0
> > [ 1506.494963]  [<00000002d75cd9c2>] default_idle_call+0x42/0x110
> > [ 1506.494965]  [<00000002d6b411a0>] do_idle+0xd8/0x168
> > [ 1506.494968]  [<00000002d6b413ee>] cpu_startup_entry+0x36/0x40
> > [ 1506.494971]  [<00000002d6ac730a>] smp_start_secondary+0x82/0x88
> > [ 1506.494974] Last Breaking-Event-Address:
> > [ 1506.494975]  [<00000002d6b71898>] vprintk_emit+0xa8/0x110
> > [ 1506.494978] Kernel panic - not syncing: panic_on_warn set ...
> >
> >
> >
> > I will try to bisect this, but if anyone has an idea. CC some candidate=
s.
>
