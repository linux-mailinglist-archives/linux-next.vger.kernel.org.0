Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DCC28E950
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 01:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732095AbgJNXzy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 19:55:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:53142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728370AbgJNXzy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 19:55:54 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B838214D8;
        Wed, 14 Oct 2020 23:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602719753;
        bh=Y3dZH3CSQURlOtNEbvEKeTYt3CoLa8/NrM/6Ohh0V98=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rO0O3Z1k5v8geXDtwd83xzHCL5ZhQF/1luBPmK0fRL1YsuRbb5M6/ymDZklXZJO77
         ZTkXA70I7BffTklFhgZLdsnOmv+ey3ldTQ+5ph/ODg0TUF2FPE9F+NJgjsvtu1YvYT
         rWw85R9AnV8prygtbYAktW6wsz63avaT9ht3kvaI=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 2C26D35229EB; Wed, 14 Oct 2020 16:55:53 -0700 (PDT)
Date:   Wed, 14 Oct 2020 16:55:53 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201014235553.GU3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201012212812.GH3249@paulmck-ThinkPad-P72>
 <20201013103406.GY2628@hirez.programming.kicks-ass.net>
 <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
 <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
 <20201014221152.GS3249@paulmck-ThinkPad-P72>
 <20201014223954.GH2594@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014223954.GH2594@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 12:39:54AM +0200, Peter Zijlstra wrote:
> On Wed, Oct 14, 2020 at 03:11:52PM -0700, Paul E. McKenney wrote:
> > On Wed, Oct 14, 2020 at 11:53:19PM +0200, Peter Zijlstra wrote:
> > > On Wed, Oct 14, 2020 at 11:34:05AM -0700, Paul E. McKenney wrote:
> > > > commit 7deaa04b02298001426730ed0e6214ac20d1a1c1
> > > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > > Date:   Tue Oct 13 12:39:23 2020 -0700
> > > > 
> > > >     rcu: Prevent lockdep-RCU splats on lock acquisition/release
> > > >     
> > > >     The rcu_cpu_starting() and rcu_report_dead() functions transition the
> > > >     current CPU between online and offline state from an RCU perspective.
> > > >     Unfortunately, this means that the rcu_cpu_starting() function's lock
> > > >     acquisition and the rcu_report_dead() function's lock releases happen
> > > >     while the CPU is offline from an RCU perspective, which can result in
> > > >     lockdep-RCU splats about using RCU from an offline CPU.  In reality,
> > > >     aside from the splats, both transitions are safe because a new grace
> > > >     period cannot start until these functions release their locks.
> > > 
> > > But we call the trace_* crud before we acquire the lock. Are you sure
> > > that's a false-positive? 
> > 
> > You lost me on this one.
> > 
> > I am assuming that you are talking about rcu_cpu_starting(), because
> > that is the one where RCU is not initially watching, that is, the
> > case where tracing before the lock acquisition would be a problem.
> > You cannot be talking about rcu_cpu_starting() itself, because it does
> > not do any tracing before acquiring the lock.  But if you are talking
> > about the caller of rcu_cpu_starting(), then that caller should put the
> > rcu_cpu_starting() before the tracing.  But that would be the other
> > patch earlier in this thread that was proposing moving the call to
> > rcu_cpu_starting() much earlier in CPU bringup.
> > 
> > So what am I missing here?
> 
> rcu_cpu_starting();
>   raw_spin_lock_irqsave();
>     local_irq_save();
>     preempt_disable();
>     spin_acquire()
>       lock_acquire()
>         trace_lock_acquire() <--- *whoopsie-doodle*
> 	  /* uses RCU for tracing */
>     arch_spin_lock_flags() <--- the actual spinlock

Gah!  Idiot here left out the most important part, so good catch!!!
Much easier this way than finding out about it the hard way...

I should have asked myself harder questions earlier today about moving
the counter from the rcu_node structure to the rcu_data structure.

Perhaps something like the following untested patch on top of the
earlier patch?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 286dc0a..8b5215e 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -1159,8 +1159,8 @@ bool rcu_lockdep_current_cpu_online(void)
 	preempt_disable_notrace();
 	rdp = this_cpu_ptr(&rcu_data);
 	rnp = rdp->mynode;
