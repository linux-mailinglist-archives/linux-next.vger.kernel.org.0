Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F682CDC0C
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 18:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgLCRMb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 12:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24399 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726339AbgLCRMb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 12:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607015464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uhkrIbkP+2I5PD5prOOeLdY5JuL7PV97yJKzCyL+Jhc=;
        b=Q5/WuWzxmd4l97IHaKlTM2oCbXv+jmSlfGVv+7Q00y/vU7X7kGUp6yBfg01YjVuNJEGe2u
        2qY3ETMMY4Sr9j/RFrFIvIA65DExTANmeVw+JF6uXq6YyInZybz047Jn5VtEjG49kXQz5s
        ap0sRMuBar3SPDvzffbrq4VPJEaUtbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-gAySmrSKMpGBPP4yfuhAEg-1; Thu, 03 Dec 2020 12:10:59 -0500
X-MC-Unique: gAySmrSKMpGBPP4yfuhAEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AE05858181;
        Thu,  3 Dec 2020 17:10:57 +0000 (UTC)
Received: from ovpn-66-132.rdu2.redhat.com (unknown [10.10.67.132])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 08B8060CE0;
        Thu,  3 Dec 2020 17:10:54 +0000 (UTC)
Message-ID: <840af74e06e2515c84eb86df2825d466bcf75e96.camel@redhat.com>
Subject: Re: [PATCH v3 1/1] kasan: fix object remain in offline per-cpu
 quarantine
From:   Qian Cai <qcai@redhat.com>
To:     Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicholas Tang <nicholas.tang@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>
Cc:     wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-mm@kvack.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org
Date:   Thu, 03 Dec 2020 12:10:54 -0500
In-Reply-To: <1606895585-17382-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
References: <1606895585-17382-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
         <1606895585-17382-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2020-12-02 at 15:53 +0800, Kuan-Ying Lee wrote:
> We hit this issue in our internal test.
> When enabling generic kasan, a kfree()'d object is put into per-cpu
> quarantine first. If the cpu goes offline, object still remains in
> the per-cpu quarantine. If we call kmem_cache_destroy() now, slub
> will report "Objects remaining" error.

Reverting this commit on the top of today's linux-next fixed memory corruptions
while doing CPU hotplug.

.config: https://cailca.coding.net/public/linux/mm/git/files/master/x86.config

