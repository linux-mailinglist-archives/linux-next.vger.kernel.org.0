Return-Path: <linux-next+bounces-4085-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96F98EF80
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 14:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8806B2811BA
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 12:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E001865E9;
	Thu,  3 Oct 2024 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZffVF/d8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF3D16BE1C;
	Thu,  3 Oct 2024 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727959453; cv=none; b=WAktCsRKv155F5gAKsmgaXsjOx5FDr2kYTaOa1uchtrWU0utvhe5dFOg5vOYb1iNPlP1BQzPZAW7hJSM2cluePFLdSuAOALBstbL1iiBjDI7XxiHh6xygZVFDJjLopVDXlRv2NPSKmHQzyv3frESC2ozCKxE2Ppq+6FAgK5442A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727959453; c=relaxed/simple;
	bh=BrkbjFSonqXFnopWSxaQYpjLr/L1ia2zlouhHA+TY20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OK6zwvIbEYQ1ahaiPclmP+EkYM6MVJTN0n14Ylo0GI3ZKc0xmbzNeHvUfhze1Tymjw1QXv5IETDExnw+5a9JXtEijOVHKavpX2tEBCTkhrZdzESMPidpdb1o9OSVQ+YlMkbZAQvb0MECf1tzz2vTGaKtHigxyrtbw4yngOGOTa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZffVF/d8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0481C4CEC5;
	Thu,  3 Oct 2024 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727959452;
	bh=BrkbjFSonqXFnopWSxaQYpjLr/L1ia2zlouhHA+TY20=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ZffVF/d8e6ej3rTWqWpHKrO1mJPu/zygM6QRWvIy5neyt5pOEc0+W1cGqVXac1wJX
	 w45T3mswOrKoU7Ejc6mERcnotCBrTgVfl4SH2vp6AffDGgcSjXfa0lmnSfswSLYScv
	 e6HeS6o5xvrRKnF88qQeiZ8btDBEEWs7ueryf9/dwu9aN9YfJ5yheOOK0XUyCvjWYm
	 1XFqW2yq7sEVrjbRXTyLMfMevYznc50Eqfdiu73UOArxHRBM6fzdH4x/DqpLGOtnak
	 8F4vc6Jh1hzBoDfFbyhCLRVkOUbY4yREI6oxgHzwnpYfBh3a1tH2LZDooXUDMbFlTM
	 zBZb6D+D+rdDA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6FEC3CE0A48; Thu,  3 Oct 2024 05:44:12 -0700 (PDT)
Date: Thu, 3 Oct 2024 05:44:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <66827d54-08e3-4ad7-9f60-6001a3c68052@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003092707.GD33184@noisy.programming.kicks-ass.net>

On Thu, Oct 03, 2024 at 11:27:07AM +0200, Peter Zijlstra wrote:
> On Thu, Oct 03, 2024 at 10:47:43AM +0200, Peter Zijlstra wrote:
> > On Thu, Oct 03, 2024 at 10:40:39AM +0200, Peter Zijlstra wrote:
> > > On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:
> > > 
> > > > My reproducer on the two-socket 40-core 80-HW-thread systems is:
> > > > 
> > > > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "50*TREE03" --trust-make
> > > > 
> > > 
> > > This gets me a very long stream of:
> > > 
> > > Results directory: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33
> > > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 50*TREE03 --trust-make
> > > TREE03 -------
> > > QEMU error, output:
> > > cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03/qemu-output: No such file or directory
> > > TREE03.10 -------
> > > QEMU error, output:
> > > cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03.10/qemu-output: No such file or directory
> > > ...
> > > 
> > > 
> > > Did I not do it right?
> > 
> > Urgh, for some reason my machine doesn't auto load kvm_intel.ko and then
> > proceeds to not do anything useful.. Let me try again.

Been there, done that, and many variations...

> Works a ton better now, obviously no splat yet :/

Well, after enabling function tracing as advised, I got splats on 18
hours of 100*TREE03, but different ones.  Heisenbugs for the win!!!
Sadly, the bug's win, not ours.  :-(

The first syndrome is starvation of RCU's grace-period kthread, and
apologies for the lack of trimming, but I have no idea what is relevant
here.  Though the rcu_torture_barrier_cbs() might suggest a scheduling bug
in rcutorture.  Not that I am seeing one, but all developers are blind...

And it is quite possible that the stalls were initially triggered by the
ftrace_dump().  So I will rerun suppressing stalls during that time.
(I thought limiting the buffers to 2k would make that unnecessary,
but it appears not!)

The stalls are below, just in case they are useful.

							Thanx, Paul

------------------------------------------------------------------------

