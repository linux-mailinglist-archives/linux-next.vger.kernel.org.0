Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB4B29DF7A
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 02:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403950AbgJ2BBk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 21:01:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731506AbgJ1WRY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:24 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 943282244C;
        Wed, 28 Oct 2020 03:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603854090;
        bh=CYqqIQeLVQ2GDg8Qk4O7/yPF87bpo8HOJdgeKmVSG7M=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=J34e3ugmDw0+RgNgHi7V7cZnahdwYN5VL3pKtKMK88THY++wGQRPmSL5RXWpre6+W
         dWeTJBj1I+WlGeDc66wKb3HdjZ9gD2JJuoYHopHiwAwVcrUqKcuCX5kGYHh509xQ1f
         fKaxChn52bKktbUlgXICpAo1sIW2WgfYZSTyDnaU=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 4F3683521849; Tue, 27 Oct 2020 20:01:30 -0700 (PDT)
Date:   Tue, 27 Oct 2020 20:01:30 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Qian Cai <cai@redhat.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201028030130.GB3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <1db80eb9676124836809421e85e1aa782c269a80.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1db80eb9676124836809421e85e1aa782c269a80.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 27, 2020 at 03:31:41PM -0400, Qian Cai wrote:
> On Mon, 2020-10-12 at 11:11 +0800, Boqun Feng wrote:
> > Hi,
> > 
> > On Fri, Oct 09, 2020 at 09:41:24AM -0400, Qian Cai wrote:
> > > On Fri, 2020-10-09 at 07:58 +0000, tip-bot2 for Peter Zijlstra wrote:
> > > > The following commit has been merged into the locking/core branch of tip:
> > > > 
> > > > Commit-ID:     4d004099a668c41522242aa146a38cc4eb59cb1e
> > > > Gitweb:        
> > > > https://git.kernel.org/tip/4d004099a668c41522242aa146a38cc4eb59cb1e
> > > > Author:        Peter Zijlstra <peterz@infradead.org>
> > > > AuthorDate:    Fri, 02 Oct 2020 11:04:21 +02:00
> > > > Committer:     Ingo Molnar <mingo@kernel.org>
> > > > CommitterDate: Fri, 09 Oct 2020 08:53:30 +02:00
> > > > 
> > > > lockdep: Fix lockdep recursion
> > > > 
> > > > Steve reported that lockdep_assert*irq*(), when nested inside lockdep
> > > > itself, will trigger a false-positive.
> > > > 
> > > > One example is the stack-trace code, as called from inside lockdep,
> > > > triggering tracing, which in turn calls RCU, which then uses
> > > > lockdep_assert_irqs_disabled().
> > > > 
> > > > Fixes: a21ee6055c30 ("lockdep: Change hardirq{s_enabled,_context} to per-
> > > > cpu
> > > > variables")
> > > > Reported-by: Steven Rostedt <rostedt@goodmis.org>
> > > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > > 
> > > Reverting this linux-next commit fixed booting RCU-list warnings everywhere.
> > > 
> > 
> > I think this happened because in this commit debug_lockdep_rcu_enabled()
> > didn't adopt to the change that made lockdep_recursion a percpu
> > variable?
> > 
> > Qian, mind to try the following?
> 
> Boqun, Paul, may I ask what's the latest with the fixes? I must admit that I got
> lost in this thread, but I remember that the patch from Boqun below at least
> silence quite some of those warnings if not all. The problem is that some of
> those warnings would trigger a lockdep circular locks warning due to printk()
> with some locks held which in turn disabling the lockdep, makes our test runs
> inefficient.

If I have the right email thread associated with the right fixes, these
commits in -rcu should be what you are looking for:

73b658b6b7d5 ("rcu: Prevent lockdep-RCU splats on lock acquisition/release")
626b79aa935a ("x86/smpboot:  Move rcu_cpu_starting() earlier")

And maybe this one as well:

3a6f638cb95b ("rcu,ftrace: Fix ftrace recursion")

Please let me know if these commits do not fix things.

							Thanx, Paul

> > Although, arguably the problem still exists, i.e. we still have an RCU
> > read-side critical section inside lock_acquire(), which may be called on
> > a yet-to-online CPU, which RCU doesn't watch. I think this used to be OK
> > because we don't "free" anything from lockdep, IOW, there is no
> > synchronize_rcu() or call_rcu() that _needs_ to wait for the RCU
> > read-side critical sections inside lockdep. But now we lock class
> > recycling, so it might be a problem.
> > 
> > That said, currently validate_chain() and lock class recycling are
> > mutually excluded via graph_lock, so we are safe for this one ;-)
> > 
> > ----------->8
> > diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
> > index 39334d2d2b37..35d9bab65b75 100644
> > --- a/kernel/rcu/update.c
> > +++ b/kernel/rcu/update.c
> > @@ -275,8 +275,8 @@ EXPORT_SYMBOL_GPL(rcu_callback_map);
> >  
> >  noinstr int notrace debug_lockdep_rcu_enabled(void)
> >  {
> > -	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE && debug_locks &&
> > -	       current->lockdep_recursion == 0;
> > +	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE &&
> > +	       __lockdep_enabled;
> >  }
> >  EXPORT_SYMBOL_GPL(debug_lockdep_rcu_enabled);
> 
> 
