Return-Path: <linux-next+bounces-3408-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D795E4F1
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2024 21:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17ED41F22863
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2024 19:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F1F42AA0;
	Sun, 25 Aug 2024 19:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhYsF8P8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4CB3207;
	Sun, 25 Aug 2024 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724614611; cv=none; b=UAUdxILkh4MMVKWQU4rJcR1iSev91Fi8gBdqu5KKIpvYiob+PK6ENh6v0XiNYcYRX7OLTcQQYFiZUggggkKvNkozYCOwFBANwC0qWEQXe5gFnjJ6TQWZ0UcgZZxtosTmN5iOiIbWJgmDCycZtqPkC7hecTqV309o3I2+fMD7y8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724614611; c=relaxed/simple;
	bh=3j6GWV9iQp70RTJUvuuxizRoIPhQrRZTXKd2ZMf4lC8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7+v9i7PyXDopk8IKEgnJYnOtw1nfbqsKyzeEgFASfCV/pF3Ih9AXV8bZjbdGR03yDRxwKwMGYp8BE92H0yi0r+auUvXclgGv9XgSL0XVG+iZUwVO0RrnLUpZRx0MAhbltBIk6wPtndNx7Wh6eObjAcnLJevc9CsFbWgkEoDS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhYsF8P8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950ECC4AF11;
	Sun, 25 Aug 2024 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724614610;
	bh=3j6GWV9iQp70RTJUvuuxizRoIPhQrRZTXKd2ZMf4lC8=;
	h=Date:From:To:Subject:Reply-To:References:In-Reply-To:From;
	b=fhYsF8P8OCT28xzfq2/1DjA9fwF/DeRErFeRKJ8yOBYMU1bKt50+nqmugTgErVhgq
	 aS4uxTRMyrdrO/gtSripgjs55vYHzaqm0VsNOqUIqQg5QebSf68roiInBjKSSUAdqo
	 ilvEHCxxbeKQssABeEyuCa5D/sxRavlB4WgQYPS4r5x3jyAhsrWz0leEqlj8+nXUWe
	 eS/IfrN9U0qtHqz6qYrp174YI30INWhQBsEQxU4V5zg2B9TGlnqKWLIclP9rXy0xVN
	 YVsUfyr93NPOlvBE05utOlDv5cfroKuz0ztdmqtmssnTC8zA31XViDk6jluxQShB26
	 l8IJJU+No247Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3B512CE0D99; Sun, 25 Aug 2024 12:36:50 -0700 (PDT)
Date: Sun, 25 Aug 2024 12:36:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, vschneid@redhat.com,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <667bea49-f772-4093-93cd-c590b666330b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <eb929d94-6f0b-44a9-b408-feb81b228ff0@paulmck-laptop>
 <a122efbe-fd81-471d-89b7-e9257bf3ce49@paulmck-laptop>
 <20240824065434.GA26474@noisy.programming.kicks-ass.net>
 <1a1009b9-615f-44fc-8ef6-da3bbc773012@paulmck-laptop>
 <5a90aec0-9959-4bac-a479-d9c3c4dedd69@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a90aec0-9959-4bac-a479-d9c3c4dedd69@paulmck-laptop>

