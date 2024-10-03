Return-Path: <linux-next+bounces-4090-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D857498F67D
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 20:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5626B1F228C0
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 18:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8A41A726D;
	Thu,  3 Oct 2024 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EHO/5pAv"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C8224EA;
	Thu,  3 Oct 2024 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727981456; cv=none; b=g66eCNZdYf3YV4Z3jgiDFldycmHKKVnym9RzGlS31UGTxlSai8v5zRxjnWWHiD52Xg+sfvW4eFO+702Q9bWpAbCS0wjnnSqbFC39BJ5pbhz9OvLPTOz8lgZ5JLov+jubJiIMKfM7jEHa6zPQLd3Rf2qU4Z/Xy+tvjq4mXe6ajKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727981456; c=relaxed/simple;
	bh=quxyVXjNuuinY3V3kcGYmJyr3GvTJZfpOErWFukmuRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7Y4vnx/8ke3e5aca2+ow//U3Uki2kU5OZUSPHIf6UYxaCm4oUePktP0F4ZKClz3Sefr4rO7bia2NjsBVNcxgyJt3jpFnLK253JXb+csy/Q7ly9KSN1QZeHKvrBByse+6q9Ssch1Y0Kjimdm/Qooc7+dsoOIrYGI4ePceXnivvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EHO/5pAv; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cWDmkiK/2TE+gBHEBXaiwvshGopbfLophFDLhJIDYAU=; b=EHO/5pAvugBq8M/w5dUWLXZaMx
	2LhMEa9EFRFp5I2oJfSQdz5dzIcxkPIitcr/IMpXxrS9GVTJPTWlDeWDS5iCGLN3ZobAgWpMbE1P+
	tR3Lmcszt99tGh6mtPxfegHWb0g7hkyr6HRYAqLEMNiaj4Z/dGW/xzgSb6sge2crNVSeqU8BmOIJo
	BwQRn7ufyZzQQX2yljz8pU9kCTyvHpMl1SHj9zjJvTxg6uzMwouLSJt2/tTk7ci30e0kRYbIEsfzp
	d0Ggtfd6TPQe180GtRzhc860SgvDEmpsvxtq97k9llmXXaWJPat0inN9BEZOpLhtQfZAP5BiLBpMZ
	Al1DKlvA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1swQuM-00000003jRm-30Eb;
	Thu, 03 Oct 2024 18:50:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 812A830083E; Thu,  3 Oct 2024 20:50:37 +0200 (CEST)
Date: Thu, 3 Oct 2024 20:50:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20241003185037.GA5594@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
 <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
 <20241003142240.GU5594@noisy.programming.kicks-ass.net>
 <7b14822a-ee98-4e46-9828-1e41b1ce76f3@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b14822a-ee98-4e46-9828-1e41b1ce76f3@paulmck-laptop>

On Thu, Oct 03, 2024 at 09:04:30AM -0700, Paul E. McKenney wrote:
> On Thu, Oct 03, 2024 at 04:22:40PM +0200, Peter Zijlstra wrote:
> > On Thu, Oct 03, 2024 at 05:45:47AM -0700, Paul E. McKenney wrote:
> > 
> > > I ran 100*TREE03 for 18 hours each, and got 23 instances of *something*
> > > happening (and I need to suppress stalls on the repeat).  One of the
> > > earlier bugs happened early, but sadly not this one.
> > 
> > Damn, I don't have the amount of CPU hours available you mention in your
> > later email. I'll just go up the rounds to 20 minutes and see if
> > something wants to go bang before I have to shut down the noise
> > pollution for the day...
> 
> Indeed, this was one reason I was soliciting debug patches.  ;-)

Sooo... I was contemplating if something like the below might perhaps
help some. It's a bit of a mess (I'll try and clean up if/when it
actually proves to work), but it compiles and survives a hand full of 1m
runs.

I'll try and give it more runs tomorrow when I can power up the big
machines again -- unless you've already told me it's crap by then :-)

---
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 43e453ab7e20..1fe850788195 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7010,20 +7010,20 @@ int default_wake_function(wait_queue_entry_t *curr, unsigned mode, int wake_flag
 }
 EXPORT_SYMBOL(default_wake_function);
 
-void __setscheduler_prio(struct task_struct *p, int prio)
+const struct sched_class *__setscheduler_class(struct task_struct *p, int prio)
 {
 	if (dl_prio(prio))
-		p->sched_class = &dl_sched_class;
-	else if (rt_prio(prio))
-		p->sched_class = &rt_sched_class;
+		return &dl_sched_class;
+
+	if (rt_prio(prio))
+		return &rt_sched_class;
+
 #ifdef CONFIG_SCHED_CLASS_EXT
-	else if (task_should_scx(p))
-		p->sched_class = &ext_sched_class;
+	if (task_should_scx(p))
+		return &ext_sched_class;
 #endif
-	else
-		p->sched_class = &fair_sched_class;
 
-	p->prio = prio;
+	return &fair_sched_class;
 }
 
 #ifdef CONFIG_RT_MUTEXES
