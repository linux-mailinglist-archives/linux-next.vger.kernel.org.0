Return-Path: <linux-next+bounces-8997-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD07C5E4C5
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23E233C7796
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 16:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBC526F28A;
	Fri, 14 Nov 2025 16:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1ziOg24Q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dkmzdMKf"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1690DDC3;
	Fri, 14 Nov 2025 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763136023; cv=none; b=WfSssUSKWvbbtier/PiCK89Z3ZXeV2pcenZUY8D1vSFqQhs87oF8Z2SaVF25soaDDEU94u0+WQ+kBOzW2wrfblDt+EI+sKyB7mCL2l/vwKSZGhvCwmGOGNpq20orZH3OKx5U7Dmvl0EGPEVuE3WEifdJF1G8H13XV7kceKwwEA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763136023; c=relaxed/simple;
	bh=HFIDP8QUvvt81g29NroEt1KoOdvuEWA4NBWpcyPeBoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glfWnwK/Ffy1bOn9lTiqPh8cFLGn9+cyyZLFh1Ih97qF6nzgFQq2AVtkLTU4MgRrLGth2NWyOZhZ/PrvhXiaS1BU8Z7GtFW41pwvteZqJeulcP64TZeFME+0aOGuf+6CSzGLeMQ7XV28smRCfhwyFjALMJZfS8RzsOFcGtw50oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1ziOg24Q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dkmzdMKf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Nov 2025 17:00:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763136018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0RgZdTbuPlG+3EOrP9ebvqXiN5tERfLyzYTA/UOQ8s=;
	b=1ziOg24QpEmBj6/n53CNstxTGLjyGoebqOTm0NXpO5xxBQlUlBsxWeoS5Qt0+PIAmDpOZ2
	DhIJ9OfkBfTsMRXImyvV3L+awjUkeK9NqiC6+f1G3twAl1Um3uvc817gPeVzF09sVC8xrr
	1MTnFNl6UKal9amnx8aN1sPmS8BV0H525gFcDY/9vhu8/t5Pg2/e7d4wuKMwE+mhPF+v9X
	VQs5H+sq9+2KACwh5tynlOgupV0+zriqz6bXTgH4EQyZSfxoZBpqc1mf6Oedk9B8Ro9SuF
	i7ToTOJ1y0PTPYt5S0wD6wlyKtD3hNFWkSm5RhkhHH33XrLFWjwdzVfc/9PXGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763136018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0RgZdTbuPlG+3EOrP9ebvqXiN5tERfLyzYTA/UOQ8s=;
	b=dkmzdMKfb3fcsraPOltOPbY19EpKg8nG2tnHnwW2yPtHrmeAkWFgY5xXwVSjZsI+vN9c8R
	mBtlvrbsqj4BQFAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114160017.CrDJHi5w@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <20251114133532.mmdi2dca@linutronix.de>
 <20251114104633.0721bdbe@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114104633.0721bdbe@gandalf.local.home>

On 2025-11-14 10:46:33 [-0500], Steven Rostedt wrote:
> On Fri, 14 Nov 2025 14:35:32 +0100
> Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
>=20
> > On 2025-11-14 07:42:55 [-0500], Steven Rostedt wrote:
> > > > diff --cc kernel/trace/trace_syscalls.c
> > > > index e96d0063cbcf,3f699b198c56..000000000000
> > > > --- a/kernel/trace/trace_syscalls.c
> > > > +++ b/kernel/trace/trace_syscalls.c
> > > > @@@ -878,6 -322,8 +890,7 @@@ static void ftrace_syscall_enter(void *
> > > >   	 * buffer and per-cpu data require preemption to be disabled.
> > > >   	 */
> > > >   	might_fault();
> > > > + 	preempt_rt_guard();
> > > >  -	guard(preempt_notrace)(); =20
> > >=20
> > > My code made it so that preemption is not needed here but is moved la=
ter
> > > down for the logic that does the reading of user space data.
> > >=20
> > > Note, it must have preemption disabled for all configs (including RT).
> > > Otherwise, the data it has can get corrupted.
> > >=20
> > > Paul, can you change it so that you *do not* touch this file? =20
> >=20
> > Where is preempt_rt_guard() from?
>=20
> Ah, it's from the patch I submitted that has this:
>=20
> +/*
> + * When PREEMPT_RT is enabled, it disables migration instead
> + * of preemption. The pseudo syscall trace events need to match
> + * so that the counter logic recorded into he ring buffer by
> + * trace_event_buffer_reserve() still matches what it expects.
> + */
> +#ifdef CONFIG_PREEMPT_RT
> +# define preempt_rt_guard()  guard(migrate)()
> +#else
> +# define preempt_rt_guard()
> +#endif
> +
>=20
> I must be getting old, as I forgot I wrote this :-p
>=20
> I only saw the update from Stephen and thought it was disabling preemptio=
n.

but having both is kind of gross. Also the mapping from
preempt_rt_guard() to guard(migrate)() only on RT is kind of far.

> It doesn't disable preemption, but is here to keep the latency
> preempt_count counting the same in both PREEMPT_RT and non PREEMPT_RT. You
> know, the stuff that shows up in the trace:
>=20
>   "d..4."

urgh.

We did that to match the reality with the tracer. Since the tracer
disabled preemption we decremented the counter from preempt_count to
record what was there before the trace point started changing it.
That was tracing_gen_ctx_dec(). Now I see we have something similar in
tracing_gen_ctx_dec_cond().
But why do we need to disable migration here? Why isn't !RT affected by
this. I remember someone had a trace where the NMI was set and migrate
disable was at max which sounds like someone decremented the
migrate_disable counter while migration wasn't disabled=E2=80=A6

> Paul, never mind, this code will not affect the code I added.
>=20
> -- Steve

Sebastian

