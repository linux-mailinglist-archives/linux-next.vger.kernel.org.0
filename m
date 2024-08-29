Return-Path: <linux-next+bounces-3498-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844B964207
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 12:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF271B26CF4
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 10:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA21C18FC6B;
	Thu, 29 Aug 2024 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfLHaUNj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19D918E342;
	Thu, 29 Aug 2024 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927288; cv=none; b=YIXOR67XbMmISnkz+ggv9sjHGnhrHkaQQL83NB3vquo7kF8+Y6mI+R8h5GiSJKR6yVHq8hKCXenepYwpU0JBOgASErcVAuMdBovyPaalpKmpTMNK+q5ml7lnKbKo7jWy6SYByP4S4OE+wj5f0pR8BZneZY269ZZ/67x1JdHNVy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927288; c=relaxed/simple;
	bh=A9NQatCWzcxdlixm1b91RzppxbWZBuCIsgSRYSpTEt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyFyih4Ntj66lObRkzf6lgBXC4UTgbxm1hi+mp7RI3vra+KYTVSqr56hlVdD/FE+0w+GrsmZF7e3/BB9P5zZ97OGB7u8sLk5BKBfrvVECNdVetoa/tC0oeI01WEYFEecZUt/Bvd2k9CNLOcUPdzGOUseVqUxoTRbdJyIaQtepII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfLHaUNj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2ABC4CEC1;
	Thu, 29 Aug 2024 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724927288;
	bh=A9NQatCWzcxdlixm1b91RzppxbWZBuCIsgSRYSpTEt4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=EfLHaUNjPHiQhTLaeDJQ77V4+jmXFy/Ns5niHe0y6eeJmb05aI+VuulbSjq9HWb6/
	 v9GzW616HKkfPLvvUva+0ZyZEIdyfyxZpY6vB7tDomNrsmAWBjDRMO7NHCMJ8aH6xi
	 F388ETboaKgI3GyUT+WEXU1OGvc+BR2lqXBFapr86kWS+M4vKpLvYl9Y5Q2A3/+QTt
	 RJMBynM604WfHkUM9c0u0wxBfSPU5MVsu8WZ43SuOJ2aUP7hPwYGeUCOr/1x0L+0q7
	 aOcSnyS3v1/jQOCUtUYLIM+fwqo+xQvDfT7ZNnFCdin/ilZmQl043NllnvSE4B7aRw
	 bH3JOUqCh4ZBA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CFBECCE0EDF; Thu, 29 Aug 2024 03:28:07 -0700 (PDT)
Date: Thu, 29 Aug 2024 03:28:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <4b93e5cf-c71e-4c64-9369-4ab3f43d9693@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c83028db-55ad-45b3-a27a-842ed665a882@paulmck-laptop>
 <103b1710-39ca-40d0-947d-fdac32d6e6a0@paulmck-laptop>
 <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
 <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
 <xhsmh4j74o6l9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>

On Wed, Aug 28, 2024 at 11:39:19AM -0700, Paul E. McKenney wrote:
> On Wed, Aug 28, 2024 at 08:17:06PM +0200, Valentin Schneider wrote:
> > On 28/08/24 09:35, Paul E. McKenney wrote:
> > > On Wed, Aug 28, 2024 at 04:32:41PM +0200, Valentin Schneider wrote:
> > >> On 28/08/24 21:44, Chen Yu wrote:
> > >> >
> > >> > One question, although there is no DEQUEUE_DELAYED flag, it is possible
> > >> > the delayed task could be dequeued from CFS tree. Because the dequeue in
> > >> > set_schedule() does not have DEQUEUE_SLEEP. And in dequeue_entity():
> > >> >
> > >> >       bool sleep = flags & DEQUEUE_SLEEP;
> > >> >
> > >> >       if (flags & DEQUEUE_DELAYED) {
> > >> >
> > >> >       } else {
> > >> >               bool delay = sleep;
> > >> >               if (sched_feat(DELAY_DEQUEUE) && delay &&  //false
> > >> >                  !entity_eligible(cfs_rq, se) {
> > >> >               //do not dequeue
> > >> >               }
> > >> >       }
> > >> >
> > >> >       //dequeue the task    <---- we should reach here?
> > >> >
> > >>
> > >> You're quite right, so really here the main missing bit would be the final
> > >> __block_task() that a DEQUEUE_DELAYED dequeue_entities() would get us.
> > >
> > > 50*TREE03 passed, yay!  Thank you both!!!
> > 
> > Fantastic, I'll hammer this into a "proper" patch then. Thanks again for
> > all the testing!
> > 
> > > I started a 500*TREE03.
> > >
> > > Yes, the odds all 50 passing given the baseline 52% failure rate is
> > > something like 10^-16, but software bugs are not necessarily constrained
> > > by elementary statistics...
> > 
> > :-)
> 
> The 500*TREE03 run had exactly one failure that was the dreaded
> enqueue_dl_entity() failure, followed by RCU CPU stall warnings.
> 
> But a huge improvement over the prior state!
> 
> Plus, this failure is likely unrelated (see earlier discussions with
> Peter).  I just started a 5000*TREE03 run, just in case we can now
> reproduce this thing.

