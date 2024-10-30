Return-Path: <linux-next+bounces-4544-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D09B7057
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 00:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 017161F21D1A
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 23:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6D11E376B;
	Wed, 30 Oct 2024 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VopkGahq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603281BD9EA;
	Wed, 30 Oct 2024 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730329860; cv=none; b=AYvxQgJf2xkOb5Ao7KlW44Qm7F0vsaF415o78tdWnk1bvOmVHuY349Ooyy6D1TUJtolZWi8f+r51AIVJ+XIO/L+u7OJ9X3Rrqp1AmtaBycT+1OAdcFXgRvZe+RxiuDbOb5Gxnn6UlW2OBZmwGXr4X8gKgJpuPIv6X6rm4eknA5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730329860; c=relaxed/simple;
	bh=NobT7qYPgQUDHyh4P5cTe3irZqg7DEUQJbR+GUeX5ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Icr2CowZgCn6Ho9gK/hkXyNfw2Z3kApIAeYd+ia3iygb7Y951T3Wshlstanni7nK6Zqv3d4KwUsUyobQkMv1/5oP98QxJiymTzLgn1jAFtmvwRnf+lQux2vUOhGzGg5ILk6cXMW4rPo2aZP40RVAh+Ld6y+JLT5SwOWGCycEN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VopkGahq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEFCC4CECE;
	Wed, 30 Oct 2024 23:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730329860;
	bh=NobT7qYPgQUDHyh4P5cTe3irZqg7DEUQJbR+GUeX5ac=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=VopkGahqXCNlTpf7AI+7gIpoBrYuq5ssZSU6uX7UiPnzc+PKC3X1lD6A0oOUF1hTG
	 atTVsEIE4NoncDheeKu3q6HeLfIqW42kgs2C6u6hsNiKRcfBN9BLc1N7YNSIIZrx/b
	 lIA25iKdM8Lx9H6QByYehMSl4DlZReZ1aHCd5u6pjCju1Jq80p4ic5TDonx53vZQ4A
	 4TXtwICbCJn2D0sjy2ALwSr61qLqhpP1D4ZCXseKUEBRwyhmUHGdV4TFQuKMQ0OAfI
	 QG2Bj/OP+4xoLAapTH//iQaowQ+XgHS1tODxxNrnV1ecO1j/92QCCYMBrWczW+SnAN
	 k7JPIztZkQOnw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 82F26CE0864; Wed, 30 Oct 2024 16:10:58 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:10:58 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, sfr@canb.auug.org.au, bigeasy@linutronix.de,
	longman@redhat.com, boqun.feng@gmail.com, cl@linux.com,
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
	akpm@linux-foundation.org
Subject: Re: [BUG] -next lockdep invalid wait context
Message-ID: <66a745bb-d381-471c-aeee-3800a504f87d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
 <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
 <ZyK0YPgtWExT4deh@elver.google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyK0YPgtWExT4deh@elver.google.com>

