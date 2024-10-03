Return-Path: <linux-next+bounces-4086-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF1898EF99
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 14:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F1D3B2512A
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 12:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FD2148823;
	Thu,  3 Oct 2024 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ofk2FqlL"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8FE1E511;
	Thu,  3 Oct 2024 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727959548; cv=none; b=Dgp9uDT++kfeZCy/Mv1BpgCHpwKOxrAkommFmqyDaVSlRC3xtOSHeWPp7r/Zpfx6z97I5UEWR3zRwgrr3iPKAvCUEGuktneMqBE2QhjFJtX8DF7caGNOrm3EEDgn3I7spnZ7mV9DnpY0tzcJuRfZFfxqGhPY1ArV1+Qj7OGK3NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727959548; c=relaxed/simple;
	bh=GJIo6+hC/7Ec8/Uv2y6IFRYFGp8Tdb4FIA8AD5c01vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3b05Kc9y/J+VTQa2acXFjMJ47cy8W06j+ufgMq1VgKZQoIPcOZ6tlLVgWVEqk5gp7ZnM/hbilc5IU25fR6jg7g+9ff8egDGiKbr+Nw4JmQJrqm3dQkrTLCQLIskQRmIPWKL3KaW/mlZJIDvGmovR8P484VQvzaCTv1x6Fp5I2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ofk2FqlL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78877C4CECF;
	Thu,  3 Oct 2024 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727959547;
	bh=GJIo6+hC/7Ec8/Uv2y6IFRYFGp8Tdb4FIA8AD5c01vs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Ofk2FqlLzVmzdi2z/6wI0YC0StqWbaah+X5lt4ndjsswRg/8KuZ2ATiOjVoPE5gnw
	 DKDyfq4vvzhwZ9eFwDQV/xHmyJ7xJXxppSSk1pU6a4ZaHIEKDRBeX85amf+8IbjJnR
	 aduknodTIIwS7dMq72js+UbRj8GxoCZUrqOc/OcuAdU331n3+nrYQiHVJJ5ZBksaq+
	 aUvUf4JVy30GjhvEhly3Srewy0QV7cjq1+fhtXAzX+llvUfYpMqzdwnh226ajt0GIu
	 fTRKfSbo81YE0ZFd7LGoiTtjpAQU1gs8AhBU/4jx+cOOd6VKBxPIcT10kgDyKmcS9V
	 hfXNy3bRDDhTA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2DFACCE0A48; Thu,  3 Oct 2024 05:45:47 -0700 (PDT)
Date: Thu, 3 Oct 2024 05:45:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003122824.GE33184@noisy.programming.kicks-ass.net>

On Thu, Oct 03, 2024 at 02:28:24PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 03, 2024 at 11:27:07AM +0200, Peter Zijlstra wrote:
> > On Thu, Oct 03, 2024 at 10:47:43AM +0200, Peter Zijlstra wrote:
> > > On Thu, Oct 03, 2024 at 10:40:39AM +0200, Peter Zijlstra wrote:
> > > > On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:
> > > > 
> > > > > My reproducer on the two-socket 40-core 80-HW-thread systems is:
> > > > > 
> > > > > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "50*TREE03" --trust-make
> > > > > 
> > > > 
> > > > This gets me a very long stream of:
> > > > 
> > > > Results directory: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33
> > > > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 50*TREE03 --trust-make
> > > > TREE03 -------
> > > > QEMU error, output:
> > > > cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03/qemu-output: No such file or directory
> > > > TREE03.10 -------
> > > > QEMU error, output:
> > > > cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03.10/qemu-output: No such file or directory
> > > > ...
> > > > 
> > > > 
> > > > Did I not do it right?
> > > 
> > > Urgh, for some reason my machine doesn't auto load kvm_intel.ko and then
> > > proceeds to not do anything useful.. Let me try again.
> > 
> > Works a ton better now, obviously no splat yet :/
> 
> I have by now ran many hundreds of 1m TREE03 instances, and not yet seen
> anything. Surely I'm doing it wrong?

I ran 100*TREE03 for 18 hours each, and got 23 instances of *something*
happening (and I need to suppress stalls on the repeat).  One of the
earlier bugs happened early, but sadly not this one.

							Thanx, Paul

