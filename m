Return-Path: <linux-next+bounces-9606-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 402A5D0C670
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 23:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDBFC300EDEB
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 22:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89017238C0A;
	Fri,  9 Jan 2026 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BdgsQHrF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C850094C;
	Fri,  9 Jan 2026 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767996028; cv=none; b=oVR4lJgLl8F3RDyFbtQEco0Tb+zHcXcS5vabNfaCV+PuSTf7SlMZXikKW2Rc3AWAVrXZVH2qrkURpOooXTMJEVJoau1oGVtemNybMHg3PBv70UXQjOtNbdtrWUg9IP5fe7qwrCtSumYiiieB3SbtDKZKflNAOeTesQl6iaQuE6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767996028; c=relaxed/simple;
	bh=QviZ7gNK1Lk+Whyh9xyhyxiii8j9h8p2gZoCCrnA60Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RHTKFrcI4xvd1S50gkalpl80DZCnqFOTYmijzJCWxPnz7lO/BSKMQ6UaiEZVVYsmg6wZWwtHBhHhN2Uni9ESDOqC1c8O+Zs9J4MC8AUgSOIhM+jK/81j8n6kn7HIz684H5TLPHEewRGMNXVt5htKpHCS0Ol1vgAVRYvVL0+ET+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BdgsQHrF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9D1C4CEF1;
	Fri,  9 Jan 2026 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767996028;
	bh=QviZ7gNK1Lk+Whyh9xyhyxiii8j9h8p2gZoCCrnA60Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BdgsQHrFwMOQ0jbBk4UOeG06/ckz8jfG3JKxczsOVe7EogMylZKKbcAq3akUw0sFz
	 SpEGPdQCCNp/9VaqGD5Tq3lBQQZAIxP1le+1LgnpaHMOd2HlXoqHcdl+MIwirtuV/8
	 ee2ugqztf9/xxQ6LFOauBPTsaOuQ+n81lvGn21iA=
Date: Fri, 9 Jan 2026 14:00:26 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-Id: <20260109140026.efda2135377239ba8964d139@linux-foundation.org>
In-Reply-To: <20260109195410.GGaWFc4o-TL_jhOTxF@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
	<20260107144753.7071f5f2@canb.auug.org.au>
	<20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
	<20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
	<20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
	<20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
	<20260109113921.5769acfa1d0c08628aeb7217@linux-foundation.org>
	<20260109195410.GGaWFc4o-TL_jhOTxF@fat_crate.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Jan 2026 20:54:10 +0100 Borislav Petkov <bp@alien8.de> wrote:

> On Fri, Jan 09, 2026 at 11:39:21AM -0800, Andrew Morton wrote:
> > I'm not particularly concerned about these integration and build issues. 
> > Shit happens, that's what -next is for and we fix things quickly.
> 
> Except that I don't like mails from sfr saying, "oh well, a patch in tip is
> breaking something but it must be coming from a different tree because tip
> alone builds fine."
> 
> So I go and do some crazy bisection dances on a big fat machine.
> 
> linux-next is there, AFAIU, to avoid exactly that - cross-tree conflicts,
> amongst other things.

Yeah.  But it's quite rare, isn't it?  Collisions maybe a couple of
times a year?  (And this one wasn't MM!).  If ~6% of MM patches alter
x86 then that's 200-300/year, holy cow.  Given how cheap and quick it
is to resolve these things, should we be optimizing for these
rare collisions?

We did have one significant runtime problem from this about two years
ago.  For which I got thoroughly smacked around, while silently blaming
you guys ;)  You were cc'ed ~8 times over ~4 months!

> > My main concern is to avoid placing too many developers on the critical
> > path for MM development.
> > 
> > I mean, it's a really common thing.  Because we all love statistics,
> > mm.git MM development branches presently hold 262 patches, 16 of which
> > alter arch/86!
> 
> Yah, I know. I do look at all your emails when you pick up stuff into your
> trees and I mark them accordingly.

Thanks.

> However, I don't like it when you pick up stuff too quickly, without any
> review by us.

Well what do I do and how long should we wait?

See the mm-new thing below.  This should help.

I think the typical profile here is a patchset that makes lots of MM
changes and some incidental x86 modifications, with dependency in both
directions.  I can be on the alert for significant alterations and mark
these for extra x86 consideration, although a single-line change can of
course break things.  I'd prefer to be able to get these patchsets into
mm's testing branches promptly, to maximize the overall contribution's
time-under-test.

Could I ask that when triaging these emails, you let me know promptly
if you'd prefer I not merge it, or to not upstream it without full x86
review, or whatever you want?  I can annotate or drop the patchset and
things will proceed smootly.

Incidentally, we recently added an "mm-new" branch to mm.git.  It's
withheld from linux-next, New material enters here and typically will
be moved into mm-unstable (and hence -next) after 2-3 days.  This is
mainly to try to avoid breaking linux-next.  This means if you see an
added-to-mm-new email, the patch won't be submitted to -next for a few
days.

IOW, that email is advance notification that the patch might appear in
linux-next a few days from now.  Hopefully that helps a bit?

(I'll actually be documenting all this Real Soon Now).

> And it's not like there are no solutions for cross-tree patchsets - immutable
> branches, acked-bys etc so that the whole set goes through one tree, and so
> on.

I'd love me some acked-bys :)

I dunno, Boris.  Is it really worth the up-front and ongoing work for
something which happens so rarely and which Stephen handles so slickly?

> Don't get me wrong - I see your point but what is missing, IMO, is better sync
> between the trees. I can work with almost any setup and tree configuration
> - but I'd like to be in the know and be aware of the situation and what goes
> where.
> 
> And when Linus says that something doesn't build during the merge window, I'd
> like to be prepared instead of both trees scrambling last-minute to figure out
> why.

Yeah, that sucks.  I always pull his tree, do my test merge then do a
couple of build tests before sending the pull request.  I wish the guy
would publish his .configs so we can do `make linusconfig' to avoid the
grumpygrams.


