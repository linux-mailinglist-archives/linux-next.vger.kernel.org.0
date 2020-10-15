Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3692828F681
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 18:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389532AbgJOQPD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 12:15:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:49590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389477AbgJOQPD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 12:15:03 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 42C0621D7F;
        Thu, 15 Oct 2020 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602778502;
        bh=tj6lVIt8IEuRxmRb5E2pleBqTsJDfJjikhO5L+ETD0s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HDaMn30BhghFNShZ4cXBVFzP56ZTIz2hwV0GqIKp7FL0AJNPS4t0dZ7lIljNUDJVM
         NyTibKf2yu/ttkI2c2QD//NQquIbbSvS5YqEk+LjmcqxMBJqySvjAuQrv8lq5kBw12
         06Mb2lT9XVF2SXRHwb/Wa1Xe0725LucnimHV7XVs=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id CC284352078F; Thu, 15 Oct 2020 09:15:01 -0700 (PDT)
Date:   Thu, 15 Oct 2020 09:15:01 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201015161501.GV3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
 <20201014221152.GS3249@paulmck-ThinkPad-P72>
 <20201014223954.GH2594@hirez.programming.kicks-ass.net>
 <20201014235553.GU3249@paulmck-ThinkPad-P72>
 <20201015034128.GA10260@paulmck-ThinkPad-P72>
 <20201015094926.GY2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015094926.GY2611@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 11:49:26AM +0200, Peter Zijlstra wrote:
> On Wed, Oct 14, 2020 at 08:41:28PM -0700, Paul E. McKenney wrote:
> > So the (untested) patch below (on top of the other two) moves the delay
> > to rcu_gp_init(), in particular, to the first loop that traverses only
> > the leaf rcu_node structures handling CPU hotplug.
> > 
> > Hopefully getting closer!
> 
> So, if I composed things right, we end up with this. Comments below.
> 
> 
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -1143,13 +1143,15 @@ bool rcu_lockdep_current_cpu_online(void
>  	struct rcu_data *rdp;
>  	struct rcu_node *rnp;
>  	bool ret = false;
> +	unsigned long seq;
>  
>  	if (in_nmi() || !rcu_scheduler_fully_active)
>  		return true;
>  	preempt_disable_notrace();
>  	rdp = this_cpu_ptr(&rcu_data);
>  	rnp = rdp->mynode;
> -	if (rdp->grpmask & rcu_rnp_online_cpus(rnp))
> +	seq = READ_ONCE(rnp->ofl_seq) & ~0x1;
> +	if (rdp->grpmask & rcu_rnp_online_cpus(rnp) || seq != READ_ONCE(rnp->ofl_seq))
>  		ret = true;
>  	preempt_enable_notrace();
>  	return ret;
> @@ -1715,6 +1717,7 @@ static void rcu_strict_gp_boundary(void
>   */
>  static bool rcu_gp_init(void)
>  {
> +	unsigned long firstseq;
>  	unsigned long flags;
>  	unsigned long oldmask;
>  	unsigned long mask;
> @@ -1758,6 +1761,12 @@ static bool rcu_gp_init(void)
>  	 */
>  	rcu_state.gp_state = RCU_GP_ONOFF;
>  	rcu_for_each_leaf_node(rnp) {
> +		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
> +		firstseq = READ_ONCE(rnp->ofl_seq);
> +		if (firstseq & 0x1)
> +			while (firstseq == smp_load_acquire(&rnp->ofl_seq))
> +				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
> +		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
>  		raw_spin_lock(&rcu_state.ofl_lock);
>  		raw_spin_lock_irq_rcu_node(rnp);
>  		if (rnp->qsmaskinit == rnp->qsmaskinitnext &&
> @@ -4047,6 +4056,9 @@ void rcu_cpu_starting(unsigned int cpu)
>  
>  	rnp = rdp->mynode;
>  	mask = rdp->grpmask;
> +	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
> +	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
> +	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
>  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
>  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
>  	newcpu = !(rnp->expmaskinitnext & mask);
> @@ -4064,6 +4076,9 @@ void rcu_cpu_starting(unsigned int cpu)
>  	} else {
>  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  	}
> +	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
> +	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
> +	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
>  	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
>  }
>  
> @@ -4091,6 +4106,9 @@ void rcu_report_dead(unsigned int cpu)
>  
>  	/* Remove outgoing CPU from mask in the leaf rcu_node structure. */
>  	mask = rdp->grpmask;
> +	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
> +	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
> +	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
>  	raw_spin_lock(&rcu_state.ofl_lock);
>  	raw_spin_lock_irqsave_rcu_node(rnp, flags); /* Enforce GP memory-order guarantee. */
>  	rdp->rcu_ofl_gp_seq = READ_ONCE(rcu_state.gp_seq);
> @@ -4103,6 +4121,9 @@ void rcu_report_dead(unsigned int cpu)
>  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext & ~mask);
>  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  	raw_spin_unlock(&rcu_state.ofl_lock);
> +	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
> +	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
> +	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
>  
>  	rdp->cpu_started = false;
>  }
> --- a/kernel/rcu/tree.h
> +++ b/kernel/rcu/tree.h
> @@ -56,6 +56,7 @@ struct rcu_node {
>  				/*  Initialized from ->qsmaskinitnext at the */
>  				/*  beginning of each grace period. */
>  	unsigned long qsmaskinitnext;
> +	unsigned long ofl_seq;	/* CPU-hotplug operation sequence count. */
>  				/* Online CPUs for next grace period. */
>  	unsigned long expmask;	/* CPUs or groups that need to check in */
>  				/*  to allow the current expedited GP */
> 
> 
> Lets see if I can understand this.
> 
>  - we seqcount wrap online/offline, such that they're odd while
>    in-progress. Full memory barriers, such that, unlike with regular
>    seqcount, it also orders later reads, important?

Yes.

>  - when odd, we ensure it is seen as online; notable detail seems to be
>    that this function is expected to be called in PO relative to the
>    seqcount ops. It is unsafe concurrently. This seems sufficient for
>    our goals today.

Where "this function" is rcu_lockdep_current_cpu_online(), yes it
must be called on the CPU in question.  Otherwise, you might get
racy results.  Which is sometimes OK.

>  - when odd, we delay the current gp.

Yes.

> It is that last point where I think I'd like to suggest change. Given
> that both rcu_cpu_starting() and rcu_report_dead() (the naming is
> slightly inconsistent) are ran with IRQs disabled, spin-waiting seems
> like a more natural match.
> 
> Also, I don't see the purpose of your smp_load_acquire(), you don't
> actually do anything before then calling a full smp_mb().
> 
> 
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -1764,8 +1764,7 @@ static bool rcu_gp_init(void)
>  		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
>  		firstseq = READ_ONCE(rnp->ofl_seq);
>  		if (firstseq & 0x1)
> -			while (firstseq == smp_load_acquire(&rnp->ofl_seq))
> -				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
> +			smp_cond_load_relaxed(&rnp->ofl_seq, VAL == firstseq);
>  		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
>  		raw_spin_lock(&rcu_state.ofl_lock);
>  		raw_spin_lock_irq_rcu_node(rnp);

This would work, and would be absolutely necessary if grace periods
took only (say) 500 nanoseconds to complete.  But given that they take
multiple milliseconds at best, and given that this race is extremely
unlikely, and given the heavy use of virtualization, I have to stick
with the schedule_timeout_idle().

In fact, I have on my list to force this race to happen on the grounds
that if it ain't tested, it don't work...

							Thanx, Paul
