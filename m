Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A063928D234
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 18:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgJMQ0v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 12:26:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726438AbgJMQ0v (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 12:26:51 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A4702528D;
        Tue, 13 Oct 2020 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602606410;
        bh=B2J+K0GkNCCf1aYoI9IUJUSBqMmj5wOS/PYuEmmK3mc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JqzU1Ru8T4gAWelQKKdpO7nTLULPllzSq3jjOsMy95R3SYbeTL700aOV/jBy9TuSl
         mV46tFevFrJaOgCcmaaGk22zrV40Qf+5V8vjksfKfriTvIh3lT4lOP5jSaoIlFF5Jk
         QU71mBpYprkXRS8ecoNRJULqyUDEXa+z9ZTXrWw8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 3AD1B3522A36; Tue, 13 Oct 2020 09:26:50 -0700 (PDT)
Date:   Tue, 13 Oct 2020 09:26:50 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201013162650.GN3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201012212812.GH3249@paulmck-ThinkPad-P72>
 <20201013103406.GY2628@hirez.programming.kicks-ass.net>
 <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
 <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 13, 2020 at 01:25:44PM +0200, Peter Zijlstra wrote:
> On Tue, Oct 13, 2020 at 12:44:50PM +0200, Peter Zijlstra wrote:
> > On Tue, Oct 13, 2020 at 12:34:06PM +0200, Peter Zijlstra wrote:
> > > On Mon, Oct 12, 2020 at 02:28:12PM -0700, Paul E. McKenney wrote:
> > > > It is certainly an accident waiting to happen.  Would something like
> > > > the following make sense?
> > > 
> > > Sadly no.
> > > 
> > > > ------------------------------------------------------------------------
> > > > 
> > > > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > > > index bfd38f2..52a63bc 100644
> > > > --- a/kernel/rcu/tree.c
> > > > +++ b/kernel/rcu/tree.c
> > > > @@ -4067,6 +4067,7 @@ void rcu_cpu_starting(unsigned int cpu)
> > > >  
> > > >  	rnp = rdp->mynode;
> > > >  	mask = rdp->grpmask;
> > > > +	lockdep_off();
> > > >  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
> > > >  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
> > > >  	newcpu = !(rnp->expmaskinitnext & mask);
> > > > @@ -4086,6 +4087,7 @@ void rcu_cpu_starting(unsigned int cpu)
> > > >  	} else {
> > > >  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> > > >  	}
> > > > +	lockdep_on();
> > > >  	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
> > > >  }
> > > 
> > > This will just shut it up, but will not fix the actual problem of that
> > > spin-lock ending up in trace_lock_acquire() which relies on RCU which
> > > isn't looking.
> > > 
> > > What we need here is to supress tracing not lockdep. Let me consider.
> > 
> > We appear to have a similar problem with rcu_report_dead(), it's
> > raw_spin_unlock()s can end up in trace_lock_release() while we just
> > killed RCU.
> 
> So we can deal with the explicit trace_*() calls like the below, but I
> really don't like it much. It also doesn't help with function tracing.
> This is really early/late in the hotplug cycle and should be considered
> entry, we shouldn't be tracing anything here.
> 
> Paul, would it be possible to use a scheme similar to IRQ/NMI for
> hotplug? That seems to mostly rely on atomic ops, not locks.

The rest of the rcu_node tree and the various grace-period/hotplug races
makes that question non-trivial.  I will look into it, but I have no
reason for optimism.

But there is only one way to find out...  ;-)

							Thanx, Paul

