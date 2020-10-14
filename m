Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE5C28E674
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 20:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730011AbgJNSeH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 14:34:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:55518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727830AbgJNSeH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 14:34:07 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17DE821D81;
        Wed, 14 Oct 2020 18:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602700446;
        bh=dvObI7eiXekgt7QG7OsTeuBX+bpSfJ8zh0+mKFf0WuI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=vn5AGfHXX3EG2cHn/kU4MbbreOORY1KE8ZB4/1lylFRvoUuJiN8VzLib9RJn4l35m
         uYLVYwAJf2ardch0jbV7pOZnGSlIrXMlLDFoi6z85p8a/y0TOvo7SUZVN04Pobe9m6
         bI0WsD1G6CAQUzCchIsRGMQsQDUwGvTiYPJOU5TQ=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id AD3EA3522892; Wed, 14 Oct 2020 11:34:05 -0700 (PDT)
Date:   Wed, 14 Oct 2020 11:34:05 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201014183405.GA27666@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201012212812.GH3249@paulmck-ThinkPad-P72>
 <20201013103406.GY2628@hirez.programming.kicks-ass.net>
 <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
 <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013193025.GA2424@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 13, 2020 at 12:30:25PM -0700, Paul E. McKenney wrote:
> On Tue, Oct 13, 2020 at 09:26:50AM -0700, Paul E. McKenney wrote:
> > On Tue, Oct 13, 2020 at 01:25:44PM +0200, Peter Zijlstra wrote:
> > > On Tue, Oct 13, 2020 at 12:44:50PM +0200, Peter Zijlstra wrote:
> > > > On Tue, Oct 13, 2020 at 12:34:06PM +0200, Peter Zijlstra wrote:
> > > > > On Mon, Oct 12, 2020 at 02:28:12PM -0700, Paul E. McKenney wrote:
> > > > > > It is certainly an accident waiting to happen.  Would something like
> > > > > > the following make sense?
> > > > > 
> > > > > Sadly no.
> > > > > 
> > > > > > ------------------------------------------------------------------------
> > > > > > 
> > > > > > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > > > > > index bfd38f2..52a63bc 100644
> > > > > > --- a/kernel/rcu/tree.c
> > > > > > +++ b/kernel/rcu/tree.c
> > > > > > @@ -4067,6 +4067,7 @@ void rcu_cpu_starting(unsigned int cpu)
> > > > > >  
> > > > > >  	rnp = rdp->mynode;
> > > > > >  	mask = rdp->grpmask;
> > > > > > +	lockdep_off();
> > > > > >  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
> > > > > >  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
> > > > > >  	newcpu = !(rnp->expmaskinitnext & mask);
> > > > > > @@ -4086,6 +4087,7 @@ void rcu_cpu_starting(unsigned int cpu)
> > > > > >  	} else {
> > > > > >  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> > > > > >  	}
> > > > > > +	lockdep_on();
> > > > > >  	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
> > > > > >  }
> > > > > 
> > > > > This will just shut it up, but will not fix the actual problem of that
> > > > > spin-lock ending up in trace_lock_acquire() which relies on RCU which
> > > > > isn't looking.
> > > > > 
> > > > > What we need here is to supress tracing not lockdep. Let me consider.
> > > > 
> > > > We appear to have a similar problem with rcu_report_dead(), it's
> > > > raw_spin_unlock()s can end up in trace_lock_release() while we just
> > > > killed RCU.
> > > 
> > > So we can deal with the explicit trace_*() calls like the below, but I
> > > really don't like it much. It also doesn't help with function tracing.
> > > This is really early/late in the hotplug cycle and should be considered
> > > entry, we shouldn't be tracing anything here.
> > > 
> > > Paul, would it be possible to use a scheme similar to IRQ/NMI for
> > > hotplug? That seems to mostly rely on atomic ops, not locks.
> > 
> > The rest of the rcu_node tree and the various grace-period/hotplug races
> > makes that question non-trivial.  I will look into it, but I have no
> > reason for optimism.
> > 
> > But there is only one way to find out...  ;-)
> 
> The aforementioned races get really ugly really fast.  So I do not
> believe that a lockless approach is a strategy to win here.
> 
> But why not use something sort of like a sequence counter, but adapted
> for local on-CPU use?  This should quiet the diagnostics for the full
> time that RCU needs its locks.  Untested patch below.
> 
> Thoughts?

