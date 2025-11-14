Return-Path: <linux-next+bounces-9004-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CF3C5E7A5
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BEBC24F4C34
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D022C0F90;
	Fri, 14 Nov 2025 17:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J7WAQZeW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LK5ykBjQ"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5402BEC41;
	Fri, 14 Nov 2025 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763139757; cv=none; b=FAXDABVwrtYe1oOTjjkjwDliavKu11GFPxR2qlDWO3BRkpLFXh1uGzAfRO6BOHTzPBaOdjhTxCEtFI5BJesT3kD0iXP0yhKncqhvHeQE8KUlmC/vtrTLJX0Dg6ZEFelzg9fP0Cbf0p3qRpz1LyCn2dVj6T1EaVOs6dnr3g7hUxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763139757; c=relaxed/simple;
	bh=nqdzCZ/APbh8XUFIZeModeHf86j1goIspIts/lxET7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuadFHfQY8U6ENw1kcBYXFDjZW1R3aKeubcgYnQixA7Yn+k1JCuwWkgQw3gdCiss3+AFnIg3pz7FXKe4R2h3alA49qnBtb6WfR4wxNZHNzgtjApza+DF/H06sZNpgiRzMSExrpy8BKr4sPxOc09pdT/XlcunV8in6xl9pJ/2v/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J7WAQZeW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LK5ykBjQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Nov 2025 18:02:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763139753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=onapXAJa+JYbDgIN+3TCXXFdVNVL7b6gvwO4G3AZPoo=;
	b=J7WAQZeWB1OcJgpD8bVV5kuS4wYziklm0QjTKe6FEssniO8vhTfpjgBLODN4E0xni0TmGy
	jtFNl67IKKi3+WZb27HJqRcHszW7xu4X9cm8LOTwxDr9KOQe7H9O0N86sC3Nnw6Yso4OYo
	w1xD4npyuZAWgeLeqDaBenuLBfRS0mbmJMfFKjyZROHAqWIgf6zwI7/W01Tdm9+kz34QuX
	NbuaRwmXsCXC/4BfYfJgW/U2SYP3U12rqhfj/7QoeW6T9+lWGxZiB2rjUFTVaTpB44Ck+p
	YkV/8spNKHANw1HDYepHjJi8BVs6Rp1FkRkM0q+BffpbumDLI/TFwzaJN0Xedg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763139753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=onapXAJa+JYbDgIN+3TCXXFdVNVL7b6gvwO4G3AZPoo=;
	b=LK5ykBjQTEHQihjKPm1CSXue2IHbDctvxHWb7t4WpCvXvg8NUqzz4jZYUHgeS6CePHy7kk
	uJmQlyXGorwYpJBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114170232.wHJFS35i@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <20251114133532.mmdi2dca@linutronix.de>
 <20251114104633.0721bdbe@gandalf.local.home>
 <20251114160017.CrDJHi5w@linutronix.de>
 <20251114112202.08e1e3c1@gandalf.local.home>
 <20251114163330.pi9Nm3Vb@linutronix.de>
 <20251114114828.5b7d4fe8@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114114828.5b7d4fe8@gandalf.local.home>

On 2025-11-14 11:48:28 [-0500], Steven Rostedt wrote:
> On Fri, 14 Nov 2025 17:33:30 +0100
> Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> 
> > > Where in PREEMPT_RT we do not disable preemption around the tracepoint
> > > callback, but in non RT we do. Instead it uses a srcu and migrate disable.  
> > 
> > I appreciate the effort. I really do. But why can't we have SRCU on both
> > configs?
> 
> I don't know. Is there more overhead with disabling migration than
> disabling preemption?

On the first and last invocation, yes. But we if disabling migration is
not required for SRCU then why doing it?

We had the disabled preemption due to rcu_read_lock_sched() due to
tracepoint requirement which was not spelled out. This appears to be
replaced with srcu_fast(). I just don't see why we need two flavours
here (RT vs !RT) and where migrate_disable() requirement is from.

> > 
> > Also why does tracepoint_guard() need to disable migration? The BPF
> > program already disables migrations (see for instance
> > bpf_prog_run_array()).
> 
> We also would need to audit all tracepoint callbacks, as there may be some
> assumptions about staying on the same CPU.

Sure. Okay. What would I need to grep for in order to audit it?

> > This is true for RT and !RT. So there is no need to do it here.
> > 
> > > The migrate_disable in the syscall tracepoint (which gets called by the
> > > system call version that doesn't disable migration, even in RT), needs to
> > > disable migration so that the accounting that happens in:
> > > 
> > >   trace_event_buffer_reserve()
> > > 
> > > matches what happens when that function gets called by a normal tracepoint
> > > callback.  
> > 
> > buh. But this is something. If we know that the call chain does not
> > disable migration, couldn't we just use a different function? I mean we
> > have tracing_gen_ctx_dec() and tracing_gen_ctx)(). Wouldn't this work
> > for migrate_disable(), too? 
> > Just in case we need it and can not avoid it, see above.
> 
> I thought about that too. It would then create two different
> trace_event_buffer_reserve():
> 
> static __always_inline void *event_buffer_reserve(struct trace_event_buffer *fbuffer,
> 						  struct trace_event_file *trace_file,
> 						  unsigned long len, bool dec)
> {
> 	struct trace_event_call *event_call = trace_file->event_call;
> 
> 	if ((trace_file->flags & EVENT_FILE_FL_PID_FILTER) &&
> 	    trace_event_ignore_this_pid(trace_file))
> 		return NULL;
> 
> 	/*
> 	 * If CONFIG_PREEMPTION is enabled, then the tracepoint itself disables
> 	 * preemption (adding one to the preempt_count). Since we are
> 	 * interested in the preempt_count at the time the tracepoint was
> 	 * hit, we need to subtract one to offset the increment.
> 	 */
> 	fbuffer->trace_ctx = dec ? tracing_gen_ctx_dec() : tracing_gen_ctx();
> 	fbuffer->trace_file = trace_file;
> 
> 	fbuffer->event =
> 		trace_event_buffer_lock_reserve(&fbuffer->buffer, trace_file,
> 						event_call->event.type, len,
> 						fbuffer->trace_ctx);
> 	if (!fbuffer->event)
> 		return NULL;
> 
> 	fbuffer->regs = NULL;
> 	fbuffer->entry = ring_buffer_event_data(fbuffer->event);
> 	return fbuffer->entry;
> }
> 
> void *trace_event_buffer_reserve(struct trace_event_buffer *fbuffer,
> 				 struct trace_event_file *trace_file,
> 				 unsigned long len)
> {
> 	return event_buffer_reserve(fbuffer, trace_file, len, true);
> }
> 
> void *trace_syscall_event_buffer_reserve(struct trace_event_buffer *fbuffer,
> 					 struct trace_event_file *trace_file,
> 					 unsigned long len)
> {
> 	return event_buffer_reserve(fbuffer, trace_file, len, false);
> }
> 
> Hmm

Yeah. I *think* in the preempt case we always use the one or the other.

So I would prefer this instead of explicitly disable migration so the a
function down in the stack can decrement the counter again.
Ideally, we don't disable migration to begin with.

_If_ the BPF program disables migrations before invocation of its
program then any trace recording that happens within this program
_should_ record the migration counter at that time. Which would be 1 at
the minimum.

> -- Steve

Sebastian

