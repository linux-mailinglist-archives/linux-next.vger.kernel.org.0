Return-Path: <linux-next+bounces-3407-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC5795E0B9
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2024 04:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39EB282166
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2024 02:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286B71FA5;
	Sun, 25 Aug 2024 02:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkZrhNhp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01E7370;
	Sun, 25 Aug 2024 02:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724551822; cv=none; b=Zzqf3Pq8Dqx+8sZt56cEASJh2r4flbl1Czq6NZs/y7hp48tBUK/1sP3ZS+txKGjHB4j3mFcNdyoCuXyKPd0B+Jo9/dG70z9Qo7HQ1EybL3oDxkFuYIMNU9ekm2N/IiLPg5oZWCrKbVXKxFQd5DU/vPGQJPT5U5ZVmZkR6eeylZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724551822; c=relaxed/simple;
	bh=+9ixZycKsKF0/SLEyMWTyfqxSHtOUsiNNnGzKxUX460=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XB8QCPmzmFxFR9ZksbhEwa5pjVR8jNWJIPQPNCIE/oo9baMXb7MBURW9sqV+tqvFGRciL5CGkIYrZvexH244i+QpABgvfIhBnbWTetrbdCzgQNbqEztv88fgRtQ7pYZKXzut/0aw5R0BuemTJFZaYHV3qOa/4ycjI0AEKDzmAks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkZrhNhp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843A7C32781;
	Sun, 25 Aug 2024 02:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724551821;
	bh=+9ixZycKsKF0/SLEyMWTyfqxSHtOUsiNNnGzKxUX460=;
	h=Date:From:To:Subject:Reply-To:References:In-Reply-To:From;
	b=TkZrhNhpMHEVgt+BfHoJAWbuRO3w3h3u9qmu8vwSRIOzIKTu5dHdssPO+p0UzSDZZ
	 hSIhif9sCNtQ3+M3bzZVkp3hwJqwKlTlCFz4S51Pnx6+SrbXU9134JLvysmyBJce0i
	 unOhaF96Y1VKNbimPBGOyQ/ugvIddFhudn8azBHFbInrUTkfMgIYQHilsoyvALmekZ
	 rBsPcYlQCTqzdKsJ4zn+1i+36MuwMm9gOed953omyhrLViJz3KFLTSOXFd5Ad/IKvH
	 YOc8w2uRbREIYW1HaFJfOwupb7iLM0Q6RtcujkqaZVFBW4kuLyGSBkjh1EIJ6sAuEb
	 8GRbtjYhKDXjA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2C9DDCE0D9B; Sat, 24 Aug 2024 19:10:21 -0700 (PDT)
Date: Sat, 24 Aug 2024 19:10:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, vschneid@redhat.com,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <5a90aec0-9959-4bac-a479-d9c3c4dedd69@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <eb929d94-6f0b-44a9-b408-feb81b228ff0@paulmck-laptop>
 <a122efbe-fd81-471d-89b7-e9257bf3ce49@paulmck-laptop>
 <20240824065434.GA26474@noisy.programming.kicks-ass.net>
 <1a1009b9-615f-44fc-8ef6-da3bbc773012@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a1009b9-615f-44fc-8ef6-da3bbc773012@paulmck-laptop>