> ---
> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> index d05db575f60f..22e3a3523ad3 100644
> --- a/include/linux/lockdep.h
> +++ b/include/linux/lockdep.h
> @@ -159,7 +159,7 @@ extern void lockdep_init_task(struct task_struct *task);
>   */
>  #define LOCKDEP_RECURSION_BITS	16
>  #define LOCKDEP_OFF		(1U << LOCKDEP_RECURSION_BITS)
> -#define LOCKDEP_RECURSION_MASK	(LOCKDEP_OFF - 1)
> +#define LOCKDEP_TRACE_MASK	(LOCKDEP_OFF - 1)
>  
>  /*
>   * lockdep_{off,on}() are macros to avoid tracing and kprobes; not inlines due
> @@ -176,6 +176,16 @@ do {							\
>  	current->lockdep_recursion -= LOCKDEP_OFF;	\
>  } while (0)
>  
> +#define lockdep_trace_off()				\
> +do {							\
> +	current->lockdep_recursion++;			\
> +} while (0)
> +
> +#define lockdep_trace_on()				\
> +do {							\
> +	current->lockdep_recursion--			\
> +} while (0)
> +
>  extern void lockdep_register_key(struct lock_class_key *key);
>  extern void lockdep_unregister_key(struct lock_class_key *key);
>  
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 3e99dfef8408..2df98abee82e 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -87,7 +87,7 @@ static inline bool lockdep_enabled(void)
>  	if (raw_cpu_read(lockdep_recursion))
>  		return false;
>  
> -	if (current->lockdep_recursion)
> +	if (current->lockdep_recursion >> LOCKDEP_RECURSION_BITS)
>  		return false;
>  
>  	return true;
> @@ -5410,7 +5410,8 @@ void lock_acquire(struct lockdep_map *lock, unsigned int subclass,
>  {
>  	unsigned long flags;
>  
> -	trace_lock_acquire(lock, subclass, trylock, read, check, nest_lock, ip);
> +	if (!(current->lockdep_recursion & LOCKDEP_TRACE_MASK))
> +		trace_lock_acquire(lock, subclass, trylock, read, check, nest_lock, ip);
>  
>  	if (!debug_locks)
>  		return;
> @@ -5450,7 +5451,8 @@ void lock_release(struct lockdep_map *lock, unsigned long ip)
>  {
>  	unsigned long flags;
>  
> -	trace_lock_release(lock, ip);
> +	if (!(current->lockdep_recursion & LOCKDEP_TRACE_MASK))
> +		trace_lock_release(lock, ip);
>  
>  	if (unlikely(!lockdep_enabled()))
>  		return;
> @@ -5662,7 +5664,8 @@ void lock_contended(struct lockdep_map *lock, unsigned long ip)
>  {
>  	unsigned long flags;
>  
> -	trace_lock_acquired(lock, ip);
> +	if (!(current->lockdep_recursion & LOCKDEP_TRACE_MASK))
> +		trace_lock_acquired(lock, ip);
>  
>  	if (unlikely(!lock_stat || !lockdep_enabled()))
>  		return;
> @@ -5680,7 +5683,8 @@ void lock_acquired(struct lockdep_map *lock, unsigned long ip)
>  {
>  	unsigned long flags;
>  
> -	trace_lock_contended(lock, ip);
> +	if (!(current->lockdep_recursion & LOCKDEP_TRACE_MASK))
> +		trace_lock_contended(lock, ip);
>  
>  	if (unlikely(!lock_stat || !lockdep_enabled()))
>  		return;
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index edeabc232c21..dbd56603fc0a 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -4047,6 +4047,11 @@ void rcu_cpu_starting(unsigned int cpu)
>  
>  	rnp = rdp->mynode;
>  	mask = rdp->grpmask;
> +
> +	/*
> +	 * Lockdep will call tracing, which requires RCU, but RCU isn't on yet.
> +	 */
> +	lockdep_trace_off();
>  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
>  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
>  	newcpu = !(rnp->expmaskinitnext & mask);
> @@ -4064,6 +4069,7 @@ void rcu_cpu_starting(unsigned int cpu)
>  	} else {
>  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  	}
> +	lockdep_trace_on();
>  	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
>  }
>  
> @@ -4091,6 +4097,11 @@ void rcu_report_dead(unsigned int cpu)
>  
>  	/* Remove outgoing CPU from mask in the leaf rcu_node structure. */
>  	mask = rdp->grpmask;
> +
> +	/*
> +	 * Lockdep will call tracing, which requires RCU, but we're switching RCU off.
> +	 */
> +	lockdep_trace_off();
>  	raw_spin_lock(&rcu_state.ofl_lock);
>  	raw_spin_lock_irqsave_rcu_node(rnp, flags); /* Enforce GP memory-order guarantee. */
>  	rdp->rcu_ofl_gp_seq = READ_ONCE(rcu_state.gp_seq);
> @@ -4101,8 +4112,10 @@ void rcu_report_dead(unsigned int cpu)
>  		raw_spin_lock_irqsave_rcu_node(rnp, flags);
>  	}
>  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext & ~mask);
> +	/* RCU is off, locks must not call into tracing */
>  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  	raw_spin_unlock(&rcu_state.ofl_lock);
> +	lockdep_trace_on();
>  
>  	rdp->cpu_started = false;
>  }
> diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
> index 39334d2d2b37..403b138f7cd4 100644
> --- a/kernel/rcu/update.c
> +++ b/kernel/rcu/update.c
> @@ -275,8 +275,8 @@ EXPORT_SYMBOL_GPL(rcu_callback_map);
>  
>  noinstr int notrace debug_lockdep_rcu_enabled(void)
>  {
> -	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE && debug_locks &&
> -	       current->lockdep_recursion == 0;
> +	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE && __lockdep_enabled;
> +
>  }
>  EXPORT_SYMBOL_GPL(debug_lockdep_rcu_enabled);
>  
