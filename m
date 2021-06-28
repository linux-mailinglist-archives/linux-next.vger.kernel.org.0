Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150143B65D4
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 17:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbhF1PlF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 11:41:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238156AbhF1PkM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Jun 2021 11:40:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBFDC61465;
        Mon, 28 Jun 2021 15:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624894666;
        bh=eI2Fxjq2q3yk0vo9kgq4VdGiAnhKB9IrVvGHiaOvbaM=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=rkTVeWwWBCwhh5R6NA+GjArDyHlgG7LyRi28i/da3j+inKpdhyagF7R5tbqLAxofm
         MhFUJm/S8odKz89GhIAG1tfLex3qB+yEoxlOEfaiy4ZHkjykrukR78CPmRHlDiM8mW
         2tbl46gi8gHDfFpwits5I0zeOcRjOMkkSljtWcGBarurx4AU2u1ocJpglUzgLEeStg
         JRWRzv++FxJtP/xY0y5XbybxRB5mD62dGi/epL6pAFtVnTmYtGQ8H3tfk5oERTxlLl
         C0C1k8lVEmsYRcarROuAF86pPO9RZmq5SNzJhKecgG6MUSHhvhG4FrsILGDgEDE/Kw
         YO+45PZo1ndSg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id A9FC95C065A; Mon, 28 Jun 2021 08:37:46 -0700 (PDT)
Date:   Mon, 28 Jun 2021 08:37:46 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     liuyixian@huawei.com
Cc:     jgg@nvidia.com, liweihang@huawei.com, sfr@canb.auug.org.au,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Lockdep splat in -next
Message-ID: <20210628153746.GA2237462@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello, Yixian Liu,

The following -next commit results in a lockdep splat:

591f762b2750 ("RDMA/hns: Remove the condition of light load for posting DWQE")

The repeat-by is as follows:

tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --trust-make --duration 1 --configs TASKS01

The resulting splat is as shown below.  This appears to have been either
fixed or obscured by a later commit, but it does affect bisectability.
Which I found out about the hard way.  ;-)

							Thanx, Paul

======================================================
WARNING: possible circular locking dependency detected
5.13.0-rc1+ #2218 Not tainted
------------------------------------------------------
rcu_torture_sta/66 is trying to acquire lock:
ffffffffa0063c90 (cpu_hotplug_lock){++++}-{0:0}, at: static_key_enable+0x9/0x20

but task is already holding lock:
ffffffffa01754e8 (slab_mutex){+.+.}-{3:3}, at: kmem_cache_create_usercopy+0x2d/0x250

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (slab_mutex){+.+.}-{3:3}:
       __mutex_lock+0x99/0x950
       slub_cpu_dead+0x15/0xf0
       cpuhp_invoke_callback+0x181/0x850
       cpuhp_invoke_callback_range+0x3b/0x80
       _cpu_down+0xdf/0x2a0
       cpu_down+0x2c/0x50
       device_offline+0x82/0xb0
       remove_cpu+0x1a/0x30
       torture_offline+0x80/0x140
       torture_onoff+0x147/0x260
       kthread+0x123/0x160
       ret_from_fork+0x22/0x30

-> #0 (cpu_hotplug_lock){++++}-{0:0}:
       __lock_acquire+0x12e6/0x27c0
       lock_acquire+0xc8/0x3a0
       cpus_read_lock+0x26/0xb0
       static_key_enable+0x9/0x20
       __kmem_cache_create+0x39e/0x440
       kmem_cache_create_usercopy+0x146/0x250
       kmem_cache_create+0xd/0x10
       rcu_torture_stats+0x79/0x280
       kthread+0x123/0x160
       ret_from_fork+0x22/0x30

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(slab_mutex);
                               lock(cpu_hotplug_lock);
                               lock(slab_mutex);
  lock(cpu_hotplug_lock);

 *** DEADLOCK ***

1 lock held by rcu_torture_sta/66:
 #0: ffffffffa01754e8 (slab_mutex){+.+.}-{3:3}, at: kmem_cache_create_usercopy+0x2d/0x250

stack backtrace:
CPU: 1 PID: 66 Comm: rcu_torture_sta Not tainted 5.13.0-rc1+ #2218
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.13.0-1ubuntu1.1 04/01/2014
Call Trace:
 dump_stack+0x6d/0x89
 check_noncircular+0xfe/0x110
 ? rcu_read_lock_sched_held+0x4d/0x80
 ? __alloc_pages+0x329/0x360
 __lock_acquire+0x12e6/0x27c0
 lock_acquire+0xc8/0x3a0
 ? static_key_enable+0x9/0x20
 cpus_read_lock+0x26/0xb0
 ? static_key_enable+0x9/0x20
 static_key_enable+0x9/0x20
 __kmem_cache_create+0x39e/0x440
 kmem_cache_create_usercopy+0x146/0x250
 ? rcu_torture_stats_print+0xd0/0xd0
 kmem_cache_create+0xd/0x10
 rcu_torture_stats+0x79/0x280
 kthread+0x123/0x160
 ? kthread_park+0x80/0x80
 ret_from_fork+0x22/0x30