[  421.539476][  T120] BUG kmalloc-128 (Not tainted): Object already free
[  421.546047][  T120] -----------------------------------------------------------------------------
[  421.546047][  T120] 
[  421.557165][  T120] INFO: Allocated in memcg_alloc_page_obj_cgroups+0x86/0x140 age=755 cpu=21 pid=2316
[  421.566533][  T120] 	__slab_alloc+0x55/0x70
[  421.570744][  T120] 	__kmalloc_node+0xdc/0x280
[  421.575215][  T120] 	memcg_alloc_page_obj_cgroups+0x86/0x140
[  421.580910][  T120] 	allocate_slab+0xd8/0x610
[  421.585299][  T120] 	___slab_alloc+0x4cb/0x830
[  421.589770][  T120] 	__slab_alloc+0x55/0x70
[  421.593985][  T120] 	kmem_cache_alloc+0x225/0x280
[  421.598724][  T120] 	vm_area_dup+0x76/0x2a0
[  421.602940][  T120] 	__split_vma+0x90/0x4b0
[  421.607151][  T120] 	mprotect_fixup+0x5da/0x7d0
[  421.611712][  T120] 	do_mprotect_pkey+0x41a/0x7c0
[  421.616447][  T120] 	__x64_sys_mprotect+0x74/0xb0
[  421.621181][  T120] 	do_syscall_64+0x33/0x40
[  421.625479][  T120] 	entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  421.631262][  T120] INFO: Freed in quarantine_put+0xb5/0x1b0 age=3 cpu=21 pid=120
[  421.638795][  T120] 	quarantine_put+0xe7/0x1b0
[  421.643270][  T120] 	slab_free_freelist_hook+0x71/0x1a0
[  421.648529][  T120] 	kfree+0xe2/0x5d0
[  421.652215][  T120] 	__free_slab+0x1f8/0x300
[  421.656517][  T120] 	qlist_free_all+0x56/0xc0
[  421.660903][  T120] 	kasan_cpu_offline+0x1a/0x20
[  421.665550][  T120] 	cpuhp_invoke_callback+0x1dd/0x1530
[  421.670811][  T120] 	cpuhp_thread_fun+0x343/0x690
[  421.675547][  T120] 	smpboot_thread_fn+0x30f/0x780
[  421.680371][  T120] 	kthread+0x359/0x420
[  421.684317][  T120] 	ret_from_fork+0x22/0x30
[  421.688616][  T120] INFO: Slab 0x0000000080d42669 objects=12 used=11 fp=0x000000000ce8ce1d flags=0x4bfffc000010201
[  421.699031][  T120] INFO: Object 0x000000000ce8ce1d @offset=1408 fp=0x0000000000000000
[  421.699031][  T120] 
[  421.709186][  T120] Redzone 000000002d1421b0: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[  421.719339][  T120] Redzone 0000000018565a7c: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[  421.729492][  T120] Redzone 00000000d8a699c9: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[  421.739645][  T120] Redzone 00000000af065f39: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[  421.749800][  T120] Redzone 00000000480c8db9: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[  421.759954][  T120] Redzone 00000000c37ee06b: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[  421.770106][  T120] Redzone 0000000040f9cbf1: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[  421.780256][  T120] Redzone 00000000e714e01e: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[  421.790408][  T120] Object 000000000ce8ce1d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  421.800471][  T120] Object 0000000046eb4462: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  421.810536][  T120] Object 00000000c3a122ae: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  421.820599][  T120] Object 00000000d0195822: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  421.830665][  T120] Object 000000008332e5f7: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  421.840729][  T120] Object 00000000a04f77eb: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  421.850796][  T120] Object 00000000326e9ce3: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  421.860862][  T120] Object 00000000fa32b4b7: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
[  421.870926][  T120] Redzone 000000001d59aa8f: bb bb bb bb bb bb bb bb                          ........
[  421.880382][  T120] Padding 00000000f49e6727: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[  421.890537][  T120] Padding 000000007eb7befd: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[  421.900691][  T120] Padding 00000000c69f7c35: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[  421.910842][  T120] CPU: 21 PID: 120 Comm: cpuhp/21 Tainted: G    B             5.10.0-rc6-next-20201203+ #8
[  421.920733][  T120] Hardware name: HPE ProLiant DL385 Gen10/ProLiant DL385 Gen10, BIOS A40 07/10/2019
[  421.930011][  T120] Call Trace:
[  421.933174][  T120]  dump_stack+0x99/0xcb
[  421.937210][  T120]  free_debug_processing.cold.98+0x6a/0x111
[  421.942993][  T120]  ? __free_slab+0x1f8/0x300
[  421.947467][  T120]  ? __free_slab+0x1f8/0x300
[  421.951942][  T120]  __slab_free+0x302/0x560
[  421.956241][  T120]  ? lockdep_hardirqs_on_prepare+0x27c/0x3d0
[  421.962110][  T120]  ? quarantine_put+0x10a/0x1b0
[  421.966846][  T120]  ? trace_hardirqs_on+0x1c/0x150
[  421.971754][  T120]  ? slab_free_freelist_hook+0x71/0x1a0
[  421.977192][  T120]  kfree+0x595/0x5d0
[  421.980967][  T120]  ? __free_slab+0x1f8/0x300
[  421.985439][  T120]  __free_slab+0x1f8/0x300
[  421.989738][  T120]  ? qlist_free_all+0x2f/0xc0
[  421.994299][  T120]  qlist_free_all+0x56/0xc0
[  421.998684][  T120]  ? qlist_free_all+0xc0/0xc0
[  422.003244][  T120]  kasan_cpu_offline+0x1a/0x20
[  422.007893][  T120]  cpuhp_invoke_callback+0x1dd/0x1530
[  422.013152][  T120]  cpuhp_thread_fun+0x343/0x690
[  422.017887][  T120]  ? __cpuhp_state_remove_instance+0x490/0x490
[  422.023934][  T120]  smpboot_thread_fn+0x30f/0x780
[  422.028756][  T120]  ? smpboot_register_percpu_thread+0x370/0x370
[  422.034888][  T120]  ? trace_hardirqs_on+0x1c/0x150
[  422.039800][  T120]  ? __kthread_parkme+0xd1/0x1a0
[  422.044622][  T120]  ? smpboot_register_percpu_thread+0x370/0x370
[  422.050753][  T120]  kthread+0x359/0x420
[  422.054704][  T120]  ? kthread_create_on_node+0xc0/0xc0
[  422.059965][  T120]  ret_from_fork+0x22/0x30

