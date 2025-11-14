Return-Path: <linux-next+bounces-8989-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E95C5CF92
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 12:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFDBA4EB4A3
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 11:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658433164B7;
	Fri, 14 Nov 2025 11:55:48 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5B316185;
	Fri, 14 Nov 2025 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121348; cv=none; b=dTvDRax4Lx/qDynDGSJ5LLLMpa/TlXeH4T6nUmP8m/nKKOJvSb1wGNbq9tkDjn1HjM92Yzq8hBi3f+Qg4WMae6DYnEiprptpjCUhuy+lwFfYKD0RYy7KEWbZD14yR46Mrg4fiQnjefoPN6WIrBnFAWNkRqBcConZDvbrCnYCN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121348; c=relaxed/simple;
	bh=+UGBWNYwRyQRcUo5UIIfkdNuWwLX2L8JCsTGh4XcKHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMH2VhJBjNzPjDjPU7ruNpIv9Cq5y0w+CblZoTakkxDvIpoFquJk3IzZzK+90TRz2EZkEa8S801ldCvS9FClhp8sIm5Z7Vf/1a7j/XSABOwbJUL+yVYvlT3UafoFYi+bllS/7kpyLT6Clq9BRdhKUnYD9RoF3s3VLNJE0bJPBXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 21A2F227A88; Fri, 14 Nov 2025 12:55:39 +0100 (CET)
Date: Fri, 14 Nov 2025 12:55:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Hellwig <hch@lst.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the slab tree with the mm-unstable
 tree
Message-ID: <20251114115538.GA13469@lst.de>
References: <20251114151321.092927a1@canb.auug.org.au> <20251114050605.GA26424@lst.de> <0d45f76f-19a8-4ea3-92b0-95b63474c9cd@suse.cz> <20251114094900-ca266dde-cf71-4536-882d-dcc8591fe6bd@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114094900-ca266dde-cf71-4536-882d-dcc8591fe6bd@linutronix.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 14, 2025 at 10:13:40AM +0100, Thomas Weißschuh wrote:
> We have the 'Context:' tag in kdoc. What about the following?
> 
> 	Context: Any context. Takes and releases pool->lock.

Which in this case would be ok.  But what about functions that take
non-irqsave spinlocks?

> I used the function in a tracepoint handler [0] and trusted its documentation
> to "never sleep". That turned out to be incorrect.

Heh, you'll find a lot of those..

> Also see the discussion on the patch submission [1] about just this point,
> where we didn't come up with better wording.

Can we please start a discussion on this on say linux-doc and
linux-kernel?  I don't really have a good answer, but this current
idea feels a bit lacking.  I don't meant that as trying to block
this patch, but I think we need to come up with a better convention.


