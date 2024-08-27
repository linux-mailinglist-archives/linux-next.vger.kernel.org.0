Return-Path: <linux-next+bounces-3458-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AAD96170D
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 20:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEFB7288A11
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 18:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786F71D27BA;
	Tue, 27 Aug 2024 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mx6M21Yj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2C81D27A0;
	Tue, 27 Aug 2024 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724783703; cv=none; b=OAl297zN2LM+WlCXefk0OC0mxN17cV3O4u+c1xWpRPk/8P4sbpJHDHyTwSDBTWwrmiNprqObHhR/x2CzPZhDl7O4OkFLc8f80ScNxAzvmyEFqqnjYe2gOsvcp3CgK5sKzFILna6XYoiqVq9EvpdT5O4qCS3SRqDcDyVbA30r0c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724783703; c=relaxed/simple;
	bh=oqOoXTP0tcOmUep8+yn3jtmgtNRgcMWg3L2ZRlWrbjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVuYnonJOmBp7eKYrdThWRNMAC5BqJ8TSTiZsr/nqQhdSRcGdfbWhvFb/PETnGDrSzvLdOQNMTu8lw1/U3pEytPFu2dHz+4PcH0MnIuTnwsKMO5t2/xrz3XY/9es3tr8Siko6OIvU+pkoAATNjdLmCw7gySp62DZErfF630yG+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mx6M21Yj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A64C4AF18;
	Tue, 27 Aug 2024 18:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724783702;
	bh=oqOoXTP0tcOmUep8+yn3jtmgtNRgcMWg3L2ZRlWrbjA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Mx6M21YjXlN4fDqPQID31PzY5RcZD+mLAE4hLCOZzgHw4IE6MXtjJ6nLnaM/qao4E
	 8MXX14SxoGyfpqxnKx5iXTFlvl4OhehCWtsdHq9qf/macs8NlbsGlkeXvyUKl6XGXM
	 v0ctBXzqeZqz5ZnIL/XzfOLpE/3p7cylIdW5SFCtY3g/BWypVVP/F/ahmnRldOwjHk
	 DBdu8cgVeu1SCccvEbZH0iDwtm4vDvE+AsYMPImXiIRYYcWSJ2IlFFjkqhbZgydV+v
	 9WeCEwCx+O2aRfbWgh+cNLsf58lqGkFeAeOFHjcgkivP7SmaUQJWbV3vepPcqWmSCN
	 NH/hcMof2VM+g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5FAA1CE11D3; Tue, 27 Aug 2024 11:35:02 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:35:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>

On Tue, Aug 27, 2024 at 10:33:13AM -0700, Paul E. McKenney wrote:
> On Tue, Aug 27, 2024 at 05:41:52PM +0200, Valentin Schneider wrote:
> > On 27/08/24 12:03, Valentin Schneider wrote:
> > > On 26/08/24 09:31, Paul E. McKenney wrote:
> > >> On Mon, Aug 26, 2024 at 01:44:35PM +0200, Valentin Schneider wrote:
> > >>>
> > >>> Woops...
> > >>
> > >> On the other hand, removing that dequeue_task() makes next-20240823
> > >> pass light testing.
> > >>
> > >> I have to ask...
> > >>
> > >> Does it make sense for Valentin to rearrange those commits to fix
> > >> the two build bugs and remove that dequeue_task(), all in the name of
> > >> bisectability.  Or is there something subtle here so that only Peter
> > >> can do this work, shoulder and all?
> > >>
> > >
> > > I suppose at the very least another pair of eyes on this can't hurt, let me
> > > get untangled from some other things first and I'll take a jab at it.
> > 
> > I've taken tip/sched/core and shuffled hunks around; I didn't re-order any
> > commit. I've also taken out the dequeue from switched_from_fair() and put
> > it at the very top of the branch which should hopefully help bisection.
> > 
> > The final delta between that branch and tip/sched/core is empty, so it
> > really is just shuffling inbetween commits.
> > 
> > Please find the branch at:
> > 
> > https://gitlab.com/vschneid/linux.git -b mainline/sched/eevdf-complete-builderr
> > 
> > I'll go stare at the BUG itself now.
> 
> Thank you!
> 
> I have fired up tests on the "BROKEN?" commit.  If that fails, I will
> try its predecessor, and if that fails, I wlll bisect from e28b5f8bda01
> ("sched/fair: Assert {set_next,put_prev}_entity() are properly balanced"),
> which has stood up to heavy hammering in earlier testing.

And of 50 runs of TREE03 on the "BROKEN?" commit resulted in 32 failures.
Of these, 29 were the dequeue_rt_stack() failure.  Two more were RCU
CPU stall warnings, and the last one was an oddball "kernel BUG at
kernel/sched/rt.c:1714" followed by an equally oddball "Oops: invalid
opcode: 0000 [#1] PREEMPT SMP PTI".

Just to be specific, this is commit:

df8fe34bfa36 ("BROKEN? sched/fair: Dequeue sched_delayed tasks when switching from fair")

This commit's predecessor is this commit:

2f888533d073 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")

This predecessor commit passes 50 runs of TREE03 with no failures.

So that addition of that dequeue_task() call to the switched_from_fair()
function is looking quite suspicious to me.  ;-)

							Thanx, Paul

