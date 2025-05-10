Return-Path: <linux-next+bounces-6665-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7D9AB25AF
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 01:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 433C917FEA3
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 23:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A5E1EA7EB;
	Sat, 10 May 2025 23:08:00 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478E01C84D0;
	Sat, 10 May 2025 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746918480; cv=none; b=Ho9nFS6JuFveVutZR6xMehuN6WwzQ9uUV/2sGcPIA+Sfj1pYPWF4FKKEOtN0t97lp/dqm5gkchjn1x9X2QaO+ba3bo0YXxx8//p3+apNfdY2jMERutqWvFcsbesa0wqByJLFkqG3s6eX2FmHIbKlLHWBDlqJ40jBE05Ol4sIV+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746918480; c=relaxed/simple;
	bh=0eGkGEjSo6rsUIZh+3fn1kbepWZlnE3rKLuCNJYFR04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caeRpS9Lf9DBApd1gjUiQ4Y5YbZZrbhc0No7JNhiutFkSZ1JzwP0IuGL1WSvNA30MUF2KDMnaXwFTSs69iXiU38hhN8yGbh7RRjn0CSUTkZA1uhHp9XuQ+2jG5oz6ZnUIqYoFUrGuc5SYV89K+9MbuX+tmoTdqnyrpkYw5Ym53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 54AMY5A8009132;
	Sat, 10 May 2025 17:34:05 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 54AMY1Rq009126;
	Sat, 10 May 2025 17:34:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 10 May 2025 17:34:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch wrapper
Message-ID: <20250510223401.GK30295@gate.crashing.org>
References: <aBtF2jVZQwxGiHVk@gondor.apana.org.au> <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com> <aByX_Y64C6lVRR8M@gondor.apana.org.au> <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com> <aByiNZNxqyTerdYG@gondor.apana.org.au> <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com> <aB31DI4QBBZuQObQ@gondor.apana.org.au> <20250510044450.GA505731@sol> <aB7fvi_FBdnmLUON@gondor.apana.org.au> <20250510053308.GB505731@sol>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510053308.GB505731@sol>
User-Agent: Mutt/1.4.2.3i

Hi!

On Fri, May 09, 2025 at 10:33:08PM -0700, Eric Biggers wrote:
> On Sat, May 10, 2025 at 01:10:22PM +0800, Herbert Xu wrote:
> > On Fri, May 09, 2025 at 09:44:50PM -0700, Eric Biggers wrote:
> > >
> > > This fixes "-cpu Power10", but older CPUs (e.g. "-cpu POWER9") are still
> > > failing.
> > 
> > You're right.  I'll revert this and apply the following patch
> > instead.
> > 
> > BTW this thing is still hopelessly broken if it's called from
> > softirq context because there is no SIMD fallback.  Yes I removed
> > the SIMD check but it was already broken before that as it simply
> > switched from the 4-block version to the 1-block version if SIMD
> > is not available rather than actually doing something that is
> > safe in softirq context.
> > 
> > Perhaps we should just remove this altogether until it's fixed.
> 
> Yes, the PowerPC Poly1305 code incorrectly uses VSX without first checking
> crypto_simd_usable().  And PowerPC also doesn't support VSX in softirqs, or at
> least it doesn't claim to (it doesn't override may_use_simd(), so it gets the
> default from include/asm-generic/simd.h which returns false in softirq context).
> Maybe add 'depends on BROKEN' to CRYPTO_POLY1305_P10 for now, and give the
> PowerPC folks (Cc'ed) a chance to fix this before removing the code.

What doe "may_use_simd" even *mean*?  At its declaration site it says
"whether it is allowable at this time to issue SIMD instructions or
access the SIMD register file", but that is 100% meaningless, you can do
SIMD in GPRs.

On PowerPC we have two separate register files dedicated to SIMD-like
stuff, the VMX and the VSX register files.  Which of those is this
function supposed to care about?

It looks like the whole "may_use_simd" thing is a misguided abstraction
unfortunately :-(


Segher

