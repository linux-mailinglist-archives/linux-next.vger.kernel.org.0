Return-Path: <linux-next+bounces-8958-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FFDC59392
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 18:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BF924A0373
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 17:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0AC33D6C2;
	Thu, 13 Nov 2025 17:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTWOZ2vq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E668B287245;
	Thu, 13 Nov 2025 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763053758; cv=none; b=RcKltbDr0fnl33tkei+udo2Qo+r+58mnJ/4DmwLAxuFwDkCzvmhGJltt7KUzbKOBcatahQFwnTGr7wNQKuKWT9j8HUl3xqk3m3TZKwt8Xz7hu2ehGw+iJaN8u5dNSHVYpaEJXUIJckgg3lNA2NNPMzw5Drptytn7w9fBBo3YQ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763053758; c=relaxed/simple;
	bh=KgOyzW1bsNWElKjpd7nBjy4HkR9UXD/Y7CgdTNhJdTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqynN8qz9zoP4ADoX7r53TmfDFm4l26Jn7vWZ4s6KSiOjrmKEiUer6O21iFf+MZl4T6aAXy1nECYnDE6ifkQsGsfQ5OgpEUgfffMeo/iUCcc17vW8fHUZn+Xc6LBP56nOzF+pM7t5MsDugGWygVkawsJ2GRDUuWuVHL8t3KAEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTWOZ2vq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947BDC4CEF1;
	Thu, 13 Nov 2025 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763053757;
	bh=KgOyzW1bsNWElKjpd7nBjy4HkR9UXD/Y7CgdTNhJdTY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=uTWOZ2vqZGjxvKr6fAC3v8eysVa/3uBKWQ+/27SGYB3n3KOi5k0K8jjmc1t3im3qt
	 brvTq0V9/iq17X6Ljy2vcorxIx0UOpiTDHLKrUSdzwc7OBH38+vAbnWjbVrPOXmA1n
	 oV4a22t/WgNW5BI23OEZOza8Le8La6Oivl4k7F5TeHh4cg05Rgpw29rq2nUhI/WgQ2
	 Zl0PZuWdbbImF3En90fxVCZrKTSMLYcNBRTC1UVMHq/qp0AlOup8JhH4NKQSnF3Hdg
	 ptdTUx41bL9k8DrnEUhiehroOn7UnYkZTHM311utFy8IxIOmpd0cQm9Y76KpU7Dpba
	 yaabcgQqcqs9g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2994BCE0B6A; Thu, 13 Nov 2025 09:09:17 -0800 (PST)
Date: Thu, 13 Nov 2025 09:09:17 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	d-tatianin@yandex-team.ru, john.ogness@linutronix.de,
	sfr@canb.auug.org.au, rostedt@goodmis.org, senozhatsky@chromium.org
Subject: Re: [BUG -next] WARNING: kernel/printk/printk_ringbuffer.c:1278 at
 get_data+0xb3/0x100
Message-ID: <571ad413-5fd2-496f-96f7-06ca95b1ec9a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a2f58837-2b29-4318-9c78-5905ab2e9d3b@paulmck-laptop>
 <aRWKq2KNKjxbXexA@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRWKq2KNKjxbXexA@pathway.suse.cz>

On Thu, Nov 13, 2025 at 08:37:15AM +0100, Petr Mladek wrote:
> Hi Paul,
> 
> first, thanks a lot for reporting the regression.
> 
> On Wed 2025-11-12 16:52:16, Paul E. McKenney wrote:
> > Hello!
> > 
> > Some rcutorture runs on next-20251110 hit the following error on x86:
> > 
> > WARNING: kernel/printk/printk_ringbuffer.c:1278 at get_data+0xb3/0x100, CPU#0: rcu_torture_sta/63
> > 
> > This happens in about 20-25% of the rcutorture runs, and is the
> > WARN_ON_ONCE(1) in the "else" clause of get_data().  There was no
> > rcutorture scenario that failed to reproduce this bug, so I am guessing
> > that the various .config files will not provide useful information.
> > Please see the end of this email for a representative splat, which is
> > usually rcutorture printing out something or another.  (Which, in its
> > defense, has worked just fine in the past.)
> > 
> > Bisection converged on this commit:
> > 
> > 67e1b0052f6b ("printk_ringbuffer: don't needlessly wrap data blocks around")
> > 
> > Reverting this commit suppressed (or at least hugely reduced the
> > probability of) the WARN_ON_ONCE().
> > 
> > The SRCU-T, SRCU-U, and TREE09 scenarios hit this most frequently at
> > about double the base rate, but are CONFIG_SMP=n builds.  The RUDE01
> > scenario was the most productive CONFIG_SMP=y scenario.  Reproduce as
> > follows, where "N" is the number of CPUs on your system divided by three,
> > rounded down:
> > 
> > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 5 --configs "N*RUDE01"
> > 
> > Or if you can do CONFIG_SMP=n, the following works, where "N" is the
> > number of CPUs on your system:
> > 
> > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 5 --configs "N*SRCU-T"
> > 
> > Or please tell me what debug I should enable on my runs.
> 
> The problem was reported by two test robots last week. It happens when
> a message fits exactly up to the last byte before the ring buffer gets
> wrapped for the first time. It is interesting that you have seen
> so frequently (in about 20-25% rcutorture runs).
> 
> Anyway, I have pushed a fix on Monday. It is the commit
> cc3bad11de6e0d601 ("printk_ringbuffer: Fix check of
> valid data size when blk_lpos overflows"), see
> https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/commit/?h=for-6.19&id=cc3bad11de6e0d6012460487903e7167d3e73957

Even better!  Thank you for the fix.

> Thanks a lot for so exhaustive report. And I am sorry that you
> probably spent a lot of time with it.

Well, actually, it was the first time that I turned "git bisect run"
loose on a full (and fully scripted) remote RCU run.  Each step involved
checking out 20 systems from the test group, building 20 kernels,
downloading the build products to each of the 20 systems, running each
of 286 guest OSes (15 each for 19 of the kernels and one instance of
the large one) spread over the 20 systems, waiting for them to finish,
uploading the test results, returning the systems to the test group,
analyzing them, and reporting either success (all runs succeeded) or
failure (at least one failure across the 286 kernels.  Then my grepping
through the run results directory to get you the failure rate.  Of course,
that failure rate indicates that I could have done the bisection more
quickly and with much less hardware, but that would have required me to
stop the other things I was doing and actually think about this.

Each step took somewhere between 90 minutes and two hours on a total of
1600 CPUs, and all ~11 bisection steps completed without my intervention.
Thus far, neither the test grid, the systems, the scripting, nor git
bisect have complained about my having wasted their time, but what with
AI they probably soon will do so.

I am somewhat surprised that it all went through without something
breaking, but I guess that we all get lucky from time to time.  ;-)

So not a lot of work for me, which is a good thing, given that I had
lots of other distractions, including another much more troublesome
bisection on ARM that actually found a bug that had not yet been fixed.
A trivial bug, admittedly, but such is life!

And again, thank you for so quickly fixing this!

							Thanx, Paul

