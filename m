Return-Path: <linux-next+bounces-9369-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89ACAB9C5
	for <lists+linux-next@lfdr.de>; Sun, 07 Dec 2025 21:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6371301463D
	for <lists+linux-next@lfdr.de>; Sun,  7 Dec 2025 20:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEC42C17A1;
	Sun,  7 Dec 2025 20:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpWaOSU8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AEA1B0F23;
	Sun,  7 Dec 2025 20:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765140215; cv=none; b=R0gswCh6GHGRGUHcbHnX/U0IjGFmKfMzAY3iOmrdEslPHM7Nw3QGchVvIeIBHs9nmNCM7BMdYZ5CTAQshjeTL9W4Fmk3kzL6vwlelr1cwOXtviJ4ps+qRM0Hqz9VRIJzRdnl0ZVoWtDuf+qT4jbE00AuetgmTCCYj3m/J4Sge+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765140215; c=relaxed/simple;
	bh=CvPBUv9C3Xu+KLMZEv4kHMblvCy1wzeAXiAhnsTJ+kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDbaw+XADxkCuB9mgP7TCfNpUGO5dyzWCoTJnCN3OjRFc6CK2zSv2TLIZGGndDca3gY4xzX70iENMwM4P3zeQOzIvIT7UmxiPBXY1+U8HIl3v+PkisnjvdTeUJfuykyf3QPOQ4hnbBaA7ewt2YoyDucNFV7A6qVy7BhTz31h0C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpWaOSU8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D8FC116B1;
	Sun,  7 Dec 2025 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765140215;
	bh=CvPBUv9C3Xu+KLMZEv4kHMblvCy1wzeAXiAhnsTJ+kE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=gpWaOSU8ceg7Du0//QwXT0qW3WRuHUTdvjS9AOBU/w9UTrr3eCyxLFgzVzsLFfKPu
	 70XfpxBByUS2T/yhMeO75z5nWP/sNOEyO22uzNZIyMXSKMa6C8ruSxLev55Z2dXg27
	 HTXialpmGjQVhba9vy2FoH4iy+VI0E5kbZj4vCui8hyFKafvSng1oBCTy0Xad//4gj
	 TR6zIPmVHhuJFvrErO1XM9iCZH5rlDO4uw7yMK8oWehXrRg+WIsRpfdC1Lp7eovbtR
	 gJZXTHK+zgoovP4haWxMHsI7brpbzJcK5lnovF7l4Cb12cn8dyadUrEW8A19YO9ASy
	 mtTj+Y3DeF77g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BF996CE0CB8; Sun,  7 Dec 2025 12:43:32 -0800 (PST)
Date: Sun, 7 Dec 2025 12:43:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <8e93322e-9e0d-4414-b9ce-7c098477dbe8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <aRdBVFSmgvPWuY2k@localhost.localdomain>
 <054ceff1-87b7-4729-8589-b7dd22887bc1@paulmck-laptop>
 <aRxu_ycww5U9qxJR@localhost.localdomain>
 <f79a2e18-d9c3-40db-97ed-c334b90cf3ba@paulmck-laptop>
 <370911ae-ce3c-4ebd-a348-452c73c06597@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <370911ae-ce3c-4ebd-a348-452c73c06597@paulmck-laptop>

On Mon, Dec 01, 2025 at 04:57:54PM -0800, Paul E. McKenney wrote:
> On Tue, Nov 18, 2025 at 07:04:07AM -0800, Paul E. McKenney wrote:
> > On Tue, Nov 18, 2025 at 02:05:03PM +0100, Frederic Weisbecker wrote:

[ . . . ]

> > > So for now I'm still keeping it outside -next. I hope it is not a necessary
> > > change in your srcu series?
> > 
> > My thought is to put the patch with Steven's suggested removal on my
> > -rcu stack and see what kernel test robot thinks of it.  ;-)
> 
> Unless I hear otherwise, I will push this into -next after the RCU
> patches land.  If all goes well, I will send the pull request to Linus.
> So please let me know if you would prefer some other course of action.

If I continue to hear no objections in the next 20 hours or so, I will
push this into -next:

fca6fa23c5a5 ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")

							Thanx, Paul