[35205.919036] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[35205.919834] rcu:     (detected by 3, t=21003 jiffies, g=19954621, q=13582 ncpus=7)
[35205.920705] rcu: All QSes seen, last rcu_preempt kthread activity 17821 (4329872953-4329855132), jiffies_till_next_fqs=3, root ->qsmask 0x0
[35205.922197] rcu: rcu_preempt kthread starved for 17821 jiffies! g19954621 f0x2 RCU_GP_CLEANUP(7) ->state=0x0 ->cpu=5
[35205.923446] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
[35205.924530] rcu: RCU grace-period kthread stack dump:
[35205.925140] task:rcu_preempt     state:R  running task     stack:14752 pid:16    tgid:16    ppid:2      flags:0x00004000
[35205.926432] Call Trace:
[35205.926729]  <TASK>
[35205.926992]  __schedule+0x3e8/0x8f0
[35205.927428]  ? __mod_timer+0x23f/0x350
[35205.927890]  schedule+0x27/0xd0
[35205.928270]  schedule_timeout+0x77/0xf0
[35205.928801]  ? __pfx_process_timeout+0x10/0x10
[35205.929396]  rcu_gp_cleanup+0x14d/0x5d0
[35205.929870]  rcu_gp_kthread+0x1a0/0x240
[35205.930336]  ? __pfx_rcu_gp_kthread+0x10/0x10
[35205.930867]  kthread+0xd6/0x100
[35205.931251]  ? __pfx_kthread+0x10/0x10
[35205.931703]  ret_from_fork+0x34/0x50
[35205.932145]  ? __pfx_kthread+0x10/0x10
[35205.932598]  ret_from_fork_asm+0x1a/0x30
[35205.933080]  </TASK>
[35205.933347] rcu: Stack dump where RCU GP kthread last ran:
[35205.934010] Sending NMI from CPU 3 to CPUs 5:
[35205.934545] NMI backtrace for cpu 5
[35205.934550] CPU: 5 UID: 0 PID: 193 Comm: rcu_torture_bar Not tainted 6.11.0-next-20240927-dirty #2148
[35205.934554] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[35205.934556] RIP: 0010:queued_spin_lock_slowpath+0x1c/0x2b0
[35205.934564] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 41 55 41 54 55 48 89 fd 53 66 90 ba 01 00 00 00 8b 45 00 <85> c0 75 6c f0 0f b1 55 00 75 65 5b 5d 41 5c 41 5d c3 cc cc cc cc
[35205.934566] RSP: 0000:ffffaa11806bfd08 EFLAGS: 00000002
[35205.934569] RAX: 0000000000000001 RBX: ffff93d0820ec880 RCX: ffff93d09f200000
[35205.934571] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff93d09f22c400
[35205.934572] RBP: ffff93d09f22c400 R08: 0000000000000000 R09: ffff93d08241c008
[35205.934573] R10: ffff93d08241c008 R11: 0000000000000ccc R12: ffff93d09f22c400
[35205.934575] R13: ffff93d0820ed0b4 R14: 0000000000000087 R15: ffff93d09f200000
[35205.934578] FS:  0000000000000000(0000) GS:ffff93d09f340000(0000) knlGS:0000000000000000
[35205.934580] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[35205.934582] CR2: 0000000000000000 CR3: 0000000001154000 CR4: 00000000000006f0
[35205.934583] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[35205.934584] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[35205.934586] Call Trace:
[35205.934588]  <NMI>
[35205.934590]  ? nmi_cpu_backtrace+0x87/0xf0
[35205.934595]  ? nmi_cpu_backtrace_handler+0x11/0x20
[35205.934601]  ? nmi_handle+0x62/0x150
[35205.934606]  ? default_do_nmi+0x41/0x100
[35205.934610]  ? exc_nmi+0xe0/0x110
[35205.934613]  ? end_repeat_nmi+0xf/0x53
[35205.934617]  ? queued_spin_lock_slowpath+0x1c/0x2b0
[35205.934620]  ? queued_spin_lock_slowpath+0x1c/0x2b0
[35205.934623]  ? queued_spin_lock_slowpath+0x1c/0x2b0
[35205.934625]  </NMI>
[35205.934626]  <TASK>
[35205.934627]  try_to_wake_up+0x1b6/0x5e0
[35205.934635]  kick_pool+0x5e/0x130
[35205.934641]  __queue_work+0x2b2/0x4f0
[35205.934644]  queue_work_on+0x4e/0x60
[35205.934647]  ? __pfx_rcu_torture_barrier1cb+0x10/0x10
[35205.934653]  smp_call_on_cpu+0xde/0x100
[35205.934660]  ? __pfx_smp_call_on_cpu_callback+0x10/0x10
[35205.934664]  ? __pfx_rcu_torture_barrier1cb+0x10/0x10
[35205.934667]  rcu_torture_barrier_cbs+0x96/0x1c0
[35205.934671]  ? __pfx_autoremove_wake_function+0x10/0x10
[35205.934674]  ? __pfx_rcu_torture_barrier_cbs+0x10/0x10
[35205.934676]  kthread+0xd6/0x100
[35205.934679]  ? __pfx_kthread+0x10/0x10
[35205.934681]  ret_from_fork+0x34/0x50
[35205.934685]  ? __pfx_kthread+0x10/0x10
[35205.934687]  ret_from_fork_asm+0x1a/0x30
[35205.934691]  </TASK>

