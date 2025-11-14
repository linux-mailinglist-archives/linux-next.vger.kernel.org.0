Return-Path: <linux-next+bounces-8994-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065DC5DADC
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 15:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6F19024119
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 14:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA917325498;
	Fri, 14 Nov 2025 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouADgnvK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3121215F42;
	Fri, 14 Nov 2025 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131735; cv=none; b=a+tyR7SKuu02CLti1OJMWEeQ1kZSQpJ3cgqZwtvOLahkC5ctho6u1LgrbAOa88+grue7ZcFesXlkHeQeDLxun7bVBnj0trD//hbIL1KDbqxIbdIW17YVp7NTitzZGr4A7YBa2IqMiTkeji1VIeA1QUFc69iGWQtEGhbMuP27kVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131735; c=relaxed/simple;
	bh=2s10Oc3FM2bCGELw8+LPnTQhTxTU08gxxlwc1Kuc6BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQWIR1ySqHDAhtSIRHkGAo6kTZBv8xn/ABv0tDNs697yg97hh0Bx4SasODF7HR3ecED7kmU3Ng2WvcMRjRiOv9HkCzjX5huq+KuoJ9J1b62GScJhzlwA8+bGIi9eYZNS28LWAAGAONwKiLH0HvR5yUvrsfZTttfxDFkF2tme6Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouADgnvK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64D6C4CEF8;
	Fri, 14 Nov 2025 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131735;
	bh=2s10Oc3FM2bCGELw8+LPnTQhTxTU08gxxlwc1Kuc6BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouADgnvKSF7mOVcBi/jAXNlaQrN5l7azsWIAM9V2tbLN8klB/I25l2yfa6jkzwPz+
	 RvJY5lyPi8/rTr241IsfGbEshDCidpGufl/lRJCUVfPzN/Sk4ZKdIQcLHbDytDs4lL
	 cKQ0vihrsyPoqkgbuF9io5KYeNgBLDwhYavKQVdz53LobuOg0Xy3IAtWK/gkCnKY/Y
	 i1Aqjs5+QE+xCgq0FTLZdigbsIOUYgfGkREScme8LZriDFWiSiUr8b8RMSuhGZAsQu
	 a7BOqizCoXEZSVKo3atDzZkTAEDn8LFts/27Dz3daeSNDeJENTIQEkAtBYpkvyGyrR
	 czLrvnMifK/ew==
Date: Fri, 14 Nov 2025 15:48:52 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <aRdBVFSmgvPWuY2k@localhost.localdomain>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114074255.3e535084@gandalf.local.home>

Le Fri, Nov 14, 2025 at 07:42:55AM -0500, Steven Rostedt a écrit :
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

Ok, I've zapped the commit for now until we sort this out.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

