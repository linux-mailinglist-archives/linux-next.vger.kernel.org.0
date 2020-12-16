Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5CBD2DC3B0
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 17:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgLPQEP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 11:04:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:48582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbgLPQEO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Dec 2020 11:04:14 -0500
Date:   Wed, 16 Dec 2020 08:03:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608134610;
        bh=UfNYvWaDvekbeFPMy94mxIKIL0b2iw5SOc67BOrLGlQ=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KpF4G31n29u7/DGDVhzUkxjWjKvQGjqSyefwtf8F+xTid+cCMgjKvSsSUQ3g+qjp9
         uy2HH2H4Cs2jmWYQU6DH3q33CxbHL2ID5krWWLoBB3s4Q9zjkIffIFN731RKekieS9
         g0O6Y5DepCMZorm4By3Zlfeyv0ynhK9dz/O1Y9G62tWeyTRG0UAahFABsEAAWZ188m
         PhLAIN300nefdKmLjDPqZz1B5mD0Ml5mmTKw+ZSjhB2FIp0wb4eLpmVbz5u0Gw3Ft5
         8SEtydpo3SY2KMfau++cibIOD5wv3Ayop+oilO06CIG7jCprbzkJTWgbXomjIWAdJE
         yh5hHlu2yxIUw==
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     rcu@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: i386: rcu-torture: WARNING: at kernel/rcu/rcutorture.c:1169
 rcu_torture_writer [rcutorture]
Message-ID: <20201216160330.GG2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CA+G9fYsVud9EmeDnijucxAN49a8S5zjnML6LSmmnPTG3cO5-Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsVud9EmeDnijucxAN49a8S5zjnML6LSmmnPTG3cO5-Hg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 16, 2020 at 03:40:04PM +0530, Naresh Kamboju wrote:
> Linux Kernel Functional Testing (LKFT) started running rcu-torture tests on
> qemu_arm64, qemu_arm qemu_x86_64 and qemu_i386 from our CI build systems.
> 
> The following warning(s) noticed on qemu_i386 while running rcu-torture test
> on Linux mainline and Linux -next master branch. Since we do not have baseline
> results i can not comment this as regression but when compared with
> stable-rc 5.4 kernel this warning is new on mainline and next.

The rcutorture testing "stutters", that is, it periodically intentionally
drops the test load down to zero for a few seconds.  The expectation is
that with no load, rcutorture will have no trouble finishing any needed
grace periods within that zero-load period.  If at the end of the stutter
period, RCU work remains undone, then this warning is emitted.

This warning can be a false positive in the following situations:

1.	The system on which you are running rcutorture is under
	additional heavy load.

2.	You are running multiple guest OSes, each of which is running
	rcutorture, and vCPUs from each of the guest OSes ends up
	sharing a core with a vCPU from one of the other guests.  This
	can cause the zero-load period to not be so unloaded.

3.	You built rcutorture into your kernel, so that rcutorture starts
	immediately at boot time (CONFIG_RCU_TORTURE_TEST=y).  If your
	boot takes long enough, rcutorture can massively overload the
	single boot CPU, which can in turn result in this warning.

If you are in situation #1, I suggest disabling stuttering using the
rcutorture.stutter=0 kernel boot parameter.

If you are in situation #2, I suggest binding the guest-OS vCPUs
to avoid them sharing cores with each other.

If you are in situation #3, I have patches that I expect to submit
upstream in the v5.12 merge window that can help.  Hey, they work for me!
If you would like to test them before then, please let me know.

If something else is going on, please let me know what it is so that
I can fix it one way or another.

This warning has been present for quite some time, but I continually
make rcutorture more aggressive, and this could well be part of the
fallout of additional rcutorture aggression.

And either way, thank you for trying out rcutorture!

							Thanx, Paul

