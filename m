Return-Path: <linux-next+bounces-8774-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F308C244E5
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 11:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5EF254F4C36
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 09:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B584333731;
	Fri, 31 Oct 2025 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="orQEsvWa"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB40333737;
	Fri, 31 Oct 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904627; cv=none; b=DjBYPBISvw6T3Aod2r+lTw6vnchiaDHo7UWdRT/PyYOSiGgvBkV49881SArb8pLyhrLRWP9SOMre5stwKWBnj1HCx0NvxmTAtrjcf+0PF6sv97zFiiwnFUsY9QUUOyZ58YhNqfYeMvvxQIgM2eZYOPI8mXxtbnJFYL51E+pNc9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904627; c=relaxed/simple;
	bh=T8f8fFYfWlZ057HopKSbAjpleUHrJBq34V6fLF45xuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzDRcjoXP5ellbwn8FTBKsQOS3/9sWwJmGjr+++q1xy4EIb3Dix1QI2O1R2ZIcnJBBZMFk33dTspHYVv6MwyYt9ksx/XUfvBV1V+wRlYsnoshE7mrU9Fs5UbmZAAvP8GK/2hJUx+HnJBQvMia6PicPMWlHaL3l30tLuP84x9+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=orQEsvWa; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6bLJOpgoIkHeKg63jKawwEB8uxgTfG/P1IPFEKRo2Wg=; b=orQEsvWa5yUiUXsbymaxEWORIg
	vy9YNTTEwPSPxw7KbRxHOCBFeYE2ICjhjRATTn7wcryifTyGDEt59I4dtpqNmbZ7Zc69JJ4oiDCR/
	efBqjQ/7p760c5URsL1fixLLOhV2iDa3ET27Iq+hG9QoxgCcbhpGlq85cSGFuBRK/NslDOTvmcUEU
	fo6v6iNoiv01AJxCgfYbt3rOddU9xZCayKOs1kNewIyBB4KZevi7rQOc9C2HaItifud1NevPX2z9K
	twXbAzAoZ1WhwuDLxRHusJAcnDsWPdgW6JalPs9pC7lXot1MTxXv+YPElRGdZwvJHsO9E4kSYGesm
	HLROvr/w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl0j-0000000Axbj-0MuB;
	Fri, 31 Oct 2025 09:01:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B4D2930029E; Fri, 31 Oct 2025 10:56:58 +0100 (CET)
Date: Fri, 31 Oct 2025 10:56:58 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251031095658.GT4068168@noisy.programming.kicks-ass.net>
References: <20251031120243.4394e6a8@canb.auug.org.au>
 <20251031092150.GS3245006@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031092150.GS3245006@noisy.programming.kicks-ass.net>

On Fri, Oct 31, 2025 at 10:21:50AM +0100, Peter Zijlstra wrote:
> On Fri, Oct 31, 2025 at 12:02:43PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (arm64 defconfig)
> > failed like this:
> 
> arm64-defconfig builds just fine on tip/master, must be some conflict
> with the arm64 tree or so. Let me go have a peek.

N/m, someone removed core/rseq already.. *sigh*

