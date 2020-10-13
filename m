Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1F828D47E
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 21:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgJMTa0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 15:30:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgJMTa0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 15:30:26 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8179C208D5;
        Tue, 13 Oct 2020 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602617425;
        bh=sKfRn0G3r2QJ0n+zStMYMH4/lQ2Rvihck+3oEl1ZvRM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=R7sjL8Pg4SIQAhpyidIjl4QmhLEOJyFBsROOvFP4YxaQAr2UtPR+9W1tq4+6ZT8cX
         OYUUCp0+T+8Z6y5dY6t7DTrbaXzs530PPuzZjONxbeNxqoEo0p4cpRLGqF9amoUePO
         hY0Sy02C5iFegmKKL4YvGB4MclKKd6/Fjx550IOY=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 3506E3522A39; Tue, 13 Oct 2020 12:30:25 -0700 (PDT)
Date:   Tue, 13 Oct 2020 12:30:25 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201013193025.GA2424@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201012212812.GH3249@paulmck-ThinkPad-P72>
 <20201013103406.GY2628@hirez.programming.kicks-ass.net>
 <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
 <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013162650.GN3249@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 13, 2020 at 09:26:50AM -0700, Paul E. McKenney wrote:
> On Tue, Oct 13, 2020 at 01:25:44PM +0200, Peter Zijlstra wrote:
> > On Tue, Oct 13, 2020 at 12:44:50PM +0200, Peter Zijlstra wrote:
> > > On Tue, Oct 13, 2020 at 12:34:06PM +0200, Peter Zijlstra wrote:
> > > > On Mon, Oct 12, 2020 at 02:28:12PM -0700, Paul E. McKenney wrote:
> > > > > It is certainly an accident waiting to happen.  Would something like
> > > > > the following make sense?
> > > > 
> > > > Sadly no.
> > > > 
> > > > > ------------------------------------------------------------------------
> > > > > 
> > > > > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > > > > index bfd38f2..52a63bc 100644
> > > > > --- a/kernel/rcu/tree.c
> > > > > +++ b/kernel/rcu/tree.c
> > > > > @@ -4067,6 +4067,7 @@ void rcu_cpu_starting(unsigned int cpu)
> > > > >  
> > > > >  	rnp = rdp->mynode;
> > > > >  	mask = rdp->grpmask;
> > > > > +	lockdep_off();
> > > > >  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
> > > > >  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
> > > > >  	newcpu = !(rnp->expmaskinitnext & mask);
> > > > > @@ -4086,6 +4087,7 @@ void rcu_cpu_starting(unsigned int cpu)
> > > > >  	} else {
> > > > >  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> > > > >  	}
> > > > > +	lockdep_on();
> > > > >  	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
> > > > >  }
> > > > 
> > > > This will just shut it up, but will not fix the actual problem of that
> > > > spin-lock ending up in trace_lock_acquire() which relies on RCU which
> > > > isn't looking.
> > > > 
> > > > What we need here is to supress tracing not lockdep. Let me consider.
> > > 
> > > We appear to have a similar problem with rcu_report_dead(), it's
> > > raw_spin_unlock()s can end up in trace_lock_release() while we just
> > > killed RCU.
> > 
> > So we can deal with the explicit trace_*() calls like the below, but I
> > really don't like it much. It also doesn't help with function tracing.
> > This is really early/late in the hotplug cycle and should be considered
> > entry, we shouldn't be tracing anything here.
> > 
> > Paul, would it be possible to use a scheme similar to IRQ/NMI for
> > hotplug? That seems to mostly rely on atomic ops, not locks.
> 
> The rest of the rcu_node tree and the various grace-period/hotplug races
> makes that question non-trivial.  I will look into it, but I have no
> reason for optimism.
> 
> But there is only one way to find out...  ;-)

The aforementioned races get really ugly really fast.  So I do not
believe that a lockless approach is a strategy to win here.

But why not use something sort of like a sequence counter, but adapted
for local on-CPU use?  This should quiet the diagnostics for the full
time that RCU needs its locks.  Untested patch below.

Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 1d42909..5b06886 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -1152,13 +1152,15 @@ bool rcu_lockdep_current_cpu_online(void)
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
@@ -4065,6 +4067,8 @@ void rcu_cpu_starting(unsigned int cpu)
 
 	rnp = rdp->mynode;
 	mask = rdp->grpmask;
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
 	raw_spin_lock_irqsave_rcu_node(rnp, flags);
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
 	newcpu = !(rnp->expmaskinitnext & mask);
@@ -4084,6 +4088,8 @@ void rcu_cpu_starting(unsigned int cpu)
 	} else {
 		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	}
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
 	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
 }
 
@@ -4111,6 +4117,8 @@ void rcu_report_dead(unsigned int cpu)
 
 	/* Remove outgoing CPU from mask in the leaf rcu_node structure. */
 	mask = rdp->grpmask;
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rnp->ofl_seq & 0x1));
 	raw_spin_lock(&rcu_state.ofl_lock);
 	raw_spin_lock_irqsave_rcu_node(rnp, flags); /* Enforce GP memory-order guarantee. */
 	rdp->rcu_ofl_gp_seq = READ_ONCE(rcu_state.gp_seq);
@@ -4123,6 +4131,8 @@ void rcu_report_dead(unsigned int cpu)
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext & ~mask);
 	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	raw_spin_unlock(&rcu_state.ofl_lock);
+	WRITE_ONCE(rnp->ofl_seq, rnp->ofl_seq + 1);
+	WARN_ON_ONCE(rnp->ofl_seq & 0x1);
 
 	rdp->cpu_started = false;
 }
diff --git a/kernel/rcu/tree.h b/kernel/rcu/tree.h
index 805c9eb..7d802b6 100644
--- a/kernel/rcu/tree.h
+++ b/kernel/rcu/tree.h
@@ -57,6 +57,7 @@ struct rcu_node {
 				/*  beginning of each grace period. */
 	unsigned long qsmaskinitnext;
 				/* Online CPUs for next grace period. */
+	unsigned long ofl_seq;	/* CPU-hotplug operation sequence count. */
 	unsigned long expmask;	/* CPUs or groups that need to check in */
 				/*  to allow the current expedited GP */
 				/*  to complete. */
