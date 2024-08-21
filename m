Return-Path: <linux-next+bounces-3384-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFE295A2F3
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 18:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 188F81C22029
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 16:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCDB166F2A;
	Wed, 21 Aug 2024 16:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdj3a8/N"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E2D1531D8;
	Wed, 21 Aug 2024 16:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724258142; cv=none; b=D/KFXKcs0wkZgfBtH9l6qmuYjVWpz2j49Jkch3e0yp+wSWoKqlnfAu49YL8docgZEmLmMuQYD2y6g3X3eVweokrtPwAsP7t/29HSHsl/vCKF8MFG6JGK3oN6Zc+wQNKZ8ume9bukgZQ24Ta7cD7Gu1uHlQxJeznoxUwALZyqKxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724258142; c=relaxed/simple;
	bh=mVVQt8vfen6cLdftC8wh2TeYkqCsp9PRkdY9AUiKv+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbMiC8k3aWfI5yfmGbN2JTo3vjs4vGORjOAYYF993rnt98iLNe9gg4lsCEA5RFT9JYPgikZ1NccdIL6tOHEkB5SN2od51Lbv9cBeTJKpol+wHzxJOheysROp5XFPXoJiYpiZzgoNie6jLxQbM+DspoPXSdtxUXm2sf50849vPrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdj3a8/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E89C32781;
	Wed, 21 Aug 2024 16:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724258142;
	bh=mVVQt8vfen6cLdftC8wh2TeYkqCsp9PRkdY9AUiKv+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdj3a8/Ngq72vKelenxI9RXYEwvVPWQa2MzfK/fAE4fQDL42Gnzzt76QeRtCUMq39
	 QGihwbTO8LtbAI2L/zQwcj3/RSXQxa237A9ZpkJNdbnHaa9VAQ/fpvumStiBb7ZoLZ
	 GLa8kw4EPrMyhbf+5mAbMg7Z2p8mvTMoxHf41a6jPv0/rqKbi9nnBwMcvFAvsd7c6i
	 hhfcWjbZMxmL/tEOdRvp7K3DYMigfyrpMj1WeBtLS/oXC3g3TFvYZL7lQkELGxcEPM
	 tJK4nOAieCocPbIV+4kgw2xsk2zMUempnTZ+qRcg32wOsrBm1s0ZTPQq+XHdVnZsub
	 cOkIuBNzuBPsg==
Date: Wed, 21 Aug 2024 06:35:41 -1000
From: Tejun Heo <tj@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: matthew.brost@intel.com, jiangshanlai@gmail.com, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [BUG bisected] sysfs: cannot create duplicate filename
 '/devices/virtual/workqueue/scsi_tmf_1073822488'
Message-ID: <ZsYXXd6tQAlFwkg8@slm.duckdns.org>
References: <8d443293-2020-42d9-b5b1-1348f551648f@paulmck-laptop>
 <ZsYTZTEbtMuVyp1o@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsYTZTEbtMuVyp1o@slm.duckdns.org>

On Wed, Aug 21, 2024 at 06:18:45AM -1000, Tejun Heo wrote:
...
> > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "2*TREE01" --trust-make
...
> Hmmm... I have a hard time imagining that change causing that error. My bet
> is unreliable reproducer. I'll try the repro.

I'm probably doing something wrong but all the tests say that init
segfaulted in the log file:

  [    5.505986] init[1]: segfault at 28 ip 000000000040101f sp 00007fff1bbf6fc0 error 4 in init[101f,401000+1000] likely on CPU 12 (core 12, socket 0)
  [    5.509949] Code: Unable to access opcode bytes at 0x400ff5.
  [    5.512314] coredump: 1(init): over coredump resource limit, skipping core dump
  [    5.514976] coredump: 1(init): coredump has not been created, error -7
  [    5.516911] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

Pasting the command output:

  $ tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "2*TREE01" --trust-make
  tools/testing/selftests/rcutorture/initrd/init already exists, no need to create it
  Results directory: /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03
  tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 2*TREE01 --trust-make
  ----Start batch 1: Wed Aug 21 06:31:03 AM HST 2024
  TREE01 8: Starting build. Wed Aug 21 06:31:03 AM HST 2024
  TREE01 8: Waiting for build to complete. Wed Aug 21 06:31:03 AM HST 2024
  TREE01 8: Build complete. Wed Aug 21 06:31:30 AM HST 2024
  TREE01.2 8: Starting build. Wed Aug 21 06:31:30 AM HST 2024
  TREE01.2 8: Waiting for build to complete. Wed Aug 21 06:31:30 AM HST 2024
  TREE01.2 8: Build complete. Wed Aug 21 06:31:31 AM HST 2024
  ---- TREE01 8: Kernel present. Wed Aug 21 06:31:31 AM HST 2024
  ---- TREE01.2 8: Kernel present. Wed Aug 21 06:31:31 AM HST 2024
  ---- Starting kernels. Wed Aug 21 06:31:31 AM HST 2024
  ---- All kernel runs complete. Wed Aug 21 06:31:42 AM HST 2024
  ---- TREE01 8: Build/run results:
   --- Wed Aug 21 06:31:03 AM HST 2024: Starting build, PID 456070
   --- Wed Aug 21 06:31:31 AM HST 2024: Starting kernel
  CPU-hotplug kernel, adding rcutorture onoff.
   --- Wed Aug 21 06:31:31 AM HST 2024: Starting kernel, PID 483593
  Monitoring qemu job at pid 483623 Wed Aug 21 06:31:41 AM HST 2024
  TREE01 no success message, 0 successful version messages
  WARNING: Assertion failure in /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03/TREE01/console.log TREE01
  WARNING: Summary: Call Traces: 1
  ---- TREE01.2 8: Build/run results:
   --- Wed Aug 21 06:31:30 AM HST 2024: Starting build, PID 482122
   --- Wed Aug 21 06:31:31 AM HST 2024: Starting kernel
  CPU-hotplug kernel, adding rcutorture onoff.
   --- Wed Aug 21 06:31:31 AM HST 2024: Starting kernel, PID 483619
  Monitoring qemu job at pid 483648 Wed Aug 21 06:31:41 AM HST 2024
  TREE01 no success message, 0 successful version messages
  WARNING: Assertion failure in /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03/TREE01.2/console.log TREE01
  WARNING: Summary: Call Traces: 1


   --- Wed Aug 21 06:31:42 AM HST 2024 Test summary:
  Results directory: /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03
  tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 2*TREE01 --trust-make
  TREE01 ------- 
  TREE01 no success message, 0 successful version messages
  WARNING: Assertion failure in /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03/TREE01/console.log TREE01
  WARNING: Summary: Call Traces: 1
  Completed in 10 vs. 60
  TREE01.2 ------- 
  TREE01.2 no success message, 0 successful version messages
  WARNING: Assertion failure in /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03/TREE01.2/console.log TREE01.2
  WARNING: Summary: Call Traces: 1
  Completed in 10 vs. 60
  2 runs with build errors.
  2 runs with runtime errors.
   --- Done at Wed Aug 21 06:31:42 AM HST 2024 (39 seconds) exitcode 3

--
tejun

