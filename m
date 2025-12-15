Return-Path: <linux-next+bounces-9397-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8202ECBCBBA
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 08:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24DFF3009B50
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 07:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9597D30CD84;
	Mon, 15 Dec 2025 07:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhHMY64Z"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721729E11D;
	Mon, 15 Dec 2025 07:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765782740; cv=none; b=Of/zud4fCIvk4wa7WaBSWGEesyHTGoYqfXZOH3H37xlscj3RAtrRYHoGHUnQ4DBUe35G6R/1PfqN4U+h9CknqmRaDH7yJKgRPNtWa5UlaOKc3B8IL7eRLdZ9/F0P1k869OCGSaNuKZzDEGEP+lz6Zuj/zAaSvlajwcPldZTmP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765782740; c=relaxed/simple;
	bh=YZFnRn2PxD+AU1GU5kdIEL4qXVMAdU98b4qFonxpl08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqLhjpYlLKXbUaQN+/bUlIm3lQru+rlx+nS1krmumCTSo9rZXLx03sL1Yg5SpTgig2hqgYPish8ZB7+0r2myPvFwPdnzlruU7g7QiHSFfUV0rzrYb0D2ZJUs9wuoBK7VVdGFpEgtHwcez1glLzbc4DcaEeYtMq6oTIm3KEyEC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhHMY64Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0592C4CEF5;
	Mon, 15 Dec 2025 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765782739;
	bh=YZFnRn2PxD+AU1GU5kdIEL4qXVMAdU98b4qFonxpl08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhHMY64ZNHZFA8JhYaKLbg//Yln0weYuTTvyvEtAsRsOsi8xqtWjyPmLAK72dL2LC
	 GhQxEBXmVgCSGGqao8J21uibCgRcwTua1A9ayjI0H7qvpNUrCNKguSb9dN7zIpBRjM
	 Hp0UFboxRjrwoL+FmvLGML7pv/h/vcYItZ99CSBbDO1vI0BGumQ4j9vlDpu5rOwrLS
	 FBLSCFxVggMNWtWJH//51im69XPg05pTDut2Vz1U6OUru3B+17WLqLyw3poYNtYDGZ
	 Pk0jy+P2IE1EUXYHZinbZdRomKoXVDZ0Hkzz0escBcyKnWis9lTLNXnZqIa8HQDLh8
	 Je4jWfoYAzVFg==
Date: Mon, 15 Dec 2025 08:12:13 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Peter Zijlstra <peterz@infradead.org>, vincent.guittot@linaro.org,
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
Message-ID: <aT-0zW7vOrJv6pA6@gmail.com>
References: <20251127153943.696191429@infradead.org>
 <20251127154725.901391274@infradead.org>
 <3dd19f67-1132-41b3-bf6a-ec9a430424e6@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dd19f67-1132-41b3-bf6a-ec9a430424e6@leemhuis.info>


* Thorsten Leemhuis <linux@leemhuis.info> wrote:

> On 11/27/25 16:39, Peter Zijlstra wrote:
> > Change sched_class::wakeup_preempt() to also get called for
> > cross-class wakeups, specifically those where the woken task is of a
> > higher class than the previous highest class.
>
> I suspect you might be aware of this already, but this patch afaics
> broke compilation of today's -next for me, as reverting fixed things.

Yeah, sorry about that, I fumbled a conflict resolution - should be
fixed for tomorrow's -next.

Thanks,

	Ingo

