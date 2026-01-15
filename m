Return-Path: <linux-next+bounces-9663-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19910D21D0B
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 01:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6130C300CEDC
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 00:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FF8C8E6;
	Thu, 15 Jan 2026 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCDYTRdN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E6C3D76;
	Thu, 15 Jan 2026 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436206; cv=none; b=LqNeIsPTCYzPTww10yRRJUiyLUKHlSuVbKNzMbGW+uCtE6w1db+eB1/y2w+4L8rnpIz9TJVs15VLCcIRHcsWOIKhOnI2o4pSxC/9zFWX5wKtQkf4gic+TjBeDICBhSXSr6K1juru3UUtiHihtoyg7dqGp70Fds/1rY2N6s/ZZmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436206; c=relaxed/simple;
	bh=RffiwAtOY32T1nDXMi8J9zBQHviBvXo5QpeQW7mm2K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJgS2HpAj65wtAc+IKJyoaEK7BZUrBl/0sp8GNvmpPMj11wDEJ7qrKm1/vdm4RP4HqN9F+uAkUfHe6bTf/BgRamhhQbQ0M4IdNrysfPFZfz94TIzupgIJDKewsDvmqLLTgdeuYmeNQ0rUkGagj+Chg1x1KZqBVHUiqjAaRw4Syc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCDYTRdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ABEC4CEF7;
	Thu, 15 Jan 2026 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768436206;
	bh=RffiwAtOY32T1nDXMi8J9zBQHviBvXo5QpeQW7mm2K4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=LCDYTRdNYUjAsmKMgtMn3m1TFXvMBtLS24zxyoKdUpTH8Ztpo0efaq728SP2iyyN1
	 EN6AMSxQzh76vjTzdXWGoynlE8/TUCHEAOQNDRCkEMYhUc0azGrnyeN4MYeLOGSY+D
	 /Wd24rByOn59NEcWARaHC/xtYQ5OYOqH7ubhJ42dazoDERfDPXzhbPYCUNmHX7CIq/
	 mg9l3F0NEpqoIBZusCmGd16GjHWk0DG1ZD7j3tqil+SgS21FufbNoHXYERSpStNLgT
	 uGBGYRkR5h9TkaaF/jVoyrHIrmzmaBtW0lA/ZNnU/i9XZK4w1/LyRQWNVdZlQr8Gh+
	 //Mv/H66wssTg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8C8EACE0864; Wed, 14 Jan 2026 16:16:45 -0800 (PST)
Date: Wed, 14 Jan 2026 16:16:45 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>, kernel-team@meta.com
Subject: Re: Shutdown-time hangs in -next in locktorture
Message-ID: <8f3c3045-f393-44b3-83b0-a0e1d5d20633@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <7f63c3aa-5cf7-47a6-bdd9-d16d9ea65c63@paulmck-laptop>
 <20251220125201.GZ3911114@noisy.programming.kicks-ass.net>
 <288a2295-fc1b-4a32-a3cf-990edc967655@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <288a2295-fc1b-4a32-a3cf-990edc967655@paulmck-laptop>

On Sat, Dec 20, 2025 at 08:49:01AM -0800, Paul E. McKenney wrote:
> On Sat, Dec 20, 2025 at 01:52:01PM +0100, Peter Zijlstra wrote:
> > On Fri, Dec 19, 2025 at 04:29:26PM -0800, Paul E. McKenney wrote:
> > > Hello, Peter,
> > > 
> > > I started hitting shutdown-time hangs in next-20251217 which persist
> > > in next-20251219.  This hang happens on both x86 and arm64.  Once I
> > > figured out that the failure is high probability, but not deterministic,
> > > bisection converged here:
> > > 
> > > 5d1f0b2f278e ("sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()")
> > 
> > That commit no longer exists in tip/sched/core; it was fixed a few days
> > ago, except other problems made -next use an old tip branch which has
> > caused this fix to have delayed visibility :-(
> 
> Very good, I will retry later.

A bit later than I was planning, but here we are on next-20260113.  This
has a very similar failure on arm64 with that same repeat-by as before:

tools/testing/selftests/rcutorture/bin/torture.sh --duration 20 --do-none --do-normal --do-locktorture --do-kasan --configs-locktorture "LOCK09"

Bisection converges here:

704069649b5b ("sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()")

This commit does not revert cleanly, but retesting on both this commit
and the previous commit confirms the bisection result.

I have not yet checked this carefully on x86.

Or is this another case of stale commits in -next?  If not, please let
me know if there are debug options/patches that would be helpful.



							Thanx, Paul

