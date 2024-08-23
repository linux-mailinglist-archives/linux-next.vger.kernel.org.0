Return-Path: <linux-next+bounces-3401-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD495C6EC
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2024 09:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7D41C219F3
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2024 07:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05D613D893;
	Fri, 23 Aug 2024 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AcjVy9te"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAC413D52A;
	Fri, 23 Aug 2024 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399245; cv=none; b=Pb/ShpYNLJHy7jHVrpmhfn6WxtBRR0pUXlR78ZjU+N3UyAhJ7MHBvQPFbrI44ghc2ZDUpoj8fVNKYqLcTU3F20Ue14DayyrmICatHDDkpCycuhZzKfgUoyJsY59uyqViKI1o/YnDkg5EVCITIJSeBhHGNc21jPC6bWuMhbpViiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399245; c=relaxed/simple;
	bh=ali+EYf3Az2+rdIPAe7cKFNum9xsfrt8WtHHSqAGzTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uc3nMHHUh7K1VkEe9+nFARreEwF80K4p6bz8GxYVBYO77u825x+UuxwLF9TdycI1bAruBn4KOPzKJvlD3nk6jxHy/iup4STY9DwA0HMJtW1/oNQ+VseCV4CzyriQO9nZTnPacfgtcFtnVBMZAfn9V9/sPQ+oBhXcrjlxzXlxsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AcjVy9te; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FcDDuXU6d5FK49Y6NszEDy4UAdyd2ltQ14LSgKv6roI=; b=AcjVy9teTh4+b7CUylz3tnonrN
	E96gZStS0JRLskHHA6ecZDTPCcPYBFVMbDRZDPobRvCLLv/djAlt5kGMW4y2R4hgTea3kVCUZ3oBy
	cO6Rml/Ol1Sn8KvcH+CRgaHwC9newgjh2BaYDLrmy7ff84GJR2EqEKaq5o0NBNaHa332fMfl5GRPP
	BMvJYn9FPygDROLXnWnMzPxFKxLX/8X8jW9P4Ymxz0bY2vF66DUBfJ77Zr3SS2eqodQtwIzJa0OFQ
	KD8a8xcGniY+Xt6i2vR57zJ6oAAwbl+DZfRRWc6N5DOinBD8KM7J0Dn5dW6BJGUJ72nUCblD2PrX7
	5XqwwLIg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shP0k-0000000A66a-0Q5y;
	Fri, 23 Aug 2024 07:47:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B7A50300642; Fri, 23 Aug 2024 09:47:05 +0200 (CEST)
Date: Fri, 23 Aug 2024 09:47:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20240823074705.GB12053@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>

On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:

> 2e0199df252a ("sched/fair: Prepare exit/cleanup paths for delayed_dequeue")
> 
> The preceding commit is very reliable.
> 
> Only instead of (or maybe as well as?) introducing the dequeue_rt_stack()
> bug, the 2e0199df252a commit introduced a build bug:
> 
> ------------------------------------------------------------------------
> 
> In file included from kernel/sched/fair.c:54:
> kernel/sched/fair.c: In function ‘switched_from_fair’:
> kernel/sched/sched.h:2154:58: error: ‘__SCHED_FEAT_DELAY_ZERO’ undeclared (first use in this function); did you mean ‘__SCHED_FEAT_LATENCY_WARN’?
>  2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
>       |                                                          ^~~~~~~~~~~~~
> kernel/sched/fair.c:12878:21: note: in expansion of macro ‘sched_feat’
> 12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
>       |                     ^~~~~~~~~~
> kernel/sched/sched.h:2154:58: note: each undeclared identifier is reported only once for each function it appears in
>  2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
>       |                                                          ^~~~~~~~~~~~~
> kernel/sched/fair.c:12878:21: note: in expansion of macro ‘sched_feat’
> 12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
>       |                     ^~~~~~~~~~
> 

Oh gawd, last minute back-merges :/

Does the below help any? That's more or less what it was before Valentin
asked me why it was weird like that :-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6be618110885..5757dd50b02f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13107,7 +13107,6 @@ static void switched_from_fair(struct rq *rq, struct task_struct *p)
 	 * and we cannot use DEQUEUE_DELAYED.
 	 */
 	if (p->se.sched_delayed) {
-		dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP);
 		p->se.sched_delayed = 0;
 		p->se.rel_deadline = 0;
 		if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)

