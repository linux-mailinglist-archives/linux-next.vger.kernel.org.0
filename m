Return-Path: <linux-next+bounces-4119-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D88BA992839
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 11:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6015283753
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 09:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5FF18E37D;
	Mon,  7 Oct 2024 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VZs6YaKm"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9BA2E40B;
	Mon,  7 Oct 2024 09:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728293661; cv=none; b=Iw60ElapPAt0RSIUXRW2w6hmGZWINrYyDEkGwcxRy/qm/4SeapDCiuH2t3FXANMQ/m2b3W5QuWCXCERN2C8JlIoRfJFSmBiNvSXKX0ZY3oKiJAcODaq4nIvpD83+oturRVPT7e5OMIkMGZ6wctUPzGdOkMr/GJdpJPEzzpp5it8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728293661; c=relaxed/simple;
	bh=GuPfV/vXqb2cHRU/NeF6mb3tHrOWmpj52q13dgEt54I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CltuxuntmHuEnS4YESV+C1Hj3JOvwV/R68h/i5Bvp9iigBRwZYOCAd5UiD4E+CspU5nYOB0x7EfkWWGN1aKhbCMX9tZ1MLQOYPUO0n9xC2STbJKsKh0dQ9iAmPZKY33G/3lSNcrvRa/w7hTv+7JIbeTAvABCjTENsSCs7Rh/zh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VZs6YaKm; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Sfur5fGnyWwqacVG3Sr0Z2vYX9JtTG0oq4cSkSmug0g=; b=VZs6YaKmASQmFSY/FwbBVigTOo
	TV3VoilDlIkEPFobhcC4QKq+Nvk+81p/jOdCsCKIC0yr4lx+iX4POsQbIo1jHPkDJ8cNH5+9lAik8
	PLzWq1OlSfK46rj2yI6XMKTEc+OogaFKmLWWYS1hway4W7FvNk4f/iAUaEkwTI/nTNgf4T3rV2+ym
	lvI6Jf5uXPDABMylE9vaysuvRSlIofoxHelYkAsKMTgG94oWowMg/HRs3tdDVNxwxkDfVYBuldNOF
	2553EQd/1DXjpBdXaGX1uL2QRs9ByqUNOXE7lqm2xNvpieFgymp/13DsVKl7NZW+5Zg7d93GBwTQ+
	WDzakfjA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1sxk85-00000004Oi1-43fs;
	Mon, 07 Oct 2024 09:34:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 15A6C30088D; Mon,  7 Oct 2024 11:34:13 +0200 (CEST)
Date: Mon, 7 Oct 2024 11:34:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20241007093412.GA4879@noisy.programming.kicks-ass.net>
References: <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
 <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
 <20241003142240.GU5594@noisy.programming.kicks-ass.net>
 <7b14822a-ee98-4e46-9828-1e41b1ce76f3@paulmck-laptop>
 <20241003185037.GA5594@noisy.programming.kicks-ass.net>
 <20241004133532.GH33184@noisy.programming.kicks-ass.net>
 <9961cb9c-70f0-405b-b259-575586905ae0@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9961cb9c-70f0-405b-b259-575586905ae0@paulmck-laptop>

On Sun, Oct 06, 2024 at 01:44:53PM -0700, Paul E. McKenney wrote:

> > I've given it 200*20m and the worst I got was one dl-server double
> > enqueue. I'll go stare at that I suppose.
> 
> With your patch, I got 24 failures out of 100 TREE03 runs of 18 hours
> each.  The failures were different, though, mostly involving boost
> failures in which RCU priority boosting didn't actually result in the
> low-priority readers getting boosted.  An ftrace/event-trace dump of
> such a situation is shown below.

Urgh, WTF and more of that. Let me go ponder things.

Thanks for testing.

