Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FF528F68A
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 18:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389207AbgJOQUS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 12:20:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:50208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388461AbgJOQUS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 12:20:18 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5918222240;
        Thu, 15 Oct 2020 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602778817;
        bh=G4azHigRL5fXoICRGA0Q+UdhQhfhNdpJsCoRVvvtWvo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JF2szdNSlnskn/bNqMpmVGvNF0vb+R0o1v4yc72JtiPfaBc4GxDilfeeLuZMsERzi
         eea7/EyA2J5ikwW8M4kt63yOLBaxit1lLJNSjKtOL8fnlQJUAOrb+LOYoAdfxbWEww
         oxYm6pW+y7p2ulv02Cg/UCHtQRhbxWZn8HoRDoIE=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 15CD1352078F; Thu, 15 Oct 2020 09:20:17 -0700 (PDT)
Date:   Thu, 15 Oct 2020 09:20:17 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201015162017.GX3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
 <20201014221152.GS3249@paulmck-ThinkPad-P72>
 <20201014223954.GH2594@hirez.programming.kicks-ass.net>
 <20201014235553.GU3249@paulmck-ThinkPad-P72>
 <20201015034128.GA10260@paulmck-ThinkPad-P72>
 <20201015094926.GY2611@hirez.programming.kicks-ass.net>
 <20201015095235.GT2651@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015095235.GT2651@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 11:52:35AM +0200, Peter Zijlstra wrote:
> On Thu, Oct 15, 2020 at 11:49:26AM +0200, Peter Zijlstra wrote:
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -1764,8 +1764,7 @@ static bool rcu_gp_init(void)
> >  		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
> >  		firstseq = READ_ONCE(rnp->ofl_seq);
> >  		if (firstseq & 0x1)
> > -			while (firstseq == smp_load_acquire(&rnp->ofl_seq))
> > -				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
> > +			smp_cond_load_relaxed(&rnp->ofl_seq, VAL == firstseq);
> 
> My bad, that should be: VAL != firstseq.

Looks like something -I- would do!  ;-)

> >  		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
> >  		raw_spin_lock(&rcu_state.ofl_lock);
> >  		raw_spin_lock_irq_rcu_node(rnp);

And somewhere or another you asked about the smp_load_acquire().  You are
right, that is not needed.  It was a holdover from when I was thinking
I could get away with weaker barriers.  It is now READ_ONCE().

Here is the updated patch.  Thoughts?

Oh, and special thanks for taking this one seriously, as my environment
is a bit less distraction-free than it usually is.

							Thanx, Paul

------------------------------------------------------------------------

commit 99ed1f30fd4e7db4fc5cf8f4cd6329897b2f6ed1
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Oct 13 12:39:23 2020 -0700

    rcu: Prevent lockdep-RCU splats on lock acquisition/release
    
    The rcu_cpu_starting() and rcu_report_dead() functions transition the
    current CPU between online and offline state from an RCU perspective.
    Unfortunately, this means that the rcu_cpu_starting() function's lock
    acquisition and the rcu_report_dead() function's lock releases happen
    while the CPU is offline from an RCU perspective, which can result in
    lockdep-RCU splats about using RCU from an offline CPU.  In reality,
    aside from the splats, both transitions are safe because a new grace
    period cannot start until these functions release their locks.
    
    But the false-positive splats nevertheless need to be eliminated.
    
    This commit therefore uses sequence-count-like synchronization to forgive
    use of RCU while RCU thinks a CPU is offline across the full extent of
    the rcu_cpu_starting() and rcu_report_dead() function's lock acquisitions
    and releases.
    
    One approach would have been to use the actual sequence-count primitives
    provided by the Linux kernel.  Unfortunately, the resulting code looks
    completely broken and wrong, and is likely to result in patches that
    break RCU in an attempt to address this appearance of broken wrongness.
    Plus there is no net savings in lines of code, given the additional
    explicit memory barriers required.
    
    Therefore, this sequence count is instead implemented by a new ->ofl_seq
    field in the rcu_node structure.  If this counter's value is an odd
    number, RCU forgives RCU read-side critical sections on other CPUs covered
    by the same rcu_node structure, even if those CPUs are offline from
    an RCU perspective.  In addition, if a given leaf rcu_node structure's
    ->ofl_seq counter value is an odd number, rcu_gp_init() delays starting
    the grace period until that counter value changes.
    
    [ paulmck: Apply Peter Zijlstra feedback. ]
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 1d42909..6d906fb 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -1158,7 +1158,7 @@ bool rcu_lockdep_current_cpu_online(void)
 	preempt_disable_notrace();
 	rdp = this_cpu_ptr(&rcu_data);
 	rnp = rdp->mynode;
-	if (rdp->grpmask & rcu_rnp_online_cpus(rnp))
+	if (rdp->grpmask & rcu_rnp_online_cpus(rnp) || READ_ONCE(rnp->ofl_seq) & 0x1)
 		ret = true;
 	preempt_enable_notrace();
 	return ret;
@@ -1723,6 +1723,7 @@ static void rcu_strict_gp_boundary(void *unused)
  */
 static bool rcu_gp_init(void)
 {
+	unsigned long firstseq;
 	unsigned long flags;
 	unsigned long oldmask;
 	unsigned long mask;
@@ -1766,6 +1767,12 @@ static bool rcu_gp_init(void)
 	 */
 	rcu_state.gp_state = RCU_GP_ONOFF;
 	rcu_for_each_leaf_node(rnp) {
+		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
+		firstseq = READ_ONCE(rnp->ofl_seq);
+		if (firstseq & 0x1)
+			while (firstseq == READ_ONCE(rnp->ofl_seq))
+				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
+		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
 		raw_spin_lock(&rcu_state.ofl_lock);
 		raw_spin_lock_irq_rcu_node(rnp);
 		if (rnp->qsmaskinit == rnp->qsmaskinitnext &&
@@ -4065,6 +4072,9 @@ void rcu_cpu_starting(unsigned int cpu)
 
 	rnp = rdp->mynode;
 	mask = rdp->grpmask;
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
 	raw_spin_lock_irqsave_rcu_node(rnp, flags);
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
 	newcpu = !(rnp->expmaskinitnext & mask);
@@ -4084,6 +4094,9 @@ void rcu_cpu_starting(unsigned int cpu)
 	} else {
 		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	}
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
 	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
 }
 
@@ -4111,6 +4124,9 @@ void rcu_report_dead(unsigned int cpu)
 
 	/* Remove outgoing CPU from mask in the leaf rcu_node structure. */
 	mask = rdp->grpmask;
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
 	raw_spin_lock(&rcu_state.ofl_lock);
 	raw_spin_lock_irqsave_rcu_node(rnp, flags); /* Enforce GP memory-order guarantee. */
 	rdp->rcu_ofl_gp_seq = READ_ONCE(rcu_state.gp_seq);
@@ -4123,6 +4139,9 @@ void rcu_report_dead(unsigned int cpu)
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext & ~mask);
 	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	raw_spin_unlock(&rcu_state.ofl_lock);
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
 
 	rdp->cpu_started = false;
 }
diff --git a/kernel/rcu/tree.h b/kernel/rcu/tree.h
index 805c9eb..7708ed1 100644
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
