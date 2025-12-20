Return-Path: <linux-next+bounces-9496-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B188CD27B1
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 06:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA8DB3011A4E
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 05:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42134221FDA;
	Sat, 20 Dec 2025 05:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwyr+ckJ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B721B808;
	Sat, 20 Dec 2025 05:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766206901; cv=none; b=tXVjwVRPFqf/GX4wXfWa2HoSioQMBHHNZuAwUbhmFWa22nuNRLEPEr2M3xKXKb50gyE89ivTId8EkPRMfg3t1aql1zeDc7mpnLw+0cUHAUgo4BlbdPKMeQeY1gbKHraauk/PzMWODB9tl7HWs2+EjJxeqUQe+35eDgHM5auF1PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766206901; c=relaxed/simple;
	bh=+Xrte/v2R0SpuObGzvdmbdLJVCRyNQ514mzfTE/hCnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEQJ+1Bh26ii5n3Dz6kVnqPubo9B9U9jpSfF4BNSw3CgyAiyTQwku550bLfZhtCMjg2Z7J07UFq3//fPxStO2w0xtcF6SCauvsbX/LBiwLvy+VPCaVJtmdlepJaFVhFxgJReGJBlNG8AgjfSE+Tx9wGZagCWT6CEx8MSk1BB5A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwyr+ckJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A532C4CEF5;
	Sat, 20 Dec 2025 05:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766206900;
	bh=+Xrte/v2R0SpuObGzvdmbdLJVCRyNQ514mzfTE/hCnw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=fwyr+ckJ7qaGSxlMgN4LsJrwHxbf6uTHGPa3cUZp3VsBWMExDRGhmVgv+HCnPlwfT
	 l/cbl5hMhd529P25ABUATNrLTZQ4ighZI7p4B06PoBwW/QuMqIsLJnFSgVjivF6yyV
	 PZZOaMH0uEQKB33htmhs6PU3ZIaQbgD2bBoQD17l9Vs6RTAm21rvtJVg7yK9CS9efY
	 dClkZ5UpB8TLqTOUaiE6cv9ce8rl8F1muYLKEy4Y27V4ulAnb15gFV23zlILeXBdpD
	 vA9DHeSRM+1ByYgI8MuwkuxgWPk//MXpk7/o4YLku0z7Hs9smQthzgRrKyUUBuDt+l
	 HyZD6gyi5mReg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 00F81CE0DE7; Fri, 19 Dec 2025 21:01:39 -0800 (PST)
Date: Fri, 19 Dec 2025 21:01:39 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>, kernel-team@meta.com
Subject: Re: Shutdown-time hangs in -next in locktorture
Message-ID: <3e8e9510-3d05-4a31-a4de-30c97f70826d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <7f63c3aa-5cf7-47a6-bdd9-d16d9ea65c63@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f63c3aa-5cf7-47a6-bdd9-d16d9ea65c63@paulmck-laptop>

On Fri, Dec 19, 2025 at 04:29:27PM -0800, Paul E. McKenney wrote:
> Hello, Peter,
> 
> I started hitting shutdown-time hangs in next-20251217 which persist
> in next-20251219.  This hang happens on both x86 and arm64.  Once I
> figured out that the failure is high probability, but not deterministic,
> bisection converged here:
> 
> 5d1f0b2f278e ("sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()")
> 
> This commit reverts cleanly, and doing so restores hang-free operation.
> 
> The reproducer is shown below.
> 
> Thoughts?

With Chris Mason's help, I checked with a friendly local LLM, which
noted that a call to rq_modified_above() remains in kernel/sched/ext.c
in function do_pick_task_scx().  Of course, that does not explain a
locktorture hang, especially given that locktorture does not build
that file.  But in case it is helpful.

							Thanx, Paul

> ------------------------------------------------------------------------
> 
> for i in 1 2 3 4 5
> do
> 	tools/testing/selftests/rcutorture/bin/torture.sh --duration 20 --do-none --do-normal --do-locktorture --do-kasan --configs-locktorture "LOCK09"
> 	ret=$?
> 	if test "$ret" -ne 0
> 	then
> 		exit "$ret"
> 	fi
> 	echo Test $i succeeded
> done
> exit 0

