Return-Path: <linux-next+bounces-6619-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C37B8AB05F5
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 00:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0EEC1B66464
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 22:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8612288D3;
	Thu,  8 May 2025 22:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwghq97I"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C42040A8;
	Thu,  8 May 2025 22:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746743395; cv=none; b=sK4xud0La8MBLg+wwleYya1Ms2SY2W1uEQrMcn0NXfl0uVfCM5M2Bpf/PtLndIXujXJI0vGMlZI5rOKNOiu6KVMzNSzGGxJxRtMFzXII/5q30vPYow9tIhYu/t+b1jp/18IWLazbtZzckPOeXFIEfRdoh/ccRW+jcK7wM3BZACc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746743395; c=relaxed/simple;
	bh=WW95/e28q1Oyg9LbCL7e4cJIeVH8K2yt8VFB8rXoxrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9GQ2bKEBx51Npt9aULLo8xZmkXrA63kXctprOfVgzh7osrg1f5hbYJZNkbDraz+EREY42/KxU2sbgd+oIdkjspGAXVwJh3ZiXsHPpepQX0Ab9jYyOmBFU1ERHW044wt9JGbsqwwgiUqBY8ATrEtnSvKp1pCYpYVbd/zODVDkR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwghq97I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA16C4CEE7;
	Thu,  8 May 2025 22:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746743395;
	bh=WW95/e28q1Oyg9LbCL7e4cJIeVH8K2yt8VFB8rXoxrM=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=fwghq97IVhyDz4qFny0JCHDrM5heiUjRCQFKoR28ka5Fostb5Spip90d2gb3jEH1P
	 d2ZKe5N1jZpFSU/wsPTsPCDpSU9O73bBSllA1hF5ln4SIHg5Tp65uJLnLRVuzmDJEN
	 J1Z+fpZ7ZaZnkLBNrj5VljPYYkAuipOkM4dVidLlO3k2q5ymW9WW2SZctDt2CfwGgg
	 i/nQnvnwZMiH3lrv/emGBMBSvS8Tbegsl4Jc0tDdLl2okZSQOxLPlgMYAf0YWoLfAd
	 R/yDxAEEQDqzHlaiDucc4VHLfrFLsqVT8+yNIRtK+m5jjV6U9ykWR+5X+kNU78iEX7
	 hM+ByPG61fWsA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A64E7CE11A4; Thu,  8 May 2025 15:29:54 -0700 (PDT)
Date: Thu, 8 May 2025 15:29:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: [BUG] Lockdep warning from "genirq/cpuhotplug: Convert to lock
 guards"
Message-ID: <a6f59b64-1604-4186-8a75-8ad776974a65@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, Thomas,

Testing next-20250508 with lockdep enabled got a splat that is shown in
all its glory below.  Reverting this commit makes the problem go away:

88a4df117ad6 ("genirq/cpuhotplug: Convert to lock guards")

Alternatively, changing that commit's final "scoped_guard(raw_spinlock"
to "scoped_guard(raw_spinlock_irq" also fixes things, as shown in the
incremental patch at the very end of this email.  If this is a proper fix,
please feel free to fold it into your original.

							Thanx, Paul

------------------------------------------------------------------------