Well, one problem with the previous patch is that it can result in false
negatives.  If a CPU incorrectly executes an RCU operation while offline,
but does so just when some other CPU sharing that same leaf rcu_node
structure is itself coming online or going offline, the incorrect RCU
operation will be ignored.  So this version avoids these false negatives
by putting the new ->ofl-seq field in the rcu_data structure instead of
the rcu_node structure.

 							Thanx, Paul

------------------------------------------------------------------------

commit 7deaa04b02298001426730ed0e6214ac20d1a1c1
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
    break RCU in an attempt to address this broken wrongness.  Plus there
    is little or no net savings in lines of code.
    
    Therefore, this sequence count is instead implemented by a new ->ofl_seq
    field in the rcu_data structure.  This field could instead be placed in
    the rcu_node structure, but the resulting improved cache locality is not
    important for the debug kernels in which this will be used on the read
    side, and the update side is only invoked twice per CPU-hotplug operation,
    so the improvement is not important there, either.  More importantly,
    placing this in the rcu_data structure allows each CPU to have its own
    counter, which avoids possible false negatives that could otherwise occur
    when a buggy access from an offline CPU occurred while another CPU sharing
    that same leaf rcu_node structure was undergoing a CPU-hotplug operation.
    Therefore, this new ->ofl_seq field is added to the rcu_data structure,
    not the rcu_node structure.
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 1d42909..286dc0a 100644
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
+	seq = READ_ONCE(rdp->ofl_seq) & ~0x1;
+	if (rdp->grpmask & rcu_rnp_online_cpus(rnp) || seq != READ_ONCE(rdp->ofl_seq))
 		ret = true;
 	preempt_enable_notrace();
 	return ret;
@@ -4065,6 +4067,8 @@ void rcu_cpu_starting(unsigned int cpu)
 
 	rnp = rdp->mynode;
 	mask = rdp->grpmask;
+	WRITE_ONCE(rdp->ofl_seq, rdp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rdp->ofl_seq & 0x1));
 	raw_spin_lock_irqsave_rcu_node(rnp, flags);
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
 	newcpu = !(rnp->expmaskinitnext & mask);
@@ -4084,6 +4088,8 @@ void rcu_cpu_starting(unsigned int cpu)
 	} else {
 		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	}
+	WRITE_ONCE(rdp->ofl_seq, rdp->ofl_seq + 1);
+	WARN_ON_ONCE(rdp->ofl_seq & 0x1);
 	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
 }
 
@@ -4111,6 +4117,8 @@ void rcu_report_dead(unsigned int cpu)
 
 	/* Remove outgoing CPU from mask in the leaf rcu_node structure. */
 	mask = rdp->grpmask;
+	WRITE_ONCE(rdp->ofl_seq, rdp->ofl_seq + 1);
+	WARN_ON_ONCE(!(rdp->ofl_seq & 0x1));
 	raw_spin_lock(&rcu_state.ofl_lock);
 	raw_spin_lock_irqsave_rcu_node(rnp, flags); /* Enforce GP memory-order guarantee. */
 	rdp->rcu_ofl_gp_seq = READ_ONCE(rcu_state.gp_seq);
@@ -4123,6 +4131,8 @@ void rcu_report_dead(unsigned int cpu)
 	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext & ~mask);
 	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 	raw_spin_unlock(&rcu_state.ofl_lock);
+	WRITE_ONCE(rdp->ofl_seq, rdp->ofl_seq + 1);
+	WARN_ON_ONCE(rdp->ofl_seq & 0x1);
 
 	rdp->cpu_started = false;
 }
diff --git a/kernel/rcu/tree.h b/kernel/rcu/tree.h
index 805c9eb..bf0198d 100644
--- a/kernel/rcu/tree.h
+++ b/kernel/rcu/tree.h
@@ -250,6 +250,7 @@ struct rcu_data {
 	unsigned long rcu_onl_gp_seq;	/* ->gp_seq at last online. */
 	short rcu_onl_gp_flags;		/* ->gp_flags at last online. */
 	unsigned long last_fqs_resched;	/* Time of last rcu_resched(). */
+	unsigned long ofl_seq;		/* CPU-hotplug operation sequence count. */
 
 	int cpu;
 };
