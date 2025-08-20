Return-Path: <linux-next+bounces-8035-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 349BBB2D9F8
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 12:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0F81C40976
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 10:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B2F2C21D8;
	Wed, 20 Aug 2025 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="LX4KEaee"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA2519D8A8
	for <linux-next@vger.kernel.org>; Wed, 20 Aug 2025 10:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755685521; cv=pass; b=iQHRU0eDUurcFVjUALLgn5ib6ukMbpCD7mRMS8rWtLOBUdqLtjy89bGm+QKPqsIyEnNyS1KGqYLcaeC6xDNFtBSYrCdOCvpcP1H1rI+155RVNvH4cQsAEevlhOlkLBrNKtkRTFwLRGhM3w3HN0ZTpz9Pda/u5O1aFOCwu696uEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755685521; c=relaxed/simple;
	bh=MutQRfU1vlAAyDrHvo83dHCHOplPvJiMt+FOhq2qVoQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VSd7IYxGuOkYezzNGWtTezFHHR1kI1sJpdtmOvyz1Bo0mRqa8TwKJB/Y2seUghVsRiKew0dDb+odNZkAeh6V8g9IaKgPxTxmdLeYFeXLhYI/whWq8Gs4OkCLrE0OwajhhwRvBO9nCVEQ/Oti9fwfKBBTY7NKFxHawZoe5M+aIdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=LX4KEaee; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755685507; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h+AXgcvpxaUzhSA5YhulYfrjQ4KFcdOtl1RQpZ7oMSLx4x/g+mILjjK+xwqh50gjr+AmDdUdaIGIn0MEI6apJ3oIokXP1gsF6Dc/JpXEg41cB/PnMQ2m4cgkJOgTGgzArDs3BdIeFLXGwzEvgXPQ2xXXnQXI68kUjrS8HgaQ7wg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755685507; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1BvZFqmRTJ7ahMq/XeE/0dEi295M+UK3CiexvNDLCpk=; 
	b=Q7mFMEBNFHrliTOFA8r99c0TuW6/ceLcyqDZcmb4qS9Mofdo4DwZZ3ttTu7Xsue2cXn6d0RetGQCbvd8ek7KXWQHrEogY/OSfvUKIzNLombVH2xVqZUjR+xGZ0gydYEEEUKqiW0G8zaxULO7cOwchW7KIBgGNAf5uW/z2k20LBc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755685507;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=1BvZFqmRTJ7ahMq/XeE/0dEi295M+UK3CiexvNDLCpk=;
	b=LX4KEaeeJkwci3Q/FTR8g0+bk4Xjs8UzJvLG0dZbfihZ98yMW1ucPyZuQvbZzwEQ
	AviazBo0V/TeIh3b2NkExDU4tl4hZzf9KonGFrBfPv78LXbVNPNuM8LvEVSreXR7jb8
	xlBfwwtJorwTGvM8KIbnMp/lzm9f1x5r3W42Wexg=
Received: by mx.zohomail.com with SMTPS id 1755685504993404.4586990290858;
	Wed, 20 Aug 2025 03:25:04 -0700 (PDT)
Message-ID: <b169f9cc331254dafc3060b0dc3b8bfee882a285.camel@collabora.com>
Subject: Re: [REGRESSION] next/master: (boot) sleeping function called from
 invalid context at kernel/locking/rw...
From: Gustavo Padovan <gus@collabora.com>
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-next@vger.kernel.org
Date: Wed, 20 Aug 2025 07:25:00 -0300
In-Reply-To: <175568535010.3222387.7351336690916179632@poutine>
References: <175568535010.3222387.7351336690916179632@poutine>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Wed, 2025-08-20 at 10:22 +0000, KernelCI bot wrote:
>=20
>=20
>=20
>=20
>=20
> Hello,
>=20
> New boot regression found on next/master:
>=20
> ---
> =C2=A0sleeping function called from invalid context at
> kernel/locking/rwsem.c:1589
> [logspec:generic_linux_boot,linux.kernel.bug]
> ---
>=20
> - dashboard:
> https://d.kernelci.org/i/maestro:4a7604ad2b208f9142109c871e17a6453ee9ff9c
> - giturl:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:=C2=A0 5303936d609e09665deda94eaedf26a0e5c3a087
> - tags: next-20250820
>=20
>=20
> Log excerpt:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Our logspec tool failed to collect the relevant part of the crash.
Here it is: (We will fix this).


