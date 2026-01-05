Return-Path: <linux-next+bounces-9543-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C86CF4B74
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 17:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 918FE308AF10
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 16:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE0F3054C7;
	Mon,  5 Jan 2026 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OJCh75EC"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7452F88;
	Mon,  5 Jan 2026 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767629289; cv=none; b=DOQ38v4uix/Lkg/lqffTkZCJoBU5yE+gwBqVbQ0gPSpOnUCcXO3meJ4NmnTVn7vMjxP0gq0s7HDqXskDsml1gQCBWYg59dIRBZgnoFKb+zozHFlX+BhJrkVcrLHy6W1JS881W6roEXUWB8xFMsd9iCvmlVX5B92ptpjrmvl1XwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767629289; c=relaxed/simple;
	bh=7lgEQSsnT42EUGV1Bj9jkcpbrnMcDYj425yn5aSiU/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8agdsoWHxM4yzbtJmQtcjqUrBIPDLsNPFs5/v2rB8jOX7d0HNyEytSyUAZ4cDibHfs/sBvngbC9ikQT1Fz9RQkLYsFqHeiO7RSG+AVpPouYhFayClwAShNOC4kYTf/oquWZbTVPIONr8uDxV5BS3wndSDCrga/yLfmAoOcYmhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OJCh75EC; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3xGG1j0Tpe3YTwwy4um25JZwbfKElSF19Nugb/Hs3KA=; b=OJCh75ECOgxt1Xmg97VNjk07N2
	ZNxvsxZ3NtH2b5was/xsBcKfog6mcMFcQsbHn7d1PTfGFMQHNA04S+L9kLrB1MLFVEicWL7bQGr7W
	b3Yt6arrAXxAaE7rO6V3cIzqicuurcxPOTiTH0A+WL/XAXM+tFufE2J4axYfCLGmuKO0T4MEgbBC7
	0Wggz5aeebJaYs7+iiMwXR0fTvC9/7yyugERrN4g+PgPOnbG6GSbBPgwnPr6V78e8MYbwsPAJUr0/
	JYFZfyIjpl/NAeD1fFN370964xO5/4Ux9XhHywhekGcXbdkcaR3HOcE8wSJa1CxLGbFFyk3sGOzeT
	LM8i9W1Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcn7i-00000008WJ1-3GPn;
	Mon, 05 Jan 2026 16:08:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B3C17300E8E; Mon, 05 Jan 2026 17:08:01 +0100 (CET)
Date: Mon, 5 Jan 2026 17:08:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Finn Thain <fthain@linux-m68k.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 mm-nonmm-unstable tree
Message-ID: <20260105160801.GB2393663@noisy.programming.kicks-ass.net>
References: <20260105084320.3efe68d2@canb.auug.org.au>
 <20260104173009.72c9689ae6f8c2ea81cbf11b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104173009.72c9689ae6f8c2ea81cbf11b@linux-foundation.org>

On Sun, Jan 04, 2026 at 05:30:09PM -0800, Andrew Morton wrote:
> On Mon, 5 Jan 2026 08:43:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Commit
> > 
> >   3d73f718d762 ("atomic: add alignment check to instrumented atomic operations")
> > 
> > is missing a Signed-off-by from its author.
> 
> yup.  iirc, Finn has asked Peter to send us a signoff for this.

Replied to some recent posting there -- that patch doing wrong.

