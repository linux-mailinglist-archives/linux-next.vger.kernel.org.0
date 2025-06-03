Return-Path: <linux-next+bounces-7025-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53AACC9C3
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 17:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06D7B3A3F95
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 15:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B5B231845;
	Tue,  3 Jun 2025 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ox6M4tVk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CAE1DA23
	for <linux-next@vger.kernel.org>; Tue,  3 Jun 2025 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962959; cv=none; b=Mx/2fx6cEg+LEaa/d3Hn37Q9VkptNHgu8pdUvTwuZ/LvOn5Rm5mBPZu+JnpIBzQqtKIaiJ89rz/iKsYN5/bvjZH4G3m0NXH6+mJYVWPeoZSWj5rds0NpCp5b+O06VBB2eqXKFcFQ11A+bom6r+DMi3RkTC0G0GDoVcWTFdCC+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962959; c=relaxed/simple;
	bh=Qestmp8LxHG+2fTW0KxzPaHYwSP4CsgO1JO6DBOnXHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jygurb1NBpmFk88evx2HhLBwQtE5y0ImXTmQyFxuotz1WjNyObyPG5ZWgqa9m9Y8TjiEYT7tx0eB96B6ysoHubOa2EtjSgMN3tm7wgK+017KhdpqnWkkrM9U30bttZzzOAGWAd6EvjzHxqQZu+hpJKtdUJdKHAaNgsD+I56u/Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ox6M4tVk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C210C4CEED;
	Tue,  3 Jun 2025 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748962957;
	bh=Qestmp8LxHG+2fTW0KxzPaHYwSP4CsgO1JO6DBOnXHQ=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=Ox6M4tVk69wgNiIm/B1B8z/1TCVdxx4JF/YxmmIoo+JOeJ6E+GfHKgfwLoJRQdh1B
	 +UFoJxc0yiRiUOyEm+yZ06Nxs3wFIh9McfWEudhj4QTwCrytdZCfJHkTnOdryFgtyS
	 9o3KwRL2gbzloc6A9w2DaVlZyBCw7HRlawp5Pw1LmVcdSmuLxjVjlZsPtCThmWvmGw
	 ix8ucP2NtYk9bnb7CLXmI/YbYHpaQW+LSMHGOb8798ddszNvnbxirTl8867IySs7b4
	 O+s37jc/ZOTuK3dFxcr4TH69AMKYaIet+Kiapc9tvBi1dBv9wM57RpVC591FAvukgp
	 6YyibpKOZcuNg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BC4B0CE077D; Tue,  3 Jun 2025 08:02:36 -0700 (PDT)
Date: Tue, 3 Jun 2025 08:02:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: inwardvessel@gmail.com
Cc: klarasmodin@gmail.com, tj@kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org
Subject: BUG: kernel NULL pointer dereference, address: 0000000000000020
Message-ID: <04ca279b-8c96-4072-9b19-0001e7da5124@paulmck-laptop>
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

Running rcutorture scenario SRCU-T on next-20250602 gets me the following
splat, with CONFIG_SMP=y and CONFIG_PROVE_LOCKING=y appearing to be what
exposes this issue (alleged fix at end of this email):

[    0.584099] BUG: kernel NULL pointer dereference, address: 0000000000000020
[    0.584530] #PF: supervisor write access in kernel mode
[    0.584530] #PF: error_code(0x0002) - not-present page
[    0.584530] PGD 0 P4D 0 
[    0.584530] Oops: Oops: 0002 [#1] PTI
[    0.584530] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-next-20250530 #5184 NONE  
[    0.584530] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[    0.584530] RIP: 0010:lockdep_init_map_type+0x1c/0x230
[    0.584530] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 41 55 41 89 cd 41 54 49 89 d4 8b 15 fc 59 f1 02 55 48 89 fd 8b 44 24 20 <48> c7 47 08 00 00 00 00 48 c7 47 10 00 00 00 00 85 d2 0f 84 a2 00
[    0.584530] RSP: 0000:ffffffff83a03e30 EFLAGS: 00010246
[    0.584530] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[    0.584530] RDX: 0000000000000000 RSI: ffffffff837ff493 RDI: 0000000000000018
[    0.584530] RBP: 0000000000000018 R08: 0000000000000002 R09: 0000000000000000
[    0.584530] R10: 0000000000000001 R11: 0000000000001f20 R12: ffffffff850436e0
[    0.584530] R13: 0000000000000000 R14: ffffffff83b66da8 R15: ffffffff83c00ec0
[    0.584530] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[    0.584530] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.584530] CR2: 0000000000000020 CR3: 0000000012a50000 CR4: 00000000000006f0
[    0.584530] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    0.584530] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    0.584530] Call Trace:
[    0.584530]  <TASK>
[    0.584530]  __raw_spin_lock_init+0x3a/0x60
[    0.584530]  ss_rstat_init+0x4b/0x80
[    0.584530]  cgroup_init_subsys+0x170/0x1c0
[    0.584530]  cgroup_init+0x3cb/0x460
[    0.584530]  start_kernel+0x689/0x770
[    0.584530]  x86_64_start_reservations+0x18/0x30
[    0.584530]  x86_64_start_kernel+0x102/0x120
[    0.584530]  common_startup_64+0xc0/0xc8
[    0.584530]  </TASK>
[    0.584530] Modules linked in:
[    0.584530] CR2: 0000000000000020
[    0.584530] ---[ end trace 0000000000000000 ]---

This bisects to the following commit:

731bdd97466a ("cgroup: avoid per-cpu allocation of size zero rstat cpu locks")

Part of the issue is that the comment's assertion that "arch_spinlock_t
is defined as an empty struct" can be inaccurate.  First, the
cgroup_subsys structure's ->rstat_ss_cpu_lock field is not an
arch_spinlock_t, but rather a raw_spinlock_t.  Although this is empty
in production kernels built with CONFIG_SMP=n, in debugging kernels
built with either CONFIG_DEBUG_SPINLOCK=y or (in the case of SRCU-T)
CONFIG_DEBUG_LOCK_ALLOC=y (which is selected in kernels built with
CONFIG_PROVE_LOCKING=y) the raw_spinlock_t structure has non-zero size.

Reverting this commit gets rid of this issue, as does applying the patch
shown below (without reverting).  I do not know this code well enough
to say whether this patch constitutes a proper fix, but in case it helps.

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index ce4752ab9e09b..42789585cba4a 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -47,7 +47,7 @@ static spinlock_t *ss_rstat_lock(struct cgroup_subsys *ss)
 
 static raw_spinlock_t *ss_rstat_cpu_lock(struct cgroup_subsys *ss, int cpu)
 {
-	if (ss)
+	if (ss && ss->rstat_ss_cpu_lock)
 		return per_cpu_ptr(ss->rstat_ss_cpu_lock, cpu);
 
 	return per_cpu_ptr(&rstat_base_cpu_lock, cpu);

