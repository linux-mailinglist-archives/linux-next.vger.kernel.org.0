Return-Path: <linux-next+bounces-4108-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC6A99040B
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 15:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B538282006
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 13:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96E5212EFF;
	Fri,  4 Oct 2024 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNyAjT7E"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268F1D6DB1;
	Fri,  4 Oct 2024 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048121; cv=none; b=Lg4f9oOVDjSX99vlkIJhd9reR2jjw9qh8LPEsb7zwtA6rPYTN5Ri+OG7cN5UUnmPnZMlz7BK6mahGLyWCn+E0p5h3hygq58Gmr+CmQrcThm5WI/Xs5+h+7tyQj8N+UQq6zMhAAXBcrHBm8gN3YxC+HTschbHdokcXPPKMfJBmac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048121; c=relaxed/simple;
	bh=qCy53I1M0/DdB8Aj+1450EATivvLI4YRoldZLx1+CCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rqql26AhRBUjMaos3m6eSriVBnpjvKkgDuXUROwKz5XNIllNm3ZD9S+21mqeStakyvwwWQnn2zkezFqwcS7sqIPDjYdN/ONwHC5YiPYfjsS/urOmNVg72qCKI6lXK+rJ3bbKd2rtG66hjY4c6SvUc+pbGMzyjD5xYSG02BXExMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNyAjT7E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFCFC4CEC6;
	Fri,  4 Oct 2024 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728048121;
	bh=qCy53I1M0/DdB8Aj+1450EATivvLI4YRoldZLx1+CCc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hNyAjT7ETMEtcZPTEGZI1/bDt4dJerpHB+/iUejbfLIyt30A0Vi1Ab4pj7x6NKQyh
	 730pjlIlVIesn8xYZPcsznvAFuFwh2eyKcRzBYoay52U1fKzWBeAEhDQsR5HKQEd19
	 4bYPUVBhW7WZJ/Hkbj0RRej1JFga5yAZ+abWkY66x8+82QX+phLyvgC1at+FsTNbRT
	 eXp7HhUt7cl1lPYCcoYAR3knDeuW04fUenCzXrCJ3PynHt6h5MSm/uVbD6mnpeE8VZ
	 BYUSNaHZt730N1nVmq7F0qi2X7FfLA9CKrzzedUN+CXCFoRbsv7ZrLYv9dYoO3AJZ4
	 HmbNPJOKAZw7w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B1726CE0E09; Fri,  4 Oct 2024 06:22:00 -0700 (PDT)
Date: Fri, 4 Oct 2024 06:22:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <6d23bd45-91c8-4a66-95e2-98a6da1b906e@paulmck-laptop>
Reply-To: paulmck@kernel.org
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

And here is the ftrace dump from one of the failures in the past
18-hour run.  Idiot here re-enabled RCU CPU stall warnings after doing
ftrace_dump(), forgetting the asynchronous nature of new-age printk(),
so I don't have the CPU number that the failure happened on.

Of to test your new patch...

							Thanx, Paul

