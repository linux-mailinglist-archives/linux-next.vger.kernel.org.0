Return-Path: <linux-next+bounces-6668-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC790AB2626
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 04:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36ADF189D8F2
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 02:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A12574059;
	Sun, 11 May 2025 02:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="dY6wxncF"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102C749C;
	Sun, 11 May 2025 02:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746929420; cv=none; b=fDgT8zbJk/2IP5/uPF1JTRCEOLVjP8YlH86DT3Dz2+wPoxn0PIa4JjDu3V3CkWXcvha4Mctou7I0NioU0vZCq49KzK9DpfS/8aNb/6Y1chyTobbwmI5DpPMllUsEPSocu929Ycf48vAEEgfzT3dt4yE9RU3GIwXnprKuvueZk1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746929420; c=relaxed/simple;
	bh=TjbEOg6faQ/ajLscYrJKjvzmk8xZkMqa1VGs87f6YWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbV8SidgJd4UgdC0XKPrBEizX1R/8yPwqT1OAA3a4mKs5x+GlkKLw7sWmNySbl4vZmH7cZcq54zeMtmNTsqG4qYXwIgELuzLh1Jk6seEHQhtub1s/IEEsKpW2x1glevsB1lBmwl+iuOVbW57P6pE/MlkKzA/m8gsN3AdRc6a6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=dY6wxncF; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1CWY/3p83a71s1c0nZWdC5lD6l8cif6NWAoVMJXjvcQ=; b=dY6wxncFU5a/IhfMhnbVtgEEH9
	3aY05cODJoQ1XeKtB008Qg2RFyG8zK/dUupiGzUh3K+YwiGN/1JPi6GuKMXYspd866vQBOEUU9Ype
	XQ4TRhTYt5zAtWZ5jRSsddJZ6jir22A2b4OV0k+l6SXjdGOfg7f97WKlnxCCGh/f/PrlBYJtK+etD
	GrEFTgBXPmDwtxuraLxpwptZDUxRA4GBuya5mx89wkbiPt0gdhp/3jEApsg9ah8syF1bczyUSfBwT
	8NX27ZnXbBD4+gGSExMspPp807G61ks4iGMiKfzmNq/76lAnIEKoKsL+B8EmkFHsH5B40GIsmDMA1
	t5HAaM3Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDw8g-0059qN-0n;
	Sun, 11 May 2025 10:10:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 11 May 2025 10:10:02 +0800
Date: Sun, 11 May 2025 10:10:02 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <aCAG-rNiy0b1C9BF@gondor.apana.org.au>
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

While we may debate the name of this function, the question is
simply whether you need to save state or not when you get an
interrupt.

If you don't need to save state, then may_use_simd doesn't apply
to you.  If you need to manually save state when you get an IRQ,
then you must obey the rules.

So even if VMX and VSX registers are separate, you must assume
that in an IRQ either could be in use already and therefore you
must not use any of them without saving the state.

The ideal solution is to save the state (if necessary) in softirqs,
or simply disable softirqs when these instructions are in use.
Then the fallback path can be removed, for softirqs at least.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

