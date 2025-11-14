Return-Path: <linux-next+bounces-9008-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D865EC5E890
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4983361F1B
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D3A2222B6;
	Fri, 14 Nov 2025 17:11:35 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BEB28A704;
	Fri, 14 Nov 2025 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763140295; cv=none; b=T0sAlnnO0U6RA3BIY3T5tGUfIxDbOdVfNFqtKlk4PoXPdy2fYXC8bj3mIZskxUu/MCMWuoWyoIQVBmm4x4qFsugE7St8qwj6WemcYqDpJsmXlhZkvTL3RY0T4q5UmbviVg3HBIbDXCb5wbHbJlcgQ0Rrp9k+FTQTspnrXe6+yA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763140295; c=relaxed/simple;
	bh=//chzJZLb/LvDQmoZBPTLqboiaqIHz52zhUlAZI06PE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6xTBJQ+NLJb9gJ2Sh4eR/OzEk/LWC9YWJaLvAi0rXw29D/d1lkPgK2trrucGkUvybZJYT3GI0yNWB3LysKd2LKJ9ISOlb9e0PWdeDGfnL2vlC8mg19i+4tkV7V4T9f3Eg2sWe4v3W+Z6I03tTGJYcFUUQ3wxyLfGiGMl3tatbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 7FFCCC0413;
	Fri, 14 Nov 2025 17:11:25 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id 3901920025;
	Fri, 14 Nov 2025 17:11:23 +0000 (UTC)
Date: Fri, 14 Nov 2025 12:11:41 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen
 Rothwell <sfr@canb.auug.org.au>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Uladzislau
 Rezki <urezki@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Linux
 Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114121141.5e40428d@gandalf.local.home>
In-Reply-To: <20251114170232.wHJFS35i@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
	<20251114074255.3e535084@gandalf.local.home>
	<20251114133532.mmdi2dca@linutronix.de>
	<20251114104633.0721bdbe@gandalf.local.home>
	<20251114160017.CrDJHi5w@linutronix.de>
	<20251114112202.08e1e3c1@gandalf.local.home>
	<20251114163330.pi9Nm3Vb@linutronix.de>
	<20251114114828.5b7d4fe8@gandalf.local.home>
	<20251114170232.wHJFS35i@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3901920025
X-Stat-Signature: 19eh8i33oht7omp93ufq9kqjexirp7ts
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18Wp65JzRgCTbITHPAnWGjG9Q+ATPqKW1g=
X-HE-Tag: 1763140283-118963
X-HE-Meta: U2FsdGVkX182Z3yvcCRylQ1Gy68kMBaQ18NO4D2l5+W2+0B8Zw3ys3EZDFJsHHk9hq6w9swLqaIPwBr4BooV/nUsrwQPNaA0DWebUIYVe+461J4OXUyX6fKCkUJP9V2ddkdCPSQo5kRuH2S8NJDg7/mw4vqBhBgj3xlEFnU0pmSSZLjppdJW3CE/4J9/HXTFCWyeEdJ/RIhwD3Bc2TaqN7jqWXhLDPdzpZ0PPiljVGkIgjfjNEftYU5rudKUMsjBRtRQGSmTbtgujad57C7wzuJA4zoYGJ3bJr6x9LbFj1qjVT8Lyud2Y8NMNZPtLv+Z

On Fri, 14 Nov 2025 18:02:32 +0100
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> > I don't know. Is there more overhead with disabling migration than
> > disabling preemption?  
> 
> On the first and last invocation, yes. But we if disabling migration is
> not required for SRCU then why doing it?

I'll yield to the BPF experts here.

> > 
> > We also would need to audit all tracepoint callbacks, as there may be some
> > assumptions about staying on the same CPU.  
> 
> Sure. Okay. What would I need to grep for in order to audit it?

Probably anything that uses per-cpu or smp_processor_id().


> > void *trace_event_buffer_reserve(struct trace_event_buffer *fbuffer,
> > 				 struct trace_event_file *trace_file,
> > 				 unsigned long len)
> > {
> > 	return event_buffer_reserve(fbuffer, trace_file, len, true);
> > }
> > 
> > void *trace_syscall_event_buffer_reserve(struct trace_event_buffer *fbuffer,
> > 					 struct trace_event_file *trace_file,
> > 					 unsigned long len)
> > {
> > 	return event_buffer_reserve(fbuffer, trace_file, len, false);
> > }
> > 
> > Hmm  
> 
> Yeah. I *think* in the preempt case we always use the one or the other.

OK, we can do this instead. Probably cleaner anyway.

> 
> So I would prefer this instead of explicitly disable migration so the a
> function down in the stack can decrement the counter again.
> Ideally, we don't disable migration to begin with.
> 
> _If_ the BPF program disables migrations before invocation of its
> program then any trace recording that happens within this program
> _should_ record the migration counter at that time. Which would be 1 at
> the minimum.

Again, I yield to the BPF folks.

Frederic, it may be good to zap this patch from your repo. It looks like it
still needs more work.

Thanks,

-- Steve

