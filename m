Return-Path: <linux-next+bounces-9002-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 02917C5E797
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7FD284E344C
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 16:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37A629D277;
	Fri, 14 Nov 2025 16:48:16 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E37329BDA3;
	Fri, 14 Nov 2025 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763138896; cv=none; b=slsDx+9F4KEaKlnh6Rq5xQl2p9HuvIl8FAfDe5tIkj6uoyyMmFWQVD8WPbpR1683XAVOSzSOSbFo9AJbm60U1kT7DJh+6gGA+Fw4k6nJPkRd5UdJ3QcpF0GRuYntoYmr/z27oehUZy1HkzvHYAWrrvsOVRTcOb6YdTzqtFqCIrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763138896; c=relaxed/simple;
	bh=jKrPpZT7K7mt9HrKXWU/xwzb3abT3cHlYys8j776MyM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9sW2izc3V8AnPm3GG62gyUkHJQ1JJyFrygV4dD25T2oJD7qjZv+HiHON/gsYux5mjiwYd5XteNXmW3Pmgv2vm06P18WxJumEHFbIPyd6teCMtpuCJcaSrFG5zmdt9PeIItoc/gxAeazPfr8Z1lXJI890pFfqJpBoyoTjT98tgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 53802140460;
	Fri, 14 Nov 2025 16:48:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id E3D4060011;
	Fri, 14 Nov 2025 16:48:09 +0000 (UTC)
Date: Fri, 14 Nov 2025 11:48:28 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Paul E. McKenney"
 <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114114828.5b7d4fe8@gandalf.local.home>
In-Reply-To: <20251114163330.pi9Nm3Vb@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
	<20251114074255.3e535084@gandalf.local.home>
	<20251114133532.mmdi2dca@linutronix.de>
	<20251114104633.0721bdbe@gandalf.local.home>
	<20251114160017.CrDJHi5w@linutronix.de>
	<20251114112202.08e1e3c1@gandalf.local.home>
	<20251114163330.pi9Nm3Vb@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: wagfcy79yb3kozpdu3ho9qd1ft88owcj
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: E3D4060011
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19juJDZEknEeH/hCqqQ6vPOpjPO82RI3Ds=
X-HE-Tag: 1763138889-811349
X-HE-Meta: U2FsdGVkX1+6SS+iv+bD49cftDH7Hp4byRjInHwJfWEXv0XJ8eKDFGGrkday5QAHL393+JXjR/BQcIElcXuwttyTJdXIN9f0dKjbo8xzkmzCC0lXaHVflZ6Zu4dI79j60ldQtZZJJzZJF25vDx5rxnqv3ZSCZ9ZkzcIcqElKI275IK8nOiqAQlBOgNSTtSMHCAwuYZyXKCtVu/bQf0Qca8g+CYFk8blWLokBgsjzUl5XqdGJ+sTJ9X7rJjr+4BrfwPi0rA7S1qPIYouq7nu2IhdZXBezZieLVpw1WPxBEvqpnLI4h25V/7dQO7GHocUw

On Fri, 14 Nov 2025 17:33:30 +0100
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> > Where in PREEMPT_RT we do not disable preemption around the tracepoint
> > callback, but in non RT we do. Instead it uses a srcu and migrate disable.  
> 
> I appreciate the effort. I really do. But why can't we have SRCU on both
> configs?

I don't know. Is there more overhead with disabling migration than
disabling preemption?

> 
> Also why does tracepoint_guard() need to disable migration? The BPF
> program already disables migrations (see for instance
> bpf_prog_run_array()).

We also would need to audit all tracepoint callbacks, as there may be some
assumptions about staying on the same CPU.

> This is true for RT and !RT. So there is no need to do it here.
> 
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

I thought about that too. It would then create two different
trace_event_buffer_reserve():

static __always_inline void *event_buffer_reserve(struct trace_event_buffer *fbuffer,
						  struct trace_event_file *trace_file,
						  unsigned long len, bool dec)
{
	struct trace_event_call *event_call = trace_file->event_call;

	if ((trace_file->flags & EVENT_FILE_FL_PID_FILTER) &&
	    trace_event_ignore_this_pid(trace_file))
		return NULL;

	/*
	 * If CONFIG_PREEMPTION is enabled, then the tracepoint itself disables
	 * preemption (adding one to the preempt_count). Since we are
	 * interested in the preempt_count at the time the tracepoint was
	 * hit, we need to subtract one to offset the increment.
	 */
	fbuffer->trace_ctx = dec ? tracing_gen_ctx_dec() : tracing_gen_ctx();
	fbuffer->trace_file = trace_file;

	fbuffer->event =
		trace_event_buffer_lock_reserve(&fbuffer->buffer, trace_file,
						event_call->event.type, len,
						fbuffer->trace_ctx);
	if (!fbuffer->event)
		return NULL;

	fbuffer->regs = NULL;
	fbuffer->entry = ring_buffer_event_data(fbuffer->event);
	return fbuffer->entry;
}

void *trace_event_buffer_reserve(struct trace_event_buffer *fbuffer,
				 struct trace_event_file *trace_file,
				 unsigned long len)
{
	return event_buffer_reserve(fbuffer, trace_file, len, true);
}

void *trace_syscall_event_buffer_reserve(struct trace_event_buffer *fbuffer,
					 struct trace_event_file *trace_file,
					 unsigned long len)
{
	return event_buffer_reserve(fbuffer, trace_file, len, false);
}

Hmm

-- Steve

