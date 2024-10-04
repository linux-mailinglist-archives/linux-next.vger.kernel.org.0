Return-Path: <linux-next+bounces-4110-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C6990488
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 15:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC67E1F223E4
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 13:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F88210183;
	Fri,  4 Oct 2024 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YDkCdg7/"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4A15747D;
	Fri,  4 Oct 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048942; cv=none; b=th1St6PaFsimcUU+QdxyubqFLcAoXhufL3mj+DT5S9Ws03f6QRMuNPnhqbiVumLECC4eQb74Gz5N8W2qQmbC1iQFZOSLgT5ZM+lzMLQ//55OqmAcDMTjOAQR1SrEhlDPJkM34QsQ+u3IMHZtjtidZLAIkBoNJU1WDPmVft2CbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048942; c=relaxed/simple;
	bh=Xw3Rk5rZwFBtFSjj2qL9MNa9T6SNgUCIeWAdcMO92y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlazr93nvl4gOKolf1Hn/NNB3BHuBuMo1ZY+4E7BeNDHDll9tWvL2raKRkuirXx3o+O8gabYXjU9/0EYVrOM2AVYaDw0zw1dDfOQckhfzT+DL1vvWzZvybR9p2toR3Th1pMA917Czv6KDEQNad/2wIDRGHU1U5gU+3+pWpj26mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YDkCdg7/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qowZPimobsknCTSPeZx61BV1Jj+jnSrfDL8WG2TTTYE=; b=YDkCdg7/f0SQNMRgFOtmQ7sdRd
	SX0vVOTXP5dQnm7Ir1BUjaoVsN/eiuOYJ4X4FTOK2U9DiHoq99vSIsQySt6Uyr5Xrdzz+ApqG25kA
	avywyKZ8Lhotb1C5mQhMwRttaRn1imHKn+Q8x147YEtmQamdNW8rKgMWUaL2COc4UwAgZeACxRWzq
	WDRhUD4O6BDY2WZVrz4yst7u2v2Pb/Rq11tdb0/NoOSuAZ7kr5oXpAMwZ3/xXfZXZN5ObmpJ1uu13
	uaf9W94PK1FXlJTHusJIaA+4vlDmnuBMQQvwQsnVPATKvi5IHHcLIYy/3dZ4CUra4CVYAwsRu/WsU
	y+Nui4gA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1swiT0-00000003qF0-03z8;
	Fri, 04 Oct 2024 13:35:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D23C630083E; Fri,  4 Oct 2024 15:35:32 +0200 (CEST)
Date: Fri, 4 Oct 2024 15:35:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20241004133532.GH33184@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
 <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
 <20241003142240.GU5594@noisy.programming.kicks-ass.net>
 <7b14822a-ee98-4e46-9828-1e41b1ce76f3@paulmck-laptop>
 <20241003185037.GA5594@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003185037.GA5594@noisy.programming.kicks-ass.net>

On Thu, Oct 03, 2024 at 08:50:37PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 03, 2024 at 09:04:30AM -0700, Paul E. McKenney wrote:
> > On Thu, Oct 03, 2024 at 04:22:40PM +0200, Peter Zijlstra wrote:
> > > On Thu, Oct 03, 2024 at 05:45:47AM -0700, Paul E. McKenney wrote:
> > > 
> > > > I ran 100*TREE03 for 18 hours each, and got 23 instances of *something*
> > > > happening (and I need to suppress stalls on the repeat).  One of the
> > > > earlier bugs happened early, but sadly not this one.
> > > 
> > > Damn, I don't have the amount of CPU hours available you mention in your
> > > later email. I'll just go up the rounds to 20 minutes and see if
> > > something wants to go bang before I have to shut down the noise
> > > pollution for the day...
> > 
> > Indeed, this was one reason I was soliciting debug patches.  ;-)
> 
> Sooo... I was contemplating if something like the below might perhaps
> help some. It's a bit of a mess (I'll try and clean up if/when it
> actually proves to work), but it compiles and survives a hand full of 1m
> runs.
> 
> I'll try and give it more runs tomorrow when I can power up the big
> machines again -- unless you've already told me it's crap by then :-)

I've given it 200*20m and the worst I got was one dl-server double
enqueue. I'll go stare at that I suppose.

