Return-Path: <linux-next+bounces-9610-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4ECD15396
	for <lists+linux-next@lfdr.de>; Mon, 12 Jan 2026 21:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54EF33020C50
	for <lists+linux-next@lfdr.de>; Mon, 12 Jan 2026 20:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B457A329377;
	Mon, 12 Jan 2026 20:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Yd+9DHFw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B82DBF40;
	Mon, 12 Jan 2026 20:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249887; cv=none; b=c+wN8MU/8tJrGa26w7P+882eOnLqRfnGoIyrKkNQNHj0Mcx+4G7ZlwjGs+6goXImj0Y3EcF8wwDaUK8raBaF3PgHoEW6w4R8GuotVSHBRHSuSb2a8330ZQmu+LGIxPs715wdQ70IxHOjeKn2lMpfhmGbr++wqxAfa74USOj+hu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249887; c=relaxed/simple;
	bh=9qLqmADt1r54ImwPUmntPrfr7Tj5A7lzjzOYKHBiRlA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=apl/FcMJl6IPKRJvj8qEAwekKNn7YVuv57WyvYLeJp1Jw6EEL8ZTvnNYOrkhMdFbkf09DytPRckbxcTWYVMclkzJ+89/AcmcveDwOYTwgVWIIYmzLbf5P8TP/N51olV71yttYFgodPwe1tCTbskRvL1vtXuYsqAo0DexTqWpcdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Yd+9DHFw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C58C116D0;
	Mon, 12 Jan 2026 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768249887;
	bh=9qLqmADt1r54ImwPUmntPrfr7Tj5A7lzjzOYKHBiRlA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yd+9DHFwoIpIobZZJZVo9iVx2XzBoLJM0M18da/UXLbNbTTK58TS96VupbCz6ZlCZ
	 glsJijJVkrxpP/xQp79KYxtEbc9u+X9Jy5xuE4KfLlm7Lz6DEU8spuqfonBn0OQbqw
	 356GzpPKaBnRpWUolBYcvuVBsmehaWhUe1GUzpb0=
Date: Mon, 12 Jan 2026 12:31:26 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-Id: <20260112123126.83e94ae2fe17829e32b0ea75@linux-foundation.org>
In-Reply-To: <20260111110231.GAaWODR6gOvIp6KzD6@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
	<20260107144753.7071f5f2@canb.auug.org.au>
	<20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
	<20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
	<20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
	<20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
	<20260109113921.5769acfa1d0c08628aeb7217@linux-foundation.org>
	<20260109195410.GGaWFc4o-TL_jhOTxF@fat_crate.local>
	<20260109140026.efda2135377239ba8964d139@linux-foundation.org>
	<20260111110231.GAaWODR6gOvIp6KzD6@fat_crate.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Jan 2026 12:02:31 +0100 Borislav Petkov <bp@alien8.de> wrote:

> > Could I ask that when triaging these emails, you let me know promptly
> > if you'd prefer I not merge it, or to not upstream it without full x86
> > review, or whatever you want?  I can annotate or drop the patchset and
> > things will proceed smootly.
> 
> The problem is, most of the time there's so much email so that all of us are
> drowning in it to even be able to react. Remember the last time where Peter
> and I were asking you to drop a patch from your queue? I think you didn't even
> react because of -ETOOMUCHMAIL.

oops.  When triaging Subjects, something which is clearly x86 gets less
love.

> So to make things simpler, maybe we could say:
> 
> - patches which touch x86 only and there are no mm dependencies, go only
>   through us. Including kexec. I think you'd like this because it'll take some
>   of your load off

Sure.

> - mixed sets would probably need a week or so reaction time from us.

No probs.

> If no
>   reaction, I guess you take 'em. And we'll try to send acks/reviews. This
>   will become even easier when we get the AI to review.

I'm optimistic.  Did you see Mathieu's review of a Gemini review? 
https://lkml.kernel.org/r/6fbb17fe-f2b1-4233-9834-5a5020cd87b3@efficios.com

> Apparently, trying to
>   get people to review more hasn't had any palpable success over the years so
>   might as well let AI replace them here. :-P

Yeah.  I've been paying a lot of attention to the review economy
lately, I'm hopeful we can do some things to help level the playing
field, take load off those few who do so much of it.  Early days.


> > Yeah, that sucks.  I always pull his tree, do my test merge then do a
> > couple of build tests before sending the pull request.  I wish the guy
> > would publish his .configs so we can do `make linusconfig' to avoid the
> > grumpygrams.
> 
> So he builds an allmodconfig, AFAIK, of every pull request, with both
> compilers.
> 
> That's what I do too with our pull requests come merge window: I merge them
> locally and build allmodconfigs of each one. This has caught pretty much every
> issue, AFAIR.

OK.  arm allnoconfig is fun.  It's super fast.  It's nommu and finds
things...

