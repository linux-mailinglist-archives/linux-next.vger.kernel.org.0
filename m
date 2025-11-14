Return-Path: <linux-next+bounces-9005-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD3C5E906
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 300204EE610
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FD22C234F;
	Fri, 14 Nov 2025 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S72/7f2/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461B3396F1;
	Fri, 14 Nov 2025 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763139950; cv=none; b=c4rNTlo+myNIG8I5WkSIRpnII1g19RTBL6SQ7giX3Zvbxv1htkm1ZzszNMgJQXaZRRSCHrYMMUEFVhe9CxDczkR0yS3Tn0aRdB84rr+aF7PDJk0kQ6Jut4r4H7cN/Ity2qCvG1Nrm9aqQIFW2Qhke4Kzo5rLB5+p6i00o/Fxbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763139950; c=relaxed/simple;
	bh=owMomlkx9aieM07/WeGfyA2jbu8TZOXOd/P9VC4u5xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BioN5Iouskh59nMmRE05g8F9lEch/BBBifM5wPHVI5NdRQS6R4myan0STeuh5Ku7gUz7Cr3myG3FJ/9XU41oSVEmf2M1TchJnVucyrE+LsnDDADk/vB2bBvn2oQGOvlj561tg/SZ5oJdQv1qk3Fow7BrFrtx9TGlpYwQwux5ytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S72/7f2/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF402C4CEF5;
	Fri, 14 Nov 2025 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763139949;
	bh=owMomlkx9aieM07/WeGfyA2jbu8TZOXOd/P9VC4u5xY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=S72/7f2/MbY4+reIR1ckz3jXxVr9QvNs3TfEtsUC0F2L3qEU7cWBqLMjnsBIfytDR
	 80AQlZiIqvwG/nGE12KAMMBxMLe/KdxodJYbu9r9xZFQNZyK/ZJsAKwnZm8xbCvD57
	 cs99Ir1sOwAnw7f/NAo4dBMuCvg3LxHxjvUcJhNDVMfnECzmBdmqb2pQz4V2PbBUTT
	 p0pNyab5kVUQpMqZmK1u0xYuhc8SM/IXzejYESPsTQO59BN3SMoG8GRZTMLGS/vF67
	 KhjuIB2Lo8rW1q7IPbKnDgkFH0JV28JOCKnFQVQ+z5hfvvmAJtdY/9n+vPvxZ5WCG2
	 ccrhTZlOCRGsA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 53F1CCE0CA7; Fri, 14 Nov 2025 09:05:49 -0800 (PST)
Date: Fri, 14 Nov 2025 09:05:49 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	yonghong.song@linux.dev
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <e2674451-21f2-4388-bf3c-8ca9946f81cf@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114074255.3e535084@gandalf.local.home>

On Fri, Nov 14, 2025 at 07:42:55AM -0500, Steven Rostedt wrote:
> On Fri, 14 Nov 2025 13:52:26 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next merge of the rcu tree got a conflict in:
> > 
> >   kernel/trace/trace_syscalls.c
> > 
> > between commit:
> > 
> >   a544d9a66bdf ("tracing: Have syscall trace events read user space string")
> > 
> > from the ftrace tree and commit:
> > 
> >   35587dbc58dd ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
> > 
> > from the rcu tree.
> > 
> > I fixed it up (Maybe - see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks for the update.
> 
> > 
> 
> > diff --cc kernel/trace/trace_syscalls.c
> > index e96d0063cbcf,3f699b198c56..000000000000
> > --- a/kernel/trace/trace_syscalls.c
> > +++ b/kernel/trace/trace_syscalls.c
> > @@@ -878,6 -322,8 +890,7 @@@ static void ftrace_syscall_enter(void *
> >   	 * buffer and per-cpu data require preemption to be disabled.
> >   	 */
> >   	might_fault();
> > + 	preempt_rt_guard();
> >  -	guard(preempt_notrace)();
> 
> My code made it so that preemption is not needed here but is moved later
> down for the logic that does the reading of user space data.
> 
> Note, it must have preemption disabled for all configs (including RT).
> Otherwise, the data it has can get corrupted.
> 
> Paul, can you change it so that you *do not* touch this file?

I could, but I believe that this would re-introduce the migration failure.

Maybe we should just defer this until both your patch and the RCU
stack hit mainline, and port on top of those?  Perhaps later in the
merge window?

I believe that migration needs to be disabled at this point, but I am
again adding Yonghong on CC for his perspective.

							Thanx, Paul

> Thanks,
> 
> -- Steve
> 
> 
> >   
> >   	syscall_nr = trace_get_syscall_nr(current, regs);
> >   	if (syscall_nr < 0 || syscall_nr >= NR_syscalls)

