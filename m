Return-Path: <linux-next+bounces-9291-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FBDC99AED
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 01:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A08A14E2910
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 00:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854C91DE2C9;
	Tue,  2 Dec 2025 00:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugEU5276"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598B71D618E;
	Tue,  2 Dec 2025 00:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764637075; cv=none; b=LNdxvA42eJpVv8W3PJHpDrDnVhESwskiKJpTUGlmKTazmUnTM/Fv7iAfpnoApA2s9fPAbr4ZErQDjWWsfppmx3fJqxJyh+ZzEkZhA5fN3P1EWwv3x/IzUDi8s5NXohb5dyjQsz57l7Q+0NUjItt1cGmoih1zH+RBT6Q4SpyzmXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764637075; c=relaxed/simple;
	bh=I2SpP+pD2Cp/Da5LNvkdjRCh66mDxSQuefdKNfuklcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaL6s3bsBqbM14Aiz+ie/4kr8mkJTBurPDQgD32d530BO1AJHVz5v3qf45G4j+HNDsVLaRcuZsvII+Rpmj8BVUuj8SodhG2e+duxuynktwZdtioE9iQ6Q6iqOS1fEx8JDiY5Z7FRkibV3FLbGHP9Mb5nTFUjzBf5/qTxIjRnZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugEU5276; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFB0C4CEF1;
	Tue,  2 Dec 2025 00:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764637074;
	bh=I2SpP+pD2Cp/Da5LNvkdjRCh66mDxSQuefdKNfuklcQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ugEU5276LR1rnFkCiLi4WSsMqEO1ETKgqMrL+bo+pSv0h0iU7EYPBeji+1OKNawrU
	 DxiAO6nvdtS128POcLdsA3f2IzcxEEftWypOUBc6knvo9/Nm+HSpO5x6zXop9YT0Wk
	 NrR+mdtTyUuDclDuKy2vje9R0VRfkwSCT9yjRnVkQ+cXvfuyV0cUmZ0jopWPnai2Tb
	 wGjVoY2eQOHXHBqNwAAaIdYRWvN0IAmdcZQc5xPYBWXy32AqlGE6wuxSZcgNZXissT
	 phoCC7tLa1oz9ecXOYEQj5RjOcY4i+vT0bwYFnFw2DRgMtTIo2FMQAxLy1Gp7tIR1V
	 ln+apcpNtX4+A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 64E49CE0F95; Mon,  1 Dec 2025 16:57:54 -0800 (PST)
Date: Mon, 1 Dec 2025 16:57:54 -0800
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
Message-ID: <370911ae-ce3c-4ebd-a348-452c73c06597@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <aRdBVFSmgvPWuY2k@localhost.localdomain>
 <054ceff1-87b7-4729-8589-b7dd22887bc1@paulmck-laptop>
 <aRxu_ycww5U9qxJR@localhost.localdomain>
 <f79a2e18-d9c3-40db-97ed-c334b90cf3ba@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f79a2e18-d9c3-40db-97ed-c334b90cf3ba@paulmck-laptop>

On Tue, Nov 18, 2025 at 07:04:07AM -0800, Paul E. McKenney wrote:
> On Tue, Nov 18, 2025 at 02:05:03PM +0100, Frederic Weisbecker wrote:
> > Le Fri, Nov 14, 2025 at 09:06:29AM -0800, Paul E. McKenney a écrit :

[ . . . ]

> > > Thank you, Frederic, and I guess putting this in -next did indeed find
> > > some problems, so that is good?  ;-)
> > 
> > Indeed, mission accomplished ;-)
> > 
> > Steve proposed here to actually restore the patch:
> > 
> >     https://lore.kernel.org/lkml/20251114110136.3d36deca@gandalf.local.home/
> > 
> > But later said the reverse:
> > 
> >     https://lore.kernel.org/lkml/20251114121141.5e40428d@gandalf.local.home/
> > 
> > So for now I'm still keeping it outside -next. I hope it is not a necessary
> > change in your srcu series?
> 
> My thought is to put the patch with Steven's suggested removal on my
> -rcu stack and see what kernel test robot thinks of it.  ;-)

Unless I hear otherwise, I will push this into -next after the RCU
patches land.  If all goes well, I will send the pull request to Linus.
So please let me know if you would prefer some other course of action.

							Thanx, Paul

