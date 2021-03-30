Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF2934EDBE
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 18:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbhC3Q0o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 12:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbhC3Q0L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 12:26:11 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B03C061764
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 09:26:11 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id v23so6434325ple.9
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 09:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rNaWr4eEJxR4UHgnqDYqEjy0PxjcuOcUite8WmTqZL8=;
        b=hDnIf4caC1eYmUJVfPtL+F4i3OM9JZ4qDjYpXkPzcKkflPe8z4we/gZ+aET7TaCKJz
         BGopcg1i7aAsz1sTZ7Vqo5AxqZQKvQtc32PB6FR2JuaGxqpISK2o350OYJkY/6zlUInC
         dvLpPavce/JyYfKKjUhtbDqQiUyvU9RdrjG09x4/ragSPsMltW8hxdLrjYQDToVELXhy
         1/P1NKe1KQpcrARtkS6vWqY86G0rjjVOu4jegOryjZNyommXWD15RW9zcCari5i2ugLb
         nfD0EIITKDA9xbfhqu0gDIL+d8OrJG53Znbgsm575M4yolDhixoJz6TDqiSrTbdEvn0h
         1kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rNaWr4eEJxR4UHgnqDYqEjy0PxjcuOcUite8WmTqZL8=;
        b=oPtl6gREkzS6q6rBtyPVWmn9PRkoIKE6aHlCyVTajhh+AAbeviRoSWmtJ1hjhRtp8Q
         AvX9oDOiHBheUoXSE/Lk4+UI7ZP35BrGiAW3w1sYkIPqasXx1XJD0ELC8izEcrmUTiJL
         B+ZgrGwVlentKN+T5R65qcQVFDyrRupT5MXdlJgIxYx0UsyYHtWEgma0HRJ+NZL48fxv
         hB2j4ToNRi9fjY/gheYLqUcP+y0MtOoEhjnmHLztO7u7VKY+Yl/HIENxFmar4sahtigs
         +FkxQoL0FnX4s7eScICk/crkXvYbkN+87v9Ktyd+tJ56FqKcO1Sl1Cf2KPE3fsGbtSFa
         uL+A==
X-Gm-Message-State: AOAM5337/hs8iTuiGlDdqp0m6ceQbMQV4Av6FsvFRiQdNw5IYzBEBxZ2
        Jico/6YDxjhxoMzFCmmdmuZj+WTGQKPf2CUsbO+FPA==
X-Google-Smtp-Source: ABdhPJy6dqqGNIVfmOtkRr3IFyzMK8/iCKlYRJ2Y7XOmUbx6f1/TRMX1lbiT38TFbpFq4VTs81mGb/YYCMBgPu/od8g=
X-Received: by 2002:a17:90a:901:: with SMTP id n1mr5114222pjn.147.1617121571073;
 Tue, 30 Mar 2021 09:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210329205249.6b557510@canb.auug.org.au> <83263d0d-1f3f-8a3c-8a95-49e0cfa15051@de.ibm.com>
 <4419611b-3282-2197-884c-332025cdada8@de.ibm.com> <CAMZfGtUaTdmpcw1dr_rWQZTz3UTh9ZFavr0WBSa_obENPasgFw@mail.gmail.com>
 <7c27fc2e-5cea-5a17-6e30-8ae1cb291274@de.ibm.com>
In-Reply-To: <7c27fc2e-5cea-5a17-6e30-8ae1cb291274@de.ibm.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 31 Mar 2021 00:25:34 +0800
Message-ID: <CAMZfGtV9w24cJAwYsQuhvVpdLiYssjdfwfXApNK51zacr31c3w@mail.gmail.com>
Subject: Re: [External] RE: kernel warning percpu ref in obj_cgroup_release
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

