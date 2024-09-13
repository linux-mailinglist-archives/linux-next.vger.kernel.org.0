Return-Path: <linux-next+bounces-3828-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F8697824D
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 16:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB4B0B21251
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 14:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C839A1BAED2;
	Fri, 13 Sep 2024 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uK/prDMD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC8343144;
	Fri, 13 Sep 2024 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726236503; cv=none; b=WkxmLnZ9jkrGzLlaRI+UXuq9uuOrh/XW3OnFZUQjI/IDPnb75NC/H8IKs7QaG1ocAuQb7oTmov5a4F7sA3qJ+GLJXTaBlEZy/Na5YPfb4I7yZj3Pp6pj30HtvcmE8ah4KL8d8izkmODa4faaHaKibHfBtd/D1A+csLN3MxgGqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726236503; c=relaxed/simple;
	bh=ZxBM20TAioat1uuBiSRdgd7vcLtpe/I/tP9WQvKDHsw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLqr5yn5jvFruampIp3Xj999KPTlOmHW79hycUwQMupof9rCiatTL+5H+DS9uQT30cAFQ5JySD/t2THbKLEtcyqUjhnWV21G/c73e5KUickbotHYsuyLVfF9Rw6Bjtbzg0pJoIUtzBFgePUlXqwq8zRpP0dz8rQD3sQFKjnhNWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uK/prDMD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0B6C4CEC0;
	Fri, 13 Sep 2024 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726236503;
	bh=ZxBM20TAioat1uuBiSRdgd7vcLtpe/I/tP9WQvKDHsw=;
	h=Date:From:To:Subject:Reply-To:References:In-Reply-To:From;
	b=uK/prDMDgFrsbGjWn8b4LuhQIs1ZJgXkU5M4Iu5MSGCuHAL9bp17426yoaZ8xzx6A
	 zEbuzGaV66ffqmYrd3z/Dh9tw0iOiOJKUzf8VVzFNqyw/qLF4kOiRy2W1noHz0BZWd
	 227f0K7aRcnfuqDIdhTCnuWWqQhzWX/bHNAPdqZ5TfF7/0WNSlJJw1gxz21Ic+t2ek
	 1q84DPw213m8kqJbAxHSM7APu41mUZ3m+FSZv4PD9vTdQLxhfE7tQ8+pyzXy+OEoNa
	 QcvFpgBGFdaQDwfhOK80R2mEwIwq/qmX6btmybmUkJIurl71j2svqaqPb8IrugzhI7
	 RF5K0zNji7I7w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D05AFCE1257; Fri, 13 Sep 2024 07:08:20 -0700 (PDT)
Date: Fri, 13 Sep 2024 07:08:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <182ef9c6-63a4-4608-98de-22ef4d35be07@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
 <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
 <xhsmh4j74o6l9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>
 <4b93e5cf-c71e-4c64-9369-4ab3f43d9693@paulmck-laptop>
 <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <cc537207-68a3-4dda-a8ec-6dda2fc1985d@paulmck-laptop>
 <250cde11-650f-4689-9c36-816406f1b9b8@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <250cde11-650f-4689-9c36-816406f1b9b8@paulmck-laptop>

