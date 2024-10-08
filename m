Return-Path: <linux-next+bounces-4155-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E887995A19
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 00:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C58EB22829
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 22:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E328215013;
	Tue,  8 Oct 2024 22:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2D2HTRg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1059F184551;
	Tue,  8 Oct 2024 22:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728426898; cv=none; b=LO6upNq/Zk03WV/CBbUlUDJke9PYH/rOIAVDedh4GfdOKJiN1X3Ot+U1CeOn7neJUlgwfSV0RH5QihRRCRZZb9CFJoY/O1+4bdLnEqyNef+AKWaxzUGm4ql7scWVOGWSqXKuarIkSh/eqIQQE6aeesnXVtlHPPFDrE7//FYGTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728426898; c=relaxed/simple;
	bh=bpd+Uu1XNqjdImXGCQqnfFPu8/wTHfCVPAovDqkLSMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6xEpo6OMmFnkb0b9k0i8ZotwPOzmbFma6cWtqm2kF/J/be/H/kRmkql+hPOOdpp1fMvq1B1OyywVNHH0YZEIqCCCq4jbrN3EbFj5lrcnOKFQL5xNfMwG3WMBYghIiIOuwfnt0/eh7+HR6y7hG6aFN1Rr3cFCn7UJpP2DJJ5nvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2D2HTRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81133C4CEC7;
	Tue,  8 Oct 2024 22:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728426897;
	bh=bpd+Uu1XNqjdImXGCQqnfFPu8/wTHfCVPAovDqkLSMM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=r2D2HTRgjyWoX2HcUxPUexZeLk0xGjoFhe9xxDs8N0o7FwpKLd/Q0LHm3AI/c5gRc
	 XEv1lQTDjmVp6d6OZWk6YLoBIW6auHrVUtTt8qmDeJpQMy5mAxs99aQWyRcRn7DNJN
	 ynVCxW1ro2USYAxqAlMA42YCurcu0rTQceM/9n/zuzYUZlgcR97/Zni9pWPq0X9Oqs
	 6DuvxzSEHZm8sNeelTvcYhN8xbScsUIMghE6yf2fE8bgBWJv3+RuZ1/XQ5LEIrFsfh
	 wVoGLsfP2WPtc/F0G/tewN0SYhoftFRL6XQMbz2jA2Zna3R+kGzwa86R37aNmPhXQa
	 zQSiucMLIQvsQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 231EDCE0DD1; Tue,  8 Oct 2024 15:34:57 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:34:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <853fb13d-7f4d-4280-9fd6-04c1c79e7a29@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
 <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
 <20241003142240.GU5594@noisy.programming.kicks-ass.net>
 <7b14822a-ee98-4e46-9828-1e41b1ce76f3@paulmck-laptop>
 <20241003185037.GA5594@noisy.programming.kicks-ass.net>
 <20241004133532.GH33184@noisy.programming.kicks-ass.net>
 <9961cb9c-70f0-405b-b259-575586905ae0@paulmck-laptop>
 <20241008111150.GD17263@noisy.programming.kicks-ass.net>
 <814ef3b2-bedd-4433-af7c-115c5f37ce39@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <814ef3b2-bedd-4433-af7c-115c5f37ce39@paulmck-laptop>

On Tue, Oct 08, 2024 at 09:24:11AM -0700, Paul E. McKenney wrote:
> On Tue, Oct 08, 2024 at 01:11:50PM +0200, Peter Zijlstra wrote:
> > On Sun, Oct 06, 2024 at 01:44:53PM -0700, Paul E. McKenney wrote:
> > 
> > > With your patch, I got 24 failures out of 100 TREE03 runs of 18 hours
> > > each.  The failures were different, though, mostly involving boost
> > > failures in which RCU priority boosting didn't actually result in the
> > > low-priority readers getting boosted.  
> > 
> > Somehow I feel this is progress, albeit very minor :/
> > 
> > > There were also a number of "sched: DL replenish lagged too much"
> > > messages, but it looks like this was a symptom of the ftrace dump.
> > > 
> > > Given that this now involves priority boosting, I am trying 400*TREE03
> > > with each guest OS restricted to four CPUs to see if that makes things
> > > happen more quickly, and will let you know how this goes.
> 
> And this does seem to make things happen more quickly, but including
> an RCU splat.  So...
> 
> > > Any other debug I should apply?
> > 
> > The sched_pi_setprio tracepoint perhaps?
> 
> I will give it a shot, thank you!

And the ftrace output is shown below.

> > I've read all the RCU_BOOST and rtmutex code (once again), and I've been
> > running pi_stress with --sched id=low,policy=other to ensure the code
> > paths in question are taken. But so far so very nothing :/
> > 
> > (Noting that both RCU_BOOST and PI futexes use the same rt_mutex / PI API)
> > 
> > You know RCU_BOOST better than me.. then again, it is utterly weird this
> > is apparently affected. I've gotta ask, a kernel with my patch on and
> > additionally flipping kernel/sched/features.h:SCHED_FEAT(DELAY_DEQUEUE,
> > false) functions as expected?
> 
> I will try that after the sched_pi_setprio tracepoint (presumably both).

And trying this now.

							Thanx, Paul

------------------------------------------------------------------------

