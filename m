Return-Path: <linux-next+bounces-4789-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A33D19C9191
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 19:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 120C2B2BC64
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 18:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF02199FD0;
	Thu, 14 Nov 2024 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvBB1N8s"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D83199E92;
	Thu, 14 Nov 2024 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731608173; cv=none; b=AITjp12qT6UAzKY7ok8hPME+RIaStYcyzdw5aiPpOSXpnPqmXoKnMYELozDzFevkgfl6TSJCdygjwcW4/WqEBzUA6SOGnltj/4yaFURj8j4ELxxeDqovvcA0KMbExXv+juOoMLS1rgI+sAFJH4LpNiiOKOIHKNB8178XnU0A/9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731608173; c=relaxed/simple;
	bh=LKiC482/mkSPjMpYS7rVLUPrc3QBSwoQJqPmsr2UmZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Er6xO8WKo0vmozcydA0ogkRL4nGgwuXQ1PNQr2y+L/caMN6RKqmE3d7uz1TQkqKrE4t6IQaJX2z5A5t2ATQZ8wqnbAPAkuhQHRUHRh6a4D+fV4YM5Bhbc7x1KDoHMAYUwANpr9O0Sbk2wVrRGr4BtFiMUKlOSF5Low/9yypdWac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvBB1N8s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3403EC4CED5;
	Thu, 14 Nov 2024 18:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731608173;
	bh=LKiC482/mkSPjMpYS7rVLUPrc3QBSwoQJqPmsr2UmZ4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=tvBB1N8sAHR/h5Qo6H/hw7kxDuIi978WkfnA/s7JaDrNgt4Q5oGmo1r+v6ZdLZeRN
	 MEqWqV/32KS+w++02Pxv+LkAkimwC5cyFBOJwzRh3ietoH+SwLfs590/Pc+s8k6P4c
	 qC9NYHQUbxGTiWaOPeEcbnEyNqmFIgnL6cnkCFeNTl1m4LmCYqt5jHM9wSW6ytUHvo
	 wkvqoZ2a9DESkFCSS/Mu8d0bRNy5+gLRfQaVb7YRd/KCzDNShrpKBU6vZGUV5ur37S
	 0cOh5XB77I9OTXUeGqISsZFNGBF4jGi0VwWKKxz3fHykbvF1TdlZ42HJwJ5bT4WlXW
	 so7io7bzkXu2w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C18AFCE0717; Thu, 14 Nov 2024 10:16:12 -0800 (PST)
Date: Thu, 14 Nov 2024 10:16:12 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Tomas Glozar <tglozar@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <6e3fce44-1072-4720-bf91-33bb22ebbd21@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <xhsmhed50vplj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
 <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop>
 <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
 <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>
 <35e44f60-0a2f-49a7-b44b-c6537544a888@paulmck-laptop>
 <fe2262ff-2c3d-495a-8ebb-c34485cb62a2@paulmck-laptop>
 <b9064ed8-387d-47ce-ad0a-7642ad180fc3@paulmck-laptop>
 <7cdc0f04-819d-429c-9a2c-9ad25d85db55@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cdc0f04-819d-429c-9a2c-9ad25d85db55@paulmck-laptop>

On Mon, Oct 21, 2024 at 12:25:41PM -0700, Paul E. McKenney wrote:
> On Mon, Oct 14, 2024 at 11:55:05AM -0700, Paul E. McKenney wrote:

[ . . . ]

> > But no big wins thus far, so this will be a slow process.  My current test
> > disables CPU hotplug.  I will be disabling other things in the hope of
> > better identifying the code paths that should be placed under suspicion.

The "this will be a slow process" was no joke...

> Disabling CPU hotplug seems to make the problem go away (though
> all I can really say is that I am 99% confident that it reduces the
> problem's incidence by at least a factor of two).  This problem affects
> non-preemptible kernels and non-preemptible RCU, though it is possible
> that use of the latter reduces the failure rate (which is of course *not*
> what you want for testing).
> 
> A number of experiments failed to significantly/usefully increase the
> failure rate.
> 
> The problem does not seem to happen on straight normal call_rcu()
> grace periods (rcutorture.gp_normal=1), synchronize_rcu() grace periods
> (rcutorture.gp_sync=1), or synchronize_rcu_expedited() grace periods.
> Of course, my reproduction rate is still low enough that I might be
> fooled here.
> 
> However, the problem does occur reasonably often on polled grace periods
> (rcutorture.gp_poll=1 rcutorture.gp_poll_exp=1 rcutorture.gp_poll_full=1
> rcutorture.gp_poll_exp_full=1).  This might be a bug in the polling
> code itself, or it might be because polling grace periods do not incur
> callback and/or wakeup delays (as in the bug might still be in the
> underlying grace-period computation and polling makes it more apparent).
> This also appears to have made the problem happen more frequently,
> but not enough data to be sure yet.
> 
> Currently, rcutorture does millisecond-scale waits of duration randomly
> chosen between zero and 15 milliseconds.  I have started a run with
> microsecond-scale waits of duration randomly chosen between zero and
> 128 microseconds.  Here is hoping that this will cause the problem to
> reproduce more quickly, and I will know more this evening, Pacific Time.

Well, that evening was a long time ago, but here finally is an update.

After some time, varying the wait duration between zero and 16
microseconds with nanosecond granularity pushed the rate up to between
10 and 20 per hour.  This allowed me to find one entertaining bug,
whose fix may be found here in my -rcu tree:

9dfca26bcbc8 ("rcu: Make expedited grace periods wait for initialization")

The fix ensures that an expedited grace period is fully initialized before
honoring any quiescent-state reports, thus avoiding a failure scenario
in which one of a pair of quiescent-state reports could "leak" into
the next expedited grace period.  But only if a concurrent CPU-hotplug
operation shows up at just the wrong time.

There are also a couple of other minor fixes of things like needless
lockless accesses:

6142841a2389 ("rcu: Make rcu_report_exp_cpu_mult() caller acquire lock")
dd8104928722 ("rcu: Move rcu_report_exp_rdp() setting of ->cpu_no_qs.b.exp under lock")

Plus quite a few additional debug checks.

So problem solved, right?

Wrong!!!

Those changes at best reduced the bug rate by about 10%.  So I am still
beating on this thing.  But you will be happy (or more likely not)
to learn that the enqueue_dl_entity() splats that I was chasing when
starting on this bug still occasionally make their presence known.  ;-)

Added diagnostics pushed the bug rate down to about four per hours,
which isn't quite as nice as between 10 and 20 per hour, but is still
something I can work with.

Back to beating on it.  More info than anyone needs is available here:

https://docs.google.com/document/d/1-JQ4QYF1qid0TWSLa76O1kusdhER2wgm0dYdwFRUzU8/edit?usp=sharing

							Thanx, Paul