And we can now reproduce it!  Again, this might an unrelated bug that
was previously a one-off (OK, OK, a two-off!).  Or this series might
have made it more probably.  Who knows?

Eight of those 5000 runs got us this splat in enqueue_dl_entity():

	WARN_ON_ONCE(on_dl_rq(dl_se));

Immediately followed by this splat in __enqueue_dl_entity():

	WARN_ON_ONCE(!RB_EMPTY_NODE(&dl_se->rb_node));

These two splats always happened during rcutorture's testing of
RCU priority boosting.  This testing involves spawning a CPU-bound
low-priority real-time kthread for each CPU, which is intended to starve
the non-realtime RCU readers, which are in turn to be rescued by RCU
priority boosting.

I do not entirely trust the following rcutorture diagnostic, but just
in case it helps...

Many of them also printed something like this as well:

[  111.279575] Boost inversion persisted: No QS from CPU 3

This message means that rcutorture has decided that RCU priority boosting
has failed, but not because a low-priority preempted task was blocking
the grace period, but rather because some CPU managed to be running
the same task in-kernel the whole time without doing a context switch.
In some cases (but not this one), this was simply a side-effect of
RCU's grace-period kthread being starved of CPU time.  Such starvation
is a surprise in this case because this kthread is running at higher
real-time priority than the kthreads that are intended to force RCU
priority boosting to happen.

Again, I do not entirely trust this rcutorture diagnostic, just in case
it helps.

							Thanx, Paul

------------------------------------------------------------------------

