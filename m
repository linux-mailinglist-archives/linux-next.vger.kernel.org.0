Return-Path: <linux-next+bounces-4261-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5376899D6D5
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 20:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 453DB1C20FC7
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 18:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244CB1C831A;
	Mon, 14 Oct 2024 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV/kwmOl"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD41AC45F;
	Mon, 14 Oct 2024 18:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728932106; cv=none; b=GW0t3W6DSXaOzTOsBnAFU62RLX7LlZ+6TWH0pZSo1mySouzdNNOjtrWzL81C/EDKFsZgLrCkZ2AteunnnokEyIU5xRJWMhzs3GPyK9sqEkZ7WqkXvEntDhxqP7+jm3cjRj5kuVft2ZqDhstjLe9Z/oss0XAqoPSgElbOAtqHlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728932106; c=relaxed/simple;
	bh=8zP52/Vyia2XoM5u4/Yc0Vbx9/5orkfaOzFGqEIi2YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFq26EQ2ChEdPslmVUTMRD2av7rg2n7AZYaL2wcG947qrRadVrvRB7lPOgTMcdmFzCcZ9slEvd2gH4eFI8//XIPk45X8Ue96WnD9ueIn0899IRnXoP9NDwau/dGck1VVSID7STsf2mxsElTj6DY4UGXRM9SMlLUKBF+xKwIWN/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AV/kwmOl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB23C4CEC3;
	Mon, 14 Oct 2024 18:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728932105;
	bh=8zP52/Vyia2XoM5u4/Yc0Vbx9/5orkfaOzFGqEIi2YI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=AV/kwmOlhqV5F/7KXGU8RcezH4AIElbtXM/c6yU2tC5AjRSBl9EeDMp4it2ykFf2B
	 44lrN/TXaNjnewMVr/a4Qi9Z3jF4YzACWwT14UwfYF4FL6G4Wavqhzx1WiehxOP30E
	 TGBzOpkaJf31OHKRb+prolVQ/3gdp6EC7x52ZJn3Ki0/fKmp7Zl9aUcD/nzPht18BZ
	 i4vvqVJDT15jrkEl+7fBghK9OaCXmN3WJpGMXdMffzh8ssrpWnYtM5fy2+AbbUwpe1
	 WacIFLTKsdG4PMo4KRblREb4SK6V2MJGyE5N9yYZxyL6+ekL5csg0jrBWJlXttRfiQ
	 oiu2OAz1fzD2Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 15D39CE13B1; Mon, 14 Oct 2024 11:55:05 -0700 (PDT)
Date: Mon, 14 Oct 2024 11:55:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Tomas Glozar <tglozar@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <b9064ed8-387d-47ce-ad0a-7642ad180fc3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop>
 <43d513c5-7620-481b-ab7e-30e76babbc80@paulmck-laptop>
 <xhsmhed50vplj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
 <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop>
 <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
 <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>
 <35e44f60-0a2f-49a7-b44b-c6537544a888@paulmck-laptop>
 <fe2262ff-2c3d-495a-8ebb-c34485cb62a2@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe2262ff-2c3d-495a-8ebb-c34485cb62a2@paulmck-laptop>

