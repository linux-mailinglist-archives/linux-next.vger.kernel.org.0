Return-Path: <linux-next+bounces-9396-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 674FCCBC9B2
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 07:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13DCD300FE0E
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 06:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063DE326D77;
	Mon, 15 Dec 2025 06:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="anl8F9k2"
X-Original-To: linux-next@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C1B306B25;
	Mon, 15 Dec 2025 06:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765778861; cv=none; b=P1B+qOewSiL4iy+uGyBesoTwdYyIpDtlDxyfhUAl9gdFIyIhK6SK4fUkkKLnkK7rBHPLMt02Ukt+UySZrcf4qo9wSBLJggTAjCH8L+BXUagvH8MkhIMwhJ6dedEchFx+/VQ6bMbFwIvdrbIv8JwhMACeGU6wdXuiaPpPjlVUdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765778861; c=relaxed/simple;
	bh=OrTonKhkEyefg3ORvCnibG2MpMBCBGU9s62SM3gIfIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F842Bdv8ZfyZ7v/Auf3j/J1RziRzFJww4Eh146XQIkxcDzaVHKNKMJR2AaHpZLA3pLutOhjdNBD99k+oI+grPw8QVf/mS5nLPmtoPtI0goD2A8O8+KRxSvvSlTP8QRA9yXjixLYoRgQv2mgFGCchvDMjvEMq2IIGEgCRavfM0Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=anl8F9k2; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ZCBVXEZVBOjEuXP19GO4U39EF0FikdZGNgovWpvBjtU=; t=1765778859;
	x=1766210859; b=anl8F9k2l9p1uSwMXDbba0HR3jQdMtzo7TnP5Ons4sO2NoTmzD/+RYOYopHFi
	k2WCpXoPkVmcrCNeFLT/9lRGtiCs6S4z+sS/voohTK8xvccwfJ+KZz8VqHISFvr0vggWWPcd0VGAt
	PeGhpXs7SOsaPLs4r7XJtVCN7vdKO4UUyaZYQgnk6531BZON1EGwCKzihRszs6RaQuCLrH0IvXkan
	1/hbBcMmrj/vdU9noQfzDWO7Nzgd3A/9SaGGCxUcsyEVPv6Z4JCI7Yhf0D10O/vpQqc33iLuyx0BJ
	GQrUSHO9I61ws+gEDRj+Kdpx25QjX0KYw4ioPDBepy7Us5Ny/Q==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vV1jy-007t3X-1t;
	Mon, 15 Dec 2025 07:07:26 +0100
Message-ID: <3dd19f67-1132-41b3-bf6a-ec9a430424e6@leemhuis.info>
Date: Mon, 15 Dec 2025 07:07:25 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?error=3A_implicit_declaration_of_function_=E2=80=98rq=5Fm?=
 =?UTF-8?Q?odified=5Fclear=E2=80=99_=28was_=5BPATCH_5/5=5D_sched=3A_Rework_s?=
 =?UTF-8?B?Y2hlZF9jbGFzczo6d2FrZXVwX3ByZWVtcHQoKSBhbmQgcnFfbW9kaWZpZWRfKigp?=
 =?UTF-8?Q?=29?=
To: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org,
 vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, tj@kernel.org, void@manifault.com,
 arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251127153943.696191429@infradead.org>
 <20251127154725.901391274@infradead.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20251127154725.901391274@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1765778859;6e52b6d0;
X-HE-SMSGID: 1vV1jy-007t3X-1t

On 11/27/25 16:39, Peter Zijlstra wrote:
> Change sched_class::wakeup_preempt() to also get called for
> cross-class wakeups, specifically those where the woken task is of a
> higher class than the previous highest class.

I suspect you might be aware of this already, but this patch afaics
broke compilation of today's -next for me, as reverting fixed things.

"""
In file included from kernel/sched/build_policy.c:62:
kernel/sched/ext.c: In function ‘do_pick_task_scx’:
kernel/sched/ext.c:2455:9: error: implicit declaration of function ‘rq_modified_clear’ [-Wimplicit-function-declaration]
 2455 |         rq_modified_clear(rq);
      |         ^~~~~~~~~~~~~~~~~
kernel/sched/ext.c:2470:27: error: implicit declaration of function ‘rq_modified_above’ [-Wimplicit-function-declaration]
 2470 |         if (!force_scx && rq_modified_above(rq, &ext_sched_class))
      |                           ^~~~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:287: kernel/sched/build_policy.o] Error 1
make[3]: *** [scripts/Makefile.build:556: kernel/sched] Error 2
make[2]: *** [scripts/Makefile.build:556: kernel] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builddir/build/BUILD/kernel-6.19.0-build/kernel-next-20251215/linux-6.19.0-0.0.next.20251215.414.vanilla.fc44.s390x/Makefile:2062: .] Error 2
make: *** [Makefile:256: __sub-make] Error 2
"""

