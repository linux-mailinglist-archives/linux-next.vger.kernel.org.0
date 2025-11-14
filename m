Return-Path: <linux-next+bounces-9012-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 26237C5EE0A
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 19:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 460DC345F3D
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383392DAFAE;
	Fri, 14 Nov 2025 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcuOB34E"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2972DA756;
	Fri, 14 Nov 2025 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763144799; cv=none; b=RdvK8/1CCLZ62X8UhGv2VIhIvO4G7f3eip3BG0sMEww+Axw+XykSUYYKoyCedae6RHOA5OfG2esLZLY/+AJQLYsEQy0AvT0gB1qJCO4uAOuPTPI0+YgyzyM5M48kVDk6809CvStiRoICfVlKjtEbGX2sQeVWIBoOXlEe+RObWVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763144799; c=relaxed/simple;
	bh=CG5IPjSVNe97//IJNzSmBieV+N1kym0GrFpfdbDDUjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfzpRFsZC1ihoCJmuopQeewiy9Od14BLndAoPE4WQqXFWApF5VNeiDdD3J04LwSPB39Ky7pkRNyNWuBMnVQWLqHSAKPc3hQz3t2KT/7CVresdo5dCfNgOPH9+wBcIcNwfdZe0VNpFN0ar0p5QFEbHtduLPaXEtg8y/GCKgkQWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcuOB34E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B221C4CEF8;
	Fri, 14 Nov 2025 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763144798;
	bh=CG5IPjSVNe97//IJNzSmBieV+N1kym0GrFpfdbDDUjM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=EcuOB34EJSY284HfV4RcF3849m3oEu1oy2YGhyn7QmeFc9to8I8nf2ausKIKnuBJ3
	 qnwVgj9P71jwHATfvrAOQApXGVUETCVv7gJYP+wUvL/skonfhQQFvx5vrXBtCTlCNQ
	 eR2h/1tHCDcFMJXmcESNpjZriog7BNhqHNsZ+S6Lz9Y0yjscOvipIhUaF2u54Tqmog
	 4vo3G1UTY4Si/To6ziBYtx/WXBOBqOI3Q2bo2YQvwQRGJEblkiO4NVFvLuXx8Mwq3Q
	 gIrvjso5ZOg5DZ5e0T4w7JGHBxAlCMS+P0oYAzqkH/UMsjL9DdRPuWhr80vD+948og
	 bAiVFrrjHwxDg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E154ECE0CA7; Fri, 14 Nov 2025 10:26:37 -0800 (PST)
Date: Fri, 14 Nov 2025 10:26:37 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	yonghong.song@linux.dev
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <3af3a952-43f9-4625-b87c-f45d14d8228e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20251114074255.3e535084@gandalf.local.home>
 <20251114133532.mmdi2dca@linutronix.de>
 <20251114104633.0721bdbe@gandalf.local.home>
 <20251114160017.CrDJHi5w@linutronix.de>
 <20251114112202.08e1e3c1@gandalf.local.home>
 <20251114163330.pi9Nm3Vb@linutronix.de>
 <348528a9-7e1a-4aa7-8219-5cad81969137@paulmck-laptop>
 <20251114171052.gJRc-2A3@linutronix.de>
 <747d4324-55f9-495d-b1ec-ca23cc472f3f@paulmck-laptop>
 <20251114174159.V60vTd1q@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114174159.V60vTd1q@linutronix.de>

On Fri, Nov 14, 2025 at 06:41:59PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-11-14 09:25:06 [-0800], Paul E. McKenney wrote:
> > On Fri, Nov 14, 2025 at 06:10:52PM +0100, Sebastian Andrzej Siewior wrote:
> > > On 2025-11-14 09:00:21 [-0800], Paul E. McKenney wrote:
> > > > > > Where in PREEMPT_RT we do not disable preemption around the tracepoint
> > > > > > callback, but in non RT we do. Instead it uses a srcu and migrate disable.
> > > > > 
> > > > > I appreciate the effort. I really do. But why can't we have SRCU on both
> > > > > configs?
> > > > 
> > > > Due to performance concerns for non-RT kernels and workloads, where we
> > > > really need preemption disabled.
> > > 
> > > This means srcu_read_lock_notrace() is much more overhead compared to
> > > rcu_read_lock_sched_notrace()?
> > > I am a bit afraid of different bugs here and there.
> > 
> > No, the concern is instead overhead due to any actual preemption.  So the
> > goal is to actually disable preemption across the BPF program *except*
> > in PREEMPT_RT kernels.
> 
> Overhead of actual preemption while the BPF callback of the trace-event
> is invoked?
> So we get rid of the preempt_disable() in the trace-point which we had
> due rcu_read_lock_sched_notrace() and we need to preserve it because
> preemption while the BPF program is invoked?
> This is also something we want for CONFIG_PREEMPT (LAZY)?
> 
> Sorry to be verbose but I try to catch up.

No need to apologize, given my tendency to be verbose.  ;-)

> The BPF invocation does not disable preemption for a long time. It
> disables migration since some code uses per-CPU variables here.
> 
> For XDP kind of BPF invocations, preemption is disabled (except for RT)
> because those run in NAPI/ softirq context.

Before Steven's pair of patches (one of which Frederic and I are handling
due to it depending on not-yet-mainline SRCU-fast commits), BPF programs
attached to tracepoints ran with preemption disabled.  This behavior is
still in mainline.  As you reported some time back, this caused problems
for PREEMPT_RT, hence Steven's pair of patches.  But although we do want
to fix PREEMPT_RT, we don't want to break other kernel configuration,
hence keeping preemption disabled in non-PREEMPT_RT kernels.

Now perhaps Yonghong will tell us that this has since been shown to not
be a problem for BPF programs attached to tracepoints in non-PREEMPT_RT
kernels.  But he has not yet done so, which strongly suggests we keep
the known-to-work preemption-disabled status of BPF programs attached
to tracepoints.

> > > > > Also why does tracepoint_guard() need to disable migration? The BPF
> > > > > program already disables migrations (see for instance
> > > > > bpf_prog_run_array()).
> > > > > This is true for RT and !RT. So there is no need to do it here.
> > > > 
> > > > The addition of migration disabling was in response to failures, which
> > > > this fixed.  Or at least greatly reduced the probability of!  Let's see...
> > > > That migrate_disable() has been there since 2022, so the failures were
> > > > happening despite it.  Adding Yonghong on CC for his perspective.
> > > 
> > > Okay. In general I would prefer that we know why we do it. BPF had
> > > preempt_disable() which was turned into migrate_disable() for RT reasons
> > > since remaining on the same CPU was enough and preempt_disable() was the
> > > only way to enforce it at the time.
> > > And I think Linus requested migrate_disable() to work regardless of RT
> > > which PeterZ made happen (for different reasons, not BPF related).
> > 
> > Yes, migrate_disable() prevents migration either way, but it does not
> > prevent preemption, which is what was needed in non-PREEMPT_RT kernels
> > last I checked.
> 
> BPF in general sometimes relies on per-CPU variables. Sometimes it is
> needed to avoid reentrancy which is what preempt_disable() provides for
> the same context. This is usually handled where it is required and when
> is removed, it is added back shortly. See for instance
> 	https://lore.kernel.org/all/20251114064922.11650-1-chandna.sahil@gmail.com/
> 
> :)

Agreed, and that was why I added the migrate_disable() calls earlier,
calls that in Steven's more recent version of this patch just now
conflicted with Steven's other patch in -next.  ;-)

							Thanx, Paul

