Return-Path: <linux-next+bounces-6666-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B99AB25B5
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 01:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A798F1B6487F
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 23:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BDC213259;
	Sat, 10 May 2025 23:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzA5zgRn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23E820E32D;
	Sat, 10 May 2025 23:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746919167; cv=none; b=p6yO7sY8ZhK8vy6qwRX8q2mOXIsWcWwPW2O6HFFvTS8HdChNR0hJi/DrAgu5ZWFTzxrqi64h3CWByLNqWfAwvpuoWwYsaI3Jh+DQmQj0/cbgSIdF3vCOXiQ11ugkNRUeI28pm4Csuwy+mB+7jSOJ1nY2EX1j0JCA8L/MeWc1MH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746919167; c=relaxed/simple;
	bh=iiveGFvRtEE/7L3PlB8ltRM+umAKD4sWLRk0CWtxK88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh5kDXQfzU2hubg87dEEVCqYl1Fvy/eIxevSANj+unF0w2rejpmQrZmgpjE1n36p+R8MCH9N+DMGTUeZV1Q7z/lC9nzZU29HfdX+jBDdzLx7AFtTEmYardeb/5lIy8/o4AynKG/wC5H9japrVylzAcoLCK2eH23K5Ixsi1fUd8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzA5zgRn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A78C4CEE2;
	Sat, 10 May 2025 23:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746919167;
	bh=iiveGFvRtEE/7L3PlB8ltRM+umAKD4sWLRk0CWtxK88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzA5zgRnbzmu65ys4i8cIDvMFKUxDcedu38LS39tncrWGrnxTc1WSJBviejDqIMYS
	 xfpi9BhKWal5+NmiHPmOAPcUtAFV02JxqmuPoaWiUn9Iok0h2siC6Glysve1epO6wq
	 1vh6fNNXdTY6AkGTxT0UYWdjWHuBIezcvjomesHO4flnF9rT+SPTusgGkkQUfGE91b
	 CSU/vhkndUpuWrHR5PFE28tWv+po9JtO5hnwX1cy8tewqYduAfMP0gyPp/32SCKNcS
	 qoJoGBQRjiftuWRfWnC3U+EcTwVkqzrpgcHDMPDFzH6pqSaf9qVrQyZOkFJ8Usbd6I
	 ZpL/8bunEkLqw==
Date: Sat, 10 May 2025 16:19:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <20250510231919.GA134802@quark>
References: <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
 <20250510223401.GK30295@gate.crashing.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510223401.GK30295@gate.crashing.org>

On Sat, May 10, 2025 at 05:34:01PM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Fri, May 09, 2025 at 10:33:08PM -0700, Eric Biggers wrote:
> > On Sat, May 10, 2025 at 01:10:22PM +0800, Herbert Xu wrote:
> > > On Fri, May 09, 2025 at 09:44:50PM -0700, Eric Biggers wrote:
> > > >
> > > > This fixes "-cpu Power10", but older CPUs (e.g. "-cpu POWER9") are still
> > > > failing.
> > > 
> > > You're right.  I'll revert this and apply the following patch
> > > instead.
> > > 
> > > BTW this thing is still hopelessly broken if it's called from
> > > softirq context because there is no SIMD fallback.  Yes I removed
> > > the SIMD check but it was already broken before that as it simply
> > > switched from the 4-block version to the 1-block version if SIMD
> > > is not available rather than actually doing something that is
> > > safe in softirq context.
> > > 
> > > Perhaps we should just remove this altogether until it's fixed.
> > 
> > Yes, the PowerPC Poly1305 code incorrectly uses VSX without first checking
> > crypto_simd_usable().  And PowerPC also doesn't support VSX in softirqs, or at
> > least it doesn't claim to (it doesn't override may_use_simd(), so it gets the
> > default from include/asm-generic/simd.h which returns false in softirq context).
> > Maybe add 'depends on BROKEN' to CRYPTO_POLY1305_P10 for now, and give the
> > PowerPC folks (Cc'ed) a chance to fix this before removing the code.
> 
> What doe "may_use_simd" even *mean*?  At its declaration site it says
> "whether it is allowable at this time to issue SIMD instructions or
> access the SIMD register file", but that is 100% meaningless, you can do
> SIMD in GPRs.
> 
> On PowerPC we have two separate register files dedicated to SIMD-like
> stuff, the VMX and the VSX register files.  Which of those is this
> function supposed to care about?
> 
> It looks like the whole "may_use_simd" thing is a misguided abstraction
> unfortunately :-(

may_use_simd() a.k.a crypto_simd_usable() is supposed to check whether vector /
SIMD registers can be used in the current context, provided that the appropriate
architecture-specific functions like kernel_fpu_begin() and kernel_fpu_end() are
used.  In the case of architectures that support the use of multiple sets of
vector / SIMD registers in kernel mode, it would have to check for the
intersection of the calling context requirements for all of them, since it
doesn't specify a particular set.

The reason that may_use_simd() a.k.a. crypto_simd_usable() got pulled out into
an abstraction shared across all architectures is that it's used by
non-architecture-specific code, such as crypto/simd.c, and also the crypto
self-tests which inject 'false' return values to test the no-SIMD code paths.

I think the users other than the self-tests are on the way out, though.  Most of
the users of crypto/simd.c just got removed, with CRYPTO_AES_GCM_P10 being the
last one.  A new non-architecture-specific user of crypto_simd_usable() just got
added in include/crypto/internal/sha2.h for some reason (despite me nacking the
patch), but that should be reverted.

So if it's really the case that VMX and VSX are both supported for kernel-mode
use but have different requirements on the calling context, you could make the
PowerPC crypto code use more precise checks like may_use_vsx().  Just the crypto
self-tests won't be able to test the no-SIMD code paths that way, unfortunately.

- Eric

