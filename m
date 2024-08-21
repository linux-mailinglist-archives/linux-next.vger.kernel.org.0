Return-Path: <linux-next+bounces-3387-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5719B95A48E
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 20:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C0B01C21C42
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 18:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7C61B3B1E;
	Wed, 21 Aug 2024 18:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIqcwUnj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766DB1B3B1C;
	Wed, 21 Aug 2024 18:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724264066; cv=none; b=ruh+RuxoeHBfE1lJCYZOKf1llYsk97F3h2S7L1BX5tYgyg9qESySQjNfREbJafAqER4hMFl/HSiY7BvHByzO2RJVqUUCk75NX5Wo/bqhs7Wh2L2nfSKkL6NIj/XEU8djEu6cDE/2ePfVVDeljTfq0i5Ne2Gd59wPVsqDyOaQga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724264066; c=relaxed/simple;
	bh=C/OgPyS4vrzttU74RoN+rRiu9i2PGT5auAFadzV/eMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOBvMcClAL/+ggEF7XTjsLeHKVEh0cpf9Mpkd0eqdUiSMpholBi030piZ3x84vR+1nLCWcI7eSl0e8algjlpRTaDtDFuWC+dqZ/6Y4Umsk5B/K7SnDxHjnI+yZ/9qBl0uLqf1H5v0GzkEdNj5WgXHJzeEXdxyHqTdKqetmfjcaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIqcwUnj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07489C32781;
	Wed, 21 Aug 2024 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724264066;
	bh=C/OgPyS4vrzttU74RoN+rRiu9i2PGT5auAFadzV/eMo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nIqcwUnjDE6c13tnsfACvLzgqnCMk628ANITdzphA1qLhAfzctNpkhgCjC0zljg+/
	 j+UKYkIE91G+lBSB8SZ2WYAUUBaFgztVyzw8y2fp8yBIu7bE/AVBXoFQF7jFd86btT
	 WEDlVAhFK4PD55YLE2QUDBqV3bnFK0b6lM1KMoHVKqZFXd+4ym1Yddn8pctUfcN3aQ
	 8snUnj19nUUY8+jd/8XkzfTVh4ybbyMZL0iFXomAkBHY409zB3EE5Qz5CAQgOAMHR+
	 W/1lG6yCK5qthChUwriay9KAwFX0uMNoweIYvKdM8LVzdZWG4/Ms4j3A4H+zVE1MuN
	 O78MVa99AlFIg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9B27DCE160F; Wed, 21 Aug 2024 11:14:25 -0700 (PDT)
Date: Wed, 21 Aug 2024 11:14:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: matthew.brost@intel.com, jiangshanlai@gmail.com, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [BUG bisected] sysfs: cannot create duplicate filename
 '/devices/virtual/workqueue/scsi_tmf_1073822488'
Message-ID: <8667d109-c1ca-4656-b965-14bde98da4d1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8d443293-2020-42d9-b5b1-1348f551648f@paulmck-laptop>
 <ZsYTZTEbtMuVyp1o@slm.duckdns.org>
 <ZsYXXd6tQAlFwkg8@slm.duckdns.org>
 <d5912536-ecc0-411e-b837-4822a9d00e8c@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5912536-ecc0-411e-b837-4822a9d00e8c@paulmck-laptop>

On Wed, Aug 21, 2024 at 10:37:21AM -0700, Paul E. McKenney wrote:
> On Wed, Aug 21, 2024 at 06:35:41AM -1000, Tejun Heo wrote:
> > On Wed, Aug 21, 2024 at 06:18:45AM -1000, Tejun Heo wrote:
> > ...
> > > > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "2*TREE01" --trust-make
> > ...
> > > Hmmm... I have a hard time imagining that change causing that error. My bet
> > > is unreliable reproducer. I'll try the repro.
> 
> I am glad that it was not just me being blind, then.  ;-)
> 
> And thank you for trying this out!
> 
> > I'm probably doing something wrong but all the tests say that init
> > segfaulted in the log file:
> > 
> >   [    5.505986] init[1]: segfault at 28 ip 000000000040101f sp 00007fff1bbf6fc0 error 4 in init[101f,401000+1000] likely on CPU 12 (core 12, socket 0)
> >   [    5.509949] Code: Unable to access opcode bytes at 0x400ff5.
> >   [    5.512314] coredump: 1(init): over coredump resource limit, skipping core dump
> >   [    5.514976] coredump: 1(init): coredump has not been created, error -7
> >   [    5.516911] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> You are right, that is not the expected result.
> 
> > Pasting the command output:
> > 
> >   $ tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "2*TREE01" --trust-make
> >   tools/testing/selftests/rcutorture/initrd/init already exists, no need to create it
> 
> There was already an "init" program, so one thing to try is to remove it
> and re-run.  The kvm.sh script will then rebuild it.
> 
> I just tried that in case some recent change made this fail to work, and
> it "worked for me":
> 
> Creating a statically linked C-language initrd
> Done creating a statically linked C-language initrd
> 
> I will also be testing next-20240821 in case it magically got better.
> Stranger things have happened...

