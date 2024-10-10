Return-Path: <linux-next+bounces-4218-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA8998BB4
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 17:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 245C0B368C2
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 15:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF9F1CDFC3;
	Thu, 10 Oct 2024 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPz1MtpU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BA31CDFC1;
	Thu, 10 Oct 2024 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728572496; cv=none; b=fM6hIJJ9cLk3cHnrN4L9hsl7LFPxNahR2bMxepgFCVxKLeq1t796H9OYOVHq3a8Zxq16zdSfynPAGeaNnFoMxr+GhCLFQJSO80rBkL4FiePMB+UVXqpq7VHOAclXHKdr1L357aBiHsKyQInQ34p+5+K+PRy8H5Dda650tF4fliQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728572496; c=relaxed/simple;
	bh=3ZuII3jCq9XuWdxTfQR3pHwNE8GYOCmagnvx+5PMyv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T23HzCD8lmKIp/YtueWABkKvmVQd7SknJoYjOzakob9WFDWIERf9swsyJf/y4s4iTLL8VY42WXAsXI2xhEgShVAbLKpStHlzqqMMCEctiqesXyoljJ4r4S85e3cqhQHm92ugXSTufSave2Dt3fdkY9Hd67TSpCGcSlI9JBs5Fzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPz1MtpU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1F4C4CEC5;
	Thu, 10 Oct 2024 15:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728572496;
	bh=3ZuII3jCq9XuWdxTfQR3pHwNE8GYOCmagnvx+5PMyv4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=LPz1MtpU081gJvOorh3+/32FbgLhKYKMuleTwDHw0WZKGiOr0Sc+mrEkhmXRlEpFh
	 zJxCrvnIJx1pDY5z/q0Gb86fJ4fhH6Re5IdUT9nkjjLBoVE+ANY0HyR/k3EZbDuVtW
	 YYbQjgR2Y2pKNFLDCW0u1JKbxbM2u0pJUT3s6rZoDM03MajCDl86p+K2vE7WFYnVFV
	 +dzw8S0YP2elsm1tms8SKYDEI7VuNEmKXwRGd53C/OIR0zxuRgJfz9R311WS0yyTWj
	 OJni5anIm17lxnJDvEHShA74dj4sRdF/0pgdfFP20757u6ox8QdlmDViafVRlZ/fZa
	 JldNUX2S1yTlg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 80C22CE08F7; Thu, 10 Oct 2024 08:01:35 -0700 (PDT)
Date: Thu, 10 Oct 2024 08:01:35 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Tomas Glozar <tglozar@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <35e44f60-0a2f-49a7-b44b-c6537544a888@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <182ef9c6-63a4-4608-98de-22ef4d35be07@paulmck-laptop>
 <xhsmh34m38pdl.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop>
 <43d513c5-7620-481b-ab7e-30e76babbc80@paulmck-laptop>
 <xhsmhed50vplj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
 <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop>
 <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
 <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>

