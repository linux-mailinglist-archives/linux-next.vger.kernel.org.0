Return-Path: <linux-next+bounces-3398-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3495C134
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2024 01:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95B81C23883
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 23:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8C818AEA;
	Thu, 22 Aug 2024 23:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nypnCfzt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BE261FFC;
	Thu, 22 Aug 2024 23:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724367682; cv=none; b=f5JJ6R42o4chuEJTz9jwo8AJNg01b91lx4hU4mFZLO9Hoy7yBe9OrdnHh/+tjvKJFlmAcA5I50iz71lEHnopkXyOCHSgtYpbK4CzFwrPzxp94XaU7Cc+uCNcwGVWS2HYZUd4VmQSNzKXfoRGtoEphdm6Bx0fdy8WTpefksVHt6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724367682; c=relaxed/simple;
	bh=tSsEFOrH9/RQSwJgBOxgbfgiYl9ouMVXof8sIBSOlNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pq8+uo1tJt1lCu3u9gkCBNRBnoK9Ze1CrT+cbastaq17afE3tnj80QZuPcvQheUheOCyb12JM2J8GFRQTcOLC4DGBBJo1ux98jvthr/XRcUBZ0cb1n+7UsCW9h72MJcuOXp8Glq8PTpLeNHH0iabD9MLfJzIEQbiRf/rjksHfYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nypnCfzt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316D6C32782;
	Thu, 22 Aug 2024 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724367682;
	bh=tSsEFOrH9/RQSwJgBOxgbfgiYl9ouMVXof8sIBSOlNs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nypnCfztu/6rlG3AE87axSDKbVjXmvxYD8tgVyrzef7XgF2SdmB7Y/oDgXKhJ5+74
	 b8rwLVmaE9av1EhCG7vthXDWig4Wy0+wrkYSXpQYm322uZgx7Z8QxES0Qaof2dO+BN
	 B99BncmbTio8tHzQujVtkBbC5wOMEPSCqiWa3imo9suBOXNz3q+k42u0ftReitIbd0
	 0zM0aO1pyLSOZLIjOPftT6515qNZsapu0opo9L/HwNvHBA37mrvDsxqf3Y2L9qnmUg
	 pOPksbA36Wm1N6dntmXAEPJ4JeprMx6rpGak0wujadpawf5wb3MPW4bpTgOh5KG2Gr
	 gzOl2dFteTmuA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C1C68CE1279; Thu, 22 Aug 2024 16:01:21 -0700 (PDT)
Date: Thu, 22 Aug 2024 16:01:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: peterz@infradead.org, vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <a0a4229d-4c04-4de1-8b0f-93b3869bbd6b@paulmck-laptop>
Reply-To: paulmck@kernel.org
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
> Hello!
> 
> When running rcutorture scenario TREE03 on both next-20240820 and
> next-20240821, I see failures like this about half a second into the run
> ("2024.08.21-11.24.13" on my laptop in case I overtrimmed):
> 
> ------------------------------------------------------------------------
> 
> WARNING: CPU: 4 PID: 42 at kernel/sched/rt.c:1405 dequeue_rt_stack+0x246/0x290
> Modules linked in:
> CPU: 4 UID: 0 PID: 42 Comm: cpuhp/4 Not tainted 6.11.0-rc1-00048-gaef6987d8954 #152
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
> RIP: 0010:dequeue_rt_stack+0x246/0x290
> Code: f6 66 89 73 24 83 fa 63 0f 86 ad fe ff ff 90 0f 0b 90 e9 a4 fe ff ff 44 89 ee 48 89 df f7 de e8 50 22 ff ff e9 51 ff ff ff 90 <0f> 0b 90 e9 3a fe ff ff 90 0f 0b 90 e9 ef fd ff ff 8b 14 25 94 fe
> RSP: 0000:ffffbc07801dfc18 EFLAGS: 00010046
> RAX: ffff9ab05f22c200 RBX: ffff9ab04182e8c0 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffff9ab05f22c200 RDI: ffff9ab04182e8c0
> RBP: 000000000002c200 R08: ffffbc07801dfcf8 R09: ffff9ab04182efb4
> R10: 0000000000000001 R11: 00000000ffffffff R12: ffff9ab04182e8c0
> R13: 0000000000000001 R14: 000000000002c200 R15: 0000000000000008
> FS:  0000000000000000(0000) GS:ffff9ab05f300000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 0000000011e2e000 CR4: 00000000000006f0
> Call Trace:
>  <TASK>
>  ? __warn+0x7e/0x120
>  ? dequeue_rt_stack+0x246/0x290
>  ? report_bug+0x18e/0x1a0
>  ? handle_bug+0x3d/0x70
>  ? exc_invalid_op+0x18/0x70
>  ? asm_exc_invalid_op+0x1a/0x20
>  ? dequeue_rt_stack+0x246/0x290
>  dequeue_task_rt+0x68/0x160
>  move_queued_task.constprop.0+0x62/0xf0
>  affine_move_task+0x4a3/0x4d0
>  ? affine_move_task+0x229/0x4d0
>  __set_cpus_allowed_ptr+0x4e/0xa0
>  set_cpus_allowed_ptr+0x36/0x60
>  rcutree_affinity_setting+0x16a/0x1d0
>  ? __pfx_rcutree_online_cpu+0x10/0x10
>  rcutree_online_cpu+0x55/0x60
>  cpuhp_invoke_callback+0x2cd/0x470
> 
> ------------------------------------------------------------------------
> 
> My reproducer on the two-socket 40-core 80-HW-thread systems is:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "50*TREE03" --trust-make
> 
> This happens maybe half the time on a two-socket x86 system, and rather
> less frequently on my 8-core (16 hardware threads) x86 laptop.  (I cheat
> and use kvm-remote.sh on 10 two-socket x86 systems to speed things up
> a bit.)  But bisection is uncharacteristically easy (once I got another
> next-20240820 bug out of the way), and converges here:
> 
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
> ------------------------------------------------------------------------
> 
> This build bug continues through this commit:
> 
> 152e11f6df293 ("sched/fair: Implement delayed dequeue")
> 
> By which time it is also accompanied by this (admittedly trivial) warning:
> 
> ------------------------------------------------------------------------
> 
> kernel/sched/fair.c: In function ‘requeue_delayed_entity’:
> kernel/sched/fair.c:6818:24: error: unused variable ‘cfs_rq’ [-Werror=unused-variable]
>  6818 |         struct cfs_rq *cfs_rq = cfs_rq_of(se);
>       |                        ^~~~~~
> 
> ------------------------------------------------------------------------
> 
> The commit following this one is:
> 
> 54a58a7877916 ("sched/fair: Implement DELAY_ZERO")
> 
> This builds cleanly, but suffers from the dequeue_rt_stack() bug whose
> splat is shown above.
> 
> Thoughts?

