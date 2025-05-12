Return-Path: <linux-next+bounces-6714-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E58AB4808
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 01:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92719463D4A
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 23:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FD12580FD;
	Mon, 12 May 2025 23:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFF5XXF7"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0925779D2;
	Mon, 12 May 2025 23:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747093633; cv=none; b=vDAbeGJ1noeu3rxK/GWBxmimekclp2fzl+lV2GKaE9ebOn/Pm2SHSzLBlYbumiV21FnXroPdprF0iIRXiQPeIbpIH0haC2XKpEEVVmFLvpej8B3fpiyxkDu+uT8mi7dCc8J9r2WoqxyOzQ2b2Qz6VrZLtetgPhS+xRUbqbMW5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747093633; c=relaxed/simple;
	bh=7Zpo5c9qWjo1T46Pm/naZnA314vpTzFNCS+RqT/f1sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CnzaQ04z5e+0KxNR6qm0LECeCy7SkfHIchBrlYxALtoSQSarkIDmMoItvOJQPYM2lMvVn4XSR8fOQDrImzed5jZeB2xVkHht+BAEzo+Pb0vbtQPWzUFrfBR2UGRuemHQN9CWzB54PBEN2KbTjbmYXLoIcSJO8FBsn+btkPzLuiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFF5XXF7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63499C4CEE7;
	Mon, 12 May 2025 23:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747093632;
	bh=7Zpo5c9qWjo1T46Pm/naZnA314vpTzFNCS+RqT/f1sI=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=KFF5XXF7CyjOyoHzSsMD6uNKS/P8jAtGzsNilMLyFW+pOjfnW4leY6XDsfjldQzrd
	 A9SvAvwQHAVmmila9TgHz1tOTtvaICs/8IIt0a9KqtuMRV3XB5Zs8NO3FvM3y3UP8+
	 iZRDgX/C/kVwev74o6r5yWKqYHyu/aFfwQXlzmDnpP8b/+1TN5IOHABXeWb/+boTbi
	 8+f84ohbp0KPYkLbCa9t5oWs1q9lZVwDOeLy1IRu86A6XWxg3asbf4w7Kl2oW3Js/z
	 abySXkRxo4iLqhgBR6xVLLzpLrchyIsXAkEvrVP2fiox5zm1DAzBUozO2aqT+cV/NY
	 iH/xAJNLnUAHg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 02A9ACE0857; Mon, 12 May 2025 16:47:12 -0700 (PDT)
Date: Mon, 12 May 2025 16:47:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dmitry Vyukov <dvyukov@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org, linux-mm@kvack.org
Subject: [BUG] sleeping function called from invalid context at
 ./include/linux/sched/mm.h:321
Message-ID: <a5c939c4-b123-4b2f-8a22-130e508cbcce@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello!

The next-20250512 release got the following while running either of the
rcutorture TINY02 and SRCU-T scenarios with strict KCSAN enabled:

BUG: sleeping function called from invalid context at ./include/linux/sched/mm.h:321

This is the last line of this function:

	static inline void might_alloc(gfp_t gfp_mask)
	{
		fs_reclaim_acquire(gfp_mask);
		fs_reclaim_release(gfp_mask);

		might_sleep_if(gfpflags_allow_blocking(gfp_mask));
	}

The reproducer is as follows:

tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs TINY02 --kcsan --kmake-arg CC=clang

I ran this on x86 with clang version 19.1.7 (CentOS 19.1.7-1.el9).

See below for the full splat.  The TINY02 and SRCU-T scenarios are unique
in setting both CONFIG_SMP=n and CONFIG_PROVE_LOCKING=y.

Bisection converges here:

c836e5a70c59 ("genirq/chip: Rework irq_set_msi_desc_off()")

The commit reverts cleanly, but results in the following build error:

kernel/irq/chip.c:98:26: error: call to undeclared function 'irq_get_desc_lock'

Thoughts?

						Thanx, Paul

------------------------------------------------------------------------

