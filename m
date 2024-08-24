Return-Path: <linux-next+bounces-3405-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE9C95DC54
	for <lists+linux-next@lfdr.de>; Sat, 24 Aug 2024 08:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08D20B2220D
	for <lists+linux-next@lfdr.de>; Sat, 24 Aug 2024 06:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D073515381A;
	Sat, 24 Aug 2024 06:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fqEODbSV"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F8C14EC56;
	Sat, 24 Aug 2024 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724482490; cv=none; b=EBRhaNIyp8tDy1iGs4jxuyAFSZG6FyNIqdsLqlre91oJAjrRpQCVHPkg0UQ/WsyL7sMRQ2ygZNdw7MWxei3K17L+zaLbHMPS2EFfmJvvj2+UT1auhTslkouFwK3lzHZof0EFsFOKvrZSPpdW06YktgsIc2q6lYWWqT9vT0ciX/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724482490; c=relaxed/simple;
	bh=Hu79NiLmW2keUvgZqPBx+KTdHUvNPxVQpRJJSl1qYZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWjDnVTsnfcDwF9AbH4BtKkZ61vfO4fCy4D5dI6znKBFb1/yns9n1c4RqyzBnpbg8OvJsgDQoFZ2ev5zwCgsMFPIjh9K8LQ535xF9mY4xVzWg9ad87oKXuUyv6Ct+hsu8VFUyUUiBrpiWI+js9KFWoN89bKhhlAsP8pL2E7ecmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fqEODbSV; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WlDk9uLII9rhPaIUdJub/iW1/Ma5RpE/nIMr/Yo/b8Q=; b=fqEODbSVO0N0YmWq1P2sTqKDOO
	19hFYgdn/M9MIxEK56wZFEC8acl7QV1lNsP/jtGozvWmpPpwJOoM4G2ANdaGJ8MwMDyFBfJSulxoh
	Do1DYdmmjg2RRkosIqFi62RkRErCeG/nXkC/0L6EM1DhwvwIVBLxZ88Sf+45T+bqYhiHXlQfJZ/mH
	HHwO21GUrdExgy4kXyv9uZknLnp0SYuzB/k0Eeozhm7eDlVLHIVnQlalQLUS+yHAV7FVwuvBTwez3
	Qf+1jR5p3V7YGviywUJpuzEUmWiGSXOSuEFcfPFFWV1/f1wgTeeY9dggilJcCdExmEZkIwQAWyCa5
	IKDIYLkA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shkfT-0000000AH6k-1Rd7;
	Sat, 24 Aug 2024 06:54:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6D908300642; Sat, 24 Aug 2024 08:54:34 +0200 (CEST)
Date: Sat, 24 Aug 2024 08:54:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20240824065434.GA26474@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <eb929d94-6f0b-44a9-b408-feb81b228ff0@paulmck-laptop>
 <a122efbe-fd81-471d-89b7-e9257bf3ce49@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a122efbe-fd81-471d-89b7-e9257bf3ce49@paulmck-laptop>

On Fri, Aug 23, 2024 at 02:51:03PM -0700, Paul E. McKenney wrote:

> > > Does the below help any? That's more or less what it was before Valentin
> > > asked me why it was weird like that :-)
> > > 
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 6be618110885..5757dd50b02f 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -13107,7 +13107,6 @@ static void switched_from_fair(struct rq *rq, struct task_struct *p)
> > >  	 * and we cannot use DEQUEUE_DELAYED.
> > >  	 */
> > >  	if (p->se.sched_delayed) {
> > > -		dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP);
> > >  		p->se.sched_delayed = 0;
> > >  		p->se.rel_deadline = 0;
> > >  		if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
> > 
> > Removing that line from 2e0199df252a still gets me the complaint about
> > __SCHED_FEAT_DELAY_ZERO being undefined.  To my naive eyes, it appears
> > that this commit:
> > 
> > 54a58a787791 ("sched/fair: Implement DELAY_ZERO")
> > 
> > Need to be placed before 2e0199df252a.  Of course, when I try it, I
> > get conflicts.  So I took just this hunk:
> > 
> > ------------------------------------------------------------------------
> > 
> > diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> > index 97fb2d4920898..6c5f5424614d4 100644
> > --- a/kernel/sched/features.h
> > +++ b/kernel/sched/features.h
> > @@ -28,6 +28,11 @@ SCHED_FEAT(NEXT_BUDDY, false)
> >   */
> >  SCHED_FEAT(CACHE_HOT_BUDDY, true)
> >  
> > +/*
> > + * DELAY_ZERO clips the lag on dequeue (or wakeup) to 0.
> > + */
> > +SCHED_FEAT(DELAY_ZERO, true)
> > +
> >  /*
> >   * Allow wakeup-time preemption of the current task:
> >   */
> > 
> > ------------------------------------------------------------------------
> > 
> > That makes the build error go away.  Maybe even legitimately?