Many of the failures seem to have little effect, that is, the system splats,
and then proceeds as if nothing had happened.  But sometimes things are
more serious:

------------------------------------------------------------------------

kernel BUG at kernel/sched/rt.c:1714!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.11.0-rc4-next-20240822 #53511
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
RIP: 0010:pick_next_task_rt+0x1d8/0x1e0
Code: 30 0a 00 00 8b 93 98 0a 00 00 f0 48 0f b3 90 b0 00 00 00 c6 83 20 08 00 00 00 e9 f2 fe ff ff f3 48 0f bc c0 e9 60 fe ff ff 90 <0f> 0b 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffffff90203e38 EFLAGS: 00010002
RAX: 0000000000000064 RBX: ffff8bd55f22c240 RCX: ffff8bd55f200000
RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff8bd55f22c240
RBP: ffffffff90203ec0 R08: 00000000000000b4 R09: 000000000000002e
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8bd55f22c240 R14: 0000000000000000 R15: ffffffff9020c940
FS:  0000000000000000(0000) GS:ffff8bd55f200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff8bd551401000 CR3: 000000001082e000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 ? die+0x32/0x90
 ? do_trap+0xd8/0x100
 ? pick_next_task_rt+0x1d8/0x1e0
 ? do_error_trap+0x60/0x80
 ? pick_next_task_rt+0x1d8/0x1e0
 ? exc_invalid_op+0x53/0x70
 ? pick_next_task_rt+0x1d8/0x1e0
 ? asm_exc_invalid_op+0x1a/0x20
 ? pick_next_task_rt+0x1d8/0x1e0
 __schedule+0x50b/0x8e0
 ? ct_kernel_enter.constprop.0+0x30/0xd0
 ? ct_idle_exit+0xd/0x20
 schedule_idle+0x1b/0x30
 cpu_startup_entry+0x24/0x30
 rest_init+0xbc/0xc0
 start_kernel+0x4f9/0x790
 x86_64_start_reservations+0x18/0x30
 x86_64_start_kernel+0xc6/0xe0
 common_startup_64+0x12c/0x138
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:pick_next_task_rt+0x1d8/0x1e0
Code: 30 0a 00 00 8b 93 98 0a 00 00 f0 48 0f b3 90 b0 00 00 00 c6 83 20 08 00 00 00 e9 f2 fe ff ff f3 48 0f bc c0 e9 60 fe ff ff 90 <0f> 0b 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffffff90203e38 EFLAGS: 00010002
RAX: 0000000000000064 RBX: ffff8bd55f22c240 RCX: ffff8bd55f200000
RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff8bd55f22c240
RBP: ffffffff90203ec0 R08: 00000000000000b4 R09: 000000000000002e
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8bd55f22c240 R14: 0000000000000000 R15: ffffffff9020c940
FS:  0000000000000000(0000) GS:ffff8bd55f200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff8bd551401000 CR3: 000000001082e000 CR4: 00000000000006f0
Kernel panic - not syncing: Attempted to kill the idle task!
Shutting down cpus with NMI

------------------------------------------------------------------------

							Thanx, Paul

