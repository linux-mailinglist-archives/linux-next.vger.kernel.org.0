Return-Path: <linux-next+bounces-3843-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247DC9789E3
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 22:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67FCD1C22C81
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 20:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3861A146D59;
	Fri, 13 Sep 2024 20:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMbr6xew"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A03D1448F2;
	Fri, 13 Sep 2024 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726259080; cv=none; b=lyuAlExggDyb6eUft4+ZsBSMeFLJ3a9AprmKXkBc6R2Gtna/b2CUVRA07q7ccImyhcbkh8WO+BKYkOJxoetmtikwYmStn8pnlMtq9pfMLjdznf/KFGjO5se71QmnTLO/jG98cJI6tGwmNR1iVGR304ggTwxoXBjgIu50jJBEH8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726259080; c=relaxed/simple;
	bh=SLAQonTzL+ETpOKN32UdFXtUV4JfAqDvyG7i/mcZUuY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpfm7wamNd8lgKz9QBzJX2MotzM7KQkqBtwsxVKRRcPzXog2fEmKtgg+SLATdNTUMC5clG5TWOIzFeRQUpgGXh89O5dl1XWhdg/toHgaxA03U0CycLKHSaH8hQhFJwrP7v9GgCqdGulzSfvMUx431EC3mzPyEjPCviyAzPujwE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMbr6xew; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B63C4CEC0;
	Fri, 13 Sep 2024 20:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726259079;
	bh=SLAQonTzL+ETpOKN32UdFXtUV4JfAqDvyG7i/mcZUuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZMbr6xewxaHNK3ojM9J9pajyvXeWe5WgsUPGP70h8Yc4iy6AYb1YF3RogVna6Y43l
	 eX/Wjf3kxcl0yNJpZV4VHvb1N5Hq+IQW3OjMCY0AngOQVPcqbEK5sgh4QkYnkLwSgd
	 t8kqzXb3u07J+r4Xzx/qOMlPwkbxOln0ZBXWntIKo9gUC5AB7/3opz8rEuxyJrpMGX
	 jI66HLUDzuayUrQw/4C6+rUMQcRSw01t5/t03SACah6W8x1LwStSwZdXzWz2sFFlkv
	 VhQOhkT+iOxlhLl2A8Bra8P+gTU+BdYAqgpIdFnoFcSkze/BkELe5gkr45it+JfCBl
	 2QZv4LSzZaMfg==
Date: Fri, 13 Sep 2024 13:24:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Matthew Wilcox <willy@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, christophe.leroy2@cs-soprasteria.com, David Miller
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913132438.4235abe4@kernel.org>
In-Reply-To: <CAHS8izNSjZ9z2JfODbpo-ULgOcz1dGe5xe7_LKU-8LzJN_z-iw@mail.gmail.com>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<20240913204138.7cdb762c@canb.auug.org.au>
	<20240913083426.30aff7f4@kernel.org>
	<20240913084938.71ade4d5@kernel.org>
	<913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
	<CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com>
	<20240913113619.4bf2bf16@kernel.org>
	<CAHS8izNSjZ9z2JfODbpo-ULgOcz1dGe5xe7_LKU-8LzJN_z-iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 13:05:32 -0700 Mina Almasry wrote:
> Change, got NAKed:
> https://lore.kernel.org/netdev/ZuSQ9BT9Vg7O2kXv@casper.infradead.org/

Humpf.

> But AFAICT we don't really need to do this inside of mm, affecting
> things like compound_head. This equivalent change also makes the build
> pass. Does this look good?
> 
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 8a6e20be4b9d..58f2120cd392 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -100,7 +100,15 @@ static inline netmem_ref net_iov_to_netmem(struct
> net_iov *niov)
> 
>  static inline netmem_ref page_to_netmem(struct page *page)
>  {
> -       return (__force netmem_ref)page;
> +       /* page* exported from the mm stack would not have the LSB set, but the
> +        * GCC 14 powerpc compiler will optimize reads into this pointer into
> +        * unaligned reads as it sees address arthemetic in _compound_head().
> +        *
> +        * Explicitly clear the LSB until what looks like a GCC compiler issue
> +        * is resolved.
> +        */
> +       DEBUG_NET_WARN_ON_ONCE((unsigned long)page & 1UL);
> +       return (__force netmem_ref)page & ~1UL;
>  }

Hmm. Not really, the math this is doing is a bit of a cargo cult,
AFAIU the operation itself is meaningless. It works because it
achieves breaking the optimization/register chain in the compiler.
But the exact ALU op doesn't matter. So pretending LSB is meaningful 
could be confusing to the reader.

I think this will achieve the same effect without the spurious ALU
operations (apologies for broken whitespace):

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index a813d30d2135..b7e0acaed933 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -864,7 +864,11 @@ void page_pool_put_page_bulk(struct page_pool *pool, void **data,
        allow_direct = page_pool_napi_local(pool);
 
        for (i = 0; i < count; i++) {
-               netmem_ref netmem = page_to_netmem(virt_to_head_page(data[i]));
+               struct page *page = virt_to_head_page(data[i]);
+               netmem_ref netmem;
+
+               /* $explanation */
+               netmem = page_to_netmem(READ_ONCE(page));
 
                /* It is not the last user for the page frag case */
                if (!page_pool_is_last_ref(netmem))

If it makes sense could you polish it up and submit?

