Return-Path: <linux-next+bounces-3841-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E49788D8
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 21:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C108B207CF
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 19:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD3F13212B;
	Fri, 13 Sep 2024 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="USrHQTI1"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B481ACA;
	Fri, 13 Sep 2024 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255355; cv=none; b=aPDpt5vafuIt2lbqI6e5yCrFWdBRX/z60PfH1/y2Pc9vzC/Z1t/ibfkIqCzxACjtLAHVW2sJ/H7qLJyL32opi3WSUFN3ZEyzqt0XdGnjnJswugjKZ+ImlJOEpdFmZdrZVwS4xDHMhX5rZ3OWl7Y66TOxFO0UElZ2U40IDLabcPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255355; c=relaxed/simple;
	bh=UhC9Wx94GdMSP1xhxtHlYToL70sJ3oyaQWnk2b+eu4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMiJpRna/VFhqaK//lpOxn5UpVPRRK8nIL6ZX2el6vuNe07EAtW0CwnO+by0sgITrk2pjtfWkSXCNVJkSSXUGriGlJWPx9M/ByamFHHu9xVHF8IYi/jUmoE0olwXgzrgfxHOj7991SZUEjbkUg6uojGfeZHLlaRK4QjI6UAthdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=USrHQTI1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Lj/20hT1fbEbqfuXUYTZnnoIn58aQxQZGwFa+ktq7nI=; b=USrHQTI1gAhLcewwZyHVEmvH+2
	TNfnavn0WmWrViQukWcWKUEDmPzjkL0xEn1n8BhzZwM9T+pwhTzsxu91hYIN57ewocp9cvGn/UA9h
	nDPIR2H17TcSfPO62NYQFrX+48iHo8fHvr6GrMEtD8iooOIvFUsMxuKi87bCzAB34fqozCVoNjSNC
	cpOr1cYF4oyo7BePpJi8MDiU+JbLFkyunDgG7G5HXPIm3h1euuqWGrhgPNe7+s9uz06ECd2yN2e2B
	aBqS8T/VdHWgpwDvegaDqeaa/dxE/40oEXpmQ0ir9IEHYYp5g05SJG4iHMwNc/A4JtR8h5YehcBCc
	O4d4pjaA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1spBsC-0000000GuqH-2j63;
	Fri, 13 Sep 2024 19:22:28 +0000
Date: Fri, 13 Sep 2024 20:22:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jakub Kicinski <kuba@kernel.org>,
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Subject: Re: [PATCH net-next v1] mm: fix build on powerpc with GCC 14
Message-ID: <ZuSQ9BT9Vg7O2kXv@casper.infradead.org>
References: <20240913192036.3289003-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913192036.3289003-1-almasrymina@google.com>

On Fri, Sep 13, 2024 at 07:20:36PM +0000, Mina Almasry wrote:
> +++ b/include/linux/page-flags.h
> @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const struct page *page)
>  {
>  	unsigned long head = READ_ONCE(page->compound_head);
>  
> -	if (unlikely(head & 1))
> -		return head - 1;
> +	if (unlikely(head & 1UL))
> +		return head & ~1UL;
>  	return (unsigned long)page_fixed_fake_head(page);

NAK, that pessimises compound_head().