On Thu, Oct 10, 2024 at 04:28:38PM -0700, Paul E. McKenney wrote:
> On Thu, Oct 10, 2024 at 08:01:35AM -0700, Paul E. McKenney wrote:
> > On Thu, Oct 10, 2024 at 01:24:11PM +0200, Tomas Glozar wrote:
> > > st 2. 10. 2024 v 11:01 odesílatel Tomas Glozar <tglozar@redhat.com> napsal:
> > > >
> > > > FYI I have managed to reproduce the bug on our infrastructure after 21
> > > > hours of 7*TREE03 and I will continue with trying to reproduce it with
> > > > the tracers we want.
> > > >
> > > > Tomas
> > > 
> > > I successfully reproduced the bug also with the tracers active after a
> > > few 8-hour test runs on our infrastructure:
> > > 
> > > [    0.000000] Linux version 6.11.0-g2004cef11ea0-dirty (...) #1 SMP
> > > PREEMPT_DYNAMIC Wed Oct  9 12:13:40 EDT 2024
> > > [    0.000000] Command line: debug_boot_weak_hash panic=-1 selinux=0
> > > initcall_debug debug console=ttyS0 rcutorture.n_barrier_cbs=4
> > > rcutorture.stat_interval=15 rcutorture.shutdown_secs=25200
> > > rcutorture.test_no_idle_hz=1 rcutorture.verbose=1
> > > rcutorture.onoff_interval=200 rcutorture.onoff_holdoff=30
> > > rcutree.gp_preinit_delay=12 rcutree.gp_init_delay=3
> > > rcutree.gp_cleanup_delay=3 rcutree.kthread_prio=2 threadirqs
> > > rcutree.use_softirq=0
> > > trace_event=sched:sched_switch,sched:sched_wakeup
> > > ftrace_filter=dl_server_start,dl_server_stop trace_buf_size=2k
> > > ftrace=function torture.ftrace_dump_at_shutdown=1
> > > ...
> > > [13550.127541] WARNING: CPU: 1 PID: 155 at
> > > kernel/sched/deadline.c:1971 enqueue_dl_entity+0x554/0x5d0
> > > [13550.128982] Modules linked in:
> > > [13550.129528] CPU: 1 UID: 0 PID: 155 Comm: rcu_torture_rea Tainted: G
> > >        W          6.11.0-g2004cef11ea0-dirty #1
> > > [13550.131419] Tainted: [W]=WARN
> > > [13550.131979] Hardware name: Red Hat KVM/RHEL, BIOS 1.16.3-2.el9 04/01/2014
> > > [13550.133230] RIP: 0010:enqueue_dl_entity+0x554/0x5d0
> > > ...
> > > [13550.151286] Call Trace:
> > > [13550.151749]  <TASK>
> > > [13550.152141]  ? __warn+0x88/0x130
> > > [13550.152717]  ? enqueue_dl_entity+0x554/0x5d0
> > > [13550.153485]  ? report_bug+0x18e/0x1a0
> > > [13550.154149]  ? handle_bug+0x54/0x90
> > > [13550.154792]  ? exc_invalid_op+0x18/0x70
> > > [13550.155484]  ? asm_exc_invalid_op+0x1a/0x20
> > > [13550.156249]  ? enqueue_dl_entity+0x554/0x5d0
> > > [13550.157055]  dl_server_start+0x36/0xf0
> > > [13550.157709]  enqueue_task_fair+0x220/0x6b0
> > > [13550.158447]  activate_task+0x26/0x60
> > > [13550.159131]  attach_task+0x35/0x50
> > > [13550.159756]  sched_balance_rq+0x663/0xe00
> > > [13550.160511]  sched_balance_newidle.constprop.0+0x1a5/0x360
> > > [13550.161520]  pick_next_task_fair+0x2f/0x340
> > > [13550.162290]  __schedule+0x203/0x900
> > > [13550.162958]  ? enqueue_hrtimer+0x35/0x90
> > > [13550.163703]  schedule+0x27/0xd0
> > > [13550.164299]  schedule_hrtimeout_range_clock+0x99/0x120
> > > [13550.165239]  ? __pfx_hrtimer_wakeup+0x10/0x10
> > > [13550.165954]  torture_hrtimeout_us+0x7b/0xe0
> > > [13550.166624]  rcu_torture_reader+0x139/0x200
> > > [13550.167284]  ? __pfx_rcu_torture_timer+0x10/0x10
> > > [13550.168019]  ? __pfx_rcu_torture_reader+0x10/0x10
> > > [13550.168764]  kthread+0xd6/0x100
> > > [13550.169262]  ? __pfx_kthread+0x10/0x10
> > > [13550.169860]  ret_from_fork+0x34/0x50
> > > [13550.170424]  ? __pfx_kthread+0x10/0x10
> > > [13550.171020]  ret_from_fork_asm+0x1a/0x30
> > > [13550.171657]  </TASK>
> > > 
> > > Unfortunately, the following rcu stalls appear to have resulted in
> > > abnormal termination of the VM, which led to the ftrace buffer not
> > > being dumped into the console. Currently re-running the same test with
> > > the addition of "ftrace_dump_on_oops panic_on_warn=1" and hoping for
> > > the best.
> > 
> > Another approach would be rcupdate.rcu_cpu_stall_suppress=1.
> > 
> > We probably need to disable RCU CPU stall warnings automatically while
> > dumping ftrace buffers, but the asynchronous nature of printk() makes
> > it difficult to work out when to automatically re-enable them...
> 
> And in the meantime, for whatever it is worth...
> 
> The pattern of failures motivated me to add to rcutorture a real-time
> task that randomly preempts a randomly chosen online CPU.  Here are
> the (new and not-to-be-trusted) commits on -rcu's "dev" branch:
> 
> d1b99fa42af7 ("torture: Add dowarn argument to torture_sched_setaffinity()")
> aed555adc22a ("rcutorture: Add random real-time preemption")
> b09bcf8e1406 ("rcutorture: Make the TREE03 scenario do preemption")
> 
> Given these, the following sort of command, when run on dual-socket
> systems, reproduces a silent failure within a few minutes:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 4h --configs "4*TREE03" --kconfig "CONFIG_NR_CPUS=4" --trust-make
> 
> But on my laptop, a 30-minute run resulted in zero failures.  I am now
> retrying with a four-hour laptop run.

And this silent failure was me hurting myself with a change to scripting
to better handle test hosts disappearing (it does sometimes happen).
With the scripting fixed, I am getting simple too-short grace periods,
though only a few per 8-hour 400*TREE03 4-CPU guest-OS run.

> I am also adjusting the preemption duration and frequency to see if a
> more edifying failure mode might make itself apparent.  :-/

But no big wins thus far, so this will be a slow process.  My current test
disables CPU hotplug.  I will be disabling other things in the hope of
better identifying the code paths that should be placed under suspicion.

							Thanx, Paul

