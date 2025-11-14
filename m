Return-Path: <linux-next+bounces-8996-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5896C5E300
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DBFA4F5533
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 15:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83D0246778;
	Fri, 14 Nov 2025 15:46:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5145635CBC5;
	Fri, 14 Nov 2025 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135187; cv=none; b=MPljxUQFSjZ/K6+vzHhoW/q6ZbyHrEjUrzwK7FMX0i6bKj3S4iMOMWGKePH9N9uNRMpS3igat3MtF+b1181AUjSUoaMNwmBwNZ3WP3r/9ZUZMieo0WAB9OeDcXGMj1gYbLCcbEOUJYcC9U4QLZmqxfWqFefO3miM337Vu0I1J90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135187; c=relaxed/simple;
	bh=laLfkcfKkv6qg5lFpKg6jiDdx3PoXhOBfQDJd538wQY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=az3CURreFG/24QLE0iQaD3LwemwTgJu2kh9Ug6m28SGn6CI/RW533VpxWPIrx+a2qxzT0wwJl2cYoT+aU9ek24pL4MqfkMlJKEalI1IPZZcr0gzPAKFB2Gk7O8UM5FdsePra/2U6ywdWusSBWdODSRnhM/F58vuvDY3RsRHcn9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 492A41603A6;
	Fri, 14 Nov 2025 15:46:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 35D1334;
	Fri, 14 Nov 2025 15:46:15 +0000 (UTC)
Date: Fri, 14 Nov 2025 10:46:33 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Paul E. McKenney"
 <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114104633.0721bdbe@gandalf.local.home>
In-Reply-To: <20251114133532.mmdi2dca@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
	<20251114074255.3e535084@gandalf.local.home>
	<20251114133532.mmdi2dca@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 71d6jbz4b71exe1jxfhdtiq5hk1d4beb
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 35D1334
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+WrHBcHWCBxqK4sDwnLzRx4nfYp1IllHY=
X-HE-Tag: 1763135175-639753
X-HE-Meta: U2FsdGVkX1+e0Vuwmnc+B3ehOmag63D2pqwiZycDiPFGlqywRInc/Uvq2CgYGyQjVJtlHqtQ4PHVbPUaFYd2rWLXCim71oGwblzgPX8Jm+TGuXHdYc/N6edOzk1ZAy4UdxziHViDAJcbt0w/hIUaxxDD3ihjRlPJ2niF7W9f3roGv5IIlgarJqPAVgqzBC3CKlBH7ft+iO9EK9VlVhcK78o8hBjCoHsOeVhWLmEX4uTYOQCzbqXQl5gzlBhaJPlVJjh1VC6Oq5qYzuWO4AG5Y4tZXK/vb1wBRObip/C20c93dckvc5cdBkyzY0sj9Dtl

On Fri, 14 Nov 2025 14:35:32 +0100
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> On 2025-11-14 07:42:55 [-0500], Steven Rostedt wrote:
> > > diff --cc kernel/trace/trace_syscalls.c
> > > index e96d0063cbcf,3f699b198c56..000000000000
> > > --- a/kernel/trace/trace_syscalls.c
> > > +++ b/kernel/trace/trace_syscalls.c
> > > @@@ -878,6 -322,8 +890,7 @@@ static void ftrace_syscall_enter(void *
> > >   	 * buffer and per-cpu data require preemption to be disabled.
> > >   	 */
> > >   	might_fault();
> > > + 	preempt_rt_guard();
> > >  -	guard(preempt_notrace)();  
> > 
> > My code made it so that preemption is not needed here but is moved later
> > down for the logic that does the reading of user space data.
> > 
> > Note, it must have preemption disabled for all configs (including RT).
> > Otherwise, the data it has can get corrupted.
> > 
> > Paul, can you change it so that you *do not* touch this file?  
> 
> Where is preempt_rt_guard() from?

Ah, it's from the patch I submitted that has this:

+/*
+ * When PREEMPT_RT is enabled, it disables migration instead
+ * of preemption. The pseudo syscall trace events need to match
+ * so that the counter logic recorded into he ring buffer by
+ * trace_event_buffer_reserve() still matches what it expects.
+ */
+#ifdef CONFIG_PREEMPT_RT
+# define preempt_rt_guard()  guard(migrate)()
+#else
+# define preempt_rt_guard()
+#endif
+

I must be getting old, as I forgot I wrote this :-p

I only saw the update from Stephen and thought it was disabling preemption.

It doesn't disable preemption, but is here to keep the latency
preempt_count counting the same in both PREEMPT_RT and non PREEMPT_RT. You
know, the stuff that shows up in the trace:

  "d..4."

Paul, never mind, this code will not affect the code I added.

-- Steve


