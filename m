Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CA320B9F8
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 22:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgFZUH4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 16:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFZUHz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2020 16:07:55 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0923CC03E97B
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 13:07:56 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id t11so220119pfq.11
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 13:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=rHOsQnFow9W840xshXf2xfNnPEJVNN56X5OCKvatOzc=;
        b=O1o8GaHMP5dsVMNrT+KaSdj+Cb9ib0h6L+CH70DoWS18/VdJXbuH3MqWxoarxbltgf
         9hqSJ7UZ0CHVc+r7XcLBCbzl4RMaKaTYV2GzT8d7aP5yg1A2C4iPLgzgAx6iszB9UWWq
         7bLvYkt1y57I9p+8bV+wJcxmRsOeoHMBs0tZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rHOsQnFow9W840xshXf2xfNnPEJVNN56X5OCKvatOzc=;
        b=rM+MWYZgHwEHptanxTIFX+PKr1wYWv1cosrbju0s32k4T8VzczRJFUlg3n3mjmr51h
         HJCvALnFm/zMcpxzsA2wwWCEr1iDj0+UO7r6EMervQNls1UEaTGz8hxka+3Sgnf7zM2e
         r5cmyXViV9ETj7GARRulZ+ujArfLsOGoXFoSMOlZ6uGXZQNq9WdBfTcQDSYE4orZU/c+
         9T3laRj5/ck3/1iJge5Gf0FbTd1JvQ4legOAA9nyeKxCSpnbQP3Q1hX7fGhfUjR4frLe
         9X89G3ssJdhOIR20xOWrtR271Bi2ASXPVlnku/iBU5r5Jt4TNPz2pGvHAjxc/zN3nazR
         H2ow==
X-Gm-Message-State: AOAM531S0APqbNQF3Kk3cWKYOnD1pz1NFxQqdaoVmQnob/qIxCl08umG
        KkOfo5lSxVQVvCUMFSOSkL3qfQ==
X-Google-Smtp-Source: ABdhPJzhZjWKtrGEMaI8byUSdrVEOM1KRfW4lUX66uoeR6p2vSSKp4YijRN8kDnSI5dkSRP37/P6Cw==
X-Received: by 2002:aa7:8c03:: with SMTP id c3mr4048300pfd.77.1593202075575;
        Fri, 26 Jun 2020 13:07:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n1sm12409458pjn.24.2020.06.26.13.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 13:07:54 -0700 (PDT)
Date:   Fri, 26 Jun 2020 13:07:53 -0700
From:   Kees Cook <keescook@chromium.org>
To:     akpm@linux-foundation.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, broonie@kernel.org,
        mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
Subject: [PATCH] slab: Fix misplaced __free_one()
Message-ID: <202006261306.0D82A2B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The implementation of __free_one() was accidentally placed inside a
CONFIG_NUMA #ifdef. Move it above.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/lkml/7ff248c7-d447-340c-a8e2-8c02972aca70@infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
This a fix for slab-add-naive-detection-of-double-free.patch
---
 mm/slab.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/mm/slab.c b/mm/slab.c
index bbff6705ab2b..5ccb151a6e8f 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -588,6 +588,16 @@ static int transfer_objects(struct array_cache *to,
 	return nr;
 }
 
+/* &alien->lock must be held by alien callers. */
+static __always_inline void __free_one(struct array_cache *ac, void *objp)
+{
+	/* Avoid trivial double-free. */
+	if (IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) &&
+	    WARN_ON_ONCE(ac->avail > 0 && ac->entry[ac->avail - 1] == objp))
+		return;
+	ac->entry[ac->avail++] = objp;
+}
+
 #ifndef CONFIG_NUMA
 
 #define drain_alien_cache(cachep, alien) do { } while (0)
@@ -749,16 +759,6 @@ static void drain_alien_cache(struct kmem_cache *cachep,
 	}
 }
 
-/* &alien->lock must be held by alien callers. */
-static __always_inline void __free_one(struct array_cache *ac, void *objp)
-{
-	/* Avoid trivial double-free. */
-	if (IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) &&
-	    WARN_ON_ONCE(ac->avail > 0 && ac->entry[ac->avail - 1] == objp))
-		return;
-	ac->entry[ac->avail++] = objp;
-}
-
 static int __cache_free_alien(struct kmem_cache *cachep, void *objp,
 				int node, int page_node)
 {
-- 
2.25.1


-- 
Kees Cook
