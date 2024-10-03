Return-Path: <linux-next+bounces-4083-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE4898EF3F
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 14:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0761E1C2130D
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 12:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92561174EFC;
	Thu,  3 Oct 2024 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gg2cGlTI"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A82B186E46;
	Thu,  3 Oct 2024 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727958514; cv=none; b=PV52RJwuts+BKckXLWkbdiRCgbwlePvU08uYyMt0ydD7fQBPm8hHbxwWx2yrUUEe2gIjaedwQF88kWIsq9vS7+eX502Zca2pOi8XgOoU4Q+ap75YkzV8KB6NQxs9ZQLnjApIMdhZqaNYzKS1eHKUaYJttmyYYy6h/POGQKoo37Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727958514; c=relaxed/simple;
	bh=Kka13b1TBZEGGAuR46hD1krcbj/uk0HaAWGSWJSrlV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLnGpYBvM4ngYawyrYNmn25WudMzU3SIAYE7Uhl8QrQm2YKoNv5AwtmCn+HZpDJUmk5HIzGMEvbvSygTtroo2xdxjcnhAMTH+S2DCe5ksupy2CycpTOI8F+TGWbN/C21NAU7q3s435qL1ljGX+7lCsCwj4/K4YevVrC4328PquM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gg2cGlTI; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VFi90tnFsvUzuKRL4YbTmEuANTxGVJLZQ58xDuCrlMw=; b=gg2cGlTIlQ6nDt4NW5gON1V5MT
	5wSBzkB/zyWx+RICKTC7iVK9mKmZf338HFpONbmYukYHthIxVyaUyIhfw76NY11SrjzGVuwn1IbXv
	AT2O+xyz5pmnADkzeQ8fDJvirZp0qGuET6iT2TqN0xVIWGFGFokuhkM4cOy6tY+4fGbys5WyivYwi
	h5Tfx3LMYVW8E+OagV5ytNYKaE0q1pCVs829lFi7negeexlRHTdqGP5Mly3TWFpaD0H9ZpNloe/PB
	z/KsxdnhVXjuurVwbXusURPZftY18pcjsctIIoOVl5zI9ngtkpLMSPUuOdGS+eGVJVHsUFkowawqB
	DrFXynTQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1swKwT-00000003gcP-156n;
	Thu, 03 Oct 2024 12:28:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E3F7730083E; Thu,  3 Oct 2024 14:28:24 +0200 (CEST)
Date: Thu, 3 Oct 2024 14:28:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20241003122824.GE33184@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003092707.GD33184@noisy.programming.kicks-ass.net>

On Thu, Oct 03, 2024 at 11:27:07AM +0200, Peter Zijlstra wrote:
> On Thu, Oct 03, 2024 at 10:47:43AM +0200, Peter Zijlstra wrote:
> > On Thu, Oct 03, 2024 at 10:40:39AM +0200, Peter Zijlstra wrote:
> > > On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:
> > > 
> > > > My reproducer on the two-socket 40-core 80-HW-thread systems is:
> > > > 
> > > > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "50*TREE03" --trust-make
> > > > 
> > > 
> > > This gets me a very long stream of:
> > > 
> > > Results directory: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33
> > > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 50*TREE03 --trust-make
> > > TREE03 -------
> > > QEMU error, output:
> > > cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03/qemu-output: No such file or directory
> > > TREE03.10 -------
> > > QEMU error, output:
> > > cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03.10/qemu-output: No such file or directory
> > > ...
> > > 
> > > 
> > > Did I not do it right?
> > 
> > Urgh, for some reason my machine doesn't auto load kvm_intel.ko and then
> > proceeds to not do anything useful.. Let me try again.
> 
> Works a ton better now, obviously no splat yet :/

I have by now ran many hundreds of 1m TREE03 instances, and not yet seen
anything. Surely I'm doing it wrong?