On Tue, Mar 30, 2021 at 11:10 PM Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
>
>
> On 30.03.21 15:49, Muchun Song wrote:
> > On Tue, Mar 30, 2021 at 9:27 PM Christian Borntraeger
> > <borntraeger@de.ibm.com> wrote:
> >>
> >> So bisect shows this for belows warning:
> >
> > Thanks for your effort on this. Can you share your config?
>
> attached (but its s390x) for next-20210330

Thanks. Can you apply the following patch and help me test?
Very Thanks.

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 7fdc92e1983e..579408e4d46f 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -793,6 +793,12 @@ static inline void obj_cgroup_get(struct obj_cgroup *o=
bjcg)
        percpu_ref_get(&objcg->refcnt);
 }

+static inline void obj_cgroup_get_many(struct obj_cgroup *objcg,
+                                      unsigned long nr)
+{
+       percpu_ref_get_many(&objcg->refcnt, nr);
+}
+
 static inline void obj_cgroup_put(struct obj_cgroup *objcg)
 {
        percpu_ref_put(&objcg->refcnt);
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index c0b83a396299..1634dba1044c 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -3133,7 +3133,10 @@ void split_page_memcg(struct page *head, unsigned in=
t nr)

        for (i =3D 1; i < nr; i++)
                head[i].memcg_data =3D head->memcg_data;
-       css_get_many(&memcg->css, nr - 1);
+       if (PageMemcgKmem(head))
+               obj_cgroup_get_many(__page_objcg(head), nr - 1);
+       else
+               css_get_many(&memcg->css, nr - 1);
 }

 #ifdef CONFIG_MEMCG_SWAP

>
> The problem goes away when I add
> cgroup_controllers =3D [  ]
> to /etc/libvirt/qemu.conf
>
> The testcase that triggers the problem starts and stops multipe KVM guest=
s with 248 CPUs.
> Do we happen to have maybe only a byte of refcount space?
>
>
> >
> >>
> >> 636c3ef8229ecb4e7d045e86f36505d24a8f019a is the first bad commit
> >> commit 636c3ef8229ecb4e7d045e86f36505d24a8f019a
> >> Author: Muchun Song <songmuchun@bytedance.com>
> >> Date:   Mon Mar 29 11:12:06 2021 +1100
> >>
> >>       mm: memcontrol: use obj_cgroup APIs to charge kmem pages
> >>
> >>       Since Roman's series "The new cgroup slab memory controller" app=
lied.  All
> >>       slab objects are charged via the new APIs of obj_cgroup.  The ne=
w APIs
> >>       introduce a struct obj_cgroup to charge slab objects.  It preven=
ts
> >>       long-living objects from pinning the original memory cgroup in t=
he memory.
> >>       But there are still some corner objects (e.g.  allocations large=
r than
> >>       order-1 page on SLUB) which are not charged via the new APIs.  T=
hose
> >>       objects (include the pages which are allocated from buddy alloca=
tor
> >>       directly) are charged as kmem pages which still hold a reference=
 to the
