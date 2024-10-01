Return-Path: <linux-next+bounces-4049-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1B98C3D2
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 18:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9919A1F222A6
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 16:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A9D1BDA84;
	Tue,  1 Oct 2024 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihQPFQiE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7D41B5827;
	Tue,  1 Oct 2024 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727801248; cv=none; b=o7sIwLnCXjbcuz5o3FfYUnPoarZUE3NdmZClOhdN93aa+MhsrJGpw9eCZuPPE9Kfphu6ePKe2m6W+OftXqaTbeslyNOrA8wl6wfqZfZyktunDfvO1OLaMrWfx/D1y1pxd9EEXSIm/t9gq/gLnMpyo6ipSaonyqaWgIHCpc/xFdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727801248; c=relaxed/simple;
	bh=CsJo7Nd4gUZoCYGiwBALrpNzaXOzLsq7OFjbo5oM/1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+jbuDMny2BDKY+6vO8ZXGr4o0rSQNUtqfeIT/nDkbxoGKefPN0i/gGs+U8VL1PfuEbTWnn5jpWFTG0fnFsT6nzRg5JeV/PzBfy96ts6Ly9FK4RO6PAyuCyHybqGfPE4u9Sb0iNvtJz3DOKeSs0ug5Aw9OQJWKl6y38ybV9kKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihQPFQiE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976D7C4CEC6;
	Tue,  1 Oct 2024 16:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727801247;
	bh=CsJo7Nd4gUZoCYGiwBALrpNzaXOzLsq7OFjbo5oM/1s=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ihQPFQiE8n/UIdW4YhFjMbOvl473y8Yb0B1JVoz9oEXWEjsZ4ogHYTVqWCrDFjR+N
	 8ctiGlVrcWT61D9feCZUZZGfgIiedgnUkmS4o6TPfUDzDHjeXx/fXzOEMatiUaXDF3
	 Yv8DmhSnyqgc54IuPrfxmORbapO59cMDq+mnODGvbUFJpcX9o8R71qXRXUwHLAqWT3
	 0kZSSi3ODIzfQagXxBSzEtz2NvMcGan7/T2vQ1UMV+2z0ESJ+ViH7bbjtzvcpI+w6W
	 dWildQdDyDGZ1lgyh5BR4wCDeINDUjSlTMcKl8+cwPrYxDRXdxBamcWxUUTLn6HNtK
	 A1JWub2MovMSw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3D866CE0DB6; Tue,  1 Oct 2024 09:47:27 -0700 (PDT)
Date: Tue, 1 Oct 2024 09:47:27 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com,
	Tomas Glozar <tglozar@redhat.com>
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <cc537207-68a3-4dda-a8ec-6dda2fc1985d@paulmck-laptop>
 <250cde11-650f-4689-9c36-816406f1b9b8@paulmck-laptop>
 <182ef9c6-63a4-4608-98de-22ef4d35be07@paulmck-laptop>
 <xhsmh34m38pdl.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop>
 <43d513c5-7620-481b-ab7e-30e76babbc80@paulmck-laptop>
 <xhsmhed50vplj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
 <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Tue, Oct 01, 2024 at 02:52:37PM +0200, Valentin Schneider wrote:
> On 01/10/24 03:10, Paul E. McKenney wrote:
> > On Mon, Sep 30, 2024 at 10:44:24PM +0200, Valentin Schneider wrote:
> >> On 30/09/24 12:09, Paul E. McKenney wrote:
> >> >
> >> > And Peter asked that I send along a reproducer, which I am finally getting
> >> > around to doing:
> >> >
> >> >       tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 12h --configs "100*TREE03" --trust-make
> >> >
> >>
> >> FYI Tomas (on Cc) has been working on getting pretty much this to run on
> >> our infra, no hit so far.
> >>
> >> How much of a pain would it be to record an ftrace trace while this runs?
> >> I'm thinking sched_switch, sched_wakeup and function-tracing
> >> dl_server_start() and dl_server_stop() would be a start.
> >>
> >> AIUI this is running under QEMU so we'd need to record the trace within
> >> that, I'm guessing we can (ab)use --bootargs to feed it tracing arguments,
> >> but how do we get the trace out?

To answer this question directly, I am trying this:

--bootargs "trace_event=sched:sched_switch,sched:sched_wakeup ftrace_filter=dl_server_start,dl_server_stop torture.ftrace_dump_at_shutdown=1"

Huh, 50MB and growing.  I need to limit the buffer size as well.
How about "trace_buf_size=2k"?  The default is 1,441,792, just
over 1m.

Except that I am not getting either dl_server_start() or dl_server_stop(),
perhaps because they are not being invoked in this short test run.
So try some function that is definitely getting invoked, such as
rcu_sched_clock_irq().

No joy there, either, so maybe add "ftrace=function"?

No: "[    1.542360] ftrace bootup tracer 'function' not registered."

The "torture.ftrace_dump_at_shutdown" is just for experiment.  The
actual runs will do something like this:

	if (on_dl_rq(dl_se)) { // Was: WARN_ON_ONCE(on_dl_rq(dl_se));
		tracing_off();
		ftrace_dump(DUMP_ALL);
		WARN_ON_ONCE(1);
	}

> > Me, I would change those warnings to dump the trace buffer to the
> > console when triggered.  Let me see if I can come up with something
> > better over breakfast.  And yes, there is the concern that adding tracing
> > will suppress this issue.
> >
> > So is there some state that I could manually dump upon triggering either
> > of these two warnings?  That approach would minimize the probability of
> > suppressing the problem.
> 
> Usually enabling panic_on_warn and getting a kdump is ideal, but here this
> is with QEMU - I know we can get a vmcore out via dump-guest-memory in the
> QEMU monitor, but I don't have an immediate solution to do that on a
> warn/panic.

Especially given that I don't have a QEMU monitor for these 100 runs.

But if there is a way to do this programatically from within the
kernel, I would be happy to give it a try.

> Also I'd say here we're mostly interested in the sequence of events leading
> us to the warn (dl_server_start() when the DL entity is somehow still
> enqueued) rather than the state of things when the warn is hit, and for
> that dumping the ftrace buffer to the console sounds good enough to me.

That I can do!!!  Give or take function tracing appearing not to work
for me from the kernel command line.  :-(

							Thanx, Paul

