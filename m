Return-Path: <linux-next+bounces-4973-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 574829F39F2
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 20:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81914161645
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 19:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4D3208960;
	Mon, 16 Dec 2024 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbITsteI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70902207E16;
	Mon, 16 Dec 2024 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377786; cv=none; b=B2I/uGsSOBHCFL5zVXtBFmS5uB3q/TZX5zPQ50MM3TFjIGWiHe3NDVD/A5uubFr8+fuWbej56k1GZsx73La855f13LrXeY4ANEu99FGVga6EQKQhyV2uayIhHsykDwNRK9N8a5l+6lsTh7f9A9t6Tsj+Z+1WOpk+A0etTDg7mxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377786; c=relaxed/simple;
	bh=U9bfCkS/0q3MA1aKLhEIJb1SYJ3ImwdyM/ojMPXuNj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usleIErBqow0LfjPZ4mfsTNc+UkxOih0qXiokHARtl9uuEGbNldE68tGMuYLmaERl/Lx6ToYWdzMDlnolJCG7kObn4hykm11vk+aAbGguDrhXSTpZD8KuMe2FtCW8++e2DTWiybjq/ds6rsGABjYM2b+0C27ACUXDh0s2yqMUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbITsteI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA341C4CED0;
	Mon, 16 Dec 2024 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734377785;
	bh=U9bfCkS/0q3MA1aKLhEIJb1SYJ3ImwdyM/ojMPXuNj8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=MbITsteI0AMc/+4cSFwKmbxDQlDXTT2ZXkgyW+pjNWadNhAOfs2W0/RkPvFdd9nzZ
	 /rew73W2GC6FN4mvJcr0T7TOmX/6DPGpiBjz4VofR/BM7KpuD0NApI4mM3sV+Zdn5c
	 jvSjITXbsbmGg1mVCND/qAf15/2sk5y/otSRdL0Ly1M571bI/P3g/8efjLSfrTPvEd
	 eJy3SZBFH46QwUjQrAUdZf70PSZ0qgh1nQzL9Hx14K101SC5FMmRKYF5EPuKHzn/a/
	 /t6ITMyRNjN6nKVWlRhyQDsyd0OE+0x8FZpV4nVSPzmCmy6YJJBcEgajZ8140fnvPj
	 PrIXkva2MHylw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 640D6CE0BC5; Mon, 16 Dec 2024 11:36:25 -0800 (PST)
Date: Mon, 16 Dec 2024 11:36:25 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Tomas Glozar <tglozar@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <a82d8961-153a-4fb8-9c71-3bdf00f2e0f3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop>
 <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
 <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>
 <35e44f60-0a2f-49a7-b44b-c6537544a888@paulmck-laptop>
 <fe2262ff-2c3d-495a-8ebb-c34485cb62a2@paulmck-laptop>
 <b9064ed8-387d-47ce-ad0a-7642ad180fc3@paulmck-laptop>
 <7cdc0f04-819d-429c-9a2c-9ad25d85db55@paulmck-laptop>
 <6e3fce44-1072-4720-bf91-33bb22ebbd21@paulmck-laptop>
 <2cd70642-86de-4b26-87c2-94bde7441ce8@paulmck-laptop>
 <CAP4=nvTqnABSzYXiDfizoaeviqLtC87jG1fnGH4XFV+xQGn-2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP4=nvTqnABSzYXiDfizoaeviqLtC87jG1fnGH4XFV+xQGn-2Q@mail.gmail.com>

On Mon, Dec 16, 2024 at 03:38:20PM +0100, Tomas Glozar wrote:
> ne 15. 12. 2024 v 19:41 odesílatel Paul E. McKenney <paulmck@kernel.org> napsal:
> >
> > And the fix for the TREE03 too-short grace periods is finally in, at
> > least in prototype form:
> >
> > https://lore.kernel.org/all/da5065c4-79ba-431f-9d7e-1ca314394443@paulmck-laptop/
> >
> > Or this commit on -rcu:
> >
> > 22bee20913a1 ("rcu: Fix get_state_synchronize_rcu_full() GP-start detection")
> >
> > This passes more than 30 hours of 400 concurrent instances of rcutorture's
> > TREE03 scenario, with modifications that brought the bug reproduction
> > rate up to 50 per hour.  I therefore have strong reason to believe that
> > this fix is a real fix.
> >
> > With this fix in place, a 20-hour run of 400 concurrent instances
> > of rcutorture's TREE03 scenario resulted in 50 instances of the
> > enqueue_dl_entity() splat pair.  One (untrimmed) instance of this pair
> > of splats is shown below.
> >
> > You guys did reproduce this some time back, so unless you tell me
> > otherwise, I will assume that you have this in hand.  I would of course
> > be quite happy to help, especially with adding carefully chosen debug
> > (heisenbug and all that) or testing of alleged fixes.
> >
> 
> The same splat was recently reported to LKML [1] and a patchset was
> sent and merged into tip/sched/urgent that fixes a few bugs around
> double-enqueue of the deadline server [2]. I'm currently re-running
> TREE03 with those patches, hoping they will also fix this issue.