@@ -7069,7 +7069,7 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
 {
 	int prio, oldprio, queued, running, queue_flag =
 		DEQUEUE_SAVE | DEQUEUE_MOVE | DEQUEUE_NOCLOCK;
-	const struct sched_class *prev_class;
+	const struct sched_class *prev_class, *next_class;
 	struct rq_flags rf;
 	struct rq *rq;
 
@@ -7127,6 +7127,11 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
 		queue_flag &= ~DEQUEUE_MOVE;
 
 	prev_class = p->sched_class;
+	next_class = __setscheduler_class(p, prio);
+
+	if (prev_class != next_class && p->se.sched_delayed)
+		dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED | DEQUEUE_NOCLOCK);
+
 	queued = task_on_rq_queued(p);
 	running = task_current(rq, p);
 	if (queued)
@@ -7164,7 +7169,9 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
 			p->rt.timeout = 0;
 	}
 
-	__setscheduler_prio(p, prio);
+	p->sched_class = next_class;
+	p->prio = prio;
+
 	check_class_changing(rq, p, prev_class);
 
 	if (queued)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ab497fafa7be..c157d4860a3b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13177,22 +13177,6 @@ static void attach_task_cfs_rq(struct task_struct *p)
 static void switched_from_fair(struct rq *rq, struct task_struct *p)
 {
 	detach_task_cfs_rq(p);
-	/*
-	 * Since this is called after changing class, this is a little weird
-	 * and we cannot use DEQUEUE_DELAYED.
-	 */
-	if (p->se.sched_delayed) {
-		/* First, dequeue it from its new class' structures */
-		dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_SLEEP);
-		/*
-		 * Now, clean up the fair_sched_class side of things
-		 * related to sched_delayed being true and that wasn't done
-		 * due to the generic dequeue not using DEQUEUE_DELAYED.
-		 */
-		finish_delayed_dequeue_entity(&p->se);
-		p->se.rel_deadline = 0;
-		__block_task(rq, p);
-	}
 }
 
 static void switched_to_fair(struct rq *rq, struct task_struct *p)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b1c3588a8f00..fba524c81c63 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3797,7 +3797,7 @@ static inline int rt_effective_prio(struct task_struct *p, int prio)
 
 extern int __sched_setscheduler(struct task_struct *p, const struct sched_attr *attr, bool user, bool pi);
 extern int __sched_setaffinity(struct task_struct *p, struct affinity_context *ctx);
-extern void __setscheduler_prio(struct task_struct *p, int prio);
+extern const struct sched_class *__setscheduler_class(struct task_struct *p, int prio);
 extern void set_load_weight(struct task_struct *p, bool update_load);
 extern void enqueue_task(struct rq *rq, struct task_struct *p, int flags);
 extern bool dequeue_task(struct rq *rq, struct task_struct *p, int flags);
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index aa70beee9895..0470bcc3d204 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -529,7 +529,7 @@ int __sched_setscheduler(struct task_struct *p,
 {
 	int oldpolicy = -1, policy = attr->sched_policy;
 	int retval, oldprio, newprio, queued, running;
-	const struct sched_class *prev_class;
+	const struct sched_class *prev_class, *next_class;
 	struct balance_callback *head;
 	struct rq_flags rf;
 	int reset_on_fork;
@@ -706,6 +706,12 @@ int __sched_setscheduler(struct task_struct *p,
 			queue_flags &= ~DEQUEUE_MOVE;
 	}
 
+	prev_class = p->sched_class;
+	next_class = __setscheduler_class(p, newprio);
+
+	if (prev_class != next_class && p->se.sched_delayed)
+		dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED | DEQUEUE_NOCLOCK);
+
 	queued = task_on_rq_queued(p);
 	running = task_current(rq, p);
 	if (queued)
@@ -713,11 +719,10 @@ int __sched_setscheduler(struct task_struct *p,
 	if (running)
 		put_prev_task(rq, p);
 
-	prev_class = p->sched_class;
-
 	if (!(attr->sched_flags & SCHED_FLAG_KEEP_PARAMS)) {
 		__setscheduler_params(p, attr);
-		__setscheduler_prio(p, newprio);
+		p->sched_class = next_class;
+		p->prio = newprio;
 	}
 	__setscheduler_uclamp(p, attr);
 	check_class_changing(rq, p, prev_class);

