Return-Path: <linux-next+bounces-9014-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44119C5EFB5
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 20:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A361F4F6CD9
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E002E2825;
	Fri, 14 Nov 2025 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVguLHYD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9F92E1F03;
	Fri, 14 Nov 2025 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763146720; cv=none; b=qRAPz/6SxGNNb2PLNMYQ+9qRllzxGjjJ7eQIgmvwFdZT4bjrVfO3w7aFsIUF3ob8RcETB4+iVENN3hslygyWNPku+5WcwwFPOaUZ1TeWkpjzJO/Md4jRtXMpBHjRp+8mp/WeYNacrBnp+Rs228/GLh4ndNFPitrKpG7HwlgpjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763146720; c=relaxed/simple;
	bh=FK6TckGubTFlJTyBWtxEcGEAyE4LP7faRAd4KlveV2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ki1pNqpOn7kq9IvZS5sfvu1olNG5aq2kvc9jw9MfUtjsLRRRsmrQMSxUlaVxI3bvjhI1eU2Y6iBVJ04xRARP0XE7H+wt/HtXkQtPMjOoUNwOgx4NEgk2SpeOExKInz9/NloPYIqhZ9U5Y6jwBs1KTStAbgm+Pu29tvCDa+WgpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVguLHYD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB608C4CEF1;
	Fri, 14 Nov 2025 18:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763146719;
	bh=FK6TckGubTFlJTyBWtxEcGEAyE4LP7faRAd4KlveV2M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=PVguLHYDadgEI0BF8713ywudQ9v83mUSElrumPlC7SVBPSofdkhHCRx5a+ko6lcDd
	 rmQWZzLu43qxOZ22a72sgrMqWSlRC9AKSfq6Id4d59U4CrwS7up1EY04bh6hj5olMA
	 sBoWRDRC4Ho9AXpMkUs+jKikYEFrfmlmyZJffoDUa2UQC3ZNFbFTM4pAYicRzLw1sY
	 UXeznZmpRtfOEicQwFNeV6keH8hO4teDMP0LvaCSlBxlXw+ZoTpkXqY6uyJTSyzDr5
	 zT8XgtPai3ZtvjNgPfzHW+z3F0huAM39xbhb50TKgtQflOaBrxm4F/Wm1Ru7lOsjeT
	 PFAFUoecTFRiQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5ACD7CE0CA7; Fri, 14 Nov 2025 10:58:39 -0800 (PST)
Date: Fri, 14 Nov 2025 10:58:39 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
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
Message-ID: <45a06584-72cd-4ba5-838d-3d6ab4e9bba6@paulmck-laptop>
Reply-To: paulmck@kernel.org
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

On Fri, Nov 14, 2025 at 09:06:29AM -0800, Paul E. McKenney wrote:
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

And in other more hopeful news, your -next stack (including this patch)
passed torture.sh testing on both ARM and x86 and 12 hours of TREE10
15*CFLIST testing on x86.

							Thanx, Paul

