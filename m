Return-Path: <linux-next+bounces-3461-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAB6961897
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 22:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CA22B21B70
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 20:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBE415B115;
	Tue, 27 Aug 2024 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLV/yiG4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83912E62B;
	Tue, 27 Aug 2024 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724791017; cv=none; b=ogh+dEZ25G1O4b2JX4HiQr4GBoD2JOwFyzWIZ7mn1jD0CGUIJgyPkNZECWoJ4OTRBwKTyJa3/M3DIC/0DxIOQjjsTXbn4skjBR+/bRiC2EZG/RD3fkrRW+ofqN6Rf6WS+kXA3Pjv7G366lwfnCcQ1ogl4WohmcLv/edz8H2z/dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724791017; c=relaxed/simple;
	bh=J/5rAk+a/kTaug/K6jArIqf4f5xYJLdeFpVdgVVZ5HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdRnI47n6cW11+/0T/ClQQU3wSkoRYhS32rQeJt7X+NXdjDLWTcRW8g2WMp0GBq40N4HwspZMSeqOpZ1sE3eyip4CDP9i/4f1ETWZdV9M5QLGntuEG69nHjO1DtioOyrH4Sfamuwt7ECksiGyQ+sMgiJq9HOvc6fJwlnyj93Swo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLV/yiG4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBE5C4AF0E;
	Tue, 27 Aug 2024 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724791017;
	bh=J/5rAk+a/kTaug/K6jArIqf4f5xYJLdeFpVdgVVZ5HU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=HLV/yiG4JygcnS6CvW/fxdysmArDpJnSrZYRbRFCN0YpcZOA6/ogWdhr0F56z2mAy
	 3QsFeU1DTnjRsd6FFwjmzBY+CVJDgPTo44XPq5O+7yzYdv0z8MIoYsIGjXEbO++TC9
	 Zz/nhhjCkVxMVZbK5uD+Ag0hP0JYaVhTN81/mGcMvuVzIr7RSCXGwMRx2vfLu6eorD
	 lVb8HpY7/sCwKzgJJkc5b/AKGNiMNFzcPua6JbR4YAcgcSsnhNcl9zCb6Y/MnSMo+W
	 RvXosehpwpArylZk1bTjhUsUrScbvDc4bDj1F3rRNyxz5mcLWYzkDr5l/AIvnDISfM
	 3xDBqgQvzAwBQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0BC15CE11D3; Tue, 27 Aug 2024 13:36:57 -0700 (PDT)
Date: Tue, 27 Aug 2024 13:36:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Tue, Aug 27, 2024 at 10:30:24PM +0200, Valentin Schneider wrote:
> On 27/08/24 11:35, Paul E. McKenney wrote:
> > On Tue, Aug 27, 2024 at 10:33:13AM -0700, Paul E. McKenney wrote:
> >> On Tue, Aug 27, 2024 at 05:41:52PM +0200, Valentin Schneider wrote:
> >> > I've taken tip/sched/core and shuffled hunks around; I didn't re-order any
> >> > commit. I've also taken out the dequeue from switched_from_fair() and put
> >> > it at the very top of the branch which should hopefully help bisection.
> >> >
> >> > The final delta between that branch and tip/sched/core is empty, so it
> >> > really is just shuffling inbetween commits.
> >> >
> >> > Please find the branch at:
> >> >
> >> > https://gitlab.com/vschneid/linux.git -b mainline/sched/eevdf-complete-builderr
> >> >
> >> > I'll go stare at the BUG itself now.
> >>
> >> Thank you!
> >>
> >> I have fired up tests on the "BROKEN?" commit.  If that fails, I will
> >> try its predecessor, and if that fails, I wlll bisect from e28b5f8bda01
> >> ("sched/fair: Assert {set_next,put_prev}_entity() are properly balanced"),
> >> which has stood up to heavy hammering in earlier testing.
> >
> > And of 50 runs of TREE03 on the "BROKEN?" commit resulted in 32 failures.
> > Of these, 29 were the dequeue_rt_stack() failure.  Two more were RCU
> > CPU stall warnings, and the last one was an oddball "kernel BUG at
> > kernel/sched/rt.c:1714" followed by an equally oddball "Oops: invalid
> > opcode: 0000 [#1] PREEMPT SMP PTI".
> >
> > Just to be specific, this is commit:
> >
> > df8fe34bfa36 ("BROKEN? sched/fair: Dequeue sched_delayed tasks when switching from fair")
> >
> > This commit's predecessor is this commit:
> >
> > 2f888533d073 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
> >
> > This predecessor commit passes 50 runs of TREE03 with no failures.
> >
> > So that addition of that dequeue_task() call to the switched_from_fair()
> > function is looking quite suspicious to me.  ;-)
> >
> >                                                       Thanx, Paul
> 
> Thanks for the testing!
> 
> The WARN_ON_ONCE(!rt_se->on_list); hit in __dequeue_rt_entity() feels like
> a put_prev/set_next kind of issue...
> 
> So far I'd assumed a ->sched_delayed task can't be current during
> switched_from_fair(), I got confused because it's Mond^CCC Tuesday, but I
> think that still holds: we can't get a balance_dl() or balance_rt() to drop
> the RQ lock because prev would be fair, and we can't get a
> newidle_balance() with a ->sched_delayed task because we'd have
> sched_fair_runnable() := true.
> 
> I'll pick this back up tomorrow, this is a task that requires either
> caffeine or booze and it's too late for either.

Thank you for chasing this, and get some sleep!  This one is of course
annoying, but it is not (yet) an emergency.  I look forward to seeing
what you come up with.

Also, I would of course be happy to apply debug patches.

							Thanx, Paul

