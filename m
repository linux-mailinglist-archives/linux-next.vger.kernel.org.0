Return-Path: <linux-next+bounces-4117-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D599214F
	for <lists+linux-next@lfdr.de>; Sun,  6 Oct 2024 22:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 109A7281D80
	for <lists+linux-next@lfdr.de>; Sun,  6 Oct 2024 20:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BA916F265;
	Sun,  6 Oct 2024 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9456bk+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6B71482E2;
	Sun,  6 Oct 2024 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247494; cv=none; b=WLMDcxwJhsbMkG3T4CUifqWRuXP8troPaSrhJYj6OXF2kqaJJ0LVgsO354Uj1Pc/jCoYyRB2Kbi7DFd0HLjCF76bKL/roHV0Y3cYB0zNpnOOwuYv7t9GZMUQo7e/ptLlGJAKNH43kzeKbvc0aGrgvfiKIlaf4qaXDobc5uRN7ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247494; c=relaxed/simple;
	bh=+ulpmZZRsBlxk/M2aiPx/Ygfyl2k1S/lfozgf+5pCaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9ZFbb59Km8KYHtfN7GUFfKrLoO+3AK2uF0A4GX+hNw7bxsArIPSq6tJxHaquTv7mAv8OaPSRnMSadpkhuoVeJyzzjrJ4bSE+0A/WO9dvseNC9NDciQF/kszVluwfh4QGZyyKpKrguTpDgWDm37BY7cNSoZfdBV6V0zfOl9y2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9456bk+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A417BC4CEC5;
	Sun,  6 Oct 2024 20:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728247493;
	bh=+ulpmZZRsBlxk/M2aiPx/Ygfyl2k1S/lfozgf+5pCaU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=b9456bk+M5B1Hjxka/R7XPZdPBwbROUIFseC/Bc5zaxtV2ABSO+TsDbHwxJfnOaj2
	 9RNHqnnLSIjopU0HtjtbREqwZ7WZo2zZZuZaPUavAggmwiqIvc4Y8vuLKl4vt5PJUR
	 VMputoGXoVVz8qtUl5darkVfoiZ8Swg2EYfi841cF/mtZEihDvPW4OJiomtIT4qjYn
	 MpKDrwimpVGXASHGufvq2hE964KpHdlJx14EjuXw9jkNTgigc3MxIUkCSSOqYWVbto
	 TC/WNU4ARZ5qJwT+bxzC45Iqtp32n2SGP+1aUv+GSJX6/uPTEuGy+4IZZC1nwUny0H
	 KcvcNJbD3rzww==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 487F3CE09EE; Sun,  6 Oct 2024 13:44:53 -0700 (PDT)
Date: Sun, 6 Oct 2024 13:44:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <9961cb9c-70f0-405b-b259-575586905ae0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
 <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
 <20241003142240.GU5594@noisy.programming.kicks-ass.net>
 <7b14822a-ee98-4e46-9828-1e41b1ce76f3@paulmck-laptop>
 <20241003185037.GA5594@noisy.programming.kicks-ass.net>
 <20241004133532.GH33184@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004133532.GH33184@noisy.programming.kicks-ass.net>

On Fri, Oct 04, 2024 at 03:35:32PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 03, 2024 at 08:50:37PM +0200, Peter Zijlstra wrote:
> > On Thu, Oct 03, 2024 at 09:04:30AM -0700, Paul E. McKenney wrote:
> > > On Thu, Oct 03, 2024 at 04:22:40PM +0200, Peter Zijlstra wrote:
> > > > On Thu, Oct 03, 2024 at 05:45:47AM -0700, Paul E. McKenney wrote:
> > > > 
> > > > > I ran 100*TREE03 for 18 hours each, and got 23 instances of *something*
> > > > > happening (and I need to suppress stalls on the repeat).  One of the
> > > > > earlier bugs happened early, but sadly not this one.
> > > > 
> > > > Damn, I don't have the amount of CPU hours available you mention in your
> > > > later email. I'll just go up the rounds to 20 minutes and see if
> > > > something wants to go bang before I have to shut down the noise
> > > > pollution for the day...
> > > 
> > > Indeed, this was one reason I was soliciting debug patches.  ;-)
> > 
> > Sooo... I was contemplating if something like the below might perhaps
> > help some. It's a bit of a mess (I'll try and clean up if/when it
> > actually proves to work), but it compiles and survives a hand full of 1m
> > runs.
> > 
> > I'll try and give it more runs tomorrow when I can power up the big
> > machines again -- unless you've already told me it's crap by then :-)
> 
> I've given it 200*20m and the worst I got was one dl-server double
> enqueue. I'll go stare at that I suppose.

With your patch, I got 24 failures out of 100 TREE03 runs of 18 hours
each.  The failures were different, though, mostly involving boost
failures in which RCU priority boosting didn't actually result in the
low-priority readers getting boosted.  An ftrace/event-trace dump of
such a situation is shown below.

There were also a number of "sched: DL replenish lagged too much"
messages, but it looks like this was a symptom of the ftrace dump.

Given that this now involves priority boosting, I am trying 400*TREE03
with each guest OS restricted to four CPUs to see if that makes things
happen more quickly, and will let you know how this goes.

Any other debug I should apply?

							Thanx, Paul

------------------------------------------------------------------------

