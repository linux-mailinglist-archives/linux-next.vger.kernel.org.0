Return-Path: <linux-next+bounces-6075-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F32A75178
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 21:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D22D0174F2F
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 20:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750D118132A;
	Fri, 28 Mar 2025 20:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRxy0SMm"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A3F145A05;
	Fri, 28 Mar 2025 20:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743193958; cv=none; b=KzNwXTlrposjleSnzp/RYkj4jMSxlAjQnTTyz2HHVVBfGCaBUeu9yE1WI0X8EmrIKAl8HfJCBdj6ESQwwjTmf3szDnwchxpcwirWMVEqpvT6LoTWE6peedcjcJ3SVOj7/PDZ7c5oD4MXQyX2fN7gdoz3p//aXfucK8PGPLiLHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743193958; c=relaxed/simple;
	bh=JR1T6u6ASPS7qF80/Nbd4+EZZFIzY6Nzj4O7wQMcGwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgD3tJ9uMCzqqbUM9GpdF78eviLosPowL/x97ZWJ3zM1fPak7+Pujl3BIlbe2Hk7/I18O28V5NBXF4Mw0aLAavH8EZ74x1i/XoSFr8DN5UA7vw7lhQ3vsC1I6wqyZvHknrvynapHbRF4/06tSdz6RiAY4k2BR3Fywhz7Yt0/QTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRxy0SMm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743193956; x=1774729956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JR1T6u6ASPS7qF80/Nbd4+EZZFIzY6Nzj4O7wQMcGwQ=;
  b=iRxy0SMmI2CGQwxD1f1bIXxZO7uhNRfUG/o5yrDRdD876D8lIh+xfN++
   pQCY0usMRG7qlFBVIdyVgTU0ADppQCAdTk19MTveMyXVexKXfPj/za9yP
   9Y6zieJmi8/eaBuD7ANdN0VBaX5Lzq1fQpvsii9AbMalDw+xKmXGRaQoG
   uJ8Astck75odnEcZIK+5MA+jkLUp+FVkyJHCp4YBQRF9xAj9dU58vGK1Q
   5f+UqpNpfnEHi/I/eAlt40jxi8VjSDH+luvLQE5Gp87QUf6p6YebyLdMw
   ab+iCw2S4rmsljwJSyUrvb+sK2Mxg1LUUX+7n1j1GYmWqx9d58GrXXxY3
   g==;
X-CSE-ConnectionGUID: fH4DkMB2S1qwk5gYaAsGkg==
X-CSE-MsgGUID: 6HgFQcwQRNuLZT5zbSlV8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="62098693"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="62098693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 13:32:35 -0700
X-CSE-ConnectionGUID: KdUoDg7YSxmSe+WiiThECg==
X-CSE-MsgGUID: +aLeyjOnS0CqP3u2F7yERg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="130582759"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 13:32:36 -0700
Date: Fri, 28 Mar 2025 13:32:33 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: Re: next-20250327 - lockdep whine and USB issues at boot
Message-ID: <Z-cHYd4FbZF7CrC0@agluck-desk3>
References: <8775.1743185453@turing-police>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8775.1743185453@turing-police>