On Thu, Oct 10, 2024 at 01:24:11PM +0200, Tomas Glozar wrote:
> st 2. 10. 2024 v 11:01 odesílatel Tomas Glozar <tglozar@redhat.com> napsal:
> >
> > FYI I have managed to reproduce the bug on our infrastructure after 21
> > hours of 7*TREE03 and I will continue with trying to reproduce it with
> > the tracers we want.
> >
> > Tomas
> 
> I successfully reproduced the bug also with the tracers active after a
> few 8-hour test runs on our infrastructure:
> 
> [    0.000000] Linux version 6.11.0-g2004cef11ea0-dirty (...) #1 SMP
> PREEMPT_DYNAMIC Wed Oct  9 12:13:40 EDT 2024
> [    0.000000] Command line: debug_boot_weak_hash panic=-1 selinux=0
> initcall_debug debug console=ttyS0 rcutorture.n_barrier_cbs=4
> rcutorture.stat_interval=15 rcutorture.shutdown_secs=25200
> rcutorture.test_no_idle_hz=1 rcutorture.verbose=1
> rcutorture.onoff_interval=200 rcutorture.onoff_holdoff=30
> rcutree.gp_preinit_delay=12 rcutree.gp_init_delay=3
> rcutree.gp_cleanup_delay=3 rcutree.kthread_prio=2 threadirqs
> rcutree.use_softirq=0
> trace_event=sched:sched_switch,sched:sched_wakeup
> ftrace_filter=dl_server_start,dl_server_stop trace_buf_size=2k
> ftrace=function torture.ftrace_dump_at_shutdown=1
> ...
> [13550.127541] WARNING: CPU: 1 PID: 155 at
> kernel/sched/deadline.c:1971 enqueue_dl_entity+0x554/0x5d0
> [13550.128982] Modules linked in:
> [13550.129528] CPU: 1 UID: 0 PID: 155 Comm: rcu_torture_rea Tainted: G
>        W          6.11.0-g2004cef11ea0-dirty #1
> [13550.131419] Tainted: [W]=WARN
> [13550.131979] Hardware name: Red Hat KVM/RHEL, BIOS 1.16.3-2.el9 04/01/2014
> [13550.133230] RIP: 0010:enqueue_dl_entity+0x554/0x5d0
> ...
> [13550.151286] Call Trace:
> [13550.151749]  <TASK>
> [13550.152141]  ? __warn+0x88/0x130
> [13550.152717]  ? enqueue_dl_entity+0x554/0x5d0
> [13550.153485]  ? report_bug+0x18e/0x1a0
> [13550.154149]  ? handle_bug+0x54/0x90
> [13550.154792]  ? exc_invalid_op+0x18/0x70
> [13550.155484]  ? asm_exc_invalid_op+0x1a/0x20
> [13550.156249]  ? enqueue_dl_entity+0x554/0x5d0
> [13550.157055]  dl_server_start+0x36/0xf0
> [13550.157709]  enqueue_task_fair+0x220/0x6b0
> [13550.158447]  activate_task+0x26/0x60
> [13550.159131]  attach_task+0x35/0x50
> [13550.159756]  sched_balance_rq+0x663/0xe00
> [13550.160511]  sched_balance_newidle.constprop.0+0x1a5/0x360
> [13550.161520]  pick_next_task_fair+0x2f/0x340
> [13550.162290]  __schedule+0x203/0x900
> [13550.162958]  ? enqueue_hrtimer+0x35/0x90
> [13550.163703]  schedule+0x27/0xd0
> [13550.164299]  schedule_hrtimeout_range_clock+0x99/0x120
> [13550.165239]  ? __pfx_hrtimer_wakeup+0x10/0x10
> [13550.165954]  torture_hrtimeout_us+0x7b/0xe0
> [13550.166624]  rcu_torture_reader+0x139/0x200
> [13550.167284]  ? __pfx_rcu_torture_timer+0x10/0x10
> [13550.168019]  ? __pfx_rcu_torture_reader+0x10/0x10
> [13550.168764]  kthread+0xd6/0x100
> [13550.169262]  ? __pfx_kthread+0x10/0x10
> [13550.169860]  ret_from_fork+0x34/0x50
> [13550.170424]  ? __pfx_kthread+0x10/0x10
> [13550.171020]  ret_from_fork_asm+0x1a/0x30
> [13550.171657]  </TASK>
> 
> Unfortunately, the following rcu stalls appear to have resulted in
> abnormal termination of the VM, which led to the ftrace buffer not
> being dumped into the console. Currently re-running the same test with
> the addition of "ftrace_dump_on_oops panic_on_warn=1" and hoping for
> the best.

Another approach would be rcupdate.rcu_cpu_stall_suppress=1.

We probably need to disable RCU CPU stall warnings automatically while
dumping ftrace buffers, but the asynchronous nature of printk() makes
it difficult to work out when to automatically re-enable them...

Thoughts?

							Thanx, Paul

