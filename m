Return-Path: <linux-next+bounces-3402-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4947695CCBF
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2024 14:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051C02858F2
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2024 12:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7120F178372;
	Fri, 23 Aug 2024 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDDgAMNa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D85136E2E;
	Fri, 23 Aug 2024 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417220; cv=none; b=tHvQ8OyWUH4dB8wtDgpkgOr+4BSb4TbTXXr25FEvuCFMJFUKnDmjpN6pq70CW6h2yMLmGCRkpm4bC5ATuzX6D2KmBQBhBKVJT4ItBUO2fKjKJipCDW6poWlPJOqqJvkA8FZlOH5o2M7ISYoLju1lYWv/bXSkvJyAc6IhzMWNeec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417220; c=relaxed/simple;
	bh=OM8PaXHNjwZ20oARdQYqWPXPxhV8XwwRpOxFxrnByjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftZbrVqskWTXvxw+l4e9XGAEfZzaCWQVudoFiJ3PN159FLZh4ALa/pkltSD3zSKXKIK/Nt7lF1Kj2aiUGhbfCQl03fDHL8hB4wmLQTCV/xiMjb6We91akuL3Uq5OyIb5SmFHjOLnp+OlEkYVPvOs2ZH1NWwJh4tP9bHuFQ79f60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDDgAMNa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA98C32786;
	Fri, 23 Aug 2024 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724417220;
	bh=OM8PaXHNjwZ20oARdQYqWPXPxhV8XwwRpOxFxrnByjs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=dDDgAMNajyn+5gV1/T1NXQY9X/7GCK8fYmdt2040YYgQ80tMjjPkwxNAYISpJa2PH
	 JBQLsWb1sSAYAp+sselkjS9lYKlrJArK7wu3/tbv3yUbnt72I6+NE/8DnvFIq+w+29
	 +Kf6enLpqeJu16/HsMPB3v7vgSDylnpdyBgNSlgAJFTB01KbzNU1uTnpbAVMABxPDV
	 xkrwcfUwWr+0mzTDdxW++xkyJj2YNIF95NWumS4Ao9q3atzS/+fS2p0oLCXM088PMT
	 CrEUDhbsoxffkDQjbbvNWh1rfURZFiDi1Tx5ptlQKPr90oRYrcHiTCqf6Z/06zlG13
	 kkSvPbZ5SUo+A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AAE73CE0469; Fri, 23 Aug 2024 05:46:59 -0700 (PDT)
Date: Fri, 23 Aug 2024 05:46:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <eb929d94-6f0b-44a9-b408-feb81b228ff0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823074705.GB12053@noisy.programming.kicks-ass.net>

On Fri, Aug 23, 2024 at 09:47:05AM +0200, Peter Zijlstra wrote:
> On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:
> 
> > 2e0199df252a ("sched/fair: Prepare exit/cleanup paths for delayed_dequeue")
> > 
> > The preceding commit is very reliable.
> > 
> > Only instead of (or maybe as well as?) introducing the dequeue_rt_stack()
> > bug, the 2e0199df252a commit introduced a build bug:
> > 
> > ------------------------------------------------------------------------
> > 
> > In file included from kernel/sched/fair.c:54:
> > kernel/sched/fair.c: In function ‘switched_from_fair’:
> > kernel/sched/sched.h:2154:58: error: ‘__SCHED_FEAT_DELAY_ZERO’ undeclared (first use in this function); did you mean ‘__SCHED_FEAT_LATENCY_WARN’?
> >  2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
> >       |                                                          ^~~~~~~~~~~~~
> > kernel/sched/fair.c:12878:21: note: in expansion of macro ‘sched_feat’
> > 12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
> >       |                     ^~~~~~~~~~
> > kernel/sched/sched.h:2154:58: note: each undeclared identifier is reported only once for each function it appears in
> >  2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
> >       |                                                          ^~~~~~~~~~~~~
> > kernel/sched/fair.c:12878:21: note: in expansion of macro ‘sched_feat’
> > 12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
> >       |                     ^~~~~~~~~~
> > 
> 
> Oh gawd, last minute back-merges :/

I know that feeling!  ;-)

> Does the below help any? That's more or less what it was before Valentin
> asked me why it was weird like that :-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 6be618110885..5757dd50b02f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13107,7 +13107,6 @@ static void switched_from_fair(struct rq *rq, struct task_struct *p)
>  	 * and we cannot use DEQUEUE_DELAYED.
>  	 */
>  	if (p->se.sched_delayed) {
> -		dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP);
>  		p->se.sched_delayed = 0;
>  		p->se.rel_deadline = 0;
>  		if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)

Removing that line from 2e0199df252a still gets me the complaint about
__SCHED_FEAT_DELAY_ZERO being undefined.  To my naive eyes, it appears
that this commit:

54a58a787791 ("sched/fair: Implement DELAY_ZERO")

Need to be placed before 2e0199df252a.  Of course, when I try it, I
get conflicts.  So I took just this hunk:

------------------------------------------------------------------------

diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 97fb2d4920898..6c5f5424614d4 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -28,6 +28,11 @@ SCHED_FEAT(NEXT_BUDDY, false)
  */
 SCHED_FEAT(CACHE_HOT_BUDDY, true)
 
+/*
+ * DELAY_ZERO clips the lag on dequeue (or wakeup) to 0.
+ */
+SCHED_FEAT(DELAY_ZERO, true)
+
 /*
  * Allow wakeup-time preemption of the current task:
  */

------------------------------------------------------------------------

That makes the build error go away.  Maybe even legitimately?

Just to pick on the easy one, I took a look at the complaint about
cfs_rq being unused and the complaint about __SCHED_FEAT_DELAY_ZERO
being undefined.  This variable was added here:

781773e3b680 ("sched/fair: Implement ENQUEUE_DELAYED")

And its first use was added here:

54a58a787791 ("sched/fair: Implement DELAY_ZERO")

Which matches my experience.

So left to myself, I would run on these commits with the above hunk:

54a58a7877916 sched/fair: Implement DELAY_ZERO
152e11f6df293 sched/fair: Implement delayed dequeue
e1459a50ba318 sched: Teach dequeue_task() about special task states
a1c446611e31c sched,freezer: Mark TASK_FROZEN special
781773e3b6803 sched/fair: Implement ENQUEUE_DELAYED
f12e148892ede sched/fair: Prepare pick_next_task() for delayed dequeue
2e0199df252a5 sched/fair: Prepare exit/cleanup paths for delayed_dequeue
e28b5f8bda017 sched/fair: Assert {set_next,put_prev}_entity() are properly balanced

And where needed, remove the unused cfs_rq local variable.

Would that likely work?

In the meantime, SIGFOOD!

							Thanx, Paul

