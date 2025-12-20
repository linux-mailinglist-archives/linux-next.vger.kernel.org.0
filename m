Return-Path: <linux-next+bounces-9498-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE0BCD33EA
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 17:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E008E300B296
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 16:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D96B287510;
	Sat, 20 Dec 2025 16:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfkyNpku"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377F27F01E;
	Sat, 20 Dec 2025 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249342; cv=none; b=DyNInCOFHAhOMi5sHo7x1vwRJPWi/djKuSLlMCyg95zykHH4rStEIA7nGxWtbs1T5KkaOH5fLmwOE/amTwp1R8FdMuRZgazi2iFFTbKkBzYRRMpxyrjND1l7ysT4FjSNau1n+6fKhAbvnE859FxMYI+GuO1wmeHlZsPRZ1tA+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249342; c=relaxed/simple;
	bh=Vkh2biBnfryyvd21L8JDgWVmk//XqnKn/d8rVR44xFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5CiSFzKXxE7Bgwp/Le67H/k30QMBp1SkBL78cqMlmyXEBZhgMwSQ4g3Qyv1PNREtRg3tChV2eU06kdHFVlui04XkzjX0wSdn1kuDn9PEdVK8bUpDE8mYc5kS2IeeXWRGwEMkr5eWCxQag5vuAhLuqKWm3QQXIumw85AtPtxmOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfkyNpku; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C7CC4CEF5;
	Sat, 20 Dec 2025 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766249341;
	bh=Vkh2biBnfryyvd21L8JDgWVmk//XqnKn/d8rVR44xFA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hfkyNpkuEW5pdBwFIJ4cVpQKDzsL7/j4vBBQE+nFxtFgfBn0JcbYSeVMgrNKAIHCi
	 RrN1CWym/cNJYE7xelHkCwHNlA6a/gKZfW0IKsbmt90doC2pDm+ywKO4CC8nt0c5sl
	 LoPnfQzdRxbod6P51v0tKHpo0+0+OmteYC53EaM5YSllHC/HwoJT+MmyUUc7g/WSQi
	 KHJZgZIxWWyIjKxC73irBmalofwH5A/sUZai2Fw1Ehv2zqZcvXLqqfB7MafbwruuOe
	 ZpgGB+3X9EqQ3R74gyEb5seMFX5917HwH+KC5NnqGNJ2OL2NXTfhlZeoDMCJbdsbhN
	 PDFGTqhzl5INg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4539ECE0E5A; Sat, 20 Dec 2025 08:49:01 -0800 (PST)
Date: Sat, 20 Dec 2025 08:49:01 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>, kernel-team@meta.com
Subject: Re: Shutdown-time hangs in -next in locktorture
Message-ID: <288a2295-fc1b-4a32-a3cf-990edc967655@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <7f63c3aa-5cf7-47a6-bdd9-d16d9ea65c63@paulmck-laptop>
 <20251220125201.GZ3911114@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220125201.GZ3911114@noisy.programming.kicks-ass.net>

On Sat, Dec 20, 2025 at 01:52:01PM +0100, Peter Zijlstra wrote:
> On Fri, Dec 19, 2025 at 04:29:26PM -0800, Paul E. McKenney wrote:
> > Hello, Peter,
> > 
> > I started hitting shutdown-time hangs in next-20251217 which persist
> > in next-20251219.  This hang happens on both x86 and arm64.  Once I
> > figured out that the failure is high probability, but not deterministic,
> > bisection converged here:
> > 
> > 5d1f0b2f278e ("sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()")
> 
> That commit no longer exists in tip/sched/core; it was fixed a few days
> ago, except other problems made -next use an old tip branch which has
> caused this fix to have delayed visibility :-(

Very good, I will retry later.

							Thanx, Paul