[  287.536845] rcu-torture: rcu_torture_boost is stopping
[  287.536867] ------------[ cut here ]------------
[  287.540661] WARNING: CPU: 4 PID: 132 at kernel/sched/deadline.c:2003 enqueue_dl_entity+0x50d/0x5c0
[  287.542299] Modules linked in:
[  287.542868] CPU: 4 UID: 0 PID: 132 Comm: kcompactd0 Not tainted 6.11.0-rc1-00051-gb32d207e39de #1701
[  287.544335] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[  287.546337] RIP: 0010:enqueue_dl_entity+0x50d/0x5c0
[  287.547154] Code: 8e a5 fb ff ff 48 c7 45 40 00 00 00 00 e9 98 fb ff ff 85 db 0f 84 80 fe ff ff 5b 44 89 e6 48 89 ef 5d 41 5c e9 44 d7 ff ff 90 <0f> 0b 90 e9 fe fa ff ff 48 8b bb f8 09 00 00 48 39 fe 0f 89 12 fc
[  287.550035] RSP: 0018:ffff9a57404dfb60 EFLAGS: 00010082
[  287.550855] RAX: 0000000000000001 RBX: ffff8d955f32caa8 RCX: 0000000000000002
[  287.551954] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff8d955f32caa8
[  287.553064] RBP: ffff8d955f32caa8 R08: 0000000000000001 R09: 000000000000020b
[  287.554167] R10: 0000000000000000 R11: ffff8d9542360090 R12: 0000000000000001
[  287.555256] R13: 00000000002dc6c0 R14: ffff8d955f32c200 R15: ffff8d955f32c240
[  287.556364] FS:  0000000000000000(0000) GS:ffff8d955f300000(0000) knlGS:0000000000000000
[  287.557650] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  287.558561] CR2: 0000000000000000 CR3: 0000000001f00000 CR4: 00000000000006f0
[  287.559663] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  287.560777] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  287.561918] Call Trace:
[  287.562319]  <TASK>
[  287.562659]  ? __warn+0x7e/0x120
[  287.563172]  ? enqueue_dl_entity+0x50d/0x5c0
[  287.563847]  ? report_bug+0x18e/0x1a0
[  287.564424]  ? handle_bug+0x3d/0x70
[  287.564902] rcu-torture: rcu_torture_read_exit: End of episode
[  287.564983]  ? exc_invalid_op+0x18/0x70
[  287.566477]  ? asm_exc_invalid_op+0x1a/0x20
[  287.567130]  ? enqueue_dl_entity+0x50d/0x5c0
[  287.567791]  dl_server_start+0x31/0xe0
[  287.568375]  enqueue_task_fair+0x218/0x680
[  287.569019]  activate_task+0x21/0x50
[  287.569579]  attach_task+0x30/0x50
[  287.570110]  sched_balance_rq+0x65d/0xe20
[  287.570737]  sched_balance_newidle.constprop.0+0x1a0/0x360
[  287.571593]  pick_next_task_fair+0x2a/0x2e0
[  287.572242]  __schedule+0x106/0x8b0
[  287.572789]  ? __mod_timer+0x23f/0x350
[  287.573370]  schedule+0x22/0xd0
[  287.573864]  schedule_timeout+0x8a/0x160
[  287.574479]  ? __pfx_process_timeout+0x10/0x10
[  287.575162]  kcompactd+0x336/0x3a0
[  287.575696]  ? __pfx_autoremove_wake_function+0x10/0x10
[  287.576504]  ? __pfx_kcompactd+0x10/0x10
[  287.577109]  kthread+0xd1/0x100
[  287.577601]  ? __pfx_kthread+0x10/0x10
[  287.578192]  ret_from_fork+0x2f/0x50
[  287.578750]  ? __pfx_kthread+0x10/0x10
[  287.579328]  ret_from_fork_asm+0x1a/0x30
[  287.579942]  </TASK>
[  287.580280] ---[ end trace 0000000000000000 ]---
[  287.581004] ------------[ cut here ]------------
[  287.581712] WARNING: CPU: 4 PID: 132 at kernel/sched/deadline.c:1979 enqueue_dl_entity+0x54b/0x5c0
[  287.583076] Modules linked in:
[  287.583563] CPU: 4 UID: 0 PID: 132 Comm: kcompactd0 Tainted: G        W          6.11.0-rc1-00051-gb32d207e39de #1701
[  287.585170] Tainted: [W]=WARN
[  287.585631] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[  287.587329] RIP: 0010:enqueue_dl_entity+0x54b/0x5c0
[  287.588075] Code: 12 fc ff ff e9 16 ff ff ff 89 c1 45 84 d2 0f 84 02 fc ff ff a8 20 0f 84 fa fb ff ff 84 c0 0f 89 d0 fd ff ff e9 ed fb ff ff 90 <0f> 0b 90 e9 28 fc ff ff 84 d2 75 59 48 8d b5 50 fe ff ff 48 8d 95
[  287.590887] RSP: 0018:ffff9a57404dfb60 EFLAGS: 00010082
[  287.591684] RAX: 00000000ffffff00 RBX: ffff8d955f32c200 RCX: 0000000000000000
[  287.592761] RDX: 0000000000000001 RSI: 0000000b1a2986b8 RDI: 0000000b1a28c7fc
[  287.593891] RBP: ffff8d955f32caa8 R08: ffff8d955f32ca40 R09: 000000003b9aca00
[  287.594969] R10: 0000000000000001 R11: 00000000000ee6b2 R12: 0000000000000001
[  287.596048] R13: 00000000002dc6c0 R14: ffff8d955f32c200 R15: ffff8d955f32c240
[  287.597129] FS:  0000000000000000(0000) GS:ffff8d955f300000(0000) knlGS:0000000000000000
[  287.598375] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  287.599265] CR2: 0000000000000000 CR3: 0000000001f00000 CR4: 00000000000006f0
[  287.600351] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  287.601439] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  287.602540] Call Trace:
[  287.602917]  <TASK>
[  287.603245]  ? __warn+0x7e/0x120
[  287.603752]  ? enqueue_dl_entity+0x54b/0x5c0
[  287.604405]  ? report_bug+0x18e/0x1a0
[  287.604978]  ? handle_bug+0x3d/0x70
[  287.605523]  ? exc_invalid_op+0x18/0x70
[  287.606116]  ? asm_exc_invalid_op+0x1a/0x20
[  287.606765]  ? enqueue_dl_entity+0x54b/0x5c0
[  287.607420]  dl_server_start+0x31/0xe0
[  287.608013]  enqueue_task_fair+0x218/0x680
[  287.608643]  activate_task+0x21/0x50
[  287.609197]  attach_task+0x30/0x50
[  287.609736]  sched_balance_rq+0x65d/0xe20
[  287.610351]  sched_balance_newidle.constprop.0+0x1a0/0x360
[  287.611205]  pick_next_task_fair+0x2a/0x2e0
[  287.611849]  __schedule+0x106/0x8b0
[  287.612383]  ? __mod_timer+0x23f/0x350
[  287.612969]  schedule+0x22/0xd0
[  287.613450]  schedule_timeout+0x8a/0x160
[  287.614059]  ? __pfx_process_timeout+0x10/0x10
[  287.614740]  kcompactd+0x336/0x3a0
[  287.615261]  ? __pfx_autoremove_wake_function+0x10/0x10
[  287.616069]  ? __pfx_kcompactd+0x10/0x10
[  287.616676]  kthread+0xd1/0x100
[  287.617159]  ? __pfx_kthread+0x10/0x10
[  287.617739]  ret_from_fork+0x2f/0x50
[  287.618285]  ? __pfx_kthread+0x10/0x10
[  287.618869]  ret_from_fork_asm+0x1a/0x30
[  287.619472]  </TASK>
[  287.619809] ---[ end trace 0000000000000000 ]---