> >>       memory cgroup.
> >>
> >>       We want to reuse the obj_cgroup APIs to charge the kmem pages.  =
If we do
> >>       that, we should store an object cgroup pointer to page->memcg_da=
ta for the
> >>       kmem pages.
> >>
> >>       Finally, page->memcg_data will have 3 different meanings.
> >>
> >>         1) For the slab pages, page->memcg_data points to an object cg=
roups
> >>            vector.
> >>
> >>         2) For the kmem pages (exclude the slab pages), page->memcg_da=
ta
> >>            points to an object cgroup.
> >>
> >>         3) For the user pages (e.g. the LRU pages), page->memcg_data p=
oints
> >>            to a memory cgroup.
> >>
> >>       We do not change the behavior of page_memcg() and page_memcg_rcu=
().  They
> >>       are also suitable for LRU pages and kmem pages.  Why?
> >>
> >>       Because memory allocations pinning memcgs for a long time - it e=
xists at a
> >>       larger scale and is causing recurring problems in the real world=
: page
> >>       cache doesn't get reclaimed for a long time, or is used by the s=
econd,
> >>       third, fourth, ...  instance of the same job that was restarted =
into a new
> >>       cgroup every time.  Unreclaimable dying cgroups pile up, waste m=
emory, and
> >>       make page reclaim very inefficient.
> >>
> >>       We can convert LRU pages and most other raw memcg pins to the ob=
jcg
> >>       direction to fix this problem, and then the page->memcg will alw=
ays point
> >>       to an object cgroup pointer.  At that time, LRU pages and kmem p=
ages will
> >>       be treated the same.  The implementation of page_memcg() will re=
move the
> >>       kmem page check.
> >>
> >>       This patch aims to charge the kmem pages by using the new APIs o=
f
> >>       obj_cgroup.  Finally, the page->memcg_data of the kmem page poin=
ts to an
> >>       object cgroup.  We can use the __page_objcg() to get the object =
cgroup
> >>       associated with a kmem page.  Or we can use page_memcg() to get =
the memory
> >>       cgroup associated with a kmem page, but caller must ensure that =
the
> >>       returned memcg won't be released (e.g.  acquire the rcu_read_loc=
k or
> >>       css_set_lock).
> >>
> >>       Link: https://lkml.kernel.org/r/20210319163821.20704-6-songmuchu=
n@bytedance.com
> >>       Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> >>       Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> >>       Cc: Michal Hocko <mhocko@kernel.org>
> >>       Cc: Roman Gushchin <guro@fb.com>
> >>       Cc: Shakeel Butt <shakeelb@google.com>
> >>       Cc: Vladimir Davydov <vdavydov.dev@gmail.com>
> >>       Cc: Xiongchun Duan <duanxiongchun@bytedance.com>
> >>       Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> >>       Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >>
> >>    include/linux/memcontrol.h | 116 ++++++++++++++++++++++++++++++++++=
+----------
> >>    mm/memcontrol.c            | 110 +++++++++++++++++++++-------------=
--------
> >>    2 files changed, 145 insertions(+), 81 deletions(-)
> >>
> >>
> >>
> >>
> >>
> >> On 30.03.21 13:32, Christian Borntraeger wrote:
> >> [...]
> >>>
> >>> This next (328 is fine) triggers several bugs during our KVM CI run:
> >>>
> >>> [ 1506.494716] ------------[ cut here ]------------
> >>> [ 1506.494730] percpu ref (obj_cgroup_release) <=3D 0 (-1) after swit=
ching to atomic
> >>> [ 1506.494766] WARNING: CPU: 6 PID: 0 at lib/percpu-refcount.c:196 pe=
rcpu_ref_switch_to_atomic_rcu+0x1ea/0x1f8
> >>> [ 1506.494774] Modules linked in: kvm vhost_vsock vmw_vsock_virtio_tr=
ansport_common vsock vhost vhost_iotlb xt_CHECKSUM xt_MASQUERADE xt_conntra=
ck ipt_REJECT xt_tcpudp nft_compat nf_nat_tftp nft_objref nf_conntrack_tftp=
 nft_counter bridge stp llc nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib =
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct dm_service_=
time nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set=
 nf_tables nfnetlink zfcp scsi_transport_fc rpcrdma sunrpc dm_multipath rdm=
a_ucm scsi_dh_rdac scsi_dh_emc rdma_cm scsi_dh_alua iw_cm ib_cm mlx5_ib ib_=
uverbs dm_mod ib_core s390_trng vfio_ccw vfio_mdev mdev vfio_iommu_type1 zc=
rypt_cex4 vfio eadm_sch sch_fq_codel configfs ip_tables x_tables ghash_s390=
 prng aes_s390 des_s390 libdes sha3_512_s390 sha3_256_s390 mlx5_core sha512=