On Sat, Aug 24, 2024 at 07:10:21PM -0700, Paul E. McKenney wrote:
> On Sat, Aug 24, 2024 at 08:26:57AM -0700, Paul E. McKenney wrote:
> > On Sat, Aug 24, 2024 at 08:54:34AM +0200, Peter Zijlstra wrote:
> > > On Fri, Aug 23, 2024 at 02:51:03PM -0700, Paul E. McKenney wrote:
> > > 
> > > > > > Does the below help any? That's more or less what it was before Valentin
> > > > > > asked me why it was weird like that :-)
> > > > > > 
> > > > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > > > index 6be618110885..5757dd50b02f 100644
> > > > > > --- a/kernel/sched/fair.c
> > > > > > +++ b/kernel/sched/fair.c
> > > > > > @@ -13107,7 +13107,6 @@ static void switched_from_fair(struct rq *rq, struct task_struct *p)
> > > > > >  	 * and we cannot use DEQUEUE_DELAYED.
> > > > > >  	 */
> > > > > >  	if (p->se.sched_delayed) {
> > > > > > -		dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP);
> > > > > >  		p->se.sched_delayed = 0;
> > > > > >  		p->se.rel_deadline = 0;
> > > > > >  		if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
> > > > > 
> > > > > Removing that line from 2e0199df252a still gets me the complaint about
> > > > > __SCHED_FEAT_DELAY_ZERO being undefined.  To my naive eyes, it appears
> > > > > that this commit:
> > > > > 
> > > > > 54a58a787791 ("sched/fair: Implement DELAY_ZERO")
> > > > > 
> > > > > Need to be placed before 2e0199df252a.  Of course, when I try it, I
> > > > > get conflicts.  So I took just this hunk:
> > > > > 
> > > > > ------------------------------------------------------------------------
> > > > > 
> > > > > diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> > > > > index 97fb2d4920898..6c5f5424614d4 100644
> > > > > --- a/kernel/sched/features.h
> > > > > +++ b/kernel/sched/features.h
> > > > > @@ -28,6 +28,11 @@ SCHED_FEAT(NEXT_BUDDY, false)
> > > > >   */
> > > > >  SCHED_FEAT(CACHE_HOT_BUDDY, true)
> > > > >  
> > > > > +/*
> > > > > + * DELAY_ZERO clips the lag on dequeue (or wakeup) to 0.
> > > > > + */
> > > > > +SCHED_FEAT(DELAY_ZERO, true)
> > > > > +
> > > > >  /*
> > > > >   * Allow wakeup-time preemption of the current task:
> > > > >   */
> > > > > 
> > > > > ------------------------------------------------------------------------
> > > > > 
> > > > > That makes the build error go away.  Maybe even legitimately?
> > > 
> > > Yep.
> > > 
> > > > > Just to pick on the easy one, I took a look at the complaint about
> > > > > cfs_rq being unused and the complaint about __SCHED_FEAT_DELAY_ZERO
> > > > > being undefined.  This variable was added here:
> > > > > 
> > > > > 781773e3b680 ("sched/fair: Implement ENQUEUE_DELAYED")
> > > > > 
> > > > > And its first use was added here:
> > > > > 
> > > > > 54a58a787791 ("sched/fair: Implement DELAY_ZERO")
> > > > > 
> > > > > Which matches my experience.
> > > > > 
> > > > > So left to myself, I would run on these commits with the above hunk:
> > > > > 
> > > > > 54a58a7877916 sched/fair: Implement DELAY_ZERO
> > > > > 152e11f6df293 sched/fair: Implement delayed dequeue
> > > > > e1459a50ba318 sched: Teach dequeue_task() about special task states
> > > > > a1c446611e31c sched,freezer: Mark TASK_FROZEN special
> > > > > 781773e3b6803 sched/fair: Implement ENQUEUE_DELAYED
> > > > > f12e148892ede sched/fair: Prepare pick_next_task() for delayed dequeue
> > > > > 2e0199df252a5 sched/fair: Prepare exit/cleanup paths for delayed_dequeue
> > > > > e28b5f8bda017 sched/fair: Assert {set_next,put_prev}_entity() are properly balanced
> > > > > 
> > > > > And where needed, remove the unused cfs_rq local variable.
> > > > > 
> > > > > Would that likely work?
> > > 
> > > Sounds about right.
> > > 
> > > > > 
> > > > > In the meantime, SIGFOOD!
> > > > 
> > > > Hearing no objections...
> > > 
> > > Yeah, sorry, I'm on holidays with the kids and not glued to the screen
> > > as per usual :-)
> > 
> > No worries, and have a great holiday!!!
> > 
> > > > Given two patches each of which might or might not need to be applied to a
> > > > given commit, I chose to rebase as follows:
> > > > 
> > > > e28b5f8bda017 sched/fair: Assert {set_next,put_prev}_entity() are properly balanced
> > > > 8aed87410a695 EXP sched/fair: Provide DELAY_ZERO definition
> > > > 	I took this from 54a58a7877916 sched/fair: Implement DELAY_ZERO.
> > > > 49575c0087bc0 sched/fair: Prepare exit/cleanup paths for delayed_dequeue
> > > > 14c3207fd2456 sched/fair: Prepare pick_next_task() for delayed dequeue
> > > > be567af45dd04 sched/fair: Implement ENQUEUE_DELAYED
> > > > 	I dropped the unused cfs_rq local variable from requeue_delayed_entity()
> > > > ed28f7b3ac3f4 sched,freezer: Mark TASK_FROZEN special
> > > > 48d541847b4a6 sched: Teach dequeue_task() about special task states
> > > > ef3b9c5d038dc sched/fair: Implement delayed dequeue
> > > > 	--- First bad commit with dequeue_rt_stack() failures.
> > > > 876c99c058219 sched/fair: Implement DELAY_ZERO
> > > > 	I added the cfs_rq local variable to requeue_delayed_entity()
> > > > 
> > > > This is on -rcu branch peterz.2024.08.23b.
> > > > 
> > > > I ran 50*TREE05 in a bisection, which converged on be567af45dd04, but only
> > > > one run of the 50 had a complaint, and that was in enqueue_dl_entry(),
> > > 
> > > Hmm, I have one other report about that. Hasn't made much sense yet --
> > > then again, as per the above mentioned reason, I'm not able to put real
> > > time in atm.
> > 
> > I ran 1000*TREE03 on that same commit, no failures.  Just started
> > 5000*TREE03, and will let you know what happens.  This will likely take
> > better part of a day to complete.
> > 
> > > > not the dequeue_rt_stack() that I have been chasing.  I ran three
> > > > additional 50*TREE05 runs on its predecessor (14c3207fd2456) with no
> > > > failures.  I then ran 50*TREE03 on each of ed28f7b3ac3f4, 48d541847b4a6,
> > > > and ef3b9c5d038dc.  Only this last ("ef3b9c5d038dc sched/fair: Implement
> > > > delayed dequeue") had failure, and they were all the dequeue_rt_stack()
> > > > failures I am chasing.  One of the runs also hung.
> > > 
> > > I'm a little confused now though; this is with the dequeue removed from
> > > switched_from_fair() ?
> > 
> > Ah!!!  I thought that change was for the build issue, which I will
> > admit puzzled me a bit.
> > 
> > > Looking at your tree, 49575c0087bc0 still has that dequeue. Does the
> > > dequeue_rt_stack() issue go away with that line removed?
> > 
> > I will try it and let you know.  Thank you for reminding me!
> 
> Preliminary results show that removing the dequeue from that commit or
> just from next-20240823 at the very least greatly reduces the probability
> of the problem occurring.  I am doing an overnight run with that dequeue
> removed from next-20240823 and will let you know how it goes.

No dequeue_rt_stack() or enqueue_dl_entry() issues in 5000*TREE03 runs, so
I think we can declare the first to be fixed and the second to be rather
low probability.  I also searched for "enqueue_dl_entry" in my employer's
full fleet's worth of console output from the past week, and saw no hits.
(Not too surprising, given that we don't do much RT here, but still...)

I did get what appears to me to be an unrelated one-off shown below.  I am
including this not as a bug report, but just for completeness.  I didn't
find anything like this from the fleet over the past week, either.

Unicorns!!!  ;-)

							Thanx, Paul

------------------------------------------------------------------------

[   66.315476] smpboot: CPU 2 is now offline
[   67.245115] rcu-torture: rcu_torture_read_exit: Start of episode
[   69.232773] rcu-torture: Stopping rcu_torture_boost task
[   70.290610] rcu-torture: rcu_torture_boost is stopping
[   70.295436] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   70.295444] smpboot: CPU 3 is now offline
[   70.296343] #PF: supervisor write access in kernel mode
[   70.296343] #PF: error_code(0x0002) - not-present page
[   70.296343] PGD 0 P4D 0
[   70.296343] Oops: Oops: 0002 [#1] PREEMPT SMP NOPTI
[   70.296343] CPU: 14 UID: 0 PID: 414 Comm: kworker/u67:1 Not tainted 6.11.0-rc4-next-20240823-dirty #53827
[   70.296343] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[   70.296343] RIP: 0010:_raw_spin_lock_irq+0x13/0x30
[   70.303668] Code: 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa fa 65 ff 05 7c c9 0e 6e 31 c0 ba 01 00 00 00 <f0> 0f b1 17 75 05 c3 cc cc cc cc 89 c6 e9 1b 00 00 00 66 2e 0f 1f
[   70.303668] RSP: 0018:ffffa13840cafec0 EFLAGS: 00010046
[   70.322799] rcu-torture: rcu_torture_read_exit: End of episode
[   70.323615] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff9fb682c0ac40
[   70.323615] RDX: 0000000000000001 RSI: ffffa13840cafe60 RDI: 0000000000000000
[   70.323615] RBP: ffff9fb68294c300 R08: 000000000000041e R09: 0000000000000001
[   70.323615] R10: 0000000000000003 R11: 00000000002dc6c0 R12: ffff9fb682b2ba80
[   70.323615] R13: ffff9fb682c120c0 R14: ffff9fb682c120c0 R15: ffff9fb682c0ac40
[   70.323615] FS:  0000000000000000(0000) GS:ffff9fb69f580000(0000) knlGS:0000000000000000
[   70.323615] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   70.323615] CR2: 0000000000000000 CR3: 000000001ac2e000 CR4: 00000000000006f0
[   70.323615] Call Trace:
[   70.323615]  <TASK>
[   70.323615]  ? __die+0x1f/0x70
[   70.323615]  ? page_fault_oops+0x155/0x440
[   70.323615]  ? _raw_spin_lock_irq+0x15/0x30
[   70.323615]  ? is_prefetch.constprop.0+0xed/0x1b0
[   70.323615]  ? exc_page_fault+0x69/0x150
[   70.323615]  ? asm_exc_page_fault+0x26/0x30
[   70.323615]  ? _raw_spin_lock_irq+0x13/0x30
[   70.323615]  worker_thread+0x41/0x3a0
[   70.323615]  ? __pfx_worker_thread+0x10/0x10
[   70.323615]  kthread+0xd1/0x100
[   70.323615]  ? __pfx_kthread+0x10/0x10
[   70.323615]  ret_from_fork+0x2f/0x50
[   70.323615]  ? __pfx_kthread+0x10/0x10
[   70.323615]  ret_from_fork_asm+0x1a/0x30
[   70.323615]  </TASK>
[   70.323615] Modules linked in:
[   70.323615] CR2: 0000000000000000
[   70.323615] ---[ end trace 0000000000000000 ]---