On Sun, Sep 08, 2024 at 09:32:18AM -0700, Paul E. McKenney wrote:
> On Thu, Aug 29, 2024 at 07:13:07AM -0700, Paul E. McKenney wrote:
> > On Thu, Aug 29, 2024 at 03:50:03PM +0200, Valentin Schneider wrote:
> > > On 29/08/24 03:28, Paul E. McKenney wrote:
> > > > On Wed, Aug 28, 2024 at 11:39:19AM -0700, Paul E. McKenney wrote:
> > > >>
> > > >> The 500*TREE03 run had exactly one failure that was the dreaded
> > > >> enqueue_dl_entity() failure, followed by RCU CPU stall warnings.
> > > >>
> > > >> But a huge improvement over the prior state!
> > > >>
> > > >> Plus, this failure is likely unrelated (see earlier discussions with
> > > >> Peter).  I just started a 5000*TREE03 run, just in case we can now
> > > >> reproduce this thing.
> > > >
> > > > And we can now reproduce it!  Again, this might an unrelated bug that
> > > > was previously a one-off (OK, OK, a two-off!).  Or this series might
> > > > have made it more probably.  Who knows?
> > > >
> > > > Eight of those 5000 runs got us this splat in enqueue_dl_entity():
> > > >
> > > >       WARN_ON_ONCE(on_dl_rq(dl_se));
> > > >
> > > > Immediately followed by this splat in __enqueue_dl_entity():
> > > >
> > > >       WARN_ON_ONCE(!RB_EMPTY_NODE(&dl_se->rb_node));
> > > >
> > > > These two splats always happened during rcutorture's testing of
> > > > RCU priority boosting.  This testing involves spawning a CPU-bound
> > > > low-priority real-time kthread for each CPU, which is intended to starve
> > > > the non-realtime RCU readers, which are in turn to be rescued by RCU
> > > > priority boosting.
> > > >
> > > 
> > > Thanks!
> > > 
> > > > I do not entirely trust the following rcutorture diagnostic, but just
> > > > in case it helps...
> > > >
> > > > Many of them also printed something like this as well:
> > > >
> > > > [  111.279575] Boost inversion persisted: No QS from CPU 3
> > > >
> > > > This message means that rcutorture has decided that RCU priority boosting
> > > > has failed, but not because a low-priority preempted task was blocking
> > > > the grace period, but rather because some CPU managed to be running
> > > > the same task in-kernel the whole time without doing a context switch.
> > > > In some cases (but not this one), this was simply a side-effect of
> > > > RCU's grace-period kthread being starved of CPU time.  Such starvation
> > > > is a surprise in this case because this kthread is running at higher
> > > > real-time priority than the kthreads that are intended to force RCU
> > > > priority boosting to happen.
> > > >
> > > > Again, I do not entirely trust this rcutorture diagnostic, just in case
> > > > it helps.
> > > >
> > > >                                                       Thanx, Paul
> > > >
> > > > ------------------------------------------------------------------------
> > > >
> > > > [  287.536845] rcu-torture: rcu_torture_boost is stopping
> > > > [  287.536867] ------------[ cut here ]------------
> > > > [  287.540661] WARNING: CPU: 4 PID: 132 at kernel/sched/deadline.c:2003 enqueue_dl_entity+0x50d/0x5c0
> > > > [  287.542299] Modules linked in:
> > > > [  287.542868] CPU: 4 UID: 0 PID: 132 Comm: kcompactd0 Not tainted 6.11.0-rc1-00051-gb32d207e39de #1701
> > > > [  287.544335] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> > > > [  287.546337] RIP: 0010:enqueue_dl_entity+0x50d/0x5c0
> > > > [  287.603245]  ? __warn+0x7e/0x120
> > > > [  287.603752]  ? enqueue_dl_entity+0x54b/0x5c0
> > > > [  287.604405]  ? report_bug+0x18e/0x1a0
> > > > [  287.604978]  ? handle_bug+0x3d/0x70
> > > > [  287.605523]  ? exc_invalid_op+0x18/0x70
> > > > [  287.606116]  ? asm_exc_invalid_op+0x1a/0x20
> > > > [  287.606765]  ? enqueue_dl_entity+0x54b/0x5c0
> > > > [  287.607420]  dl_server_start+0x31/0xe0
> > > > [  287.608013]  enqueue_task_fair+0x218/0x680
> > > > [  287.608643]  activate_task+0x21/0x50
> > > > [  287.609197]  attach_task+0x30/0x50
> > > > [  287.609736]  sched_balance_rq+0x65d/0xe20
> > > > [  287.610351]  sched_balance_newidle.constprop.0+0x1a0/0x360
> > > > [  287.611205]  pick_next_task_fair+0x2a/0x2e0
> > > > [  287.611849]  __schedule+0x106/0x8b0
> > > 
> > > 
> > > Assuming this is still related to switched_from_fair(), since this is hit
> > > during priority boosting then it would mean rt_mutex_setprio() gets
> > > involved, but that uses the same set of DQ/EQ flags as
> > > __sched_setscheduler().
> > > 
> > > I don't see any obvious path in
> > > 
> > > dequeue_task_fair()
> > > `\
> > >   dequeue_entities()
> > > 
> > > that would prevent dl_server_stop() from happening when doing the
> > > class-switch dequeue_task()... I don't see it in the TREE03 config, but can
> > > you confirm CONFIG_CFS_BANDWIDTH isn't set in that scenario?
> > > 
> > > I'm going to keep digging but I'm not entirely sure yet whether this is
> > > related to the switched_from_fair() hackery or not, I'll send the patch I
> > > have as-is and continue digging for a bit.
> > 
> > Makes sense to me, thank you, and glad that the diagnostics helped.
> > 
> > Looking forward to further fixes.  ;-)
> 
> Just following up...
> 
> For whatever it is worth, on last night's run of next-20240906, I got
> nine failures out of 100 6-hour runs of rcutorture’s TREE03 scenario.
> These failures were often, but not always, shortly followed by a hard hang.
> 
> The warning at line 1995 is the WARN_ON_ONCE(on_dl_rq(dl_se))
> in enqueue_dl_entity() and the warning at line 1971 is the
> WARN_ON_ONCE(!RB_EMPTY_NODE(&dl_se->rb_node)) in __enqueue_dl_entity().
> 
> The pair of splats is shown below, in case it helps.

Again following up...

I am still seeing this on next-20240912, with six failures out of 100
6-hour runs of rcutorture’s TREE03 scenario.  Statistics suggests that
we not read much into the change in frequency.

Please let me know if there are any diagnostic patches or options that
I should apply.

							Thanx, Paul

> ------------------------------------------------------------------------
> 
> [21122.992435] ------------[ cut here ]------------
> [21122.994090] WARNING: CPU: 13 PID: 8032 at kernel/sched/deadline.c:1995 enqueue_dl_entity+0x511/0x5d0
> [21122.995554] Modules linked in:
> [21122.996048] CPU: 13 UID: 0 PID: 8032 Comm: kworker/13:1 Not tainted 6.11.0-rc6-next-20240906-dirty #2006
> [21122.997548] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [21122.999310] Workqueue:  0x0 (mm_percpu_wq)
> [21122.999981] RIP: 0010:enqueue_dl_entity+0x511/0x5d0
> [21123.000757] Code: ff 48 89 ef e8 b0 d2 ff ff 0f b6 4d 54 e9 0e fc ff ff 85 db
>  0f 84 d0 fe ff ff 5b 44 89 e6 48 89 ef 5d 41 5c e9 00 df ff ff 90 <0f> 0b 90 e9 fa fa ff ff 48 8b bb f8 09 00 00 48 39 fe 0f 89 de fb
> [21123.003697] RSP: 0000:ffffabca84373bf0 EFLAGS: 00010086
> [21123.004537] RAX: 0000000000000001 RBX: ffff98381f56cae8 RCX: 0000000000000002
> [21123.005660] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff98381f56cae8
> [21123.006781] RBP: ffff98381f56cae8 R08: 0000000000000001 R09: 0000000000000161
> [21123.007902] R10: 0000000000000000 R11: ffff983802399d90 R12: 0000000000000001
> [21123.009026] R13: 00000000002dc6c0 R14: ffff98381f56c240 R15: ffff98381f56c280
> [21123.010213] FS:  0000000000000000(0000) GS:ffff98381f540000(0000) knlGS:0000000000000000
> [21123.011584] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [21123.012498] CR2: 0000000000000000 CR3: 0000000002c16000 CR4: 00000000000006f0
> [21123.013647] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [21123.014780] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [21123.015915] Call Trace:
> [21123.016326]  <TASK>
> [21123.016672]  ? __warn+0x83/0x130
> [21123.017198]  ? enqueue_dl_entity+0x511/0x5d0
> [21123.017877]  ? report_bug+0x18e/0x1a0
> [21123.018469]  ? handle_bug+0x54/0x90
> [21123.019027]  ? exc_invalid_op+0x18/0x70
> [21123.019647]  ? asm_exc_invalid_op+0x1a/0x20
> [21123.020318]  ? enqueue_dl_entity+0x511/0x5d0
> [21123.020997]  dl_server_start+0x31/0xe0
> [21123.021603]  enqueue_task_fair+0x218/0x680
> [21123.022264]  activate_task+0x21/0x50
> [21123.022837]  attach_task+0x30/0x50
> [21123.023389]  sched_balance_rq+0x65e/0xe00
> [21123.024031]  sched_balance_newidle.constprop.0+0x190/0x360
> [21123.024903]  pick_next_task_fair+0x2a/0x340
> [21123.025576]  __schedule+0x10e/0x8b0
> [21123.026135]  ? queue_delayed_work_on+0x53/0x60
> [21123.026849]  schedule+0x22/0xd0
> [21123.027366]  worker_thread+0x1a2/0x3a0
> [21123.027963]  ? __pfx_worker_thread+0x10/0x10
> [21123.028651]  kthread+0xd1/0x100
> [21123.029153]  ? __pfx_kthread+0x10/0x10
> [21123.029758]  ret_from_fork+0x2f/0x50
> [21123.030334]  ? __pfx_kthread+0x10/0x10
> [21123.030933]  ret_from_fork_asm+0x1a/0x30
> [21123.031566]  </TASK>
> [21123.031920] ---[ end trace 0000000000000000 ]---
> [21123.032669] ------------[ cut here ]------------
> [21123.033409] WARNING: CPU: 13 PID: 8032 at kernel/sched/deadline.c:1971 enqueue_dl_entity+0x54f/0x5d0
> [21123.034853] Modules linked in:
> [21123.035354] CPU: 13 UID: 0 PID: 8032 Comm: kworker/13:1 Tainted: G        W          6.11.0-rc6-next-20240906-dirty #2006
> [21123.037081] Tainted: [W]=WARN
> [21123.037562] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [21123.039331] Workqueue:  0x0 (mm_percpu_wq)
> [21123.039984] RIP: 0010:enqueue_dl_entity+0x54f/0x5d0
> [21123.040767] Code: de fb ff ff e9 66 ff ff ff 89 c1 45 84 d2 0f 84 ce fb ff ff a8 20 0f 84 c6 fb ff ff 84 c0 0f 89 20 fe ff ff e9 b9 fb ff ff 90 <0f> 0b 90 e9 f4 fb ff ff 84 d2 0f 85 e3 fa ff ff 48 89 ea 48 8d b5
> [21123.043716] RSP: 0000:ffffabca84373bf0 EFLAGS: 00010086
> [21123.044549] RAX: 00000000ffffff00 RBX: ffff98381f56c240 RCX: 0000000000000000
> [21123.045676] RDX: 0000000000000001 RSI: 0000000b1a2986b8 RDI: 0000000b1a2154a4
> [21123.046806] RBP: ffff98381f56cae8 R08: ffff98381f56ca80 R09: 000000003b9aca00
> [21123.047931] R10: 0000000000000001 R11: 00000000000ee6b2 R12: 0000000000000001
> [21123.049061] R13: 00000000002dc6c0 R14: ffff98381f56c240 R15: ffff98381f56c280
> [21123.050469] FS:  0000000000000000(0000) GS:ffff98381f540000(0000) knlGS:0000000000000000
> [21123.051761] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [21123.052679] CR2: 0000000000000000 CR3: 0000000002c16000 CR4: 00000000000006f0
> [21123.053817] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [21123.054952] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [21123.056086] Call Trace:
> [21123.056691]  <TASK>
> [21123.057205]  ? __warn+0x83/0x130
> [21123.057984]  ? enqueue_dl_entity+0x54f/0x5d0
> [21123.058989]  ? report_bug+0x18e/0x1a0
> [21123.059865]  ? handle_bug+0x54/0x90
> [21123.060689]  ? exc_invalid_op+0x18/0x70
> [21123.061591]  ? asm_exc_invalid_op+0x1a/0x20
> [21123.062584]  ? enqueue_dl_entity+0x54f/0x5d0
> [21123.063337]  dl_server_start+0x31/0xe0
> [21123.063939]  enqueue_task_fair+0x218/0x680
> [21123.064604]  activate_task+0x21/0x50
> [21123.065185]  attach_task+0x30/0x50
> [21123.065729]  sched_balance_rq+0x65e/0xe00
> [21123.066377]  sched_balance_newidle.constprop.0+0x190/0x360
> [21123.067255]  pick_next_task_fair+0x2a/0x340
> [21123.067921]  __schedule+0x10e/0x8b0
> [21123.068524]  ? queue_delayed_work_on+0x53/0x60
> [21123.069238]  schedule+0x22/0xd0
> [21123.069742]  worker_thread+0x1a2/0x3a0
> [21123.070347]  ? __pfx_worker_thread+0x10/0x10
> [21123.071025]  kthread+0xd1/0x100
> [21123.071536]  ? __pfx_kthread+0x10/0x10
> [21123.072133]  ret_from_fork+0x2f/0x50
> [21123.072714]  ? __pfx_kthread+0x10/0x10
> [21123.073323]  ret_from_fork_asm+0x1a/0x30
> [21123.073949]  </TASK>
> [21123.074314] ---[ end trace 0000000000000000 ]---