> 
> [   74.982625] =============================================================================
> [   74.983380] BUG test_module_slab (Not tainted): Objects remaining in test_module_slab on __kmem_cache_shutdown()
> [   74.984145] -----------------------------------------------------------------------------
> [   74.984145]
> [   74.984883] Disabling lock debugging due to kernel taint
> [   74.985561] INFO: Slab 0x(____ptrval____) objects=34 used=1 fp=0x(____ptrval____) flags=0x2ffff00000010200
> [   74.986638] CPU: 3 PID: 176 Comm: cat Tainted: G    B             5.10.0-rc1-00007-g4525c8781ec0-dirty #10
> [   74.987262] Hardware name: linux,dummy-virt (DT)
> [   74.987606] Call trace:
> [   74.987924]  dump_backtrace+0x0/0x2b0
> [   74.988296]  show_stack+0x18/0x68
> [   74.988698]  dump_stack+0xfc/0x168
> [   74.989030]  slab_err+0xac/0xd4
> [   74.989346]  __kmem_cache_shutdown+0x1e4/0x3c8
> [   74.989779]  kmem_cache_destroy+0x68/0x130
> [   74.990176]  test_version_show+0x84/0xf0
> [   74.990679]  module_attr_show+0x40/0x60
> [   74.991218]  sysfs_kf_seq_show+0x128/0x1c0
> [   74.991656]  kernfs_seq_show+0xa0/0xb8
> [   74.992059]  seq_read+0x1f0/0x7e8
> [   74.992415]  kernfs_fop_read+0x70/0x338
> [   74.993051]  vfs_read+0xe4/0x250
> [   74.993498]  ksys_read+0xc8/0x180
> [   74.993825]  __arm64_sys_read+0x44/0x58
> [   74.994203]  el0_svc_common.constprop.0+0xac/0x228
> [   74.994708]  do_el0_svc+0x38/0xa0
> [   74.995088]  el0_sync_handler+0x170/0x178
> [   74.995497]  el0_sync+0x174/0x180
> [   74.996050] INFO: Object 0x(____ptrval____) @offset=15848
> [   74.996752] INFO: Allocated in test_version_show+0x98/0xf0 age=8188 cpu=6 pid=172
> [   75.000802]  stack_trace_save+0x9c/0xd0
> [   75.002420]  set_track+0x64/0xf0
> [   75.002770]  alloc_debug_processing+0x104/0x1a0
> [   75.003171]  ___slab_alloc+0x628/0x648
> [   75.004213]  __slab_alloc.isra.0+0x2c/0x58
> [   75.004757]  kmem_cache_alloc+0x560/0x588
> [   75.005376]  test_version_show+0x98/0xf0
> [   75.005756]  module_attr_show+0x40/0x60
> [   75.007035]  sysfs_kf_seq_show+0x128/0x1c0
> [   75.007433]  kernfs_seq_show+0xa0/0xb8
> [   75.007800]  seq_read+0x1f0/0x7e8
> [   75.008128]  kernfs_fop_read+0x70/0x338
> [   75.008507]  vfs_read+0xe4/0x250
> [   75.008990]  ksys_read+0xc8/0x180
> [   75.009462]  __arm64_sys_read+0x44/0x58
> [   75.010085]  el0_svc_common.constprop.0+0xac/0x228
> [   75.011006] kmem_cache_destroy test_module_slab: Slab cache still has objects
> 
> Register a cpu hotplug function to remove all objects in the offline
> per-cpu quarantine when cpu is going offline. Set a per-cpu variable
> to indicate this cpu is offline.
> 
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> Reported-by: Guangye Yang <guangye.yang@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  mm/kasan/quarantine.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
> index 4c5375810449..cac7c617df72 100644
> --- a/mm/kasan/quarantine.c
> +++ b/mm/kasan/quarantine.c
> @@ -29,6 +29,7 @@
>  #include <linux/srcu.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
> +#include <linux/cpuhotplug.h>
>  
>  #include "../slab.h"
>  #include "kasan.h"
> @@ -43,6 +44,7 @@ struct qlist_head {
>  	struct qlist_node *head;
>  	struct qlist_node *tail;
>  	size_t bytes;
> +	bool offline;
>  };
>  
>  #define QLIST_INIT { NULL, NULL, 0 }
> @@ -188,6 +190,11 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
>  	local_irq_save(flags);
>  
>  	q = this_cpu_ptr(&cpu_quarantine);
> +	if (q->offline) {
> +		qlink_free(&info->quarantine_link, cache);
> +		local_irq_restore(flags);
> +		return;
> +	}
>  	qlist_put(q, &info->quarantine_link, cache->size);
>  	if (unlikely(q->bytes > QUARANTINE_PERCPU_SIZE)) {
>  		qlist_move_all(q, &temp);
> @@ -328,3 +335,36 @@ void quarantine_remove_cache(struct kmem_cache *cache)
>  
>  	synchronize_srcu(&remove_cache_srcu);
>  }
> +
> +static int kasan_cpu_online(unsigned int cpu)
> +{
> +	this_cpu_ptr(&cpu_quarantine)->offline = false;
> +	return 0;
> +}
> +
> +static int kasan_cpu_offline(unsigned int cpu)
> +{
> +	struct qlist_head *q;
> +
> +	q = this_cpu_ptr(&cpu_quarantine);
> +	/* Ensure the ordering between the writing to q->offline and
> +	 * qlist_free_all. Otherwise, cpu_quarantine may be corrupted
> +	 * by interrupt.
> +	 */
> +	WRITE_ONCE(q->offline, true);
> +	barrier();
> +	qlist_free_all(q, NULL);
> +	return 0;
> +}
> +
> +static int __init kasan_cpu_quarantine_init(void)
> +{
> +	int ret = 0;
> +
> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mm/kasan:online",
> +				kasan_cpu_online, kasan_cpu_offline);
> +	if (ret < 0)
> +		pr_err("kasan cpu quarantine register failed [%d]\n", ret);
> +	return ret;
> +}
> +late_initcall(kasan_cpu_quarantine_init);

