Return-Path: <linux-next+bounces-9007-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B7EC5E827
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E176C364257
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7BE31618B;
	Fri, 14 Nov 2025 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IRXec6Vq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0FlAKrsT"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7C32DCC01;
	Fri, 14 Nov 2025 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763140256; cv=none; b=BV2G+4rHnU8kcc9jUsvGNu0O4NqdQNN5HKJt/VG1fpqAkbq/Xaup9vi8d4qY1GshFfwU/FiT5Cxcq8bILw7WuQ1+ZOpk/s0HczNyjY1wTbVglTn8REzM2PWQx1Z1ZlZBmca2ang1NnrLpRZzBk45h8MBy/V8EH2sU51OO2UY6Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763140256; c=relaxed/simple;
	bh=m5GfGUjp/NaIEZZN9TVu9Np2aTof8KE9zBpvnW7D/fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUGnWwnEWhg6LpE74lpyfZkep+EszYhJ6/zLA/v7NLavbKmHlKb3zW07uJPGXAbUIO2JZvXz9sOFyCc/cIoY+vHksr/8tqy8PFS2O4iiQ7gqVVMzd2WL7BUTJ+jsxSm+lUbDxb1wkAh64GDWDgmBU0AksDlxePynCFK6tvVyFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IRXec6Vq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0FlAKrsT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Nov 2025 18:10:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763140253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d9IbbCj+qZNHmW3YvVyylFctsMd/4r25fLG8w0iX54E=;
	b=IRXec6Vq/mfeckCKSJrscUqX69u2+3pympjK+6s7g8QzyFp2z93qDtiBXADjjtVUWqeAi8
	2QmPftWuwwDQZ6CsVw1QkV533iGvUuAWS+ldBS837tGETi25Xi96OmFgZqLc2XdMwU1TKW
	QKM90ZEL0Y+hF2UP86BA6mDIATT88f1QEmV3wceOcxq24IzreMjUs/7+PJ9tUx28y7gBOp
	1FJTwGobUwiaA149ZVMZ8PNbo4m3W9tAyZ6L6HMDcBfMskTWxNargCFXFYU5qAXeW7PR2a
	nEVOkVKmkffJw359zgDFzqLfCqfCynYEdXjW8/FZb/Eqb4J2d21Lxs84ZVmhvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763140253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d9IbbCj+qZNHmW3YvVyylFctsMd/4r25fLG8w0iX54E=;
	b=0FlAKrsTf/AKA8OJ349pKyKnULT8dR0g7vpySvGamOJC1D4v8oSploV+3XvvHZdIlSYbc8
	g2+N2pxbIK82XZDQ==
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
Message-ID: <20251114171052.gJRc-2A3@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <20251114133532.mmdi2dca@linutronix.de>
 <20251114104633.0721bdbe@gandalf.local.home>
 <20251114160017.CrDJHi5w@linutronix.de>
 <20251114112202.08e1e3c1@gandalf.local.home>
 <20251114163330.pi9Nm3Vb@linutronix.de>
 <348528a9-7e1a-4aa7-8219-5cad81969137@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <348528a9-7e1a-4aa7-8219-5cad81969137@paulmck-laptop>

On 2025-11-14 09:00:21 [-0800], Paul E. McKenney wrote:
> > > Where in PREEMPT_RT we do not disable preemption around the tracepoint
> > > callback, but in non RT we do. Instead it uses a srcu and migrate disable.
> > 
> > I appreciate the effort. I really do. But why can't we have SRCU on both
> > configs?
> 
> Due to performance concerns for non-RT kernels and workloads, where we
> really need preemption disabled.

This means srcu_read_lock_notrace() is much more overhead compared to
rcu_read_lock_sched_notrace()?
I am a bit afraid of different bugs here and there.

> > Also why does tracepoint_guard() need to disable migration? The BPF
> > program already disables migrations (see for instance
> > bpf_prog_run_array()).
> > This is true for RT and !RT. So there is no need to do it here.
> 
> The addition of migration disabling was in response to failures, which
> this fixed.  Or at least greatly reduced the probability of!  Let's see...
> That migrate_disable() has been there since 2022, so the failures were
> happening despite it.  Adding Yonghong on CC for his perspective.

Okay. In general I would prefer that we know why we do it. BPF had
preempt_disable() which was turned into migrate_disable() for RT reasons
since remaining on the same CPU was enough and preempt_disable() was the
only way to enforce it at the time.
And I think Linus requested migrate_disable() to work regardless of RT
which PeterZ made happen (for different reasons, not BPF related).

> 							Thanx, Paul

Sebastian

