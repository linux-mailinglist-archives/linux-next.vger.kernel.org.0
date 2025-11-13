Return-Path: <linux-next+bounces-8945-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D895C552FE
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 02:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E612634D550
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 01:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883FD1F4168;
	Thu, 13 Nov 2025 00:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLRbIhCD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4D4EEBB;
	Thu, 13 Nov 2025 00:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762995137; cv=none; b=iTqyZrOmSXQDUE9BiKJSMln7nOYvFwlCB72WNgBYcO5rWukub0hr+UTi7tEMZvQCECjzFMjS/NZewvPqqYUftEq/Z5pRJ6aBCEhHSMyx+2vtpfS+ol+wlzXnXa2A7SM93PPBuG2V3rq9SrB0skSr49rJk98AexKAvTIlHmCj+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762995137; c=relaxed/simple;
	bh=GhKyKGT1msMmQIs9FzohyY7HEDDj3Qc4tvlSfwYpNGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IU0JBUpbvsXSZbHLhjn+7LtKtpmR58C3+zhjOlw5AaRNITRICHTH7XcjggBlHK2TC+YPF/RSkN4fbdpAdVR2UmSUJylaIfNsDtJNy52GywZ89XooAo4eJPrd8d+YOPbpv4mtGD/fIoa2iOZnKUud64YxW6o9aZDT2tX/Ad/5IqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLRbIhCD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3CDC116B1;
	Thu, 13 Nov 2025 00:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762995136;
	bh=GhKyKGT1msMmQIs9FzohyY7HEDDj3Qc4tvlSfwYpNGw=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=YLRbIhCD43JO0ILd0rRv5Kh0shuoQE4u72BOM3tsnojofRMS5ivg/Pelr8GWZ0ydU
	 3bWfA58BRMmW7fXbKhsCfzv8op6jEfHRF330qd725fsKIR0YalwvJDFGpEhq/idbEv
	 /eFDuE5buF+dKjghB9gXF4ZjihM1Wm8lX3TFLCKuhcX5aoMRll1O1MBUYzzothnkFQ
	 bPcDbQYgQOmAXdx7wNvVU/fqr/O2bNbHz8T1N2GBhSo34UYPNLixaNC34zxrQ2CcBT
	 1GR2s7OnC2BSzRRG9jNNe99wVKgUkNsp0dpR7T1Re/5eIjhwz3ymVyquGodweas2Rg
	 LxxIz1KdW/6eA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 63FE5CE0876; Wed, 12 Nov 2025 16:52:16 -0800 (PST)
Date: Wed, 12 Nov 2025 16:52:16 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: d-tatianin@yandex-team.ru, pmladek@suse.com, john.ogness@linutronix.de,
	sfr@canb.auug.org.au, rostedt@goodmis.org, senozhatsky@chromium.org
Subject: [BUG -next] WARNING: kernel/printk/printk_ringbuffer.c:1278 at
 get_data+0xb3/0x100
Message-ID: <a2f58837-2b29-4318-9c78-5905ab2e9d3b@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

Some rcutorture runs on next-20251110 hit the following error on x86:

WARNING: kernel/printk/printk_ringbuffer.c:1278 at get_data+0xb3/0x100, CPU#0: rcu_torture_sta/63

This happens in about 20-25% of the rcutorture runs, and is the
WARN_ON_ONCE(1) in the "else" clause of get_data().  There was no
rcutorture scenario that failed to reproduce this bug, so I am guessing
that the various .config files will not provide useful information.
Please see the end of this email for a representative splat, which is
usually rcutorture printing out something or another.  (Which, in its
defense, has worked just fine in the past.)

Bisection converged on this commit:

67e1b0052f6b ("printk_ringbuffer: don't needlessly wrap data blocks around")

Reverting this commit suppressed (or at least hugely reduced the
probability of) the WARN_ON_ONCE().

The SRCU-T, SRCU-U, and TREE09 scenarios hit this most frequently at
about double the base rate, but are CONFIG_SMP=n builds.  The RUDE01
scenario was the most productive CONFIG_SMP=y scenario.  Reproduce as
follows, where "N" is the number of CPUs on your system divided by three,
rounded down:

tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 5 --configs "N*RUDE01"

Or if you can do CONFIG_SMP=n, the following works, where "N" is the
number of CPUs on your system:

tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 5 --configs "N*SRCU-T"

Or please tell me what debug I should enable on my runs.

							Thanx, Paul

------------------------------------------------------------------------

[ 1676.478083] WARNING: kernel/printk/printk_ringbuffer.c:1278 at get_data+0xb3/0x100, CPU#0: rcu_torture_sta/63
[ 1676.478092] Modules linked in:
[ 1676.478099] CPU: 0 UID: 0 PID: 63 Comm: rcu_torture_sta Not tainted 6.18.0-rc4-next-20251110-dirty #6903 PREEMPT(full)
[ 1676.478104] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[ 1676.478107] RIP: 0010:get_data+0xb3/0x100
[ 1676.478110] Code: 39 cf 75 50 48 8b 76 08 48 8d 4e 07 48 83 e1 f8 48 39 ce 75 4a 83 fa 07 76 50 83 ea 08 48 83 c0 08 41 89 11 c3 cc cc cc cc 90 <0f> 0b 90 31 c0 c3 cc cc cc cc 48 c7 c0 ff ff ff ff 44 29 c2 48 d3
[ 1676.478114] RSP: 0018:ffffb5e0c021bb98 EFLAGS: 00010006
[ 1676.478118] RAX: 0000000000000000 RBX: ffffffffbe27c560 RCX: 0000000000000012
[ 1676.478121] RDX: 0000000000000000 RSI: ffffffffbe342060 RDI: ffffffffbe27c590
[ 1676.478123] RBP: ffffb5e0c021bc78 R08: ffffffffffffff98 R09: ffffb5e0c021bbd0
[ 1676.478126] R10: 00003fffffffffff R11: ffffffffbe342058 R12: ffffb5e0c021bc60
[ 1676.478128] R13: 00000000ffffee71 R14: 000000000000003f R15: 0000000000000400
[ 1676.478133] FS:  0000000000000000(0000) GS:ffff9d0b605f7000(0000) knlGS:0000000000000000
[ 1676.478136] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1676.478139] CR2: ffff9d0b0ac01000 CR3: 0000000001ed2000 CR4: 00000000000006f0
[ 1676.478141] Call Trace:
[ 1676.478155]  <TASK>
[ 1676.478157]  prb_reserve_in_last+0x190/0x4d0
[ 1676.478163]  ? vsnprintf+0x11/0x4a0
[ 1676.478176]  vprintk_store+0x41e/0x530
[ 1676.478191]  vprintk_emit+0x8f/0x360
[ 1676.478199]  _printk+0x56/0x70
[ 1676.478207]  rcu_torture_stats_print+0x2fe/0x780
[ 1676.478218]  ? lock_release+0xc6/0x290
[ 1676.478222]  ? __pfx_rcu_torture_stats+0x10/0x10
[ 1676.478237]  ? __pfx_rcu_torture_stats+0x10/0x10
[ 1676.478241]  rcu_torture_stats+0x25/0x70
[ 1676.478245]  kthread+0x102/0x200
[ 1676.478252]  ? __pfx_kthread+0x10/0x10
[ 1676.478258]  ret_from_fork+0x23f/0x280
[ 1676.478266]  ? __pfx_kthread+0x10/0x10
[ 1676.478270]  ret_from_fork_asm+0x1a/0x30
[ 1676.478285]  </TASK>
[ 1676.478287] irq event stamp: 54788
[ 1676.478289] hardirqs last  enabled at (54787): [<ffffffffbc933c3d>] __up_console_sem+0x4d/0x60
[ 1676.478293] hardirqs last disabled at (54788): [<ffffffffbc935ecc>] vprintk_store+0x3cc/0x530
[ 1676.478297] softirqs last  enabled at (54672): [<ffffffffbc89fb8e>] handle_softirqs+0x2ee/0x3b0
[ 1676.478303] softirqs last disabled at (54659): [<ffffffffbc89fdb1>] __irq_exit_rcu+0xa1/0xc0

