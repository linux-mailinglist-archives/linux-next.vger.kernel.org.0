Return-Path: <linux-next+bounces-3477-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A07596282A
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 15:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEE211C20ADD
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 13:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8DC16D30E;
	Wed, 28 Aug 2024 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpE4rvm1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DC4156238;
	Wed, 28 Aug 2024 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724850212; cv=none; b=cwSEGbMWjmD25+74DsKjcGUh6N22o/mzbdv0t0oqFOHTuUlckRWeYOUj0pcnERkMJKreCv0EuywPe0XNCEu2djdR6QsmBMlUStMTOY8Cr7g63Ss5JYC7hS5ce28AKNmvC80onusPiZN7QUzxkx2DqsJTsB+8V0cF70AfG/pFPB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724850212; c=relaxed/simple;
	bh=1Hl7cEtRKQGQTWzXyH0WqwqBqVDowqe9MnE0xwYeMRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcfNvsYH5fUJx9tKsNFd3byy81nEOOrdTAClFbzLGO8zDVegnJ3hyhg1pqMR3Rb/HoV3YHmTBt6cM33cS96GksV+bsmPztvXdnXREsyUfAcrRqhcp1V3ZdgYMjuwTCsE9N5zMryjzO6AVOKQqUialnGN4eKj9t+NHPAesgWrCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpE4rvm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C844BC4FF05;
	Wed, 28 Aug 2024 13:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724850211;
	bh=1Hl7cEtRKQGQTWzXyH0WqwqBqVDowqe9MnE0xwYeMRI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cpE4rvm1teP01lW2PX6F5RwzxCrLyVDsM1kSWLoMbXIQ4OqCU7anLCbhQvyFh5nvH
	 Q1X6byjOO9PpOmWuzCGz++tUczILOD4rGC/d5RPdaXmYCrC9UT/Hohy4++UQ/kyjJP
	 GjhTpmYBB4CGuxvGTa6HmIMwal99uwQlXi5oQNKOe8YX+gr1Qy28Jy2wi+HLYYmCgJ
	 d8GnpptD1u6hWXL1M4QO+eevL6GO4jl6rD5lr40krYTMRGvI2/2hCpjlGUDZEftZOX
	 ypcNIEzkyk95wue81/sPwB40ltYcOD/PawWbOn1YkSMWocdzudIOsVIeFqRXr86whj
	 HH0qDSXvSQ8lQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 71AF9CE1697; Wed, 28 Aug 2024 06:03:31 -0700 (PDT)
Date: Wed, 28 Aug 2024 06:03:31 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com, Chen Yu <yu.c.chen@intel.com>
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <e12e0933-d8a5-4659-9fea-3413e3b2374d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Wed, Aug 28, 2024 at 02:35:45PM +0200, Valentin Schneider wrote:
> On 27/08/24 13:36, Paul E. McKenney wrote:
> > On Tue, Aug 27, 2024 at 10:30:24PM +0200, Valentin Schneider wrote:
> >> On 27/08/24 11:35, Paul E. McKenney wrote:
> >> > On Tue, Aug 27, 2024 at 10:33:13AM -0700, Paul E. McKenney wrote:
> >> >> On Tue, Aug 27, 2024 at 05:41:52PM +0200, Valentin Schneider wrote:
> >> >> > I've taken tip/sched/core and shuffled hunks around; I didn't re-order any
> >> >> > commit. I've also taken out the dequeue from switched_from_fair() and put
> >> >> > it at the very top of the branch which should hopefully help bisection.
> >> >> >
> >> >> > The final delta between that branch and tip/sched/core is empty, so it
> >> >> > really is just shuffling inbetween commits.
> >> >> >
> >> >> > Please find the branch at:
> >> >> >
> >> >> > https://gitlab.com/vschneid/linux.git -b mainline/sched/eevdf-complete-builderr
> >> >> >
> >> >> > I'll go stare at the BUG itself now.
> >> >>
> >> >> Thank you!
> >> >>
> >> >> I have fired up tests on the "BROKEN?" commit.  If that fails, I will
> >> >> try its predecessor, and if that fails, I wlll bisect from e28b5f8bda01
> >> >> ("sched/fair: Assert {set_next,put_prev}_entity() are properly balanced"),
> >> >> which has stood up to heavy hammering in earlier testing.
> >> >
> >> > And of 50 runs of TREE03 on the "BROKEN?" commit resulted in 32 failures.
> >> > Of these, 29 were the dequeue_rt_stack() failure.  Two more were RCU
> >> > CPU stall warnings, and the last one was an oddball "kernel BUG at
> >> > kernel/sched/rt.c:1714" followed by an equally oddball "Oops: invalid
> >> > opcode: 0000 [#1] PREEMPT SMP PTI".
> >> >
> >> > Just to be specific, this is commit:
> >> >
> >> > df8fe34bfa36 ("BROKEN? sched/fair: Dequeue sched_delayed tasks when switching from fair")
> >> >
> >> > This commit's predecessor is this commit:
> >> >
> >> > 2f888533d073 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
> >> >
> >> > This predecessor commit passes 50 runs of TREE03 with no failures.
> >> >
> >> > So that addition of that dequeue_task() call to the switched_from_fair()
> >> > function is looking quite suspicious to me.  ;-)
> >> >
> >> >                                                       Thanx, Paul
> >>
> >> Thanks for the testing!
> >>
> >> The WARN_ON_ONCE(!rt_se->on_list); hit in __dequeue_rt_entity() feels like
> >> a put_prev/set_next kind of issue...
> >>
> >> So far I'd assumed a ->sched_delayed task can't be current during
> >> switched_from_fair(), I got confused because it's Mond^CCC Tuesday, but I
> >> think that still holds: we can't get a balance_dl() or balance_rt() to drop
> >> the RQ lock because prev would be fair, and we can't get a
> >> newidle_balance() with a ->sched_delayed task because we'd have
> >> sched_fair_runnable() := true.
> >>
> >> I'll pick this back up tomorrow, this is a task that requires either
> >> caffeine or booze and it's too late for either.
> >
> > Thank you for chasing this, and get some sleep!  This one is of course
> > annoying, but it is not (yet) an emergency.  I look forward to seeing
> > what you come up with.
> >
> > Also, I would of course be happy to apply debug patches.
> >
> >                                                       Thanx, Paul
> 
> Chen Yu made me realize [1] that dequeue_task() really isn't enough; the
> dequeue_task() in e.g. __sched_setscheduler() won't have DEQUEUE_DELAYED,
> so stuff will just be left on the CFS tree.
> 
> Worse, what we need here is the __block_task() like we have at the end of
> dequeue_entities(), otherwise p stays ->on_rq and that's borked - AFAICT
> that explains the splat you're getting, because affine_move_task() ends up
> doing a move_queued_task() for what really is a dequeued task.

Sounds like something that *I* would do!  ;-)

> I unfortunately couldn't reproduce the issue locally using your TREE03
> invocation. I've pushed a new patch on top of my branch, would you mind
> giving it a spin? It's a bit sketchy but should at least be going in the
> right direction...
> 
> [1]: http://lore.kernel.org/r/Zs2d2aaC/zSyR94v@chenyu5-mobl2

Thank you!

I just now fired it up on 50*TREE03.  If that passes, I will let you
know and also fire up 500*TREE03.

							Thanx, Paul

