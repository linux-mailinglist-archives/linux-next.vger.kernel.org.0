Return-Path: <linux-next+bounces-9609-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE0D0EA71
	for <lists+linux-next@lfdr.de>; Sun, 11 Jan 2026 12:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A58DE3002842
	for <lists+linux-next@lfdr.de>; Sun, 11 Jan 2026 11:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77974227E95;
	Sun, 11 Jan 2026 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="H51IW24t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F91F583D;
	Sun, 11 Jan 2026 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768129384; cv=none; b=Hh0YMw15s1jD+uhkWOGbIyVdxq6dj2ZJVlkO5GnNzCSxFuLr9PTTN4PKD6vrHVnEw4H0eq5PXUk6Mg54KaNsX13+OmKF9qOAEL98OEHfmdhcI+GNxC3nXBf2dwvD+Fs1JogUtxWOal7fMil2NDJNrF4Aulk7GS1Ip6nucdhQNTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768129384; c=relaxed/simple;
	bh=JhSTTOpYP/ZSmAVa1zBgYdj7HPwOHT1gYA4c+twwMM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRBxgjCwijFF8qJ6ci8x7eFZzD7hVsNDxgLK/siA8calc8Za8zutGQqTrVaHCQHhjOU8hBtlH8CDMf16inl7c94fnZZOsgOSp3Fmn883vpcI7+k3n9bQerRaJOMbNqxTcnxLWWU85F/7/4Jm0f4g2blLt8HXkyAh9JCJoyUoFP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=H51IW24t; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 31AD640E0173;
	Sun, 11 Jan 2026 11:02:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iC5ih3854wdv; Sun, 11 Jan 2026 11:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768129365; bh=ioCbGqO+/DH6msLkcSyXAlEBWFuzrO7Sv/1CIOh4If0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H51IW24tl4/vqDxkVujYl/X/GfgPC4oxaXkSD3/xzJlsEpH3yLjRzQii7K5OhzbL6
	 V4zAufz2MvlrbCr/jRcqc8qgafVKsfMdL6N6g3qOELHC3c+nuAAowIhPnwtUGXjp8F
	 qDZp+2rNUow0y1Lc40iUcQ1TaOQbvUTzFLJ4eX0kLQTDt2a3q/fkLBq2NgZagit2jf
	 rGxxLBMFXjrpI4zfgNMnjYoRQ1g+xmFDIzn1q9xRglD0BjpjmBOmpsuYMRMj79kTmP
	 WbQr1BcU9lZ767IvY3jmYn/D37+ldLvho8YVd8uF451SIb75WI1UEzsMHwef97eb4u
	 uGzroEnu6vtBubarlXnfYt1H6/vYlrAlKYuG2thAMJfQO8MHCxaReAbc4UcvLxnxpw
	 K9XvPJUHTdPGKK7N89A83oZILjLm54rTK5JyeB/DEOmqX1CqM1wZfJcGggnMA0s6ll
	 bymz/r4f86ds6G45WZ2LGCFJB2twNZRMX9mLxzpibSXiW92FtSxR0Z5gWRqMmhK/aa
	 jHo3k6IWbkw8xSCNZTwGyRCFBSdd5MnsaLZngQMFmwzy1evauw8UkKXXbOMHe7nG/e
	 Gn3xqOoDDUXkdbNgmxg6lNTk+7X8meslPZJoIybzhzDERH5OCEVko0l/5Y6me1C4Ye
	 zlRlVD02weCx/pC5cxEdwIJM=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 8762C40E00DE;
	Sun, 11 Jan 2026 11:02:37 +0000 (UTC)
Date: Sun, 11 Jan 2026 12:02:31 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260111110231.GAaWODR6gOvIp6KzD6@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
 <20260107144753.7071f5f2@canb.auug.org.au>
 <20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
 <20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
 <20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
 <20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
 <20260109113921.5769acfa1d0c08628aeb7217@linux-foundation.org>
 <20260109195410.GGaWFc4o-TL_jhOTxF@fat_crate.local>
 <20260109140026.efda2135377239ba8964d139@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109140026.efda2135377239ba8964d139@linux-foundation.org>

On Fri, Jan 09, 2026 at 02:00:26PM -0800, Andrew Morton wrote:
> Yeah.  But it's quite rare, isn't it?  Collisions maybe a couple of
> times a year?  (And this one wasn't MM!).  If ~6% of MM patches alter
> x86 then that's 200-300/year, holy cow.  Given how cheap and quick it
> is to resolve these things, should we be optimizing for these
> rare collisions?

Probably not but if we're optimizing anyway, might as well take care of that
too. :)

But I agree - such collisions are very seldom. Luckily.
 
> We did have one significant runtime problem from this about two years
> ago.  For which I got thoroughly smacked around, while silently blaming
> you guys ;)  You were cc'ed ~8 times over ~4 months!

Probably it was somewhere in the mail firehose... :-\

> Well what do I do and how long should we wait?

That would be the timeframe we all agree upon...

> See the mm-new thing below.  This should help.
> 
> I think the typical profile here is a patchset that makes lots of MM
> changes and some incidental x86 modifications, with dependency in both
> directions.  I can be on the alert for significant alterations and mark
> these for extra x86 consideration, although a single-line change can of
> course break things.  I'd prefer to be able to get these patchsets into
> mm's testing branches promptly, to maximize the overall contribution's
> time-under-test.

Yap, and if you take a look at the patches you mentioned upthread - I did look
at the x86 bits in the clear_page set so that that is reviewed and can go
together through your tree.

> Could I ask that when triaging these emails, you let me know promptly
> if you'd prefer I not merge it, or to not upstream it without full x86
> review, or whatever you want?  I can annotate or drop the patchset and
> things will proceed smootly.

The problem is, most of the time there's so much email so that all of us are
drowning in it to even be able to react. Remember the last time where Peter
and I were asking you to drop a patch from your queue? I think you didn't even
react because of -ETOOMUCHMAIL.

So to make things simpler, maybe we could say:

- patches which touch x86 only and there are no mm dependencies, go only
  through us. Including kexec. I think you'd like this because it'll take some
  of your load off

- mixed sets would probably need a week or so reaction time from us. If no
  reaction, I guess you take 'em. And we'll try to send acks/reviews. This
  will become even easier when we get the AI to review. Apparently, trying to
  get people to review more hasn't had any palpable success over the years so
  might as well let AI replace them here. :-P

How does that sound?

> Incidentally, we recently added an "mm-new" branch to mm.git.  It's
> withheld from linux-next, New material enters here and typically will
> be moved into mm-unstable (and hence -next) after 2-3 days.  This is
> mainly to try to avoid breaking linux-next.  This means if you see an
> added-to-mm-new email, the patch won't be submitted to -next for a few
> days.

Ack, good to know.

> IOW, that email is advance notification that the patch might appear in
> linux-next a few days from now.  Hopefully that helps a bit?

Right.

> I'd love me some acked-bys :)

Yeah, we'll try to be more verbose...

> I dunno, Boris.  Is it really worth the up-front and ongoing work for
> something which happens so rarely and which Stephen handles so slickly?

Nah, if anything and as said, we'd address this as a by-product of other
workflow optimizations.

> Yeah, that sucks.  I always pull his tree, do my test merge then do a
> couple of build tests before sending the pull request.  I wish the guy
> would publish his .configs so we can do `make linusconfig' to avoid the
> grumpygrams.

So he builds an allmodconfig, AFAIK, of every pull request, with both
compilers.

That's what I do too with our pull requests come merge window: I merge them
locally and build allmodconfigs of each one. This has caught pretty much every
issue, AFAIR.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