[    8.862165] BUG: sleeping function called from invalid context at ./include/linux/sched/mm.h:321 
[    8.862706] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper
[    8.862706] preempt_count: 0, expected: 0
[    8.862706] 1 lock held by swapper/1:
[    8.862706]  #0: ffff99018127a1a0 (&dev->mutex){....}-{4:4}, at: __driver_attach+0x189/0x2f0 
[    8.862706] irq event stamp: 83979
[    8.862706] hardirqs last  enabled at (83978): [<ffffffff8b01a83d>] _raw_spin_unlock_irqrestore+0x3d/0x60
[    8.862706] hardirqs last disabled at (83979): [<ffffffff8b01a616>] _raw_spin_lock_irqsave+0x56/0xb0
[    8.862706] softirqs last  enabled at (83749): [<ffffffff896e22d8>] __irq_exit_rcu+0x58/0xc0
[    8.862706] softirqs last disabled at (83740): [<ffffffff896e22d8>] __irq_exit_rcu+0x58/0xc0
[    8.862706] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.15.0-rc5-next-20250508-00001-g3d99c237b0d4-dirty #4043 NONE
[    8.862706] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[    8.862706] Call Trace:
[    8.862706]  <TASK>
[    8.862706]  dump_stack_lvl+0x77/0xb0
[    8.862706]  dump_stack+0x19/0x24
[    8.862706]  __might_resched+0x282/0x2a0
[    8.862706]  __kmalloc_node_track_caller_noprof+0xa1/0x2a0
[    8.862706]  ? _pcim_request_region+0x55/0x190
[    8.862706]  ? __pfx_pcim_addr_resource_release+0x10/0x10
[    8.862706]  __devres_alloc_node+0x4b/0xc0
[    8.862706]  _pcim_request_region+0x55/0x190
[    8.862706]  pcim_request_all_regions+0x37/0x260
[    8.862706]  ahci_init_one+0x2f0/0x1750
[    8.862706]  ? rpm_resume+0x48d/0xc30
[    8.862706]  ? __pm_runtime_resume+0xa7/0xc0
[    8.862706]  pci_device_probe+0xfc/0x1b0
[    8.862706]  really_probe+0x1ba/0x500
[    8.862706]  __driver_probe_device+0x137/0x1a0
[    8.862706]  driver_probe_device+0x67/0x2d0
[    8.862706]  __driver_attach+0x194/0x2f0
[    8.862706]  ? __pfx___driver_attach+0x10/0x10
[    8.862706]  bus_for_each_dev+0x17a/0x1d0
[    8.862706]  driver_attach+0x30/0x40
[    8.862706]  bus_add_driver+0x22a/0x380
[    8.862706]  driver_register+0xcf/0x1c0
[    8.862706]  __pci_register_driver+0xfc/0x120
[    8.862706]  ? __pfx_ahci_pci_driver_init+0x10/0x10
[    8.862706]  ahci_pci_driver_init+0x24/0x40
[    8.862706]  ? __pfx_ahci_pci_driver_init+0x10/0x10
[    8.862706]  do_one_initcall+0xfb/0x300
[    8.862706]  ? prb_first_seq+0x1ba/0x1f0
[    8.862706]  ? _prb_read_valid+0x627/0x660
[    8.862706]  ? prb_read_valid+0x47/0x70
[    8.862706]  ? console_unlock+0x179/0x1a0
[    8.862706]  ? vprintk_emit+0x43d/0x480
[    8.862706]  ? _printk+0x83/0xb0
[    8.862706]  ? parse_args+0x24f/0x5a0
[    8.862706]  do_initcall_level+0x91/0xf0
[    8.862706]  do_initcalls+0x60/0xa0
[    8.862706]  ? __pfx_kernel_init+0x10/0x10
[    8.862706]  do_basic_setup+0x41/0x50
[    8.862706]  kernel_init_freeable+0xb3/0x120
[    8.862706]  kernel_init+0x20/0x200
[    8.862706]  ret_from_fork+0x13e/0x1e0
[    8.862706]  ? __pfx_kernel_init+0x10/0x10
[    8.862706]  ret_from_fork_asm+0x19/0x30
[    8.862706]  </TASK>

