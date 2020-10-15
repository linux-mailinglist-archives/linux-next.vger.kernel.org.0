Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 597E228EBAC
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 05:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgJODla (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 23:41:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728934AbgJODla (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 23:41:30 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4617E20691;
        Thu, 15 Oct 2020 03:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602733289;
        bh=xFrCW4148ckM17ydN7CaAThkadlv2qP8pSAdSmybXcs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nlYLNSMFV4hSQCvImDl/Pa7ogKhAUZj91SvIV7C//M8i6DHpmZyD58tjzXAX4hwxa
         GQirTEDNXtaXy4QJwgnNOVHzrHSa9XnZdqY0UVNshXjNRdU7YWnTXIe2XAtYlbP0h9
         beYBQkVSXrzevxMxXdsA13HWlEwfT32hhtVAy5So=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id D265E35229EB; Wed, 14 Oct 2020 20:41:28 -0700 (PDT)
Date:   Wed, 14 Oct 2020 20:41:28 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201015034128.GA10260@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201013103406.GY2628@hirez.programming.kicks-ass.net>
 <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
 <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
 <20201014221152.GS3249@paulmck-ThinkPad-P72>
 <20201014223954.GH2594@hirez.programming.kicks-ass.net>
 <20201014235553.GU3249@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014235553.GU3249@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 14, 2020 at 04:55:53PM -0700, Paul E. McKenney wrote:
> On Thu, Oct 15, 2020 at 12:39:54AM +0200, Peter Zijlstra wrote:
> > On Wed, Oct 14, 2020 at 03:11:52PM -0700, Paul E. McKenney wrote:
> > > On Wed, Oct 14, 2020 at 11:53:19PM +0200, Peter Zijlstra wrote:
> > > > On Wed, Oct 14, 2020 at 11:34:05AM -0700, Paul E. McKenney wrote:
> > > > > commit 7deaa04b02298001426730ed0e6214ac20d1a1c1
> > > > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > > > Date:   Tue Oct 13 12:39:23 2020 -0700
> > > > > 
> > > > >     rcu: Prevent lockdep-RCU splats on lock acquisition/release
> > > > >     
> > > > >     The rcu_cpu_starting() and rcu_report_dead() functions transition the
> > > > >     current CPU between online and offline state from an RCU perspective.
> > > > >     Unfortunately, this means that the rcu_cpu_starting() function's lock
> > > > >     acquisition and the rcu_report_dead() function's lock releases happen
> > > > >     while the CPU is offline from an RCU perspective, which can result in
> > > > >     lockdep-RCU splats about using RCU from an offline CPU.  In reality,
> > > > >     aside from the splats, both transitions are safe because a new grace
> > > > >     period cannot start until these functions release their locks.
> > > > 
> > > > But we call the trace_* crud before we acquire the lock. Are you sure
> > > > that's a false-positive? 
> > > 
> > > You lost me on this one.
> > > 
> > > I am assuming that you are talking about rcu_cpu_starting(), because
> > > that is the one where RCU is not initially watching, that is, the
> > > case where tracing before the lock acquisition would be a problem.
> > > You cannot be talking about rcu_cpu_starting() itself, because it does
> > > not do any tracing before acquiring the lock.  But if you are talking
> > > about the caller of rcu_cpu_starting(), then that caller should put the
> > > rcu_cpu_starting() before the tracing.  But that would be the other
> > > patch earlier in this thread that was proposing moving the call to
> > > rcu_cpu_starting() much earlier in CPU bringup.
> > > 
> > > So what am I missing here?
> > 
> > rcu_cpu_starting();
> >   raw_spin_lock_irqsave();
> >     local_irq_save();
> >     preempt_disable();
> >     spin_acquire()
> >       lock_acquire()
> >         trace_lock_acquire() <--- *whoopsie-doodle*
> > 	  /* uses RCU for tracing */
> >     arch_spin_lock_flags() <--- the actual spinlock
> 
> Gah!  Idiot here left out the most important part, so good catch!!!
> Much easier this way than finding out about it the hard way...
> 
> I should have asked myself harder questions earlier today about moving
> the counter from the rcu_node structure to the rcu_data structure.
> 
> Perhaps something like the following untested patch on top of the
> earlier patch?

Except that this is subtlely flawed also.  The delay cannot be at
rcu_gp_cleanup() time because by the time we are working on the last
leaf rcu_node structure, callbacks might already have started being
invoked on CPUs corresponding to the earlier leaf rcu_node structures.

So the (untested) patch below (on top of the other two) moves the delay
to rcu_gp_init(), in particular, to the first loop that traverses only
the leaf rcu_node structures handling CPU hotplug.

Hopefully getting closer!

Oh, and the second smp_mb() added to rcu_gp_init() is probably
redundant given the full barrier implied by the later call to
raw_spin_lock_irq_rcu_node().  But one thing at a time...

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 8b5215e..5904b63 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -1725,6 +1725,7 @@ static void rcu_strict_gp_boundary(void *unused)
  */
 static bool rcu_gp_init(void)
 {
+	unsigned long firstseq;
 	unsigned long flags;
 	unsigned long oldmask;
 	unsigned long mask;
@@ -1768,6 +1769,12 @@ static bool rcu_gp_init(void)
 	 */
 	rcu_state.gp_state = RCU_GP_ONOFF;
 	rcu_for_each_leaf_node(rnp) {
+		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
+		firstseq = READ_ONCE(rnp->ofl_seq);
+		if (firstseq & 0x1)
+			while (firstseq == smp_load_acquire(&rnp->ofl_seq))
+				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
+		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
 		raw_spin_lock(&rcu_state.ofl_lock);
 		raw_spin_lock_irq_rcu_node(rnp);
 		if (rnp->qsmaskinit == rnp->qsmaskinitnext &&
@@ -1982,7 +1989,6 @@ static void rcu_gp_fqs_loop(void)
 static void rcu_gp_cleanup(void)
 {
 	int cpu;
-	unsigned long firstseq;
 	bool needgp = false;
 	unsigned long gp_duration;
 	unsigned long new_gp_seq;
@@ -2020,12 +2026,6 @@ static void rcu_gp_cleanup(void)
 	new_gp_seq = rcu_state.gp_seq;
 	rcu_seq_end(&new_gp_seq);
 	rcu_for_each_node_breadth_first(rnp) {
-		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
-		firstseq = READ_ONCE(rnp->ofl_seq);
-		if (firstseq & 0x1)
-			while (firstseq == smp_load_acquire(&rnp->ofl_seq))
-				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
-		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
 		raw_spin_lock_irq_rcu_node(rnp);
 		if (WARN_ON_ONCE(rcu_preempt_blocked_readers_cgp(rnp)))
 			dump_blkd_tasks(rnp, 10);