[    0.608026] ================================
[    0.608026] WARNING: inconsistent lock state
[    0.608026] 6.15.0-rc5-next-20250508 #4883 Not tainted
[    0.608026] --------------------------------
[    0.608026] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
[    0.608026] cpuhp/1/21 [HC0[0]:SC0[0]:HE1:SE1] takes:
[    0.608026] ffff91f0010650c0 (&irq_desc_lock_class){?...}-{2:2}, at: irq_affinity_online_cpu+0x51/0x120
[    0.608026] {IN-HARDIRQ-W} state was registered at:
[    0.608026]   lock_acquire+0xbd/0x2d0
[    0.608026]   _raw_spin_lock+0x2b/0x40
[    0.608026]   handle_level_irq+0x18/0x160
[    0.608026]   __common_interrupt+0x4a/0xf0
[    0.608026]   common_interrupt+0x78/0x90
[    0.608026]   asm_common_interrupt+0x26/0x40
[    0.608026]   _raw_spin_unlock_irqrestore+0x34/0x50
[    0.608026]   __setup_irq+0x460/0x730
[    0.608026]   request_threaded_irq+0x10b/0x180
[    0.608026]   hpet_time_init+0x35/0x50
[    0.608026]   x86_late_time_init+0x16/0x40
[    0.608026]   start_kernel+0x6b6/0x810
[    0.608026]   x86_64_start_reservations+0x18/0x30
[    0.608026]   x86_64_start_kernel+0xc6/0xe0
[    0.608026]   common_startup_64+0x13e/0x148
[    0.608026] irq event stamp: 35
[    0.608026] hardirqs last  enabled at (35): [<ffffffffb8ede1fb>] finish_task_switch.isra.0+0xeb/0x300
[    0.608026] hardirqs last disabled at (34): [<ffffffffb9f01c69>] __schedule+0x909/0xfa0
[    0.608026] softirqs last  enabled at (0): [<ffffffffb8e9061b>] copy_process+0x98b/0x2070
[    0.608026] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.608026]
[    0.608026] other info that might help us debug this:
[    0.608026]  Possible unsafe locking scenario:
[    0.608026]
[    0.608026]        CPU0
[    0.608026]        ----
[    0.608026]   lock(&irq_desc_lock_class);
[    0.608026]   <Interrupt>
[    0.608026]     lock(&irq_desc_lock_class);
[    0.608026]
[    0.608026]  *** DEADLOCK ***
[    0.608026]
[    0.608026] 3 locks held by cpuhp/1/21:
[    0.608026]  #0: ffffffffba86d630 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun+0x4d/0x200
[    0.608026]  #1: ffffffffba86fd40 (cpuhp_state-up){+.+.}-{0:0}, at: cpuhp_thread_fun+0x4d/0x200
[    0.608026]  #2: ffffffffba95d6c8 (sparse_irq_lock){+.+.}-{4:4}, at: irq_affinity_online_cpu+0x16/0x120
[    0.608026]
[    0.608026] stack backtrace:
[    0.608026] CPU: 1 UID: 0 PID: 21 Comm: cpuhp/1 Not tainted 6.15.0-rc5-next-20250508 #4883 PREEMPT(full)
[    0.608026] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[    0.608026] Call Trace:
[    0.608026]  <TASK>
[    0.608026]  dump_stack_lvl+0x68/0xa0
[    0.608026]  print_usage_bug.part.0+0x22d/0x2d0
[    0.608026]  mark_lock+0x594/0x630
[    0.608026]  ? __lock_acquire+0x64d/0x18d0
[    0.608026]  __lock_acquire+0x408/0x18d0
[    0.608026]  ? mtree_load+0x81/0x5a0
[    0.608026]  ? find_held_lock+0x2b/0x80
[    0.608026]  lock_acquire+0xbd/0x2d0
[    0.608026]  ? irq_affinity_online_cpu+0x51/0x120
[    0.608026]  _raw_spin_lock+0x2b/0x40
[    0.608026]  ? irq_affinity_online_cpu+0x51/0x120
[    0.608026]  irq_affinity_online_cpu+0x51/0x120
[    0.608026]  ? __pfx_irq_affinity_online_cpu+0x10/0x10
[    0.608026]  cpuhp_invoke_callback+0x2e8/0x440
[    0.608026]  ? lock_release+0xc6/0x290
[    0.608026]  ? cpuhp_thread_fun+0x4d/0x200
[    0.608026]  cpuhp_thread_fun+0x181/0x200
[    0.608026]  ? __pfx_smpboot_thread_fn+0x10/0x10
[    0.608026]  smpboot_thread_fn+0xee/0x220
[    0.608026]  kthread+0x102/0x200
[    0.608026]  ? __pfx_kthread+0x10/0x10
[    0.608026]  ret_from_fork+0x165/0x1b0
[    0.608026]  ? __pfx_kthread+0x10/0x10
[    0.608026]  ret_from_fork_asm+0x1a/0x30
[    0.608026]  </TASK>

------------------------------------------------------------------------

diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index 7bd4c2a5cef4b..e77ca6db5e11e 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -243,7 +243,7 @@ int irq_affinity_online_cpu(unsigned int cpu)
 	irq_lock_sparse();
 	for_each_active_irq(irq) {
 		desc = irq_to_desc(irq);
-		scoped_guard(raw_spinlock, &desc->lock)
+		scoped_guard(raw_spinlock_irq, &desc->lock)
 			irq_restore_affinity_of_irq(desc, cpu);
 	}
 	irq_unlock_sparse();

