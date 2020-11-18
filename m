Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36CE2B887E
	for <lists+linux-next@lfdr.de>; Thu, 19 Nov 2020 00:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgKRXkv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 18:40:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:37446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbgKRXkv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 18:40:51 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2B97246BB;
        Wed, 18 Nov 2020 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605742850;
        bh=MsXP8nm3E8l+AxH6LgH+wki/3VS9AdfiG2J9du54wQo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=El9ESa5IWPEGghx4srj3PQcVyadsJwARcoGkGBiDHHQU7LDF3agxnMjNpDi/tlvVw
         VMOh8p951iSG7WybJpW8JDGISkPMZrfXKU4WshhRNKitzSSg2GwDPNcY2jdMv1PAKV
         hpyTyMYbv++XG3MVIREQJIPLc6BrxU0pEVhAEGKw=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 7C3A53522614; Wed, 18 Nov 2020 15:40:49 -0800 (PST)
Date:   Wed, 18 Nov 2020 15:40:49 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20201118234049.GA3254@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200917132652.738c4cc2@canb.auug.org.au>
 <20200917180005.GM29330@paulmck-ThinkPad-P72>
 <20200928075729.GC2611@hirez.programming.kicks-ass.net>
 <20200928173313.GP29330@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928173313.GP29330@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 28, 2020 at 10:33:13AM -0700, Paul E. McKenney wrote:
> On Mon, Sep 28, 2020 at 09:57:29AM +0200, Peter Zijlstra wrote:
> > On Thu, Sep 17, 2020 at 11:00:05AM -0700, Paul E. McKenney wrote:
> > > On Thu, Sep 17, 2020 at 01:26:52PM +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > Commit
> > > > 
> > > >   903c5302fa2d ("sched/core: Allow try_invoke_on_locked_down_task() with irqs disabled")
> > > > 
> > > > is missing a Signed-off-by from its author and committer.
> > > > 
> > > > I didn't complain about this when it was first present because I figured
> > > > it was just a debugging commit that would be removed quickly.  However,
> > > > there are now quite a few follow up commits ...
> > > 
> > > Without Peter's Signed-off-by, I clearly won't be submitting it to the
> > > upcoming merge window.
> > > 
> > > Peter, this is now quite close to your original patch.  May I please
> > > add your Signed-off-by?
> > 
> > Sure!
> 
> Much appreciated!!!
> 
> But I already replaced that commit with one that moves the call to
> try_invoke_on_locked_down_task() an interrupts-enabled region of code.
> Which is probably what I should have done to start with...  :-/

Except that Marco Elver is making that fail, so I am resuscitating your
patch with your Signed-off-by, as shown below.

So once again, much appreciated!!!

							Thanx, Paul

------------------------------------------------------------------------

commit 444ef3bbd0f243b912fdfd51f326704f8ee872bf
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Sat Aug 29 10:22:24 2020 -0700

    sched/core: Allow try_invoke_on_locked_down_task() with irqs disabled
    
    The try_invoke_on_locked_down_task() function currently requires
    that interrupts be enabled, but it is called with interrupts
    disabled from rcu_print_task_stall(), resulting in an "IRQs not
    enabled as expected" diagnostic.  This commit therefore updates
    try_invoke_on_locked_down_task() to use raw_spin_lock_irqsave() instead
    of raw_spin_lock_irq(), thus allowing use from either context.
    
    Link: https://lore.kernel.org/lkml/000000000000903d5805ab908fc4@google.com/
    Link: https://lore.kernel.org/lkml/20200928075729.GC2611@hirez.programming.kicks-ass.net/
    Reported-by: syzbot+cb3b69ae80afd6535b0e@syzkaller.appspotmail.com
    Signed-off-by: Peter Zijlstra <peterz@infradead.org>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e172f2d..09ef5cf 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2984,7 +2984,7 @@ try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 
 /**
  * try_invoke_on_locked_down_task - Invoke a function on task in fixed state
- * @p: Process for which the function is to be invoked.
+ * @p: Process for which the function is to be invoked, can be @current.
  * @func: Function to invoke.
  * @arg: Argument to function.
  *
@@ -3002,12 +3002,11 @@ try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
  */
 bool try_invoke_on_locked_down_task(struct task_struct *p, bool (*func)(struct task_struct *t, void *arg), void *arg)
 {
-	bool ret = false;
 	struct rq_flags rf;
+	bool ret = false;
 	struct rq *rq;
 
-	lockdep_assert_irqs_enabled();
-	raw_spin_lock_irq(&p->pi_lock);
+	raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
 	if (p->on_rq) {
 		rq = __task_rq_lock(p, &rf);
 		if (task_rq(p) == rq)
@@ -3024,7 +3023,7 @@ bool try_invoke_on_locked_down_task(struct task_struct *p, bool (*func)(struct t
 				ret = func(p, arg);
 		}
 	}
-	raw_spin_unlock_irq(&p->pi_lock);
+	raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
 	return ret;
 }
 