[    5.926489] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    5.930486] [ BUG: Invalid wait context ]
[    5.934484] 6.17.0-rc2-next-20250820 #1 Not tainted
[    5.939350] -----------------------------
[    5.943347] kworker/u32:0/12 is trying to lock:
[    5.947864] ffffbca6d49c19b8 (sysfs_symlink_target_lock){+.+.}-
{3:3}, at: sysfs_remove_dir+0x48/0xe8
[    5.956997] other info that might help us debug this:
[    5.962034] context-{5:5}
[    5.964642] 4 locks held by kworker/u32:0/12:
[    5.968986]  #0: ffff0000c0039148
((wq_completion)events_unbound){+.+.}-{0:0}, at:
process_one_work+0x674/0x1800
[    5.979153]  #1: ffff800080187ce0 (deferred_probe_work){+.+.}-{0:0},
at: process_one_work+0x698/0x1800
[    5.988450]  #2: ffff0000c24a10f8 (&dev->mutex){....}-{4:4}, at:
__device_attach+0x80/0x358
[    5.996794]  #3: ffffbca6d6571cd8 (devtree_lock){....}-{2:2}, at:
of_find_node_with_property+0x34/0x204
[    6.003882] usb 1-1: new high-speed USB device number 2 using xhci-
mtk
[    6.006180] stack backtrace:
[    6.006183] CPU: 7 UID: 0 PID: 12 Comm: kworker/u32:0 Not tainted
6.17.0-rc2-next-20250820 #1 PREEMPT
[    6.006187] Hardware name: Acer Tomato (rev2) board (DT)
[    6.006190] Workqueue: events_unbound deferred_probe_work_func
[    6.006195] Call trace:
[    6.006196]  show_stack+0x18/0x24 (C)
[    6.006201]  dump_stack_lvl+0x90/0xd0
[    6.006205]  dump_stack+0x1c/0x28
[    6.006208]  __lock_acquire+0x924/0xc2c
[    6.006213]  lock_acquire.part.0+0x164/0x25c
[    6.006216]  lock_acquire+0x88/0x1a0
[    6.006219]  _raw_spin_lock+0xa8/0xd8
[    6.006223]  sysfs_remove_dir+0x48/0xe8
[    6.006226]  __kobject_del+0xb0/0x27c
[    6.006228]  kobject_release+0xfc/0x134
[    6.006231]  kobject_put+0xb0/0x130
[    6.006234]  of_node_put+0x18/0x28
[    6.006237]  of_find_node_with_property+0xcc/0x204
[    6.006240]  scpsys_get_bus_protection_legacy+0x16c/0x428
[    6.006244]  scpsys_probe+0x3bc/0x584
[    6.006247]  platform_probe+0xc4/0x1c0
[    6.006250]  really_probe+0x188/0x5d0
[    6.006253]  __driver_probe_device+0x160/0x2e8
[    6.006256]  driver_probe_device+0x5c/0x298
[    6.006259]  __device_attach_driver+0x184/0x328
[    6.006262]  bus_for_each_drv+0x104/0x18c
[    6.006265]  __device_attach+0x168/0x358
[    6.006268]  device_initial_probe+0x14/0x20
[    6.006271]  bus_probe_device+0x128/0x160
[    6.006274]  deferred_probe_work_func+0x128/0x1d0
[    6.006277]  process_one_work+0x740/0x1800
[    6.006279]  worker_thread+0x738/0xb88
[    6.006282]  kthread+0x328/0x3d4
[    6.006285]  ret_from_fork+0x10/0x20
[    6.006291] BUG: sleeping function called from invalid context at
kernel/locking/rwsem.c:1589
[    6.017529] i2c_hid_of 4-0010: i2c_hid_get_input: IRQ triggered but
there's no data
[    6.024878] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
12, name: kworker/u32:0
[    6.024881] preempt_count: 1, expected: 0
[    6.024882] RCU nest depth: 0, expected: 0
[    6.024884] INFO: lockdep is turned off.
[    6.024886] irq event stamp: 537370
[    6.024887] hardirqs last  enabled at (537369): [<ffffbca6cf0a140c>]
_raw_spin_unlock_irqrestore+0x84/0x90
[    6.024891] hardirqs last disabled at (537370): [<ffffbca6cf0a033c>]
_raw_spin_lock_irqsave+0xe0/0xf4
[    6.024894] softirqs last  enabled at (365608): [<ffffbca6cb9bcfc4>]
handle_softirqs+0x8ec/0xd90
[    6.219570] softirqs last disabled at (365431): [<ffffbca6cb810ab8>]
__do_softirq+0x14/0x20
[    6.227908] CPU: 7 UID: 0 PID: 12 Comm: kworker/u32:0 Not tainted
6.17.0-rc2-next-20250820 #1 PREEMPT
[    6.227912] Hardware name: Acer Tomato (rev2) board (DT)
[    6.227914] Workqueue: events_unbound deferred_probe_work_func
[    6.227919] Call trace:
[    6.227920]  show_stack+0x18/0x24 (C)
[    6.227923]  dump_stack_lvl+0x90/0xd0
[    6.227927]  dump_stack+0x1c/0x28
[    6.227930]  __might_resched+0x360/0x578
[    6.227933]  __might_sleep+0xa4/0x16c
[    6.227937]  down_write+0x8c/0x21c
[    6.227940]  kernfs_remove+0x28/0x4c
[    6.227944]  sysfs_remove_dir+0xa8/0xe8
[    6.227947]  __kobject_del+0xb0/0x27c
[    6.227950]  kobject_release+0xfc/0x134
[    6.227952]  kobject_put+0xb0/0x130
[    6.227955]  of_node_put+0x18/0x28
[    6.227958]  of_find_node_with_property+0xcc/0x204
[    6.227961]  scpsys_get_bus_protection_legacy+0x16c/0x428
[    6.227965]  scpsys_probe+0x3bc/0x584
[    6.227967]  platform_probe+0xc4/0x1c0
[    6.227971]  really_probe+0x188/0x5d0
[    6.227974]  __driver_probe_device+0x160/0x2e8
[    6.227977]  driver_probe_device+0x5c/0x298
[    6.227980]  __device_attach_driver+0x184/0x328
[    6.227983]  bus_for_each_drv+0x104/0x18c
[    6.227985]  __device_attach+0x168/0x358
[    6.227988]  device_initial_probe+0x14/0x20
[    6.227991]  bus_probe_device+0x128/0x160
[    6.227993]  deferred_probe_work_func+0x128/0x1d0
[    6.227996]  process_one_work+0x740/0x1800
[    6.227999]  worker_thread+0x738/0xb88
[    6.228002]  kthread+0x328/0x3d4
[    6.228004]  ret_from_fork+0x10/0x20
[   31.875576] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[   32.017394] rcu: ?7-...0: (14 ticks this GP)
idle=3D3c14/1/0x4000000000000000 softirq=3D936/941 fqs=3D1298
[   32.026515] rcu: ?(detected by 5, t=3D6503 jiffies, g=3D-383, q=3D816
ncpus=3D8)
[   32.033203] Sending NMI from CPU 5 to CPUs 7:
[   44.067673] watchdog: CPU1: Watchdog detected hard LOCKUP on cpu 2
[   44.073902] Modules linked in:
[   44.073927] irq event stamp: 17405
[   44.073942] hardirqs last  enabled at (17405): [<ffffbca6ce8032c0>]
psci_cpu_suspend_enter+0x1b8/0x320
[   44.073994] hardirqs last disabled at (17404): [<ffffbca6cbaba4e8>]
do_idle+0xf8/0x1a0
[   44.074038] softirqs last  enabled at (17402): [<ffffbca6cb9bcfc4>]
handle_softirqs+0x8ec/0xd90
[   44.074079] softirqs last disabled at (17397): [<ffffbca6cb810ab8>]
__do_softirq+0x14/0x20
[   44.074118] Sending NMI from CPU 1 to CPUs 2:
[   44.103650] watchdog: CPU5: Watchdog detected hard LOCKUP on cpu 6
[   44.125270] Modules linked in:
[   44.125273] irq event stamp: 26161
[   44.125274] hardirqs last  enabled at (26161): [<ffffbca6ce8032c0>]
psci_cpu_suspend_enter+0x1b8/0x320
[   44.125281] hardirqs last disabled at (26160): [<ffffbca6cbaba4e8>]
do_idle+0xf8/0x1a0
[   44.125286] softirqs last  enabled at (26140): [<ffffbca6cb9bcfc4>]
handle_softirqs+0x8ec/0xd90
[   44.125289] softirqs last disabled at (26135): [<ffffbca6cb810ab8>]
__do_softirq+0x14/0x20
[   56.471758] sched: DL replenish lagged too much
[  109.911578] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  109.917672] rcu: ?7-...0: (14 ticks this GP)
idle=3D3c14/1/0x4000000000000000 softirq=3D936/941 fqs=3D4192
[  109.926794] rcu: ?(detected by 4, t=3D26012 jiffies, g=3D-383, q=3D816
ncpus=3D8)
[  109.933570] Sending NMI from CPU 4 to CPUs 7:
[  187.931577] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  187.937669] rcu: ?7-...0: (14 ticks this GP)
idle=3D3c14/1/0x4000000000000000 softirq=3D936/941 fqs=3D7593
[  187.946790] rcu: ?(detected by 4, t=3D45517 jiffies, g=3D-383, q=3D816
ncpus=3D8)
[  187.953565] Sending NMI from CPU 4 to CPUs 7:
[  265.951574] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  265.957666] rcu: ?7-...0: (14 ticks this GP)
idle=3D3c14/1/0x4000000000000000 softirq=3D936/941 fqs=3D10993
[  265.966873] rcu: ?(detected by 5, t=3D65022 jiffies, g=3D-383, q=3D816
ncpus=3D8)

