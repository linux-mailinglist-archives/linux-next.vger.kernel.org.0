Return-Path: <linux-next+bounces-3388-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4E95A733
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 23:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E16A282E0B
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 21:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65B917ADF8;
	Wed, 21 Aug 2024 21:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ev5kQYEA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF088179957;
	Wed, 21 Aug 2024 21:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277437; cv=none; b=IoQK7Fg+9VyL/5nC/1p0+6yXxnyBILPJ6bTZvAx3DqRMCyK0KrLM3xuSvjNWoO0rhMkOo2IT809Ml3WCLYKb+oLNeoCRI6cKLJUmWbXSBf++JIPvQJ+o2/P7ZnEKKKnJC8YVvMsod8DNaFgGtI1SYWAzbA1a0kf/YfUGxpaHRoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277437; c=relaxed/simple;
	bh=fqCw9bk/IIUXLwce6xFDRWbspEWvfM1fJofFr8HC0A4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Adamx6Hl1tbfkjSh2ry+bzYTbDZwU6g/MJ12Dtl6QhSht0YtoASLvviry8P2E7OwXMs23QXk7HZq/ueFyuYAyB+dba5OQjGn/MSY+P7Y6Aj9NNJkIbV+G/RngS76GnGmWuIrrg93Juu2Pq+oH8qcDPUtxJ1XUtgMNUxWKP0qbpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ev5kQYEA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5543DC32781;
	Wed, 21 Aug 2024 21:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724277437;
	bh=fqCw9bk/IIUXLwce6xFDRWbspEWvfM1fJofFr8HC0A4=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=ev5kQYEAHmMUERoYBwpUwjqoSDI2xiHRSLQN1phQcw+vO/Dn7fgS5cGBp7okdIOKG
	 +tNG7IzTZg4/6aSgQiTZwHYlgOkrhOz9G24Yr4w9gykSs24Gh8hM274WXezzkMdALX
	 9y8inYw5tITqTz6c5jlbGW6kFFUCFc7+FU6Dbyd4vT9VZ7ui2xJCFRQQiSkCS6wK9D
	 QZ38GoZ3o8n79gEtkUE5Ek0Rm8Stm3JeaqCWsxMjCtiwbmMqS+S31jG/GPLgRKPXu+
	 oXb3UN0bj2B+MSQvuwUW6HgJkfiZ2wOx3u71WjeZGRPHGbu+nPVRjEnlS9QblWxMSR
	 N/9/0AA4pbq6g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 00691CE1531; Wed, 21 Aug 2024 14:57:16 -0700 (PDT)
Date: Wed, 21 Aug 2024 14:57:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: peterz@infradead.org, vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello!

When running rcutorture scenario TREE03 on both next-20240820 and
next-20240821, I see failures like this about half a second into the run
("2024.08.21-11.24.13" on my laptop in case I overtrimmed):

------------------------------------------------------------------------

WARNING: CPU: 4 PID: 42 at kernel/sched/rt.c:1405 dequeue_rt_stack+0x246/0x290
Modules linked in:
CPU: 4 UID: 0 PID: 42 Comm: cpuhp/4 Not tainted 6.11.0-rc1-00048-gaef6987d8954 #152
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
RIP: 0010:dequeue_rt_stack+0x246/0x290
Code: f6 66 89 73 24 83 fa 63 0f 86 ad fe ff ff 90 0f 0b 90 e9 a4 fe ff ff 44 89 ee 48 89 df f7 de e8 50 22 ff ff e9 51 ff ff ff 90 <0f> 0b 90 e9 3a fe ff ff 90 0f 0b 90 e9 ef fd ff ff 8b 14 25 94 fe
RSP: 0000:ffffbc07801dfc18 EFLAGS: 00010046
RAX: ffff9ab05f22c200 RBX: ffff9ab04182e8c0 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff9ab05f22c200 RDI: ffff9ab04182e8c0
RBP: 000000000002c200 R08: ffffbc07801dfcf8 R09: ffff9ab04182efb4
R10: 0000000000000001 R11: 00000000ffffffff R12: ffff9ab04182e8c0
R13: 0000000000000001 R14: 000000000002c200 R15: 0000000000000008
FS:  0000000000000000(0000) GS:ffff9ab05f300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000011e2e000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 ? __warn+0x7e/0x120
 ? dequeue_rt_stack+0x246/0x290
 ? report_bug+0x18e/0x1a0
 ? handle_bug+0x3d/0x70
 ? exc_invalid_op+0x18/0x70
 ? asm_exc_invalid_op+0x1a/0x20
 ? dequeue_rt_stack+0x246/0x290
 dequeue_task_rt+0x68/0x160
 move_queued_task.constprop.0+0x62/0xf0
 affine_move_task+0x4a3/0x4d0
 ? affine_move_task+0x229/0x4d0
 __set_cpus_allowed_ptr+0x4e/0xa0
 set_cpus_allowed_ptr+0x36/0x60
 rcutree_affinity_setting+0x16a/0x1d0
 ? __pfx_rcutree_online_cpu+0x10/0x10
 rcutree_online_cpu+0x55/0x60
 cpuhp_invoke_callback+0x2cd/0x470

------------------------------------------------------------------------

My reproducer on the two-socket 40-core 80-HW-thread systems is:

tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "50*TREE03" --trust-make

This happens maybe half the time on a two-socket x86 system, and rather
less frequently on my 8-core (16 hardware threads) x86 laptop.  (I cheat
and use kvm-remote.sh on 10 two-socket x86 systems to speed things up
a bit.)  But bisection is uncharacteristically easy (once I got another
next-20240820 bug out of the way), and converges here:

2e0199df252a ("sched/fair: Prepare exit/cleanup paths for delayed_dequeue")

The preceding commit is very reliable.

Only instead of (or maybe as well as?) introducing the dequeue_rt_stack()
bug, the 2e0199df252a commit introduced a build bug:

------------------------------------------------------------------------

In file included from kernel/sched/fair.c:54:
kernel/sched/fair.c: In function ‘switched_from_fair’:
kernel/sched/sched.h:2154:58: error: ‘__SCHED_FEAT_DELAY_ZERO’ undeclared (first use in this function); did you mean ‘__SCHED_FEAT_LATENCY_WARN’?
 2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
      |                                                          ^~~~~~~~~~~~~
kernel/sched/fair.c:12878:21: note: in expansion of macro ‘sched_feat’
12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
      |                     ^~~~~~~~~~
kernel/sched/sched.h:2154:58: note: each undeclared identifier is reported only once for each function it appears in
 2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
      |                                                          ^~~~~~~~~~~~~
kernel/sched/fair.c:12878:21: note: in expansion of macro ‘sched_feat’
12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
      |                     ^~~~~~~~~~

------------------------------------------------------------------------

This build bug continues through this commit:

152e11f6df293 ("sched/fair: Implement delayed dequeue")

By which time it is also accompanied by this (admittedly trivial) warning:

------------------------------------------------------------------------

kernel/sched/fair.c: In function ‘requeue_delayed_entity’:
kernel/sched/fair.c:6818:24: error: unused variable ‘cfs_rq’ [-Werror=unused-variable]
 6818 |         struct cfs_rq *cfs_rq = cfs_rq_of(se);
      |                        ^~~~~~

------------------------------------------------------------------------

The commit following this one is:

54a58a7877916 ("sched/fair: Implement DELAY_ZERO")

This builds cleanly, but suffers from the dequeue_rt_stack() bug whose
splat is shown above.

Thoughts?

							Thanx, Paul

