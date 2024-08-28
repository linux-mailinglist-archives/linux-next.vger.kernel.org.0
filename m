Return-Path: <linux-next+bounces-3478-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C549628E2
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 15:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D22E9B20DF4
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 13:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0071862B3;
	Wed, 28 Aug 2024 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7USzku8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DA6156227;
	Wed, 28 Aug 2024 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852445; cv=none; b=Ji8ZnTlKN/WWFwciE7iqKzHHoi0iMmdC8EzByzpWiIVjdACcVjTlSC+L5MaE0w+hqfvnxzTyrWXefx8WvUTIOmlCmpbvfZuU+NP9l94L7DpEKedhdCqOOs3PbuCxQXQyMnMQi78yOZHN8CL1KvNyVMs/UjJHi8DbTn0hfGyqNeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852445; c=relaxed/simple;
	bh=k8saHA+fqAO0MLqp9ALa3mpBWHQkqGkWkC8pSy61y2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sItW0YGIPawMSzWR4IKVcovomog3XIWIxg0XZJwBoJp0oPU0N/508kDlTbeza1/RCtOSyg7s9uRmtzomb5+b0pkBO/Y//uq1/ROJa4si8XUn5f59oa9yPkyMoakTVALor033LD0BDa8I6t0Kuwrqrtgb7x7ytJiJlaEZe67n24M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7USzku8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41081C58114;
	Wed, 28 Aug 2024 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724852445;
	bh=k8saHA+fqAO0MLqp9ALa3mpBWHQkqGkWkC8pSy61y2Y=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=o7USzku8k8eR9PDTZI22AS6wsgIa4e7ml7xPTIXWEyKTby/7YinpbhYHvbM+45yPg
	 DwWcbRauDrG/DfGx9aJMxpK+HOXxYIc5+DTM0Zu5hesnfoUJmBugblI6aCr1QVo2If
	 4X+2PGeiAKGuNjhFhg3TODrVD7nJyXnQ84l5cN0xnanRCOR6fGOJUDVMIfYESLSipV
	 RHsHfInkng4PxhMNK6XjPnb+DdTOBn/V9QZ7sfmzQIYwt6glInpJFqPjWY2njiqk7n
	 imnsYI4xHGloIrOkp+VccyHGaaiBrmsQqSZHWs3PFK1qJmvDWf2WtdCEY37QyFGjVg
	 dYb9qMUjs80yw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DA7D5CE1697; Wed, 28 Aug 2024 06:40:44 -0700 (PDT)
Date: Wed, 28 Aug 2024 06:40:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com, Chen Yu <yu.c.chen@intel.com>
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <9c66e90f-34bd-40e3-bd34-4c218ad6850a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
 <xhsmhle0inuze.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhikvmnfb3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <e12e0933-d8a5-4659-9fea-3413e3b2374d@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e12e0933-d8a5-4659-9fea-3413e3b2374d@paulmck-laptop>

