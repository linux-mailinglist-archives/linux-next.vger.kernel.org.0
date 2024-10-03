Return-Path: <linux-next+bounces-4081-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B186198EC43
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 11:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C8F281FA7
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 09:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E65145FE4;
	Thu,  3 Oct 2024 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tbk0Y9Db"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E38126C04;
	Thu,  3 Oct 2024 09:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727947637; cv=none; b=G+w0NgHSNqFWKckD1KS2cGUay91CRUnipSgcM3KW6Aes1/KAWvEmIw6HPaRtjK9pCGeMCApGmANhU001sBx6tJEGGt4G6sn0xj6EGZmRKudRcs+ZFQ0LRzEnpZKyvEpKvb88xip5G4yh6p9Qa+CjwTmyH/GRD0PakgS87LadZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727947637; c=relaxed/simple;
	bh=v2DLEkaQU1mAYgqzcVPj46Crex+ZbOb09Ug0wOH9ZzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN26hKQBMo7NALXqVgKJ56E9CS73648oRWimWKIbqslWOLTiP5bGGPV+d1SrQADC6YfnavyAvnMKUBtoEAvXuSNyp/y2uZC0zZDGu33GeRQdvWG1+gwtzvSVGvaFQjC8JATW3VEfI5JgfOqp0FSKKkk59YrvKLBsizsRi1i0PCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tbk0Y9Db; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IF8zwr/DjoAOJ3c4WgGGLwsmUP9CVcST1MKLE/ddVlI=; b=Tbk0Y9DbA9OqFUEGo4ATCUDoeu
	kwWh3MBXI74JobZCclQxHjMMU+s9o7oa0vZl91mB9LjRgGP8L8JEyqHK96ybLGh84glI+YW64dHpy
	hlBZ4QBXvKGthe2Emld96dG9Zg3jD0bMO4zCJHRvKfwfrcG8nrPaLGcVHpbIG5dVI+S6nIgQOvklo
	IMkUO5inKlKAFN8Sy9OkGbSGfOcunhwnYYIFZFZTs/gGzrYM8PYXXZi58hRBPK0aZqmgrdiNA3Kc3
	TrlI+p6GJHPK1CHRST2I/5HX6hSFihox8gyD3bMFo1qBp2yvoakOVz7EsWlXjV1ZlbgQeLBHaLiUX
	xBwj3U0g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1swI72-00000003fC6-2DFn;
	Thu, 03 Oct 2024 09:27:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C227F30083E; Thu,  3 Oct 2024 11:27:07 +0200 (CEST)
Date: Thu, 3 Oct 2024 11:27:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20241003092707.GD33184@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003084743.GC33184@noisy.programming.kicks-ass.net>

On Thu, Oct 03, 2024 at 10:47:43AM +0200, Peter Zijlstra wrote:
> On Thu, Oct 03, 2024 at 10:40:39AM +0200, Peter Zijlstra wrote:
> > On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:
> > 
> > > My reproducer on the two-socket 40-core 80-HW-thread systems is:
> > > 
> > > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "50*TREE03" --trust-make
> > > 
> > 
> > This gets me a very long stream of:
> > 
> > Results directory: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33
> > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 50*TREE03 --trust-make
> > TREE03 -------
> > QEMU error, output:
> > cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03/qemu-output: No such file or directory
> > TREE03.10 -------
> > QEMU error, output:
> > cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03.10/qemu-output: No such file or directory
> > ...
> > 
> > 
> > Did I not do it right?
> 
> Urgh, for some reason my machine doesn't auto load kvm_intel.ko and then
> proceeds to not do anything useful.. Let me try again.

Works a ton better now, obviously no splat yet :/

