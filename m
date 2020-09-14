Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04D22694A1
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 20:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgINSRJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 14:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32634 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725951AbgINSRI (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Sep 2020 14:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600107425;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LkqjiaUrJK2qXrClfWRk0KY95DmMJ4TdUiB+ZO17st0=;
        b=T2jmVqsdo40LzZaekxQPQAb9ut9g/P8iXHnbrFu7hwOPrOv42nqndl5IR4mjCug73zAR3R
        FCjqqUhxSAct+T/NtnKgXFTjXKjqDuDy6Nlx+ikG2t3TvMnok+qc7nkcLaCkiIGSwvQF5t
        x7FkzxSYX3sdUcxOFsaSFOXPetKpLJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-3ZwuKl6lM42m7PtbBISl7Q-1; Mon, 14 Sep 2020 14:17:01 -0400
X-MC-Unique: 3ZwuKl6lM42m7PtbBISl7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C7731074655;
        Mon, 14 Sep 2020 18:16:59 +0000 (UTC)
Received: from ovpn-113-249.rdu2.redhat.com (ovpn-113-249.rdu2.redhat.com [10.10.113.249])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4035C7B7B0;
        Mon, 14 Sep 2020 18:16:55 +0000 (UTC)
Message-ID: <9b9780715a62d22a5229e9baae7e66a7f19d83eb.camel@redhat.com>
Subject: Re: [RFC v7 12/19] lockdep: Add recursive read locks into
 dependency graph
From:   Qian Cai <cai@redhat.com>
To:     Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Waiman Long <longman@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Date:   Mon, 14 Sep 2020 14:16:54 -0400
In-Reply-To: <20200807074238.1632519-13-boqun.feng@gmail.com>
References: <20200807074238.1632519-1-boqun.feng@gmail.com>
         <20200807074238.1632519-13-boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 2020-08-07 at 15:42 +0800, Boqun Feng wrote:
> Since we have all the fundamental to handle recursive read locks, we now
> add them into the dependency graph.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reverting this patch and its dependency:

[14/19] lockdep: Take read/write status in consideration when generate chainkey

fixed a splat below. IOW, this patch introduced this new splat which looks like
a false positive because the existing locking dependency chains here:

&s->seqcount#2 ---> pidmap_lock

[  528.078061][ T7867] -> #1 (pidmap_lock){....}-{2:2}:
[  528.078078][ T7867]        lock_acquire+0x10c/0x560
[  528.078089][ T7867]        _raw_spin_lock_irqsave+0x64/0xb0
[  528.078108][ T7867]        free_pid+0x5c/0x160
free_pid at kernel/pid.c:131
[  528.078127][ T7867]        release_task.part.40+0x59c/0x7f0
__unhash_process at kernel/exit.c:76
(inlined by) __exit_signal at kernel/exit.c:147
(inlined by) release_task at kernel/exit.c:198
[  528.078145][ T7867]        do_exit+0x77c/0xda0
exit_notify at kernel/exit.c:679
(inlined by) do_exit at kernel/exit.c:826
[  528.078163][ T7867]        kthread+0x148/0x1d0
[  528.078182][ T7867]        ret_from_kernel_thread+0x5c/0x80

It is write_seqlock(&sig->stats_lock) in __exit_signal(), but the seqcount in
read_mems_allowed_begin() is read_seqcount_begin(&current->mems_allowed_seq), so
there should be no deadlock?

[  528.077900][ T7867] WARNING: possible circular locking dependency detected
[  528.077912][ T7867] 5.9.0-rc5-next-20200914 #1 Not tainted
[  528.077921][ T7867] ------------------------------------------------------
[  528.077931][ T7867] runc:[1:CHILD]/7867 is trying to acquire lock:
[  528.077942][ T7867] c000001fce5570c8 (&s->seqcount#2){....}-{0:0}, at: __slab_alloc+0x34/0xf0
[  528.077972][ T7867] 
[  528.077972][ T7867] but task is already holding lock:
[  528.077983][ T7867] c0000000056b0198 (pidmap_lock){....}-{2:2}, at: alloc_pid+0x258/0x590
[  528.078009][ T7867] 
[  528.078009][ T7867] which lock already depends on the new lock.
[  528.078009][ T7867] 
[  528.078031][ T7867] 
[  528.078031][ T7867] the existing dependency chain (in reverse order) is:
[  528.078061][ T7867] 
[  528.078061][ T7867] -> #1 (pidmap_lock){....}-{2:2}:
[  528.078078][ T7867]        lock_acquire+0x10c/0x560
[  528.078089][ T7867]        _raw_spin_lock_irqsave+0x64/0xb0
[  528.078108][ T7867]        free_pid+0x5c/0x160
free_pid at kernel/pid.c:131
[  528.078127][ T7867]        release_task.part.40+0x59c/0x7f0
__unhash_process at kernel/exit.c:76
(inlined by) __exit_signal at kernel/exit.c:147
(inlined by) release_task at kernel/exit.c:198
[  528.078145][ T7867]        do_exit+0x77c/0xda0
exit_notify at kernel/exit.c:679
(inlined by) do_exit at kernel/exit.c:826
[  528.078163][ T7867]        kthread+0x148/0x1d0
[  528.078182][ T7867]        ret_from_kernel_thread+0x5c/0x80
[  528.078208][ T7867] 
[  528.078208][ T7867] -> #0 (&s->seqcount#2){....}-{0:0}:
[  528.078241][ T7867]        check_prevs_add+0x1c4/0x1120
check_prev_add at kernel/locking/lockdep.c:2820
(inlined by) check_prevs_add at kernel/locking/lockdep.c:2944
[  528.078260][ T7867]        __lock_acquire+0x176c/0x1c00
validate_chain at kernel/locking/lockdep.c:3562
(inlined by) __lock_acquire at kernel/locking/lockdep.c:4796
[  528.078278][ T7867]        lock_acquire+0x10c/0x560
[  528.078297][ T7867]        ___slab_alloc+0xa40/0xb40
seqcount_lockdep_reader_access at include/linux/seqlock.h:103
(inlined by) read_mems_allowed_begin at include/linux/cpuset.h:135
(inlined by) get_any_partial at mm/slub.c:2035
(inlined by) get_partial at mm/slub.c:2078
(inlined by) new_slab_objects at mm/slub.c:2577
(inlined by) ___slab_alloc at mm/slub.c:2745
[  528.078324][ T7867]        __slab_alloc+0x34/0xf0
[  528.078342][ T7867]        kmem_cache_alloc+0x2d4/0x470
[  528.078362][ T7867]        create_object+0x74/0x430
[  528.078381][ T7867]        slab_post_alloc_hook+0xa4/0x670
[  528.078399][ T7867]        kmem_cache_alloc+0x1b4/0x470
[  528.078418][ T7867]        radix_tree_node_alloc.constprop.19+0xe4/0x160
[  528.078438][ T7867]        idr_get_free+0x298/0x360
[  528.078456][ T7867]        idr_alloc_u32+0x84/0x130
[  528.078474][ T7867]        idr_alloc_cyclic+0x7c/0x150
[  528.078493][ T7867]        alloc_pid+0x27c/0x590
[  528.078511][ T7867]        copy_process+0xc90/0x1930
copy_process at kernel/fork.c:2104
[  528.078529][ T7867]        kernel_clone+0x120/0xa10
[  528.078546][ T7867]        __do_sys_clone+0x88/0xd0
[  528.078565][ T7867]        system_call_exception+0xf8/0x1d0
[  528.078592][ T7867]        system_call_common+0xe8/0x218
[  528.078609][ T7867] 
[  528.078609][ T7867] other info that might help us debug this:
[  528.078609][ T7867] 
[  528.078650][ T7867]  Possible unsafe locking scenario:
[  528.078650][ T7867] 
[  528.078670][ T7867]        CPU0                    CPU1
[  528.078695][ T7867]        ----                    ----
[  528.078713][ T7867]   lock(pidmap_lock);
[  528.078730][ T7867]                                lock(&s->seqcount#2);
[  528.078751][ T7867]                                lock(pidmap_lock);
[  528.078770][ T7867]   lock(&s->seqcount#2);
[  528.078788][ T7867] 
[  528.078788][ T7867]  *** DEADLOCK ***
[  528.078788][ T7867] 
[  528.078800][ T7867] 2 locks held by runc:[1:CHILD]/7867:
[  528.078808][ T7867]  #0: c000001ffea6f4f0 (lock#2){+.+.}-{2:2}, at: __radix_tree_preload+0x8/0x370
__radix_tree_preload at lib/radix-tree.c:322
[  528.078844][ T7867]  #1: c0000000056b0198 (pidmap_lock){....}-{2:2}, at: alloc_pid+0x258/0x590
[  528.078870][ T7867] 
[  528.078870][ T7867] stack backtrace:
[  528.078890][ T7867] CPU: 46 PID: 7867 Comm: runc:[1:CHILD] Not tainted 5.9.0-rc5-next-20200914 #1
[  528.078921][ T7867] Call Trace:
[  528.078940][ T7867] [c000001ff07eefc0] [c00000000063f8c8] dump_stack+0xec/0x144 (unreliable)
[  528.078964][ T7867] [c000001ff07ef000] [c00000000013f44c] print_circular_bug.isra.43+0x2dc/0x350
[  528.078978][ T7867] [c000001ff07ef0a0] [c00000000013f640] check_noncircular+0x180/0x1b0
[  528.079000][ T7867] [c000001ff07ef170] [c000000000140b84] check_prevs_add+0x1c4/0x1120
[  528.079022][ T7867] [c000001ff07ef280] [c0000000001446ec] __lock_acquire+0x176c/0x1c00
[  528.079043][ T7867] [c000001ff07ef3a0] [c00000000014578c] lock_acquire+0x10c/0x560
[  528.079066][ T7867] [c000001ff07ef490] [c0000000003565f0] ___slab_alloc+0xa40/0xb40
[  528.079079][ T7867] [c000001ff07ef590] [c000000000356724] __slab_alloc+0x34/0xf0
[  528.079100][ T7867] [c000001ff07ef5e0] [c000000000356ab4] kmem_cache_alloc+0x2d4/0x470
[  528.079122][ T7867] [c000001ff07ef670] [c000000000397e14] create_object+0x74/0x430
[  528.079144][ T7867] [c000001ff07ef720] [c000000000351944] slab_post_alloc_hook+0xa4/0x670
[  528.079165][ T7867] [c000001ff07ef7e0] [c000000000356994] kmem_cache_alloc+0x1b4/0x470
[  528.079187][ T7867] [c000001ff07ef870] [c00000000064e004] radix_tree_node_alloc.constprop.19+0xe4/0x160
radix_tree_node_alloc at lib/radix-tree.c:252
[  528.079219][ T7867] [c000001ff07ef8e0] [c00000000064f2b8] idr_get_free+0x298/0x360
idr_get_free at lib/radix-tree.c:1507
[  528.079249][ T7867] [c000001ff07ef970] [c000000000645db4] idr_alloc_u32+0x84/0x130
idr_alloc_u32 at lib/idr.c:46 (discriminator 4)
[  528.079271][ T7867] [c000001ff07ef9e0] [c000000000645f8c] idr_alloc_cyclic+0x7c/0x150
idr_alloc_cyclic at lib/idr.c:126 (discriminator 1)
[  528.079301][ T7867] [c000001ff07efa40] [c0000000000e48ac] alloc_pid+0x27c/0x590
[  528.079342][ T7867] [c000001ff07efb20] [c0000000000acc60] copy_process+0xc90/0x1930
[  528.079404][ T7867] [c000001ff07efc40] [c0000000000adc00] kernel_clone+0x120/0xa10
[  528.079499][ T7867] [c000001ff07efd00] [c0000000000ae578] __do_sys_clone+0x88/0xd0
[  528.079579][ T7867] [c000001ff07efdc0] [c000000000029c48] system_call_exception+0xf8/0x1d0
[  528.079691][ T7867] [c000001ff07efe20] [c00000000000d0a8] system_call_common+0xe8/0x218

> ---
>  kernel/locking/lockdep.c | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 040509667798..867199c4b85d 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -2808,16 +2808,6 @@ check_prev_add(struct task_struct *curr, struct
> held_lock *prev,
>  	if (!check_irq_usage(curr, prev, next))
>  		return 0;
>  
> -	/*
> -	 * For recursive read-locks we do all the dependency checks,
> -	 * but we dont store read-triggered dependencies (only
> -	 * write-triggered dependencies). This ensures that only the
> -	 * write-side dependencies matter, and that if for example a
> -	 * write-lock never takes any other locks, then the reads are
> -	 * equivalent to a NOP.
> -	 */
> -	if (next->read == 2 || prev->read == 2)
> -		return 1;
>  	/*
>  	 * Is the <prev> -> <next> dependency already present?
>  	 *
> @@ -2935,13 +2925,8 @@ check_prevs_add(struct task_struct *curr, struct
> held_lock *next)
>  		u16 distance = curr->lockdep_depth - depth + 1;
>  		hlock = curr->held_locks + depth - 1;
>  
> -		/*
> -		 * Only non-recursive-read entries get new dependencies
> -		 * added:
> -		 */
> -		if (hlock->read != 2 && hlock->check) {
> -			int ret = check_prev_add(curr, hlock, next, distance,
> -						 &trace);
> +		if (hlock->check) {
> +			int ret = check_prev_add(curr, hlock, next, distance,
> &trace);
>  			if (!ret)
>  				return 0;
>  

