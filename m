Return-Path: <linux-next+bounces-3844-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18E978AAA
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 23:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D17691C23151
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 21:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37C4156C62;
	Fri, 13 Sep 2024 21:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QoFQYjQl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ADF149C4A
	for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263236; cv=none; b=e6yJZkME50kT8x02arDjUpD6E+XXrd/jDFmiwkPGgj1wdOCBIBxHy8Dq3osF+NruvRt56ERimL9PMWNj6TPyS1WP/MGZ/SiYsCWRscTDA5Pm/UgN/gXMfCafqmcl9c/H5hNi+qe8A8IGU2r+BD6RqY+nameeMHim/x1pLvrhwkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263236; c=relaxed/simple;
	bh=MkfVfrMFBKZhPzzuv+Q0xVR3iXUZ+B4XFBxm6rOnls0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OeLZ0E/tKP909Zt8e2mupHUTrOMdYbGL3xllJi+AydWy1T9jj1dP45IJabHXK/+rlzBtqfz9z3BA93H0vDQpwUCZh+Z78hH3ciLFsruRhepiKduB5EU9Obavx1gvq+FQbKneiJP2ZrFRnIAdcYi2ZdzFsWyji/d8HwAgG9d5BZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QoFQYjQl; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e178e745c49so3683310276.2
        for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 14:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726263234; x=1726868034; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C2T8h7PkrQu/P499dIgiz7AXqfHfFO+K5APloBO//pM=;
        b=QoFQYjQl1+5kVQKjtEzm2JVSsopQvSglmU5Q7R2QcEcycNjdPMo01NbasT8U4dK3aq
         7Vm+wXO5bhQb4dvmaSC1UyigjIy4S7d4zdt5qgWi0kZHi7R9uNlthux8EdlLOwAn3RWS
         kk99W1ntSiv5iC1w3bl6ge6YaZjGdJrxaYBi1TkxiqrnRsLk0KWwJbFp4VpKm8/LWpL4
         ai27a1ZQhcohisdk6R6F4RzOus4paD7pdZPZoJvywfe1Ps5TdxP0uIcaFLsgot7y5Wia
         tja+8MJ4xYy2SKDwU/F9M0Y4mPF/GiEK1/0zM6faXGsc9bFnQ0S3ccQRSlRncCUdKV0Y
         s7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726263234; x=1726868034;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2T8h7PkrQu/P499dIgiz7AXqfHfFO+K5APloBO//pM=;
        b=GbxF8qI9AMDUJQ7Tzqmhi30XVOR2xKDu5q6tn/IYa9P2wWbHmTn93sroFooy6mGevH
         jGBT8ShtPrOXTw9fsx4rGCRBJmMlP/7mfwBiGAFL1FyYOrzGUuk9LWxmcJujpF7K3z13
         HILAcx1//fAF/rqTOifE9g6Bd/iCBofy0+eI1bDDURzu2TbCPIzzvwDpeqECRS2GysRD
         KTVZEapL1pIB0+6NE0sinQf4Wx4cBGE/85nflDeiI65Vzo/VRr8HstvXPLjMkGMAZSzJ
         J7Chbm1xdf/daMWjqhq2GhaaMwru7IQeM4MYcPReDZZUzeaxBHqO3up3N4SZK3DmnAcj
         9bsA==
X-Forwarded-Encrypted: i=1; AJvYcCWaY7w20WBexQGinX2DxTmdCaLqmQquDrr8QvOi5yQc6kgpbU+K2R/6V9rWc76eC+pGNhfqcqVYh+XS@vger.kernel.org
X-Gm-Message-State: AOJu0YyvvrnaY7dN75DqWxfl7j8oAOyfb8MiLMrErwPYFPM9yvw1XeWK
	5xow3mXZH9J76VsJS5M8eLUOU+0etMDWW1ueiGLgrH5USEaiw21QV5rXWUpWfoQo1wuci++JcSA
	/KjW/rVdFzBXDkEm/BZ2zKQ==
X-Google-Smtp-Source: AGHT+IGKRzJx5PjSFO3E8tqWdgVC95OAYqJ2OCpdJ9chaj4/FshFhL9QqOypm1YXq6OH+fxO5D7luhUe9GMEMnCStg==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a25:cec3:0:b0:e1a:44fa:f09 with SMTP
 id 3f1490d57ef6-e1d9db95493mr10461276.2.1726263233997; Fri, 13 Sep 2024
 14:33:53 -0700 (PDT)
Date: Fri, 13 Sep 2024 21:33:51 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240913213351.3537411-1-almasrymina@google.com>
Subject: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Building net-next with powerpc with GCC 14 compiler results in this
build error:

/home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
/home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
not a multiple of 4)
make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
net/core/page_pool.o] Error 1

Root caused in this thread:
https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/

We try to access offset 40 in the pointer returned by this function:

static inline unsigned long _compound_head(const struct page *page)
{
        unsigned long head = READ_ONCE(page->compound_head);

        if (unlikely(head & 1))
                return head - 1;
        return (unsigned long)page_fixed_fake_head(page);
}

The GCC 14 (but not 11) compiler optimizes this by doing:

ld page + 39

Rather than:

ld (page - 1) + 40

And causing an unaligned load. Get around this by issuing a READ_ONCE as
we convert the page to netmem.  That disables the compiler optimizing the
load in this way.

Cc: Simon Horman <horms@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: David Miller <davem@davemloft.net>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: Matthew Wilcox <willy@infradead.org>

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v2: https://lore.kernel.org/netdev/20240913192036.3289003-1-almasrymina@google.com/

- Work around this issue as we convert the page to netmem, instead of
  a generic change that affects compound_head().
---
 net/core/page_pool.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index a813d30d2135..74ea491d0ab2 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -859,12 +859,25 @@ void page_pool_put_page_bulk(struct page_pool *pool, void **data,
 {
 	int i, bulk_len = 0;
 	bool allow_direct;
+	netmem_ref netmem;
+	struct page *page;
 	bool in_softirq;
 
 	allow_direct = page_pool_napi_local(pool);
 
 	for (i = 0; i < count; i++) {
-		netmem_ref netmem = page_to_netmem(virt_to_head_page(data[i]));
+		page = virt_to_head_page(data[i]);
+
+		/* GCC 14 powerpc compiler will optimize reads into the
+		 * resulting netmem_ref into unaligned reads as it sees address
+		 * arithmetic in _compound_head() call that the page has come
+		 * from.
+		 *
+		 * The READ_ONCE here gets around that by breaking the
+		 * optimization chain between the address arithmetic and later
+		 * indexing.
+		 */
+		netmem = page_to_netmem(READ_ONCE(page));
 
 		/* It is not the last user for the page frag case */
 		if (!page_pool_is_last_ref(netmem))
-- 
2.46.0.662.g92d0881bb0-goog