Yep.

> > Just to pick on the easy one, I took a look at the complaint about
> > cfs_rq being unused and the complaint about __SCHED_FEAT_DELAY_ZERO
> > being undefined.  This variable was added here:
> > 
> > 781773e3b680 ("sched/fair: Implement ENQUEUE_DELAYED")
> > 
> > And its first use was added here:
> > 
> > 54a58a787791 ("sched/fair: Implement DELAY_ZERO")
> > 
> > Which matches my experience.
> > 
> > So left to myself, I would run on these commits with the above hunk:
> > 
> > 54a58a7877916 sched/fair: Implement DELAY_ZERO
> > 152e11f6df293 sched/fair: Implement delayed dequeue
> > e1459a50ba318 sched: Teach dequeue_task() about special task states
> > a1c446611e31c sched,freezer: Mark TASK_FROZEN special
> > 781773e3b6803 sched/fair: Implement ENQUEUE_DELAYED
> > f12e148892ede sched/fair: Prepare pick_next_task() for delayed dequeue
> > 2e0199df252a5 sched/fair: Prepare exit/cleanup paths for delayed_dequeue
> > e28b5f8bda017 sched/fair: Assert {set_next,put_prev}_entity() are properly balanced
> > 
> > And where needed, remove the unused cfs_rq local variable.
> > 
> > Would that likely work?

Sounds about right.

> > 
> > In the meantime, SIGFOOD!
> 
> Hearing no objections...

Yeah, sorry, I'm on holidays with the kids and not glued to the screen
as per usual :-)

> Given two patches each of which might or might not need to be applied to a
> given commit, I chose to rebase as follows:
> 
> e28b5f8bda017 sched/fair: Assert {set_next,put_prev}_entity() are properly balanced
> 8aed87410a695 EXP sched/fair: Provide DELAY_ZERO definition
> 	I took this from 54a58a7877916 sched/fair: Implement DELAY_ZERO.
> 49575c0087bc0 sched/fair: Prepare exit/cleanup paths for delayed_dequeue
> 14c3207fd2456 sched/fair: Prepare pick_next_task() for delayed dequeue
> be567af45dd04 sched/fair: Implement ENQUEUE_DELAYED
> 	I dropped the unused cfs_rq local variable from requeue_delayed_entity()
> ed28f7b3ac3f4 sched,freezer: Mark TASK_FROZEN special
> 48d541847b4a6 sched: Teach dequeue_task() about special task states
> ef3b9c5d038dc sched/fair: Implement delayed dequeue
> 	--- First bad commit with dequeue_rt_stack() failures.
> 876c99c058219 sched/fair: Implement DELAY_ZERO
> 	I added the cfs_rq local variable to requeue_delayed_entity()
> 
> This is on -rcu branch peterz.2024.08.23b.
> 
> I ran 50*TREE05 in a bisection, which converged on be567af45dd04, but only
> one run of the 50 had a complaint, and that was in enqueue_dl_entry(),

Hmm, I have one other report about that. Hasn't made much sense yet --
then again, as per the above mentioned reason, I'm not able to put real
time in atm.

> not the dequeue_rt_stack() that I have been chasing.  I ran three
> additional 50*TREE05 runs on its predecessor (14c3207fd2456) with no
> failures.  I then ran 50*TREE03 on each of ed28f7b3ac3f4, 48d541847b4a6,
> and ef3b9c5d038dc.  Only this last ("ef3b9c5d038dc sched/fair: Implement
> delayed dequeue") had failure, and they were all the dequeue_rt_stack()
> failures I am chasing.  One of the runs also hung.

I'm a little confused now though; this is with the dequeue removed from
switched_from_fair() ?

Looking at your tree, 49575c0087bc0 still has that dequeue. Does the
dequeue_rt_stack() issue go away with that line removed?