Thank you very much!

An initial four-hour test of 400 instances of an enhanced TREE03 ran
error-free.  I would have expected about 10 errors, so this gives me
99.9+% confidence that the patches improved things at least a little
bit and 99% confidence that these patches reduced the error rate by at
least a factor of two.

I am starting an overnight run.  If that completes without error, this
will provide 99% confidence that these patches reduced the error rate
by at least an order of magnitude.

> Also, last week I came up with some more extensive tracing, which
> showed dl_server_update and dl_server_start happening right after each
> other, apparently during the same run of enqueue_task_fair (see
> below). I'm currently looking into that to figure out whether the
> mechanism shown by the trace is fixed by the patchset.

And for whatever it is worth, judging by my console output, I am seeing
something similar.

							Thanx, Paul

> --------------------------
> 
> rcu_tort-148       1dN.3. 20531758076us : dl_server_stop <-dequeue_entities
> rcu_tort-148       1dN.2. 20531758076us : dl_server_queue: cpu=1
> level=2 enqueue=0
> rcu_tort-148       1dN.3. 20531758078us : <stack trace>
>  => trace_event_raw_event_dl_server_queue
>  => dl_server_stop
>  => dequeue_entities
>  => dequeue_task_fair
>  => __schedule
>  => schedule
>  => schedule_hrtimeout_range_clock
>  => torture_hrtimeout_us
>  => rcu_torture_writer
>  => kthread
>  => ret_from_fork
>  => ret_from_fork_asm
> rcu_tort-148       1dN.3. 20531758095us : dl_server_update <-update_curr
> rcu_tort-148       1dN.3. 20531758097us : dl_server_update <-update_curr
> rcu_tort-148       1dN.2. 20531758101us : dl_server_queue: cpu=1
> level=2 enqueue=1
> rcu_tort-148       1dN.3. 20531758103us : <stack trace>
> rcu_tort-148       1dN.2. 20531758104us : dl_server_queue: cpu=1
> level=1 enqueue=1
> rcu_tort-148       1dN.3. 20531758106us : <stack trace>
> rcu_tort-148       1dN.2. 20531758106us : dl_server_queue: cpu=1
> level=0 enqueue=1
> rcu_tort-148       1dN.3. 20531758108us : <stack trace>
>  => trace_event_raw_event_dl_server_queue
>  => rb_insert_color
>  => enqueue_dl_entity
>  => update_curr_dl_se
>  => update_curr
>  => enqueue_task_fair
>  => enqueue_task
>  => activate_task
>  => attach_task
>  => sched_balance_rq
>  => sched_balance_newidle.constprop.0
>  => pick_next_task_fair
>  => __schedule
>  => schedule
>  => schedule_hrtimeout_range_clock
>  => torture_hrtimeout_us
>  => rcu_torture_writer
>  => kthread
>  => ret_from_fork
>  => ret_from_fork_asm
> rcu_tort-148       1dN.3. 20531758110us : dl_server_start <-enqueue_task_fair
> rcu_tort-148       1dN.2. 20531758110us : dl_server_queue: cpu=1
> level=2 enqueue=1
> rcu_tort-148       1dN.3. 20531760934us : <stack trace>
>  => trace_event_raw_event_dl_server_queue
>  => enqueue_dl_entity
>  => dl_server_start
>  => enqueue_task_fair
>  => enqueue_task
>  => activate_task
>  => attach_task
>  => sched_balance_rq
>  => sched_balance_newidle.constprop.0
>  => pick_next_task_fair
>  => __schedule
>  => schedule
>  => schedule_hrtimeout_range_clock
>  => torture_hrtimeout_us
>  => rcu_torture_writer
>  => kthread
>  => ret_from_fork
>  => ret_from_fork_asm
> 
> [1] - https://lore.kernel.org/lkml/571b2045-320d-4ac2-95db-1423d0277613@ovn.org/
> [2] - https://lore.kernel.org/lkml/20241213032244.877029-1-vineeth@bitbyteword.org/
> 
> > Just let me know!
> >
> >                                                         Thanx, Paul
> 
> Tomas
> 

