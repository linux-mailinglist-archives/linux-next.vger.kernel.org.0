Return-Path: <linux-next+bounces-9440-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EC8CC6F40
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 11:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF48B304F921
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 09:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087E3348893;
	Wed, 17 Dec 2025 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CDJ6RjkB"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3613533A9F5;
	Wed, 17 Dec 2025 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965492; cv=none; b=CdHTvHpmGWX57v9CVQqI+5g9yUkPoSds8hIM3Kyovymr8yPQRFSh1JbESGdWvYynJLDakM8oDqcsGCLJLtWCe8RML0z4+z2B+27bIqFop5nIjl9AsKkIl+cAwZf+YhWT5raNHRAeG/JpxRsF4Vs5Y/Ip/C9lyno6E6BmqWJrWgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965492; c=relaxed/simple;
	bh=0UbLAjC9e+6cQfdPskOc0kCzEC+10SvoKKcWbtaOEbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivtwNnTVNbzHVWuUKG1EjJivXDlchUSMKTeyaffGoJQn726iQA3gQSbYfL51Jz+2s9iOW7umydnFxNPM3QXkwVdYD6D7JBiNm7iToMwZYfdxm7CRThhEdKPWoTsntYU5oO6Xb13ih4IZYk+SzUBWJPXbDDkODPPfS6f7J5aYDcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CDJ6RjkB; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KJCqZpwphPJeVk6PwlaMd2ZqhJ4I0Z3n2fKcBQ1Lvg4=; b=CDJ6RjkBfXfWosAsr6QcRPrhgY
	kAsCgOKqBkEe2r5JqqwyL63FXdgBb2NlWO8JF1i+eK7ZZkoAjnrrftMaQb5K7qqEbmfk9HNOwU0HE
	cDVQNJGl/xCOz/TiO3MH7UXMY/VvI6wmPGPOEPYEMBM6Ng3bmDW/70KfO7mB9tG0U3t2/RHYzBFs9
	9tNK3cdEbQ3J+Po96AM6YY+2FoHPL+qqAv0/RQlv+M6IWwwc+Xh91KuyLtNyvzKtbP8cnQ6BhbrfZ
	KirV6hHg44gaL9a3+QGIJEeTI9v7c+JtlzgDEi5SckQbjxPjjxyQJUVqrA2fKX9VVq5mXsnX5740B
	b4QbTAiQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoIE-00000004XfB-2j1N;
	Wed, 17 Dec 2025 09:58:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 17D9D30057E; Wed, 17 Dec 2025 10:58:01 +0100 (CET)
Date: Wed, 17 Dec 2025 10:58:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, void@manifault.com,
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: error: implicit =?utf-8?Q?declaration_?=
 =?utf-8?B?b2YgZnVuY3Rpb24g4oCYcnFfbW9kaWZpZWRfY2xlYXLigJkgKHdhcyBbUEFU?=
 =?utf-8?Q?CH_5=2F5=5D_sched?= =?utf-8?Q?=3A?= Rework
 sched_class::wakeup_preempt() and rq_modified_*())
Message-ID: <20251217095801.GC3708021@noisy.programming.kicks-ass.net>
References: <20251127153943.696191429@infradead.org>
 <20251127154725.901391274@infradead.org>
 <3dd19f67-1132-41b3-bf6a-ec9a430424e6@leemhuis.info>
 <aT-0zW7vOrJv6pA6@gmail.com>
 <20251215115121.GA505816@ax162>
 <fdf21e40-b504-4122-a072-2c546b1f8237@leemhuis.info>
 <aUGnpH-WAneT-4RE@slm.duckdns.org>
 <20251216214229.GR3911114@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216214229.GR3911114@noisy.programming.kicks-ass.net>

On Tue, Dec 16, 2025 at 10:42:29PM +0100, Peter Zijlstra wrote:
> On Tue, Dec 16, 2025 at 08:40:36AM -1000, Tejun Heo wrote:
> 
> > Ingo, Peter, I can pull tip and resolve this from sched_ext side too but it
> > would probably be cleaner to resolve from tip side?
> 
> Yeah, I'll fix it up tomorrow morning if Ingo hasn't yet. Sorry for the
> mess.

Force pushed tip/sched/core -- this issue should now hopefully be laid
to rest. Again, sorry for the mess.