On Wed, Aug 28, 2024 at 06:03:31AM -0700, Paul E. McKenney wrote:
> On Wed, Aug 28, 2024 at 02:35:45PM +0200, Valentin Schneider wrote:
> > On 27/08/24 13:36, Paul E. McKenney wrote:
> > > On Tue, Aug 27, 2024 at 10:30:24PM +0200, Valentin Schneider wrote:
> > >> On 27/08/24 11:35, Paul E. McKenney wrote:
> > >> > On Tue, Aug 27, 2024 at 10:33:13AM -0700, Paul E. McKenney wrote:
> > >> >> On Tue, Aug 27, 2024 at 05:41:52PM +0200, Valentin Schneider wrote:
> > >> >> > I've taken tip/sched/core and shuffled hunks around; I didn't re-order any
> > >> >> > commit. I've also taken out the dequeue from switched_from_fair() and put
> > >> >> > it at the very top of the branch which should hopefully help bisection.
> > >> >> >
> > >> >> > The final delta between that branch and tip/sched/core is empty, so it
> > >> >> > really is just shuffling inbetween commits.
> > >> >> >
> > >> >> > Please find the branch at:
> > >> >> >
> > >> >> > https://gitlab.com/vschneid/linux.git -b mainline/sched/eevdf-complete-builderr
> > >> >> >
> > >> >> > I'll go stare at the BUG itself now.
> > >> >>
> > >> >> Thank you!
> > >> >>
> > >> >> I have fired up tests on the "BROKEN?" commit.  If that fails, I will
> > >> >> try its predecessor, and if that fails, I wlll bisect from e28b5f8bda01
> > >> >> ("sched/fair: Assert {set_next,put_prev}_entity() are properly balanced"),
> > >> >> which has stood up to heavy hammering in earlier testing.
> > >> >
> > >> > And of 50 runs of TREE03 on the "BROKEN?" commit resulted in 32 failures.
> > >> > Of these, 29 were the dequeue_rt_stack() failure.  Two more were RCU
> > >> > CPU stall warnings, and the last one was an oddball "kernel BUG at
> > >> > kernel/sched/rt.c:1714" followed by an equally oddball "Oops: invalid
> > >> > opcode: 0000 [#1] PREEMPT SMP PTI".
> > >> >
> > >> > Just to be specific, this is commit:
> > >> >
> > >> > df8fe34bfa36 ("BROKEN? sched/fair: Dequeue sched_delayed tasks when switching from fair")
> > >> >
> > >> > This commit's predecessor is this commit:
> > >> >
> > >> > 2f888533d073 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
> > >> >
> > >> > This predecessor commit passes 50 runs of TREE03 with no failures.
> > >> >
> > >> > So that addition of that dequeue_task() call to the switched_from_fair()
> > >> > function is looking quite suspicious to me.  ;-)
> > >> >
> > >> >                                                       Thanx, Paul
> > >>
> > >> Thanks for the testing!
> > >>
> > >> The WARN_ON_ONCE(!rt_se->on_list); hit in __dequeue_rt_entity() feels like
> > >> a put_prev/set_next kind of issue...
> > >>
> > >> So far I'd assumed a ->sched_delayed task can't be current during
> > >> switched_from_fair(), I got confused because it's Mond^CCC Tuesday, but I
> > >> think that still holds: we can't get a balance_dl() or balance_rt() to drop
> > >> the RQ lock because prev would be fair, and we can't get a
> > >> newidle_balance() with a ->sched_delayed task because we'd have
> > >> sched_fair_runnable() := true.
> > >>
> > >> I'll pick this back up tomorrow, this is a task that requires either
> > >> caffeine or booze and it's too late for either.
> > >
> > > Thank you for chasing this, and get some sleep!  This one is of course
> > > annoying, but it is not (yet) an emergency.  I look forward to seeing
> > > what you come up with.
> > >
> > > Also, I would of course be happy to apply debug patches.
> > >
> > >                                                       Thanx, Paul
> > 
> > Chen Yu made me realize [1] that dequeue_task() really isn't enough; the
> > dequeue_task() in e.g. __sched_setscheduler() won't have DEQUEUE_DELAYED,
> > so stuff will just be left on the CFS tree.
> > 
> > Worse, what we need here is the __block_task() like we have at the end of
> > dequeue_entities(), otherwise p stays ->on_rq and that's borked - AFAICT
> > that explains the splat you're getting, because affine_move_task() ends up
> > doing a move_queued_task() for what really is a dequeued task.
> 
> Sounds like something that *I* would do!  ;-)
> 
> > I unfortunately couldn't reproduce the issue locally using your TREE03
> > invocation. I've pushed a new patch on top of my branch, would you mind
> > giving it a spin? It's a bit sketchy but should at least be going in the
> > right direction...
> > 
> > [1]: http://lore.kernel.org/r/Zs2d2aaC/zSyR94v@chenyu5-mobl2
> 
> Thank you!
> 
> I just now fired it up on 50*TREE03.  If that passes, I will let you
> know and also fire up 500*TREE03.

The good news is that there are no dequeue_rt_stack() failures.

The not-quite-so-good news is that there were 26 failures out of 50
runs, several of which are RCU CPU or rcutorture-writer stall warnings,
but the most frequent being splats like the one shown below.  (If you
really want, I would be happy to send you the full set.)

In case it helps, this is my reproducer:

tools/testing/selftests/rcutorture/bin/kvm-remote.sh "<list of 20 system names>" --cpus 80 --duration 5m --configs "50*TREE03"

Each of the 20 system names is a 80-CPU system that can be reached with "ssh".

Though I can also reproduce on my laptop, it just takes a bit longer to
run 50 instances of TREE03.  ;-)

On the other hand, this kvm-remote.sh run took only 11 minutes wall-clock
time, so testing your patches works fine for me, give or take timezone
issues.

							Thanx, Paul

------------------------------------------------------------------------