Ciao, Thorsten
 > In order to do this, track the current highest class of the runqueue
> in rq::next_class and have wakeup_preempt() track this upwards for
> each new wakeup. Additionally have set_next_task() re-set the value to
> the current class.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/core.c      |   32 +++++++++++++++++++++++---------
>  kernel/sched/deadline.c  |   14 +++++++++-----
>  kernel/sched/ext.c       |    9 ++++-----
>  kernel/sched/fair.c      |   17 ++++++++++-------
>  kernel/sched/idle.c      |    3 ---
>  kernel/sched/rt.c        |    9 ++++++---
>  kernel/sched/sched.h     |   26 ++------------------------
>  kernel/sched/stop_task.c |    3 ---
>  8 files changed, 54 insertions(+), 59 deletions(-)
> 
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2090,7 +2090,6 @@ void enqueue_task(struct rq *rq, struct
>  	 */
>  	uclamp_rq_inc(rq, p, flags);
>  
> -	rq->queue_mask |= p->sched_class->queue_mask;
>  	p->sched_class->enqueue_task(rq, p, flags);
>  
>  	psi_enqueue(p, flags);
> @@ -2123,7 +2122,6 @@ inline bool dequeue_task(struct rq *rq,
>  	 * and mark the task ->sched_delayed.
>  	 */
>  	uclamp_rq_dec(rq, p);
> -	rq->queue_mask |= p->sched_class->queue_mask;
>  	return p->sched_class->dequeue_task(rq, p, flags);
>  }
>  
> @@ -2174,10 +2172,14 @@ void wakeup_preempt(struct rq *rq, struc
>  {
>  	struct task_struct *donor = rq->donor;
>  
> -	if (p->sched_class == donor->sched_class)
> -		donor->sched_class->wakeup_preempt(rq, p, flags);
> -	else if (sched_class_above(p->sched_class, donor->sched_class))
> +	if (p->sched_class == rq->next_class) {
> +		rq->next_class->wakeup_preempt(rq, p, flags);
> +
> +	} else if (sched_class_above(p->sched_class, rq->next_class)) {
> +		rq->next_class->wakeup_preempt(rq, p, flags);
>  		resched_curr(rq);
> +		rq->next_class = p->sched_class;
> +	}
>  
>  	/*
>  	 * A queue event has occurred, and we're going to schedule.  In
> @@ -6797,6 +6799,7 @@ static void __sched notrace __schedule(i
>  pick_again:
>  	next = pick_next_task(rq, rq->donor, &rf);
>  	rq_set_donor(rq, next);
> +	rq->next_class = next->sched_class;
>  	if (unlikely(task_is_blocked(next))) {
>  		next = find_proxy_task(rq, next, &rf);
>  		if (!next)
> @@ -8646,6 +8649,8 @@ void __init sched_init(void)
>  		rq->rt.rt_runtime = global_rt_runtime();
>  		init_tg_rt_entry(&root_task_group, &rq->rt, NULL, i, NULL);
>  #endif
> +		rq->next_class = &idle_sched_class;
> +
>  		rq->sd = NULL;
>  		rq->rd = NULL;
>  		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
> @@ -10771,10 +10776,8 @@ struct sched_change_ctx *sched_change_be
>  		flags |= DEQUEUE_NOCLOCK;
>  	}
>  
> -	if (flags & DEQUEUE_CLASS) {
> -		if (p->sched_class->switching_from)
> -			p->sched_class->switching_from(rq, p);
> -	}
> +	if ((flags & DEQUEUE_CLASS) && p->sched_class->switching_from)
> +		p->sched_class->switching_from(rq, p);
>  
>  	*ctx = (struct sched_change_ctx){
>  		.p = p,
> @@ -10827,6 +10830,17 @@ void sched_change_end(struct sched_chang
>  			p->sched_class->switched_to(rq, p);
>  
>  		/*
> +		 * If this was a class promotion; let the old class know it
> +		 * got preempted. Note that none of the switch*_from() methods
> +		 * know the new class and none of the switch*_to() methods
> +		 * know the old class.
> +		 */
> +		if (ctx->running && sched_class_above(p->sched_class, ctx->class)) {
> +			rq->next_class->wakeup_preempt(rq, p, 0);
> +			rq->next_class = p->sched_class;
> +		}
> +
> +		/*
>  		 * If this was a degradation in class someone should have set
>  		 * need_resched by now.
>  		 */
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2499,9 +2499,16 @@ static int balance_dl(struct rq *rq, str
>   * Only called when both the current and waking task are -deadline
>   * tasks.
>   */
> -static void wakeup_preempt_dl(struct rq *rq, struct task_struct *p,
> -				  int flags)
> +static void wakeup_preempt_dl(struct rq *rq, struct task_struct *p, int flags)
>  {
> +	/*
> +	 * Can only get preempted by stop-class, and those should be
> +	 * few and short lived, doesn't really make sense to push
> +	 * anything away for that.
> +	 */
> +	if (p->sched_class != &dl_sched_class)
> +		return;
> +
>  	if (dl_entity_preempt(&p->dl, &rq->donor->dl)) {
>  		resched_curr(rq);
>  		return;
> @@ -3304,9 +3311,6 @@ static int task_is_throttled_dl(struct t
>  #endif
>  
>  DEFINE_SCHED_CLASS(dl) = {
> -
> -	.queue_mask		= 8,
> -
>  	.enqueue_task		= enqueue_task_dl,
>  	.dequeue_task		= dequeue_task_dl,
>  	.yield_task		= yield_task_dl,
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -2338,12 +2338,12 @@ static struct task_struct *pick_task_scx
>  	bool keep_prev, kick_idle = false;
>  	struct task_struct *p;
>  
> -	rq_modified_clear(rq);
> +	rq->next_class = &ext_sched_class;
>  	rq_unpin_lock(rq, rf);
>  	balance_one(rq, prev);
>  	rq_repin_lock(rq, rf);
>  	maybe_queue_balance_callback(rq);
> -	if (rq_modified_above(rq, &ext_sched_class))
> +	if (sched_class_above(rq->next_class, &ext_sched_class))
>  		return RETRY_TASK;
>  
>  	keep_prev = rq->scx.flags & SCX_RQ_BAL_KEEP;
> @@ -2967,7 +2967,8 @@ static void switched_from_scx(struct rq
>  	scx_disable_task(p);
>  }
>  
> -static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p,int wake_flags) {}
> +static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p, int wake_flags) {}
> +
>  static void switched_to_scx(struct rq *rq, struct task_struct *p) {}
>  
>  int scx_check_setscheduler(struct task_struct *p, int policy)
> @@ -3216,8 +3217,6 @@ static void scx_cgroup_unlock(void) {}
>   *   their current sched_class. Call them directly from sched core instead.
>   */
>  DEFINE_SCHED_CLASS(ext) = {
> -	.queue_mask		= 1,
> -
>  	.enqueue_task		= enqueue_task_scx,
>  	.dequeue_task		= dequeue_task_scx,
>  	.yield_task		= yield_task_scx,
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8697,7 +8697,7 @@ preempt_sync(struct rq *rq, int wake_fla
>  /*
>   * Preempt the current task with a newly woken task if needed:
>   */
> -static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int wake_flags)
> +static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_flags)
>  {
>  	enum preempt_wakeup_action preempt_action = PREEMPT_WAKEUP_PICK;
>  	struct task_struct *donor = rq->donor;
> @@ -8705,6 +8705,12 @@ static void check_preempt_wakeup_fair(st
>  	struct cfs_rq *cfs_rq = task_cfs_rq(donor);
>  	int cse_is_idle, pse_is_idle;
>  
> +	/*
> +	 * XXX Getting preempted by higher class, try and find idle CPU?
> +	 */
> +	if (p->sched_class != &fair_sched_class)
> +		return;
> +
>  	if (unlikely(se == pse))
>  		return;
>  
> @@ -12872,7 +12878,7 @@ static int sched_balance_newidle(struct
>  	t0 = sched_clock_cpu(this_cpu);
>  	__sched_balance_update_blocked_averages(this_rq);
>  
> -	rq_modified_clear(this_rq);
> +	this_rq->next_class = &fair_sched_class;
>  	raw_spin_rq_unlock(this_rq);
>  
>  	for_each_domain(this_cpu, sd) {
> @@ -12939,7 +12945,7 @@ static int sched_balance_newidle(struct
>  		pulled_task = 1;
>  
>  	/* If a higher prio class was modified, restart the pick */
> -	if (rq_modified_above(this_rq, &fair_sched_class))
> +	if (sched_class_above(this_rq->next_class, &fair_sched_class))
>  		pulled_task = -1;
>  
>  out:
> @@ -13837,15 +13843,12 @@ static unsigned int get_rr_interval_fair
>   * All the scheduling class methods:
>   */
>  DEFINE_SCHED_CLASS(fair) = {
> -
> -	.queue_mask		= 2,
> -
>  	.enqueue_task		= enqueue_task_fair,
>  	.dequeue_task		= dequeue_task_fair,
>  	.yield_task		= yield_task_fair,
>  	.yield_to_task		= yield_to_task_fair,
>  
> -	.wakeup_preempt		= check_preempt_wakeup_fair,
> +	.wakeup_preempt		= wakeup_preempt_fair,
>  
>  	.pick_task		= pick_task_fair,
>  	.pick_next_task		= pick_next_task_fair,
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -534,9 +534,6 @@ static void update_curr_idle(struct rq *
>   * Simple, special scheduling class for the per-CPU idle tasks:
>   */
>  DEFINE_SCHED_CLASS(idle) = {
> -
> -	.queue_mask		= 0,
> -
>  	/* no enqueue/yield_task for idle tasks */
>  
>  	/* dequeue is not valid, we print a debug message there: */
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1615,6 +1615,12 @@ static void wakeup_preempt_rt(struct rq
>  {
>  	struct task_struct *donor = rq->donor;
>  
> +	/*
> +	 * XXX If we're preempted by DL, queue a push?
> +	 */
> +	if (p->sched_class != &rt_sched_class)
> +		return;
> +
>  	if (p->prio < donor->prio) {
>  		resched_curr(rq);
>  		return;
> @@ -2568,9 +2574,6 @@ static int task_is_throttled_rt(struct t
>  #endif /* CONFIG_SCHED_CORE */
>  
>  DEFINE_SCHED_CLASS(rt) = {
> -
> -	.queue_mask		= 4,
> -
>  	.enqueue_task		= enqueue_task_rt,
>  	.dequeue_task		= dequeue_task_rt,
>  	.yield_task		= yield_task_rt,
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1119,7 +1119,6 @@ struct rq {
>  	raw_spinlock_t		__lock;
>  
>  	/* Per class runqueue modification mask; bits in class order. */
> -	unsigned int		queue_mask;
>  	unsigned int		nr_running;
>  #ifdef CONFIG_NUMA_BALANCING
>  	unsigned int		nr_numa_running;
> @@ -1179,6 +1178,7 @@ struct rq {
>  	struct sched_dl_entity	*dl_server;
>  	struct task_struct	*idle;
>  	struct task_struct	*stop;
> +	const struct sched_class *next_class;
>  	unsigned long		next_balance;
>  	struct mm_struct	*prev_mm;
>  
> @@ -2426,15 +2426,6 @@ struct sched_class {
>  #ifdef CONFIG_UCLAMP_TASK
>  	int uclamp_enabled;
>  #endif
> -	/*
> -	 * idle:  0
> -	 * ext:   1
> -	 * fair:  2
> -	 * rt:    4
> -	 * dl:    8
> -	 * stop: 16
> -	 */
> -	unsigned int queue_mask;
>  
>  	/*
>  	 * move_queued_task/activate_task/enqueue_task: rq->lock
> @@ -2593,20 +2584,6 @@ struct sched_class {
>  #endif
>  };
>  
> -/*
> - * Does not nest; only used around sched_class::pick_task() rq-lock-breaks.
> - */
> -static inline void rq_modified_clear(struct rq *rq)
> -{
> -	rq->queue_mask = 0;
> -}
> -
> -static inline bool rq_modified_above(struct rq *rq, const struct sched_class * class)
> -{
> -	unsigned int mask = class->queue_mask;
> -	return rq->queue_mask & ~((mask << 1) - 1);
> -}
> -
>  static inline void put_prev_task(struct rq *rq, struct task_struct *prev)
>  {
>  	WARN_ON_ONCE(rq->donor != prev);
> @@ -3899,6 +3876,7 @@ void move_queued_task_locked(struct rq *
>  	deactivate_task(src_rq, task, 0);
>  	set_task_cpu(task, dst_rq->cpu);
>  	activate_task(dst_rq, task, 0);
> +	wakeup_preempt(dst_rq, task, 0);
>  }
>  
>  static inline
> --- a/kernel/sched/stop_task.c
> +++ b/kernel/sched/stop_task.c
> @@ -97,9 +97,6 @@ static void update_curr_stop(struct rq *
>   * Simple, special scheduling class for the per-CPU stop tasks:
>   */
>  DEFINE_SCHED_CLASS(stop) = {
> -
> -	.queue_mask		= 16,
> -
>  	.enqueue_task		= enqueue_task_stop,
>  	.dequeue_task		= dequeue_task_stop,
>  	.yield_task		= yield_task_stop,
> 
> 
> 


