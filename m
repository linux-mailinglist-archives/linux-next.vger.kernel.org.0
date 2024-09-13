Return-Path: <linux-next+bounces-3847-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D22BE978AF5
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 23:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624ED1F242E2
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 21:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D959185B52;
	Fri, 13 Sep 2024 21:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga52wdaJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3580A16F84F;
	Fri, 13 Sep 2024 21:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264524; cv=none; b=foDjkh7B7aDatEnhpbr36kaMWhuN7QFojsn1TYNM3bXxPegVRdg+T7h/HdreRujee089GHcOXyKNOy38zYQP3QiKcBZTb4AnUmfxMyz2MublgqAbSifo4IJLhrEA4+0Ht0jhrSYh6aEBoXAEtjMZtmhPJRS8uUxVxR5hwANbKRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264524; c=relaxed/simple;
	bh=u+MeCczZIYRaXjrE0FY2iIhDa3bIycs/8aC+H36FxAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TagWwzh8PngqwSEAK80ceLFgS47Nd4qKfEgf9r6+g9u1OI0ckiM9oMXfBjO0DQ85N2nnFLItCi+SsI4wpgR7cZe8JtSPJveVaF7MU7i4abiO7UQ1tHKwop5YmguQF9PAVT1VEVzKnO+jZ3C49QblBq9QWYnu87bj27jGc0BLR70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga52wdaJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2055136b612so33563845ad.0;
        Fri, 13 Sep 2024 14:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726264520; x=1726869320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c4PTjS5fX5Q389WHB/etaU28p0uL2TY5wkUk4Exja9I=;
        b=Ga52wdaJsZWAA/dqxHtDM8mjfPPeU7CzDAszxUUQhU6FybrcDpH1lEEEJNdyDqIz7X
         vAIfh2NyiJv9i9G3pln7mdG29AVeKfLal12X08mAP010NDAw9QDFvWgKVJ9Z6icWcQiT
         bg1ZlUzmRPIanFz+fAw4yYCt/kYBA8/UkVnk300jk3uB5sP/7N17H+XtfepUPqlOlCH+
         YLq7nwBaiczUdO/OPUgEjaGjnD81XtIpvRq9Xkf7Hz9MnmhMIHj8P/z5rbYG/9yochwY
         qhC2Yx49Lp2Non7FSE/iboN7bvWu1E05Aasl+B1HlU7W2aVpZNYUZRGO1wKDShaKmGVo
         APDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726264520; x=1726869320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4PTjS5fX5Q389WHB/etaU28p0uL2TY5wkUk4Exja9I=;
        b=fuR4WJkT82ZXhnzDNAnUwjZ25hLEz0XAPBq6q7EoNgM2nSAqvMI/hyPVAGaYppj3po
         WHvJTtfY3wa22sklbGI7Rc6eAdsOmlkdO9LSpjYMy6yHYatb3ZtonLT9dymzSkiOG0Xa
         8J+B9c2A0LUjU8thH3HHAzb3C1KoeEFG5ULPjv9Ilcs4EDCO9+GEFN/INXeUfTbhoVoH
         aWQ270CfNFRnAbyE5Gf0EX+hHlkgxkscLXaKzqOEr1mF7ETn5/mOIqCL3pX+no/VAR/s
         BJ1zg1ukmGdL9W2hLEiisp9ae0ftn2Ss+0bB9vNvmzPatEWdcenG/LqMeg4TKtzgeanU
         GqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuLUkTfS2781CePtm/ZyLC5CGYiI9kNF736G8afjzL8l44O/QpNYBMwr47cYVW891Jr2+i2iIskVdkcg==@vger.kernel.org, AJvYcCWeJ5Q3FJFu6jk4m1oYbe4s7wvWp0tRU9Y8p2pzzEZhkp9Dr+8ntdyiumsI37+LFhQWm2SPdgd7WT7RPhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1XuvLJHQoW7E24a6Su4Tlmc/OOShODiKTFAd+MjmvZvujgvBQ
	5p8U/Ib69iPtGTrBpd+yDv6FV3Lg/Y+FJ9W0Z0JsKt+v7N28vsM=
X-Google-Smtp-Source: AGHT+IH5BwiPmrclx07PBc1QAqEq+dk1qo/Lw7Ssd5LW8hV09kF4E4owLL0iuRHRj3mllCztINhnDQ==
X-Received: by 2002:a17:902:d510:b0:206:b4cf:3107 with SMTP id d9443c01a7336-2076e422055mr128280685ad.49.1726264520410;
        Fri, 13 Sep 2024 14:55:20 -0700 (PDT)
Received: from localhost ([2601:646:9e00:f56e:2844:3d8f:bf3e:12cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d668bsm845185ad.141.2024.09.13.14.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 14:55:20 -0700 (PDT)
Date: Fri, 13 Sep 2024 14:55:19 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
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
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <ZuS0x5ZRCGyzvTBg@mini-arch>
References: <20240913213351.3537411-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913213351.3537411-1-almasrymina@google.com>

On 09/13, Mina Almasry wrote:
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
> 
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

Are we sure this is the only place where we can hit by this?
Any reason not to hide this inside page_to_netmem?

diff --git a/include/net/netmem.h b/include/net/netmem.h
index 8a6e20be4b9d..46bc362acec4 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -100,7 +100,7 @@ static inline netmem_ref net_iov_to_netmem(struct net_iov *niov)

 static inline netmem_ref page_to_netmem(struct page *page)
 {
-       return (__force netmem_ref)page;
+       return (__force netmem_ref)READ_ONCE(page);
 }

 static inline int netmem_ref_count(netmem_ref netmem)

Is it gonna generate slower code elsewhere?

