Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2CF28EF91
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 11:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388922AbgJOJuD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 05:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388789AbgJOJuC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 05:50:02 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4279C061755;
        Thu, 15 Oct 2020 02:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=8bp9+TuVTDBghCyDUo4D3ls7pr1NUbtjCsm3ZR97o0Q=; b=KYHWR4/RsSg8JCC8OnhOhelMEK
        DJeUvfLn9I5TYHkv6xFn2+RXi0IAi+lTM1GwAgF85PtupaoQy1lWFVSyW/HBvJ830I41QL2uY4jqB
        ywSaUhAS+ogQAuD/t37n++zJGLSiTO7ksDubNrcmfsJHY2LnqxgFTlHpuo60xcpVdXa76RCAIQd1h
        Az6wMBA8Wr9FrJpYNNKWfvS3Uhe8O1XUy1aOEy0UOJ9CzE5Y75TGJIOC1QzIJj3GbVV7Sxiv2rnng
        CvRwxKwMIA924Q6vzbUoMETLMHZkYM9VpRgvtd5s1clzOip5KDjwukgzMC1g0E/m/v0On0CD1Wfwq
        rgh67mvA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSzt3-00065w-Rd; Thu, 15 Oct 2020 09:49:30 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2E75B300DAE;
        Thu, 15 Oct 2020 11:49:26 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 84E1820325ECE; Thu, 15 Oct 2020 11:49:26 +0200 (CEST)
Date:   Thu, 15 Oct 2020 11:49:26 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201015094926.GY2611@hirez.programming.kicks-ass.net>
References: <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
 <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
 <20201014221152.GS3249@paulmck-ThinkPad-P72>
 <20201014223954.GH2594@hirez.programming.kicks-ass.net>
 <20201014235553.GU3249@paulmck-ThinkPad-P72>
 <20201015034128.GA10260@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015034128.GA10260@paulmck-ThinkPad-P72>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 14, 2020 at 08:41:28PM -0700, Paul E. McKenney wrote:
> So the (untested) patch below (on top of the other two) moves the delay
> to rcu_gp_init(), in particular, to the first loop that traverses only
> the leaf rcu_node structures handling CPU hotplug.
> 
> Hopefully getting closer!

So, if I composed things right, we end up with this. Comments below.


--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -1143,13 +1143,15 @@ bool rcu_lockdep_current_cpu_online(void
 	struct rcu_data *rdp;
 	struct rcu_node *rnp;
 	bool ret = false;
+	unsigned long seq;
 
 	if (in_nmi() || !rcu_scheduler_fully_active)
 		return true;
 	preempt_disable_notrace();
 	rdp = this_cpu_ptr(&rcu_data);
 	rnp = rdp->mynode;
-	if (rdp->grpmask & rcu_rnp_online_cpus(rnp))
+	seq = READ_ONCE(rnp->ofl_seq) & ~0x1;
+	if (rdp->grpmask & rcu_rnp_online_cpus(rnp) || seq != READ_ONCE(rnp->ofl_seq))
 		ret = true;
 	preempt_enable_notrace();
 	return ret;
@@ -1715,6 +1717,7 @@ static void rcu_strict_gp_boundary(void
  */
 static bool rcu_gp_init(void)
 {
+	unsigned long firstseq;
 	unsigned long flags;
 	unsigned long oldmask;
 	unsigned long mask;
@@ -1758,6 +1761,12 @@ static bool rcu_gp_init(void)
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
@@ -4047,6 +4056,9 @@ void rcu_cpu_starting(unsigned int cpu)
 
 	rnp = rdp->mynode;
 	mask = rdp->grpmask;
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
 	raw_spin_lock_irqsave_rcu_node(rnp, flags);
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
 	newcpu = !(rnp->expmaskinitnext & mask);
@@ -4064,6 +4076,9 @@ void rcu_cpu_starting(unsigned int cpu)
 	} else {
 		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	}
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
 	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
 }
 
@@ -4091,6 +4106,9 @@ void rcu_report_dead(unsigned int cpu)
 
 	/* Remove outgoing CPU from mask in the leaf rcu_node structure. */
 	mask = rdp->grpmask;
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
 	raw_spin_lock(&rcu_state.ofl_lock);
 	raw_spin_lock_irqsave_rcu_node(rnp, flags); /* Enforce GP memory-order guarantee. */
 	rdp->rcu_ofl_gp_seq = READ_ONCE(rcu_state.gp_seq);
@@ -4103,6 +4121,9 @@ void rcu_report_dead(unsigned int cpu)
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext & ~mask);
 	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	raw_spin_unlock(&rcu_state.ofl_lock);
+	smp_mb(); // Pair with rcu_gp_cleanup()'s ->ofl_seq barrier().
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
 
 	rdp->cpu_started = false;
 }
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


Lets see if I can understand this.

 - we seqcount wrap online/offline, such that they're odd while
   in-progress. Full memory barriers, such that, unlike with regular
   seqcount, it also orders later reads, important?

 - when odd, we ensure it is seen as online; notable detail seems to be
   that this function is expected to be called in PO relative to the
   seqcount ops. It is unsafe concurrently. This seems sufficient for
   our goals today.

 - when odd, we delay the current gp.


It is that last point where I think I'd like to suggest change. Given
that both rcu_cpu_starting() and rcu_report_dead() (the naming is
slightly inconsistent) are ran with IRQs disabled, spin-waiting seems
like a more natural match.

Also, I don't see the purpose of your smp_load_acquire(), you don't
actually do anything before then calling a full smp_mb().


--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -1764,8 +1764,7 @@ static bool rcu_gp_init(void)
 		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
 		firstseq = READ_ONCE(rnp->ofl_seq);
 		if (firstseq & 0x1)
-			while (firstseq == smp_load_acquire(&rnp->ofl_seq))
-				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
+			smp_cond_load_relaxed(&rnp->ofl_seq, VAL == firstseq);
 		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
 		raw_spin_lock(&rcu_state.ofl_lock);
 		raw_spin_lock_irq_rcu_node(rnp);