-	seq = READ_ONCE(rdp->ofl_seq) & ~0x1;
-	if (rdp->grpmask & rcu_rnp_online_cpus(rnp) || seq != READ_ONCE(rdp->ofl_seq))
+	seq = READ_ONCE(rnp->ofl_seq) & ~0x1;
+	if (rdp->grpmask & rcu_rnp_online_cpus(rnp) || seq != READ_ONCE(rnp->ofl_seq))
 		ret = true;
 	preempt_enable_notrace();
 	return ret;
@@ -1982,6 +1982,7 @@ static void rcu_gp_fqs_loop(void)
 static void rcu_gp_cleanup(void)
 {
 	int cpu;
+	unsigned long firstseq;
 	bool needgp = false;
 	unsigned long gp_duration;
 	unsigned long new_gp_seq;
@@ -2019,6 +2020,12 @@ static void rcu_gp_cleanup(void)
 	new_gp_seq = rcu_state.gp_seq;
 	rcu_seq_end(&new_gp_seq);
 	rcu_for_each_node_breadth_first(rnp) {
+		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
+		firstseq = READ_ONCE(rnp->ofl_seq);
+		if (firstseq & 0x1)
+			while (firstseq == smp_load_acquire(&rnp->ofl_seq))
+				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
+		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
 		raw_spin_lock_irq_rcu_node(rnp);
 		if (WARN_ON_ONCE(rcu_preempt_blocked_readers_cgp(rnp)))
 			dump_blkd_tasks(rnp, 10);
@@ -4067,8 +4074,9 @@ void rcu_cpu_starting(unsigned int cpu)
 
 	rnp = rdp->mynode;
 	mask = rdp->grpmask;
-	WRITE_ONCE(rdp->ofl_seq, rdp->ofl_seq + 1);
-	WARN_ON_ONCE(!(rdp->ofl_seq & 0x1));
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
 	raw_spin_lock_irqsave_rcu_node(rnp, flags);
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
 	newcpu = !(rnp->expmaskinitnext & mask);
@@ -4088,8 +4096,9 @@ void rcu_cpu_starting(unsigned int cpu)
 	} else {
 		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	}
-	WRITE_ONCE(rdp->ofl_seq, rdp->ofl_seq + 1);
-	WARN_ON_ONCE(rdp->ofl_seq & 0x1);
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
 	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
 }
 
@@ -4117,8 +4126,9 @@ void rcu_report_dead(unsigned int cpu)
 
 	/* Remove outgoing CPU from mask in the leaf rcu_node structure. */
 	mask = rdp->grpmask;
-	WRITE_ONCE(rdp->ofl_seq, rdp->ofl_seq + 1);
-	WARN_ON_ONCE(!(rdp->ofl_seq & 0x1));
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
 	raw_spin_lock(&rcu_state.ofl_lock);
 	raw_spin_lock_irqsave_rcu_node(rnp, flags); /* Enforce GP memory-order guarantee. */
 	rdp->rcu_ofl_gp_seq = READ_ONCE(rcu_state.gp_seq);
@@ -4131,8 +4141,9 @@ void rcu_report_dead(unsigned int cpu)
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext & ~mask);
 	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	raw_spin_unlock(&rcu_state.ofl_lock);
-	WRITE_ONCE(rdp->ofl_seq, rdp->ofl_seq + 1);
-	WARN_ON_ONCE(rdp->ofl_seq & 0x1);
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
 
 	rdp->cpu_started = false;
 }
diff --git a/kernel/rcu/tree.h b/kernel/rcu/tree.h
index bf0198d..7708ed1 100644
--- a/kernel/rcu/tree.h
+++ b/kernel/rcu/tree.h
@@ -56,6 +56,7 @@ struct rcu_node {
 				/*  Initialized from ->qsmaskinitnext at the */
 				/*  beginning of each grace period. */
 	unsigned long qsmaskinitnext;
+	unsigned long ofl_seq;	/* CPU-hotplug operation sequence count. */
 				/* Online CPUs for next grace period. */
 	unsigned long expmask;	/* CPUs or groups that need to check in */
 				/*  to allow the current expedited GP */
@@ -250,7 +251,6 @@ struct rcu_data {
 	unsigned long rcu_onl_gp_seq;	/* ->gp_seq at last online. */
 	short rcu_onl_gp_flags;		/* ->gp_flags at last online. */
 	unsigned long last_fqs_resched;	/* Time of last rcu_resched(). */
-	unsigned long ofl_seq;		/* CPU-hotplug operation sequence count. */
 
 	int cpu;
 };
