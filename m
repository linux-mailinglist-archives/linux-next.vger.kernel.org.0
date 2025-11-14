Return-Path: <linux-next+bounces-9011-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1E5C5EB91
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 19:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 18D6735F46A
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C319342146;
	Fri, 14 Nov 2025 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IznK17p3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xP5/I/5M"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F076D34164B;
	Fri, 14 Nov 2025 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142124; cv=none; b=EbAH9ZhfRs2Z4CHYfliRiOhL/dEEw0iHjBUoYEJFBVIzSVQ43Dia4Ix54YtpeSun3dBbjSsKkOOdrRoieBHPLKgHpFczAS0zGQY97RBw9XwhXEEbng/RKiLcXiFa39vqIIC0txF23fUSN2KMK23zyVzgjqgcs/P5ud5a+p7tNx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142124; c=relaxed/simple;
	bh=/52mvmXkof8ov+49qcc0b2L5B46MT3ujjKYW8vcTvnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7P1ZEK4+/6r7UGsGMiRjP/sd+a+okIc+O5EDU84NTG/w0P2fbZRVn1CeZM31Mq5aWe3gWcADNEjCegvRezcgQJfZCi9zZaDDP8gEdzH7cEK/DbG/xsT6//SAlmbEeBSIgi8f3QwzplyDY6iNTKINJerbc6tbxr08APvP+5BtiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IznK17p3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xP5/I/5M; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Nov 2025 18:41:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763142120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1WEyEfnOwApleW1T7D1ocKlWauJ3co+1Lh+rqackpM=;
	b=IznK17p37Q2mk8zFQkfoh5xr+in6TAp38xL7qUYFX04FtByak+MTYb308uXNbr1+tXqGhv
	O02kVrF/xYaywZmkRgTBfxnGZYj9D974bamaTUZeYkRBrJ22tulpKjmipRNwCRQN9KJDc/
	G4NWU06iC+5y48rysksagqq64cltuSkWJYXCCUOrcVQ6hHuVvMcWGMb1H1YHnXKK8IjiaL
	VW3akUyaXzRWzCxB3VNx9hIiypBy3akkeB5EQaezoRHUBOZZGVxudBCNY0+7323f30bZdi
	YRI1NQQiIBmr3VjUE2IwsCmJ+Lvouoav+vmQB9t2/LIzoyCxDEL/sKq09GFAxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763142120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1WEyEfnOwApleW1T7D1ocKlWauJ3co+1Lh+rqackpM=;
	b=xP5/I/5MGlOZKBjrxTH5keTPsghFfi24urXmeKaTpyLaYzPwgBjhw8QB/maQK5yedjNFrh
	h4CAgXlY48tX1ZAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Message-ID: <20251114174159.V60vTd1q@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <20251114133532.mmdi2dca@linutronix.de>
 <20251114104633.0721bdbe@gandalf.local.home>
 <20251114160017.CrDJHi5w@linutronix.de>
 <20251114112202.08e1e3c1@gandalf.local.home>
 <20251114163330.pi9Nm3Vb@linutronix.de>
 <348528a9-7e1a-4aa7-8219-5cad81969137@paulmck-laptop>
 <20251114171052.gJRc-2A3@linutronix.de>
 <747d4324-55f9-495d-b1ec-ca23cc472f3f@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <747d4324-55f9-495d-b1ec-ca23cc472f3f@paulmck-laptop>

On 2025-11-14 09:25:06 [-0800], Paul E. McKenney wrote:
> On Fri, Nov 14, 2025 at 06:10:52PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2025-11-14 09:00:21 [-0800], Paul E. McKenney wrote:
> > > > > Where in PREEMPT_RT we do not disable preemption around the tracepoint
> > > > > callback, but in non RT we do. Instead it uses a srcu and migrate disable.
> > > > 
> > > > I appreciate the effort. I really do. But why can't we have SRCU on both
> > > > configs?
> > > 
> > > Due to performance concerns for non-RT kernels and workloads, where we
> > > really need preemption disabled.
> > 
> > This means srcu_read_lock_notrace() is much more overhead compared to
> > rcu_read_lock_sched_notrace()?
> > I am a bit afraid of different bugs here and there.
> 
> No, the concern is instead overhead due to any actual preemption.  So the
> goal is to actually disable preemption across the BPF program *except*
> in PREEMPT_RT kernels.

Overhead of actual preemption while the BPF callback of the trace-event
is invoked?
So we get rid of the preempt_disable() in the trace-point which we had
due rcu_read_lock_sched_notrace() and we need to preserve it because
preemption while the BPF program is invoked?
This is also something we want for CONFIG_PREEMPT (LAZY)?

Sorry to be verbose but I try to catch up.
The BPF invocation does not disable preemption for a long time. It
disables migration since some code uses per-CPU variables here.

For XDP kind of BPF invocations, preemption is disabled (except for RT)
because those run in NAPI/ softirq context.

> > > > Also why does tracepoint_guard() need to disable migration? The BPF
> > > > program already disables migrations (see for instance
> > > > bpf_prog_run_array()).
> > > > This is true for RT and !RT. So there is no need to do it here.
> > > 
> > > The addition of migration disabling was in response to failures, which
> > > this fixed.  Or at least greatly reduced the probability of!  Let's see...
> > > That migrate_disable() has been there since 2022, so the failures were
> > > happening despite it.  Adding Yonghong on CC for his perspective.
> > 
> > Okay. In general I would prefer that we know why we do it. BPF had
> > preempt_disable() which was turned into migrate_disable() for RT reasons
> > since remaining on the same CPU was enough and preempt_disable() was the
> > only way to enforce it at the time.
> > And I think Linus requested migrate_disable() to work regardless of RT
> > which PeterZ made happen (for different reasons, not BPF related).
> 
> Yes, migrate_disable() prevents migration either way, but it does not
> prevent preemption, which is what was needed in non-PREEMPT_RT kernels
> last I checked.

BPF in general sometimes relies on per-CPU variables. Sometimes it is
needed to avoid reentrancy which is what preempt_disable() provides for
the same context. This is usually handled where it is required and when
is removed, it is added back shortly. See for instance
	https://lore.kernel.org/all/20251114064922.11650-1-chandna.sahil@gmail.com/

:)

> 
> 							Thanx, Paul

Sebastian

