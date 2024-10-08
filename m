Return-Path: <linux-next+bounces-4149-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB14995450
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 18:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A48C7B247DC
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 16:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20511D31A0;
	Tue,  8 Oct 2024 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etZ3phIi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF141CFEA8;
	Tue,  8 Oct 2024 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404651; cv=none; b=HtbljpuSfJcc88Kh+m1j8N35XOTBG8FZ0xgtjD+lmgmY9frTopARMK0r3lBDcrs4FdLYKeY7BvUkQ3rqDsjH/a8WRi5OlRqXj70vCrJCHExKch0Nr/YNV1mF3qAfOspN5DNn1oOuzWdccGfl1TIVgPzjCReancFMLUb+/8p/cp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404651; c=relaxed/simple;
	bh=ctjGeZ72RSQKDxtbreogZgyGiVW+rpBL8ucrEd56RV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpfmapEUOP7I1eYO4IBqedSNSQB1wNDGSO7SzFENhPP3YQEz5aYMGRVpWGj/hwJ088Fp/VENlhQLg/pJGcz2q0FoPDRo1QET0Cwh32oEzC9YPoQHoJMmw8omZg9JBVccEZhrapOg9AzeIWjtY9XxNtef8q9iFM1zvIO50gBUxkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etZ3phIi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D79C4CEC7;
	Tue,  8 Oct 2024 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728404651;
	bh=ctjGeZ72RSQKDxtbreogZgyGiVW+rpBL8ucrEd56RV4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=etZ3phIioZg7Zec0vstAzVR5upmBzqN1fV9pIHkvHBwJhWPvNu88QIGDTleKzfUbn
	 sVZ7jkKFeGTK2Nu3Uonwl+zwxGKtexXrFhU2tA1wbQI9OyCF7IjMsBfQwCQWcuUZeH
	 iUu5U1WxNhjavxi8Z8mw5gWNVAnkYCq8fDXXu30f2UpdSPikcU2M9jQTikc13em+Mo
	 qc07M0mToASCL0RH+wfodPuf4waazFeq+t1qDSYHqHeaa0tD8wfFl7K/bjjinvMUXS
	 kCtxt2hCC5tsPPyGROYLuzTjHPCRWiMy5k/hwxGLS/DVvD2UGLNCY1CvFfgY/5G4aT
	 1JpwBLSJVDZbw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 30945CE0B68; Tue,  8 Oct 2024 09:24:11 -0700 (PDT)
Date: Tue, 8 Oct 2024 09:24:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <814ef3b2-bedd-4433-af7c-115c5f37ce39@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
 <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
 <20241003142240.GU5594@noisy.programming.kicks-ass.net>
 <7b14822a-ee98-4e46-9828-1e41b1ce76f3@paulmck-laptop>
 <20241003185037.GA5594@noisy.programming.kicks-ass.net>
 <20241004133532.GH33184@noisy.programming.kicks-ass.net>
 <9961cb9c-70f0-405b-b259-575586905ae0@paulmck-laptop>
 <20241008111150.GD17263@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008111150.GD17263@noisy.programming.kicks-ass.net>

On Tue, Oct 08, 2024 at 01:11:50PM +0200, Peter Zijlstra wrote:
> On Sun, Oct 06, 2024 at 01:44:53PM -0700, Paul E. McKenney wrote:
> 
> > With your patch, I got 24 failures out of 100 TREE03 runs of 18 hours
> > each.  The failures were different, though, mostly involving boost
> > failures in which RCU priority boosting didn't actually result in the
> > low-priority readers getting boosted.  
> 
> Somehow I feel this is progress, albeit very minor :/
> 
> > There were also a number of "sched: DL replenish lagged too much"
> > messages, but it looks like this was a symptom of the ftrace dump.
> > 
> > Given that this now involves priority boosting, I am trying 400*TREE03
> > with each guest OS restricted to four CPUs to see if that makes things
> > happen more quickly, and will let you know how this goes.

And this does seem to make things happen more quickly, but including
an RCU splat.  So...

> > Any other debug I should apply?
> 
> The sched_pi_setprio tracepoint perhaps?

I will give it a shot, thank you!

> I've read all the RCU_BOOST and rtmutex code (once again), and I've been
> running pi_stress with --sched id=low,policy=other to ensure the code
> paths in question are taken. But so far so very nothing :/
> 
> (Noting that both RCU_BOOST and PI futexes use the same rt_mutex / PI API)
> 
> You know RCU_BOOST better than me.. then again, it is utterly weird this
> is apparently affected. I've gotta ask, a kernel with my patch on and
> additionally flipping kernel/sched/features.h:SCHED_FEAT(DELAY_DEQUEUE,
> false) functions as expected?

I will try that after the sched_pi_setprio tracepoint (presumably both).

> One very minor thing I noticed while I read the code, do with as you
> think best...
> 
> diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
> index 1c7cbd145d5e..95061119653d 100644
> --- a/kernel/rcu/tree_plugin.h
> +++ b/kernel/rcu/tree_plugin.h
> @@ -1071,10 +1071,6 @@ static int rcu_boost(struct rcu_node *rnp)
>  	 * Recheck under the lock: all tasks in need of boosting
>  	 * might exit their RCU read-side critical sections on their own.
>  	 */
> -	if (rnp->exp_tasks == NULL && rnp->boost_tasks == NULL) {
> -		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> -		return 0;
> -	}
>  
>  	/*
>  	 * Preferentially boost tasks blocking expedited grace periods.
> @@ -1082,10 +1078,13 @@ static int rcu_boost(struct rcu_node *rnp)
>  	 * expedited grace period must boost all blocked tasks, including
>  	 * those blocking the pre-existing normal grace period.
>  	 */
> -	if (rnp->exp_tasks != NULL)
> -		tb = rnp->exp_tasks;
> -	else
> +	tb = rnp->exp_tasks;
> +	if (!tb)
>  		tb = rnp->boost_tasks;
> +	if (!tb) {
> +		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> +		return 0;
> +	}
>  
>  	/*
>  	 * We boost task t by manufacturing an rt_mutex that appears to

Well, it is one line shorter and arguably simpler.  It looks equivalent,
or am I missing something?  If equivalent, I will leave it to Frederic
and the others, since they likely must live with this longer than I do.

And my next step will be attempting to make rcutorture provoke that RCU
splat more often.  In the meantime, please feel free to consider this
to be my bug.

							Thanx, Paul

