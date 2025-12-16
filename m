Return-Path: <linux-next+bounces-9431-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E98ABCC4EF4
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 19:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7FF323028785
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 18:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC85F33CE87;
	Tue, 16 Dec 2025 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5o5FAZ/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FC233C53F;
	Tue, 16 Dec 2025 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765910438; cv=none; b=Vez9ovtQcQKrSzjQHlQggQfoQfiCl8LXu8sjZphQfFdGQAqSYLzc+0KClxEtU3lvnzI0QhURA8TucqpPC3x2b0W8+lFU9gu1oTaFeZO3YZpkRJFAMIGKmuvM57lK0/DOotJDfntpNYYrSXf6vS0cneyr5z29acg1P2GNJ91k1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765910438; c=relaxed/simple;
	bh=bdyPbr3HaX5EnE7GdbX++dYi2tgb52RKawRV3FwWF5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi3if3u/XCjR2EDrZct1yMqVNmSolkyeZggth3zD2K9Drpz6mNRpUW5B3tapOorflp8+KbzuwZBFqYEhWQp+sr9bD8EP3958fSWifO9b7eX1cxEaLh3vLFc6jnH//2a6J9o1RV8YxboMXgA/7fQh4V47BpwH08DXKrOeVwCYYBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5o5FAZ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FF8C4CEFB;
	Tue, 16 Dec 2025 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765910438;
	bh=bdyPbr3HaX5EnE7GdbX++dYi2tgb52RKawRV3FwWF5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R5o5FAZ/YqCngq5ZuAsOKRhMUseTBv9uloVfRI7qdDfRpS3l1mNTg67N+smjhXmC+
	 ngcgxQF5F+Mt56i1OoKBPgb9evy1Z2xOBd2LJoFA3c3U9bAAGA0SfqmTefb2G3QTEl
	 4iZemvrw7D/sGbxKV7ax8m1lqFpsWOch6kjeH/qs3UZJp5Fd1n6Psng3mDJB8CJVEI
	 tfJuhMYpmtlcqCjYZDxlv/XF1FJ95FGnRotINtzebhfDQFAV9c6KAkebEJpe2eBqYu
	 wGK7Lnl3iDFZuS29W4CwYM+s/6pNbYUqnm4J7nfy6s+WDuZFCMPvKzj76q4KmkV1ms
	 Do2OkDnji8lnA==
Date: Tue, 16 Dec 2025 08:40:36 -1000
From: Tejun Heo <tj@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, void@manifault.com,
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: error: implicit =?utf-8?Q?declaration_?=
 =?utf-8?B?b2YgZnVuY3Rpb24g4oCYcnFfbW9kaWZpZWRfY2xlYXLigJkgKHdhcyBbUEFU?=
 =?utf-8?Q?CH_5=2F5=5D_sched?= =?utf-8?Q?=3A?= Rework
 sched_class::wakeup_preempt() and rq_modified_*())
Message-ID: <aUGnpH-WAneT-4RE@slm.duckdns.org>
References: <20251127153943.696191429@infradead.org>
 <20251127154725.901391274@infradead.org>
 <3dd19f67-1132-41b3-bf6a-ec9a430424e6@leemhuis.info>
 <aT-0zW7vOrJv6pA6@gmail.com>
 <20251215115121.GA505816@ax162>
 <fdf21e40-b504-4122-a072-2c546b1f8237@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdf21e40-b504-4122-a072-2c546b1f8237@leemhuis.info>

On Tue, Dec 16, 2025 at 08:02:50AM +0100, Thorsten Leemhuis wrote:
> 
> 
> On 12/15/25 12:51, Nathan Chancellor wrote:
> > On Mon, Dec 15, 2025 at 08:12:13AM +0100, Ingo Molnar wrote:
> >>
> >> * Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>
> >>> On 11/27/25 16:39, Peter Zijlstra wrote:
> >>>> Change sched_class::wakeup_preempt() to also get called for
> >>>> cross-class wakeups, specifically those where the woken task is of a
> >>>> higher class than the previous highest class.
> >>>
> >>> I suspect you might be aware of this already, but this patch afaics
> >>> broke compilation of today's -next for me, as reverting fixed things.
> >>
> >> Yeah, sorry about that, I fumbled a conflict resolution - should be
> >> fixed for tomorrow's -next.
> > 
> > It looks like you cleared up the rq_modified_clear() error but
> > rq_modified_above() is still present in kernel/sched/ext.c.
> 
> ...which afaics causes this build error in today's next:
> 
> In file included from kernel/sched/build_policy.c:62:
> kernel/sched/ext.c: In function ‘do_pick_task_scx’:
> kernel/sched/ext.c:2470:27: error: implicit declaration of function ‘rq_modified_above’ [-Wimplicit-function-declaration]
>  2470 |         if (!force_scx && rq_modified_above(rq, &ext_sched_class))
>       |                           ^~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:287: kernel/sched/build_policy.o] Error 1
> make[3]: *** [scripts/Makefile.build:556: kernel/sched] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:556: kernel] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builddir/build/BUILD/kernel-6.19.0-build/kernel-next-20251216/linux-6.19.0-0.0.next.20251216.415.vanilla.fc44.x86_64/Makefile:2062: .] Error 2
> make: *** [Makefile:256: __sub-make] Error 2

Ingo, Peter, I can pull tip and resolve this from sched_ext side too but it
would probably be cleaner to resolve from tip side?

Tahnks.

-- 
tejun