> rcu-torture test log
> ----------------------
> [    8.191718] rcu-torture:--- Start of test: nreaders=3
> nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1
> shuffle_interval=3 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0
> fqs_stutter=3 test_boost=1/0 test_boost_interval=7
> test_boost_duration=4 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10
> stall_cpu_irqsoff=0 stall_cpu_block=0 n_barrier_cbs=0 onoff_interval=0
> onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16
> [    8.196860] rcu:  Start-test grace-period state: g973 f0x2
> [    8.198122] rcu-torture: Creating rcu_torture_writer task
> [    8.199823] rcu-torture: Creating rcu_torture_fakewriter task
> [    8.199864] rcu-torture: rcu_torture_writer task started
> [    8.201174] rcu-torture: Creating rcu_torture_fakewriter task
> [    8.201245] rcu-torture: rcu_torture_fakewriter task started
> [    8.202099] rcu_torture_writer: Testing conditional GPs.
> [    8.203056] rcu-torture: Creating rcu_torture_fakewriter task
> [    8.204450] rcu_torture_writer: Testing expedited GPs.
> [    8.204474] rcu-torture: rcu_torture_fakewriter task started
> [    8.205441] rcu-torture: Creating rcu_torture_fakewriter task
> [    8.205483] rcu-torture: rcu_torture_fakewriter task started
> [    8.206599] rcu_torture_writer: Testing asynchronous GPs.
> [    8.206602] rcu_torture_writer: Testing normal GPs.
> [    8.211609] rcu-torture: Creating rcu_torture_reader task
> [    8.211743] rcu-torture: rcu_torture_fakewriter task started
> [    8.212627] rcu-torture: Creating rcu_torture_reader task
> [    8.212707] rcu-torture: rcu_torture_reader task started
> [    8.215613] rcu-torture: Creating rcu_torture_reader task
> [    8.215733] rcu-torture: rcu_torture_reader task started
> [    8.216454] rcu-torture: Creating rcu_torture_stats task
> [    8.217774] rcu-torture: rcu_torture_reader task started
> [    8.218562] rcu-torture: Creating torture_shuffle task
> [    8.219696] rcu-torture: rcu_torture_stats task started
> [    8.220385] rcu-torture: Creating torture_stutter task
> [    8.222150] rcu-torture: torture_shuffle task started
> [    8.222990] rcu-torture: Creating rcu_torture_fwd_prog task
> [    8.222999] rcu-torture: torture_stutter task started
> [    8.224683] rcu-torture: Creating rcu_torture_read_exit task
> [    8.224755] rcu-torture: rcu_torture_fwd_progress task started
> [    8.225923] rcu-torture: rcu_torture_read_exit: Start of test
> modprobe-rcutorture pass
> [    8.230300] Dumping ftrace buffer:
> [    8.230659]    (ftrace buffer empty)
> [    8.231586] ------------[ cut here ]------------
> [    8.232483] rcu_torture_writer: rtort_pipe_count: 4
> [    8.233265] WARNING: CPU: 2 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> Broadcast messag[    8.234683] Modules linked in: rcutorture torture
> e from systemd-j[    8.235456] CPU: 2 PID: 407 Comm: rcu_torture_wri
> Not tainted 5.10.0-next-20201215 #2
> ournald@intel-co[    8.236755] Hardware name: QEMU Standard PC (i440FX
> + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> re2-32 (Wed 2020[    8.237910] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> -12-16 09:24:22 [    8.238840] Code: f7 85 c0 75 13 b8 01 00 00 00 87
> 05 4c 28 87 f7 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19
> 03 87 f7 e8 6e a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b
> 2f ce e4 83 fb 03 0f
> UTC):[    8.241511] EAX: 00000027 EBX: 00000000 ECX: f51cd9d0 EDX: f51c3e68
> [    8.242438] ESI: f7872bf0 EDI: f7872bcc EBP: c1207f8c ESP: c1207f4c
> [    8.243300] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> kernel[263]: [  [    8.244219] CR0: 80050033 CR2: b7c8eb96 CR3:
> 1d9a0000 CR4: 003506d0
>   8.230300] Dump[    8.245228] Call Trace:
> ing ftrace buffe[    8.245752]  ?
> rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> r:[    8.246573]  kthread+0xe2/0x110
> [    8.247114]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [    8.247978]  ? kthread_park+0xa0/0xa0
> [    8.248483]  ret_from_fork+0x1c/0x28
> [    8.249031] ---[ end trace f0d5ead0494363c8 ]---
> 
> Broadcast message from systemd-journald@intel-core2-32 (Wed 2020-12-16
> 09:24:22 UTC):
> kernel[263]: [    8.230659]    (ftrace buffer empty)
> [    8.255498] rcu-torture: rcu_torture_read_exit: End of episode
> [    8.191718] rcu-torture:--- Start of test: nreaders=3
> nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1
> shuffle_interval=3 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0
> fqs_stutter=3 test_boost=1/0 test_boost_interval=7
> test_boost_duration=4 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10
> stall_cpu_irqsoff=0 stall_cpu_block=0 n_barrier_cbs=0 onoff_interval=0
> onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16
> rcutorture-start pass
> INFO: Running rcutorture for 600 seconds...
> [   21.553686] rcu-torture: rcu_torture_read_exit: Start of episode
> [   21.565513] rcu-torture: rcu_torture_read_exit: End of episode
> [   35.123776] rcu-torture: rcu_torture_read_exit: Start of episode
> [   35.145399] rcu-torture: rcu_torture_read_exit: End of episode
> [   48.498693] rcu-torture: rcu_torture_read_exit: Start of episode
> [   48.508719] rcu-torture: rcu_torture_read_exit: End of episode
> [   50.870536] ------------[ cut here ]------------
> [   50.871283] rcu_torture_writer: rtort_pipe_count: 3
> [   50.872180] WARNING: CPU: 1 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [   50.874884] Modules linked in: rcutorture torture
> [   50.876156] CPU: 1 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [   50.878280] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [   50.880083] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [   50.880978] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [   50.883639] EAX: 00000027 EBX: 0000000d ECX: f51aa9d0 EDX: f51a0e68
> [   50.884763] ESI: f7872e18 EDI: f7872d04 EBP: c1207f8c ESP: c1207f4c
> [   50.885800] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [   50.886988] CR0: 80050033 CR2: 01e2e850 CR3: 026f6000 CR4: 003506d0
> [   50.888048] Call Trace:
> [   50.888465]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [   50.889471]  kthread+0xe2/0x110
> [   50.890069]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [   50.891171]  ? kthread_park+0xa0/0xa0
> [   50.891801]  ret_from_fork+0x1c/0x28
> [   50.892374] ---[ end trace f0d5ead0494363c9 ]---
> [   50.893237] ------------[ cut here ]------------
> [   50.894035] rcu_torture_writer: rtort_pipe_count: 5
> [   50.894947] WARNING: CPU: 1 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [   50.896682] Modules linked in: rcutorture torture
> [   50.897452] CPU: 1 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [   50.898959] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [   50.900357] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [   50.901361] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [   50.904305] EAX: 00000027 EBX: 00000013 ECX: f51aa9d0 EDX: f51a0e68
> [   50.905379] ESI: f7872e18 EDI: f7872d94 EBP: c1207f8c ESP: c1207f4c
> [   50.906449] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [   50.907606] CR0: 80050033 CR2: 01e2e850 CR3: 026f6000 CR4: 003506d0
> [   50.908699] Call Trace:
> [   50.909150]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [   50.910165]  kthread+0xe2/0x110
> [   50.910770]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [   50.911818]  ? kthread_park+0xa0/0xa0
> [   50.912468]  ret_from_fork+0x1c/0x28
> [   50.913104] ---[ end trace f0d5ead0494363ca ]---
> [   61.809941] rcu-torture: rcu_torture_read_exit: Start of episode
> [   61.831604] rcu-torture: rcu_torture_read_exit: End of episode
> [   70.833679] rcu-torture: rtc: 8da7414f ver: 3947 tfle: 0 rta: 3948
> rtaf: 0 rtf: 3936 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0
> nt: 60924 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier: 0/0:0
> read-exits: 84
> [   70.836316] rcu-torture: Reader Pipe:  73349046 5958 0 0 0 0 0 0 0 0 0
> [   70.837292] rcu-torture: Reader Batch:  73342557 12447 0 0 0 0 0 0 0 0 0
> [   70.838309] rcu-torture: Free-Block Circulation:  3948 3946 3945
> 3944 3943 3942 3941 3939 3938 3937 0
> [   75.188816] rcu-torture: rcu_torture_read_exit: Start of episode
> [   75.205268] rcu-torture: rcu_torture_read_exit: End of episode
> [   83.332733] rcu_torture_fwd_prog_nr: Duration 12493 cver 825 gps 1473
> [   83.507200] rcu_torture_fwd_prog_cr Duration 29 barrier: 17 pending
> 48369 n_launders: 135108 n_launders_sa: 23105 n_max_gps: 100
> n_max_cbs: 75135 cver 4 gps 9
> [   83.509533] rcu_torture_fwd_cb_hist: Callback-invocation histogram
> (duration 48 jiffies): 1s/10: 210243:12
> [   88.562713] rcu-torture: rcu_torture_read_exit: Start of episode
> [   88.580007] rcu-torture: rcu_torture_read_exit: End of episode
> [   93.879744] ------------[ cut here ]------------
> [   93.880447] rcu_torture_writer: rtort_pipe_count: 4
> [   93.881303] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [   93.883192] Modules linked in: rcutorture torture
> [   93.883951] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [   93.885334] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [   93.886619] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [   93.887454] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [   93.890561] EAX: 00000027 EBX: 0000005a ECX: f51879d0 EDX: f517de68
> [   93.891678] ESI: f7872c08 EDI: f787343c EBP: c1207f8c ESP: c1207f4c
> [   93.892633] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [   93.893811] CR0: 80050033 CR2: b7435000 CR3: 0239a000 CR4: 003506d0
> [   93.894810] Call Trace:
> [   93.895233]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [   93.896258]  kthread+0xe2/0x110
> [   93.896883]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [   93.897897]  ? kthread_park+0xa0/0xa0
> [   93.898485]  ret_from_fork+0x1c/0x28
> [   93.899098] ---[ end trace f0d5ead0494363cb ]---
> [  101.937743] rcu-torture: rcu_torture_read_exit: Start of episode
> [  101.943604] rcu-torture: rcu_torture_read_exit: End of episode
> [  115.313700] rcu-torture: rcu_torture_read_exit: Start of episode
> [  115.317066] rcu-torture: rcu_torture_read_exit: End of episode
> [  128.690866] rcu-torture: rcu_torture_read_exit: Start of episode
> [  128.710091] rcu-torture: rcu_torture_read_exit: End of episode
> [  132.273932] rcu-torture: rtc: 534006fa ver: 8004 tfle: 0 rta: 8005
> rtaf: 0 rtf: 7992 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0
> nt: 121506 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier: 0/0:0
> read-exits: 169
> [  132.279351] rcu-torture: Reader Pipe:  144997915 11987 0 0 0 0 0 0 0 0 0
> [  132.281446] rcu-torture: Reader Batch:  144985493 24409 0 0 0 0 0 0 0 0 0
> [  132.283404] rcu-torture: Free-Block Circulation:  8004 8004 8003
> 8001 8000 7998 7996 7995 7994 7993 0
> [  136.886764] ------------[ cut here ]------------
> [  136.888083] rcu_torture_writer: rtort_pipe_count: 7
> [  136.889707] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  136.892439] Modules linked in: rcutorture torture
> [  136.893572] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  136.895679] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  136.896989] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  136.897869] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  136.900449] EAX: 00000027 EBX: 00000018 ECX: f51879d0 EDX: f517de68
> [  136.901417] ESI: f78732b0 EDI: f7872e0c EBP: c1207f8c ESP: c1207f4c
> [  136.902334] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  136.903338] CR0: 80050033 CR2: 01dfe948 CR3: 02213000 CR4: 003506d0
> [  136.904279] Call Trace:
> [  136.904620]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.905496]  kthread+0xe2/0x110
> [  136.906010]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.906961]  ? kthread_park+0xa0/0xa0
> [  136.907506]  ret_from_fork+0x1c/0x28
> [  136.908084] ---[ end trace f0d5ead0494363cc ]---
> [  136.908810] ------------[ cut here ]------------
> [  136.909462] rcu_torture_writer: rtort_pipe_count: 7
> [  136.910306] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  136.912209] Modules linked in: rcutorture torture
> [  136.912936] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  136.914308] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  136.915556] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  136.916384] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  136.919065] EAX: 00000027 EBX: 00000023 ECX: f51879d0 EDX: f517de68
> [  136.920054] ESI: f78732b0 EDI: f7872f14 EBP: c1207f8c ESP: c1207f4c
> [  136.920974] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  136.922004] CR0: 80050033 CR2: 01dfe948 CR3: 02213000 CR4: 003506d0
> [  136.922958] Call Trace:
> [  136.923310]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.924198]  kthread+0xe2/0x110
> [  136.924686]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.925532]  ? kthread_park+0xa0/0xa0
> [  136.926100]  ret_from_fork+0x1c/0x28
> [  136.926628] ---[ end trace f0d5ead0494363cd ]---
> [  136.927336] ------------[ cut here ]------------
> [  136.928027] rcu_torture_writer: rtort_pipe_count: 5
> [  136.928738] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  136.930145] Modules linked in: rcutorture torture
> [  136.930879] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  136.932121] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  136.933294] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  136.934156] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  136.936797] EAX: 00000027 EBX: 0000002f ECX: f51879d0 EDX: f517de68
> [  136.937842] ESI: f78732b0 EDI: f7873034 EBP: c1207f8c ESP: c1207f4c
> [  136.938916] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  136.940002] CR0: 80050033 CR2: 01dfe948 CR3: 02213000 CR4: 003506d0
> [  136.941046] Call Trace:
> [  136.941437]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.942413]  kthread+0xe2/0x110
> [  136.942998]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.944010]  ? kthread_park+0xa0/0xa0
> [  136.944580]  ret_from_fork+0x1c/0x28
> [  136.945204] ---[ end trace f0d5ead0494363ce ]---
> [  136.945973] ------------[ cut here ]------------
> [  136.946764] rcu_torture_writer: rtort_pipe_count: 2
> [  136.947546] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  136.949114] Modules linked in: rcutorture torture
> [  136.949869] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  136.951223] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  136.952432] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  136.953292] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  136.956015] EAX: 00000027 EBX: 00000034 ECX: 00000027 EDX: f517de6c
> [  136.957052] ESI: f78732b0 EDI: f78730ac EBP: c1207f8c ESP: c1207f4c
> [  136.958066] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  136.959177] CR0: 80050033 CR2: 01dfe948 CR3: 02213000 CR4: 003506d0
> [  136.960169] Call Trace:
> [  136.960574]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.961554]  kthread+0xe2/0x110
> [  136.962116]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.963133]  ? kthread_park+0xa0/0xa0
> [  136.963759]  ret_from_fork+0x1c/0x28
> [  136.964329] ---[ end trace f0d5ead0494363cf ]---
> [  136.965075] ------------[ cut here ]------------
> [  136.965847] rcu_torture_writer: rtort_pipe_count: 3
> [  136.966724] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  136.968186] Modules linked in: rcutorture torture
> [  136.968931] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  136.970238] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  136.971455] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  136.972295] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  136.975121] EAX: 00000027 EBX: 00000037 ECX: f51879d0 EDX: f517de68
> [  136.976704] ESI: f78732b0 EDI: f78730f4 EBP: c1207f8c ESP: c1207f4c
> [  136.978794] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  136.980909] CR0: 80050033 CR2: 01dfe948 CR3: 02213000 CR4: 003506d0
> [  136.982918] Call Trace:
> [  136.983840]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.985583]  kthread+0xe2/0x110
> [  136.986776]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  136.987998]  ? kthread_park+0xa0/0xa0
> [  136.988474]  ret_from_fork+0x1c/0x28
> [  136.988994] ---[ end trace f0d5ead0494363d0 ]---
> [  136.989593] ------------[ cut here ]------------
> [  136.990235] rcu_torture_writer: rtort_pipe_count: 4
> [  136.990995] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  136.992425] Modules linked in: rcutorture torture
> [  136.993153] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  136.994470] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  136.995696] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  136.996479] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  137.000802] EAX: 00000027 EBX: 0000003a ECX: f51879d0 EDX: f517de68
> [  137.001770] ESI: f78732b0 EDI: f787313c EBP: c1207f8c ESP: c1207f4c
> [  137.002700] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  137.003616] CR0: 80050033 CR2: 01dfe948 CR3: 02213000 CR4: 003506d0
> [  137.004533] Call Trace:
> [  137.004938]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  137.005859]  kthread+0xe2/0x110
> [  137.006307]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  137.007211]  ? kthread_park+0xa0/0xa0
> [  137.007795]  ret_from_fork+0x1c/0x28
> [  137.008317] ---[ end trace f0d5ead0494363d1 ]---
> [  137.008994] ------------[ cut here ]------------
> [  137.009681] rcu_torture_writer: rtort_pipe_count: 3
> [  137.010394] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  137.011858] Modules linked in: rcutorture torture
> [  137.012518] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  137.013825] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  137.015055] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  137.015931] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  137.018481] EAX: 00000027 EBX: 00000040 ECX: 00000027 EDX: f517de6c
> [  137.019483] ESI: f78732b0 EDI: f78731cc EBP: c1207f8c ESP: c1207f4c
> [  137.020507] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  137.021623] CR0: 80050033 CR2: 01dfe948 CR3: 02213000 CR4: 003506d0
> [  137.022858] Call Trace:
> [  137.023288]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  137.024333]  kthread+0xe2/0x110
> [  137.024960]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  137.026037]  ? kthread_park+0xa0/0xa0
> [  137.026760]  ret_from_fork+0x1c/0x28
> [  137.027364] ---[ end trace f0d5ead0494363d2 ]---
> [  137.028181] ------------[ cut here ]------------
> [  137.029011] rcu_torture_writer: rtort_pipe_count: 5
> [  137.029927] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  137.031676] Modules linked in: rcutorture torture
> [  137.032474] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  137.034006] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  137.035480] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  137.036482] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  137.039609] EAX: 00000027 EBX: 00000042 ECX: f51879d0 EDX: f517de68
> [  137.040717] ESI: f78732b0 EDI: f78731fc EBP: c1207f8c ESP: c1207f4c
> [  137.041842] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  137.043060] CR0: 80050033 CR2: 01dfe948 CR3: 02213000 CR4: 003506d0
> [  137.044170] Call Trace:
> [  137.044605]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  137.045670]  kthread+0xe2/0x110
> [  137.046227]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  137.047302]  ? kthread_park+0xa0/0xa0
> [  137.047993]  ret_from_fork+0x1c/0x28
> [  137.048612] ---[ end trace f0d5ead0494363d3 ]---
> [  137.049436] ------------[ cut here ]------------
> [  137.050276] rcu_torture_writer: rtort_pipe_count: 3
> [  137.051203] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  137.052983] Modules linked in: rcutorture torture
> [  137.053860] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  137.055453] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  137.056876] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  137.057892] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  137.061002] EAX: 00000027 EBX: 00000043 ECX: f51879d0 EDX: f517de68
> [  137.062090] ESI: f78732b0 EDI: f7873214 EBP: c1207f8c ESP: c1207f4c
> [  137.063197] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  137.064366] CR0: 80050033 CR2: 01dfe948 CR3: 02213000 CR4: 003506d0
> [  137.065505] Call Trace:
> [  137.066004]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  137.067079]  kthread+0xe2/0x110
> [  137.067621]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  137.068701]  ? kthread_park+0xa0/0xa0
> [  137.069333]  ret_from_fork+0x1c/0x28
> [  137.070018] ---[ end trace f0d5ead0494363d4 ]---
> [  142.073705] rcu-torture: rcu_torture_read_exit: Start of episode
> [  142.088951] rcu-torture: rcu_torture_read_exit: End of episode
> [  153.214282] rcu_torture_fwd_prog_nr: Duration 8357 cver 633 gps 1138
> [  153.403732] rcu_torture_fwd_prog_cr Duration 36 barrier: 21 pending
> 42167 n_launders: 143281 n_launders_sa: 131263 n_max_gps: 100
> n_max_cbs: 73728 cver 3 gps 11
> [  153.405785] rcu_torture_fwd_cb_hist: Callback-invocation histogram
> (duration 59 jiffies): 1s/10: 217009:13
> [  155.609937] rcu-torture: rcu_torture_read_exit: Start of episode
> [  155.624814] rcu-torture: rcu_torture_read_exit: End of episode
> [  168.946827] rcu-torture: rcu_torture_read_exit: Start of episode
> [  168.950063] rcu-torture: rcu_torture_read_exit: End of episode
> [  182.322683] rcu-torture: rcu_torture_read_exit: Start of episode
> [  182.332632] rcu-torture: rcu_torture_read_exit: End of episode
> [  193.713783] rcu-torture: rtc: de3a40d9 ver: 12094 tfle: 0 rta:
> 12095 rtaf: 0 rtf: 12080 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0
> rtb: 0 nt: 181149 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier:
> 0/0:0 read-exits: 237
> [  193.716334] rcu-torture: Reader Pipe:  217230509 17887 0 0 0 0 0 0 0 0 0
> [  193.717302] rcu-torture: Reader Batch:  217211460 36936 0 0 0 0 0 0 0 0 0
> [  193.718383] rcu-torture: Free-Block Circulation:  12094 12093 12092
> 12090 12089 12088 12087 12083 12082 12080 0
> [  195.698429] rcu-torture: rcu_torture_read_exit: Start of episode
> [  195.706057] rcu-torture: rcu_torture_read_exit: End of episode
> [  209.009727] rcu-torture: rcu_torture_read_exit: Start of episode
> [  209.034830] rcu-torture: rcu_torture_read_exit: End of episode
> [  222.707669] rcu-torture: rcu_torture_read_exit: Start of episode
> [  222.717228] rcu-torture: rcu_torture_read_exit: End of episode
> [  225.107668] rcu_torture_fwd_prog_nr: Duration 6423 cver 431 gps 674
> [  225.304625] rcu_torture_fwd_prog_cr Duration 30 barrier: 18 pending
> 45670 n_launders: 115071 n_launders_sa: 45670 n_max_gps: 100
> n_max_cbs: 81535 cver 4 gps 9
> [  225.306721] rcu_torture_fwd_cb_hist: Callback-invocation histogram
> (duration 51 jiffies): 1s/10: 196606:12
> [  236.082696] rcu-torture: rcu_torture_read_exit: Start of episode
> [  236.084184] rcu-torture: rcu_torture_read_exit: End of episode
> [  249.842725] rcu-torture: rcu_torture_read_exit: Start of episode
> [  249.862693] rcu-torture: rcu_torture_read_exit: End of episode
> [  255.155700] rcu-torture: rtc: 5147673e ver: 16080 tfle: 0 rta:
> 16081 rtaf: 0 rtf: 16070 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0
> rtb: 0 nt: 241269 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier:
> 0/0:0 read-exits: 322
> [  255.159747] rcu-torture: Reader Pipe:  289687395 23676 0 0 0 0 0 0 0 0 0
> [  255.160768] rcu-torture: Reader Batch:  289662008 49063 0 0 0 0 0 0 0 0 0
> [  255.161738] rcu-torture: Free-Block Circulation:  16080 16079 16078
> 16077 16075 16074 16073 16072 16071 16070 0
> [  263.345759] rcu-torture: rcu_torture_read_exit: Start of episode
> [  263.357968] rcu-torture: rcu_torture_read_exit: End of episode
> [  276.731679] rcu-torture: rcu_torture_read_exit: Start of episode
> [  276.736175] rcu-torture: rcu_torture_read_exit: End of episode
> [  290.610555] rcu-torture: rcu_torture_read_exit: Start of episode
> [  290.613925] rcu-torture: rcu_torture_read_exit: End of episode
> [  294.416672] rcu_torture_fwd_prog_nr: Duration 6473 cver 600 gps 1034
> [  294.594441] rcu_torture_fwd_prog_cr Duration 30 barrier: 15 pending
> 45334 n_launders: 111298 n_launders_sa: 109603 n_max_gps: 100
> n_max_cbs: 66046 cver 7 gps 9
> [  294.596462] rcu_torture_fwd_cb_hist: Callback-invocation histogram
> (duration 47 jiffies): 1s/10: 177344:11
> [  303.930698] rcu-torture: rcu_torture_read_exit: Start of episode
> [  303.956670] rcu-torture: rcu_torture_read_exit: End of episode
> [  316.594672] rcu-torture: rtc: 8f3d94ed ver: 20172 tfle: 0 rta:
> 20172 rtaf: 0 rtf: 20156 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0
> rtb: 0 nt: 300958 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier:
> 0/0:0 read-exits: 390
> [  316.597784] rcu-torture: Reader Pipe:  361208386 29738 0 0 0 0 0 0 0 0 0
> [  316.598799] rcu-torture: Reader Batch:  361176291 61833 0 0 0 0 0 0 0 0 0
> [  316.599808] rcu-torture: Free-Block Circulation:  20173 20171 20170
> 20169 20168 20167 20166 20162 20157 20156 0
> [  317.491787] rcu-torture: rcu_torture_read_exit: Start of episode
> [  317.505037] rcu-torture: rcu_torture_read_exit: End of episode
> [  330.801705] rcu-torture: rcu_torture_read_exit: Start of episode
> [  330.821143] rcu-torture: rcu_torture_read_exit: End of episode
> [  344.434695] rcu-torture: rcu_torture_read_exit: Start of episode
> [  344.442238] rcu-torture: rcu_torture_read_exit: End of episode
> [  357.745692] rcu-torture: rcu_torture_read_exit: Start of episode
> [  357.756548] rcu-torture: rcu_torture_read_exit: End of episode
> [  371.059226] rcu-torture: rcu_torture_read_exit: Start of episode
> [  371.062913] rcu-torture: rcu_torture_read_exit: End of episode
> [  373.393666] rcu_torture_fwd_prog_nr: Duration 15830 cver 1321 gps 2188
> [  373.569775] rcu_torture_fwd_prog_cr Duration 28 barrier: 15 pending
> 29689 n_launders: 57048 n_launders_sa: 20971 n_max_gps: 100 n_max_cbs:
> 64403 cver 4 gps 7
> [  373.573491] rcu_torture_fwd_cb_hist: Callback-invocation histogram
> (duration 46 jiffies): 1s/10: 121451:10
> [  378.033717] rcu-torture: rtc: 464d2699 ver: 24665 tfle: 0 rta:
> 24665 rtaf: 0 rtf: 24651 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0
> rtb: 0 nt: 363383 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier:
> 0/0:0 read-exits: 475
> [  378.036372] rcu-torture: Reader Pipe:  434351896 36155 0 0 0 0 0 0 0 0 0
> [  378.037357] rcu-torture: Reader Batch:  434313110 74941 0 0 0 0 0 0 0 0 0
> [  378.038364] rcu-torture: Free-Block Circulation:  24664 24664 24662
> 24661 24660 24658 24654 24653 24652 24651 0
> [  384.370675] rcu-torture: rcu_torture_read_exit: Start of episode
> [  384.390681] rcu-torture: rcu_torture_read_exit: End of episode
> [  397.745729] rcu-torture: rcu_torture_read_exit: Start of episode
> [  397.759462] rcu-torture: rcu_torture_read_exit: End of episode
> [  411.326181] rcu-torture: rcu_torture_read_exit: Start of episode
> [  411.339801] rcu-torture: rcu_torture_read_exit: End of episode
> [  424.755666] rcu-torture: rcu_torture_read_exit: Start of episode
> [  424.764716] rcu-torture: rcu_torture_read_exit: End of episode
> [  438.323670] rcu-torture: rcu_torture_read_exit: Start of episode
> [  438.396888] rcu-torture: rcu_torture_read_exit: End of episode
> [  439.473735] rcu-torture: rtc: bb0c988a ver: 28319 tfle: 0 rta:
> 28320 rtaf: 0 rtf: 28306 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0
> rtb: 0 nt: 421382 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier:
> 0/0:0 read-exits: 560
> [  439.476457] rcu-torture: Reader Pipe:  504507253 41547 0 0 0 0 0 0 0 0 0
> [  439.477456] rcu-torture: Reader Batch:  504462623 86177 0 0 0 0 0 0 0 0 0
> [  439.478487] rcu-torture: Free-Block Circulation:  28319 28318 28316
> 28314 28313 28311 28310 28309 28307 28306 0
> [  447.839666] rcu_torture_fwd_prog_nr: Duration 12252 cver 972 gps 1685
> [  448.014701] rcu_torture_fwd_prog_cr Duration 27 barrier: 15 pending
> 26505 n_launders: 129796 n_launders_sa: 101 n_max_gps: 100 n_max_cbs:
> 77442 cver 2 gps 10
> [  448.017945] rcu_torture_fwd_cb_hist: Callback-invocation histogram
> (duration 45 jiffies): 1s/10: 207238:13
> [  451.697700] rcu-torture: rcu_torture_read_exit: Start of episode
> [  451.713990] rcu-torture: rcu_torture_read_exit: End of episode
> [  459.446720] ------------[ cut here ]------------
> [  459.447333] rcu_torture_writer: rtort_pipe_count: 8
> [  459.448071] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  459.449496] Modules linked in: rcutorture torture
> [  459.450233] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  459.451518] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  459.452691] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  459.453459] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  459.456034] EAX: 00000027 EBX: 00000007 ECX: f51879d0 EDX: f517de68
> [  459.456928] ESI: f7873208 EDI: f7872c74 EBP: c1207f8c ESP: c1207f4c
> [  459.457828] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  459.458816] CR0: 80050033 CR2: 0960df5c CR3: 023ee000 CR4: 003506d0
> [  459.459719] Call Trace:
> [  459.460062]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  459.460942]  kthread+0xe2/0x110
> [  459.461403]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  459.462286]  ? kthread_park+0xa0/0xa0
> [  459.462848]  ret_from_fork+0x1c/0x28
> [  459.463335] ---[ end trace f0d5ead0494363d5 ]---
> [  459.464015] ------------[ cut here ]------------
> [  459.464706] rcu_torture_writer: rtort_pipe_count: 7
> [  459.465371] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  459.466841] Modules linked in: rcutorture torture
> [  459.467509] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  459.468802] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  459.470003] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  459.470845] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  459.473403] EAX: 00000027 EBX: 0000003e ECX: 00000027 EDX: f517de6c
> [  459.474329] ESI: f7873208 EDI: f787319c EBP: c1207f8c ESP: c1207f4c
> [  459.475255] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  459.476220] CR0: 80050033 CR2: 0960df5c CR3: 023ee000 CR4: 003506d0
> [  459.477142] Call Trace:
> [  459.477481]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  459.478365]  kthread+0xe2/0x110
> [  459.478871]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  459.479811]  ? kthread_park+0xa0/0xa0
> [  459.480363]  ret_from_fork+0x1c/0x28
> [  459.480951] ---[ end trace f0d5ead0494363d6 ]---
> [  465.137695] rcu-torture: rcu_torture_read_exit: Start of episode
> [  465.140903] rcu-torture: rcu_torture_read_exit: End of episode
> [  478.577719] rcu-torture: rcu_torture_read_exit: Start of episode
> [  478.592864] rcu-torture: rcu_torture_read_exit: End of episode
> [  491.954723] rcu-torture: rcu_torture_read_exit: Start of episode
> [  491.969890] rcu-torture: rcu_torture_read_exit: End of episode
> [  500.913672] rcu-torture: rtc: 7ec35e96 ver: 32454 tfle: 0 rta:
> 32455 rtaf: 0 rtf: 32444 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0
> rtb: 0 nt: 481015 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier:
> 0/0:0 read-exits: 628
> [  500.920282] rcu-torture: Reader Pipe:  575629825 47586 0 0 0 0 0 0 0 0 0
> [  500.922184] rcu-torture: Reader Batch:  575579057 98354 0 0 0 0 0 0 0 0 0
> [  500.924002] rcu-torture: Free-Block Circulation:  32454 32454 32453
> 32452 32451 32450 32449 32448 32447 32445 0
> [  505.586699] rcu-torture: rcu_torture_read_exit: Start of episode
> [  505.600489] rcu-torture: rcu_torture_read_exit: End of episode
> [  518.962750] rcu-torture: rcu_torture_read_exit: Start of episode
> [  518.978017] rcu-torture: rcu_torture_read_exit: End of episode
> [  519.472694] rcu_torture_fwd_prog_nr: Duration 10360 cver 706 gps 1175
> [  519.659707] rcu_torture_fwd_prog_cr Duration 34 barrier: 13 pending
> 32601 n_launders: 118865 n_launders_sa: 32601 n_max_gps: 100
> n_max_cbs: 59919 cver 5 gps 10
> [  519.661865] rcu_torture_fwd_cb_hist: Callback-invocation histogram
> (duration 49 jiffies): 1s/10: 178784:12
> [  523.958007] ------------[ cut here ]------------
> [  523.958780] rcu_torture_writer: rtort_pipe_count: 3
> [  523.959453] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  523.960903] Modules linked in: rcutorture torture
> [  523.961580] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  523.962919] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  523.964136] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  523.964978] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  523.967565] EAX: 00000027 EBX: 0000000d ECX: 00000027 EDX: f517de6c
> [  523.968507] ESI: f7873268 EDI: f7872d04 EBP: c1207f8c ESP: c1207f4c
> [  523.969426] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  523.970458] CR0: 80050033 CR2: 09314f5c CR3: 1d9a0000 CR4: 003506d0
> [  523.971378] Call Trace:
> [  523.971803]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  523.972691]  kthread+0xe2/0x110
> [  523.973145]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  523.974012]  ? kthread_park+0xa0/0xa0
> [  523.974560]  ret_from_fork+0x1c/0x28
> [  523.975127] ---[ end trace f0d5ead0494363d7 ]---
> [  523.975826] ------------[ cut here ]------------
> [  523.976463] rcu_torture_writer: rtort_pipe_count: 3
> [  523.977202] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  523.978681] Modules linked in: rcutorture torture
> [  523.979335] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  523.980606] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  523.981852] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  523.982720] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  523.985256] EAX: 00000027 EBX: 0000001d ECX: f51879d0 EDX: f517de68
> [  523.986190] ESI: f7873268 EDI: f7872e84 EBP: c1207f8c ESP: c1207f4c
> [  523.987106] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  523.988123] CR0: 80050033 CR2: 09314f5c CR3: 1d9a0000 CR4: 003506d0
> [  523.989042] Call Trace:
> [  523.989397]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  523.990311]  kthread+0xe2/0x110
> [  523.990822]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  523.991696]  ? kthread_park+0xa0/0xa0
> [  523.992220]  ret_from_fork+0x1c/0x28
> [  523.992762] ---[ end trace f0d5ead0494363d8 ]---
> [  523.993417] ------------[ cut here ]------------
> [  523.994099] rcu_torture_writer: rtort_pipe_count: 3
> [  523.994868] WARNING: CPU: 0 PID: 407 at
> kernel/rcu/rcutorture.c:1169 rcu_torture_writer+0x673/0x770
> [rcutorture]
> [  523.996299] Modules linked in: rcutorture torture
> [  523.997009] CPU: 0 PID: 407 Comm: rcu_torture_wri Tainted: G
> W         5.10.0-next-20201215 #2
> [  523.998335] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [  523.999523] EIP: rcu_torture_writer+0x673/0x770 [rcutorture]
> [  524.000376] Code: f7 85 c0 75 13 b8 01 00 00 00 87 05 4c 28 87 f7
> 85 c0 0f 84 97 00 00 00 ff 77 fc 68 78 16 87 f7 68 19 03 87 f7 e8 6e
> a8 86 e5 <0f> 0b 83 c4 0c eb 9e 8d b6 00 00 00 00 e8 2b 2f ce e4 83 fb
> 03 0f
> [  524.003009] EAX: 00000027 EBX: 0000001e ECX: f51879d0 EDX: f517de68
> [  524.003921] ESI: f7873268 EDI: f7872e9c EBP: c1207f8c ESP: c1207f4c
> [  524.004854] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010296
> [  524.005838] CR0: 80050033 CR2: 09314f5c CR3: 1d9a0000 CR4: 003506d0
> [  524.006776] Call Trace:
> [  524.007128]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  524.008017]  kthread+0xe2/0x110
> [  524.008476]  ? rcu_torture_read_exit_child+0x40/0x40 [rcutorture]
> [  524.009362]  ? kthread_park+0xa0/0xa0
> [  524.009931]  ret_from_fork+0x1c/0x28
> [  524.010475] ---[ end trace f0d5ead0494363d9 ]---
> [  532.416286] rcu-torture: rcu_torture_read_exit: Start of episode
> [  532.434712] rcu-torture: rcu_torture_read_exit: End of episode
> [  545.779676] rcu-torture: rcu_torture_read_exit: Start of episode
> [  545.795961] rcu-torture: rcu_torture_read_exit: End of episode
> [  559.154678] rcu-torture: rcu_torture_read_exit: Start of episode
> [  559.177267] rcu-torture: rcu_torture_read_exit: End of episode
> [  562.353751] rcu-torture: rtc: c4aca2af ver: 36863 tfle: 0 rta:
> 36864 rtaf: 0 rtf: 36852 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0
> rtb: 0 nt: 543473 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier:
> 0/0:0 read-exits: 713
> [  562.356467] rcu-torture: Reader Pipe:  649527074 54135 0 0 0 0 0 0 0 0 0
> [  562.357608] rcu-torture: Reader Batch:  649469764 111445 0 0 0 0 0 0 0 0 0
> [  562.358740] rcu-torture: Free-Block Circulation:  36863 36862 36861
> 36860 36858 36857 36856 36855 36854 36852 0
> [  572.593718] rcu-torture: rcu_torture_read_exit: Start of episode
> [  572.602551] rcu-torture: rcu_torture_read_exit: End of episode
> [  585.970759] rcu-torture: rcu_torture_read_exit: Start of episode
> [  585.975978] rcu-torture: rcu_torture_read_exit: End of episode
> [  595.984670] rcu_torture_fwd_prog_nr: Duration 13138 cver 790 gps 1388
> [  596.183830] rcu_torture_fwd_prog_cr Duration 38 barrier: 15 pending
> 43040 n_launders: 127889 n_launders_sa: 104125 n_max_gps: 100
> n_max_cbs: 67685 cver 3 gps 10
> [  596.186079] rcu_torture_fwd_cb_hist: Callback-invocation histogram
> (duration 55 jiffies): 1s/10: 195574:13
> [  599.346737] rcu-torture: rcu_torture_read_exit: Start of episode
> [  599.361681] rcu-torture: rcu_torture_read_exit: End of episode
> [  612.662698] rcu-torture: rcu_torture_read_exit: Start of episode
> [  612.801463] rcu-torture: rcu_torture_read_exit: End of episode
> [  618.248862] rcu-torture: Stopping rcu_torture_reader
> [  618.248862] rcu-torture: Stopping torture_shuffle task
> [  618.249752] rcu-torture: Stopping rcu_torture_reader
> [  618.252955] rcu-torture: Stopping torture_shuffle
> [  618.254334] rcu-torture: Stopping torture_stutter task
> [  618.256699] rcu-torture: Stopping torture_stutter
> [  618.257484] rcu: rcu_sched: wait state: RCU_GP_WAIT_FQS(5) ->state:
> 0x402 delta ->gp_activity 4 ->gp_req_activity 261 ->gp_wake_time 261
> ->gp_wake_seq 272805 ->gp_seq 272809 ->gp_seq_needed 272816 ->gp_flags
> 0x0
> [  618.260860] rcu: rcu_node 0:3 ->gp_seq 272809 ->gp_seq_needed 272816
> [  618.261883] rcu: cpu 0 ->gp_seq_needed 272816
> [  618.262618] rcu: cpu 1 ->gp_seq_needed 272816
> [  618.263364] rcu: cpu 2 ->gp_seq_needed 272812
> [  618.264141] rcu: cpu 3 ->gp_seq_needed 272816
> [  618.265089] rcu: RCU callbacks invoked since boot: 2381909
> [  618.266316] rcu_tasks: RTGS_INIT(0) since 318056 g:0 i:0/0 k.
> [  618.267203] rcu_tasks_rude: RTGS_INIT(0) since 318057 g:0 i:0/0 k.
> [  618.268144] rcu_tasks_trace: RTGS_INIT(0) since 318058 g:0 i:0/0 k.
> N0 h:0/0/0
> [  618.299515] rcu-torture: Stopping rcu_torture_reader
> [  618.299585] rcu-torture: Stopping rcu_torture_fakewriter
> [  618.302051] rcu-torture: Stopping rcu_torture_fakewriter
> [  618.302209] rcu-torture: Stopping rcu_torture_fakewriter
> [  618.304284] rcu-torture: Stopping rcu_torture_writer
> [  618.305734] rcu-torture: Stopping rcu_torture_fakewriter
> [  619.249840] rcu-torture: Stopping rcu_torture_read_exit
> [  619.250000] rcu-torture: Stopping rcutorture_read_exit task
> [  619.252823] rcu-torture: Stopping rcu_torture_fwd_prog task
> [  620.401707] rcu_torture_fwd_prog: tested 8 tested_tries 9
> [  620.402596] rcu-torture: Stopping rcu_torture_fwd_prog
> [  620.403580] rcu-torture: Stopping rcu_torture_writer task
> [  620.405247] rcu-torture: Stopping rcu_torture_reader task
> [  620.406615] rcu-torture: Stopping rcu_torture_reader task
> [  620.407817] rcu-torture: Stopping rcu_torture_reader task
> [  620.409431] rcu-torture: Stopping rcu_torture_fakewriter task
> [  620.411135] rcu-torture: Stopping rcu_torture_fakewriter task
> [  620.412773] rcu-torture: Stopping rcu_torture_fakewriter task
> [  620.414392] rcu-torture: Stopping rcu_torture_fakewriter task
> [  620.416074] rcu:  End-test grace-period state: g272877 f0x0 total-gps=67976
> [  620.417940] rcu-torture: Stopping rcu_torture_stats task
> [  620.419132] rcu-torture: rtc: 00000000 VER: 40657 tfle: 0 rta:
> 40657 rtaf: 0 rtf: 40647 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0
> rtb: 0 nt: 599512 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier:
> 0/0:0 read-exits: 781
> [  620.423816] rcu-torture: Reader Pipe:  715152697 59638 0 0 0 0 0 0 0 0 0
> [  620.425933] rcu-torture: Reader Batch:  715089910 122425 0 0 0 0 0 0 0 0 0
> [  620.428019] rcu-torture: Free-Block Circulation:  40656 40655 40654
> 40653 40652 40651 40650 40649 40648 40647 0
> [  620.430867] rcu-torture: Stopping rcu_torture_stats
> [  620.438806] rcu-torture: rtc: 00000000 VER: 40657 tfle: 0 rta:
> 40657 rtaf: 0 rtf: 40647 rtmbe: 0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0
> rtb: 0 nt: 599512 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=1000) barrier:
> 0/0:0 read-exits: 781
> [  620.444478] rcu-torture: Reader Pipe:  715152697 59638 0 0 0 0 0 0 0 0 0
> [  620.446691] rcu-torture: Reader Batch:  715089910 122425 0 0 0 0 0 0 0 0 0
> [  620.448894] rcu-torture: Free-Block Circulation:  40656 40655 40654
> 40653 40652 40651 40650 40649 40648 40647 0
> [  620.451315] rcu-torture:--- End of test: SUCCESS: nreaders=3
> nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1
> shuffle_interval=3 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0
> fqs_stutter=3 test_boost=1/0 test_boost_interval=7
> test_boost_duration=4 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10
> stall_cpu_irqsoff=0 stall_cpu_block=0 n_barrier_cbs=0 onoff_interval=0
> onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16
> rmmod-rcutorture pass
> [  620.451315] rcu-torture:--- End of test: SUCCESS: nreaders=3
> nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1
> shuffle_interval=3 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0
> fqs_stutter=3 test_boost=1/0 test_boost_interval=7
> test_boost_duration=4 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10
> stall_cpu_irqsoff=0 stall_cpu_block=0 n_barrier_cbs=0 onoff_interval=0
> onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16
> 
> 
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/aroxell/lkft-linux-next
>   git commit: 9317f948b0b188b8d2fded75957e6d42c460df1b
>   git describe: next-20201215
>   make_kernelversion: 5.10.0
>   kernel-config: https://builds.tuxbuild.com/1ljRF6wqoO5OmOHSQgKBvEv8dxG/config
> 
> full test log link,
> https://lkft.validation.linaro.org/scheduler/job/2052992#L842
> 
> -- 
> Linaro LKFT
> https://lkft.linaro.org
