Return-Path: <linux-next+bounces-8984-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC69C5B5BA
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 06:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC4F6355688
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 05:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A757F2D0605;
	Fri, 14 Nov 2025 05:06:13 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AF2199230;
	Fri, 14 Nov 2025 05:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763096773; cv=none; b=ltsH+XsWG3uhx151OAUePPjf16f2s1bCH3VJuf6lcc7/lBL9pmJtB19a6TILo6rppDRrTDgovmhetSiRY4ZVy5RoOqcPCnFJxZyrRl43JruV6Nq8dv1ytq7L3MD4jEvET9veH0PQ9PQC+0WoPOfxtM9JtEsH8FrLsATa3e5r+l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763096773; c=relaxed/simple;
	bh=lbbWlFD7nYCaO1wPbuUBMU3EPsrg0g+VAfblchlnrzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3xf7M6qqiLruNJGCl8vRoHIS8GfN3fB6u6CELP3dxHD8/NZa9M+aKImkkAS0QZH5xfZXpWZAff4rzIL5dYQ4Gt/2YKwSQJOrFFKAdIduRW4UE/N5eHOx9YCuv/NKnMUaIJMzZuk0VvOdCoun79Kc8RR7TW2oDbcHMYY1QNFzKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 32ABF227A88; Fri, 14 Nov 2025 06:06:05 +0100 (CET)
Date: Fri, 14 Nov 2025 06:06:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	"Cc: Andrew Morton" <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: linux-next: manual merge of the slab tree with the mm-unstable
 tree
Message-ID: <20251114050605.GA26424@lst.de>
References: <20251114151321.092927a1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114151321.092927a1@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 14, 2025 at 03:13:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the slab tree got a conflict in:
> 
>   mm/mempool.c
> 
> between commit:
> 
>   25c4d8d29dbb ("mempool: clarify behavior of mempool_alloc_preallocated()")
> 
> from the mm-unstable tree and commit:
> 
>   5c829783e5f8 ("mempool: improve kerneldoc comments")

Hmm, I guess we need to agree on which tree takes mempool patches, then
we can just rebase one side.

I also find 25c4d8d29dbb odd.  Yes, with PREEMPT_RT anything taking
spinlocks could sleep in the normal sense, but pretty much everything
in Linux assumes spinlocks as spinning.  So if we want to update that
we should agree on global conventions for it and not starting to update
random little functions individually.

