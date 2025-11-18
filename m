Return-Path: <linux-next+bounces-9074-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB778C698A4
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 14:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B8C124F24B2
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 13:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554BF306D3D;
	Tue, 18 Nov 2025 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9IZiJSd"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADE32FFDEC;
	Tue, 18 Nov 2025 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471107; cv=none; b=u3KBzeUhVuQxp5Nsd1uiUs+wh3Qvw2byAk8kjGhvZhNtkA9SfTv7Rc6bwwP69FN7RF5TztRTRJArFuDW8kdQywFhXajRjdl5p/a9jUX6mUh5XemaiYd8ZkcuydNAVSP6upJ5uo29dKQTzVILdjjIDA7wWcpk2xLw7GZJY8L8XJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471107; c=relaxed/simple;
	bh=VKX8ltzch9Q5vZ1SWMb61T9KplseCWx1MK4WpjDisR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFFZ0Ie+vZ7QQLOEVFSoxqJF5Y4Byqm+TBquii1DeQR2ivYs+Aoi1nIailwLvTOVV2jWk869A3vvwb7sMEuIild2c6T5UUsvk3oJPScfbnp662xNKuQa2S15YbqkkofBfby4tMK/Fcgcc6KTCx3ncHwcd7hnwdZShK0ZCdEufsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9IZiJSd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDE2C4CEF5;
	Tue, 18 Nov 2025 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763471106;
	bh=VKX8ltzch9Q5vZ1SWMb61T9KplseCWx1MK4WpjDisR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9IZiJSde4vWexhGKkOxOLtTfI+3hb9b0yfsxZAaeviomAT+VbLuCz8malOXBxJ8h
	 Akd3Ernkt23PanuJXSfq+ynZY7hViKzBhBK19QUvTZZmnx8URiAflMIsRY+COUMRe8
	 kxnjNs6CX0XhI+0+I6HXPIsaKVMzUTk3i4A+3P2yPbPkQyD7PfbJoe/F13NJYfhomX
	 qx/NMjdHBTmjms4uiE8FJvuL7JvgRHHJm5LCLQyOcOU/iC3jgNjPIbK8aHamDFSssV
	 9IbqifOOp/8yMySexxOoesO8QHureQN7moYrJDLfMGxlkYZrvNeDL6+FsnPjzzTv2r
	 6M1XoXzeDs+GA==
Date: Tue, 18 Nov 2025 14:05:03 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <aRxu_ycww5U9qxJR@localhost.localdomain>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <aRdBVFSmgvPWuY2k@localhost.localdomain>
 <054ceff1-87b7-4729-8589-b7dd22887bc1@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <054ceff1-87b7-4729-8589-b7dd22887bc1@paulmck-laptop>

Le Fri, Nov 14, 2025 at 09:06:29AM -0800, Paul E. McKenney a écrit :
> On Fri, Nov 14, 2025 at 03:48:52PM +0100, Frederic Weisbecker wrote:
> > Le Fri, Nov 14, 2025 at 07:42:55AM -0500, Steven Rostedt a écrit :
> > > On Fri, 14 Nov 2025 13:52:26 +1100
> > > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > > Hi all,
> > > > 
> > > > Today's linux-next merge of the rcu tree got a conflict in:
> > > > 
> > > >   kernel/trace/trace_syscalls.c
> > > > 
> > > > between commit:
> > > > 
> > > >   a544d9a66bdf ("tracing: Have syscall trace events read user space string")
> > > > 
> > > > from the ftrace tree and commit:
> > > > 
> > > >   35587dbc58dd ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
> > > > 
> > > > from the rcu tree.
> > > > 
> > > > I fixed it up (Maybe - see below) and can carry the fix as necessary. This
> > > > is now fixed as far as linux-next is concerned, but any non trivial
> > > > conflicts should be mentioned to your upstream maintainer when your tree
> > > > is submitted for merging.  You may also want to consider cooperating
> > > > with the maintainer of the conflicting tree to minimise any particularly
> > > > complex conflicts.
> > > 
> > > Thanks for the update.
> > > 
> > > > 
> > > 
> > > > diff --cc kernel/trace/trace_syscalls.c
> > > > index e96d0063cbcf,3f699b198c56..000000000000
> > > > --- a/kernel/trace/trace_syscalls.c
> > > > +++ b/kernel/trace/trace_syscalls.c
> > > > @@@ -878,6 -322,8 +890,7 @@@ static void ftrace_syscall_enter(void *
> > > >   	 * buffer and per-cpu data require preemption to be disabled.
> > > >   	 */
> > > >   	might_fault();
> > > > + 	preempt_rt_guard();
> > > >  -	guard(preempt_notrace)();
> > > 
> > > My code made it so that preemption is not needed here but is moved later
> > > down for the logic that does the reading of user space data.
> > > 
> > > Note, it must have preemption disabled for all configs (including RT).
> > > Otherwise, the data it has can get corrupted.
> > > 
> > > Paul, can you change it so that you *do not* touch this file?
> > 
> > Ok, I've zapped the commit for now until we sort this out.
> 
> Thank you, Frederic, and I guess putting this in -next did indeed find
> some problems, so that is good?  ;-)

Indeed, mission accomplished ;-)

Steve proposed here to actually restore the patch:

    https://lore.kernel.org/lkml/20251114110136.3d36deca@gandalf.local.home/

But later said the reverse:

    https://lore.kernel.org/lkml/20251114121141.5e40428d@gandalf.local.home/

So for now I'm still keeping it outside -next. I hope it is not a necessary
change in your srcu series?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

