Return-Path: <linux-next+bounces-9001-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C852C5E754
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 632614EFC56
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 16:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719B52222B6;
	Fri, 14 Nov 2025 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FXN2S5t2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b6mRnAh1"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A427FD7D;
	Fri, 14 Nov 2025 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763138442; cv=none; b=NGdKFbGCGT/hvL8ooV3eZs58jWGYKSDYxuuJZA0WlwHkGr+XoUgt0Xz5A2ypLTTQkh1BFxMV8z5UaysW4GUZ9JrqPEBCeJFTMctN0sxYFCjy1pEE9uBndayS3Us/amB5NJJdxwPMkAvgrFsMxbBVxGn25lH0rAgIVGOzlkSbPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763138442; c=relaxed/simple;
	bh=xWdU+C9Vi7LpqUOlVjOCR/QCa3uryqsbclqFRVYt9rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hX8nYDuiYfCZ5/Pk4CihzN+9CeFxtDHZecfTgEjHVFn4SedPwzEj2Erm2pAuEXBUUFXXHYvZz05i2o9Xtz5eoZtQUdrKm03j+5y/hf3yvujL3VwWPM4Lp8Ic+hnbOw/Qh8Nsy7lE7EXkR1jG2o2bJtgfioJhk5QKaP//Cr/g0R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FXN2S5t2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b6mRnAh1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Nov 2025 17:33:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763138011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7k/rP30VSoFhhG+Mqop8cyqyhBI6R6u04HLdAy0fFvE=;
	b=FXN2S5t2iP3A3SbmFqn38AmAJ4+AUAoCL4JTLJLpFaSF4O13Kbc9zLMgwtEaYZT6Zuy5DN
	S10L6nftVB+VpE09XNgommHSSbUNZvA4ZGaughHAQw8D7xPoLvU0GieV0yqq6JhZNHRgaL
	eFxvnwaAEKzULk4ZOYL0ujo1y4uk3EX1K8CJqQ0Z6HJ3frIuDZ3LXCiGSa2fJeX9VvADCv
	3MW9Xa2KPzAq8dDg5/R+TSumuzlMqCY0YtpPF5bFDUecxxzfgwtDPprSsL/kBGCviri3kR
	67Wq8YbLfD5XBvEuNguRBJx3HpxZc99RUxvAgTAFoE4vPCGBcLjcgsjhbjvANg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763138011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7k/rP30VSoFhhG+Mqop8cyqyhBI6R6u04HLdAy0fFvE=;
	b=b6mRnAh1eXbA6mDJLZnBS1TfSN4A8t9VHTIpGYhFRWbFUm4LJq7V13etr8pU3YsfCrjDhF
	g8RnxSgU85/gqhBQ==
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
Message-ID: <20251114163330.pi9Nm3Vb@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <20251114133532.mmdi2dca@linutronix.de>
 <20251114104633.0721bdbe@gandalf.local.home>
 <20251114160017.CrDJHi5w@linutronix.de>
 <20251114112202.08e1e3c1@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114112202.08e1e3c1@gandalf.local.home>

On 2025-11-14 11:22:02 [-0500], Steven Rostedt wrote:
> It's to match this code:
> 
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -100,6 +100,25 @@ void for_each_tracepoint_in_module(struct module *mod,
>  }
>  #endif /* CONFIG_MODULES */
>  
> +/*
> + * BPF programs can attach to the tracepoint callbacks. But if the
> + * callbacks are called with preemption disabled, the BPF programs
> + * can cause quite a bit of latency. When PREEMPT_RT is enabled,
> + * instead of disabling preemption, use srcu_fast_notrace() for
> + * synchronization. As BPF programs that are attached to tracepoints
> + * expect to stay on the same CPU, also disable migration.
> + */
> +#ifdef CONFIG_PREEMPT_RT
> +extern struct srcu_struct tracepoint_srcu;
> +# define tracepoint_sync() synchronize_srcu(&tracepoint_srcu);
> +# define tracepoint_guard()                            \
> +       guard(srcu_fast_notrace)(&tracepoint_srcu);     \
> +       guard(migrate)()
> +#else
> +# define tracepoint_sync() synchronize_rcu();
> +# define tracepoint_guard() guard(preempt_notrace)()
> +#endif
> +
> 
> Where in PREEMPT_RT we do not disable preemption around the tracepoint
> callback, but in non RT we do. Instead it uses a srcu and migrate disable.

I appreciate the effort. I really do. But why can't we have SRCU on both
configs?

Also why does tracepoint_guard() need to disable migration? The BPF
program already disables migrations (see for instance
bpf_prog_run_array()).
This is true for RT and !RT. So there is no need to do it here.

> The migrate_disable in the syscall tracepoint (which gets called by the
> system call version that doesn't disable migration, even in RT), needs to
> disable migration so that the accounting that happens in:
> 
>   trace_event_buffer_reserve()
> 
> matches what happens when that function gets called by a normal tracepoint
> callback.

buh. But this is something. If we know that the call chain does not
disable migration, couldn't we just use a different function? I mean we
have tracing_gen_ctx_dec() and tracing_gen_ctx)(). Wouldn't this work
for migrate_disable(), too? 
Just in case we need it and can not avoid it, see above.

> -- Steve

Sebastian