On Wed, Oct 30, 2024 at 11:34:08PM +0100, Marco Elver wrote:
> On Wed, Oct 30, 2024 at 10:48PM +0100, Vlastimil Babka wrote:
> > On 10/30/24 22:05, Paul E. McKenney wrote:
> > > Hello!
> > 
> > Hi!
> > 
> > > The next-20241030 release gets the splat shown below when running
> > > scftorture in a preemptible kernel.  This bisects to this commit:
> > > 
> > > 560af5dc839e ("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING")
> > > 
> > > Except that all this is doing is enabling lockdep to find the problem.
> > > 
> > > The obvious way to fix this is to make the kmem_cache structure's
> > > cpu_slab field's ->lock be a raw spinlock, but this might not be what
> > > we want for real-time response.
> > 
> > But it's a local_lock, not spinlock and it's doing local_lock_irqsave(). I'm
> > confused what's happening here, the code has been like this for years now.
> > 
> > > This can be reproduced deterministically as follows:
> > > 
> > > tools/testing/selftests/rcutorture/bin/kvm.sh --torture scf --allcpus --duration 2 --configs PREEMPT --kconfig CONFIG_NR_CPUS=64 --memory 7G --trust-make --kasan --bootargs "scftorture.nthreads=64 torture.disable_onoff_at_boot csdlock_debug=1"
> > > 
> > > I doubt that the number of CPUs or amount of memory makes any difference,
> > > but that is what I used.
> > > 
> > > Thoughts?
> > > 
> > > 							Thanx, Paul
> > > 
> > > ------------------------------------------------------------------------
> > > 
> > > [   35.659746] =============================
> > > [   35.659746] [ BUG: Invalid wait context ]
> > > [   35.659746] 6.12.0-rc5-next-20241029 #57233 Not tainted
> > > [   35.659746] -----------------------------
> > > [   35.659746] swapper/37/0 is trying to lock:
> > > [   35.659746] ffff8881ff4bf2f0 (&c->lock){....}-{3:3}, at: put_cpu_partial+0x49/0x1b0
> > > [   35.659746] other info that might help us debug this:
> > > [   35.659746] context-{2:2}
> > > [   35.659746] no locks held by swapper/37/0.
> > > [   35.659746] stack backtrace:
> > > [   35.659746] CPU: 37 UID: 0 PID: 0 Comm: swapper/37 Not tainted 6.12.0-rc5-next-20241029 #57233
> > > [   35.659746] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
> > > [   35.659746] Call Trace:
> > > [   35.659746]  <IRQ>
> > > [   35.659746]  dump_stack_lvl+0x68/0xa0
> > > [   35.659746]  __lock_acquire+0x8fd/0x3b90
> > > [   35.659746]  ? start_secondary+0x113/0x210
> > > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > > [   35.659746]  lock_acquire+0x19b/0x520
> > > [   35.659746]  ? put_cpu_partial+0x49/0x1b0
> > > [   35.659746]  ? __pfx_lock_acquire+0x10/0x10
> > > [   35.659746]  ? __pfx_lock_release+0x10/0x10
> > > [   35.659746]  ? lock_release+0x20f/0x6f0
> > > [   35.659746]  ? __pfx_lock_release+0x10/0x10
> > > [   35.659746]  ? lock_release+0x20f/0x6f0
> > > [   35.659746]  ? kasan_save_track+0x14/0x30
> > > [   35.659746]  put_cpu_partial+0x52/0x1b0
> > > [   35.659746]  ? put_cpu_partial+0x49/0x1b0
> > > [   35.659746]  ? __pfx_scf_handler_1+0x10/0x10
> > > [   35.659746]  __flush_smp_call_function_queue+0x2d2/0x600
> > 
> > How did we even get to put_cpu_partial directly from flushing smp calls?
> > SLUB doesn't use them, it uses queue_work_on)_ for flushing and that
> > flushing doesn't involve put_cpu_partial() AFAIK.
> > 
> > I think only slab allocation or free can lead to put_cpu_partial() that
> > would mean the backtrace is missing something. And that somebody does a slab
> > alloc/free from a smp callback, which I'd then assume isn't allowed?
> 
> Tail-call optimization is hiding the caller. Compiling with
> -fno-optimize-sibling-calls exposes the caller. This gives the full
> picture:
> 
> [   40.321505] =============================
> [   40.322711] [ BUG: Invalid wait context ]
> [   40.323927] 6.12.0-rc5-next-20241030-dirty #4 Not tainted
> [   40.325502] -----------------------------
> [   40.326653] cpuhp/47/253 is trying to lock:
> [   40.327869] ffff8881ff9bf2f0 (&c->lock){....}-{3:3}, at: put_cpu_partial+0x48/0x1a0
> [   40.330081] other info that might help us debug this:
> [   40.331540] context-{2:2}
> [   40.332305] 3 locks held by cpuhp/47/253:
> [   40.333468]  #0: ffffffffae6e6910 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun+0xe0/0x590
> [   40.336048]  #1: ffffffffae6e9060 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun+0xe0/0x590
> [   40.338607]  #2: ffff8881002a6948 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_remove_by_name_ns+0x78/0x100
> [   40.341454] stack backtrace:
> [   40.342291] CPU: 47 UID: 0 PID: 253 Comm: cpuhp/47 Not tainted 6.12.0-rc5-next-20241030-dirty #4
> [   40.344807] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   40.347482] Call Trace:
> [   40.348199]  <IRQ>
> [   40.348827]  dump_stack_lvl+0x6b/0xa0
> [   40.349899]  dump_stack+0x10/0x20
> [   40.350850]  __lock_acquire+0x900/0x4010
> [   40.360290]  lock_acquire+0x191/0x4f0
> [   40.364850]  put_cpu_partial+0x51/0x1a0
> [   40.368341]  scf_handler+0x1bd/0x290
> [   40.370590]  scf_handler_1+0x4e/0xb0
> [   40.371630]  __flush_smp_call_function_queue+0x2dd/0x600
> [   40.373142]  generic_smp_call_function_single_interrupt+0xe/0x20
> [   40.374801]  __sysvec_call_function_single+0x50/0x280
> [   40.376214]  sysvec_call_function_single+0x6c/0x80
> [   40.377543]  </IRQ>
> [   40.378142]  <TASK>
> 
> And scf_handler does indeed tail-call kfree:
> 
> 	static void scf_handler(void *scfc_in)
> 	{
> 	[...]
> 		} else {
> 			kfree(scfcp);
> 		}
> 	}

So I need to avoid calling kfree() within an smp_call_function() handler?

							Thanx, Paul

