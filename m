Return-Path: <linux-next+bounces-9400-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF2CBDB72
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 13:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4EFE307D37B
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 12:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCC92BDC3D;
	Mon, 15 Dec 2025 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmADnTfF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBD829A9C8;
	Mon, 15 Dec 2025 11:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765799488; cv=none; b=RjlNDMDz2iP4LAF4U2xOoOAh2k/z6ZlanHo/PQQ2xCNg3vTkVUlhhlFaum4h8Sm+mwskDdKeCXz3wtCuBl0WXXBnXwRUKfzqGhjK0kZYO3SAiFdeXuIE5B1Ulr9gHKg/hce63iDI2LnyzqU0Z6o1F26S1a4TAp7Bkk6uqjEGiJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765799488; c=relaxed/simple;
	bh=7aNHdGyRFKuUykD19O+YYYLqKJB4wB5emFZqqPE05lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HARfKjqIsmT+J8xFVlXaEOrKHt71iNHALJEyW07ak+oWvonDmf0/qagBPcSBdZERrO1J7PhEY+8XECz2F3Pb3LPW/b5SZ05s3OVzhZ7jvvqLopPDMOtySqHfbxhuhz2U/YWriyA8E0tXv1u1CalDudsvfyia7jWmoqTncUdhBcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmADnTfF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA37C4CEFB;
	Mon, 15 Dec 2025 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765799487;
	bh=7aNHdGyRFKuUykD19O+YYYLqKJB4wB5emFZqqPE05lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmADnTfFRDtwERHboafEAH9B+5yakvOaN5UVTQDc/g8gCZmHMrz2zJGHNU5Q0pygN
	 KPvGF6lCxqmwdJZ6JHsd2jV8NXxRn7/h+Q2SNXb5v484x3F8Mc/bO/M8RzDJgh9pVf
	 sHyTiN5/pMu9ytKEerQFbbnS/cNS2XeNTk8bvRnh619pMVmc0uyEQ+e4dllan4xlqU
	 k0UH9U6MeGHHxByK3EQ8Hlfq8XzoEGAYBP+k6hU7hHRvWFujwlt0PfcGeY1IUEW3ur
	 wW0nc7BPD3n/WwrfdUdHcG9AoT2LwR+kksY3dH1yDXhL3ZZjRltlLfwG3hK8OPXGFD
	 PT0naNlAsoBmg==
Date: Mon, 15 Dec 2025 20:51:21 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Peter Zijlstra <peterz@infradead.org>, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, tj@kernel.org,
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com,
	sched-ext@lists.linux.dev,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: error: implicit =?utf-8?Q?declaration_?=
 =?utf-8?B?b2YgZnVuY3Rpb24g4oCYcnFfbW9kaWZpZWRfY2xlYXLigJkgKHdhcyBbUEFU?=
 =?utf-8?Q?CH_5=2F5=5D_sched?= =?utf-8?Q?=3A?= Rework
 sched_class::wakeup_preempt() and rq_modified_*())
Message-ID: <20251215115121.GA505816@ax162>
References: <20251127153943.696191429@infradead.org>
 <20251127154725.901391274@infradead.org>
 <3dd19f67-1132-41b3-bf6a-ec9a430424e6@leemhuis.info>
 <aT-0zW7vOrJv6pA6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aT-0zW7vOrJv6pA6@gmail.com>

On Mon, Dec 15, 2025 at 08:12:13AM +0100, Ingo Molnar wrote:
> 
> * Thorsten Leemhuis <linux@leemhuis.info> wrote:
> 
> > On 11/27/25 16:39, Peter Zijlstra wrote:
> > > Change sched_class::wakeup_preempt() to also get called for
> > > cross-class wakeups, specifically those where the woken task is of a
> > > higher class than the previous highest class.
> >
> > I suspect you might be aware of this already, but this patch afaics
> > broke compilation of today's -next for me, as reverting fixed things.
> 
> Yeah, sorry about that, I fumbled a conflict resolution - should be
> fixed for tomorrow's -next.

It looks like you cleared up the rq_modified_clear() error but
rq_modified_above() is still present in kernel/sched/ext.c.

Cheers,
Nathan

