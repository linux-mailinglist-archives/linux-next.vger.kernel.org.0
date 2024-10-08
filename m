Return-Path: <linux-next+bounces-4143-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EFA994649
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 13:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34CF61F28BCC
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 11:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1902D18C00C;
	Tue,  8 Oct 2024 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kttiiXoY"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736A93C0C;
	Tue,  8 Oct 2024 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385919; cv=none; b=sDoLhHIekrzdH5qFd42Tr6OOpiyzwPGXPRXg8u05qMo71b/t4OwiwbBQGaHxpxvo8NwIsA3NTdZevLTmpXDpsQSbW/0R6BWGQqQrfSIsD66P4JLw1l0VsrLsZRDVwA8pKwZdl3U2zKtU+WYwHCbv65ZwoQuJ4TtjVXcbWyox1dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385919; c=relaxed/simple;
	bh=naL5B/VSTo91io3s6IeOCOzEAtjuPXeG0p40Aa+ePN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRgVsYt62emE+YhoT1feUUKwS36cje5DAqoQK6j+2a19g+9Wh9MxA5QDyRPVTr5Zo1zyByX1BoAVFWBBfy9s/z0RxsR87uu02pooirBjW9sKicubm0ulS9MsCAuf8jsnja6LTdGXDiBhyE1eZQmj0TiLte3XwLxG1jEkz20W46Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kttiiXoY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kMDTZwF7KT+Vr9VLbyVkqYrAge3SOzGmoRLC+FokyxU=; b=kttiiXoY46MsOp5E+WyIsuZJGl
	ysCb7gUxPT+AelusEN+3Blmq1lacVgaYHA2GAb55+xm/hgRvDa7ypWIDhrPbqmWuU8vACIXK1RaaF
	fy9nz0fb3QzdPmDhue4KFgM2YhKmkykkbgYTR8i2FVmY1hMjcR3rWAdFv6ixtr+8UR/61XYhkdDHO
	9C2bFbjWLzkP6UmQbpLEM+UZoRwVyWJFCbQu0c2TrvDKJkBV1zN8UT78bQHzcXppc6gDyZoXg/SZE
	LlFTyDHqYVSrumgmjwwCavqaCok3SwdW/L6M4mj6u9+b1dtqiW91eXKGnmfvNexGeHuLIQLXgFNUf
	6+93GdZQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1sy887-00000002ALL-0lhg;
	Tue, 08 Oct 2024 11:11:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6A89430057A; Tue,  8 Oct 2024 13:11:50 +0200 (CEST)
Date: Tue, 8 Oct 2024 13:11:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20241008111150.GD17263@noisy.programming.kicks-ass.net>
References: <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
 <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
 <20241003142240.GU5594@noisy.programming.kicks-ass.net>
 <7b14822a-ee98-4e46-9828-1e41b1ce76f3@paulmck-laptop>
 <20241003185037.GA5594@noisy.programming.kicks-ass.net>
 <20241004133532.GH33184@noisy.programming.kicks-ass.net>
 <9961cb9c-70f0-405b-b259-575586905ae0@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9961cb9c-70f0-405b-b259-575586905ae0@paulmck-laptop>

On Sun, Oct 06, 2024 at 01:44:53PM -0700, Paul E. McKenney wrote:

> With your patch, I got 24 failures out of 100 TREE03 runs of 18 hours
> each.  The failures were different, though, mostly involving boost
> failures in which RCU priority boosting didn't actually result in the
> low-priority readers getting boosted.  

Somehow I feel this is progress, albeit very minor :/

> There were also a number of "sched: DL replenish lagged too much"
> messages, but it looks like this was a symptom of the ftrace dump.
> 
> Given that this now involves priority boosting, I am trying 400*TREE03
> with each guest OS restricted to four CPUs to see if that makes things
> happen more quickly, and will let you know how this goes.
> 
> Any other debug I should apply?

The sched_pi_setprio tracepoint perhaps?

I've read all the RCU_BOOST and rtmutex code (once again), and I've been
running pi_stress with --sched id=low,policy=other to ensure the code
paths in question are taken. But so far so very nothing :/

(Noting that both RCU_BOOST and PI futexes use the same rt_mutex / PI API)

You know RCU_BOOST better than me.. then again, it is utterly weird this
is apparently affected. I've gotta ask, a kernel with my patch on and
additionally flipping kernel/sched/features.h:SCHED_FEAT(DELAY_DEQUEUE,
false) functions as expected?


One very minor thing I noticed while I read the code, do with as you
think best...

diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index 1c7cbd145d5e..95061119653d 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -1071,10 +1071,6 @@ static int rcu_boost(struct rcu_node *rnp)
 	 * Recheck under the lock: all tasks in need of boosting
 	 * might exit their RCU read-side critical sections on their own.
 	 */
-	if (rnp->exp_tasks == NULL && rnp->boost_tasks == NULL) {
-		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
-		return 0;
-	}
 
 	/*
 	 * Preferentially boost tasks blocking expedited grace periods.
@@ -1082,10 +1078,13 @@ static int rcu_boost(struct rcu_node *rnp)
 	 * expedited grace period must boost all blocked tasks, including
 	 * those blocking the pre-existing normal grace period.
 	 */
-	if (rnp->exp_tasks != NULL)
-		tb = rnp->exp_tasks;
-	else
+	tb = rnp->exp_tasks;
+	if (!tb)
 		tb = rnp->boost_tasks;
+	if (!tb) {
+		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
+		return 0;
+	}
 
 	/*
 	 * We boost task t by manufacturing an rt_mutex that appears to