[    1.636950] BUG: kernel NULL pointer dereference, address: 0000000000000051
[    1.637886] #PF: supervisor read access in kernel mode
[    1.637886] #PF: error_code(0x0000) - not-present page
[    1.637886] PGD 0 P4D 0
[    1.637886] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
[    1.637886] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc1-00050-ge8593c21265a #1698
[    1.637886] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[    1.637886] RIP: 0010:pick_task_fair+0x26/0xb0
[    1.637886] Code: 90 90 90 90 f3 0f 1e fa 8b 57 50 85 d2 0f 84 93 00 00 00 55 48 8d 6f 40 53 48 89 fb 48 83 ec 08 48 89 ef eb 1c e8 6a be ff ff <80> 78 51 00 75 38 48 85 c0 74 43 48 8b b8 a8 00 00 00 48 85 ff 74
[    1.637886] RSP: 0000:ffffa5fb00013b78 EFLAGS: 00010082
[    1.637886] RAX: 0000000000000000 RBX: ffff95271f22c200 RCX: 0000000000000800
[    1.637886] RDX: ed73115ce0430400 RSI: 0000000000000800 RDI: 0000db7ef943c3be
[    1.637886] RBP: ffff95271f22c240 R08: 0000000000000000 R09: 0000000000000000
[    1.637886] R10: fffe89e124bd80db R11: 0000000000000000 R12: ffffffffaa00e9b0
[    1.637886] R13: ffff9527011e8000 R14: 0000000000000000 R15: ffff9527011e8000
[    1.637886] FS:  0000000000000000(0000) GS:ffff95271f200000(0000) knlGS:0000000000000000
[    1.637886] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.637886] CR2: 0000000000000051 CR3: 0000000008e2e000 CR4: 00000000000006f0
[    1.637886] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    1.637886] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    1.637886] Call Trace:
[    1.637886]  <TASK>
[    1.637886]  ? __die+0x1f/0x70
[    1.637886]  ? page_fault_oops+0x155/0x440
[    1.637886]  ? search_extable+0x26/0x30
[    1.637886]  ? pick_task_fair+0x26/0xb0
[    1.637886]  ? search_exception_tables+0x37/0x50
[    1.637886]  ? exc_page_fault+0x69/0x150
[    1.637886]  ? asm_exc_page_fault+0x26/0x30
[    1.637886]  ? pick_task_fair+0x26/0xb0
[    1.637886]  ? pick_task_fair+0x26/0xb0
[    1.637886]  pick_next_task_fair+0x40/0x2e0
[    1.637886]  __schedule+0x106/0x8b0
[    1.637886]  ? hrtimer_update_next_event+0x70/0x90
[    1.637886]  schedule+0x22/0xd0
[    1.637886]  schedule_hrtimeout_range_clock+0xa8/0x120
[    1.637886]  ? __pfx_hrtimer_wakeup+0x10/0x10
[    1.637886]  wait_task_inactive+0x1ac/0x1c0
[    1.637886]  __kthread_bind_mask+0x13/0x60
[    1.637886]  kthread_create_on_cpu+0x54/0x80
[    1.637886]  __smpboot_create_thread.part.0+0x60/0x130
[    1.637886]  smpboot_create_threads+0x5c/0x90
[    1.637886]  ? __pfx_smpboot_create_threads+0x10/0x10
[    1.637886]  cpuhp_invoke_callback+0x2cd/0x470
[    1.637886]  ? __pfx_trace_rb_cpu_prepare+0x10/0x10
[    1.637886]  __cpuhp_invoke_callback_range+0x71/0xe0
[    1.637886]  _cpu_up+0xee/0x1d0
[    1.637886]  cpu_up+0x88/0xb0
[    1.637886]  cpuhp_bringup_mask+0x47/0xb0
[    1.637886]  bringup_nonboot_cpus+0xca/0xf0
[    1.637886]  smp_init+0x25/0x80
[    1.637886]  kernel_init_freeable+0xd6/0x2d0
[    1.637886]  ? __pfx_kernel_init+0x10/0x10
[    1.637886]  kernel_init+0x15/0x1c0
[    1.637886]  ret_from_fork+0x2f/0x50
[    1.637886]  ? __pfx_kernel_init+0x10/0x10
[    1.637886]  ret_from_fork_asm+0x1a/0x30
[    1.637886]  </TASK>
[    1.637886] Modules linked in:
[    1.637886] CR2: 0000000000000051
[    1.637886] ---[ end trace 0000000000000000 ]---