[10611.834143] Dumping ftrace buffer:
[10611.834561] ---------------------------------
[10611.835048] CPU:1 [LOST 16689746 EVENTS]
[10611.835048] rcu_tort-70        1dNh3. 10607789211us : sched_wakeup: comm=rcu_torture_fak pid=65 prio=139 target_cpu=001
[10611.836636] rcu_tort-70        1d..2. 10607789214us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_fak next_pid=65 next_prio=139
[10611.838442] rcu_tort-65        1d..2. 10607789216us : sched_switch: prev_comm=rcu_torture_fak prev_pid=65 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=70 next_prio=139
[10611.840241] rcu_tort-70        1dNh3. 10607789717us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.841300] rcu_tort-70        1dN.3. 10607789720us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10611.842407] rcu_tort-70        1d..2. 10607789722us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.844154]   rcuc/1-25        1d..2. 10607789726us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10611.845811] ksoftirq-26        1d..2. 10607789728us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.847613] rcu_tort-71        1d..2. 10607790926us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=70 next_prio=139
[10611.849423] rcu_tort-70        1dN.5. 10607790929us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=001
[10611.850541] rcu_tort-70        1d..2. 10607790931us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10611.852290] rcu_pree-16        1d..2. 10607790934us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_rea next_pid=70 next_prio=139
[10611.854025] rcu_tort-70        1d..2. 10607791171us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=18 next_prio=97
[10611.855867] rcu_exp_-18        1d..2. 10607791180us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=18 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=70 next_prio=139
[10611.857681] rcu_tort-70        1d..2. 10607791187us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=rcub/1 next_pid=17 next_prio=97
[10611.859412]   rcub/1-17        1d..3. 10607791189us : sched_pi_setprio: comm=rcu_torture_rea pid=71 oldprio=139 newprio=97
[10611.860594]   rcub/1-17        1d..2. 10607791194us : sched_switch: prev_comm=rcub/1 prev_pid=17 prev_prio=97 prev_state=D ==> next_comm=rcu_torture_rea next_pid=71 next_prio=97
[10611.862281] rcu_tort-71        1dN.4. 10607791203us : sched_pi_setprio: comm=rcu_torture_rea pid=71 oldprio=97 newprio=139
[10611.863467] rcu_tort-71        1dN.5. 10607791206us : sched_wakeup: comm=rcub/1 pid=17 prio=97 target_cpu=001
[10611.864532] rcu_tort-71        1d..2. 10607791207us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcub/1 next_pid=17 next_prio=97
[10611.866247]   rcub/1-17        1d..2. 10607791209us : sched_switch: prev_comm=rcub/1 prev_pid=17 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=70 next_prio=139
[10611.867939] rcu_tort-70        1dNh3. 10607791718us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.869003] rcu_tort-70        1d..2. 10607791722us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.870714]   rcuc/1-25        1D..4. 10607791725us : sched_wakeup: comm=rcu_torture_fak pid=67 prio=139 target_cpu=001
[10611.871889]   rcuc/1-25        1d..2. 10607791727us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_fak next_pid=67 next_prio=139
[10611.873607] rcu_tort-67        1d..2. 10607791730us : sched_switch: prev_comm=rcu_torture_fak prev_pid=67 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=70 next_prio=139
[10611.875411] rcu_tort-70        1dNh4. 10607792268us : sched_wakeup: comm=torture_onoff pid=80 prio=120 target_cpu=001
[10611.876557] rcu_tort-70        1d..2. 10607792273us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=torture_onoff next_pid=80 next_prio=120
[10611.878372] torture_-80        1d..2. 10607792285us : sched_switch: prev_comm=torture_onoff prev_pid=80 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.880164] rcu_tort-71        1d..2. 10607792776us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10611.881932] rcu_pree-16        1d..2. 10607792780us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.883704] rcu_tort-71        1d..2. 10607793384us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=70 next_prio=139
[10611.885531] rcu_tort-70        1DNh3. 10607793717us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.886718] rcu_tort-70        1d..2. 10607793721us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.888440]   rcuc/1-25        1d..2. 10607793724us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=70 next_prio=139
[10611.890155] rcu_tort-70        1dNh3. 10607794403us : sched_wakeup: comm=rcu_torture_fak pid=66 prio=139 target_cpu=001
[10611.891349] rcu_tort-70        1d..2. 10607794406us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_fak next_pid=66 next_prio=139
[10611.893184] rcu_tort-66        1d..5. 10607794408us : sched_wakeup: comm=kworker/1:2 pid=17058 prio=120 target_cpu=001
[10611.894365] rcu_tort-66        1d..2. 10607794410us : sched_switch: prev_comm=rcu_torture_fak prev_pid=66 prev_prio=139 prev_state=I ==> next_comm=kworker/1:2 next_pid=17058 next_prio=120
[10611.896169] kworker/-17058     1d..2. 10607794418us : sched_switch: prev_comm=kworker/1:2 prev_pid=17058 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.897961] rcu_tort-71        1d..2. 10607794445us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=18 next_prio=97
[10611.899770] rcu_exp_-18        1d..2. 10607794455us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=18 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.901564] rcu_tort-71        1d..2. 10607794462us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcu_torture_rea next_pid=69 next_prio=97
[10611.903370] rcu_tort-69        1dN.4. 10607794467us : sched_pi_setprio: comm=rcu_torture_rea pid=69 oldprio=97 newprio=139
[10611.904560] rcu_tort-69        1d..2. 10607794475us : sched_switch: prev_comm=rcu_torture_rea prev_pid=69 prev_prio=139 prev_state=R+ ==> next_comm=rcub/1 next_pid=17 next_prio=97
[10611.906279]   rcub/1-17        1d..3. 10607794479us : sched_pi_setprio: comm=rcu_torture_rea pid=70 oldprio=139 newprio=97
[10611.907467]   rcub/1-17        1d..2. 10607794484us : sched_switch: prev_comm=rcub/1 prev_pid=17 prev_prio=97 prev_state=D ==> next_comm=rcu_torture_rea next_pid=70 next_prio=97
[10611.909164] rcu_tort-70        1dN.4. 10607794493us : sched_pi_setprio: comm=rcu_torture_rea pid=70 oldprio=97 newprio=139
[10611.910354] rcu_tort-70        1dN.5. 10607794495us : sched_wakeup: comm=rcub/1 pid=17 prio=97 target_cpu=001
[10611.911434] rcu_tort-70        1d..2. 10607794496us : sched_switch: prev_comm=rcu_torture_rea prev_pid=70 prev_prio=139 prev_state=R+ ==> next_comm=rcub/1 next_pid=17 next_prio=97
[10611.913150]   rcub/1-17        1d..2. 10607794498us : sched_switch: prev_comm=rcub/1 prev_pid=17 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.914855] rcu_tort-71        1d..2. 10607794518us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=kworker/1:2 next_pid=17058 next_prio=120
[10611.916657] kworker/-17058     1d..2. 10607794525us : sched_switch: prev_comm=kworker/1:2 prev_pid=17058 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.918449] rcu_tort-71        1d..2. 10607794537us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=18 next_prio=97
[10611.920251] rcu_exp_-18        1d..2. 10607794545us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=18 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.922041] rcu_tort-71        1d..2. 10607794550us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcub/1 next_pid=17 next_prio=97
[10611.923767]   rcub/1-17        1d..2. 10607794552us : sched_switch: prev_comm=rcub/1 prev_pid=17 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.925478] rcu_tort-71        1d..2. 10607794560us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=kworker/1:2 next_pid=17058 next_prio=120
[10611.927276] kworker/-17058     1d..2. 10607794562us : sched_switch: prev_comm=kworker/1:2 prev_pid=17058 prev_prio=120 prev_state=I ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.929049] rcu_tort-71        1d..2. 10607794747us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10611.930807] rcu_pree-16        1d..2. 10607794752us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.932585] rcu_tort-71        1DNh5. 10607795806us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.933652] rcu_tort-71        1d..2. 10607795819us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=rcu_exp_par_gp_ next_pid=18 next_prio=97
[10611.935442] rcu_exp_-18        1d..2. 10607795826us : sched_switch: prev_comm=rcu_exp_par_gp_ prev_pid=18 prev_prio=97 prev_state=S ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.937143]   rcuc/1-25        1d..2. 10607795829us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10611.938772]  cpuhp/1-23        1d..2. 10607795835us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_rea next_pid=69 next_prio=139
[10611.940497] rcu_tort-69        1dN.6. 10607795838us : sched_wakeup: comm=migration/1 pid=24 prio=0 target_cpu=001
[10611.941606] rcu_tort-69        1d..2. 10607795839us : sched_switch: prev_comm=rcu_torture_rea prev_pid=69 prev_prio=139 prev_state=R+ ==> next_comm=migration/1 next_pid=24 next_prio=0
[10611.943359] migratio-24        1d..2. 10607795850us : sched_switch: prev_comm=migration/1 prev_pid=24 prev_prio=0 prev_state=S ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10611.945763] rcu_tort-71        1dN.6. 10607795851us : sched_wakeup: comm=migration/1 pid=24 prio=0 target_cpu=001
[10611.947438] rcu_tort-71        1d..2. 10607795852us : sched_switch: prev_comm=rcu_torture_rea prev_pid=71 prev_prio=139 prev_state=R+ ==> next_comm=migration/1 next_pid=24 next_prio=0
[10611.949813] migratio-24        1d..4. 10607795854us : dl_server_stop <-dequeue_entities
[10611.950703] migratio-24        1d..2. 10607795859us : sched_switch: prev_comm=migration/1 prev_pid=24 prev_prio=0 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10611.952391]   <idle>-0         1d.h4. 10607796329us : sched_wakeup: comm=rcu_torture_rea pid=71 prio=139 target_cpu=003
[10611.953557]   <idle>-0         1dNh4. 10607797725us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.954631]   <idle>-0         1d..2. 10607797729us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.956280]   rcuc/1-25        1d..2. 10607797732us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10611.957915]   <idle>-0         1d.h4. 10607798540us : sched_wakeup: comm=rcu_torture_fak pid=65 prio=139 target_cpu=003
[10611.959081]   <idle>-0         1dNh4. 10607798723us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.960162]   <idle>-0         1d..2. 10607798726us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.961800]   rcuc/1-25        1d..2. 10607798728us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10611.963453]   <idle>-0         1d.h4. 10607798758us : sched_wakeup: comm=rcu_torture_fak pid=67 prio=139 target_cpu=003
[10611.964626]   <idle>-0         1dN.4. 10607799726us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10611.965757]   <idle>-0         1d..2. 10607799727us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10611.967444] ksoftirq-26        1d..2. 10607799729us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10611.969146]   <idle>-0         1d.h4. 10607808780us : sched_wakeup: comm=rcu_torture_fak pid=66 prio=139 target_cpu=003
[10611.970315]   <idle>-0         1dN.4. 10608035728us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10611.971442]   <idle>-0         1d..2. 10608035730us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10611.973138] ksoftirq-26        1d..2. 10608035734us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10611.974829]   <idle>-0         1dNh4. 10608098728us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.975903]   <idle>-0         1d..2. 10608098733us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.977556]   rcuc/1-25        1d..2. 10608098739us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10611.979216]   <idle>-0         1dNh4. 10608099736us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.980289]   <idle>-0         1d..2. 10608099744us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.981927]   rcuc/1-25        1d..2. 10608099753us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10611.983576]   <idle>-0         1dNh4. 10608100771us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.984649]   <idle>-0         1d..2. 10608100774us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.986360]   rcuc/1-25        1D..5. 10608100779us : dl_server_start <-enqueue_task_fair
[10611.987249]   rcuc/1-25        1DN.4. 10608100781us : sched_wakeup: comm=cpuhp/1 pid=23 prio=120 target_cpu=001
[10611.988339]   rcuc/1-25        1d..2. 10608100784us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10611.989984]  cpuhp/1-23        1dNh4. 10608101849us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10611.991130]  cpuhp/1-23        1d..2. 10608101862us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10611.992756]   rcuc/1-25        1d..2. 10608101873us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10611.994388]  cpuhp/1-23        1d..3. 10608101878us : dl_server_stop <-dequeue_entities
[10611.995253]  cpuhp/1-23        1d..2. 10608101882us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=D ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10611.996901]   <idle>-0         1d..2. 10608102674us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10611.998558]  cpuhp/1-23        1d..3. 10608102700us : dl_server_stop <-dequeue_entities
[10611.999419]  cpuhp/1-23        1d..2. 10608102706us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=D ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10612.001066]   <idle>-0         1dNh4. 10608102724us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10612.002181]   <idle>-0         1d..2. 10608102728us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10612.003853]   rcuc/1-25        1d..2. 10608102732us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10612.005493]   <idle>-0         1d..2. 10608102776us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10612.007148]  cpuhp/1-23        1d..3. 10608102808us : dl_server_stop <-dequeue_entities
[10612.008002]  cpuhp/1-23        1d..2. 10608102809us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=D ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10612.009655]   <idle>-0         1d..2. 10608102835us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10612.011308]  cpuhp/1-23        1dN.3. 10608102923us : sched_wakeup: comm=ksoftirqd/1 pid=26 prio=97 target_cpu=001
[10612.012417]  cpuhp/1-23        1d..2. 10608102925us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=R+ ==> next_comm=ksoftirqd/1 next_pid=26 next_prio=97
[10612.014095] ksoftirq-26        1d..2. 10608102927us : sched_switch: prev_comm=ksoftirqd/1 prev_pid=26 prev_prio=97 prev_state=P ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10612.015775]  cpuhp/1-23        1dN.3. 10608102928us : sched_wakeup: comm=rcuc/1 pid=25 prio=97 target_cpu=001
[10612.016842]  cpuhp/1-23        1d..2. 10608102929us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=R+ ==> next_comm=rcuc/1 next_pid=25 next_prio=97
[10612.018483]   rcuc/1-25        1d..2. 10608102930us : sched_switch: prev_comm=rcuc/1 prev_pid=25 prev_prio=97 prev_state=P ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10612.020125]  cpuhp/1-23        1d..3. 10608102936us : dl_server_stop <-dequeue_entities
[10612.020980]  cpuhp/1-23        1d..2. 10608102937us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=S ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10612.022639]   <idle>-0         1d..2. 10608102952us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=cpuhp/1 next_pid=23 next_prio=120
[10612.024297]  cpuhp/1-23        1d..3. 10608102956us : dl_server_stop <-dequeue_entities
[10612.025159]  cpuhp/1-23        1d..2. 10608102957us : sched_switch: prev_comm=cpuhp/1 prev_pid=23 prev_prio=120 prev_state=P ==> next_comm=swapper/1 next_pid=0 next_prio=120
[10612.026812]   <idle>-0         1d..2. 10608102968us : sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=migration/1 next_pid=24 next_prio=0
[10612.028498] CPU:0 [LOST 41556131 EVENTS]
[10612.028498] ksoftirq-15        0d..2. 10612061728us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.030666] rcu_tort-75        0dNh3. 10612062717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.031732] rcu_tort-75        0d..2. 10612062720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.033431]   rcuc/0-19        0d..2. 10612062721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.035822] rcu_tort-75        0dNh3. 10612063717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.037431] rcu_tort-75        0d..2. 10612063720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.039694]   rcuc/0-19        0d..2. 10612063721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.041398] rcu_tort-75        0dNh3. 10612064717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.042469] rcu_tort-75        0d..2. 10612064719us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.044178]   rcuc/0-19        0d..2. 10612064721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.045874] rcu_tort-75        0dNh3. 10612065717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.046943] rcu_tort-75        0d..2. 10612065720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.048671]   rcuc/0-19        0d..2. 10612065721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.050376] CPU:2 [LOST 16225065 EVENTS]
[10612.050376]   rcuc/2-31        2D..4. 10612066725us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.051903]   rcuc/2-31        2d..2. 10612066729us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.053636] rcu_tort-75        0dNh3. 10612067717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.054706] rcu_tort-19668     2dNh4. 10612067717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.055810] rcu_tort-75        0d..2. 10612067719us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.057559] rcu_tort-19668     2d..2. 10612067720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.059356]   rcuc/0-19        0d..2. 10612067721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.061055]   rcuc/2-31        2d..2. 10612067723us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.062793] rcu_tort-75        0dNh3. 10612068718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.063870] rcu_tort-19668     2dNh4. 10612068719us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.064942] rcu_tort-75        0d..2. 10612068720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.066649]   rcuc/0-19        0d..2. 10612068722us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.068421] rcu_tort-19668     2d..2. 10612068722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.070195]   rcuc/2-31        2D..4. 10612068727us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.071306]   rcuc/2-31        2d..2. 10612068730us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.073018] rcu_tort-75        0dNh3. 10612069718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.074094] rcu_tort-19668     2dNh3. 10612069718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.075185] rcu_tort-75        0d..2. 10612069720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.076900] rcu_tort-19668     2d..2. 10612069721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.078706]   rcuc/0-19        0d..2. 10612069722us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.080432]   rcuc/2-31        2d..2. 10612069724us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.082160] rcu_tort-19668     2dNh3. 10612070717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.083231] rcu_tort-75        0dNh3. 10612070718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.084303] rcu_tort-75        0d..2. 10612070720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.086004] rcu_tort-19668     2d..2. 10612070720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.087745]   rcuc/0-19        0d..2. 10612070721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.089444]   rcuc/2-31        2d..2. 10612070722us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.091177] rcu_tort-19668     2dNh3. 10612071718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.092246] rcu_tort-19668     2d..2. 10612071721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.094022]   rcuc/2-31        2D..4. 10612071726us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.095228]   rcuc/2-31        2d..2. 10612071729us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.097464] rcu_tort-19668     2dNh3. 10612072717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.099083] rcu_tort-75        0dNh3. 10612072717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.100657] rcu_tort-75        0d..2. 10612072720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.102669] rcu_tort-19668     2d..2. 10612072720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.104422]   rcuc/0-19        0d..2. 10612072721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.106128]   rcuc/2-31        2d..2. 10612072723us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.107854] rcu_tort-75        0dNh3. 10612073717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.108945] rcu_tort-19668     2dNh3. 10612073719us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.110023] rcu_tort-75        0d..2. 10612073720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.111750]   rcuc/0-19        0d..2. 10612073721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.113505] rcu_tort-19668     2d..2. 10612073722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.115262]   rcuc/2-31        2D..4. 10612073726us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.116380]   rcuc/2-31        2d..2. 10612073730us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.118115] rcu_tort-75        0dNh3. 10612074718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.119187] rcu_tort-19668     2dNh3. 10612074718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.120269] rcu_tort-75        0d..2. 10612074720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.121975]   rcuc/0-19        0d..2. 10612074721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.123703] rcu_tort-19668     2d..2. 10612074721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.125471]   rcuc/2-31        2d..2. 10612074723us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.127223] rcu_tort-19668     2dNh3. 10612075717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.128293] rcu_tort-75        0dNh4. 10612075718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.129365] rcu_tort-19668     2d..2. 10612075720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.131116] rcu_tort-75        0d..2. 10612075720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.132833]   rcuc/0-19        0d..2. 10612075722us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.134540]   rcuc/2-31        2D..4. 10612075726us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.135660]   rcuc/2-31        2d..2. 10612075729us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.137387] rcu_tort-75        0dNh3. 10612076717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.138459] rcu_tort-19668     2dNh3. 10612076718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.139530] rcu_tort-75        0d..2. 10612076719us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.141240]   rcuc/0-19        0d..2. 10612076721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.142946] rcu_tort-19668     2d..2. 10612076722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.144686] CPU:3 [LOST 16631447 EVENTS]
[10612.144686] rcu_tort-19649     3d..2. 10612076722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/3 next_pid=39 next_prio=97
[10612.146847]   rcuc/2-31        2d..2. 10612076723us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.148570]   rcuc/3-39        3d..2. 10612076723us : sched_switch: prev_comm=rcuc/3 prev_pid=39 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.150296] rcu_tort-19668     2dNh3. 10612077717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.151370] rcu_tort-75        0dNh3. 10612077718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.152440] rcu_tort-19668     2d..2. 10612077720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.154169] rcu_tort-75        0d..2. 10612077720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.155865]   rcuc/2-31        2d..2. 10612077722us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.157585]   rcuc/0-19        0D..4. 10612077726us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.158695] rcu_tort-19649     3d..2. 10612077729us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.160468]   rcuc/0-19        0d..2. 10612077730us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.162160] rcu_pree-16        3d..2. 10612077741us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.163918] rcu_tort-75        0dNh3. 10612078717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.164979] rcu_tort-19649     3dNh3. 10612078718us : sched_wakeup: comm=rcuc/3 pid=39 prio=97 target_cpu=003
[10612.166039] rcu_tort-19668     2dNh4. 10612078718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.167100] rcu_tort-75        0d..2. 10612078720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.168799]   rcuc/0-19        0d..2. 10612078721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.170489] rcu_tort-19649     3dN.3. 10612078722us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.171600] rcu_tort-19668     2d..2. 10612078722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.173333] rcu_tort-19649     3d..2. 10612078722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/3 next_pid=39 next_prio=97
[10612.175050]   rcuc/2-31        2d..2. 10612078724us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.176765]   rcuc/3-39        3d..2. 10612078724us : sched_switch: prev_comm=rcuc/3 prev_pid=39 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.178431] ksoftirq-40        3d..2. 10612078725us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.180191] rcu_tort-75        0dNh4. 10612079717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.181255] rcu_tort-19668     2dNh3. 10612079718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.182320] rcu_tort-75        0d..2. 10612079720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.184011]   rcuc/0-19        0d..2. 10612079721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.185715] rcu_tort-19668     2d..2. 10612079722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.187444]   rcuc/2-31        2D..4. 10612079726us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.188554] rcu_tort-19649     3d..2. 10612079728us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.190330]   rcuc/2-31        2d..2. 10612079730us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.192041] rcu_pree-16        3d..2. 10612079737us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.193807] rcu_tort-19649     3dNh4. 10612080717us : sched_wakeup: comm=rcuc/3 pid=39 prio=97 target_cpu=003
[10612.194873] rcu_tort-19668     2dNh4. 10612080717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.195941] rcu_tort-75        0dNh3. 10612080717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.197007] rcu_tort-75        0d..2. 10612080720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.198791] rcu_tort-19668     2d..2. 10612080721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.200549] rcu_tort-19649     3d..2. 10612080721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/3 next_pid=39 next_prio=97
[10612.202293]   rcuc/0-19        0d..2. 10612080721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.204014]   rcuc/2-31        2d..2. 10612080723us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.205812]   rcuc/3-39        3d..2. 10612080723us : sched_switch: prev_comm=rcuc/3 prev_pid=39 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.207556] rcu_tort-75        0dNh4. 10612081718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.208632] rcu_tort-19668     2dNh3. 10612081718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.209714] rcu_tort-75        0d..2. 10612081720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.211477] rcu_tort-19649     3dN.3. 10612081720us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.213195] rcu_tort-19649     3d..2. 10612081721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.215854]   rcuc/0-19        0d..2. 10612081721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.218373] rcu_tort-19668     2d..2. 10612081722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.220941] ksoftirq-40        3d..2. 10612081723us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.223583]   rcuc/2-31        2D..4. 10612081726us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.225255] rcu_tort-19649     3d..2. 10612081728us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.227931]   rcuc/2-31        2d..2. 10612081730us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.230513] rcu_pree-16        3d..2. 10612081736us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.233127] rcu_tort-75        0dNh3. 10612082717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.234458] rcu_tort-19649     3dNh3. 10612082718us : sched_wakeup: comm=rcuc/3 pid=39 prio=97 target_cpu=003
[10612.235524] rcu_tort-19668     2dNh4. 10612082718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.236591] rcu_tort-75        0d..2. 10612082719us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.238293]   rcuc/0-19        0d..2. 10612082721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.239982] rcu_tort-19649     3d..2. 10612082721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/3 next_pid=39 next_prio=97
[10612.241713] rcu_tort-19668     2d..2. 10612082722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.243475]   rcuc/2-31        2d..2. 10612082723us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.245195]   rcuc/3-39        3d..2. 10612082723us : sched_switch: prev_comm=rcuc/3 prev_pid=39 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.246911] rcu_tort-75        0dNh3. 10612083718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.247975] rcu_tort-19668     2dNh4. 10612083719us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.249040] rcu_tort-75        0d..2. 10612083720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.250767] rcu_tort-19649     3dN.3. 10612083720us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.251877] rcu_tort-19649     3d..2. 10612083721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.253646]   rcuc/0-19        0d..2. 10612083722us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.255345] rcu_tort-19668     2d..2. 10612083722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.257071] ksoftirq-40        3d..2. 10612083723us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.258842]   rcuc/2-31        2D..4. 10612083727us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.259951] rcu_tort-19649     3d..2. 10612083728us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.261728]   rcuc/2-31        2d..2. 10612083730us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.263453] rcu_pree-16        3d..2. 10612083737us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.265217] rcu_tort-75        0dNh3. 10612084717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.266337] rcu_tort-19649     3dNh3. 10612084718us : sched_wakeup: comm=rcuc/3 pid=39 prio=97 target_cpu=003
[10612.267401] rcu_tort-19668     2dNh3. 10612084718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.268501] rcu_tort-75        0d..2. 10612084719us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.270270]   rcuc/0-19        0d..2. 10612084721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.271987] rcu_tort-19649     3d..2. 10612084721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/3 next_pid=39 next_prio=97
[10612.273718] rcu_tort-19668     2d..2. 10612084721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.275454]   rcuc/2-31        2d..2. 10612084723us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.277179]   rcuc/3-39        3d..2. 10612084723us : sched_switch: prev_comm=rcuc/3 prev_pid=39 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.278891] rcu_tort-19668     2dNh4. 10612085717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.279954] rcu_tort-75        0dNh3. 10612085717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.281033] rcu_tort-19649     3dN.3. 10612085719us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.282151] rcu_tort-75        0d..2. 10612085720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.283857] rcu_tort-19668     2d..2. 10612085720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.285586] rcu_tort-19649     3d..2. 10612085720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.287360]   rcuc/0-19        0d..2. 10612085721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.289043] ksoftirq-40        3d..2. 10612085722us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.290807]   rcuc/2-31        2D..4. 10612085725us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.291915] rcu_tort-19649     3d..2. 10612085727us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.293689]   rcuc/2-31        2d..2. 10612085729us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.295404] rcu_pree-16        3d..2. 10612085736us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.297167] rcu_tort-75        0dNh3. 10612086717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.298233] rcu_tort-19649     3dNh4. 10612086719us : sched_wakeup: comm=rcuc/3 pid=39 prio=97 target_cpu=003
[10612.299295] rcu_tort-19668     2dNh3. 10612086719us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.300358] rcu_tort-75        0d..2. 10612086720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.302049]   rcuc/0-19        0d..2. 10612086721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.303824] rcu_tort-19668     2d..2. 10612086722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.305554] rcu_tort-19649     3d..2. 10612086722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/3 next_pid=39 next_prio=97
[10612.307284]   rcuc/2-31        2d..2. 10612086724us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.309010]   rcuc/3-39        3d..2. 10612086724us : sched_switch: prev_comm=rcuc/3 prev_pid=39 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.310729] rcu_tort-75        0dNh3. 10612087717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.311793] rcu_tort-19668     2dNh3. 10612087718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.312858] rcu_tort-75        0d..2. 10612087719us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.314566] rcu_tort-19649     3dN.4. 10612087720us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.315677]   rcuc/0-19        0d..2. 10612087721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.317374] rcu_tort-19649     3d..2. 10612087721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.319151] rcu_tort-19668     2d..2. 10612087721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.320876] ksoftirq-40        3d..2. 10612087723us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.322645]   rcuc/2-31        2D..4. 10612087727us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.323758] rcu_tort-19649     3d..2. 10612087728us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.325538]   rcuc/2-31        2d..2. 10612087730us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.327267] rcu_pree-16        3d..2. 10612087738us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.329031] rcu_tort-19668     2dNh3. 10612088717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.330097] rcu_tort-19649     3dNh3. 10612088717us : sched_wakeup: comm=rcuc/3 pid=39 prio=97 target_cpu=003
[10612.331179] rcu_tort-75        0dNh4. 10612088718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.332276] rcu_tort-19649     3d..2. 10612088720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/3 next_pid=39 next_prio=97
[10612.333998] rcu_tort-19668     2d..2. 10612088720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.335729] rcu_tort-75        0d..2. 10612088721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.337435]   rcuc/3-39        3d..2. 10612088722us : sched_switch: prev_comm=rcuc/3 prev_pid=39 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.339157]   rcuc/0-19        0d..2. 10612088722us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.340845]   rcuc/2-31        2d..2. 10612088722us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.342566] rcu_tort-75        0dNh3. 10612089717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.343647] rcu_tort-19668     2dNh3. 10612089718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.344714] rcu_tort-75        0d..2. 10612089719us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.346420] rcu_tort-19649     3dN.3. 10612089720us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.347531] rcu_tort-19649     3d..2. 10612089721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.349321] rcu_tort-19668     2d..2. 10612089721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.351049]   rcuc/0-19        0d..2. 10612089721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.352749] ksoftirq-40        3d..2. 10612089723us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.354535]   rcuc/2-31        2d..2. 10612089723us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.356297] rcu_tort-19668     2dNh3. 10612090717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.357395] rcu_tort-19668     2d..2. 10612090720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.359154]   rcuc/2-31        2D..4. 10612090726us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.360308] rcu_tort-19649     3d..2. 10612090727us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.362146]   rcuc/2-31        2d..2. 10612090729us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.363857] rcu_pree-16        3d..2. 10612090734us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.365626] rcu_tort-19649     3dNh3. 10612091717us : sched_wakeup: comm=rcuc/3 pid=39 prio=97 target_cpu=003
[10612.366689] rcu_tort-19668     2dNh3. 10612091717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.367751] rcu_tort-75        0dNh3. 10612091717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.368815] rcu_tort-75        0d..2. 10612091719us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.370568] rcu_tort-19668     2d..2. 10612091720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.372303] rcu_tort-19649     3dN.3. 10612091720us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.373415] rcu_tort-19649     3d..2. 10612091721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/3 next_pid=39 next_prio=97
[10612.375149]   rcuc/0-19        0d..2. 10612091721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.376884]   rcuc/2-31        2d..2. 10612091722us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.378649]   rcuc/3-39        3d..2. 10612091723us : sched_switch: prev_comm=rcuc/3 prev_pid=39 prev_prio=97 prev_state=S ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.380310] ksoftirq-40        3d..2. 10612091724us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.382074] rcu_tort-75        0dNh3. 10612092717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.383159] rcu_tort-19668     2dNh3. 10612092718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.384279] rcu_tort-75        0d..2. 10612092719us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.386019]   rcuc/0-19        0d..2. 10612092721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.387705] rcu_tort-19668     2d..2. 10612092721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.389434]   rcuc/2-31        2D..4. 10612092727us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.390682] rcu_tort-19649     3d..2. 10612092728us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.393333]   rcuc/2-31        2d..2. 10612092730us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.395886] rcu_pree-16        3d..2. 10612092739us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.397669] rcu_tort-19649     3dNh3. 10612093717us : sched_wakeup: comm=rcuc/3 pid=39 prio=97 target_cpu=003
[10612.398740] rcu_tort-19668     2dNh4. 10612093717us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.399811] rcu_tort-75        0dNh3. 10612093717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.400879] rcu_tort-75        0d..2. 10612093720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.402591] rcu_tort-19668     2d..2. 10612093720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.404326] rcu_tort-19649     3d..2. 10612093720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/3 next_pid=39 next_prio=97
[10612.406060]   rcuc/0-19        0d..2. 10612093721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.407842]   rcuc/2-31        2d..2. 10612093722us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.409632]   rcuc/3-39        3d..2. 10612093722us : sched_switch: prev_comm=rcuc/3 prev_pid=39 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.411366] rcu_tort-75        0dNh4. 10612094717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.412435] rcu_tort-19668     2dNh3. 10612094719us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.413511] rcu_tort-75        0d..2. 10612094720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.415225] rcu_tort-19649     3dN.3. 10612094720us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.416344] rcu_tort-19649     3d..2. 10612094721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.418138] rcu_tort-19668     2d..2. 10612094721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.420073]   rcuc/0-19        0d..2. 10612094721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.422166] ksoftirq-40        3d..2. 10612094723us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.424368]   rcuc/2-31        2D..4. 10612094727us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.425769] rcu_tort-19649     3d..2. 10612094728us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.427964]   rcuc/2-31        2d..2. 10612094730us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.430090] rcu_pree-16        3d..2. 10612094736us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.432276] rcu_tort-75        0dNh3. 10612095717us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.433595] rcu_tort-19668     2dNh3. 10612095718us : sched_wakeup: comm=rcuc/2 pid=31 prio=97 target_cpu=002
[10612.434931] rcu_tort-75        0d..2. 10612095720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.437030]   rcuc/0-19        0d..2. 10612095721us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.439140] rcu_tort-19668     2d..2. 10612095722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/2 next_pid=31 next_prio=97
[10612.441285]   rcuc/2-31        2d..2. 10612095724us : sched_switch: prev_comm=rcuc/2 prev_pid=31 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.443413] rcu_tort-19649     3dN.3. 10612096719us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.444819] rcu_tort-19649     3d..2. 10612096721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.447042] ksoftirq-40        3d..2. 10612096722us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.449261] rcu_tort-19649     3dN.4. 10612098720us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.450633] rcu_tort-19649     3d..2. 10612098721us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.452819] ksoftirq-40        3d.s3. 10612098726us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=002
[10612.454194] rcu_tort-19668     2d..2. 10612098727us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.456380] ksoftirq-40        3d..2. 10612098729us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.458558] rcu_pree-16        2d..2. 10612098729us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.460734] rcu_tort-19668     2d..2. 10612099603us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=R+ ==> next_comm=rcu_torture_sta next_pid=72 next_prio=120
[10612.462979] rcu_tort-72        2dN.4. 10612103759us : sched_wakeup: comm=ksoftirqd/2 pid=32 prio=97 target_cpu=002
[10612.464378] rcu_tort-19649     3dN.3. 10612105721us : sched_wakeup: comm=ksoftirqd/3 pid=40 prio=97 target_cpu=003
[10612.465747] rcu_tort-19649     3d..2. 10612105722us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/3 next_pid=40 next_prio=97
[10612.467937] ksoftirq-40        3d..2. 10612105741us : sched_switch: prev_comm=ksoftirqd/3 prev_pid=40 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.470127] rcu_tort-72        2d..2. 10612105938us : sched_switch: prev_comm=rcu_torture_sta prev_pid=72 prev_prio=120 prev_state=R+ ==> next_comm=kworker/2:2 next_pid=18235 next_prio=120
[10612.472342] kworker/-18235     2dN.4. 10612105947us : sched_wakeup: comm=rcu_torture_bar pid=84 prio=139 target_cpu=002
[10612.473775] kworker/-18235     2d..2. 10612105948us : sched_switch: prev_comm=kworker/2:2 prev_pid=18235 prev_prio=120 prev_state=R+ ==> next_comm=rcu_torture_bar next_pid=84 next_prio=139
[10612.475980] rcu_tort-84        2d..2. 10612105952us : sched_switch: prev_comm=rcu_torture_bar prev_pid=84 prev_prio=139 prev_state=D ==> next_comm=kworker/2:2 next_pid=18235 next_prio=120
[10612.478184] kworker/-18235     2d..2. 10612105954us : sched_switch: prev_comm=kworker/2:2 prev_pid=18235 prev_prio=120 prev_state=I ==> next_comm=rcu_torture_sta next_pid=72 next_prio=120
[10612.480413] rcu_tort-75        0dN.3. 10612106719us : sched_wakeup: comm=ksoftirqd/0 pid=15 prio=97 target_cpu=000
[10612.481777] rcu_tort-75        0d..2. 10612106720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=ksoftirqd/0 next_pid=15 next_prio=97
[10612.483927] ksoftirq-15        0d..2. 10612106723us : sched_switch: prev_comm=ksoftirqd/0 prev_pid=15 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.486069] rcu_tort-72        2d..3. 10612107654us : dl_server_stop <-dequeue_entities
[10612.487139] rcu_tort-72        2d..2. 10612107658us : sched_switch: prev_comm=rcu_torture_sta prev_pid=72 prev_prio=120 prev_state=S ==> next_comm=ksoftirqd/2 next_pid=32 next_prio=97
[10612.489380] ksoftirq-32        2d.s3. 10612107664us : sched_wakeup: comm=rcu_preempt pid=16 prio=97 target_cpu=003
[10612.490768] rcu_tort-19649     3d..2. 10612107665us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_preempt next_pid=16 next_prio=97
[10612.492950] rcu_pree-16        3d..2. 10612107668us : sched_switch: prev_comm=rcu_preempt prev_pid=16 prev_prio=97 prev_state=I ==> next_comm=rcu_torture_boo next_pid=19649 next_prio=98
[10612.495130] ksoftirq-32        2d.s2. 10612107670us : dl_server_start <-enqueue_task_fair
[10612.496232] ksoftirq-32        2d..2. 10612107673us : sched_switch: prev_comm=ksoftirqd/2 prev_pid=32 prev_prio=97 prev_state=S ==> next_comm=torture_onoff next_pid=80 next_prio=120
[10612.498372] torture_-80        2d..2. 10612107683us : sched_switch: prev_comm=torture_onoff prev_pid=80 prev_prio=120 prev_state=D ==> next_comm=kcompactd0 next_pid=50 next_prio=120
[10612.500512] kcompact-50        2d..3. 10612107689us : dl_server_stop <-dequeue_entities
[10612.501572] kcompact-50        2d..2. 10612107691us : sched_switch: prev_comm=kcompactd0 prev_pid=50 prev_prio=120 prev_state=S ==> next_comm=rcu_torture_boo next_pid=19668 next_prio=98
[10612.503743] rcu_tort-75        0dNh3. 10612107718us : sched_wakeup: comm=rcuc/0 pid=19 prio=97 target_cpu=000
[10612.505065] rcu_tort-75        0d..2. 10612107720us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=R+ ==> next_comm=rcuc/0 next_pid=19 next_prio=97
[10612.507176]   rcuc/0-19        0d..2. 10612107722us : sched_switch: prev_comm=rcuc/0 prev_pid=19 prev_prio=97 prev_state=S ==> next_comm=rcu_torture_boo next_pid=75 next_prio=98
[10612.509258] rcu_tort-19649     3d..2. 10612107729us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19649 prev_prio=98 prev_state=R+ ==> next_comm=rcu_torture_bar next_pid=82 next_prio=139
[10612.511542] rcu_tort-82        3d..4. 10612107734us : sched_wakeup: comm=rcu_torture_bar pid=86 prio=120 target_cpu=003
[10612.512958] rcu_tort-82        3d..2. 10612107737us : sched_switch: prev_comm=rcu_torture_bar prev_pid=82 prev_prio=139 prev_state=D ==> next_comm=rcu_torture_fak next_pid=66 next_prio=139
[10612.515147] rcu_tort-66        3d..2. 10612107742us : sched_switch: prev_comm=rcu_torture_fak prev_pid=66 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_fak next_pid=64 next_prio=139
[10612.517333] rcu_tort-64        3d..2. 10612107746us : sched_switch: prev_comm=rcu_torture_fak prev_pid=64 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_fak next_pid=65 next_prio=139
[10612.519515] rcu_tort-65        3d..2. 10612107749us : sched_switch: prev_comm=rcu_torture_fak prev_pid=65 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_bar next_pid=86 next_prio=120
[10612.521710] rcu_tort-86        3d..2. 10612107758us : sched_switch: prev_comm=rcu_torture_bar prev_pid=86 prev_prio=120 prev_state=D ==> next_comm=torture_stutter next_pid=74 next_prio=120
[10612.523898] torture_-74        3d..2. 10612107769us : sched_switch: prev_comm=torture_stutter prev_pid=74 prev_prio=120 prev_state=I ==> next_comm=kworker/3:1 next_pid=19499 next_prio=120
[10612.526079] rcu_tort-19668     2d..3. 10612107772us : dl_server_start <-enqueue_task_fair
[10612.527161] rcu_tort-75        0d..2. 10612107773us : sched_switch: prev_comm=rcu_torture_boo prev_pid=75 prev_prio=98 prev_state=I ==> next_comm=kworker/0:0 next_pid=9796 next_prio=120
[10612.529317] rcu_tort-19668     2d..2. 10612107775us : sched_switch: prev_comm=rcu_torture_boo prev_pid=19668 prev_prio=98 prev_state=I ==> next_comm=rcu_torture_rea next_pid=69 next_prio=139
[10612.531532] kworker/-19499     3d..3. 10612107775us : sched_wakeup: comm=rcu_torture_wri pid=63 prio=120 target_cpu=003
[10612.532942] kworker/-19499     3d..2. 10612107777us : sched_switch: prev_comm=kworker/3:1 prev_pid=19499 prev_prio=120 prev_state=I ==> next_comm=rcu_torture_wri next_pid=63 next_prio=120
[10612.535122] rcu_tort-63        3d..4. 10612107784us : sched_wakeup: comm=rcu_exp_gp_kthr pid=20 prio=97 target_cpu=002
[10612.536521] rcu_tort-69        2dn.3. 10612107785us : dl_server_stop <-dequeue_entities
[10612.537576] rcu_tort-63        3d..2. 10612107786us : sched_switch: prev_comm=rcu_torture_wri prev_pid=63 prev_prio=120 prev_state=D ==> next_comm=rcu_torture_fak next_pid=67 next_prio=139
[10612.539764] kworker/-9796      0dN.3. 10612107787us : dl_server_stop <-dequeue_entities
[10612.540819] rcu_tort-69        2d..2. 10612107787us : sched_switch: prev_comm=rcu_torture_rea prev_pid=69 prev_prio=139 prev_state=I ==> next_comm=rcu_exp_gp_kthr next_pid=20 next_prio=97
[10612.543020] rcu_tort-67        3d..2. 10612107790us : sched_switch: prev_comm=rcu_torture_fak prev_pid=67 prev_prio=139 prev_state=I ==> next_comm=rcu_torture_rea next_pid=71 next_prio=139
[10612.545238] rcu_tort-71        3d..3. 10612107796us : dl_server_stop <-dequeue_entities
[10612.546299] kworker/-9796      0dN.3. 10612107797us : dl_server_start <-enqueue_task_fair
[10612.547376] ---------------------------------
[10612.547961] Dumping ftrace buffer:
[10612.548418]    (ftrace buffer empty)
[10616.834128] Boost inversion persisted: No QS from CPU 0

