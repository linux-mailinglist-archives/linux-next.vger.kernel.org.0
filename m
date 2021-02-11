Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7C6319149
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 18:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhBKRk7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 12:40:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:47486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231571AbhBKRi6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 12:38:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B90361490;
        Thu, 11 Feb 2021 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613065083;
        bh=0Q6Dr6gj34SZio42kO6yIcEFm1D+ME9MHr/wTQOn+dk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZcvotxopvE7PGwY3XGIJ/Y8iS56hXGjuvTaMiT53kpbsO8z582xT2oGEzyssQsyhv
         Mchz7uRab+TPYNZrVcZUXDS3jVYTKA26lqI+gCr5XYj/D2bF568hlBAm51m86EDGRM
         U3rDWZfCb2KUMlNf76YPpmoDOHUBl/WXBU5h/RTin45n/A2FK9fVa4DLnk++S+Anb1
         R41dYrHeTr7bL5rg6HTrR5CMNF/VnEtjb19UnenhP6KLjSY1mlN1q13ttFGCuEv0Nk
         EBNd4SoH2afb9KbckD6ImvlAx2sBMt6npJRQ/EuL4nYkpaAnbC3TtSA7D6VbP7wNS0
         DctEW9U/kRA0g==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id E3A2A3522694; Thu, 11 Feb 2021 09:38:02 -0800 (PST)
Date:   Thu, 11 Feb 2021 09:38:02 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Frederic Weisbecker <frederic@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the rcu tree with the block tree
Message-ID: <20210211173802.GM2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210211164852.7489b87d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211164852.7489b87d@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 11, 2021 at 04:48:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got conflicts in:
> 
>   include/linux/rcupdate.h
>   kernel/rcu/tree.c
>   kernel/rcu/tree_plugin.h
> 
> between commits:
> 
>   3a7b5c87a0b2 ("rcu/nocb: Perform deferred wake up before last idle's need_resched() check")
>   e4234f21d2ea ("rcu: Pull deferred rcuog wake up to rcu_eqs_enter() callers")
>   14bbd41d5109 ("entry/kvm: Explicitly flush pending rcuog wakeup before last rescheduling point")

Frederic had me move these out of the section of the -rcu commits for
the v5.12 merge window, saying that they were not yet ready.

Jens, are these needed to prevent failures in the block tree?  If so,
there were some commits added late in v5.11 that might also get rid
of your failures.  If those v5.11 commits don't help the block tree,
let's figure out what we need to do here...  ;-)

> from the block tree and commits:
> 
>   d97b07818240 ("rcu/nocb: De-offloading CB kthread")
>   254e11efde66 ("rcu/nocb: Re-offload support")

These two are part of my pull request.

>   eba362724509 ("rcu: Remove superfluous rdp fetch")

This one has some chance of going in.

