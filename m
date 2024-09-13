Return-Path: <linux-next+bounces-3846-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B5A978AEB
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 23:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 976A81F24551
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 21:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58963155A5D;
	Fri, 13 Sep 2024 21:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BftAYHJv"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC56154BEC;
	Fri, 13 Sep 2024 21:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264520; cv=none; b=HNFiSW3+M6csNNhXHxF08uh+ameGMMRrYvloKAwuAwpkBG3eLnyuP0v/z2oj2Mwdn1vKyAiL7X5koimFMD1fs3dgzIPw99IXYaiJbKGVEQCeH2GtqBKP3O2f12KYBftf8Cx5sRARMQHfTKU5TIAAdnjk9aESrcNYf7YSRoVgoeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264520; c=relaxed/simple;
	bh=PXZ5bq/R8wismh4l/7Ni+PqfNAENhrhH2dY2aSjTRRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIuEca9d1kz7FV/fpQc7haKhdgverA3szNeaWYt+qIrFjgyYMcYxPIN6RzWajBwttjpPHbXIh8tE91YMKG21I9ansV8PSaHv9z9K6zfhdTl4BCzJpJrMGjTA2TKmsW4o4CSO/E6KfruJw0M4+eSBTELVMwVDnQwiRJC8EDcB7XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BftAYHJv; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pYcOiVSFtM6gAUc1DuIBW9ANECfcrc43mQXwHg/pSfc=; b=BftAYHJvgSREGkU7w+OrOJ9pNl
	l5QOEIvyUe0WReLuZVt+hsrsrsGdc7P9VrJN2u7GJDVsyZxaN2ANANJDephGlR1Nnfg2TKalfM7/o
	IFN2mXqLRjEM4HS6WB8JVjVI6U+VDt+AyItBtOUZc4tpXtDNsKGkRhEo4SAcrpwy4nKJ/BzKUL3L4
	oJwTH5wPCpm4CFi3OUFyTE3VGU5IOWXoE4cdhKjkyMiIVxufCwC5J6+jz/eHYJ3jEnV3OAJV8fACB
	KjzfCS9qsu8m7590IaTeefwPOVOkbtU0fsOWV8k39vRqByFMlVqLcq8VbHgE5Jljv1YpJJZ1RB11T
	6Zs++nPg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1spEG0-0000000H1xl-29kX;
	Fri, 13 Sep 2024 21:55:12 +0000
Date: Fri, 13 Sep 2024 22:55:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <ZuS0wKBUTSWvD_FZ@casper.infradead.org>
References: <20240913213351.3537411-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913213351.3537411-1-almasrymina@google.com>

On Fri, Sep 13, 2024 at 09:33:51PM +0000, Mina Almasry wrote:
> Building net-next with powerpc with GCC 14 compiler results in this
> build error:
> 
> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> not a multiple of 4)
> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> net/core/page_pool.o] Error 1
> 
> Root caused in this thread:
> https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/

It would be better to include a direct link to the GCC bugzilla.

> We try to access offset 40 in the pointer returned by this function:
> 
> static inline unsigned long _compound_head(const struct page *page)
> {
>         unsigned long head = READ_ONCE(page->compound_head);
> 
>         if (unlikely(head & 1))
>                 return head - 1;
>         return (unsigned long)page_fixed_fake_head(page);
> }
> 
> The GCC 14 (but not 11) compiler optimizes this by doing:
> 
> ld page + 39
> 
> Rather than:
> 
> ld (page - 1) + 40
> 
> And causing an unaligned load. Get around this by issuing a READ_ONCE as
> we convert the page to netmem.  That disables the compiler optimizing the
> load in this way.
> 
> Cc: Simon Horman <horms@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: David Miller <davem@davemloft.net>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Networking <netdev@vger.kernel.org>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
> 
> v2: https://lore.kernel.org/netdev/20240913192036.3289003-1-almasrymina@google.com/
> 
> - Work around this issue as we convert the page to netmem, instead of
>   a generic change that affects compound_head().
> ---
>  net/core/page_pool.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index a813d30d2135..74ea491d0ab2 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -859,12 +859,25 @@ void page_pool_put_page_bulk(struct page_pool *pool, void **data,
>  {
>  	int i, bulk_len = 0;
>  	bool allow_direct;
> +	netmem_ref netmem;
> +	struct page *page;
>  	bool in_softirq;
>  
>  	allow_direct = page_pool_napi_local(pool);
>  
>  	for (i = 0; i < count; i++) {
> -		netmem_ref netmem = page_to_netmem(virt_to_head_page(data[i]));
> +		page = virt_to_head_page(data[i]);
> +
> +		/* GCC 14 powerpc compiler will optimize reads into the
> +		 * resulting netmem_ref into unaligned reads as it sees address
> +		 * arithmetic in _compound_head() call that the page has come
> +		 * from.
> +		 *
> +		 * The READ_ONCE here gets around that by breaking the
> +		 * optimization chain between the address arithmetic and later
> +		 * indexing.
> +		 */
> +		netmem = page_to_netmem(READ_ONCE(page));
>  
>  		/* It is not the last user for the page frag case */
>  		if (!page_pool_is_last_ref(netmem))
> -- 
> 2.46.0.662.g92d0881bb0-goog
> 

