Return-Path: <linux-next+bounces-3859-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D397965B
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2024 12:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EDCFB221E2
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2024 10:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626771C57B2;
	Sun, 15 Sep 2024 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oWxm+dE8"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27A51C4629;
	Sun, 15 Sep 2024 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726397105; cv=none; b=kIkW8/nQGTFwG06yJUl0j5jcz90E0CDFJzbC6ppqbObvKnUGWYm2b6aCZ+SL4azoq18Wb1RipylWcAmTI0fSCgHDGDNNabDG0UbySZtpats1eXyrjG6O+aqegYADHqTzFMMol+h2qb3eboEnhbw+hHLkBe3+IfImkac/uO48HJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726397105; c=relaxed/simple;
	bh=X4mG8EpX4HqvMXYAt/53K1k0A5KjSGQdsMrw3GWYxyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIHscv4UcuXYnsx5CaFTIU6aNIKGK7Ss/CnKieHVHklx4pBAKT8YaaPmmnprCsERNqtGMYZLLa+AobWpmRrpnq93Cogw8VxK263YI6piLL+YhncoBGFBd2NseT4Yc0VsGAuwgM94iehfujN6wc56L6znlibqaT1OkS84eByErvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oWxm+dE8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jqW6okUGofPnWuzoo94v770ZzhF41RU9ioXhQiBiADc=; b=oWxm+dE83ehjHDkC7vek7mEFiO
	4Fd/ZzJSkXmdu7kWTjRE8XjS4Mor/2mmkjzLs16r29mC1r92/tXTUkDnya0gJCQrQfySHPtcBc3VE
	l7MvfdVO0pZCawsjTrE/tEwuKoLdcNZrWs+a93Rt+C2kQCNHlzZ8ddxaAmNho+Lcf/4zJNvtAenBb
	Ll8o/kItLA+lgBFsnay7as5MVqaZbWdhGBmWi3L+TlJ7BReAeIH1LW6INPmwMMTo9Jcbn+jT/ml0g
	CuyvWXdC5NAO0YS+9Ehg1PhgeT9vEcO/d6Q6CqP3RY3F0jg/q7CDOyXYM73vTC//b9LyCXY95KMmW
	6gmz3KrQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1spmkU-00000000ktC-1OaC;
	Sun, 15 Sep 2024 10:44:58 +0000
Date: Sun, 15 Sep 2024 11:44:58 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jakub Kicinski <kuba@kernel.org>,
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v1] mm: fix build on powerpc with GCC 14
Message-ID: <Zua6qtUCG84236gp@casper.infradead.org>
References: <20240913192036.3289003-1-almasrymina@google.com>
 <ZuSQ9BT9Vg7O2kXv@casper.infradead.org>
 <30e8dee7-e98e-42cb-aab3-6b75f1a6316d@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30e8dee7-e98e-42cb-aab3-6b75f1a6316d@csgroup.eu>

On Sat, Sep 14, 2024 at 08:50:46AM +0200, Christophe Leroy wrote:
> Hi,
> 
> Le 13/09/2024 à 21:22, Matthew Wilcox a écrit :
> > On Fri, Sep 13, 2024 at 07:20:36PM +0000, Mina Almasry wrote:
> > > +++ b/include/linux/page-flags.h
> > > @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const struct page *page)
> > >   {
> > >   	unsigned long head = READ_ONCE(page->compound_head);
> > > -	if (unlikely(head & 1))
> > > -		return head - 1;
> > > +	if (unlikely(head & 1UL))
> > > +		return head & ~1UL;
> > >   	return (unsigned long)page_fixed_fake_head(page);
> > 
> > NAK, that pessimises compound_head().
> > 
> 
> Can you please give more details on what the difference is ?
> 
> I can't see what it pessimises. In both cases, you test if the value is odd,
> when it is odd you make it even.

On x86, for example, it is perfectly valid to load a 64-bit value from
an offset of 0x2f relative to a pointer.  So there's no need to make it
even.