>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
>=20
> # Hardware platforms affected:
>=20
> ## mt8186-corsola-steelix-sku131072
> - dashboard:
> https://d.kernelci.org/test/maestro:68a572e9233e484a3fa2c0db
> - compatibles: google,steelix-sku131072 | google,steelix
> - 1 fails since 2025-08-20 07:25 UTC
> - test path: boot
> - last pass:
> https://d.kernelci.org/test/maestro:68a429e6233e484a3fa0aba6
> =C2=A0=C2=A0=C2=A0 - on 2025-08-19 07:38 UTC
> =C2=A0=C2=A0=C2=A0 - commit hash:=C2=A0 886e5e7b0432360842303d587bb4a65d1=
0741ae8
> =C2=A0=C2=A0=C2=A0 - test id:=C2=A0 maestro:68a429e6233e484a3fa0aba6
>=20
> ## mt8195-cherry-tomato-r2
> - dashboard:
> https://d.kernelci.org/test/maestro:68a572ea233e484a3fa2c0e1
> - compatibles: google,tomato-rev2 | google,tomato | mediatek,mt8195
> - 1 fails since 2025-08-20 07:25 UTC
> - test path: boot
> - last pass:
> https://d.kernelci.org/test/maestro:68a2ce76233e484a3f9e5dcc
> =C2=A0=C2=A0=C2=A0 - on 2025-08-18 06:55 UTC
> =C2=A0=C2=A0=C2=A0 - commit hash:=C2=A0 3ac864c2d9bb8608ee236e89bf5618116=
13abfce
> =C2=A0=C2=A0=C2=A0 - test id:=C2=A0 maestro:68a2ce76233e484a3f9e5dcc
>=20
>=20
> #kernelci issue maestro:4a7604ad2b208f9142109c871e17a6453ee9ff9c
>=20
> Reported-by: kernelci.org bot <bot@kernelci.org>
>=20
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
>=20
> Made with love by the KernelCI team - https://kernelci.org