> from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you for calling our attention to this collision!

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/linux/rcupdate.h
> index 36c2119de702,fa819f878cb1..000000000000
> --- a/include/linux/rcupdate.h
> +++ b/include/linux/rcupdate.h
> @@@ -110,10 -112,12 +112,14 @@@ static inline void rcu_user_exit(void) 
>   
>   #ifdef CONFIG_RCU_NOCB_CPU
>   void rcu_init_nohz(void);
>  +void rcu_nocb_flush_deferred_wakeup(void);
> + int rcu_nocb_cpu_offload(int cpu);
> + int rcu_nocb_cpu_deoffload(int cpu);
>   #else /* #ifdef CONFIG_RCU_NOCB_CPU */
>   static inline void rcu_init_nohz(void) { }
>  +static inline void rcu_nocb_flush_deferred_wakeup(void) { }
> + static inline int rcu_nocb_cpu_offload(int cpu) { return -EINVAL; }
> + static inline int rcu_nocb_cpu_deoffload(int cpu) { return 0; }
>   #endif /* #else #ifdef CONFIG_RCU_NOCB_CPU */
>   
>   /**
> diff --cc kernel/rcu/tree.c
> index ce17b8477442,c1ae1e52f638..000000000000
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@@ -643,7 -649,7 +649,6 @@@ static noinstr void rcu_eqs_enter(bool 
>   	instrumentation_begin();
>   	trace_rcu_dyntick(TPS("Start"), rdp->dynticks_nesting, 0, atomic_read(&rdp->dynticks));
>   	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_idle_task(current));
> - 	rdp = this_cpu_ptr(&rcu_data);
>  -	do_nocb_deferred_wakeup(rdp);
>   	rcu_prepare_for_idle();
>   	rcu_preempt_deferred_qs(current);
>   
> diff --cc kernel/rcu/tree_plugin.h
> index cdc1b7651c03,ba1ae1e4b215..000000000000
> --- a/kernel/rcu/tree_plugin.h
> +++ b/kernel/rcu/tree_plugin.h
> @@@ -2186,19 -2341,201 +2346,208 @@@ static void do_nocb_deferred_wakeup_tim
>    * This means we do an inexact common-case check.  Note that if
>    * we miss, ->nocb_timer will eventually clean things up.
>    */
>  -static void do_nocb_deferred_wakeup(struct rcu_data *rdp)
>  +static bool do_nocb_deferred_wakeup(struct rcu_data *rdp)
>   {
>   	if (rcu_nocb_need_deferred_wakeup(rdp))
>  -		do_nocb_deferred_wakeup_common(rdp);
>  +		return do_nocb_deferred_wakeup_common(rdp);
>  +	return false;
>  +}
>  +
>  +void rcu_nocb_flush_deferred_wakeup(void)
>  +{
>  +	do_nocb_deferred_wakeup(this_cpu_ptr(&rcu_data));
>   }
>  +EXPORT_SYMBOL_GPL(rcu_nocb_flush_deferred_wakeup);
>   
> + static int rdp_offload_toggle(struct rcu_data *rdp,
> + 			       bool offload, unsigned long flags)
> + 	__releases(rdp->nocb_lock)
> + {
> + 	struct rcu_segcblist *cblist = &rdp->cblist;
> + 	struct rcu_data *rdp_gp = rdp->nocb_gp_rdp;
> + 	bool wake_gp = false;
> + 
> + 	rcu_segcblist_offload(cblist, offload);
> + 
> + 	if (rdp->nocb_cb_sleep)
> + 		rdp->nocb_cb_sleep = false;
> + 	rcu_nocb_unlock_irqrestore(rdp, flags);
> + 
> + 	/*
> + 	 * Ignore former value of nocb_cb_sleep and force wake up as it could
> + 	 * have been spuriously set to false already.
> + 	 */
> + 	swake_up_one(&rdp->nocb_cb_wq);
> + 
> + 	raw_spin_lock_irqsave(&rdp_gp->nocb_gp_lock, flags);
> + 	if (rdp_gp->nocb_gp_sleep) {
> + 		rdp_gp->nocb_gp_sleep = false;
> + 		wake_gp = true;
> + 	}
> + 	raw_spin_unlock_irqrestore(&rdp_gp->nocb_gp_lock, flags);
> + 
> + 	if (wake_gp)
> + 		wake_up_process(rdp_gp->nocb_gp_kthread);
> + 
> + 	return 0;
> + }
> + 
> + static int __rcu_nocb_rdp_deoffload(struct rcu_data *rdp)
> + {
> + 	struct rcu_segcblist *cblist = &rdp->cblist;
> + 	unsigned long flags;
> + 	int ret;
> + 
> + 	pr_info("De-offloading %d\n", rdp->cpu);
> + 
> + 	rcu_nocb_lock_irqsave(rdp, flags);
> + 	/*
> + 	 * If there are still pending work offloaded, the offline
> + 	 * CPU won't help much handling them.
> + 	 */
> + 	if (cpu_is_offline(rdp->cpu) && !rcu_segcblist_empty(&rdp->cblist)) {
> + 		rcu_nocb_unlock_irqrestore(rdp, flags);
> + 		return -EBUSY;
> + 	}
> + 
> + 	ret = rdp_offload_toggle(rdp, false, flags);
> + 	swait_event_exclusive(rdp->nocb_state_wq,
> + 			      !rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_CB |
> + 							SEGCBLIST_KTHREAD_GP));
> + 	rcu_nocb_lock_irqsave(rdp, flags);
> + 	/* Make sure nocb timer won't stay around */
> + 	WRITE_ONCE(rdp->nocb_defer_wakeup, RCU_NOCB_WAKE_OFF);
> + 	rcu_nocb_unlock_irqrestore(rdp, flags);
> + 	del_timer_sync(&rdp->nocb_timer);
> + 
> + 	/*
> + 	 * Flush bypass. While IRQs are disabled and once we set
> + 	 * SEGCBLIST_SOFTIRQ_ONLY, no callback is supposed to be
> + 	 * enqueued on bypass.
> + 	 */
> + 	rcu_nocb_lock_irqsave(rdp, flags);
> + 	rcu_nocb_flush_bypass(rdp, NULL, jiffies);
> + 	rcu_segcblist_set_flags(cblist, SEGCBLIST_SOFTIRQ_ONLY);
> + 	/*
> + 	 * With SEGCBLIST_SOFTIRQ_ONLY, we can't use
> + 	 * rcu_nocb_unlock_irqrestore() anymore. Theoretically we
> + 	 * could set SEGCBLIST_SOFTIRQ_ONLY with cb unlocked and IRQs
> + 	 * disabled now, but let's be paranoid.
> + 	 */
> + 	raw_spin_unlock_irqrestore(&rdp->nocb_lock, flags);
> + 
> + 	return ret;
> + }
> + 
> + static long rcu_nocb_rdp_deoffload(void *arg)
> + {
> + 	struct rcu_data *rdp = arg;
> + 
> + 	WARN_ON_ONCE(rdp->cpu != raw_smp_processor_id());
> + 	return __rcu_nocb_rdp_deoffload(rdp);
> + }
> + 
> + int rcu_nocb_cpu_deoffload(int cpu)
> + {
> + 	struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
> + 	int ret = 0;
> + 
> + 	if (rdp == rdp->nocb_gp_rdp) {
> + 		pr_info("Can't deoffload an rdp GP leader (yet)\n");
> + 		return -EINVAL;
> + 	}
> + 	mutex_lock(&rcu_state.barrier_mutex);
> + 	cpus_read_lock();
> + 	if (rcu_rdp_is_offloaded(rdp)) {
> + 		if (cpu_online(cpu))
> + 			ret = work_on_cpu(cpu, rcu_nocb_rdp_deoffload, rdp);
> + 		else
> + 			ret = __rcu_nocb_rdp_deoffload(rdp);
> + 		if (!ret)
> + 			cpumask_clear_cpu(cpu, rcu_nocb_mask);
> + 	}
> + 	cpus_read_unlock();
> + 	mutex_unlock(&rcu_state.barrier_mutex);
> + 
> + 	return ret;
> + }
> + EXPORT_SYMBOL_GPL(rcu_nocb_cpu_deoffload);
> + 
> + static int __rcu_nocb_rdp_offload(struct rcu_data *rdp)
> + {
> + 	struct rcu_segcblist *cblist = &rdp->cblist;
> + 	unsigned long flags;
> + 	int ret;
> + 
> + 	/*
> + 	 * For now we only support re-offload, ie: the rdp must have been
> + 	 * offloaded on boot first.
> + 	 */
> + 	if (!rdp->nocb_gp_rdp)
> + 		return -EINVAL;
> + 
> + 	pr_info("Offloading %d\n", rdp->cpu);
> + 	/*
> + 	 * Can't use rcu_nocb_lock_irqsave() while we are in
> + 	 * SEGCBLIST_SOFTIRQ_ONLY mode.
> + 	 */
> + 	raw_spin_lock_irqsave(&rdp->nocb_lock, flags);
> + 	/* Re-enable nocb timer */
> + 	WRITE_ONCE(rdp->nocb_defer_wakeup, RCU_NOCB_WAKE_NOT);
> + 	/*
> + 	 * We didn't take the nocb lock while working on the
> + 	 * rdp->cblist in SEGCBLIST_SOFTIRQ_ONLY mode.
> + 	 * Every modifications that have been done previously on
> + 	 * rdp->cblist must be visible remotely by the nocb kthreads
> + 	 * upon wake up after reading the cblist flags.
> + 	 *
> + 	 * The layout against nocb_lock enforces that ordering:
> + 	 *
> + 	 *  __rcu_nocb_rdp_offload()   nocb_cb_wait()/nocb_gp_wait()
> + 	 * -------------------------   ----------------------------
> + 	 *      WRITE callbacks           rcu_nocb_lock()
> + 	 *      rcu_nocb_lock()           READ flags
> + 	 *      WRITE flags               READ callbacks
> + 	 *      rcu_nocb_unlock()         rcu_nocb_unlock()
> + 	 */
> + 	ret = rdp_offload_toggle(rdp, true, flags);
> + 	swait_event_exclusive(rdp->nocb_state_wq,
> + 			      rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_CB) &&
> + 			      rcu_segcblist_test_flags(cblist, SEGCBLIST_KTHREAD_GP));
> + 
> + 	return ret;
> + }
> + 
> + static long rcu_nocb_rdp_offload(void *arg)
> + {
> + 	struct rcu_data *rdp = arg;
> + 
> + 	WARN_ON_ONCE(rdp->cpu != raw_smp_processor_id());
> + 	return __rcu_nocb_rdp_offload(rdp);
> + }
> + 
> + int rcu_nocb_cpu_offload(int cpu)
> + {
> + 	struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
> + 	int ret = 0;
> + 
> + 	mutex_lock(&rcu_state.barrier_mutex);
> + 	cpus_read_lock();
> + 	if (!rcu_rdp_is_offloaded(rdp)) {
> + 		if (cpu_online(cpu))
> + 			ret = work_on_cpu(cpu, rcu_nocb_rdp_offload, rdp);
> + 		else
> + 			ret = __rcu_nocb_rdp_offload(rdp);
> + 		if (!ret)
> + 			cpumask_set_cpu(cpu, rcu_nocb_mask);
> + 	}
> + 	cpus_read_unlock();
> + 	mutex_unlock(&rcu_state.barrier_mutex);
> + 
> + 	return ret;
> + }
> + EXPORT_SYMBOL_GPL(rcu_nocb_cpu_offload);
> + 
>   void __init rcu_init_nohz(void)
>   {
>   	int cpu;


