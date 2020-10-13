Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AFD28D1FD
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 18:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731600AbgJMQP5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 12:15:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:48352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731582AbgJMQP5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 12:15:57 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7AD9A2526E;
        Tue, 13 Oct 2020 16:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602605756;
        bh=2FeyDJsEWNGrdFZRgLBvWdBX2L626cX0ipXoxPIOuus=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SGB0+WsmLKBc7a6Pkn4OD1YRZ1e7DCtYTqczdhllGoZo84ACimkEWp1XU23hk66wc
         ABB+z0tfvmQfFoWUWCfmz+dBpoh2LNwkFQ05Y3UcGS8IMhBp2H0R526FRvfGHe1hhH
         PXXdSc9udfKoUi09mJDK4cC2a2UWCTjmuu3sod9s=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 111D73522A36; Tue, 13 Oct 2020 09:15:56 -0700 (PDT)
Date:   Tue, 13 Oct 2020 09:15:56 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201013161556.GM3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201012212812.GH3249@paulmck-ThinkPad-P72>
 <20201013103406.GY2628@hirez.programming.kicks-ass.net>
 <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 13, 2020 at 12:44:50PM +0200, Peter Zijlstra wrote:
> On Tue, Oct 13, 2020 at 12:34:06PM +0200, Peter Zijlstra wrote:
> > On Mon, Oct 12, 2020 at 02:28:12PM -0700, Paul E. McKenney wrote:
> > > It is certainly an accident waiting to happen.  Would something like
> > > the following make sense?
> > 
> > Sadly no.

Hey, I was hoping!  ;-)

> > > ------------------------------------------------------------------------
> > > 
> > > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > > index bfd38f2..52a63bc 100644
> > > --- a/kernel/rcu/tree.c
> > > +++ b/kernel/rcu/tree.c
> > > @@ -4067,6 +4067,7 @@ void rcu_cpu_starting(unsigned int cpu)
> > >  
> > >  	rnp = rdp->mynode;
> > >  	mask = rdp->grpmask;
> > > +	lockdep_off();
> > >  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
> > >  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
> > >  	newcpu = !(rnp->expmaskinitnext & mask);
> > > @@ -4086,6 +4087,7 @@ void rcu_cpu_starting(unsigned int cpu)
> > >  	} else {
> > >  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> > >  	}
> > > +	lockdep_on();
> > >  	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
> > >  }
> > 
> > This will just shut it up, but will not fix the actual problem of that
> > spin-lock ending up in trace_lock_acquire() which relies on RCU which
> > isn't looking.
> > 
> > What we need here is to supress tracing not lockdep. Let me consider.

OK, I certainly didn't think in those terms.

> We appear to have a similar problem with rcu_report_dead(), it's
> raw_spin_unlock()s can end up in trace_lock_release() while we just
> killed RCU.

In theory, rcu_report_dead() is just fine.  The reason is that a new
grace period that is ignoring the outgoing CPU cannot start until after:

1.	This CPU releases the leaf rcu_node ->lock -and-

2.	The grace-period kthread acquires this same lock.
	Multiple times.

In practice, too bad about those diagnostics!  :-(

So good catch!!!

							Thanx, Paul