On Fri, Mar 28, 2025 at 02:10:53PM -0400, Valdis Klētnieks wrote:
> Saw this during boot on a Dell Inspiron 5559 laptop.  
> 
> In addition, the external USB ports all gave up, rendering a USB mouse and a
> USB external drive totally dead in the water.  May or may not be related, I didn't
> dig too far into it.
> 
> [   40.842033] [    T953] io scheduler bfq registered
> 
> [   41.022391] [    T817] ======================================================
> [   41.103507] [    T817] WARNING: possible circular locking dependency detected
> [   41.184587] [    T817] 6.14.0-next-20250327 #110 Tainted: G          I     T  
> [   41.265700] [    T817] ------------------------------------------------------
> [   41.346832] [    T817] (udev-worker)/817 is trying to acquire lock:
> [   41.427952] [    T817] ffff93a2c80ae9f0 (&q->elevator_lock){+.+.}-{4:4}, at: elv_iosched_store+0xe1/0x260
> [   41.830112] [    T817] 
>                           but task is already holding lock:
> [   41.912022] [    T817] ffff93a2c80ae460 (&q->q_usage_counter(io)#10){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x11/0x20
> [   42.394431] [    T817] 
>                           which lock already depends on the new lock.
> 
> [   42.477193] [    T817] 
>                           the existing dependency chain (in reverse order) is:
> [   42.559132] [    T817] 
>                           -> #2 (&q->q_usage_counter(io)#10){++++}-{0:0}:
> [   43.042361] [    T817]        lock_acquire.part.0+0xbe/0x240
> [   43.123452] [    T817]        blk_alloc_queue+0x30b/0x350
> [   43.204547] [    T817]        blk_mq_alloc_queue+0x62/0xd0
> [   43.285646] [    T817]        scsi_alloc_sdev+0x29c/0x3d0
> [   43.366744] [    T817]        scsi_probe_and_add_lun+0x1d8/0x2b0
> [   43.447847] [    T817]        __scsi_add_device+0x114/0x130
> [   43.528950] [    T817]        ata_scsi_scan_host+0x7a/0x190
> [   43.610047] [    T817]        async_run_entry_fn+0x24/0xc0
> [   43.691137] [    T817]        process_one_work+0x21e/0x5a0
> [   43.772226] [    T817]        worker_thread+0x1d5/0x3c0
> [   43.853316] [    T817]        kthread+0x114/0x230
> [   43.934369] [    T817]        ret_from_fork+0x2c/0x50
> [   44.015453] [    T817]        ret_from_fork_asm+0x1a/0x30
> [   44.096532] [    T817] 

I see similar looking lockdep splat on a 2 socket Icelake server.
Kernel built from this Linus commit:

acb4f33713b9 ("Merge tag 'm68knommu-for-v6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu")


[   30.253858] systemd-journald[2054]: Received client request to flush runtime journal.

[   31.187581] ======================================================
[   31.195139] WARNING: possible circular locking dependency detected
[   31.202480] 6.14.0+ #32 Not tainted
[   31.207291] ------------------------------------------------------
[   31.214922] (udev-worker)/2193 is trying to acquire lock:
[   31.221796] ff41ee0f1836f4d8 (&q->elevator_lock){+.+.}-{4:4}, at: elv_iosched_store+0xe9/0x260
[   31.231864]
               but task is already holding lock:
[   31.239595] ff41ee0f1836efa8 (&q->q_usage_counter(io)){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x12/0x20
[   31.250814]
               which lock already depends on the new lock.

[   31.261167]
               the existing dependency chain (in reverse order) is:
[   31.271104]
               -> #2 (&q->q_usage_counter(io)){++++}-{0:0}:
[   31.279299]        blk_alloc_queue+0x30e/0x350
[   31.284432]        blk_mq_alloc_queue+0x62/0xd0
[   31.290416]        scsi_alloc_sdev+0x280/0x3c0
[   31.296321]        scsi_probe_and_add_lun+0x223/0x470
[   31.302846]        __scsi_add_device+0x10d/0x120
[   31.308927]        ata_scsi_scan_host+0x9c/0x1b0
[   31.315003]        async_run_entry_fn+0x31/0x130
[   31.321016]        process_one_work+0x22f/0x5b0
[   31.326962]        worker_thread+0x1cc/0x3c0
[   31.332665]        kthread+0xfc/0x240
[   31.337784]        ret_from_fork+0x31/0x50
[   31.342252]        ret_from_fork_asm+0x1a/0x30
[   31.347061]
               -> #1 (fs_reclaim){+.+.}-{0:0}:
[   31.353404]        fs_reclaim_acquire+0x9d/0xd0
[   31.358273]        kmem_cache_alloc_node_noprof+0x59/0x420
[   31.364083]        scsi_mq_init_request+0x32/0xe0
[   31.369107]        blk_mq_alloc_and_init_hctx+0x143/0x4d0
[   31.374826]        blk_mq_realloc_hw_ctxs+0x2f5/0x390
[   31.380176]        blk_mq_init_allocated_queue+0x17b/0x570
[   31.385962]        blk_mq_alloc_queue+0x7b/0xd0
[   31.390795]        scsi_alloc_sdev+0x280/0x3c0
[   31.395603]        scsi_probe_and_add_lun+0x223/0x470
[   31.400929]        __scsi_add_device+0x10d/0x120
[   31.405828]        ata_scsi_scan_host+0x9c/0x1b0
[   31.410719]        async_run_entry_fn+0x31/0x130
[   31.415601]        process_one_work+0x22f/0x5b0
[   31.420396]        worker_thread+0x1cc/0x3c0
[   31.424997]        kthread+0xfc/0x240
[   31.428983]        ret_from_fork+0x31/0x50
[   31.433334]        ret_from_fork_asm+0x1a/0x30
[   31.438026]
               -> #0 (&q->elevator_lock){+.+.}-{4:4}:
[   31.444767]        __lock_acquire+0x1510/0x2630
[   31.449606]        lock_acquire+0xcb/0x2d0
[   31.454040]        __mutex_lock+0xca/0xe50
[   31.458382]        elv_iosched_store+0xe9/0x260
[   31.463145]        kernfs_fop_write_iter+0x165/0x240
[   31.468334]        vfs_write+0x2b0/0x540
[   31.472499]        ksys_write+0x71/0xf0
[   31.476573]        do_syscall_64+0x95/0x180
[   31.481122]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   31.486936]
               other info that might help us debug this:

[   31.495922] Chain exists of:
                 &q->elevator_lock --> fs_reclaim --> &q->q_usage_counter(io)

[   31.508010]  Possible unsafe locking scenario:

[   31.514353]        CPU0                    CPU1
[   31.519098]        ----                    ----
[   31.523833]   lock(&q->q_usage_counter(io));
[   31.528314]                                lock(fs_reclaim);
[   31.534183]                                lock(&q->q_usage_counter(io));
[   31.541178]   lock(&q->elevator_lock);
[   31.545145]
                *** DEADLOCK ***

[   31.551676] 5 locks held by (udev-worker)/2193:
[   31.556420]  #0: ff41ee0f18e77420 (sb_writers#4){.+.+}-{0:0}, at: ksys_write+0x71/0xf0
[   31.564568]  #1: ff41ee0f1aabbe88 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x11e/0x240
[   31.573842]  #2: ff41ee0f0cfefe48 (kn->active#86){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x127/0x240
[   31.583197]  #3: ff41ee0f1836efa8 (&q->q_usage_counter(io)){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x12/0x20
[   31.593949]  #4: ff41ee0f1836efe0 (&q->q_usage_counter(queue)){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x12/0x20
[   31.604967]
               stack backtrace:
[   31.609793] CPU: 1 UID: 0 PID: 2193 Comm: (udev-worker) Not tainted 6.14.0+ #32 PREEMPT(voluntary)
[   31.609797] Hardware name: Intel Corporation WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0021.P06.2104260458 04/26/2021
[   31.609800] Call Trace:
[   31.609803]  <TASK>
[   31.609807]  dump_stack_lvl+0x6e/0xa0
[   31.609816]  print_circular_bug.cold+0x178/0x1be
[   31.609822]  check_noncircular+0x146/0x160
[   31.609828]  __lock_acquire+0x1510/0x2630
[   31.609833]  lock_acquire+0xcb/0x2d0
[   31.609835]  ? elv_iosched_store+0xe9/0x260
[   31.609842]  __mutex_lock+0xca/0xe50
[   31.609846]  ? elv_iosched_store+0xe9/0x260
[   31.609849]  ? elv_iosched_store+0xe9/0x260
[   31.609853]  ? elv_iosched_store+0xe9/0x260
[   31.609855]  elv_iosched_store+0xe9/0x260
[   31.609859]  kernfs_fop_write_iter+0x165/0x240
[   31.609862]  vfs_write+0x2b0/0x540
[   31.609868]  ksys_write+0x71/0xf0
[   31.609871]  do_syscall_64+0x95/0x180
[   31.609874]  ? lock_acquire+0xcb/0x2d0
[   31.609875]  ? ktime_get_coarse_real_ts64+0x15/0x70
[   31.609881]  ? find_held_lock+0x2b/0x80
[   31.609888]  ? ktime_get_coarse_real_ts64+0x15/0x70
[   31.609890]  ? file_has_perm+0xa8/0xf0
[   31.609897]  ? syscall_exit_to_user_mode_prepare+0x21b/0x250
[   31.609901]  ? lockdep_hardirqs_on_prepare+0xdb/0x190
[   31.609904]  ? syscall_exit_to_user_mode+0x97/0x290
[   31.609907]  ? do_syscall_64+0xa1/0x180
[   31.609908]  ? find_held_lock+0x2b/0x80
[   31.609911]  ? fd_install+0xa4/0x2c0
[   31.609917]  ? do_sys_openat2+0xa4/0xe0
[   31.609918]  ? kmem_cache_free+0x13b/0x460
[   31.609926]  ? do_sys_openat2+0xa4/0xe0
[   31.609928]  ? syscall_exit_to_user_mode_prepare+0x21b/0x250
[   31.609930]  ? lockdep_hardirqs_on_prepare+0xdb/0x190
[   31.609931]  ? syscall_exit_to_user_mode+0x97/0x290
[   31.609933]  ? do_syscall_64+0xa1/0x180
[   31.609935]  ? lock_acquire+0xcb/0x2d0
[   31.609937]  ? ktime_get+0x22/0x100
[   31.609940]  ? find_held_lock+0x2b/0x80
[   31.609942]  ? ktime_get+0x22/0x100
[   31.609946]  ? sched_clock+0x10/0x30
[   31.609947]  ? sched_clock_cpu+0xf/0x1f0
[   31.609951]  ? irqtime_account_irq+0x3e/0xc0
[   31.609955]  ? handle_softirqs+0x475/0x4d0
[   31.609960]  ? sched_clock_cpu+0xf/0x1f0
[   31.609963]  ? clear_bhb_loop+0x15/0x70
[   31.609966]  ? clear_bhb_loop+0x15/0x70
[   31.609968]  ? clear_bhb_loop+0x15/0x70
[   31.609971]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   31.609973] RIP: 0033:0x7fd14baf4484
[   31.609978] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d 45 9c 10 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
[   31.609979] RSP: 002b:00007ffe2d91f6e8 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
[   31.609982] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fd14baf4484
[   31.609984] RDX: 0000000000000003 RSI: 00007ffe2d91f9f0 RDI: 000000000000005a
[   31.609985] RBP: 00007ffe2d91f710 R08: 00007fd14bbf51c8 R09: 00007ffe2d91f7c0
[   31.609986] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000003
[   31.609987] R13: 00007ffe2d91f9f0 R14: 000055eccc8f80a0 R15: 00007fd14bbf4e80
[   31.609992]  </TASK>

-Tony

