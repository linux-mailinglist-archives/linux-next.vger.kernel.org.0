Return-Path: <linux-next+bounces-4077-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416C98EBDE
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 10:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461681C21BDA
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 08:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5CE13AA41;
	Thu,  3 Oct 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BmWsw31/"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051C482ED;
	Thu,  3 Oct 2024 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727945275; cv=none; b=QO7dRB1TviA3hvISt24dBneEef0M5QmbK1HyWPdxlLni5EhpvEsY9IUdKM47HS4R4KXjtmY+rkhTLp0i53yolszD5Sca1EueHgN2Und4SzWQvx+CeN3qZsYQlRrR25nWnMnNT9WfPMzWG7CRre6cfqeGRQ3pkBxgC6Vp6/U98CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727945275; c=relaxed/simple;
	bh=NFiEVfncwlZrl8/o+O8TpVCGpp2sMmTX/y+pFR+apCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYKX28rG779RDmV8Jpzo4z6SNbUZ2FtGB5T4tmi91oZqfq4WBftoxLf5OVhh6MujeNlq/sy0BBAyqCQ5UrJBcERl+ukoS4xMztAdl8ZFDXP9swNfe45/k7ynT5mybHkX6U6aTcr5cwx/RbiGkLlhXZsNwn1a1kXwFEKRoQP/BPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BmWsw31/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JxpVfVshi8ln9iQvUep2RQ1oDNl0ObuPgd4eUfVRQMQ=; b=BmWsw31/+Rgv9gXtydqbMXfbuJ
	FbwlNY+kkOAz5yyZ2IroIwABeQsOebExpuUTNIokUQVOY/Odx8nOxZXbHhmnn17c6n9ggUWBKG6KZ
	/KoysLnY0FhQE5j0goWfANoZTyBaAHuDzAtaXKw8R1xRsq0lQcG7qFdtDC3cHntXlradoDJK0zbS5
	FMjTwuU5f5S2Do368Y3M36UoFmA7dAJM2woBSO+8AmSs2gv2VNO4vOOoWAq9ahD1sQvVctB5gLcsP
	D/XjDh4YJgZLQN68ZoqerwfGnyV8o2YhaDafLoF87ppcN4xeyT7zapHc8xA4v6rYYgo3yZRjeb9gw
	CBnQYMBA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1swHUu-00000003ewe-1gyM;
	Thu, 03 Oct 2024 08:47:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6B93E30083E; Thu,  3 Oct 2024 10:47:43 +0200 (CEST)
Date: Thu, 3 Oct 2024 10:47:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20241003084743.GC33184@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003084039.GS5594@noisy.programming.kicks-ass.net>

On Thu, Oct 03, 2024 at 10:40:39AM +0200, Peter Zijlstra wrote:
> On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:
> 
> > My reproducer on the two-socket 40-core 80-HW-thread systems is:
> > 
> > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "50*TREE03" --trust-make
> > 
> 
> This gets me a very long stream of:
> 
> Results directory: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 50*TREE03 --trust-make
> TREE03 -------
> QEMU error, output:
> cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03/qemu-output: No such file or directory
> TREE03.10 -------
> QEMU error, output:
> cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03.10/qemu-output: No such file or directory
> ...
> 
> 
> Did I not do it right?

Urgh, for some reason my machine doesn't auto load kvm_intel.ko and then
proceeds to not do anything useful.. Let me try again.