On Sat, Aug 24, 2024 at 08:26:57AM -0700, Paul E. McKenney wrote:
> On Sat, Aug 24, 2024 at 08:54:34AM +0200, Peter Zijlstra wrote:
> > On Fri, Aug 23, 2024 at 02:51:03PM -0700, Paul E. McKenney wrote:
> > 
> > > > > Does the below help any? That's more or less what it was before Valentin
> > > > > asked me why it was weird like that :-)
> > > > > 
> > > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > > index 6be618110885..5757dd50b02f 100644
> > > > > --- a/kernel/sched/fair.c
> > > > > +++ b/kernel/sched/fair.c
> > > > > @@ -13107,7 +13107,6 @@ static void switched_from_fair(struct rq *rq, struct task_struct *p)
> > > > >  	 * and we cannot use DEQUEUE_DELAYED.
> > > > >  	 */
> > > > >  	if (p->se.sched_delayed) {
> > > > > -		dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP);
> > > > >  		p->se.sched_delayed = 0;
> > > > >  		p->se.rel_deadline = 0;
> > > > >  		if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
> > > > 
> > > > Removing that line from 2e0199df252a still gets me the complaint about
> > > > __SCHED_FEAT_DELAY_ZERO being undefined.  To my naive eyes, it appears
> > > > that this commit:
> > > > 
> > > > 54a58a787791 ("sched/fair: Implement DELAY_ZERO")
> > > > 
> > > > Need to be placed before 2e0199df252a.  Of course, when I try it, I
> > > > get conflicts.  So I took just this hunk:
> > > > 
> > > > ------------------------------------------------------------------------
> > > > 
> > > > diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> > > > index 97fb2d4920898..6c5f5424614d4 100644
> > > > --- a/kernel/sched/features.h
> > > > +++ b/kernel/sched/features.h
> > > > @@ -28,6 +28,11 @@ SCHED_FEAT(NEXT_BUDDY, false)
> > > >   */
> > > >  SCHED_FEAT(CACHE_HOT_BUDDY, true)
> > > >  
> > > > +/*
> > > > + * DELAY_ZERO clips the lag on dequeue (or wakeup) to 0.
> > > > + */
> > > > +SCHED_FEAT(DELAY_ZERO, true)
> > > > +
> > > >  /*
> > > >   * Allow wakeup-time preemption of the current task:
> > > >   */
> > > > 
> > > > ------------------------------------------------------------------------
> > > > 
> > > > That makes the build error go away.  Maybe even legitimately?
> > 
> > Yep.
> > 
> > > > Just to pick on the easy one, I took a look at the complaint about
> > > > cfs_rq being unused and the complaint about __SCHED_FEAT_DELAY_ZERO
> > > > being undefined.  This variable was added here:
> > > > 
> > > > 781773e3b680 ("sched/fair: Implement ENQUEUE_DELAYED")
> > > > 
> > > > And its first use was added here:
> > > > 
> > > > 54a58a787791 ("sched/fair: Implement DELAY_ZERO")
> > > > 
> > > > Which matches my experience.
> > > > 
> > > > So left to myself, I would run on these commits with the above hunk:
> > > > 
> > > > 54a58a7877916 sched/fair: Implement DELAY_ZERO
> > > > 152e11f6df293 sched/fair: Implement delayed dequeue
> > > > e1459a50ba318 sched: Teach dequeue_task() about special task states
> > > > a1c446611e31c sched,freezer: Mark TASK_FROZEN special
> > > > 781773e3b6803 sched/fair: Implement ENQUEUE_DELAYED
> > > > f12e148892ede sched/fair: Prepare pick_next_task() for delayed dequeue
> > > > 2e0199df252a5 sched/fair: Prepare exit/cleanup paths for delayed_dequeue
> > > > e28b5f8bda017 sched/fair: Assert {set_next,put_prev}_entity() are properly balanced
> > > > 
> > > > And where needed, remove the unused cfs_rq local variable.
> > > > 
> > > > Would that likely work?
> > 
> > Sounds about right.
> > 
> > > > 
> > > > In the meantime, SIGFOOD!
> > > 
> > > Hearing no objections...
> > 
> > Yeah, sorry, I'm on holidays with the kids and not glued to the screen
> > as per usual :-)
> 
> No worries, and have a great holiday!!!
> 
> > > Given two patches each of which might or might not need to be applied to a
> > > given commit, I chose to rebase as follows:
> > > 
> > > e28b5f8bda017 sched/fair: Assert {set_next,put_prev}_entity() are properly balanced
> > > 8aed87410a695 EXP sched/fair: Provide DELAY_ZERO definition
> > > 	I took this from 54a58a7877916 sched/fair: Implement DELAY_ZERO.
> > > 49575c0087bc0 sched/fair: Prepare exit/cleanup paths for delayed_dequeue
> > > 14c3207fd2456 sched/fair: Prepare pick_next_task() for delayed dequeue
> > > be567af45dd04 sched/fair: Implement ENQUEUE_DELAYED
> > > 	I dropped the unused cfs_rq local variable from requeue_delayed_entity()
> > > ed28f7b3ac3f4 sched,freezer: Mark TASK_FROZEN special
> > > 48d541847b4a6 sched: Teach dequeue_task() about special task states
> > > ef3b9c5d038dc sched/fair: Implement delayed dequeue
> > > 	--- First bad commit with dequeue_rt_stack() failures.
> > > 876c99c058219 sched/fair: Implement DELAY_ZERO
> > > 	I added the cfs_rq local variable to requeue_delayed_entity()
> > > 
> > > This is on -rcu branch peterz.2024.08.23b.
> > > 
> > > I ran 50*TREE05 in a bisection, which converged on be567af45dd04, but only
> > > one run of the 50 had a complaint, and that was in enqueue_dl_entry(),
> > 
> > Hmm, I have one other report about that. Hasn't made much sense yet --
> > then again, as per the above mentioned reason, I'm not able to put real
> > time in atm.
> 
> I ran 1000*TREE03 on that same commit, no failures.  Just started
> 5000*TREE03, and will let you know what happens.  This will likely take
> better part of a day to complete.
> 
> > > not the dequeue_rt_stack() that I have been chasing.  I ran three
> > > additional 50*TREE05 runs on its predecessor (14c3207fd2456) with no
> > > failures.  I then ran 50*TREE03 on each of ed28f7b3ac3f4, 48d541847b4a6,
> > > and ef3b9c5d038dc.  Only this last ("ef3b9c5d038dc sched/fair: Implement
> > > delayed dequeue") had failure, and they were all the dequeue_rt_stack()
> > > failures I am chasing.  One of the runs also hung.
> > 
> > I'm a little confused now though; this is with the dequeue removed from
> > switched_from_fair() ?
> 
> Ah!!!  I thought that change was for the build issue, which I will
> admit puzzled me a bit.
> 
> > Looking at your tree, 49575c0087bc0 still has that dequeue. Does the
> > dequeue_rt_stack() issue go away with that line removed?
> 
> I will try it and let you know.  Thank you for reminding me!

Preliminary results show that removing the dequeue from that commit or
just from next-20240823 at the very least greatly reduces the probability
of the problem occurring.  I am doing an overnight run with that dequeue
removed from next-20240823 and will let you know how it goes.

							Thanx, Paul

