Return-Path: <linux-next+bounces-9114-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A57C74457
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 14:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 3FBF731952
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 13:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C31421ADC7;
	Thu, 20 Nov 2025 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jMp9XL2h";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I/TmUceP"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495D258EFC;
	Thu, 20 Nov 2025 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645471; cv=none; b=LijkvSXzcBtioVra6YZduGahkT3KO+dFyRGAzPtgB8xfc9RIPBvJCiXfLFUiqwMCujfxr3glBpqL3QeU+Fmum8tgWBgdp9GN6cEqknn0BCUZVZuqfrj4LUzsxO1uqpqs5wTpDuoAYPAZu6gPEwGNy/GI/4xM65nyfMrWoEV9rFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645471; c=relaxed/simple;
	bh=zkw6izzbP0dr7Ty/YbR7/eL79r1erGzuVlGDG7WU4Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r02wv7Ln3RSIYN1uLBXm6iK2MS7sOz8GMGUKSWGnrVRIXI4nfAmcSEJLJXJLjGHj2JF6jOotMRwbQJgtGLPbB2H9A2+VAgnL6KH3ub6TGJy3cMHG2LrifN3oTHE7WXyx6d1qSX/my7g0uIPyGIU4+tBtfGzoQ1m/HdoLsfl/voU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jMp9XL2h; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I/TmUceP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 20 Nov 2025 14:31:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763645467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hCbrUrzpbAoKwRJPHL0ClWpD7mmQUJR8NRvLYgXTh6o=;
	b=jMp9XL2hK02ao8MdZ3xaXjh+fqTPDlfPJXk7AjV0w0d5zaMSf+7yzbnaFe1ofvQQx1DK52
	fWky99qMgWEjSvKGsBl1iAgSZbtZwGR0KGoKN6mrmnHw+A4vA5KS3xSZW9t8RMB2pTKoO9
	mlLrUIKD2ma9myX3ciZ9obxmOiIeI9xs2taBu0VqDxTnbmHynhLwZc7pK6+m7cnVZzdAE6
	vBOK0Ltlz3x1NpWv3ZGHkzrgm6DrIOSmnMp+/Wwk22LQ556yXJxSTFQLgrW3wJ4ZzsmukQ
	k/vcxT5IgxXcP2bBAnojPPjL9u759OGV+dsd8iFUq1w8qWcXYDnJ4xEcWkSDRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763645467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hCbrUrzpbAoKwRJPHL0ClWpD7mmQUJR8NRvLYgXTh6o=;
	b=I/TmUcePQYIkLo7le7HNttTXNiR8yAWjde7eyyWUzAXerJNYDtLm9+m4uVtnX0qZMKRWjQ
	poBuA1MNnlz8DSAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Vlastimil Babka <vbabka@suse.cz>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the slab tree with the mm-unstable
 tree
Message-ID: <20251120142801-5011951e-0623-434b-99fe-b231a481ec87@linutronix.de>
References: <20251114151321.092927a1@canb.auug.org.au>
 <20251114050605.GA26424@lst.de>
 <0d45f76f-19a8-4ea3-92b0-95b63474c9cd@suse.cz>
 <20251114094900-ca266dde-cf71-4536-882d-dcc8591fe6bd@linutronix.de>
 <20251114115538.GA13469@lst.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114115538.GA13469@lst.de>

On Fri, Nov 14, 2025 at 12:55:38PM +0100, Christoph Hellwig wrote:
> On Fri, Nov 14, 2025 at 10:13:40AM +0100, Thomas Weißschuh wrote:
> > We have the 'Context:' tag in kdoc. What about the following?
> > 
> > 	Context: Any context. Takes and releases pool->lock.
> 
> Which in this case would be ok.  But what about functions that take
> non-irqsave spinlocks?
> 
> > I used the function in a tracepoint handler [0] and trusted its documentation
> > to "never sleep". That turned out to be incorrect.
> 
> Heh, you'll find a lot of those..

Yeah... But people are working on fixing them.

> > Also see the discussion on the patch submission [1] about just this point,
> > where we didn't come up with better wording.
> 
> Can we please start a discussion on this on say linux-doc and
> linux-kernel?  I don't really have a good answer, but this current
> idea feels a bit lacking.  I don't meant that as trying to block
> this patch, but I think we need to come up with a better convention.

Make sense. Right now I don't really have the capacity to see this through,
but hopefully I get to it later.
My patch not really critical, so if it gets in the way it can be dropped.
Nearly nobody is using this function anyways.


Thomas