_s390 sha256_s390 sha1_s390 sha_common nvme nvme_core pkey zcrypt rng_core =
autofs4 [last unloaded: vfio_ap]
> >>> [ 1506.494832] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 5.12.0-20210=
330.rc4.git0.9d49ed9ca93b.300.fc33.s390x+next #1
> >>> [ 1506.494834] Hardware name: IBM 8561 T01 703 (LPAR)
> >>> [ 1506.494836] Krnl PSW : 0704c00180000000 00000002d71dd21e (percpu_r=
ef_switch_to_atomic_rcu+0x1ee/0x1f8)
> >>> [ 1506.494840]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC=
:0 PM:0 RI:0 EA:3
> >>> [ 1506.494842] Krnl GPRS: c0000000fffeffff 00000002f7256818 000000000=
0000043 00000000fffeffff
> >>> [ 1506.494844]            00000000ffffffea 0000038000000001 000000000=
0000000 000003800000017c
> >>> [ 1506.494846]            00000002d7924988 0000000227eb97a0 000003ff5=
413c7e0 7fffffffffffffff
> >>> [ 1506.494848]            0000000080360000 00000002f726b570 00000002d=
71dd21a 00000380000bba28
> >>> [ 1506.494856] Krnl Code: 00000002d71dd20e: e3309fe8ff04        lg   =
   %r3,-24(%r9)
> >>>                             00000002d71dd214: c0e5001eb556        bra=
sl   %r14,00000002d75b3cc0
> >>>                            #00000002d71dd21a: af000000            mc =
     0,0
> >>>                            >00000002d71dd21e: a7f4ffcc            brc=
     15,00000002d71dd1b6
> >>>                             00000002d71dd222: 0707                bcr=
     0,%r7
> >>>                             00000002d71dd224: 0707                bcr=
     0,%r7
> >>>                             00000002d71dd226: 0707                bcr=
     0,%r7
> >>>                             00000002d71dd228: eb6ff0480024        stm=
g    %r6,%r15,72(%r15)
> >>> [ 1506.494928] Call Trace:
> >>> [ 1506.494933]  [<00000002d71dd21e>] percpu_ref_switch_to_atomic_rcu+=
0x1ee/0x1f8
> >>> [ 1506.494940] ([<00000002d71dd21a>] percpu_ref_switch_to_atomic_rcu+=
0x1ea/0x1f8)
> >>> [ 1506.494942]  [<00000002d6b8a6c6>] rcu_do_batch+0x146/0x608
> >>> [ 1506.494946]  [<00000002d6b8ec04>] rcu_core+0x124/0x1d0
> >>> [ 1506.494948]  [<00000002d75d0222>] __do_softirq+0x13a/0x3c8
> >>> [ 1506.494952]  [<00000002d6b05306>] irq_exit+0xce/0xf8
> >>> [ 1506.494955]  [<00000002d75c1eb4>] do_ext_irq+0xdc/0x170
> >>> [ 1506.494957]  [<00000002d75cdea4>] ext_int_handler+0xc4/0xf4
> >>> [ 1506.494959]  [<0000000000000000>] 0x0
> >>> [ 1506.494963]  [<00000002d75cd9c2>] default_idle_call+0x42/0x110
> >>> [ 1506.494965]  [<00000002d6b411a0>] do_idle+0xd8/0x168
> >>> [ 1506.494968]  [<00000002d6b413ee>] cpu_startup_entry+0x36/0x40
> >>> [ 1506.494971]  [<00000002d6ac730a>] smp_start_secondary+0x82/0x88
> >>> [ 1506.494974] Last Breaking-Event-Address:
> >>> [ 1506.494975]  [<00000002d6b71898>] vprintk_emit+0xa8/0x110
> >>> [ 1506.494978] Kernel panic - not syncing: panic_on_warn set ...
> >>>
> >>>
> >>>
> >>> I will try to bisect this, but if anyone has an idea. CC some candida=
tes.
> >>