[10363.660761] Dumping ftrace buffer:
[10363.661231] ---------------------------------
[10363.661789] CPU:1 [LOST 12570412 EVENTS]
[10363.661789] rcu_tort-155       1d..2. 10347723897us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=97 prev_state=R+ ==> next_comm=rcub/7 next_pid=17 next_prio=97
[10363.664164]   rcub/7-17        1d..2. 10347723905us : sched_switch: prev_comm=rcub/7 prev_pid=17 prev_prio=97 prev_state=S ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.665965]   rcuc/1-25        1d..2. 10347723908us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10363.667819] ksoftirq-26        1d..2. 10347723909us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.669784] rcu_tort-159       1dNh5. 10347724881us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.670971] rcu_tort-159       1dN.5. 10347724884us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10363.672210] rcu_tort-159       1d..2. 10347724942us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.674130]   rcuc/1-25        1d..2. 10347724945us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10363.675971] ksoftirq-26        1d..2. 10347724947us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.677935] rcu_tort-159       1DNh3. 10347726881us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.679125] rcu_tort-159       1d..2. 10347726884us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.681048]   rcuc/1-25        1d..2. 10347726887us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.682964] rcu_tort-159       1DNh3. 10347727881us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.684180] rcu_tort-159       1d..2. 10347727887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.686103]   rcuc/1-25        1d..2. 10347727889us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.688026] rcu_tort-159       1dNh3. 10347728881us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.689219] rcu_tort-159       1d..2. 10347728884us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.691150]   rcuc/1-25        1d..2. 10347728886us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.693076] rcu_tort-159       1dNh4. 10347729270us : sched_wakeup: comm=rcu_torture_wri pid=148 prio=120 target_cpu=001
[10363.694392] rcu_tort-159       1d..2. 10347729272us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_wri next_pid=148 next_prio=120
[10363.696437] rcu_tort-148       1d..2. 10347729276us : sched_switch: prev_comm=rcu_torture_wri prev_pid=148 prev_prio=120 prev_state=I ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.698467] rcu_tort-159       1dNh4. 10347729777us : sched_wakeup: comm=rcu_torture_wri pid=148 prio=120 target_cpu=001
[10363.699771] rcu_tort-159       1d..2. 10347729780us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_wri next_pid=148 next_prio=120
[10363.701821] rcu_tort-148       1dNh4. 10347729881us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.703018] rcu_tort-148       1d..2. 10347729884us : sched_switch: prev_comm=rcu_torture_wri prev_pid=148 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.704940]   rcuc/1-25        1d..2. 10347729886us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_wri next_pid=148 next_prio=120
[10363.706846] rcu_tort-148       1d..2. 10347730434us : sched_switch: prev_comm=rcu_torture_wri prev_pid=148 prev_prio=120 prev_state=I ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.708880] rcu_tort-159       1dN.4. 10347730882us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10363.710126] rcu_tort-159       1d..2. 10347730883us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10363.712107] ksoftirq-26        1d..2. 10347730886us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.714095] rcu_tort-159       1d..2. 10347731423us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=18 next_prio=97
[10363.716147] rcu_exp_-18        1d..4. 10347731431us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=008
[10363.717459] rcu_exp_-18        1d..2. 10347731435us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=18 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.719503] rcu_tort-159       1d..2. 10347731526us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=36 next_prio=97
[10363.721551] rcu_exp_-36        1d..4. 10347731532us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=008
[10363.722853] rcu_exp_-36        1d..2. 10347731536us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=36 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.724906] rcu_tort-159       1d..2. 10347731568us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=18 next_prio=97
[10363.726968] rcu_exp_-18        1d..2. 10347731577us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=18 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.729019] rcu_tort-159       1d..2. 10347731595us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=92 next_prio=97
[10363.731308] rcu_exp_-92        1d..2. 10347731599us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=92 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.733371] rcu_tort-159       1d..2. 10347731779us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=158 next_prio=97
[10363.735456] rcu_tort-158       1d..2. 10347731797us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.737541] rcu_tort-159       1DNh4. 10347731882us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.738761] rcu_tort-159       1d..2. 10347731885us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.740720]   rcuc/1-25        1d..2. 10347731888us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10363.742673] rcu_tort-158       1dNh3. 10347732881us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.743883] rcu_tort-158       1d..2. 10347732884us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.745848]   rcuc/1-25        1d..2. 10347732887us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.747813] rcu_tort-159       1dN.3. 10347733882us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10363.749078] rcu_tort-159       1d..2. 10347733884us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10363.751101] ksoftirq-26        1d..2. 10347733888us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10363.753098] rcu_tort-158       1d..2. 10347733893us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10363.755177] rcu_tort-159       1d..3. 10347733899us : dl_server_stop <-dequeue_entities
[10363.756172] rcu_tort-159       1d..3. 10347733906us : dl_server_start <-enqueue_task_fair
[10363.757172] rcu_tort-159       1d..2. 10347733908us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=155 next_prio=139
[10363.759240] rcu_tort-155       1dNh4. 10347734882us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.760468] rcu_tort-155       1dN.4. 10347734885us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10363.761730] rcu_tort-155       1d..2. 10347734887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.763733]   rcuc/1-25        1d..2. 10347734890us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10363.765611] ksoftirq-26        1d..2. 10347734891us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=155 next_prio=139
[10363.767612] rcu_tort-155       1DNh5. 10347735881us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.768825] rcu_tort-155       1d..2. 10347735885us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.770787]   rcuc/1-25        1d..2. 10347735888us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10363.772636]  cpuhp/1-23        1d..2. 10347735892us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_rea next_pid=155 next_prio=139
[10363.774605] rcu_tort-155       1dN.6. 10347735894us : sched_wakeup: comm=migration/1 pid=24 prio=0 target_cpu=001
[10363.775851] rcu_tort-155       1d..2. 10347735896us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=migration/1 next_pid=24 next_prio=0
[10363.777842] migratio-24        1d..4. 10347735898us : dl_server_stop <-dequeue_entities
[10363.778826] migratio-24        1d..2. 10347735904us : sched_switch: prev_comm=migration/1 prev_pid=24 prev_prio=0 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.780728]   <idle>-0         1dNh4. 10347736888us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.781930]   <idle>-0         1dN.4. 10347736890us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10363.783190]   <idle>-0         1d..2. 10347736892us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.785061]   rcuc/1-25        1d..2. 10347736898us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10363.786946] ksoftirq-26        1d..2. 10347736899us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.788870]   <idle>-0         1d..2. 10347736957us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=kworker/1:0 next_pid=18422 next_prio=120
[10363.790839] kworker/-18422     1d..4. 10347736965us : sched_wakeup: comm=rcu_torture_bar pid=193 prio=139 target_cpu=000
[10363.792170] kworker/-18422     1d..3. 10347736966us : dl_server_stop <-dequeue_entities
[10363.793160] kworker/-18422     1d..2. 10347736967us : sched_switch: prev_comm=kworker/1:0 prev_pid=18422 prev_prio=120 prev_state=I ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.795126]   <idle>-0         1dNh4. 10347737886us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.796348]   <idle>-0         1d..2. 10347737889us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.798218]   rcuc/1-25        1d..2. 10347737891us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.800106]   <idle>-0         1dNh4. 10347738885us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.801387]   <idle>-0         1d..2. 10347738888us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.803219]   rcuc/1-25        1d..2. 10347738891us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.805072]   <idle>-0         1d.h4. 10347739243us : sched_wakeup: comm=rcu_torture_wri pid=148 prio=120 target_cpu=000
[10363.806403]   <idle>-0         1dNh4. 10347739885us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.807610]   <idle>-0         1d..2. 10347739888us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.809453]   rcuc/1-25        1d..2. 10347739889us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.811456]   <idle>-0         1dNh4. 10347740885us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.812866]   <idle>-0         1d..2. 10347740888us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.814750]   rcuc/1-25        1D..5. 10347740890us : dl_server_start <-enqueue_task_fair
[10363.815764]   rcuc/1-25        1DN.4. 10347740891us : sched_wakeup: comm=cpuhp/1 pid=23 prio=120 target_cpu=001
[10363.816989]   rcuc/1-25        1d..2. 10347740894us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10363.818842]  cpuhp/1-23        1d..3. 10347741725us : dl_server_stop <-dequeue_entities
[10363.819814]  cpuhp/1-23        1d..2. 10347741726us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=D ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.821679]   <idle>-0         1dNh4. 10347741887us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.822877]   <idle>-0         1d..2. 10347741890us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.824720]   rcuc/1-25        1d..2. 10347741892us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.826574]   <idle>-0         1d..2. 10347742453us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10363.828441]  cpuhp/1-23        1d..3. 10347742474us : dl_server_stop <-dequeue_entities
[10363.829422]  cpuhp/1-23        1d..2. 10347742475us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=D ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.831290]   <idle>-0         1d..2. 10347742917us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10363.833165]  cpuhp/1-23        1d..3. 10347742944us : dl_server_stop <-dequeue_entities
[10363.834139]  cpuhp/1-23        1d..2. 10347742946us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=D ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.836021]   <idle>-0         1d..2. 10347742969us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10363.837887]  cpuhp/1-23        1dN.3. 10347743083us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10363.839158]  cpuhp/1-23        1d..2. 10347743084us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=R+ ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10363.841086] ksoftirq-26        1d..2. 10347743086us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=P ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10363.842993]  cpuhp/1-23        1dN.3. 10347743087us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10363.844212]  cpuhp/1-23        1d..2. 10347743088us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10363.846107]   rcuc/1-25        1d..2. 10347743089us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=P ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10363.847967]  cpuhp/1-23        1d..3. 10347743094us : dl_server_stop <-dequeue_entities
[10363.848968]  cpuhp/1-23        1d..2. 10347743095us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.850869]   <idle>-0         1d..2. 10347743107us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10363.852779]  cpuhp/1-23        1d..3. 10347743111us : dl_server_stop <-dequeue_entities
[10363.853770]  cpuhp/1-23        1d..2. 10347743112us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=P ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10363.855664]   <idle>-0         1d..2. 10347743122us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=migration/1 next_pid=24 next_prio=0
[10363.857599] CPU:6 [LOST 11447803 EVENTS]
[10363.857599] kworker/-19976     6d..2. 10354298092us : sched_switch: prev_comm=kworker/6:2 prev_pid=19976 prev_prio=120 prev_state=D ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.860014]   <idle>-0         6dNh2. 10354298095us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=006
[10363.861315]   <idle>-0         6d..2. 10354298097us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_exp_gp_kthr next_pid=20 next_prio=97
[10363.863294] rcu_exp_-20        6d..2. 10354298104us : sched_switch: prev_comm=rcu_exp_gp_kthr prev_pid=20 prev_prio=97 prev_state=D ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.865256]   <idle>-0         6dNh2. 10354298111us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=006
[10363.866598]   <idle>-0         6d..2. 10354298112us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_exp_gp_kthr next_pid=20 next_prio=97
[10363.868608] rcu_exp_-20        6d..5. 10354298114us : dl_server_start <-enqueue_task_fair
[10363.869615] rcu_exp_-20        6dN.4. 10354298115us : sched_wakeup: comm=kworker/6:2 pid=19976 prio=120 target_cpu=006
[10363.870925] rcu_exp_-20        6d..2. 10354298118us : sched_switch: prev_comm=rcu_exp_gp_kthr prev_pid=20 prev_prio=97 prev_state=S ==> next_comm=kworker/6:2 next_pid=19976 next_prio=120
[10363.872948] kworker/-19976     6d..3. 10354298119us : dl_server_stop <-dequeue_entities
[10363.873940] kworker/-19976     6d..2. 10354298123us : sched_switch: prev_comm=kworker/6:2 prev_pid=19976 prev_prio=120 prev_state=I ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.875928]   <idle>-0         6d.h3. 10354298479us : dl_server_start <-enqueue_task_fair
[10363.876955]   <idle>-0         6dNh2. 10354298481us : sched_wakeup: comm=rcu_torture_fak pid=151 prio=139 target_cpu=006
[10363.878287]   <idle>-0         6d..2. 10354298482us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_torture_fak next_pid=151 next_prio=139
[10363.880268] rcu_tort-151       6d..3. 10354298485us : dl_server_stop <-dequeue_entities
[10363.881262] rcu_tort-151       6d..2. 10354298489us : sched_switch: prev_comm=rcu_torture_fak prev_pid=151 prev_prio=139 prev_state=I ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.883949]   <idle>-0         6dN.4. 10354298892us : sched_wakeup: comm=ksoftirqd/6 pid=60 prio=97 target_cpu=006
[10363.885869]   <idle>-0         6d..2. 10354298893us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=ksoftirqd/6 next_pid=60 next_prio=97
[10363.888185] ksoftirq-60        6d..2. 10354298901us : sched_switch: prev_comm=ksoftirqd/6 prev_pid=60 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.890094]   <idle>-0         6dNh4. 10354299889us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.891310]   <idle>-0         6d..2. 10354299893us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.893182]   rcuc/6-59        6d..2. 10354299899us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.895050]   <idle>-0         6dNh4. 10354300890us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.896255]   <idle>-0         6d..2. 10354300894us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.898162]   rcuc/6-59        6d..2. 10354300899us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.900032]   <idle>-0         6dNh4. 10354302889us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.901248]   <idle>-0         6d..2. 10354302893us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.903132]   rcuc/6-59        6d..3. 10354302906us : dl_server_start <-enqueue_task_fair
[10363.904144]   rcuc/6-59        6d..2. 10354302908us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10363.906107] rcu_tort-154       6d.h2. 10354302912us : sched_wakeup: comm=cpuhp/6 pid=57 prio=120 target_cpu=006
[10363.907348] rcu_tort-154       6DNh3. 10354303884us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.908585] rcu_tort-154       6d..2. 10354303889us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.910547]   rcuc/6-59        6d..2. 10354303892us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10363.912408]  cpuhp/6-57        6d..2. 10354303896us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10363.914357] rcu_tort-154       6dN.6. 10354303899us : sched_wakeup: comm=migration/6 pid=58 prio=0 target_cpu=006
[10363.915642] rcu_tort-154       6d..2. 10354303901us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=migration/6 next_pid=58 next_prio=0
[10363.917653] migratio-58        6d..4. 10354303903us : dl_server_stop <-dequeue_entities
[10363.918641] migratio-58        6d..2. 10354303911us : sched_switch: prev_comm=migration/6 prev_pid=58 prev_prio=0 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.920567]   <idle>-0         6dN.4. 10354304891us : sched_wakeup: comm=ksoftirqd/6 pid=60 prio=97 target_cpu=006
[10363.921839]   <idle>-0         6d..2. 10354304893us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=ksoftirqd/6 next_pid=60 next_prio=97
[10363.923765] ksoftirq-60        6d..2. 10354304898us : sched_switch: prev_comm=ksoftirqd/6 prev_pid=60 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.925701]   <idle>-0         6d.h4. 10354306531us : sched_wakeup: comm=rcu_torture_wri pid=148 prio=120 target_cpu=000
[10363.927023]   <idle>-0         6dNh4. 10354306888us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.928233]   <idle>-0         6dN.4. 10354306891us : sched_wakeup: comm=ksoftirqd/6 pid=60 prio=97 target_cpu=006
[10363.929519]   <idle>-0         6d..2. 10354306892us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.931382]   rcuc/6-59        6d..2. 10354306898us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/6 next_pid=60 next_prio=97
[10363.933263] ksoftirq-60        6d..2. 10354306900us : sched_switch: prev_comm=ksoftirqd/6 prev_pid=60 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.935176]   <idle>-0         6d.h4. 10354307223us : sched_wakeup: comm=rcu_torture_fak pid=151 prio=139 target_cpu=000
[10363.936571]   <idle>-0         6dNh4. 10354307888us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.937784]   <idle>-0         6d..2. 10354307892us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.939643]   rcuc/6-59        6d..2. 10354307895us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.941506]   <idle>-0         6dNh4. 10354310888us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.942730]   <idle>-0         6d..2. 10354310892us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.945358]   rcuc/6-59        6d..2. 10354310894us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.948169]   <idle>-0         6d.h4. 10354311779us : sched_wakeup: comm=rcu_torture_fak pid=149 prio=139 target_cpu=000
[10363.950184]   <idle>-0         6dNh4. 10354311889us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.951973]   <idle>-0         6d..2. 10354311893us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.954758]   rcuc/6-59        6d..2. 10354311896us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.957574]   <idle>-0         6dNh4. 10354312889us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.959410]   <idle>-0         6d..2. 10354312892us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.962196]   rcuc/6-59        6d..2. 10354312895us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.964698]   <idle>-0         6dNh4. 10354314889us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.965895]   <idle>-0         6d..2. 10354314893us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.967749]   rcuc/6-59        6d..2. 10354314895us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.969603]   <idle>-0         6dNh4. 10354315888us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.970803]   <idle>-0         6d..2. 10354315892us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.972722]   rcuc/6-59        6D..5. 10354315894us : dl_server_start <-enqueue_task_fair
[10363.973722]   rcuc/6-59        6DN.4. 10354315895us : sched_wakeup: comm=cpuhp/6 pid=57 prio=120 target_cpu=006
[10363.974944]   rcuc/6-59        6d..2. 10354315898us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10363.976794]  cpuhp/6-57        6dNh4. 10354316898us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.977993]  cpuhp/6-57        6d..2. 10354316906us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.979842]   rcuc/6-59        6d..2. 10354316914us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10363.981713]  cpuhp/6-57        6d..3. 10354316922us : dl_server_stop <-dequeue_entities
[10363.982692]  cpuhp/6-57        6d..2. 10354316924us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=D ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.984567]   <idle>-0         6d..2. 10354317629us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10363.986439]  cpuhp/6-57        6d..3. 10354317656us : dl_server_stop <-dequeue_entities
[10363.987428]  cpuhp/6-57        6d..2. 10354317658us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=D ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.989289]   <idle>-0         6d..2. 10354317704us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10363.991166]  cpuhp/6-57        6d..3. 10354317735us : dl_server_stop <-dequeue_entities
[10363.992147]  cpuhp/6-57        6d..2. 10354317736us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=D ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10363.994025]   <idle>-0         6d..2. 10354317766us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10363.995890]  cpuhp/6-57        6dNh3. 10354317882us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10363.997116]  cpuhp/6-57        6d..2. 10354317887us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10363.998993]   rcuc/6-59        6d..2. 10354317889us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=S ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10364.000864]  cpuhp/6-57        6dN.3. 10354317939us : sched_wakeup: comm=ksoftirqd/6 pid=60 prio=97 target_cpu=006
[10364.002127]  cpuhp/6-57        6d..2. 10354317940us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=R+ ==> next_comm=ksoftirqd/6 next_pid=60 next_prio=97
[10364.004042] ksoftirq-60        6d..2. 10354317942us : sched_switch: prev_comm=ksoftirqd/6 prev_pid=60 prev_prio=97 prev_state=P ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10364.005956]  cpuhp/6-57        6dN.3. 10354317943us : sched_wakeup: comm=rcuc/6 pid=59 prio=97 target_cpu=006
[10364.007169]  cpuhp/6-57        6d..2. 10354317944us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/6 next_pid=59 next_prio=97
[10364.009038]   rcuc/6-59        6d..2. 10354317946us : sched_switch: prev_comm=rcuc/6 prev_pid=59 prev_prio=97 prev_state=P ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10364.010886]  cpuhp/6-57        6d..3. 10354317952us : dl_server_stop <-dequeue_entities
[10364.011873]  cpuhp/6-57        6d..2. 10354317953us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=S ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10364.013769]   <idle>-0         6d..2. 10354317966us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/6 next_pid=57 next_prio=120
[10364.015655]  cpuhp/6-57        6d..3. 10354317971us : dl_server_stop <-dequeue_entities
[10364.016632]  cpuhp/6-57        6d..2. 10354317973us : sched_switch: prev_comm=cpuhp/6 prev_pid=57 prev_prio=120 prev_state=P ==> next_comm=swapper/6 next_pid=0 next_prio=120
[10364.018520]   <idle>-0         6d..2. 10354317990us : sched_switch: prev_comm=swapper/6 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=migration/6 next_pid=58 next_prio=0
[10364.020427] CPU:14 [LOST 11510813 EVENTS]
[10364.020427] rcu_tort-159      14d..2. 10356469386us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.022985] rcu_tort-154      14dN.4. 10356469885us : sched_wakeup: comm=ksoftirqd/14 pid=116 prio=97 target_cpu=014
[10364.024259] rcu_tort-154      14d..2. 10356469890us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/14 next_pid=116 next_prio=97
[10364.026288] ksoftirq-116      14d..2. 10356469892us : sched_switch: prev_comm=ksoftirqd/14 prev_pid=116 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.028390] rcu_tort-159      14dNs5. 10356470886us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=014
[10364.029686] rcu_tort-159      14d..2. 10356470888us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10364.031723] rcu_pree-16       14d..2. 10356470891us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.033718] rcu_tort-154      14d..2. 10356470895us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.035767] rcu_tort-159      14DNh3. 10356471396us : sched_wakeup: comm=rcu_torture_rea pid=154 prio=139 target_cpu=014
[10364.037098] rcu_tort-159      14d..2. 10356471399us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.039173] rcu_tort-154      14dN.4. 10356474885us : sched_wakeup: comm=ksoftirqd/14 pid=116 prio=97 target_cpu=014
[10364.040499] rcu_tort-154      14d..2. 10356474887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/14 next_pid=116 next_prio=97
[10364.042547] ksoftirq-116      14d.s3. 10356474895us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=012
[10364.043921] ksoftirq-116      14d..2. 10356474900us : sched_switch: prev_comm=ksoftirqd/14 prev_pid=116 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.045993] rcu_tort-154      14DNh4. 10356475881us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.047224] rcu_tort-154      14d..2. 10356475886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.049195]  rcuc/14-115      14d..2. 10356475890us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.051160] rcu_tort-154      14d..2. 10356476814us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_gp_kthr next_pid=20 next_prio=97
[10364.053183] rcu_exp_-20       14d..4. 10356476825us : sched_wakeup: comm=rcu_exp_par_gp_ pid=92 prio=97 target_cpu=004
[10364.054490] rcu_exp_-20       14d..4. 10356476836us : sched_wakeup: comm=rcu_exp_par_gp_ pid=106 prio=97 target_cpu=012
[10364.055795] rcu_exp_-20       14dN.3. 10356476838us : sched_wakeup: comm=rcub/14 pid=119 prio=97 target_cpu=014
[10364.057017] rcu_exp_-20       14d..2. 10356476840us : sched_switch: prev_comm=rcu_exp_gp_kthr prev_pid=20 prev_prio=97 prev_state=R+ ==> next_comm=rcub/14 next_pid=119 next_prio=97
[10364.058978]  rcub/14-119      14d..4. 10356476852us : dl_server_stop <-dequeue_entities
[10364.059959]  rcub/14-119      14d..2. 10356476870us : sched_switch: prev_comm=rcub/14 prev_pid=119 prev_prio=97 prev_state=D ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.061851]   <idle>-0        14dNh2. 10356476890us : sched_wakeup: comm=rcub/14 pid=119 prio=97 target_cpu=014
[10364.063077]   <idle>-0        14dN.4. 10356476895us : sched_wakeup: comm=ksoftirqd/14 pid=116 prio=97 target_cpu=014
[10364.064358]   <idle>-0        14d..2. 10356476897us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcub/14 next_pid=119 next_prio=97
[10364.066245]  rcub/14-119      14d..2. 10356476899us : sched_switch: prev_comm=rcub/14 prev_pid=119 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/14 next_pid=116 next_prio=97
[10364.068183] ksoftirq-116      14d..2. 10356476907us : sched_switch: prev_comm=ksoftirqd/14 prev_pid=116 prev_prio=97 prev_state=S ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.070137]   <idle>-0        14d.h3. 10356477410us : dl_server_start <-enqueue_task_fair
[10364.071141]   <idle>-0        14dNh2. 10356477411us : sched_wakeup: comm=rcu_torture_rea pid=159 prio=139 target_cpu=014
[10364.072488]   <idle>-0        14d..2. 10356477412us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.074485] rcu_tort-159      14dN.3. 10356477885us : sched_wakeup: comm=ksoftirqd/14 pid=116 prio=97 target_cpu=014
[10364.076345] rcu_tort-159      14d..2. 10356477886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/14 next_pid=116 next_prio=97
[10364.079470] ksoftirq-116      14d..2. 10356477889us : sched_switch: prev_comm=ksoftirqd/14 prev_pid=116 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.081835] rcu_tort-159      14DNh4. 10356480882us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.083062] rcu_tort-159      14d..2. 10356480887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.085029]  rcuc/14-115      14d..2. 10356480890us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.086997] rcu_tort-159      14dNh4. 10356481881us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.088224] rcu_tort-159      14d..2. 10356481886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.090191]  rcuc/14-115      14d..2. 10356481889us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.092141] rcu_tort-159      14dNh4. 10356483882us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.093362] rcu_tort-159      14d..2. 10356483886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.095321]  rcuc/14-115      14d..2. 10356483895us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.097273] rcu_tort-159      14dNh3. 10356484882us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.098506] rcu_tort-159      14d..2. 10356484886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.100469]  rcuc/14-115      14d..2. 10356484889us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.102423] rcu_tort-159      14dNh3. 10356485882us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.103645] rcu_tort-159      14d..2. 10356485886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.105602]  rcuc/14-115      14d..2. 10356485889us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.107578] rcu_tort-159      14DNh3. 10356486882us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.108820] rcu_tort-159      14d..2. 10356486889us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.110810]  rcuc/14-115      14d..2. 10356486892us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.112782] rcu_tort-159      14dNh4. 10356487882us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.114012] rcu_tort-159      14dN.4. 10356487886us : sched_wakeup: comm=ksoftirqd/14 pid=116 prio=97 target_cpu=014
[10364.115289] rcu_tort-159      14d..2. 10356487888us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.117256]  rcuc/14-115      14d..2. 10356487892us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/14 next_pid=116 next_prio=97
[10364.119204] ksoftirq-116      14d..2. 10356487894us : sched_switch: prev_comm=ksoftirqd/14 prev_pid=116 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.121357] rcu_tort-159      14d..3. 10356487898us : dl_server_stop <-dequeue_entities
[10364.122358] rcu_tort-159      14d..2. 10356487902us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=I ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.124374]   <idle>-0        14d.h3. 10356487918us : dl_server_start <-enqueue_task_fair
[10364.125388]   <idle>-0        14dNh2. 10356487919us : sched_wakeup: comm=cpuhp/14 pid=113 prio=120 target_cpu=014
[10364.126664]   <idle>-0        14d..2. 10356487920us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/14 next_pid=113 next_prio=120
[10364.128613] cpuhp/14-113      14d..3. 10356487924us : dl_server_stop <-dequeue_entities
[10364.129622] cpuhp/14-113      14d..2. 10356487925us : sched_switch: prev_comm=cpuhp/14 prev_pid=113 prev_prio=120 prev_state=D ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.131560]   <idle>-0        14d.h4. 10356488409us : sched_wakeup: comm=rcu_torture_rea pid=159 prio=139 target_cpu=000
[10364.132891]   <idle>-0        14dNh4. 10356488887us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.134126]   <idle>-0        14d..2. 10356488891us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.136044]  rcuc/14-115      14d..2. 10356488894us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.137962]   <idle>-0        14dNh4. 10356489888us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.139203]   <idle>-0        14d..2. 10356489892us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.141096]  rcuc/14-115      14d..2. 10356489894us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.142990]   <idle>-0        14dNh4. 10356490888us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.144230]   <idle>-0        14d..2. 10356490892us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.146124]  rcuc/14-115      14d..2. 10356490895us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.148030]   <idle>-0        14dNh4. 10356493889us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.149266]   <idle>-0        14d..2. 10356493892us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.151181]  rcuc/14-115      14D..5. 10356493896us : dl_server_start <-enqueue_task_fair
[10364.152188]  rcuc/14-115      14DN.4. 10356493897us : sched_wakeup: comm=cpuhp/14 pid=113 prio=120 target_cpu=014
[10364.153474]  rcuc/14-115      14d..2. 10356493900us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=cpuhp/14 next_pid=113 next_prio=120
[10364.155363] cpuhp/14-113      14d..3. 10356494772us : dl_server_stop <-dequeue_entities
[10364.156351] cpuhp/14-113      14d..2. 10356494773us : sched_switch: prev_comm=cpuhp/14 prev_pid=113 prev_prio=120 prev_state=D ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.158274]   <idle>-0        14dNh4. 10356494889us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.159527]   <idle>-0        14d..2. 10356494893us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.161425]  rcuc/14-115      14d..2. 10356494896us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=S ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.163320]   <idle>-0        14d..2. 10356495520us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/14 next_pid=113 next_prio=120
[10364.165239] cpuhp/14-113      14d..3. 10356495543us : dl_server_stop <-dequeue_entities
[10364.166220] cpuhp/14-113      14d..2. 10356495544us : sched_switch: prev_comm=cpuhp/14 prev_pid=113 prev_prio=120 prev_state=D ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.168143]   <idle>-0        14d..2. 10356495588us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/14 next_pid=113 next_prio=120
[10364.170090] cpuhp/14-113      14d..3. 10356495616us : dl_server_stop <-dequeue_entities
[10364.171074] cpuhp/14-113      14d..2. 10356495617us : sched_switch: prev_comm=cpuhp/14 prev_pid=113 prev_prio=120 prev_state=D ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.172982]   <idle>-0        14d..2. 10356495646us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/14 next_pid=113 next_prio=120
[10364.174919] cpuhp/14-113      14dN.3. 10356495757us : sched_wakeup: comm=ksoftirqd/14 pid=116 prio=97 target_cpu=014
[10364.176206] cpuhp/14-113      14d..2. 10356495758us : sched_switch: prev_comm=cpuhp/14 prev_pid=113 prev_prio=120 prev_state=R+ ==> next_comm=ksoftirqd/14 next_pid=116 next_prio=97
[10364.178173] ksoftirq-116      14d..2. 10356495760us : sched_switch: prev_comm=ksoftirqd/14 prev_pid=116 prev_prio=97 prev_state=P ==> next_comm=cpuhp/14 next_pid=113 next_prio=120
[10364.180173] cpuhp/14-113      14dN.3. 10356495761us : sched_wakeup: comm=rcuc/14 pid=115 prio=97 target_cpu=014
[10364.181422] cpuhp/14-113      14d..2. 10356495762us : sched_switch: prev_comm=cpuhp/14 prev_pid=113 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/14 next_pid=115 next_prio=97
[10364.183318]  rcuc/14-115      14d..2. 10356495763us : sched_switch: prev_comm=rcuc/14 prev_pid=115 prev_prio=97 prev_state=P ==> next_comm=cpuhp/14 next_pid=113 next_prio=120
[10364.185221] cpuhp/14-113      14d..3. 10356495768us : dl_server_stop <-dequeue_entities
[10364.186203] cpuhp/14-113      14d..2. 10356495769us : sched_switch: prev_comm=cpuhp/14 prev_pid=113 prev_prio=120 prev_state=S ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.188123]   <idle>-0        14d..2. 10356495783us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/14 next_pid=113 next_prio=120
[10364.190047] cpuhp/14-113      14d..3. 10356495787us : dl_server_stop <-dequeue_entities
[10364.191036] cpuhp/14-113      14d..2. 10356495788us : sched_switch: prev_comm=cpuhp/14 prev_pid=113 prev_prio=120 prev_state=P ==> next_comm=swapper/14 next_pid=0 next_prio=120
[10364.192963]   <idle>-0        14d..2. 10356495837us : sched_switch: prev_comm=swapper/14 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=migration/14 next_pid=114 next_prio=0
[10364.194901] CPU:4 [LOST 11340756 EVENTS]
[10364.194901] rcu_tort-154       4d..2. 10358460910us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=I ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.197354]   <idle>-0         4d.h3. 10358460987us : dl_server_start <-enqueue_task_fair
[10364.198353]   <idle>-0         4dNh2. 10358460988us : sched_wakeup: comm=torture_onoff pid=190 prio=120 target_cpu=004
[10364.199679]   <idle>-0         4d..2. 10358460990us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=torture_onoff next_pid=190 next_prio=120
[10364.201647] torture_-190       4d..4. 10358461002us : sched_wakeup: comm=kworker/0:3 pid=10184 prio=120 target_cpu=000
[10364.202951] torture_-190       4d..3. 10358461005us : dl_server_stop <-dequeue_entities
[10364.203935] torture_-190       4d..2. 10358461009us : sched_switch: prev_comm=torture_onoff prev_pid=190 prev_prio=120 prev_state=D ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.205917]   <idle>-0         4d.h5. 10358461415us : dl_server_start <-enqueue_task_fair
[10364.206924]   <idle>-0         4dNh4. 10358461416us : sched_wakeup: comm=rcu_torture_rea pid=154 prio=139 target_cpu=004
[10364.208248]   <idle>-0         4d..2. 10358461420us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.210223] rcu_tort-154       4DNh3. 10358461884us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.211455] rcu_tort-154       4d..2. 10358461894us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.213415]   rcuc/4-45        4d..2. 10358461897us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.215353] rcu_tort-154       4DNh3. 10358463884us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.216578] rcu_tort-154       4d..2. 10358463896us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.218541]   rcuc/4-45        4d..2. 10358463900us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.220498] rcu_tort-154       4dNh3. 10358464884us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.221711] rcu_tort-154       4d..2. 10358464891us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.223672]   rcuc/4-45        4d..2. 10358464895us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.225631] rcu_tort-154       4d..2. 10358466463us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=50 next_prio=97
[10364.227682] rcu_exp_-50        4d..2. 10358466477us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=50 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.229728] rcu_tort-154       4d..2. 10358466485us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcub/9 next_pid=49 next_prio=97
[10364.231701]   rcub/9-49        4d..2. 10358466488us : sched_switch: prev_comm=rcub/9 prev_pid=49 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.233683] rcu_tort-154       4d..2. 10358466499us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=159 next_prio=97
[10364.235755] rcu_tort-159       4dN.4. 10358466512us : sched_wakeup: comm=rcub/14 pid=119 prio=97 target_cpu=015
[10364.236991] rcu_tort-159       4d..2. 10358466514us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10364.239078] rcu_tort-154       4d..2. 10358466736us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=50 next_prio=97
[10364.242118] rcu_exp_-50        4d..2. 10358466745us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=50 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.245206] rcu_tort-159       4d..2. 10358466753us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcub/9 next_pid=49 next_prio=97
[10364.248174]   rcub/9-49        4d..2. 10358466766us : sched_switch: prev_comm=rcub/9 prev_pid=49 prev_prio=97 prev_state=D ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.251095] rcu_tort-159       4d..2. 10358466775us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=162 next_prio=97
[10364.254239] rcu_tort-162       4d..2. 10358466788us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcub/9 next_pid=49 next_prio=97
[10364.257164]   rcub/9-49        4d..2. 10358466798us : sched_switch: prev_comm=rcub/9 prev_pid=49 prev_prio=97 prev_state=D ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.260047] rcu_tort-159       4d..2. 10358466818us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcub/9 next_pid=49 next_prio=97
[10364.261994]   rcub/9-49        4d..2. 10358466824us : sched_switch: prev_comm=rcub/9 prev_pid=49 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.263935] rcu_tort-162       4dNh3. 10358466883us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.265142] rcu_tort-162       4d..2. 10358466887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.267106]   rcuc/4-45        4d..2. 10358466891us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.269067] rcu_tort-159       4dNh4. 10358467884us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.270267] rcu_tort-159       4dN.4. 10358467890us : sched_wakeup: comm=ksoftirqd/4 pid=46 prio=97 target_cpu=004
[10364.271535] rcu_tort-159       4d..2. 10358467893us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.273486]   rcuc/4-45        4d..2. 10358467900us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/4 next_pid=46 next_prio=97
[10364.275385] ksoftirq-46        4d..2. 10358467903us : sched_switch: prev_comm=ksoftirqd/4 prev_pid=46 prev_prio=97 prev_state=S ==> next_comm=cpuhp/4 next_pid=43 next_prio=120
[10364.277285]  cpuhp/4-43        4d..2. 10358467910us : sched_switch: prev_comm=cpuhp/4 prev_pid=43 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10364.279270] rcu_tort-159       4dN.6. 10358467913us : sched_wakeup: comm=migration/4 pid=44 prio=0 target_cpu=004
[10364.280529] rcu_tort-159       4d..2. 10358467914us : sched_switch: prev_comm=rcu_torture_rea prev_pid=159 prev_prio=139 prev_state=R+ ==> next_comm=migration/4 next_pid=44 next_prio=0
[10364.282563] migratio-44        4d..4. 10358467918us : dl_server_stop <-dequeue_entities
[10364.283604] migratio-44        4d..4. 10358467920us : dl_server_start <-enqueue_task_fair
[10364.284623] migratio-44        4d..2. 10358467926us : sched_switch: prev_comm=migration/4 prev_pid=44 prev_prio=0 prev_state=S ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.286537]   <idle>-0         4dNh4. 10358469898us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.287757]   <idle>-0         4dN.4. 10358469903us : sched_wakeup: comm=ksoftirqd/4 pid=46 prio=97 target_cpu=004
[10364.289032]   <idle>-0         4d..2. 10358469906us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.290926]   rcuc/4-45        4d..2. 10358469913us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/4 next_pid=46 next_prio=97
[10364.292832] ksoftirq-46        4d..2. 10358469915us : sched_switch: prev_comm=ksoftirqd/4 prev_pid=46 prev_prio=97 prev_state=S ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.294838]   <idle>-0         4dNh4. 10358470903us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.296052]   <idle>-0         4d..2. 10358470909us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.297937]   rcuc/4-45        4d..2. 10358470913us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.299826]   <idle>-0         4dNh4. 10358471904us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.301057]   <idle>-0         4dN.4. 10358471909us : sched_wakeup: comm=ksoftirqd/4 pid=46 prio=97 target_cpu=004
[10364.302324]   <idle>-0         4d..2. 10358471911us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.304185]   rcuc/4-45        4d..2. 10358471917us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/4 next_pid=46 next_prio=97
[10364.306061] ksoftirq-46        4d..2. 10358471919us : sched_switch: prev_comm=ksoftirqd/4 prev_pid=46 prev_prio=97 prev_state=S ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.307999]   <idle>-0         4dNh4. 10358472890us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.309215]   <idle>-0         4d..2. 10358472894us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.311108]   rcuc/4-45        4d..2. 10358472896us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.312984]   <idle>-0         4dNh4. 10358474889us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.314194]   <idle>-0         4d..2. 10358474893us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.316063]   rcuc/4-45        4D..5. 10358474897us : dl_server_start <-enqueue_task_fair
[10364.317083]   rcuc/4-45        4DN.4. 10358474898us : sched_wakeup: comm=cpuhp/4 pid=43 prio=120 target_cpu=004
[10364.318335]   rcuc/4-45        4d..2. 10358474901us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=cpuhp/4 next_pid=43 next_prio=120
[10364.320194]  cpuhp/4-43        4dNh4. 10358476129us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.321427]  cpuhp/4-43        4d..2. 10358476137us : sched_switch: prev_comm=cpuhp/4 prev_pid=43 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.323276]   rcuc/4-45        4d..2. 10358476141us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=cpuhp/4 next_pid=43 next_prio=120
[10364.325147]  cpuhp/4-43        4d..3. 10358476148us : dl_server_stop <-dequeue_entities
[10364.326134]  cpuhp/4-43        4d..2. 10358476150us : sched_switch: prev_comm=cpuhp/4 prev_pid=43 prev_prio=120 prev_state=D ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.328012]   <idle>-0         4d..2. 10358476813us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/4 next_pid=43 next_prio=120
[10364.329904]  cpuhp/4-43        4d..3. 10358476847us : dl_server_stop <-dequeue_entities
[10364.330895]  cpuhp/4-43        4d..2. 10358476849us : sched_switch: prev_comm=cpuhp/4 prev_pid=43 prev_prio=120 prev_state=D ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.332789]   <idle>-0         4dNh4. 10358476897us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.334003]   <idle>-0         4d..2. 10358476901us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.335877]   rcuc/4-45        4d..2. 10358476905us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=S ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.337745]   <idle>-0         4d..2. 10358476929us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/4 next_pid=43 next_prio=120
[10364.339641]  cpuhp/4-43        4d..3. 10358476963us : dl_server_stop <-dequeue_entities
[10364.340642]  cpuhp/4-43        4d..2. 10358476964us : sched_switch: prev_comm=cpuhp/4 prev_pid=43 prev_prio=120 prev_state=D ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.342554]   <idle>-0         4d..2. 10358477012us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/4 next_pid=43 next_prio=120
[10364.344444]  cpuhp/4-43        4dN.3. 10358477164us : sched_wakeup: comm=ksoftirqd/4 pid=46 prio=97 target_cpu=004
[10364.345727]  cpuhp/4-43        4d..2. 10358477166us : sched_switch: prev_comm=cpuhp/4 prev_pid=43 prev_prio=120 prev_state=R+ ==> next_comm=ksoftirqd/4 next_pid=46 next_prio=97
[10364.347641] ksoftirq-46        4d..2. 10358477167us : sched_switch: prev_comm=ksoftirqd/4 prev_pid=46 prev_prio=97 prev_state=P ==> next_comm=cpuhp/4 next_pid=43 next_prio=120
[10364.349557]  cpuhp/4-43        4dN.3. 10358477169us : sched_wakeup: comm=rcuc/4 pid=45 prio=97 target_cpu=004
[10364.350765]  cpuhp/4-43        4d..2. 10358477170us : sched_switch: prev_comm=cpuhp/4 prev_pid=43 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/4 next_pid=45 next_prio=97
[10364.352633]   rcuc/4-45        4d..2. 10358477171us : sched_switch: prev_comm=rcuc/4 prev_pid=45 prev_prio=97 prev_state=P ==> next_comm=cpuhp/4 next_pid=43 next_prio=120
[10364.354488]  cpuhp/4-43        4d..3. 10358477177us : dl_server_stop <-dequeue_entities
[10364.355483]  cpuhp/4-43        4d..2. 10358477178us : sched_switch: prev_comm=cpuhp/4 prev_pid=43 prev_prio=120 prev_state=S ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.357344]   <idle>-0         4d..2. 10358477189us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/4 next_pid=43 next_prio=120
[10364.359232]  cpuhp/4-43        4d..3. 10358477192us : dl_server_stop <-dequeue_entities
[10364.360212]  cpuhp/4-43        4d..2. 10358477193us : sched_switch: prev_comm=cpuhp/4 prev_pid=43 prev_prio=120 prev_state=P ==> next_comm=swapper/4 next_pid=0 next_prio=120
[10364.362106]   <idle>-0         4d..2. 10358477207us : sched_switch: prev_comm=swapper/4 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=migration/4 next_pid=44 next_prio=0
[10364.364016] CPU:8 [LOST 11393681 EVENTS]
[10364.364016]   rcuc/8-73        8d..2. 10358679902us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.366356]   <idle>-0         8dNh4. 10358680889us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.367591]   <idle>-0         8d..2. 10358680893us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.369453]   rcuc/8-73        8d..2. 10358680903us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.371300]   <idle>-0         8dN.4. 10358681891us : sched_wakeup: comm=ksoftirqd/8 pid=74 prio=97 target_cpu=008
[10364.372587]   <idle>-0         8d..2. 10358681893us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=ksoftirqd/8 next_pid=74 next_prio=97
[10364.374518] ksoftirq-74        8d..2. 10358681904us : sched_switch: prev_comm=ksoftirqd/8 prev_pid=74 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.376435]   <idle>-0         8dNh2. 10358682828us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=008
[10364.377733]   <idle>-0         8d..2. 10358682829us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_exp_gp_kthr next_pid=20 next_prio=97
[10364.379685] rcu_exp_-20        8d..4. 10358682843us : sched_wakeup: comm=rcu_exp_par_gp_ pid=18 prio=97 target_cpu=000
[10364.380988] rcu_exp_-20        8d..4. 10358682847us : sched_wakeup: comm=rcu_exp_par_gp_ pid=36 prio=97 target_cpu=002
[10364.382284] rcu_exp_-20        8d..4. 10358682851us : sched_wakeup: comm=rcu_exp_par_gp_ pid=50 prio=97 target_cpu=005
[10364.383611] rcu_exp_-20        8d..4. 10358682857us : sched_wakeup: comm=rcu_exp_par_gp_ pid=64 prio=97 target_cpu=007
[10364.384914] rcu_exp_-20        8d..4. 10358682862us : sched_wakeup: comm=rcu_exp_par_gp_ pid=78 prio=97 target_cpu=009
[10364.386226] rcu_exp_-20        8d..4. 10358682866us : sched_wakeup: comm=rcu_exp_par_gp_ pid=92 prio=97 target_cpu=010
[10364.387546] rcu_exp_-20        8d..4. 10358682872us : sched_wakeup: comm=rcu_exp_par_gp_ pid=106 prio=97 target_cpu=012
[10364.388915] rcu_exp_-20        8dNh5. 10358682882us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.390123] rcu_exp_-20        8d..2. 10358682887us : sched_switch: prev_comm=rcu_exp_gp_kthr prev_pid=20 prev_prio=97 prev_state=R+ ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.392062]   rcuc/8-73        8d..2. 10358682890us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=rcu_exp_gp_kthr next_pid=20 next_prio=97
[10364.393996] rcu_exp_-20        8d..3. 10358682898us : sched_wakeup: comm=rcub/14 pid=119 prio=97 target_cpu=015
[10364.395230] rcu_exp_-20        8d..4. 10358682908us : sched_wakeup: comm=kworker/2:1 pid=18174 prio=120 target_cpu=002
[10364.396559] rcu_exp_-20        8d..2. 10358682917us : sched_switch: prev_comm=rcu_exp_gp_kthr prev_pid=20 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.398535]   <idle>-0         8dNh2. 10358682920us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=008
[10364.399841]   <idle>-0         8d..2. 10358682921us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_exp_gp_kthr next_pid=20 next_prio=97
[10364.401802] rcu_exp_-20        8d..4. 10358682927us : sched_wakeup: comm=rcu_exp_par_gp_ pid=18 prio=97 target_cpu=000
[10364.403119] rcu_exp_-20        8d..4. 10358682931us : sched_wakeup: comm=rcu_exp_par_gp_ pid=36 prio=97 target_cpu=002
[10364.404451] rcu_exp_-20        8d..4. 10358682935us : sched_wakeup: comm=rcu_exp_par_gp_ pid=50 prio=97 target_cpu=005
[10364.405750] rcu_exp_-20        8d..4. 10358682940us : sched_wakeup: comm=rcu_exp_par_gp_ pid=64 prio=97 target_cpu=007
[10364.407051] rcu_exp_-20        8d..4. 10358682946us : sched_wakeup: comm=rcu_exp_par_gp_ pid=78 prio=97 target_cpu=009
[10364.408364] rcu_exp_-20        8d..4. 10358682949us : sched_wakeup: comm=rcu_exp_par_gp_ pid=92 prio=97 target_cpu=010
[10364.409686] rcu_exp_-20        8d..2. 10358682971us : sched_switch: prev_comm=rcu_exp_gp_kthr prev_pid=20 prev_prio=97 prev_state=D ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.411649]   <idle>-0         8dNh2. 10358682973us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=008
[10364.412963]   <idle>-0         8d..2. 10358682974us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_exp_gp_kthr next_pid=20 next_prio=97
[10364.414936] rcu_exp_-20        8d..2. 10358682989us : sched_switch: prev_comm=rcu_exp_gp_kthr prev_pid=20 prev_prio=97 prev_state=D ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.416913]   <idle>-0         8dNh2. 10358682991us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=008
[10364.418212]   <idle>-0         8d..2. 10358682992us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_exp_gp_kthr next_pid=20 next_prio=97
[10364.420177] rcu_exp_-20        8d..2. 10358683002us : sched_switch: prev_comm=rcu_exp_gp_kthr prev_pid=20 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.422145]   <idle>-0         8dNh4. 10358683890us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.423354]   <idle>-0         8d..2. 10358683894us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.425234]   rcuc/8-73        8d..2. 10358683905us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.427107]   <idle>-0         8dNh4. 10358685890us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.428339]   <idle>-0         8d..2. 10358685894us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.430218]   rcuc/8-73        8d..2. 10358685902us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.432081]   <idle>-0         8dNh4. 10358686889us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.433301]   <idle>-0         8d..2. 10358686893us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.435184]   rcuc/8-73        8D..4. 10358686901us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=015
[10364.436468]   rcuc/8-73        8d..2. 10358686912us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.438312]   <idle>-0         8dNh4. 10358687890us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.439540]   <idle>-0         8d..2. 10358687894us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.441405]   rcuc/8-73        8d..2. 10358687907us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.443263]   <idle>-0         8dNh4. 10358688890us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.444539]   <idle>-0         8d..2. 10358688894us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.446401]   rcuc/8-73        8d..2. 10358688900us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.448252]   <idle>-0         8d.h3. 10358688906us : dl_server_start <-enqueue_task_fair
[10364.449258]   <idle>-0         8dNh2. 10358688907us : sched_wakeup: comm=cpuhp/8 pid=71 prio=120 target_cpu=008
[10364.450502]   <idle>-0         8d..2. 10358688908us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/8 next_pid=71 next_prio=120
[10364.452389]  cpuhp/8-71        8d..3. 10358688913us : dl_server_stop <-dequeue_entities
[10364.453360]  cpuhp/8-71        8d..2. 10358688917us : sched_switch: prev_comm=cpuhp/8 prev_pid=71 prev_prio=120 prev_state=D ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.455249]   <idle>-0         8dNh4. 10358689890us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.456486]   <idle>-0         8d..2. 10358689894us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.458341]   rcuc/8-73        8d..2. 10358689896us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.460232]   <idle>-0         8dNh4. 10358690890us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.461454]   <idle>-0         8d..2. 10358690894us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.463299]   rcuc/8-73        8d..2. 10358690896us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.465158]   <idle>-0         8dNh4. 10358693888us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.466361]   <idle>-0         8d..2. 10358693892us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.468226]   rcuc/8-73        8d..2. 10358693895us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.470080]   <idle>-0         8dNh4. 10358694889us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.471287]   <idle>-0         8d..2. 10358694892us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.473145]   rcuc/8-73        8d..2. 10358694895us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.474994]   <idle>-0         8dNh4. 10358695904us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.476201]   <idle>-0         8d..2. 10358695909us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.478074]   rcuc/8-73        8D..5. 10358695912us : dl_server_start <-enqueue_task_fair
[10364.479084]   rcuc/8-73        8DN.4. 10358695913us : sched_wakeup: comm=cpuhp/8 pid=71 prio=120 target_cpu=008
[10364.480308]   rcuc/8-73        8d..2. 10358695915us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=cpuhp/8 next_pid=71 next_prio=120
[10364.482172]  cpuhp/8-71        8dNh4. 10358697094us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.483395]  cpuhp/8-71        8d..2. 10358697102us : sched_switch: prev_comm=cpuhp/8 prev_pid=71 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.485249]   rcuc/8-73        8d..2. 10358697105us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=S ==> next_comm=cpuhp/8 next_pid=71 next_prio=120
[10364.487109]  cpuhp/8-71        8d..3. 10358697112us : dl_server_stop <-dequeue_entities
[10364.488096]  cpuhp/8-71        8d..2. 10358697113us : sched_switch: prev_comm=cpuhp/8 prev_pid=71 prev_prio=120 prev_state=D ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.489977]   <idle>-0         8d..2. 10358697856us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/8 next_pid=71 next_prio=120
[10364.491867]  cpuhp/8-71        8d..3. 10358697887us : dl_server_stop <-dequeue_entities
[10364.492896]  cpuhp/8-71        8d..2. 10358697888us : sched_switch: prev_comm=cpuhp/8 prev_pid=71 prev_prio=120 prev_state=D ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.494782]   <idle>-0         8d..2. 10358698941us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/8 next_pid=71 next_prio=120
[10364.496683]  cpuhp/8-71        8d..3. 10358698975us : dl_server_stop <-dequeue_entities
[10364.497672]  cpuhp/8-71        8d..2. 10358698977us : sched_switch: prev_comm=cpuhp/8 prev_pid=71 prev_prio=120 prev_state=D ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.499548]   <idle>-0         8d..2. 10358699087us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/8 next_pid=71 next_prio=120
[10364.501427]  cpuhp/8-71        8dN.3. 10358699198us : sched_wakeup: comm=ksoftirqd/8 pid=74 prio=97 target_cpu=008
[10364.502688]  cpuhp/8-71        8d..2. 10358699200us : sched_switch: prev_comm=cpuhp/8 prev_pid=71 prev_prio=120 prev_state=R+ ==> next_comm=ksoftirqd/8 next_pid=74 next_prio=97
[10364.504598] ksoftirq-74        8d..2. 10358699202us : sched_switch: prev_comm=ksoftirqd/8 prev_pid=74 prev_prio=97 prev_state=P ==> next_comm=cpuhp/8 next_pid=71 next_prio=120
[10364.506513]  cpuhp/8-71        8dN.3. 10358699203us : sched_wakeup: comm=rcuc/8 pid=73 prio=97 target_cpu=008
[10364.507722]  cpuhp/8-71        8d..2. 10358699203us : sched_switch: prev_comm=cpuhp/8 prev_pid=71 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/8 next_pid=73 next_prio=97
[10364.509583]   rcuc/8-73        8d..2. 10358699204us : sched_switch: prev_comm=rcuc/8 prev_pid=73 prev_prio=97 prev_state=P ==> next_comm=cpuhp/8 next_pid=71 next_prio=120
[10364.511445]  cpuhp/8-71        8d..3. 10358699209us : dl_server_stop <-dequeue_entities
[10364.512434]  cpuhp/8-71        8d..2. 10358699210us : sched_switch: prev_comm=cpuhp/8 prev_pid=71 prev_prio=120 prev_state=S ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.514450]   <idle>-0         8d..2. 10358699899us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/8 next_pid=71 next_prio=120
[10364.517264]  cpuhp/8-71        8d..3. 10358699903us : dl_server_stop <-dequeue_entities
[10364.518709]  cpuhp/8-71        8d..2. 10358699904us : sched_switch: prev_comm=cpuhp/8 prev_pid=71 prev_prio=120 prev_state=P ==> next_comm=swapper/8 next_pid=0 next_prio=120
[10364.520877]   <idle>-0         8d..2. 10358699941us : sched_switch: prev_comm=swapper/8 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=migration/8 next_pid=72 next_prio=0
[10364.522805] CPU:10 [LOST 11861188 EVENTS]
[10364.522805] ksoftirq-88       10d..2. 10359438892us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=157 next_prio=139
[10364.525286] rcu_tort-157      10d..3. 10359440891us : dl_server_stop <-dequeue_entities
[10364.526273] rcu_tort-157      10d..2. 10359440900us : sched_switch: prev_comm=rcu_torture_rea prev_pid=157 prev_prio=139 prev_state=I ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.528270]   <idle>-0        10d.h5. 10359441399us : dl_server_start <-enqueue_task_fair
[10364.529780]   <idle>-0        10dNh4. 10359441400us : sched_wakeup: comm=rcu_torture_rea pid=157 prio=139 target_cpu=010
[10364.531819]   <idle>-0        10d..2. 10359441402us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_torture_rea next_pid=157 next_prio=139
[10364.534347] rcu_tort-157      10dN.4. 10359445885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.535632] rcu_tort-157      10d..2. 10359445887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=157 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.537640] ksoftirq-88       10d..2. 10359445892us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=157 next_prio=139
[10364.539631] rcu_tort-157      10dN.4. 10359447885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.540899] rcu_tort-157      10d..2. 10359447887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=157 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.542914] ksoftirq-88       10d..2. 10359447892us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=157 next_prio=139
[10364.544910] rcu_tort-157      10d..3. 10359451888us : dl_server_stop <-dequeue_entities
[10364.545882] rcu_tort-157      10d..3. 10359451895us : dl_server_start <-enqueue_task_fair
[10364.546886] rcu_tort-157      10d..2. 10359451897us : sched_switch: prev_comm=rcu_torture_rea prev_pid=157 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.548947] rcu_tort-158      10d.h3. 10359452390us : sched_wakeup: comm=rcu_torture_rea pid=157 prio=139 target_cpu=010
[10364.550265] rcu_tort-158      10dN.3. 10359452884us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.551556] rcu_tort-158      10d..2. 10359452886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.553559] ksoftirq-88       10d..2. 10359452892us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=157 next_prio=139
[10364.555583] rcu_tort-157      10dN.3. 10359453885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.556846] rcu_tort-157      10d..2. 10359453887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=157 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.558848] ksoftirq-88       10d..2. 10359453892us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.560842] rcu_tort-158      10d..2. 10359454888us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=157 next_prio=139
[10364.562898] rcu_tort-157      10dN.3. 10359456885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.564162] rcu_tort-157      10d..2. 10359456886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=157 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.566174] ksoftirq-88       10d..2. 10359456893us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.568174] rcu_tort-158      10d..3. 10359458891us : dl_server_stop <-dequeue_entities
[10364.569149] rcu_tort-158      10d..2. 10359458896us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=I ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.571131]   <idle>-0        10d.h5. 10359459398us : dl_server_start <-enqueue_task_fair
[10364.572130]   <idle>-0        10dNh4. 10359459399us : sched_wakeup: comm=rcu_torture_rea pid=158 prio=139 target_cpu=010
[10364.573459]   <idle>-0        10d..2. 10359459401us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.575440] rcu_tort-158      10dN.5. 10359459884us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.576717] rcu_tort-158      10d..2. 10359459886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.578728] ksoftirq-88       10d..2. 10359459888us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.580719] rcu_tort-158      10dN.3. 10359461885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.581996] rcu_tort-158      10d..2. 10359461887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.584021] ksoftirq-88       10d..2. 10359461891us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.586023] rcu_tort-158      10dN.5. 10359464885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.587282] rcu_tort-158      10d..2. 10359465079us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.589282] ksoftirq-88       10d..2. 10359465082us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.591269] rcu_tort-158      10DNh3. 10359468882us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.592485] rcu_tort-158      10d..2. 10359468887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.594429]  rcuc/10-87       10d..2. 10359468891us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.596349] rcu_tort-158      10dN.4. 10359469885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.597660] rcu_tort-158      10d..2. 10359469887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.599654] ksoftirq-88       10d..2. 10359469891us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.601639] rcu_tort-158      10d..3. 10359469895us : dl_server_stop <-dequeue_entities
[10364.602612] rcu_tort-158      10d..2. 10359469900us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=I ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.604576]   <idle>-0        10d.h5. 10359470402us : dl_server_start <-enqueue_task_fair
[10364.605573]   <idle>-0        10dNh4. 10359470403us : sched_wakeup: comm=rcu_torture_rea pid=158 prio=139 target_cpu=010
[10364.606884]   <idle>-0        10d..2. 10359470405us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.608852] rcu_tort-158      10dN.4. 10359472885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.610117] rcu_tort-158      10d..2. 10359472887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.612120] ksoftirq-88       10d..2. 10359472891us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.614104] rcu_tort-158      10dN.4. 10359474886us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.615376] rcu_tort-158      10d..2. 10359474888us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.617346] ksoftirq-88       10d..2. 10359474891us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.619337] rcu_tort-158      10dN.3. 10359479885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.620611] rcu_tort-158      10d..2. 10359479886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.622624] ksoftirq-88       10d..2. 10359479891us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.624618] rcu_tort-158      10d..3. 10359480888us : dl_server_stop <-dequeue_entities
[10364.625612] rcu_tort-158      10d..3. 10359480895us : dl_server_start <-enqueue_task_fair
[10364.626622] rcu_tort-158      10d..2. 10359480897us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=164 next_prio=139
[10364.629297] rcu_tort-164      10D.h3. 10359481390us : sched_wakeup: comm=rcu_torture_rea pid=158 prio=139 target_cpu=010
[10364.631340] rcu_tort-164      10dNh3. 10359481881us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.633161] rcu_tort-164      10dN.3. 10359481885us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.635099] rcu_tort-164      10d..2. 10359481887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=164 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.637988]  rcuc/10-87       10d..2. 10359481890us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.640859] ksoftirq-88       10d..2. 10359481892us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.643888] rcu_tort-158      10DNh4. 10359482981us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.645775] rcu_tort-158      10d..2. 10359482990us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.649302]  rcuc/10-87       10d..2. 10359482992us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=164 next_prio=139
[10364.651766] rcu_tort-164      10dNh4. 10359483882us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.653287] rcu_tort-164      10d..2. 10359483887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=164 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.655716]  rcuc/10-87       10d..2. 10359483896us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.658108] rcu_tort-158      10dNh3. 10359484882us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.659614] rcu_tort-158      10dN.3. 10359484886us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.661172] rcu_tort-158      10d..2. 10359484887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.663589]  rcuc/10-87       10d..2. 10359484891us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.665923] ksoftirq-88       10d..2. 10359484893us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=164 next_prio=139
[10364.668400] rcu_tort-164      10d..3. 10359486892us : dl_server_stop <-dequeue_entities
[10364.669608] rcu_tort-164      10d..2. 10359486897us : sched_switch: prev_comm=rcu_torture_rea prev_pid=164 prev_prio=139 prev_state=I ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.672052]   <idle>-0        10d.h5. 10359487399us : dl_server_start <-enqueue_task_fair
[10364.673277]   <idle>-0        10dNh4. 10359487400us : sched_wakeup: comm=rcu_torture_rea pid=164 prio=139 target_cpu=010
[10364.674928]   <idle>-0        10d..2. 10359487403us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_torture_rea next_pid=164 next_prio=139
[10364.677381] rcu_tort-164      10dNh3. 10359487882us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.678886] rcu_tort-164      10dN.3. 10359487886us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.680454] rcu_tort-164      10d..2. 10359487888us : sched_switch: prev_comm=rcu_torture_rea prev_pid=164 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.682866]  rcuc/10-87       10d..2. 10359487892us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.685203] ksoftirq-88       10d..2. 10359487894us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=164 next_prio=139
[10364.687671] rcu_tort-164      10dNh3. 10359488882us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.689172] rcu_tort-164      10d..2. 10359488888us : sched_switch: prev_comm=rcu_torture_rea prev_pid=164 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.691582]  rcuc/10-87       10d..2. 10359488891us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=cpuhp/10 next_pid=85 next_prio=120
[10364.693876] cpuhp/10-85       10d..2. 10359488896us : sched_switch: prev_comm=cpuhp/10 prev_pid=85 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_rea next_pid=164 next_prio=139
[10364.696290] rcu_tort-164      10dN.6. 10359488898us : sched_wakeup: comm=migration/10 pid=86 prio=0 target_cpu=010
[10364.697854] rcu_tort-164      10d..2. 10359488900us : sched_switch: prev_comm=rcu_torture_rea prev_pid=164 prev_prio=139 prev_state=R+ ==> next_comm=migration/10 next_pid=86 next_prio=0
[10364.700315] migratio-86       10d..4. 10359488902us : dl_server_stop <-dequeue_entities
[10364.701606] migratio-86       10d..2. 10359488911us : sched_switch: prev_comm=migration/10 prev_pid=86 prev_prio=0 prev_state=S ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.704045]   <idle>-0        10dN.4. 10359489890us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.705664]   <idle>-0        10d..2. 10359489892us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.708112] ksoftirq-88       10d..2. 10359489897us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=S ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.710557]   <idle>-0        10dNh4. 10359491888us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.712098]   <idle>-0        10d..2. 10359491892us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.714481]  rcuc/10-87       10d..2. 10359491895us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.716849]   <idle>-0        10dNh4. 10359492888us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.718395]   <idle>-0        10d..2. 10359492891us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.720766]  rcuc/10-87       10d..2. 10359492894us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.723153]   <idle>-0        10dNh4. 10359495888us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.724703]   <idle>-0        10d..2. 10359495892us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.727083]  rcuc/10-87       10d..2. 10359495895us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.729477]   <idle>-0        10dNh4. 10359496889us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.731016]   <idle>-0        10d..2. 10359496893us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.733405]  rcuc/10-87       10d..2. 10359496896us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.735791]   <idle>-0        10dNh4. 10359498888us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.737333]   <idle>-0        10d..2. 10359498892us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.739724]  rcuc/10-87       10D..5. 10359498895us : dl_server_start <-enqueue_task_fair
[10364.740988]  rcuc/10-87       10DN.4. 10359498896us : sched_wakeup: comm=cpuhp/10 pid=85 prio=120 target_cpu=010
[10364.742561]  rcuc/10-87       10d..2. 10359498899us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=cpuhp/10 next_pid=85 next_prio=120
[10364.744920] cpuhp/10-85       10dNh4. 10359500093us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.746473] cpuhp/10-85       10d..2. 10359500101us : sched_switch: prev_comm=cpuhp/10 prev_pid=85 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.748851]  rcuc/10-87       10d..2. 10359500103us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=S ==> next_comm=cpuhp/10 next_pid=85 next_prio=120
[10364.751225] cpuhp/10-85       10d..3. 10359500110us : dl_server_stop <-dequeue_entities
[10364.752474] cpuhp/10-85       10d..2. 10359500111us : sched_switch: prev_comm=cpuhp/10 prev_pid=85 prev_prio=120 prev_state=D ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.754882]   <idle>-0        10d..2. 10359501178us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/10 next_pid=85 next_prio=120
[10364.757289] cpuhp/10-85       10d..3. 10359501202us : dl_server_stop <-dequeue_entities
[10364.758539] cpuhp/10-85       10d..2. 10359501203us : sched_switch: prev_comm=cpuhp/10 prev_pid=85 prev_prio=120 prev_state=D ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.760947]   <idle>-0        10d..2. 10359501247us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/10 next_pid=85 next_prio=120
[10364.763353] cpuhp/10-85       10d..3. 10359501280us : dl_server_stop <-dequeue_entities
[10364.764599] cpuhp/10-85       10d..2. 10359501281us : sched_switch: prev_comm=cpuhp/10 prev_pid=85 prev_prio=120 prev_state=D ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.767007]   <idle>-0        10d..2. 10359501316us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/10 next_pid=85 next_prio=120
[10364.769417] cpuhp/10-85       10dN.3. 10359501462us : sched_wakeup: comm=ksoftirqd/10 pid=88 prio=97 target_cpu=010
[10364.771027] cpuhp/10-85       10d..2. 10359501463us : sched_switch: prev_comm=cpuhp/10 prev_pid=85 prev_prio=120 prev_state=R+ ==> next_comm=ksoftirqd/10 next_pid=88 next_prio=97
[10364.773481] ksoftirq-88       10d..2. 10359501465us : sched_switch: prev_comm=ksoftirqd/10 prev_pid=88 prev_prio=97 prev_state=P ==> next_comm=cpuhp/10 next_pid=85 next_prio=120
[10364.775907] cpuhp/10-85       10dN.3. 10359501467us : sched_wakeup: comm=rcuc/10 pid=87 prio=97 target_cpu=010
[10364.777455] cpuhp/10-85       10d..2. 10359501468us : sched_switch: prev_comm=cpuhp/10 prev_pid=85 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/10 next_pid=87 next_prio=97
[10364.779828]  rcuc/10-87       10d..2. 10359501469us : sched_switch: prev_comm=rcuc/10 prev_pid=87 prev_prio=97 prev_state=P ==> next_comm=cpuhp/10 next_pid=85 next_prio=120
[10364.782188] cpuhp/10-85       10d..3. 10359501475us : dl_server_stop <-dequeue_entities
[10364.783432] cpuhp/10-85       10d..2. 10359501476us : sched_switch: prev_comm=cpuhp/10 prev_pid=85 prev_prio=120 prev_state=S ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.785844]   <idle>-0        10d..2. 10359501601us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/10 next_pid=85 next_prio=120
[10364.788248] cpuhp/10-85       10d..3. 10359501606us : dl_server_stop <-dequeue_entities
[10364.789494] cpuhp/10-85       10d..2. 10359501608us : sched_switch: prev_comm=cpuhp/10 prev_pid=85 prev_prio=120 prev_state=P ==> next_comm=swapper/10 next_pid=0 next_prio=120
[10364.791897]   <idle>-0        10d..2. 10359501641us : sched_switch: prev_comm=swapper/10 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=migration/10 next_pid=86 next_prio=0
[10364.794329] CPU:12 [LOST 11813902 EVENTS]
[10364.794329] rcu_tort-162      12d..2. 10360086891us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.797447]  rcuc/12-101      12d..2. 10360086894us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.799934] rcu_tort-162      12dNh3. 10360087882us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.801492] rcu_tort-162      12d..2. 10360087886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.803987]  rcuc/12-101      12d..2. 10360087889us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.806513] rcu_tort-162      12dN.3. 10360088885us : sched_wakeup: comm=ksoftirqd/12 pid=102 prio=97 target_cpu=012
[10364.808129] rcu_tort-162      12d..2. 10360088887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/12 next_pid=102 next_prio=97
[10364.810696] ksoftirq-102      12d..2. 10360088892us : sched_switch: prev_comm=ksoftirqd/12 prev_pid=102 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.813279] rcu_tort-162      12DNh3. 10360089882us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.814851] rcu_tort-162      12d..2. 10360089887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.817340]  rcuc/12-101      12d..2. 10360089890us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.819829] rcu_tort-162      12DNh3. 10360090881us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.821390] rcu_tort-162      12d..2. 10360090888us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.823886]  rcuc/12-101      12d..2. 10360090891us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.826366] rcu_tort-162      12dNh3. 10360091882us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.827923] rcu_tort-162      12d..2. 10360091887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.830429]  rcuc/12-101      12d..2. 10360091890us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.832908] rcu_tort-162      12DNh3. 10360092882us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.834470] rcu_tort-162      12d..2. 10360092890us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.836969]  rcuc/12-101      12d..2. 10360092892us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.839471] rcu_tort-162      12dN.3. 10360094884us : sched_wakeup: comm=ksoftirqd/12 pid=102 prio=97 target_cpu=012
[10364.841095] rcu_tort-162      12d..2. 10360094886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/12 next_pid=102 next_prio=97
[10364.843669] ksoftirq-102      12d..2. 10360094891us : sched_switch: prev_comm=ksoftirqd/12 prev_pid=102 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.846224] rcu_tort-162      12dNh4. 10360095883us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.847795] rcu_tort-162      12d..2. 10360095887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.850292]  rcuc/12-101      12d..2. 10360095890us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.852785] rcu_tort-162      12d..2. 10360096233us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=155 next_prio=97
[10364.855399] rcu_tort-155      12d..2. 10360096243us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=158 next_prio=97
[10364.858003] rcu_tort-158      12dN.4. 10360096407us : sched_wakeup: comm=rcub/13 pid=105 prio=97 target_cpu=013
[10364.859564] rcu_tort-158      12d..2. 10360096418us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=162 next_prio=97
[10364.862163] rcu_tort-162      12d..4. 10360096428us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=015
[10364.863817] rcu_tort-162      12dN.4. 10360096435us : sched_wakeup: comm=rcub/13 pid=105 prio=97 target_cpu=013
[10364.865377] rcu_tort-162      12d..2. 10360096437us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=155 next_prio=139
[10364.867991] rcu_tort-155      12dNh3. 10360096884us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.869558] rcu_tort-155      12dN.3. 10360096888us : sched_wakeup: comm=ksoftirqd/12 pid=102 prio=97 target_cpu=012
[10364.871184] rcu_tort-155      12d..2. 10360096889us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.873684]  rcuc/12-101      12d..2. 10360096894us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/12 next_pid=102 next_prio=97
[10364.876115] ksoftirq-102      12d..2. 10360096896us : sched_switch: prev_comm=ksoftirqd/12 prev_pid=102 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10364.878701] rcu_tort-162      12d..2. 10360096901us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.881300] rcu_tort-158      12dNh3. 10360098883us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.882859] rcu_tort-158      12dN.3. 10360098887us : sched_wakeup: comm=ksoftirqd/12 pid=102 prio=97 target_cpu=012
[10364.884486] rcu_tort-158      12d..2. 10360098889us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.886983]  rcuc/12-101      12d..2. 10360098894us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/12 next_pid=102 next_prio=97
[10364.889425] ksoftirq-102      12d..2. 10360098896us : sched_switch: prev_comm=ksoftirqd/12 prev_pid=102 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=155 next_prio=139
[10364.891978] rcu_tort-155      12dNh4. 10360099882us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.893556] rcu_tort-155      12d..2. 10360099887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.896048]  rcuc/12-101      12d..2. 10360099889us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=155 next_prio=139
[10364.898683] rcu_tort-155      12d..2. 10360100609us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.901293] rcu_tort-158      12dN.3. 10360100885us : sched_wakeup: comm=ksoftirqd/12 pid=102 prio=97 target_cpu=012
[10364.902922] rcu_tort-158      12d..2. 10360100888us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/12 next_pid=102 next_prio=97
[10364.905489] ksoftirq-102      12d..2. 10360100892us : sched_switch: prev_comm=ksoftirqd/12 prev_pid=102 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=155 next_prio=139
[10364.908063] rcu_tort-155      12dNh4. 10360101883us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.909630] rcu_tort-155      12dN.4. 10360101886us : sched_wakeup: comm=ksoftirqd/12 pid=102 prio=97 target_cpu=012
[10364.911245] rcu_tort-155      12d..2. 10360101889us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.913743]  rcuc/12-101      12d..2. 10360101893us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/12 next_pid=102 next_prio=97
[10364.916168] ksoftirq-102      12d..2. 10360101895us : sched_switch: prev_comm=ksoftirqd/12 prev_pid=102 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.918712] rcu_tort-158      12d..2. 10360101903us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=155 next_prio=139
[10364.921312] rcu_tort-155      12d..3. 10360101905us : dl_server_stop <-dequeue_entities
[10364.922551] rcu_tort-155      12d..2. 10360101907us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=I ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10364.925058]   <idle>-0        12d.h5. 10360102410us : dl_server_start <-enqueue_task_fair
[10364.926324]   <idle>-0        12dNh4. 10360102411us : sched_wakeup: comm=rcu_torture_rea pid=158 prio=139 target_cpu=012
[10364.928003]   <idle>-0        12d..2. 10360102417us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.930508] rcu_tort-158      12DNh3. 10360103077us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.932062] rcu_tort-158      12d..2. 10360103085us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.934566]  rcuc/12-101      12d..2. 10360103087us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.937046] rcu_tort-158      12DNh3. 10360104882us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.938604] rcu_tort-158      12d..2. 10360104889us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.941108]  rcuc/12-101      12d..2. 10360104893us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.943596] rcu_tort-158      12dNh4. 10360105882us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.945150] rcu_tort-158      12d..2. 10360105887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.947646]  rcuc/12-101      12d..2. 10360105891us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=cpuhp/12 next_pid=99 next_prio=120
[10364.950029] cpuhp/12-99       12d..2. 10360105896us : sched_switch: prev_comm=cpuhp/12 prev_pid=99 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10364.952532] rcu_tort-158      12dN.6. 10360105898us : sched_wakeup: comm=migration/12 pid=100 prio=0 target_cpu=012
[10364.954137] rcu_tort-158      12d..2. 10360105900us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=migration/12 next_pid=100 next_prio=0
[10364.956693] migratio-100      12d..4. 10360105903us : dl_server_stop <-dequeue_entities
[10364.957931] migratio-100      12d..2. 10360105911us : sched_switch: prev_comm=migration/12 prev_pid=100 prev_prio=0 prev_state=S ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10364.960382]   <idle>-0        12dN.4. 10360106892us : sched_wakeup: comm=ksoftirqd/12 pid=102 prio=97 target_cpu=012
[10364.962008]   <idle>-0        12d..2. 10360106893us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=ksoftirqd/12 next_pid=102 next_prio=97
[10364.964470] ksoftirq-102      12d..2. 10360106898us : sched_switch: prev_comm=ksoftirqd/12 prev_pid=102 prev_prio=97 prev_state=S ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10364.966928]   <idle>-0        12dNh4. 10360107890us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.968492]   <idle>-0        12d..2. 10360107893us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.970884]  rcuc/12-101      12d..2. 10360107896us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10364.973273]   <idle>-0        12dNh4. 10360108890us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.974834]   <idle>-0        12d..2. 10360108894us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.977221]  rcuc/12-101      12d..2. 10360108897us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10364.979622]   <idle>-0        12dNh4. 10360110898us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.981175]   <idle>-0        12d..2. 10360110905us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.983574]  rcuc/12-101      12d..2. 10360110909us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10364.985967]   <idle>-0        12dNh4. 10360111891us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.987526]   <idle>-0        12d..2. 10360111895us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.989919]  rcuc/12-101      12d..2. 10360111899us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10364.992309]   <idle>-0        12dNh4. 10360113888us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10364.993863]   <idle>-0        12d..2. 10360113891us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10364.996255]  rcuc/12-101      12D..5. 10360113894us : dl_server_start <-enqueue_task_fair
[10364.997527]  rcuc/12-101      12DN.4. 10360113896us : sched_wakeup: comm=cpuhp/12 pid=99 prio=120 target_cpu=012
[10364.999095]  rcuc/12-101      12D..4. 10360113899us : sched_wakeup: comm=rcu_torture_bar pid=196 prio=120 target_cpu=011
[10365.000773]  rcuc/12-101      12d..2. 10360113901us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=cpuhp/12 next_pid=99 next_prio=120
[10365.003153] cpuhp/12-99       12d..3. 10360114795us : dl_server_stop <-dequeue_entities
[10365.004403] cpuhp/12-99       12d..2. 10360114797us : sched_switch: prev_comm=cpuhp/12 prev_pid=99 prev_prio=120 prev_state=D ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10365.006802]   <idle>-0        12dNh4. 10360114887us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10365.008355]   <idle>-0        12d..2. 10360114891us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10365.010753]  rcuc/12-101      12d..2. 10360114893us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=S ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10365.013167]   <idle>-0        12d..2. 10360115537us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/12 next_pid=99 next_prio=120
[10365.015578] cpuhp/12-99       12d..3. 10360115560us : dl_server_stop <-dequeue_entities
[10365.016814] cpuhp/12-99       12d..2. 10360115562us : sched_switch: prev_comm=cpuhp/12 prev_pid=99 prev_prio=120 prev_state=D ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10365.019215]   <idle>-0        12d..2. 10360115627us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/12 next_pid=99 next_prio=120
[10365.021620] cpuhp/12-99       12d..3. 10360115653us : dl_server_stop <-dequeue_entities
[10365.022856] cpuhp/12-99       12d..2. 10360115654us : sched_switch: prev_comm=cpuhp/12 prev_pid=99 prev_prio=120 prev_state=D ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10365.025256]   <idle>-0        12d..2. 10360115692us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/12 next_pid=99 next_prio=120
[10365.027665] cpuhp/12-99       12dN.3. 10360115803us : sched_wakeup: comm=ksoftirqd/12 pid=102 prio=97 target_cpu=012
[10365.029281] cpuhp/12-99       12d..2. 10360115804us : sched_switch: prev_comm=cpuhp/12 prev_pid=99 prev_prio=120 prev_state=R+ ==> next_comm=ksoftirqd/12 next_pid=102 next_prio=97
[10365.031743] ksoftirq-102      12d..2. 10360115806us : sched_switch: prev_comm=ksoftirqd/12 prev_pid=102 prev_prio=97 prev_state=P ==> next_comm=cpuhp/12 next_pid=99 next_prio=120
[10365.034180] cpuhp/12-99       12dN.3. 10360115807us : sched_wakeup: comm=rcuc/12 pid=101 prio=97 target_cpu=012
[10365.035737] cpuhp/12-99       12d..2. 10360115808us : sched_switch: prev_comm=cpuhp/12 prev_pid=99 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/12 next_pid=101 next_prio=97
[10365.038126]  rcuc/12-101      12d..2. 10360115809us : sched_switch: prev_comm=rcuc/12 prev_pid=101 prev_prio=97 prev_state=P ==> next_comm=cpuhp/12 next_pid=99 next_prio=120
[10365.040503] cpuhp/12-99       12d..3. 10360115814us : dl_server_stop <-dequeue_entities
[10365.041739] cpuhp/12-99       12d..2. 10360115815us : sched_switch: prev_comm=cpuhp/12 prev_pid=99 prev_prio=120 prev_state=S ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10365.044143]   <idle>-0        12d..2. 10360115826us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/12 next_pid=99 next_prio=120
[10365.046551] cpuhp/12-99       12d..3. 10360115830us : dl_server_stop <-dequeue_entities
[10365.047800] cpuhp/12-99       12d..2. 10360115832us : sched_switch: prev_comm=cpuhp/12 prev_pid=99 prev_prio=120 prev_state=P ==> next_comm=swapper/12 next_pid=0 next_prio=120
[10365.050207]   <idle>-0        12d..2. 10360115877us : sched_switch: prev_comm=swapper/12 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=migration/12 next_pid=100 next_prio=0
[10365.052656] CPU:15 [LOST 11356995 EVENTS]
[10365.052656] rcu_tort-155      15d..2. 10361405925us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=migration/15 next_pid=122 next_prio=0
[10365.055826] migratio-122      15d..4. 10361405926us : dl_server_stop <-dequeue_entities
[10365.057067] migratio-122      15d..2. 10361405930us : sched_switch: prev_comm=migration/15 prev_pid=122 prev_prio=0 prev_state=S ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.059501]  rcuc/15-123      15d..2. 10361405932us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20364 next_prio=98
[10365.062001] rcu_tort-20364    15dN.6. 10361405933us : sched_wakeup: comm=migration/15 pid=122 prio=0 target_cpu=015
[10365.063623] rcu_tort-20364    15d..2. 10361405934us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20364 prev_prio=98 prev_state=R+ ==> next_comm=migration/15 next_pid=122 next_prio=0
[10365.066188] migratio-122      15d..2. 10361405942us : sched_switch: prev_comm=migration/15 prev_pid=122 prev_prio=0 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.068655]   <idle>-0        15dNh4. 10361406888us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.070208]   <idle>-0        15d..2. 10361406892us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.072602]  rcuc/15-123      15D..4. 10361406900us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10365.074195]  rcuc/15-123      15d..2. 10361406905us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.076593]   <idle>-0        15dNh4. 10361407888us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.078148]   <idle>-0        15d..2. 10361407892us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.080543]  rcuc/15-123      15d..2. 10361407894us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.082923]   <idle>-0        15dNh4. 10361408887us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.084486]   <idle>-0        15d..2. 10361408891us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.086879]  rcuc/15-123      15D..4. 10361408900us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10365.088490]  rcuc/15-123      15d..2. 10361408904us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.090884]   <idle>-0        15dNh4. 10361409888us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.092448]   <idle>-0        15d..2. 10361409891us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.094844]  rcuc/15-123      15D..5. 10361409894us : dl_server_start <-enqueue_task_fair
[10365.096109]  rcuc/15-123      15DN.4. 10361409896us : sched_wakeup: comm=cpuhp/15 pid=121 prio=120 target_cpu=015
[10365.097699]  rcuc/15-123      15d..2. 10361409897us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=R+ ==> next_comm=cpuhp/15 next_pid=121 next_prio=120
[10365.100105] cpuhp/15-121      15d..3. 10361411047us : dl_server_stop <-dequeue_entities
[10365.101343] cpuhp/15-121      15d..2. 10361411049us : sched_switch: prev_comm=cpuhp/15 prev_pid=121 prev_prio=120 prev_state=D ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.103733]  rcuc/15-123      15d..2. 10361411058us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.106124]   <idle>-0        15dNh4. 10361411889us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.107685]   <idle>-0        15d..2. 10361411893us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.110079]  rcuc/15-123      15d..2. 10361411895us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.112478]   <idle>-0        15dNh4. 10361481889us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.114040]   <idle>-0        15d..2. 10361481894us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.116479]  rcuc/15-123      15d..2. 10361481899us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.118860]   <idle>-0        15dNh4. 10361482888us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.120434]   <idle>-0        15d..2. 10361482891us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.122827]  rcuc/15-123      15d..2. 10361482902us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.125222]   <idle>-0        15dNh4. 10361549887us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.126783]   <idle>-0        15d..2. 10361549892us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.129185]  rcuc/15-123      15d..2. 10361549915us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.131589]   <idle>-0        15dNh4. 10361554887us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.133146]   <idle>-0        15d..2. 10361554891us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.135552]  rcuc/15-123      15d..2. 10361554893us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.137946]   <idle>-0        15dNh4. 10361555887us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.139510]   <idle>-0        15d..2. 10361555891us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.141902]  rcuc/15-123      15d..2. 10361555893us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.144277]   <idle>-0        15dNh4. 10362058891us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.145846]   <idle>-0        15d..2. 10362058897us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.148236]  rcuc/15-123      15d..2. 10362058901us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.150635]   <idle>-0        15dNh4. 10362059888us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.152188]   <idle>-0        15d..2. 10362059892us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.154589]  rcuc/15-123      15d..2. 10362059894us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.156977]   <idle>-0        15dN.4. 10362375893us : sched_wakeup: comm=ksoftirqd/15 pid=124 prio=97 target_cpu=015
[10365.158602]   <idle>-0        15d..2. 10362375896us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=ksoftirqd/15 next_pid=124 next_prio=97
[10365.161054] ksoftirq-124      15d..2. 10362375903us : sched_switch: prev_comm=ksoftirqd/15 prev_pid=124 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.163517]   <idle>-0        15dNh4. 10362518890us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.165069]   <idle>-0        15d..2. 10362518896us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.167919]  rcuc/15-123      15d..2. 10362518901us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.170759]   <idle>-0        15dNh4. 10362519888us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.171987]   <idle>-0        15d..2. 10362519891us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.173866]  rcuc/15-123      15d..2. 10362519894us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.175741]   <idle>-0        15dNh4. 10362558889us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.176967]   <idle>-0        15d..2. 10362558894us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.178844]  rcuc/15-123      15d..2. 10362558898us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.180719]   <idle>-0        15dNh4. 10362559888us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.181940]   <idle>-0        15d..2. 10362559891us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.183819]  rcuc/15-123      15d..2. 10362559894us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.185693]   <idle>-0        15dNh4. 10362570888us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.186914]   <idle>-0        15d..2. 10362570892us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.188810]  rcuc/15-123      15d..2. 10362570894us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.190677]   <idle>-0        15dNh4. 10362571887us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.191888]   <idle>-0        15d..2. 10362571890us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.193759]  rcuc/15-123      15d..2. 10362571893us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.195626]   <idle>-0        15dNh4. 10362592888us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.196848]   <idle>-0        15d..2. 10362592892us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.198726]  rcuc/15-123      15d..2. 10362592894us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.200601]   <idle>-0        15dNh4. 10362593887us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.201830]   <idle>-0        15d..2. 10362593891us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.203732]  rcuc/15-123      15d..2. 10362593893us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.205643] CPU:5 [LOST 11877163 EVENTS]
[10365.205643] rcu_tort-20362     5d..2. 10362867884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.208125] ksoftirq-54        5d.s3. 10362867889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10365.209380] ksoftirq-54        5d..2. 10362867892us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.211383] CPU:7 [LOST 11917504 EVENTS]
[10365.211383] rcu_tort-20355     7d..2. 10362881894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.213886] rcu_pree-16        7d..2. 10362881901us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.215876] rcu_tort-20355     7dN.4. 10362886882us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.217131] rcu_tort-20355     7d..2. 10362886883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.219142] ksoftirq-68        7d.s3. 10362886888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10365.220412] ksoftirq-68        7d..2. 10362886891us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.222440]   <idle>-0        15dN.4. 10362887892us : sched_wakeup: comm=ksoftirqd/15 pid=124 prio=97 target_cpu=015
[10365.223720]   <idle>-0        15d..2. 10362887894us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=ksoftirqd/15 next_pid=124 next_prio=97
[10365.225666] ksoftirq-124      15d.s5. 10362887901us : dl_server_start <-enqueue_task_fair
[10365.226662] ksoftirq-124      15dNs4. 10362887903us : sched_wakeup: comm=kworker/15:2 pid=18749 prio=120 target_cpu=015
[10365.227967] ksoftirq-124      15d..2. 10362887906us : sched_switch: prev_comm=ksoftirqd/15 prev_pid=124 prev_prio=97 prev_state=S ==> next_comm=kworker/15:2 next_pid=18749 next_prio=120
[10365.229979] kworker/-18749    15d..3. 10362887914us : dl_server_stop <-dequeue_entities
[10365.230959] kworker/-18749    15d..2. 10362887918us : sched_switch: prev_comm=kworker/15:2 prev_pid=18749 prev_prio=120 prev_state=I ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.232919] rcu_tort-20355     7dN.4. 10362888886us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.234172] rcu_tort-20355     7d..2. 10362888888us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.236179] ksoftirq-68        7d.s5. 10362888893us : dl_server_start <-enqueue_task_fair
[10365.237175] ksoftirq-68        7dNs4. 10362888895us : sched_wakeup: comm=kworker/7:0 pid=19250 prio=120 target_cpu=007
[10365.238481] ksoftirq-68        7d..2. 10362888898us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.240482] rcu_tort-20355     7d..2. 10362896899us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.242503] rcu_pree-16        7d..2. 10362896913us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.244510] rcu_tort-20355     7dN.4. 10362900887us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.245769] rcu_tort-20355     7d..2. 10362900889us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.247779] ksoftirq-68        7d.s3. 10362900897us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10365.249032] ksoftirq-68        7d..2. 10362900902us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.251032] CPU:9 [LOST 11288286 EVENTS]
[10365.251032] rcu_tort-20365     9d..2. 10362909888us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10365.253536] ksoftirq-82        9d.s3. 10362909895us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10365.254791] ksoftirq-82        9d..2. 10362909900us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.256805] rcu_tort-20365     9d..2. 10362933893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.258827] rcu_pree-16        9d..2. 10362933905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.260834] rcu_tort-20365     9dN.3. 10362938884us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10365.262092] rcu_tort-20365     9d..2. 10362938887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10365.264108] ksoftirq-82        9d.s3. 10362938895us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10365.265359] ksoftirq-82        9d..2. 10362938899us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.267351] rcu_tort-20362     5d..2. 10362947897us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.269383] rcu_pree-16        5d..2. 10362947910us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.271407] rcu_tort-20362     5dN.3. 10362952884us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.272674] rcu_tort-20362     5d..2. 10362952885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.274684] ksoftirq-54        5d.s3. 10362952892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10365.275945] ksoftirq-54        5d..2. 10362952897us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.277945] rcu_tort-20362     5d..2. 10362972896us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.279970] rcu_pree-16        5d..2. 10362972908us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.281988] rcu_tort-20362     5dN.4. 10362977883us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.283245] rcu_tort-20362     5d..2. 10362977885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.285265] ksoftirq-54        5d.s3. 10362977891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10365.286547] ksoftirq-54        5d..2. 10362977895us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.288558] rcu_tort-20355     7d..2. 10362981897us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.290586] rcu_pree-16        7d..2. 10362981909us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.292597] rcu_tort-20355     7dN.4. 10362986884us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.293848] rcu_tort-20355     7d..2. 10362986885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.295864] ksoftirq-68        7d.s3. 10362986892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10365.297118] CPU:2 [LOST 11706162 EVENTS]
[10365.297118] rcu_tort-20360     2d..2. 10362986895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.299615] ksoftirq-68        7d..2. 10362986896us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.301619] rcu_pree-16        2d..2. 10362986906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.303612] CPU:0 [LOST 26252193 EVENTS]
[10365.303612] rcu_tort-173       0d..2. 10362987887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.306058] ksoftirq-15        0d..2. 10362987895us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.308043] rcu_tort-20362     5dN.3. 10362988884us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.309307] rcu_tort-20362     5d..2. 10362988885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.311323] ksoftirq-54        5d..2. 10362988895us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.313309] rcu_tort-20355     7dN.3. 10362989884us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.314565] rcu_tort-20355     7d..2. 10362989885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.316578] ksoftirq-68        7d..2. 10362989892us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.318606] rcu_tort-20360     2dN.3. 10362991882us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.319861] rcu_tort-20360     2d..2. 10362991883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.321866] ksoftirq-32        2d.s3. 10362991887us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10365.323121] ksoftirq-32        2d..2. 10362991891us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.325194] rcu_tort-20365     9d..2. 10362996890us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.327220] rcu_pree-16        9d..2. 10362996895us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.329255] rcu_tort-20365     9dN.3. 10363001885us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10365.330530] rcu_tort-20365     9d..2. 10363001886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10365.332545] ksoftirq-82        9d.s3. 10363001893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10365.333807] rcu_tort-20360     2d..2. 10363001894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.335834] ksoftirq-82        9d..2. 10363001897us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.337856] rcu_pree-16        2d..2. 10363001904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.339865] rcu_tort-20360     2dN.3. 10363005883us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.341125] rcu_tort-20360     2d..2. 10363005884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.343131] ksoftirq-32        2d.s3. 10363005889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10365.344392] ksoftirq-32        2d..2. 10363005893us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.346402] rcu_tort-173       0d..2. 10363005894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.348384] rcu_pree-16        0d..2. 10363005904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.350378] rcu_tort-173       0dN.3. 10363009883us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10365.351644] rcu_tort-173       0d..2. 10363009884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.353636] ksoftirq-15        0d.s3. 10363009892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10365.354895] ksoftirq-15        0d..2. 10363009894us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.356885] rcu_tort-20360     2d..2. 10363009895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.358899] rcu_pree-16        2d..2. 10363009905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.360885] rcu_tort-20360     2dN.3. 10363014884us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.362147] rcu_tort-20360     2d..2. 10363014885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.364166] ksoftirq-32        2d.s3. 10363014891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10365.365443] ksoftirq-32        2d..2. 10363014895us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.367432] rcu_tort-20362     5d..2. 10363018895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.369451] rcu_pree-16        5d..2. 10363018906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.371454] rcu_tort-20362     5dN.3. 10363023884us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.372717] rcu_tort-20362     5d..2. 10363023885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.374725] ksoftirq-54        5d.s3. 10363023891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10365.375980] rcu_tort-173       0d..2. 10363023893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.377982] ksoftirq-54        5d..2. 10363023895us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.379987] rcu_pree-16        0d..2. 10363023903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.381988] rcu_tort-173       0dN.4. 10363027883us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10365.383242] rcu_tort-173       0d..2. 10363027884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.385233] ksoftirq-15        0d.s3. 10363027889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10365.386517] ksoftirq-15        0d..2. 10363027891us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.388514] rcu_tort-20355     7d..2. 10363031893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.390640] rcu_pree-16        7d..2. 10363031903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.392649] rcu_tort-20355     7dN.4. 10363036885us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.393943] rcu_tort-20355     7d..2. 10363036886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.395957] ksoftirq-68        7d.s3. 10363036892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10365.397212] ksoftirq-68        7d..2. 10363036896us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.399224] rcu_tort-20365     9d..2. 10363040896us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.401273] rcu_pree-16        9d..2. 10363040911us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.403313] rcu_tort-20365     9dN.3. 10363044885us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10365.404667] rcu_tort-20365     9d..2. 10363044886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10365.406693] ksoftirq-82        9d.s3. 10363044894us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10365.407949] ksoftirq-82        9d..2. 10363044898us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.409952] rcu_tort-20355     7d..2. 10363053893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.411977] rcu_pree-16        7d..2. 10363053902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.413997] rcu_tort-20355     7dN.3. 10363057885us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.415261] rcu_tort-20355     7d..2. 10363057886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.417290] ksoftirq-68        7d.s3. 10363057893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10365.418584] rcu_tort-20362     5d..2. 10363057897us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.420608] ksoftirq-68        7d..2. 10363057897us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.422641] rcu_pree-16        5d..2. 10363057909us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.424655] rcu_tort-20362     5dN.3. 10363062883us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.425913] rcu_tort-20362     5d..2. 10363062884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.427976] ksoftirq-54        5d.s3. 10363062890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10365.429229] rcu_tort-20360     2d..2. 10363062892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.431266] ksoftirq-54        5d..2. 10363062893us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.433291] rcu_pree-16        2d..2. 10363062902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.435306] rcu_tort-20360     2dN.3. 10363067884us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.436595] rcu_tort-20360     2d..2. 10363067885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.438611] ksoftirq-32        2d.s3. 10363067891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10365.439875] rcu_tort-20362     5d..2. 10363067892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.441892] ksoftirq-32        2d..2. 10363067895us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.443906] rcu_pree-16        5d..2. 10363067902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.445917] rcu_tort-20360     2dN.3. 10363071883us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.447176] rcu_tort-20360     2d..2. 10363071884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.449196] rcu_tort-20362     5dN.3. 10363071890us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.450481] ksoftirq-32        2d..2. 10363071892us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.452489] rcu_tort-20362     5d..2. 10363071892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.454519] ksoftirq-54        5d.s3. 10363071901us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10365.455786] ksoftirq-54        5d..2. 10363071906us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.457793] rcu_tort-173       0d..2. 10363075895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.459787] rcu_pree-16        0d..2. 10363075905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.461871] rcu_tort-173       0dN.3. 10363079885us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10365.463468] rcu_tort-173       0d..2. 10363079886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.465953] ksoftirq-15        0d.s3. 10363079893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10365.467513] ksoftirq-15        0d..2. 10363079895us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.470325] rcu_tort-20362     5d..2. 10363079897us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.473351] rcu_pree-16        5d..2. 10363079912us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.475350] rcu_tort-20362     5dN.3. 10363083890us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.476629] rcu_tort-20362     5d..2. 10363083892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.478635] ksoftirq-54        5d.s3. 10363083902us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10365.479886] rcu_tort-20355     7d..2. 10363083907us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.481891] ksoftirq-54        5d..2. 10363083908us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.483888] rcu_pree-16        7d..2. 10363083919us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.485875] rcu_tort-173       0dN.4. 10363087886us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10365.487126] rcu_tort-173       0d..2. 10363087887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.489100] rcu_tort-20355     7dN.3. 10363087889us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.490348] ksoftirq-15        0d..2. 10363087891us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.492319] rcu_tort-20355     7d..2. 10363087892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.494319] ksoftirq-68        7d.s3. 10363087901us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10365.495579] rcu_tort-20365     9d..2. 10363087904us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.497578] ksoftirq-68        7d..2. 10363087906us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.499572] rcu_pree-16        9d..2. 10363087917us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.501563] rcu_tort-20365     9dN.3. 10363092884us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10365.502814] rcu_tort-20365     9d..2. 10363092886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10365.504811] CPU:13 [LOST 11829010 EVENTS]
[10365.504811] rcu_tort-154      13d..2. 10363092886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=161 next_prio=139
[10365.507381] ksoftirq-82        9d.s3. 10363092891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10365.508624] rcu_tort-20362     5d..2. 10363092894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.510624] ksoftirq-82        9d..2. 10363092896us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.512618] rcu_tort-161      13d..2. 10363092897us : sched_switch: prev_comm=rcu_torture_rea prev_pid=161 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10365.514655] rcu_pree-16        5d..3. 10363092903us : sched_wakeup: comm=rcub/8 pid=35 prio=97 target_cpu=002
[10365.515853] rcu_tort-20360     2d..2. 10363092905us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcub/8 next_pid=35 next_prio=97
[10365.517797] rcu_pree-16        5d..2. 10363092912us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.519795] rcu_tort-20362     5d..2. 10363092922us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=164 next_prio=97
[10365.521849]   rcub/8-35        2d..2. 10363092926us : sched_switch: prev_comm=rcub/8 prev_pid=35 prev_prio=97 prev_state=D ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.523785] rcu_tort-164       5d..4. 10363092932us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10365.525036] rcu_tort-20365     9d..2. 10363092934us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.527047] rcu_tort-164       5dN.4. 10363092939us : sched_wakeup: comm=rcub/8 pid=35 prio=97 target_cpu=002
[10365.528244] rcu_tort-164       5d..2. 10363092941us : sched_switch: prev_comm=rcu_torture_rea prev_pid=164 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.530305] rcu_tort-20360     2d..2. 10363092941us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcub/8 next_pid=35 next_prio=97
[10365.532306]   rcub/8-35        2d..2. 10363092945us : sched_switch: prev_comm=rcub/8 prev_pid=35 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.534234] rcu_pree-16        9d..2. 10363092957us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.536216] rcu_tort-158      13DNh3. 10363093399us : sched_wakeup: comm=rcu_torture_rea pid=161 prio=139 target_cpu=013
[10365.537531] rcu_tort-158      13d..2. 10363093403us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=161 next_prio=139
[10365.539582] rcu_tort-20360     2dNh4. 10363093881us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10365.540780] rcu_tort-20362     5dNh4. 10363093881us : sched_wakeup: comm=rcuc/5 pid=53 prio=97 target_cpu=005
[10365.541977] rcu_tort-20365     9dNh3. 10363093882us : sched_wakeup: comm=rcuc/9 pid=81 prio=97 target_cpu=009
[10365.543174] rcu_tort-161      13DNh3. 10363093882us : sched_wakeup: comm=rcuc/13 pid=109 prio=97 target_cpu=013
[10365.544398] rcu_tort-173       0dNh3. 10363093883us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10365.545602] rcu_tort-20360     2d..2. 10363093885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10365.547552] rcu_tort-20362     5d..2. 10363093885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/5 next_pid=53 next_prio=97
[10365.549510] rcu_tort-20355     7dNh3. 10363093885us : sched_wakeup: comm=rcuc/7 pid=67 prio=97 target_cpu=007
[10365.550707] rcu_tort-20365     9d..2. 10363093885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/9 next_pid=81 next_prio=97
[10365.552650] rcu_tort-173       0d..2. 10363093887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10365.554570]   rcuc/9-81        9d..2. 10363093889us : sched_switch: prev_comm=rcuc/9 prev_pid=81 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.556499]   <idle>-0        15dNh4. 10363093889us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.557716]   rcuc/5-53        5d..2. 10363093891us : sched_switch: prev_comm=rcuc/5 prev_pid=53 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.559650] rcu_tort-20355     7d..2. 10363093892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/7 next_pid=67 next_prio=97
[10365.561595]   rcuc/2-31        2d..2. 10363093892us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.563555]   <idle>-0        15d..2. 10363093895us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.565441]   rcuc/0-19        0d..2. 10363093897us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.567347]  rcuc/15-123      15d..2. 10363093899us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.569218]   rcuc/7-67        7D..4. 10363093903us : sched_wakeup: comm=rcu_torture_fak pid=151 prio=139 target_cpu=007
[10365.570536]   rcuc/7-67        7d..2. 10363093910us : sched_switch: prev_comm=rcuc/7 prev_pid=67 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.572486] rcu_tort-20360     2dNh3. 10363094881us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10365.573700] rcu_tort-20362     5dNh3. 10363094881us : sched_wakeup: comm=rcuc/5 pid=53 prio=97 target_cpu=005
[10365.574916] rcu_tort-173       0dNh3. 10363094883us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10365.576124] rcu_tort-20355     7dNh4. 10363094883us : sched_wakeup: comm=rcuc/7 pid=67 prio=97 target_cpu=007
[10365.577328] rcu_tort-20362     5d..2. 10363094884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/5 next_pid=53 next_prio=97
[10365.579296] rcu_tort-20360     2d..2. 10363094884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10365.581262]   rcuc/5-53        5d..2. 10363094887us : sched_switch: prev_comm=rcuc/5 prev_pid=53 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.583233] rcu_tort-173       0d..2. 10363094887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10365.585180]   <idle>-0        15dNh4. 10363094887us : sched_wakeup: comm=rcuc/15 pid=123 prio=97 target_cpu=015
[10365.586422] rcu_tort-20355     7d..2. 10363094888us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/7 next_pid=67 next_prio=97
[10365.588369]   rcuc/2-31        2d..2. 10363094890us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.590303]   <idle>-0        15d..2. 10363094891us : sched_switch: prev_comm=swapper/15 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/15 next_pid=123 next_prio=97
[10365.592194]   rcuc/7-67        7d..2. 10363094893us : sched_switch: prev_comm=rcuc/7 prev_pid=67 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.594145]  rcuc/15-123      15d..2. 10363094894us : sched_switch: prev_comm=rcuc/15 prev_pid=123 prev_prio=97 prev_state=S ==> next_comm=swapper/15 next_pid=0 next_prio=120
[10365.596042]   rcuc/0-19        0d..2. 10363094896us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.597971] rcu_tort-161      13d..2. 10363096887us : sched_switch: prev_comm=rcu_torture_rea prev_pid=161 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10365.600039] rcu_tort-158      13d..2. 10363096892us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10365.602093] rcu_tort-154      13d..2. 10363096895us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=161 next_prio=139
[10365.604146] rcu_tort-161      13dNh3. 10363097395us : sched_wakeup: comm=rcu_torture_rea pid=158 prio=139 target_cpu=013
[10365.606152] rcu_tort-161      13dNh3. 10363097397us : sched_wakeup: comm=rcu_torture_rea pid=154 prio=139 target_cpu=013
[10365.608175] rcu_tort-161      13d..2. 10363097400us : sched_switch: prev_comm=rcu_torture_rea prev_pid=161 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10365.610619] rcu_tort-20362     5dN.4. 10363097884us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.614183] rcu_tort-20365     9dN.4. 10363097885us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10365.615957] rcu_tort-20362     5d..2. 10363097885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.617964] rcu_tort-20365     9d..2. 10363097886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10365.619963] ksoftirq-54        5d..2. 10363097891us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.621960] ksoftirq-82        9d.s3. 10363097893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10365.623207] ksoftirq-82        9d..2. 10363097894us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.625193] rcu_tort-20355     7d..2. 10363097898us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.627218] rcu_pree-16        7d..2. 10363097914us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.629206] rcu_tort-154      13d..2. 10363100886us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10365.632564] rcu_tort-20355     7dN.4. 10363101890us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.634201] rcu_tort-20355     7d..2. 10363101892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.637052] ksoftirq-68        7d.s3. 10363101900us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10365.638912] ksoftirq-68        7d..2. 10363101905us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.641827] rcu_tort-158      13d..2. 10363103930us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=161 next_prio=139
[10365.644579] rcu_tort-161      13d..2. 10363103937us : sched_switch: prev_comm=rcu_torture_rea prev_pid=161 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10365.646611] rcu_tort-158      13dNh3. 10363104439us : sched_wakeup: comm=rcu_torture_rea pid=161 prio=139 target_cpu=013
[10365.647910] rcu_tort-158      13d..2. 10363104442us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=161 next_prio=139
[10365.649949] rcu_tort-20365     9d..2. 10363106893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.651938] rcu_pree-16        9d..2. 10363106906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.653925] rcu_tort-161      13d..2. 10363107885us : sched_switch: prev_comm=rcu_torture_rea prev_pid=161 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=158 next_prio=139
[10365.655964] rcu_tort-158      13d..2. 10363110046us : sched_switch: prev_comm=rcu_torture_rea prev_pid=158 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10365.658042] rcu_tort-154      13d..2. 10363110053us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=161 next_prio=139
[10365.660100] rcu_tort-161      13dNh3. 10363110557us : sched_wakeup: comm=rcu_torture_rea pid=154 prio=139 target_cpu=013
[10365.661436] rcu_tort-161      13d..2. 10363110562us : sched_switch: prev_comm=rcu_torture_rea prev_pid=161 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10365.663492] rcu_tort-20365     9dN.4. 10363111884us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10365.664749] rcu_tort-20365     9d..2. 10363111886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10365.666756] rcu_tort-154      13d..2. 10363111892us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10365.668773] ksoftirq-82        9d.s3. 10363111895us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10365.670027] ksoftirq-82        9d..2. 10363111900us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.672021] ksoftirq-110      13d..2. 10363111903us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcuc/13 next_pid=109 next_prio=97
[10365.673937]  rcuc/13-109      13d..2. 10363111907us : sched_switch: prev_comm=rcuc/13 prev_pid=109 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.675911] rcu_tort-20366    13dNh4. 10363112883us : sched_wakeup: comm=rcuc/13 pid=109 prio=97 target_cpu=013
[10365.677125] rcu_tort-20366    13d..2. 10363112889us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/13 next_pid=109 next_prio=97
[10365.679137]  rcuc/13-109      13d..2. 10363112896us : sched_switch: prev_comm=rcuc/13 prev_pid=109 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.681096] rcu_tort-20366    13d..2. 10363116894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.683117] rcu_pree-16       13d..2. 10363116907us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.685132] rcu_tort-20366    13dN.3. 10363121882us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10365.686445] rcu_tort-20366    13d..2. 10363121883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10365.688481] ksoftirq-110      13d.s3. 10363121889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10365.689743] ksoftirq-110      13d..2. 10363121893us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.691763] CPU:11 [LOST 10977971 EVENTS]
[10365.691763] rcu_tort-20367    11d..2. 10363126886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10365.694261] ksoftirq-96       11d.s3. 10363126891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10365.695548] rcu_tort-173       0d..2. 10363126893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.697542] ksoftirq-96       11d..2. 10363126895us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10365.699583] rcu_pree-16        0d..2. 10363126903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.701579] rcu_tort-173       0dN.3. 10363130886us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10365.702840] rcu_tort-173       0d..2. 10363130887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.704826] ksoftirq-15        0d.s3. 10363130893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10365.706080] rcu_tort-20355     7d..2. 10363130895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.708095] ksoftirq-15        0d..2. 10363130896us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.710066] rcu_pree-16        7d..2. 10363130905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.712060] rcu_tort-20355     7dN.3. 10363135882us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.713319] rcu_tort-20355     7d..2. 10363135883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.715326] ksoftirq-68        7d.s3. 10363135889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10365.716604] rcu_tort-20366    13d..2. 10363135892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.718621] ksoftirq-68        7d..2. 10363135893us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.720627] rcu_pree-16       13d..2. 10363135903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.722630] rcu_tort-20366    13dN.4. 10363140882us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10365.723905] rcu_tort-20366    13d..2. 10363140883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10365.725929] ksoftirq-110      13d.s3. 10363140889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10365.727184] rcu_tort-173       0d..2. 10363140892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.729173] ksoftirq-110      13d..2. 10363140892us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.731175] rcu_pree-16        0d..2. 10363140902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.733146] rcu_tort-173       0dN.3. 10363144885us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10365.734423] rcu_tort-20365     9dN.4. 10363144885us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10365.735702] CPU:3 [LOST 11500515 EVENTS]
[10365.735702] rcu_tort-20368     3d..2. 10363144886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10365.738210] rcu_tort-173       0d..2. 10363144886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.740204] rcu_tort-20365     9d..2. 10363144888us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10365.742300] ksoftirq-15        0d.s3. 10363144892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10365.743603] rcu_tort-20367    11d..2. 10363144894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.745714] ksoftirq-15        0d..2. 10363144895us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.747716] ksoftirq-82        9d..2. 10363144897us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.749736] ksoftirq-40        3d.s2. 10363144897us : dl_server_stop <-dequeue_entities
[10365.750718] ksoftirq-40        3d..2. 10363144902us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10365.752722] rcu_pree-16       11d..2. 10363144903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10365.754728] rcu_tort-20367    11dN.3. 10363150918us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10365.756002] rcu_tort-20367    11d..2. 10363150919us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10365.758021] ksoftirq-96       11d.s3. 10363150927us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10365.759307] rcu_tort-20360     2d..2. 10363150930us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.761370] ksoftirq-96       11d..2. 10363150931us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10365.763518] rcu_pree-16        2d..2. 10363150942us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.765622] rcu_tort-20360     2dN.3. 10363155882us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.766881] rcu_tort-20360     2d..2. 10363155883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.768938] ksoftirq-32        2d.s3. 10363155890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10365.770223] rcu_tort-20355     7d..2. 10363155894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.772262] ksoftirq-32        2d..2. 10363155894us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.774268] rcu_pree-16        7d..2. 10363155904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.776256] rcu_tort-20355     7dN.4. 10363159885us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.777565] rcu_tort-20355     7d..2. 10363159886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.779596] ksoftirq-68        7d.s3. 10363159892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10365.780878] rcu_tort-173       0d..2. 10363159894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.782867] ksoftirq-68        7d..2. 10363159896us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.784864] rcu_pree-16        0d..2. 10363159904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.786855] rcu_tort-173       0dN.3. 10363163885us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10365.788125] rcu_tort-173       0d..2. 10363163886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.790102] ksoftirq-15        0d.s3. 10363163891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10365.791360] ksoftirq-15        0d..2. 10363163894us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.793318] rcu_tort-20366    13d..2. 10363163894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.795316] rcu_pree-16       13d..2. 10363163906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.797315] rcu_tort-20366    13dN.3. 10363168883us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10365.798604] rcu_tort-20366    13d..2. 10363168885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10365.800633] ksoftirq-110      13d.s3. 10363168892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10365.801889] rcu_tort-20360     2d..2. 10363168894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.803890] ksoftirq-110      13d..2. 10363168896us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.805911] rcu_pree-16        2d..2. 10363168906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.807916] rcu_tort-20366    13dN.4. 10363172882us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10365.809190] rcu_tort-20366    13d..2. 10363172883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10365.811214] ksoftirq-110      13d..2. 10363172905us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.813234] rcu_tort-20360     2dN.3. 10363173883us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.814515] rcu_tort-20360     2d..2. 10363173884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.816511] ksoftirq-32        2d.s3. 10363173888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10365.817765] rcu_tort-20365     9d..2. 10363173892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.819769] ksoftirq-32        2d..2. 10363173892us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.821762] rcu_pree-16        9d..2. 10363173902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.823759] rcu_tort-20365     9dN.3. 10363178883us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10365.825008] rcu_tort-20365     9d..2. 10363178885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10365.827015] ksoftirq-82        9d.s3. 10363178892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10365.828259] rcu_tort-20366    13d..2. 10363178895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.830269] ksoftirq-82        9d..2. 10363178897us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10365.832270] rcu_pree-16       13d..2. 10363178903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.834282] rcu_tort-20366    13dN.3. 10363183882us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10365.835575] rcu_tort-20366    13d..2. 10363183882us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10365.837650] ksoftirq-110      13d.s3. 10363183887us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10365.838909] rcu_tort-20368     3d..2. 10363183891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.840918] ksoftirq-110      13d..2. 10363183891us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.842933] rcu_pree-16        3d..2. 10363183901us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10365.844989] rcu_tort-20368     3dN.3. 10363188883us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10365.846241] rcu_tort-20368     3d..2. 10363188884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10365.848243] ksoftirq-40        3d.s3. 10363188890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10365.849516] rcu_tort-20360     2d..2. 10363188893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.851517] ksoftirq-40        3d..2. 10363188894us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10365.853513] rcu_pree-16        2d..2. 10363188904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.855513] rcu_tort-173       0dN.3. 10363191884us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10365.856771] rcu_tort-173       0d..2. 10363191885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.858758] ksoftirq-15        0d..2. 10363191888us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.860846] rcu_tort-20360     2dN.3. 10363193882us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.862105] rcu_tort-20360     2d..2. 10363193883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.864180] ksoftirq-32        2d.s3. 10363193889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10365.865501] rcu_tort-20367    11d..2. 10363193892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.867561] ksoftirq-32        2d..2. 10363193893us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.869557] rcu_pree-16       11d..2. 10363193903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10365.871560] rcu_tort-20367    11dN.3. 10363198884us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10365.872825] rcu_tort-20367    11d..2. 10363198885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10365.874843] ksoftirq-96       11d.s3. 10363198890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10365.876094] rcu_tort-20368     3d..2. 10363198892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.878114] ksoftirq-96       11d..2. 10363198894us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10365.880150] rcu_pree-16        3d..2. 10363198899us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10365.882156] rcu_tort-20368     3dN.3. 10363203882us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10365.883416] rcu_tort-20368     3d..2. 10363203882us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10365.885437] ksoftirq-40        3d.s3. 10363203888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10365.886689] ksoftirq-40        3d..2. 10363203891us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10365.888683] rcu_tort-20362     5d..2. 10363203893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.890694] rcu_pree-16        5d..2. 10363203907us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.892698] rcu_tort-20362     5dN.3. 10363208883us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.893964] rcu_tort-20362     5d..2. 10363208884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.895974] ksoftirq-54        5d.s3. 10363208892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10365.897244] rcu_tort-20367    11d..2. 10363208895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.899328] ksoftirq-54        5d..2. 10363208896us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.901385] rcu_pree-16       11d..2. 10363208905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10365.903818] rcu_tort-20367    11dN.4. 10363213883us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10365.905744] rcu_tort-20367    11d..2. 10363213885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10365.908747] ksoftirq-96       11d.s3. 10363213891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10365.910644] rcu_tort-20362     5d..2. 10363213894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.913658] ksoftirq-96       11d..2. 10363213894us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10365.916716] rcu_pree-16        5d..2. 10363213905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.919709] rcu_tort-20362     5dN.3. 10363218883us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.921637] rcu_tort-20362     5d..2. 10363218884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.924425] ksoftirq-54        5d.s3. 10363218890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10365.925687] rcu_tort-20366    13d..2. 10363218892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.927686] ksoftirq-54        5d..2. 10363218894us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.929676] rcu_pree-16       13d..2. 10363218900us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.931655] rcu_tort-20366    13dN.3. 10363223882us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10365.932929] rcu_tort-20366    13d..2. 10363223883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10365.934937] ksoftirq-110      13d.s3. 10363223888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10365.936182] rcu_tort-20362     5d..2. 10363223891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.938259] ksoftirq-110      13d..2. 10363223892us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.940253] rcu_pree-16        5d..2. 10363223901us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.942235] rcu_tort-20362     5dN.3. 10363228882us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10365.943533] rcu_tort-20362     5d..2. 10363228883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10365.945524] ksoftirq-54        5d.s3. 10363228889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10365.946768] ksoftirq-54        5d..2. 10363228892us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10365.948800] rcu_tort-173       0d..2. 10363228893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.950763] rcu_pree-16        0d..2. 10363228905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.952718] rcu_tort-173       0dN.3. 10363232884us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10365.953961] rcu_tort-173       0d..2. 10363232885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10365.955931] ksoftirq-15        0d.s3. 10363232893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10365.957179] rcu_tort-20360     2d..2. 10363232895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.959166] ksoftirq-15        0d..2. 10363232896us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10365.961125] rcu_pree-16        2d..2. 10363232906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.963109] rcu_tort-20360     2dN.4. 10363237883us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.964352] rcu_tort-20360     2d..2. 10363237884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.966335] ksoftirq-32        2d.s3. 10363237890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10365.967587] rcu_tort-20366    13d..2. 10363237893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.969608] ksoftirq-32        2d..2. 10363237894us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.971597] rcu_pree-16       13d..2. 10363237901us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.973598] rcu_tort-20366    13dN.3. 10363242882us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10365.974868] rcu_tort-20366    13d..2. 10363242883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10365.976901] ksoftirq-110      13d.s3. 10363242888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10365.978154] rcu_tort-20355     7d..2. 10363242891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.980188] ksoftirq-110      13d..2. 10363242892us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10365.982297] rcu_pree-16        7d..2. 10363242900us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.984334] rcu_tort-20355     7dN.3. 10363247882us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10365.985714] rcu_tort-20355     7d..2. 10363247883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10365.987736] ksoftirq-68        7d.s3. 10363247889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10365.988995] rcu_tort-20360     2d..2. 10363247892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10365.991006] ksoftirq-68        7d..2. 10363247893us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10365.993054] rcu_pree-16        2d..2. 10363247904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10365.995069] rcu_tort-20360     2dN.3. 10363252882us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10365.996356] rcu_tort-20360     2d..2. 10363252883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10365.998384] ksoftirq-32        2d.s3. 10363252888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10365.999707] rcu_tort-173       0d..2. 10363252892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.001744] ksoftirq-32        2d..2. 10363252892us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.003800] rcu_pree-16        0d..2. 10363252903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.005811] rcu_tort-173       0dN.4. 10363256883us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.007126] rcu_tort-173       0d..2. 10363256885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.009169] ksoftirq-15        0d.s3. 10363256890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.010467] rcu_tort-20368     3d..2. 10363256892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.012491] ksoftirq-15        0d..2. 10363256893us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.014483] rcu_pree-16        3d..2. 10363256903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.016481] rcu_tort-20368     3dN.3. 10363260884us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.017750] rcu_tort-20368     3d..2. 10363260885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.019773] ksoftirq-40        3d.s3. 10363260891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10366.021034] rcu_tort-20355     7d..2. 10363260893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.023050] ksoftirq-40        3d..2. 10363260896us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.025057] rcu_pree-16        7d..2. 10363260902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.027060] rcu_tort-20355     7dN.4. 10363265882us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.028313] rcu_tort-20355     7d..2. 10363265884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.030313] ksoftirq-68        7d.s3. 10363265889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.031588] rcu_tort-20368     3d..2. 10363265891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.033617] ksoftirq-68        7d..2. 10363265892us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.035618] rcu_pree-16        3d..2. 10363265901us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.037628] rcu_tort-20368     3dN.3. 10363269885us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.038973] rcu_tort-20368     3d..2. 10363269887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.040994] ksoftirq-40        3d.s3. 10363269894us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10366.042248] ksoftirq-40        3d..2. 10363269899us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.044246] rcu_tort-20365     9d..2. 10363269899us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.046270] rcu_pree-16        9d..2. 10363269913us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.048280] rcu_tort-20365     9dN.3. 10363274883us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10366.049559] rcu_tort-20365     9d..2. 10363274884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10366.051670] rcu_tort-173       0dN.4. 10363274885us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.052940] rcu_tort-173       0d..2. 10363274887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.054928] ksoftirq-82        9d.s3. 10363274892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10366.056196] ksoftirq-82        9d..2. 10363274894us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.058204] rcu_tort-20360     2d..2. 10363274895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.060223] ksoftirq-15        0d..2. 10363274896us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.062219] rcu_pree-16        2d..2. 10363274911us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.064206] rcu_tort-20362     5dN.3. 10363275884us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10366.065474] rcu_tort-20362     5d..2. 10363275886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10366.067508] ksoftirq-54        5d..2. 10363275896us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.069500] rcu_tort-20355     7dN.3. 10363277884us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.070758] rcu_tort-20355     7d..2. 10363277885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.072772] ksoftirq-68        7d..2. 10363277893us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.074753] rcu_tort-20360     2dN.3. 10363279884us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.076013] rcu_tort-20360     2d..2. 10363279885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.078014] ksoftirq-32        2d.s3. 10363279893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.079259] rcu_tort-20368     3d..2. 10363279896us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.081285] ksoftirq-32        2d..2. 10363279897us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.083302] rcu_pree-16        3d..2. 10363279906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.085304] rcu_tort-20368     3dN.4. 10363283884us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.086603] rcu_tort-20368     3d..2. 10363283886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.088609] ksoftirq-40        3d.s3. 10363283893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10366.089865] rcu_tort-20367    11d..2. 10363283895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.091878] ksoftirq-40        3d..2. 10363283897us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.093885] rcu_pree-16       11d..2. 10363283905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.095895] rcu_tort-20367    11dN.3. 10363284884us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.097158] rcu_tort-20367    11d..2. 10363284885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.099181] ksoftirq-96       11d..2. 10363284893us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.101203] rcu_tort-20367    11dN.3. 10363287883us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.102493] rcu_tort-20367    11d..2. 10363287884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.104528] rcu_tort-20368     3dN.3. 10363287884us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.105786] rcu_tort-20368     3d..2. 10363287885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.107784] ksoftirq-96       11d.s3. 10363287890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10366.109037] ksoftirq-96       11d..2. 10363287892us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.111049] rcu_tort-20355     7d..2. 10363287892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.113065] ksoftirq-40        3d..2. 10363287894us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.115053] rcu_pree-16        7d..2. 10363287901us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.117037] rcu_tort-20355     7dN.3. 10363292882us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.118289] rcu_tort-20355     7d..2. 10363292883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.120275] ksoftirq-68        7d.s3. 10363292888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10366.121535] rcu_tort-20362     5d..2. 10363292891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.123564] ksoftirq-68        7d..2. 10363292892us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.125590] rcu_pree-16        5d..2. 10363292902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.127616] rcu_tort-173       0dN.4. 10363295884us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.128889] rcu_tort-173       0d..2. 10363295886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.130892] ksoftirq-15        0d..2. 10363295890us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.132866] rcu_tort-20362     5dN.3. 10363297882us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10366.134132] rcu_tort-20362     5d..2. 10363297882us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10366.136153] ksoftirq-54        5d.s3. 10363297887us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10366.137412] rcu_tort-20360     2d..2. 10363297889us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.139511] ksoftirq-54        5d..2. 10363297891us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.141515] rcu_pree-16        2d..2. 10363297898us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.143526] rcu_tort-20360     2dN.3. 10363302882us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.144786] rcu_tort-20360     2d..2. 10363302883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.146792] ksoftirq-32        2d.s3. 10363302887us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10366.148053] ksoftirq-32        2d..2. 10363302890us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.150067] rcu_tort-20362     5d..2. 10363302907us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.152084] rcu_pree-16        5d..2. 10363302918us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.154087] rcu_tort-20362     5dN.4. 10363307882us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10366.155343] rcu_tort-20362     5d..2. 10363307883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10366.157395] ksoftirq-54        5d.s3. 10363307887us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.158666] rcu_tort-20368     3d..2. 10363307891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.160675] ksoftirq-54        5d..2. 10363307891us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.162672] rcu_pree-16        3d..2. 10363307902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.164680] rcu_tort-20368     3dN.3. 10363311885us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.165937] rcu_tort-20368     3d..2. 10363311886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.167962] ksoftirq-40        3d.s3. 10363311892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10366.169222] rcu_tort-20366    13d..2. 10363311897us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.171258] ksoftirq-40        3d..2. 10363311897us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.173268] rcu_pree-16       13d..2. 10363311910us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.175270] rcu_tort-20366    13dN.3. 10363315889us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10366.176575] rcu_tort-20366    13d..2. 10363315891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10366.178616] ksoftirq-110      13d.s3. 10363315902us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10366.179891] rcu_tort-20365     9d..2. 10363315906us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.181903] ksoftirq-110      13d..2. 10363315915us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.183923] rcu_pree-16        9d..2. 10363315918us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.185944] rcu_tort-20365     9dN.3. 10363319885us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10366.187205] rcu_tort-20365     9d..2. 10363319887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10366.189225] ksoftirq-82        9d.s3. 10363319894us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.190513] rcu_tort-20368     3d..2. 10363319897us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.192536] ksoftirq-82        9d..2. 10363319899us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.194539] rcu_pree-16        3d..2. 10363319905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.196549] rcu_tort-20368     3dN.3. 10363323884us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.197810] rcu_tort-20368     3d..2. 10363323885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.199848] ksoftirq-40        3d.s3. 10363323890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10366.201100] rcu_tort-173       0d..2. 10363323892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.203094] ksoftirq-40        3d..2. 10363323894us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.205087] rcu_pree-16        0d..2. 10363323903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.207097] rcu_tort-173       0dN.4. 10363327884us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.208364] rcu_tort-173       0d..2. 10363327885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.210335] ksoftirq-15        0d.s3. 10363327891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10366.211606] ksoftirq-15        0d..2. 10363327894us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.213587] rcu_tort-20362     5d..2. 10363327894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.215595] rcu_pree-16        5d..2. 10363327905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.217597] rcu_tort-20362     5dN.4. 10363332883us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10366.218843] rcu_tort-20362     5d..2. 10363332884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10366.220855] ksoftirq-54        5d.s3. 10363332890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10366.222443] rcu_tort-20355     7d..2. 10363332892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.225495] ksoftirq-54        5d..2. 10363332894us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.228559] rcu_pree-16        7d..2. 10363332903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.231530] rcu_tort-20355     7dN.3. 10363337882us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.233459] rcu_tort-20355     7d..2. 10363337883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.236530] ksoftirq-68        7d.s3. 10363337888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10366.238400] rcu_tort-20365     9d..2. 10363337891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.241413] ksoftirq-68        7d..2. 10363337891us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.243686] rcu_pree-16        9d..2. 10363337902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.245676] rcu_tort-20365     9dN.4. 10363342884us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10366.246924] rcu_tort-20365     9d..2. 10363342885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10366.248940] ksoftirq-82        9d.s3. 10363342890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10366.250212] rcu_tort-20362     5d..2. 10363342892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.252225] ksoftirq-82        9d..2. 10363342894us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.254234] rcu_pree-16        5d..2. 10363342901us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.256237] rcu_tort-20362     5dN.3. 10363347882us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10366.257525] rcu_tort-20362     5d..2. 10363347883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10366.259577] ksoftirq-54        5d.s3. 10363347888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10366.260819] rcu_tort-20365     9d..2. 10363347890us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.262829] ksoftirq-54        5d..2. 10363347892us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.264829] rcu_pree-16        9d..2. 10363347901us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.266825] rcu_tort-20365     9dN.3. 10363352883us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10366.268077] rcu_tort-20365     9d..2. 10363352883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10366.270067] ksoftirq-82        9d.s3. 10363352889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10366.271314] rcu_tort-20355     7d..2. 10363352892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.273303] ksoftirq-82        9d..2. 10363352893us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.275292] rcu_pree-16        7d..2. 10363352899us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.277264] rcu_tort-20355     7dN.3. 10363357882us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.278549] rcu_tort-20355     7d..2. 10363357883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.280580] ksoftirq-68        7d.s3. 10363357888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10366.281837] rcu_tort-20367    11d..2. 10363357890us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.283865] ksoftirq-68        7d..2. 10363357891us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.285883] rcu_pree-16       11d..2. 10363357900us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.287890] rcu_tort-20360     2dN.3. 10363358883us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.289143] rcu_tort-20360     2d..2. 10363358885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.291139] ksoftirq-32        2d..2. 10363358894us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.293139] rcu_tort-20367    11dN.3. 10363362885us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.294411] rcu_tort-20367    11d..2. 10363362887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.296430] ksoftirq-96       11d.s3. 10363362893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10366.297686] rcu_tort-20365     9d..2. 10363362896us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.299709] ksoftirq-96       11d..2. 10363362898us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.301729] rcu_pree-16        9d..2. 10363362907us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.303732] rcu_tort-20365     9dN.4. 10363367882us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10366.304986] rcu_tort-20365     9d..2. 10363367883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10366.307001] ksoftirq-82        9d.s3. 10363367889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10366.308245] rcu_tort-20367    11d..2. 10363367892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.310264] ksoftirq-82        9d..2. 10363367893us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.312275] rcu_pree-16       11d..2. 10363367902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.314274] rcu_tort-20367    11dN.3. 10363372885us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.315560] rcu_tort-20367    11d..2. 10363372886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.317577] ksoftirq-96       11d.s3. 10363372893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10366.318832] ksoftirq-96       11d..2. 10363372897us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.320830] rcu_tort-20366    13d..2. 10363372898us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.322861] rcu_pree-16       13d..2. 10363372914us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.324867] rcu_tort-20360     2dN.3. 10363375890us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.326133] rcu_tort-20360     2d..2. 10363375892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.328146] ksoftirq-32        2d..2. 10363375903us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.330146] rcu_tort-20366    13dN.3. 10363377883us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10366.331443] rcu_tort-20366    13d..2. 10363377884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10366.334483] ksoftirq-110      13d.s3. 10363377891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10366.335767] rcu_tort-20367    11d..2. 10363377893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.337782] ksoftirq-110      13d..2. 10363377895us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.339909] rcu_pree-16       11d..2. 10363377903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.341921] rcu_tort-20367    11dN.3. 10363381885us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.343184] rcu_tort-20367    11d..2. 10363381886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.345208] ksoftirq-96       11d.s3. 10363381891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10366.346477] rcu_tort-173       0d..2. 10363381893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.348476] ksoftirq-96       11d..2. 10363381895us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.350506] rcu_pree-16        0d..2. 10363381902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.352493] rcu_tort-173       0dN.3. 10363385884us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.353756] rcu_tort-173       0d..2. 10363385885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.355762] ksoftirq-15        0d.s3. 10363385891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10366.357281] ksoftirq-15        0d..2. 10363385894us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.359307] rcu_tort-20355     7d..2. 10363385894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.361343] rcu_pree-16        7d..2. 10363385906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.363344] rcu_tort-20355     7dN.3. 10363389885us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.364667] rcu_tort-20355     7d..2. 10363389886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.366764] ksoftirq-68        7d.s3. 10363389894us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10366.368052] rcu_tort-20366    13d..2. 10363389896us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.370076] ksoftirq-68        7d..2. 10363389898us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.372097] rcu_pree-16       13d..2. 10363389906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.374121] rcu_tort-20366    13dN.3. 10363393889us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10366.375494] rcu_tort-20366    13d..2. 10363393891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10366.377534] ksoftirq-110      13d.s3. 10363393900us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10366.378789] rcu_tort-173       0d..2. 10363393903us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.380787] ksoftirq-110      13d..2. 10363393905us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.383016] rcu_pree-16        0d..2. 10363393916us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.385006] rcu_tort-173       0dN.3. 10363397884us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.386270] rcu_tort-173       0d..2. 10363397886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.388267] ksoftirq-15        0d.s3. 10363397893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10366.389557] rcu_tort-20365     9d..2. 10363397895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.391581] ksoftirq-15        0d..2. 10363397896us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.393580] rcu_pree-16        9d..2. 10363397906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.395622] rcu_tort-173       0dN.4. 10363399885us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.396878] rcu_tort-173       0d..2. 10363399886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.398877] ksoftirq-15        0d..2. 10363399890us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.400893] rcu_tort-20365     9dN.3. 10363402882us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10366.402155] rcu_tort-20365     9d..2. 10363402883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10366.404163] ksoftirq-82        9d.s3. 10363402888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10366.405434] rcu_tort-20366    13d..2. 10363402891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.407556] ksoftirq-82        9d..2. 10363402891us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.409567] rcu_pree-16       13d..2. 10363402902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.411578] rcu_tort-20366    13dN.4. 10363407883us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10366.412865] rcu_tort-20366    13d..2. 10363407884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10366.414914] ksoftirq-110      13d.s3. 10363407890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10366.416169] rcu_tort-20360     2d..2. 10363407893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.418172] ksoftirq-110      13d..2. 10363407894us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.420186] rcu_pree-16        2d..2. 10363407907us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.422180] rcu_tort-20360     2dN.4. 10363411885us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.423461] rcu_tort-20360     2d..2. 10363411886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.425490] ksoftirq-32        2d.s3. 10363411894us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10366.426813] rcu_tort-20355     7d..2. 10363411899us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.428819] ksoftirq-32        2d..2. 10363411899us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.430827] rcu_pree-16        7d..2. 10363411913us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.432826] rcu_tort-20355     7dN.4. 10363415885us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.434079] rcu_tort-20355     7d..2. 10363415887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.436077] ksoftirq-68        7d.s3. 10363415895us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10366.437338] rcu_tort-173       0d..2. 10363415898us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.439331] ksoftirq-68        7d..2. 10363415899us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.441366] rcu_pree-16        0d..2. 10363415909us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.443332] rcu_tort-173       0d.h3. 10363416913us : sched_wakeup: comm=torture_stutter pid=172 prio=120 target_cpu=000
[10366.444664] rcu_tort-173       0dN.4. 10363419884us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.445913] rcu_tort-173       0d..2. 10363419886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.447886] ksoftirq-15        0d.s3. 10363419892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10366.449140] rcu_tort-20367    11d..2. 10363419893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.451145] ksoftirq-15        0d..2. 10363419894us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.453108] rcu_pree-16       11d..2. 10363419902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.455107] rcu_tort-20367    11dN.3. 10363424885us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.456363] rcu_tort-20367    11d..2. 10363424886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.458403] ksoftirq-96       11d.s3. 10363424893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10366.459657] rcu_tort-20360     2d..2. 10363424896us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.461657] ksoftirq-96       11d..2. 10363424897us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.463674] rcu_pree-16        2d..2. 10363424907us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.465668] rcu_tort-20360     2dN.3. 10363428884us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.466928] rcu_tort-20360     2d..2. 10363428885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.468980] ksoftirq-32        2d.s3. 10363428891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10366.470234] rcu_tort-20365     9d..2. 10363428893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.472246] ksoftirq-32        2d..2. 10363428895us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.474241] rcu_pree-16        9d..2. 10363428904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.476250] rcu_tort-20365     9dN.3. 10363431883us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10366.477535] rcu_tort-20365     9d..2. 10363431885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10366.479565] ksoftirq-82        9d..2. 10363431899us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.481569] rcu_tort-20365     9dN.3. 10363433884us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10366.482830] rcu_tort-20365     9d..2. 10363433885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10366.484857] ksoftirq-82        9d.s3. 10363433892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10366.486117] rcu_tort-173       0d..2. 10363433896us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.488103] ksoftirq-82        9d..2. 10363433897us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.490168] rcu_pree-16        0d..2. 10363433909us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.492199] rcu_tort-173       0dN.3. 10363437886us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.493454] rcu_tort-173       0d..2. 10363437888us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.495445] ksoftirq-15        0d.s3. 10363437896us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10366.496703] ksoftirq-15        0d..2. 10363437899us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.498690] rcu_tort-20366    13d..2. 10363437899us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.500709] rcu_pree-16       13d..2. 10363437909us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.502700] rcu_tort-20366    13dN.3. 10363442883us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10366.503987] rcu_tort-20366    13d..2. 10363442885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10366.506010] ksoftirq-110      13d.s3. 10363442892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.507264] ksoftirq-110      13d..2. 10363442896us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.509286] rcu_tort-20368     3d..2. 10363442897us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.511292] rcu_pree-16        3d..2. 10363442909us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.513292] rcu_tort-20368     3dN.4. 10363447885us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.514575] rcu_tort-20368     3d..2. 10363447887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.516597] ksoftirq-40        3d.s3. 10363447895us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10366.517858] rcu_tort-20360     2d..2. 10363447898us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.519881] ksoftirq-40        3d..2. 10363447899us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.521886] rcu_pree-16        2d..2. 10363447910us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.523887] rcu_tort-20360     2dN.3. 10363451891us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.525173] rcu_tort-20360     2d..2. 10363451894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.527188] ksoftirq-32        2d.s3. 10363451904us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10366.528510] rcu_tort-20367    11d..2. 10363451907us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.530623] ksoftirq-32        2d..2. 10363451910us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.532699] rcu_pree-16       11d..2. 10363451919us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.534919] rcu_tort-20367    11dN.3. 10363455884us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.536311] rcu_tort-20367    11d..2. 10363455885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.538460] ksoftirq-96       11d.s3. 10363455892us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.539757] rcu_tort-20368     3d..2. 10363455895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.541838] ksoftirq-96       11d..2. 10363455896us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.543820] rcu_pree-16        3d..2. 10363455906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.545795] rcu_tort-20366    13dN.3. 10363459884us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10366.547060] rcu_tort-20366    13d..2. 10363459885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10366.549071] rcu_tort-20368     3dN.3. 10363459890us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.550317] rcu_tort-20368     3d..2. 10363459893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.552317] ksoftirq-110      13d..2. 10363459895us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.554340] ksoftirq-40        3d.s3. 10363459902us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10366.555772] ksoftirq-40        3d..2. 10363459904us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.557921] rcu_tort-20362     5d..2. 10363459913us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.559931] rcu_pree-16        5d..2. 10363459925us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.561948] rcu_tort-20362     5dN.3. 10363464883us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10366.563204] rcu_tort-20362     5d..2. 10363464884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10366.565218] ksoftirq-54        5d.s3. 10363464890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10366.566526] rcu_tort-20367    11d..2. 10363464894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.568619] ksoftirq-54        5d..2. 10363464894us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.570860] rcu_pree-16       11d..2. 10363464904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.573090] rcu_tort-20367    11dN.3. 10363469884us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.574357] rcu_tort-20367    11d..2. 10363469885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.576366] ksoftirq-96       11d.s3. 10363469890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10366.577640] rcu_tort-20362     5d..2. 10363469893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.579669] ksoftirq-96       11d..2. 10363469894us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.581695] rcu_pree-16        5d..2. 10363469904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.583696] rcu_tort-20362     5dN.3. 10363474882us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10366.584951] rcu_tort-20362     5d..2. 10363474883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10366.586964] ksoftirq-54        5d.s3. 10363474887us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10366.588212] rcu_tort-20366    13d..2. 10363474890us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.590240] ksoftirq-54        5d..2. 10363474891us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.592238] rcu_pree-16       13d..2. 10363474906us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.594221] rcu_tort-20366    13dN.3. 10363478889us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10366.595520] rcu_tort-20366    13d..2. 10363478892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10366.597569] ksoftirq-110      13d.s3. 10363478900us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10366.598831] rcu_tort-20362     5d..2. 10363478901us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.600854] ksoftirq-110      13d..2. 10363478906us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.602863] rcu_pree-16        5d..2. 10363478912us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.604861] rcu_tort-20362     5dN.4. 10363483882us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10366.606137] rcu_tort-20362     5d..2. 10363483882us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10366.608164] ksoftirq-54        5d.s3. 10363483887us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10366.609436] ksoftirq-54        5d..2. 10363483890us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.611442] rcu_tort-173       0d..2. 10363483891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.613420] rcu_pree-16        0d..2. 10363483903us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.615362] rcu_tort-173       0dN.3. 10363487885us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.616626] rcu_tort-173       0d..2. 10363487886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.618607] ksoftirq-15        0d.s3. 10363487893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10366.619870] ksoftirq-15        0d..2. 10363487896us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.621843] rcu_tort-20360     2d..2. 10363487897us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.623852] rcu_pree-16        2d..2. 10363487907us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.625858] rcu_tort-20360     2dN.3. 10363492883us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.627110] rcu_tort-20360     2d..2. 10363492883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.629138] ksoftirq-32        2d.s3. 10363492889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=013
[10366.630437] rcu_tort-20366    13d..2. 10363492892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.632492] ksoftirq-32        2d..2. 10363492893us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.634537] rcu_pree-16       13d..2. 10363492904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.636567] rcu_tort-20366    13dN.3. 10363497884us : sched_wakeup: comm=ksoftirqd/13 pid=110 prio=97 target_cpu=013
[10366.637861] rcu_tort-20366    13d..2. 10363497885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/13 next_pid=110 next_prio=97
[10366.639907] ksoftirq-110      13d.s3. 10363497891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10366.641183] rcu_tort-20355     7d..2. 10363497895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.643203] ksoftirq-110      13d..2. 10363497895us : sched_switch: prev_comm=ksoftirqd/13 prev_pid=110 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20366 next_prio=98
[10366.645240] rcu_pree-16        7d..2. 10363497905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.647519] rcu_tort-20355     7dN.4. 10363501885us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.648862] rcu_tort-20355     7d..2. 10363501886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.650925] ksoftirq-68        7d.s3. 10363501894us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10366.652182] rcu_tort-20360     2d..2. 10363501896us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.654233] ksoftirq-68        7d..2. 10363501899us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.656309] rcu_pree-16        2d..2. 10363501908us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.658306] rcu_tort-173       0dN.3. 10363503884us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.659582] rcu_tort-173       0d..2. 10363503886us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.661564] ksoftirq-15        0d..2. 10363503889us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.663550] rcu_tort-20360     2dN.3. 10363506882us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.664801] rcu_tort-20360     2d..2. 10363506883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.666804] ksoftirq-32        2d.s3. 10363506888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=000
[10366.668109] ksoftirq-32        2d..2. 10363506892us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.670112] rcu_tort-173       0d..2. 10363506892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.672103] rcu_tort-20367    11d..2. 10363506895us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=kworker/11:1 next_pid=19375 next_prio=120
[10366.674181] rcu_pree-16        0d..2. 10363506902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.676221] kworker/-19375    11d..3. 10363506905us : dl_server_stop <-dequeue_entities
[10366.677216] kworker/-19375    11d..2. 10363506911us : sched_switch: prev_comm=kworker/11:1 prev_pid=19375 prev_prio=120 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.679289] rcu_tort-20367    11dN.3. 10363507883us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.680609] rcu_tort-20367    11d..2. 10363507885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.682639] ksoftirq-96       11d..2. 10363507890us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.684671] rcu_tort-173       0dN.3. 10363510884us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10366.685932] rcu_tort-173       0d..2. 10363510885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10366.687937] ksoftirq-15        0d.s3. 10363510891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.689196] ksoftirq-15        0d..2. 10363510893us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.691179] rcu_tort-20368     3d..2. 10363510894us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.693298] rcu_pree-16        3d..2. 10363510905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.695314] rcu_tort-20368     3dN.3. 10363515883us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.696615] rcu_tort-20368     3d..2. 10363515884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.698627] ksoftirq-40        3d.s3. 10363515890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10366.699902] rcu_tort-20355     7d..2. 10363515892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.701917] ksoftirq-40        3d..2. 10363515893us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.703928] rcu_pree-16        7d..2. 10363515901us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.706138] rcu_tort-20355     7dN.4. 10363520884us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.707410] rcu_tort-20355     7d..2. 10363520885us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.709435] ksoftirq-68        7d.s3. 10363520891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.710703] rcu_tort-20368     3d..2. 10363520892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.712713] ksoftirq-68        7d..2. 10363520895us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.714732] rcu_pree-16        3d..2. 10363520897us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.716755] rcu_tort-20368     3dN.3. 10363525883us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.718019] rcu_tort-20368     3d..2. 10363525884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.720031] ksoftirq-40        3d.s3. 10363525889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=009
[10366.721278] ksoftirq-40        3d..2. 10363525892us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.723266] rcu_tort-20365     9d..2. 10363525893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.725270] rcu_pree-16        9d..2. 10363525904us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.727258] rcu_tort-20365     9dN.4. 10363530886us : sched_wakeup: comm=ksoftirqd/9 pid=82 prio=97 target_cpu=009
[10366.728523] rcu_tort-20365     9d..2. 10363530887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/9 next_pid=82 next_prio=97
[10366.730530] ksoftirq-82        9d.s3. 10363530894us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10366.731788] rcu_tort-20360     2d..2. 10363530898us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.733804] ksoftirq-82        9d..2. 10363530898us : sched_switch: prev_comm=ksoftirqd/9 prev_pid=82 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20365 next_prio=98
[10366.735807] rcu_pree-16        2d..2. 10363530910us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.737799] rcu_tort-20360     2dN.3. 10363534890us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.739047] rcu_tort-20360     2d..2. 10363534893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.741067] ksoftirq-32        2d.s3. 10363534901us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10366.742346] rcu_tort-20368     3d..2. 10363534904us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.744357] ksoftirq-32        2d..2. 10363534907us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.746351] rcu_pree-16        3d..2. 10363534910us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.748349] rcu_tort-20368     3dN.4. 10363539882us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10366.749632] rcu_tort-20368     3d..2. 10363539883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10366.751652] ksoftirq-40        3d.s3. 10363539888us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=011
[10366.752903] rcu_tort-20367    11d..2. 10363539891us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.754905] ksoftirq-40        3d..2. 10363539892us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20368 next_prio=98
[10366.756907] rcu_pree-16       11d..2. 10363539900us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.758905] rcu_tort-20367    11dN.3. 10363544883us : sched_wakeup: comm=ksoftirqd/11 pid=96 prio=97 target_cpu=011
[10366.760171] rcu_tort-20367    11d..2. 10363544884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/11 next_pid=96 next_prio=97
[10366.762194] ksoftirq-96       11d.s3. 10363544890us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=007
[10366.763490] rcu_tort-20355     7d..2. 10363544892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.765526] ksoftirq-96       11d..2. 10363544894us : sched_switch: prev_comm=ksoftirqd/11 prev_pid=96 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20367 next_prio=98
[10366.767552] rcu_pree-16        7d..2. 10363544902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.769589] rcu_tort-20355     7dN.3. 10363548886us : sched_wakeup: comm=ksoftirqd/7 pid=68 prio=97 target_cpu=007
[10366.770855] rcu_tort-20355     7d..2. 10363548887us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/7 next_pid=68 next_prio=97
[10366.772893] ksoftirq-68        7d.s3. 10363548893us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10366.774170] rcu_tort-20362     5d..2. 10363548897us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.776753] ksoftirq-68        7d..2. 10363548898us : sched_switch: prev_comm=ksoftirqd/7 prev_pid=68 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20355 next_prio=98
[10366.779820] rcu_pree-16        5d..2. 10363548908us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.782066] rcu_tort-20362     5dN.4. 10363553882us : sched_wakeup: comm=ksoftirqd/5 pid=54 prio=97 target_cpu=005
[10366.783331] rcu_tort-20362     5d..2. 10363553883us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/5 next_pid=54 next_prio=97
[10366.785358] ksoftirq-54        5d.s3. 10363553889us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10366.786653] rcu_tort-20360     2d..2. 10363553892us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.788681] ksoftirq-54        5d..2. 10363553893us : sched_switch: prev_comm=ksoftirqd/5 prev_pid=54 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.790682] rcu_pree-16        2d..2. 10363553905us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.792698] rcu_tort-20360     2dN.3. 10363558883us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10366.793954] rcu_tort-20360     2d..2. 10363558884us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10366.795958] ksoftirq-32        2d.s3. 10363558891us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=005
[10366.797285] rcu_tort-20362     5d..2. 10363558893us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10366.799405] ksoftirq-32        2d..2. 10363558895us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=20360 next_prio=98
[10366.801559] rcu_pree-16        5d..2. 10363558902us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20362 next_prio=98
[10366.803628] rcu_tort-173       0d..2. 10363559190us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=R+ ==> next_comm=kworker/0:0 next_pid=20144 next_prio=120
[10366.805756] kworker/-20144     0d..2. 10363559197us : sched_switch: prev_comm=kworker/0:0 prev_pid=20144 prev_prio=120 prev_state=I ==> next_comm=torture_stutter next_pid=172 next_prio=120
[10366.807885] torture_-172       0d..2. 10363559201us : sched_switch: prev_comm=torture_stutter prev_pid=172 prev_prio=120 prev_state=I ==> next_comm=rcu_torture_rea next_pid=157 next_prio=139
[10366.810012] rcu_tort-20355     7d..2. 10363559204us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20355 prev_prio=98 prev_state=I ==> next_comm=rcu_torture_fak next_pid=151 next_prio=139
[10366.812100] rcu_tort-20368     3d..2. 10363559205us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20368 prev_prio=98 prev_state=I ==> next_comm=rcu_torture_wri next_pid=148 next_prio=120
[10366.814261] rcu_tort-20362     5d..2. 10363559206us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20362 prev_prio=98 prev_state=I ==> next_comm=rcu_torture_rea next_pid=162 next_prio=139
[10366.816421] rcu_tort-20366    13d..2. 10363559207us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20366 prev_prio=98 prev_state=I ==> next_comm=rcu_torture_rea next_pid=155 next_prio=139
[10366.818491] rcu_tort-151       7d..2. 10363559210us : sched_switch: prev_comm=rcu_torture_fak prev_pid=151 prev_prio=139 prev_state=I ==> next_comm=kworker/7:0 next_pid=19250 next_prio=120
[10366.820538] rcu_tort-148       3dN.3. 10363559210us : dl_server_stop <-dequeue_entities
[10366.821524] rcu_tort-157       0d..3. 10363559211us : dl_server_stop <-dequeue_entities
[10366.822504] rcu_tort-162       5d..2. 10363559215us : sched_switch: prev_comm=rcu_torture_rea prev_pid=162 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=164 next_prio=139
[10366.824556] rcu_tort-157       0d..2. 10363559216us : sched_switch: prev_comm=rcu_torture_rea prev_pid=157 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_boo next_pid=173 next_prio=98
[10366.826593] rcu_tort-20365     9d..3. 10363559218us : dl_server_start <-enqueue_task_fair
[10366.827590] kworker/-19250     7d..3. 10363559219us : dl_server_stop <-dequeue_entities
[10366.828572] rcu_tort-20365     9d..2. 10363559221us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20365 prev_prio=98 prev_state=I ==> next_comm=kcompactd0 next_pid=134 next_prio=120
[10366.830603] rcu_tort-20360     2d..3. 10363559222us : dl_server_start <-enqueue_task_fair
[10366.831611] rcu_tort-20367    11d..3. 10363559225us : dl_server_start <-enqueue_task_fair
[10366.832615] rcu_tort-20360     2d..2. 10363559225us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20360 prev_prio=98 prev_state=I ==> next_comm=kthreadd next_pid=2 next_prio=120
[10366.834608] rcu_tort-164       5d..2. 10363559225us : sched_switch: prev_comm=rcu_torture_rea prev_pid=164 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_boo next_pid=20364 next_prio=98
[10366.836703] kcompact-134       9d..3. 10363559225us : dl_server_stop <-dequeue_entities
[10366.837691] rcu_tort-155      13d..2. 10363559227us : sched_switch: prev_comm=rcu_torture_rea prev_pid=155 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=154 next_prio=139
[10366.839748] rcu_tort-20367    11d..2. 10363559227us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20367 prev_prio=98 prev_state=I ==> next_comm=rcu_torture_rea next_pid=156 next_prio=139
[10366.841822] kworker/-19250     7d..3. 10363559232us : dl_server_start <-enqueue_task_fair
[10366.842856] rcu_tort-156      11d..3. 10363559232us : dl_server_stop <-dequeue_entities
[10366.843846] rcu_tort-20364     5d..2. 10363559233us : sched_switch: prev_comm=rcu_torture_boo prev_pid=20364 prev_prio=98 prev_state=I ==> next_comm=rcu_torture_fak next_pid=153 next_prio=139
[10366.845949] kworker/-19250     7d..2. 10363559234us : sched_switch: prev_comm=kworker/7:0 prev_pid=19250 prev_prio=120 prev_state=I ==> next_comm=rcu_torture_fak next_pid=149 next_prio=139
[10366.847982] rcu_tort-154      13d..2. 10363559236us : sched_switch: prev_comm=rcu_torture_rea prev_pid=154 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_bar next_pid=196 next_prio=120
[10366.850053] rcu_tort-149       7d..3. 10363559236us : dl_server_stop <-dequeue_entities
[10366.851038] kcompact-134       9d..2. 10363559237us : sched_switch: prev_comm=kcompactd0 prev_pid=134 prev_prio=120 prev_state=S ==> next_comm=swapper/9 next_pid=0 next_prio=120
[10366.852970] rcu_tort-153       5d..2. 10363559237us : sched_switch: prev_comm=rcu_torture_fak prev_pid=153 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=159 next_prio=139
[10366.855030] rcu_tort-173       0d..3. 10363559240us : dl_server_start <-enqueue_task_fair
[10366.856025] rcu_tort-159       5d..3. 10363559241us : dl_server_stop <-dequeue_entities
[10366.856998] rcu_tort-173       0d..2. 10363559244us : sched_switch: prev_comm=rcu_torture_boo prev_pid=173 prev_prio=98 prev_state=I ==> next_comm=rcu_torture_rea next_pid=165 next_prio=139
[10366.859061] rcu_tort-148       3dN.3. 10363559245us : dl_server_start <-enqueue_task_fair
[10366.860069] ---------------------------------
[10366.860683] Dumping ftrace buffer:
[10366.861094]    (ftrace buffer empty)
[10368.660736] Boost inversion persisted: No QS from CPU 3
[10368.660756] rcu-torture: rcu_torture_boost is stopping
[10368.667675] rcu-torture: rcu_torture_read_exit: End of episode