And it magically got better.  Yay?

Unfortunately not the case for the other bug I was chasing, but you
cannot have everything...

Apologies for the noise!

							Thanx, Paul

> >   Results directory: /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03
> >   tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 2*TREE01 --trust-make
> >   ----Start batch 1: Wed Aug 21 06:31:03 AM HST 2024
> >   TREE01 8: Starting build. Wed Aug 21 06:31:03 AM HST 2024
> >   TREE01 8: Waiting for build to complete. Wed Aug 21 06:31:03 AM HST 2024
> >   TREE01 8: Build complete. Wed Aug 21 06:31:30 AM HST 2024
> >   TREE01.2 8: Starting build. Wed Aug 21 06:31:30 AM HST 2024
> >   TREE01.2 8: Waiting for build to complete. Wed Aug 21 06:31:30 AM HST 2024
> >   TREE01.2 8: Build complete. Wed Aug 21 06:31:31 AM HST 2024
> >   ---- TREE01 8: Kernel present. Wed Aug 21 06:31:31 AM HST 2024
> >   ---- TREE01.2 8: Kernel present. Wed Aug 21 06:31:31 AM HST 2024
> >   ---- Starting kernels. Wed Aug 21 06:31:31 AM HST 2024
> >   ---- All kernel runs complete. Wed Aug 21 06:31:42 AM HST 2024
> >   ---- TREE01 8: Build/run results:
> >    --- Wed Aug 21 06:31:03 AM HST 2024: Starting build, PID 456070
> >    --- Wed Aug 21 06:31:31 AM HST 2024: Starting kernel
> >   CPU-hotplug kernel, adding rcutorture onoff.
> >    --- Wed Aug 21 06:31:31 AM HST 2024: Starting kernel, PID 483593
> >   Monitoring qemu job at pid 483623 Wed Aug 21 06:31:41 AM HST 2024
> >   TREE01 no success message, 0 successful version messages
> >   WARNING: Assertion failure in /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03/TREE01/console.log TREE01
> >   WARNING: Summary: Call Traces: 1
> >   ---- TREE01.2 8: Build/run results:
> >    --- Wed Aug 21 06:31:30 AM HST 2024: Starting build, PID 482122
> >    --- Wed Aug 21 06:31:31 AM HST 2024: Starting kernel
> >   CPU-hotplug kernel, adding rcutorture onoff.
> >    --- Wed Aug 21 06:31:31 AM HST 2024: Starting kernel, PID 483619
> >   Monitoring qemu job at pid 483648 Wed Aug 21 06:31:41 AM HST 2024
> >   TREE01 no success message, 0 successful version messages
> >   WARNING: Assertion failure in /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03/TREE01.2/console.log TREE01
> >   WARNING: Summary: Call Traces: 1
> > 
> > 
> >    --- Wed Aug 21 06:31:42 AM HST 2024 Test summary:
> >   Results directory: /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03
> >   tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 2*TREE01 --trust-make
> >   TREE01 ------- 
> >   TREE01 no success message, 0 successful version messages
> >   WARNING: Assertion failure in /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03/TREE01/console.log TREE01
> >   WARNING: Summary: Call Traces: 1
> >   Completed in 10 vs. 60
> >   TREE01.2 ------- 
> >   TREE01.2 no success message, 0 successful version messages
> >   WARNING: Assertion failure in /home/htejun/os/linux-next/tools/testing/selftests/rcutorture/res/2024.08.21-06.31.03/TREE01.2/console.log TREE01.2
> >   WARNING: Summary: Call Traces: 1
> >   Completed in 10 vs. 60
> >   2 runs with build errors.
> >   2 runs with runtime errors.
> >    --- Done at Wed Aug 21 06:31:42 AM HST 2024 (39 seconds) exitcode 3
> > 
> > --
> > tejun