------------------------------------------------------------------------

This continues long enough to trigger a second warning an additional
63 seconds in, and again 63 seconds after that.  And maybe more after
that, but there are 22 others to glance at.

The second syndrome combines a more normal stall with an immediately
following stall of RCU's grace-period kthread, but apparently due to
that kthread spinning in resched_cpu():

------------------------------------------------------------------------

[32120.616146] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[32120.617373] rcu:     10-...0: (1 ticks this GP) idle=090c/1/0x4000000000000000 softirq=0/0 fqs=2316 rcuc=21012 jiffies(starved)
[32120.619427] rcu:     12-...0: (1 GPs behind) idle=84f4/1/0x4000000000000000 softirq=0/0 fqs=2316 rcuc=24529 jiffies(starved)
[32120.621456] rcu:     (detected by 7, t=21008 jiffies, g=18282245, q=22839 ncpus=9)
[32120.622814] Sending NMI from CPU 7 to CPUs 10:
[32120.622831] NMI backtrace for cpu 10
[32120.622837] CPU: 10 UID: 0 PID: 85 Comm: cpuhp/10 Not tainted 6.11.0-next-20240927-dirty #2148
[32120.622841] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[32120.622843] RIP: 0010:queued_spin_lock_slowpath+0x8e/0x2b0
[32120.622854] Code: 74 12 0f b6 45 00 84 c0 74 0a f3 90 0f b6 45 00 84 c0 75 f6 b8 01 00 00 00 66 89 45 00 5b 5d 41 5c 41 5d c3 cc cc cc cc f3 90 <eb> 89 8b 37 b8 00 02 00 00 81 fe 00 01 00 00 74 07 eb 99 83 e8 01
[32120.622857] RSP: 0000:ffffb7b80034fc20 EFLAGS: 00000002
[32120.622860] RAX: 0000000000000001 RBX: ffffffff97dd0c40 RCX: 000000000000000c
[32120.622862] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff9c6f1f52c400
[32120.622863] RBP: ffff9c6f1f52c400 R08: 000000000000000b R09: ffffffff97dd0cf8
[32120.622865] R10: ffffb7b80034fd40 R11: ffffffff97309d48 R12: 000000000000000c
[32120.622867] R13: 0000000000000246 R14: 0000000000000000 R15: 000000000000000c
[32120.622870] FS:  0000000000000000(0000) GS:ffff9c6f1f480000(0000) knlGS:0000000000000000
[32120.622872] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[32120.622873] CR2: 0000000000000000 CR3: 000000001342e000 CR4: 00000000000006f0
[32120.622875] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[32120.622876] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[32120.622877] Call Trace:
[32120.622891]  <NMI>
[32120.622893]  ? nmi_cpu_backtrace+0x87/0xf0
[32120.622899]  ? nmi_cpu_backtrace_handler+0x11/0x20
[32120.622905]  ? nmi_handle+0x62/0x150
[32120.622912]  ? default_do_nmi+0x41/0x100
[32120.622916]  ? exc_nmi+0xe0/0x110
[32120.622918]  ? end_repeat_nmi+0xf/0x53
[32120.622923]  ? queued_spin_lock_slowpath+0x8e/0x2b0
[32120.622926]  ? queued_spin_lock_slowpath+0x8e/0x2b0
[32120.622929]  ? queued_spin_lock_slowpath+0x8e/0x2b0
[32120.622932]  </NMI>
[32120.622932]  <TASK>
[32120.622933]  raw_spin_rq_lock_nested+0x15/0x30
[32120.622938]  rq_attach_root+0x20/0xf0
[32120.622944]  cpu_attach_domain+0x104/0x360
[32120.622948]  partition_sched_domains_locked+0x31a/0x450
[32120.622953]  rebuild_sched_domains_locked+0x119/0x8a0
[32120.622960]  cpuset_update_active_cpus+0x344/0x760
[32120.622965]  ? __pfx_sched_cpu_activate+0x10/0x10
[32120.622970]  sched_cpu_activate+0xdd/0xf0
[32120.622973]  cpuhp_invoke_callback+0x2d2/0x470
[32120.622979]  ? __pfx_virtnet_cpu_online+0x10/0x10
[32120.622986]  cpuhp_thread_fun+0x8f/0x150
[32120.622990]  smpboot_thread_fn+0xdd/0x1d0
[32120.622994]  ? __pfx_smpboot_thread_fn+0x10/0x10
[32120.622997]  kthread+0xd6/0x100
[32120.623001]  ? __pfx_kthread+0x10/0x10
[32120.623003]  ret_from_fork+0x34/0x50
[32120.623008]  ? __pfx_kthread+0x10/0x10
[32120.623010]  ret_from_fork_asm+0x1a/0x30
[32120.623017]  </TASK>
[32120.623823] Sending NMI from CPU 7 to CPUs 12:
[32120.623836] NMI backtrace for cpu 12
[32120.623841] CPU: 12 UID: 0 PID: 26816 Comm: kworker/12:1 Not tainted 6.11.0-next-20240927-dirty #2148
[32120.623845] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[32120.623848] Workqueue:  0x0 (mm_percpu_wq)
[32120.623853] RIP: 0010:ktime_get+0xf/0xd0
[32120.623860] Code: 82 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 8b 05 4d ad b6 01 <55> 53 85 c0 0f 85 97 00 00 00 8b 2d 91 f8 4b 02 40 f6 c5 01 75 65
[32120.623862] RSP: 0000:ffffb7b808523df0 EFLAGS: 00000002
[32120.623865] RAX: 0000000000000000 RBX: ffff9c6f1f52cca8 RCX: 0000000000000017
[32120.623867] RDX: 0000000000000000 RSI: ffff9c6f1f52cca8 RDI: ffff9c6f1f52cca8
[32120.623868] RBP: 00001d4142bdf7fd R08: 00001d36c1b190e5 R09: 0000000000000001
[32120.623870] R10: 0000000000000000 R11: 0000000000000006 R12: ffff9c6f1f52c400
[32120.623871] R13: ffff9c6f1f52c400 R14: ffffffff9702a320 R15: ffff9c6f047a2b80
[32120.623875] FS:  0000000000000000(0000) GS:ffff9c6f1f500000(0000) knlGS:0000000000000000
[32120.623876] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[32120.623878] CR2: 0000000000000000 CR3: 000000001342e000 CR4: 00000000000006f0
[32120.623880] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[32120.623881] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[32120.623882] Call Trace:
[32120.623885]  <NMI>
[32120.623888]  ? nmi_cpu_backtrace+0x87/0xf0
[32120.623896]  ? nmi_cpu_backtrace_handler+0x11/0x20
[32120.623903]  ? nmi_handle+0x62/0x150
[32120.623910]  ? default_do_nmi+0x41/0x100
[32120.623914]  ? exc_nmi+0xe0/0x110
[32120.623917]  ? end_repeat_nmi+0xf/0x53
[32120.623923]  ? ktime_get+0xf/0xd0
[32120.623925]  ? ktime_get+0xf/0xd0
[32120.623927]  ? ktime_get+0xf/0xd0
[32120.623930]  </NMI>
[32120.623930]  <TASK>
[32120.623931]  start_dl_timer+0x50/0xf0
[32120.623935]  update_curr_dl_se+0x85/0x1b0
[32120.623940]  pick_task_dl+0x45/0xa0
[32120.623943]  __schedule+0x49f/0x8f0
[32120.623947]  ? queue_delayed_work_on+0x58/0x60
[32120.623951]  schedule+0x27/0xd0
[32120.623953]  worker_thread+0x1a7/0x3b0
[32120.623958]  ? __pfx_worker_thread+0x10/0x10
[32120.623962]  kthread+0xd6/0x100
[32120.623966]  ? __pfx_kthread+0x10/0x10
[32120.623968]  ret_from_fork+0x34/0x50
[32120.623974]  ? __pfx_kthread+0x10/0x10
[32120.623976]  ret_from_fork_asm+0x1a/0x30
[32120.623984]  </TASK>
[32120.624832] rcu: rcu_preempt kthread starved for 10506 jiffies! g18282245 f0x0 RCU_GP_DOING_FQS(6) ->state=0x0 ->cpu=0
[32120.714332] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
[32120.715968] rcu: RCU grace-period kthread stack dump:
[32120.716880] task:rcu_preempt     state:R  running task     stack:14752 pid:16    tgid:16    ppid:2      flags:0x00004000
[32120.718830] Call Trace:
[32120.719276]  <TASK>
[32120.719671]  ? __schedule+0x3f0/0x8f0
[32120.720336]  ? lock_timer_base+0x4b/0x70
[32120.721052]  ? resched_cpu+0x35/0x80
[32120.721706]  ? force_qs_rnp+0x237/0x2b0
[32120.722398]  ? __pfx_rcu_watching_snap_recheck+0x10/0x10
[32120.723361]  ? rcu_gp_fqs_loop+0x39a/0x5e0
[32120.724105]  ? rcu_gp_kthread+0x18f/0x240
[32120.724838]  ? __pfx_rcu_gp_kthread+0x10/0x10
[32120.725627]  ? kthread+0xd6/0x100
[32120.726229]  ? __pfx_kthread+0x10/0x10
[32120.726912]  ? ret_from_fork+0x34/0x50
[32120.727598]  ? __pfx_kthread+0x10/0x10
[32120.728271]  ? ret_from_fork_asm+0x1a/0x30
[32120.729017]  </TASK>
[32120.729418] rcu: Stack dump where RCU GP kthread last ran:
[32120.730409] Sending NMI from CPU 7 to CPUs 0:
[32120.731222] NMI backtrace for cpu 0
[32120.731228] CPU: 0 UID: 0 PID: 16 Comm: rcu_preempt Not tainted 6.11.0-next-20240927-dirty #2148
[32120.731233] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[32120.731235] RIP: 0010:queued_spin_lock_slowpath+0x8e/0x2b0
[32120.731244] Code: 74 12 0f b6 45 00 84 c0 74 0a f3 90 0f b6 45 00 84 c0 75 f6 b8 01 00 00 00 66 89 45 00 5b 5d 41 5c 41 5d c3 cc cc cc cc f3 90 <eb> 89 8b 37 b8 00 02 00 00 81 fe 00 01 00 00 74 07 eb 99 83 e8 01
[32120.731248] RSP: 0000:ffffb7b80008bdd8 EFLAGS: 00000002
[32120.731251] RAX: 0000000000000001 RBX: 000000000000000c RCX: 0000000000000000
[32120.731253] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff9c6f1f52c400
[32120.731254] RBP: ffff9c6f1f52c400 R08: ffff9c6f1f52d298 R09: 000000000000007d
[32120.731256] R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000286
[32120.731258] R13: 0000000000000000 R14: ffffffff97341640 R15: 000000000000004c
[32120.731262] FS:  0000000000000000(0000) GS:ffff9c6f1f200000(0000) knlGS:0000000000000000
[32120.731264] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[32120.731266] CR2: ffff9c6f14201000 CR3: 0000000001154000 CR4: 00000000000006f0
[32120.731267] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[32120.731268] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[32120.731270] Call Trace:
[32120.731273]  <NMI>
[32120.731275]  ? nmi_cpu_backtrace+0x87/0xf0
[32120.731281]  ? nmi_cpu_backtrace_handler+0x11/0x20
[32120.731287]  ? nmi_handle+0x62/0x150
[32120.731293]  ? default_do_nmi+0x41/0x100
[32120.731297]  ? exc_nmi+0xe0/0x110
[32120.731299]  ? end_repeat_nmi+0xf/0x53
[32120.731304]  ? queued_spin_lock_slowpath+0x8e/0x2b0
[32120.731307]  ? queued_spin_lock_slowpath+0x8e/0x2b0
[32120.731310]  ? queued_spin_lock_slowpath+0x8e/0x2b0
[32120.731313]  </NMI>
[32120.731314]  <TASK>
[32120.731315]  resched_cpu+0x35/0x80
[32120.731320]  force_qs_rnp+0x237/0x2b0
[32120.731326]  ? __pfx_rcu_watching_snap_recheck+0x10/0x10
[32120.731330]  rcu_gp_fqs_loop+0x39a/0x5e0
[32120.731334]  rcu_gp_kthread+0x18f/0x240
[32120.731338]  ? __pfx_rcu_gp_kthread+0x10/0x10
[32120.731341]  kthread+0xd6/0x100
[32120.731345]  ? __pfx_kthread+0x10/0x10
[32120.731347]  ret_from_fork+0x34/0x50
[32120.731352]  ? __pfx_kthread+0x10/0x10
[32120.731354]  ret_from_fork_asm+0x1a/0x30
[32120.731360]  </TASK>

------------------------------------------------------------------------

This second stall also continues long enough to trigger a second
stall warning an additional 63 seconds in.

