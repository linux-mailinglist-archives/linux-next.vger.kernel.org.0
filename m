Return-Path: <linux-next+bounces-9003-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C7C5E9A8
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B99A3A7A10
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C80335573;
	Fri, 14 Nov 2025 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyNMLD1e"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A6629BDB5;
	Fri, 14 Nov 2025 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763139622; cv=none; b=DNGDK5+z7ZpfvUoKEDNP7M3V6+SApRW3jVJBYl+jPxuqg/7yMntj0yF20+Ms4vQ+ycv2kwp/v9zvCHyReWfU2LWgLXRk7Kohc6l/noUeV+gt+GlAgAnp34p+KA9nOipiUBqy7SHnP722QQIy79Iq5bBAAryAztFSawUDXm9I0nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763139622; c=relaxed/simple;
	bh=RI7RnzJxd1EyytXc2hGVyv+OF7EnntAM3FplD+utQJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIXbtvP5dvlf81Q8FPFixHKl4Qcjejdc4jiothUTfCjNe0SKifJbcEYY57wi03IVSJNYHtSH67R3TBViiues/kjEG6SPeK4e05UB2QgCXfu5CqaNHpXLt8O6cBSdQKe6HuiN6y/1Qu1rfzMSmrN25LzOQlkUBr+QdQhhEoVN7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyNMLD1e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15BCC4CEF5;
	Fri, 14 Nov 2025 17:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763139622;
	bh=RI7RnzJxd1EyytXc2hGVyv+OF7EnntAM3FplD+utQJs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hyNMLD1e2iG8ZUKj5JzG4bVQNRw/Nmwu+f1OH846bFV/2tX8a3S+hNjYhDVDg7KTL
	 YBNk4A+MQzozytTQrtHHwO9l0kwtzoQ+rbfFZW2z8IIiZaulS3RaUWoe70wVRg9jMl
	 oiaCh93IVYqBwcfiy8CXqFCheV0hScHCJ9aZITIUOmoStt4HtYVc4ipaQo/3//NRYD
	 uzERV97VZ4//qWkuyw9/IDc46xMpEO9RO68wfUK18zyKG6f3gjQJq+MOjlTrbX6I2L
	 QcwwfFuxTssd90hNuqPqL9x5m+s7UoYo0+lRAkOYwios0jUetNjtcFcZv+ZWPLBFGK
	 u1sqAMZ1SK5sA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 72AA4CE0CA7; Fri, 14 Nov 2025 09:00:21 -0800 (PST)
Date: Fri, 14 Nov 2025 09:00:21 -0800
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
Message-ID: <348528a9-7e1a-4aa7-8219-5cad81969137@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <20251114133532.mmdi2dca@linutronix.de>
 <20251114104633.0721bdbe@gandalf.local.home>
 <20251114160017.CrDJHi5w@linutronix.de>
 <20251114112202.08e1e3c1@gandalf.local.home>
 <20251114163330.pi9Nm3Vb@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114163330.pi9Nm3Vb@linutronix.de>

On Fri, Nov 14, 2025 at 05:33:30PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-11-14 11:22:02 [-0500], Steven Rostedt wrote:
> > It's to match this code:
> > 
> > --- a/include/linux/tracepoint.h
> > +++ b/include/linux/tracepoint.h
> > @@ -100,6 +100,25 @@ void for_each_tracepoint_in_module(struct module *mod,
> >  }
> >  #endif /* CONFIG_MODULES */
> >  
> > +/*
> > + * BPF programs can attach to the tracepoint callbacks. But if the
> > + * callbacks are called with preemption disabled, the BPF programs
> > + * can cause quite a bit of latency. When PREEMPT_RT is enabled,
> > + * instead of disabling preemption, use srcu_fast_notrace() for
> > + * synchronization. As BPF programs that are attached to tracepoints
> > + * expect to stay on the same CPU, also disable migration.
> > + */
> > +#ifdef CONFIG_PREEMPT_RT
> > +extern struct srcu_struct tracepoint_srcu;
> > +# define tracepoint_sync() synchronize_srcu(&tracepoint_srcu);
> > +# define tracepoint_guard()                            \
> > +       guard(srcu_fast_notrace)(&tracepoint_srcu);     \
> > +       guard(migrate)()
> > +#else
> > +# define tracepoint_sync() synchronize_rcu();
> > +# define tracepoint_guard() guard(preempt_notrace)()
> > +#endif
> > +
> > 
> > Where in PREEMPT_RT we do not disable preemption around the tracepoint
> > callback, but in non RT we do. Instead it uses a srcu and migrate disable.
> 
> I appreciate the effort. I really do. But why can't we have SRCU on both
> configs?

Due to performance concerns for non-RT kernels and workloads, where we
really need preemption disabled.

> Also why does tracepoint_guard() need to disable migration? The BPF
> program already disables migrations (see for instance
> bpf_prog_run_array()).
> This is true for RT and !RT. So there is no need to do it here.

The addition of migration disabling was in response to failures, which
this fixed.  Or at least greatly reduced the probability of!  Let's see...
That migrate_disable() has been there since 2022, so the failures were
happening despite it.  Adding Yonghong on CC for his perspective.

> > The migrate_disable in the syscall tracepoint (which gets called by the
> > system call version that doesn't disable migration, even in RT), needs to
> > disable migration so that the accounting that happens in:
> > 
> >   trace_event_buffer_reserve()
> > 
> > matches what happens when that function gets called by a normal tracepoint
> > callback.
> 
> buh. But this is something. If we know that the call chain does not
> disable migration, couldn't we just use a different function? I mean we
> have tracing_gen_ctx_dec() and tracing_gen_ctx)(). Wouldn't this work
> for migrate_disable(), too? 
> Just in case we need it and can not avoid it, see above.

On this, I must defer to the tracing experts.  ;-)

							Thanx, Paul

