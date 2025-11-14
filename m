Return-Path: <linux-next+bounces-8988-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D8C5C386
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 10:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4902934AE90
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 09:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65800301704;
	Fri, 14 Nov 2025 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hTJPspDk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jfY+Gsec"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08082222C4;
	Fri, 14 Nov 2025 09:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111624; cv=none; b=HM1n6ntT3nfXA/hglrXQ5iuA7XutohAi4vilGCdPuKNFGxJ8zUvnzD2gMElMZ0BHZOFxO7FoEV7HDvSAxLfivAsx/wsLaPcOidW5uJZeFPM6vldhGq1xUpDYYBMUSmdEvo0IbPuypQd1hqJhN9bu9/hAXpLPprZA+YdcVbQAx6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111624; c=relaxed/simple;
	bh=J3egHr9gx7gdZ2hc/Fjg5FmAqUB/0QkcD9F1f0lf+UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+7goYpXKlNqO1ljsnxIvzjyy8HPydD48hkAkYapijD8bkmDv7bnfHHAvkhDdtGZAIdGeQoyvD86WrnpnzhX6JTLnwocaCPXWb45ME8EsdxSx6Vi6TAjH+6LkopN/h0GG7iHWzNTOKlXBBe0HpGA78asY7HNEUs1IXc+65SkduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hTJPspDk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jfY+Gsec; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Nov 2025 10:13:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763111620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GfBJA/p9vyRl/csv9taKwo0xHSO3ZWYDmbpMo73Txmc=;
	b=hTJPspDkyAc4cFsSL8lXXJstM/6ub0/f3E3PFKTPRCOGBQyUFmpQeuW70sjdGK9nSbaBdf
	oe1RJ8cjVUZwYSRr64Q/5hsP2KUwcA0vQNNjWUlemQ2DRhjHiGuovc9nIDgSlP4R5xECzE
	JbgpQuB0sLQJfLoehejMKi4VmG2Zj1Sbkdt7Bd++K5gaZw9j1dtPfUD9CjUWb+g2HeW0Yu
	TT0XDgk2L4q0jlUT2Pbvu2kAmiJCQqjViZaZ21sGZNsK3Dx+LJ6qkc1Ts1IR1juQLkVW3g
	l+P9m1OF2TMktgR0Zor+GWTOj6phOJMgmYiDwtWUdZQEaXf7fK6gcJD8DTLEgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763111620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GfBJA/p9vyRl/csv9taKwo0xHSO3ZWYDmbpMo73Txmc=;
	b=jfY+GsecE77ivR0CLx+BC8zeJozUJQksCpJwclu5OOSkpRkYLn7UCpujhgyDGTvA3sOw/k
	Q4ObGUdpvYotIKAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Vlastimil Babka <vbabka@suse.cz>, Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the slab tree with the mm-unstable
 tree
Message-ID: <20251114094900-ca266dde-cf71-4536-882d-dcc8591fe6bd@linutronix.de>
References: <20251114151321.092927a1@canb.auug.org.au>
 <20251114050605.GA26424@lst.de>
 <0d45f76f-19a8-4ea3-92b0-95b63474c9cd@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d45f76f-19a8-4ea3-92b0-95b63474c9cd@suse.cz>

On Fri, Nov 14, 2025 at 09:46:30AM +0100, Vlastimil Babka wrote:
> On 11/14/25 06:06, Christoph Hellwig wrote:
> > On Fri, Nov 14, 2025 at 03:13:21PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >> 
> >> Today's linux-next merge of the slab tree got a conflict in:
> >> 
> >>   mm/mempool.c
> >> 
> >> between commit:
> >> 
> >>   25c4d8d29dbb ("mempool: clarify behavior of mempool_alloc_preallocated()")
> >> 
> >> from the mm-unstable tree and commit:
> >> 
> >>   5c829783e5f8 ("mempool: improve kerneldoc comments")
> > 
> > Hmm, I guess we need to agree on which tree takes mempool patches, then
> > we can just rebase one side.
> 
> I can take that patch as mm-unstable (not -stable) means it's still
> droppable there at this point.
> 
> > I also find 25c4d8d29dbb odd.  Yes, with PREEMPT_RT anything taking
> > spinlocks could sleep in the normal sense, but pretty much everything
> > in Linux assumes spinlocks as spinning.

This is why the new documentation explicitly mentions the spinlock.
All callers can interpret this relative to their own usecase.

> > So if we want to update that
> > we should agree on global conventions for it and not starting to update
> > random little functions individually.

The behaviour of different locks under various kernel configurations is
already documented extensively. My change explicitly tried to defer to that.

We have the 'Context:' tag in kdoc. What about the following?

	Context: Any context. Takes and releases pool->lock.

> That's also true. Thomas, is this case special

No, not special. Just one of the few places which promises to "never sleep".

> or what motivated the patch in the first place?

I used the function in a tracepoint handler [0] and trusted its documentation
to "never sleep". That turned out to be incorrect.
Also see the discussion on the patch submission [1] about just this point,
where we didn't come up with better wording.

[0] https://lore.kernel.org/lkml/20250919-rv-reactor-signal-v1-1-fb0012034158@linutronix.de/
[1] https://lore.kernel.org/lkml/20251014-mempool-doc-v1-1-bc9ebf169700@linutronix.de/


Thomas

