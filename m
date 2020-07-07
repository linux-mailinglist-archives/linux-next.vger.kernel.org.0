Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D757216306
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 02:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgGGAfX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 20:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgGGAfW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 20:35:22 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E313EC061755;
        Mon,  6 Jul 2020 17:35:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md7so2611057pjb.1;
        Mon, 06 Jul 2020 17:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=FRRksZf5+/NEkcn7a9u2MMQqVbOUSJFEbYbaDeSC7yM=;
        b=fcVEGPS17mlzUdipLWykzrVBUNoqyCYO+bI2yUhaB0fiuPKU2foIUV/xOU29yZqVao
         1dyJJjw2c7WMOTSmFYl8eH3SnefFcx2yINL27vZ2/84bIXRFhEwdJ0lfILDFHMTpTb7e
         qKSuvOl10W+kY+tOXf/QBZi9a9cWYh+62OnHgpzFyOiOXIo7UVCIVsTzBC6PEaCq/Z3t
         KJOb1j0ZBIJV1nhKEjw01kcspJ/jjnIwHIWEcu1jBFoZYMHnLGcak4n3bv58IKyU0qlF
         Lggzm84VjbzROrlmpU4N0S7WPg1LP7edjTnVAdXaStwrfb88Adcu3F0b/3A5GyG/W+7W
         0kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FRRksZf5+/NEkcn7a9u2MMQqVbOUSJFEbYbaDeSC7yM=;
        b=FU15JDAjeBwOZXuoAtBZ1mHvWaSL0U8+HK6S9o9r9qmr0KKqmL3P63T7JiopipmYAI
         iIIbXH583vMnp9yGuoplOgyO+gTvUlT13yxwGw7lUCdjlSjOVzxOodfA1vH8wWh8mc+9
         yb0API2i3Rc5dMwbk2atZI6ZjSqhry9sGR3Mg3ZMmmrtY+6HhZx/POmuO2HQPkq0T1Wu
         k5HnTjoSVz4UbNqHWpaPn/KfqFKddMtHU/Wq5XIZ1uJCawLIQ02O7AfQve7FIztm2ux/
         dagEVP2WMI/sKb2kO6lUnaw6COg3mbTw677dW9xt27VN3qUYum5/nMOKMpX4Q7ql5b20
         xwpg==
X-Gm-Message-State: AOAM532CMbwt5pxntthlzKoh3us6tPT4ZGxcqvZrQ8yQSfkCX7OTYOjY
        zd0Juz/bNOThT5x/v+lwGwfZaX87
X-Google-Smtp-Source: ABdhPJwDSh89ci7TZe1EYVyzJ+XrBVDcqUbQNYmH6Agq9krjdTYApBdBbbeL2aa2NrfiTKlY9PKe/Q==
X-Received: by 2002:a17:90a:1f87:: with SMTP id x7mr1627805pja.101.1594082122460;
        Mon, 06 Jul 2020 17:35:22 -0700 (PDT)
Received: from js1304-desktop ([114.206.198.176])
        by smtp.gmail.com with ESMTPSA id e15sm19702448pgt.17.2020.07.06.17.35.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2020 17:35:22 -0700 (PDT)
Date:   Tue, 7 Jul 2020 09:35:15 +0900
From:   Joonsoo Kim <js1304@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Jul 6 (mm/memory_failure.c)
Message-ID: <20200707003500.GA27886@js1304-desktop>
References: <20200706174001.2d316826@canb.auug.org.au>
 <d458c18d-9c5e-9c45-0d65-e317571b6d56@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d458c18d-9c5e-9c45-0d65-e317571b6d56@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 06, 2020 at 09:59:06AM -0700, Randy Dunlap wrote:
> On 7/6/20 12:40 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200703:
> > 
> 
> on i386:
> 
> when CONFIG_MIGRATION is not set/enabled:
> 
> ../mm/memory-failure.c: In function ‘new_page’:
> ../mm/memory-failure.c:1688:9: error: implicit declaration of function ‘alloc_migration_target’; did you mean ‘alloc_migrate_target’? [-Werror=implicit-function-declaration]
>   return alloc_migration_target(p, (unsigned long)&mtc);
>          ^~~~~~~~~~~~~~~~~~~~~~
> 
> 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Hello,

Thanks for reporting.

Below is the fix for this error.
Andrew, Could you squash this fix into the patch,
"mm-migrate-make-a-standard-target-allocation-function.patch"?

Thanks.


------------------->8-------------------
From 5fac269125dfb2d03e38a75319305e0e70b23a4b Mon Sep 17 00:00:00 2001
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Date: Tue, 7 Jul 2020 09:16:58 +0900
Subject: [PATCH] mm/migrate: fix for
 mm-migrate-make-a-standard-target-allocation-function.patch in mm tree

new_page_nodemask() is renamed to alloc_migration_target in
mm-migrate-make-a-standard-target-allocation-function.patch, but,
one declaration for !CONFIG_MIGRATION case is missed. This patch fixes it.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Joonsoo Kim <iamjoonsoo.kim@lge.com>
---
 include/linux/migrate.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 5e9c866..cc56f0d 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -60,8 +60,8 @@ static inline int migrate_pages(struct list_head *l, new_page_t new,
 		free_page_t free, unsigned long private, enum migrate_mode mode,
 		int reason)
 	{ return -ENOSYS; }
-static inline struct page *new_page_nodemask(struct page *page,
-		int preferred_nid, nodemask_t *nodemask)
+static inline struct page *alloc_migration_target(struct page *page,
+		unsigned long private)
 	{ return NULL; }
 static inline int isolate_movable_page(struct page *page, isolate_mode_t mode)
 	{ return -EBUSY; }
-- 
2.7.4

