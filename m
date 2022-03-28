Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44F2B4EA0DB
	for <lists+linux-next@lfdr.de>; Mon, 28 Mar 2022 21:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242243AbiC1T7L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Mar 2022 15:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343916AbiC1T7G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2022 15:59:06 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31767673F9
        for <linux-next@vger.kernel.org>; Mon, 28 Mar 2022 12:57:24 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id t7so13380884qta.10
        for <linux-next@vger.kernel.org>; Mon, 28 Mar 2022 12:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version;
        bh=NGspnAFOzJSoDZcuTuDayNTMlf+9yY8D8Ve789Ll0sM=;
        b=jkm+7pi2evYjUioD24kEJ4jw5PSVqdjUsYal52RTsLOFxeM/JoTW0tmGWK/fsDGF9b
         dW5MW3VY0ParUG+jUCsp9i2mofXCCMhyHbESxtxK+Tf/4iKI91/RWDhdDQu8Ec4i5DGW
         G9B+Re0ozD0/P1U02GKOGXSrp/SL59FyJ+Q7vwpVp1Nb4BgnW/I6wwdgXUTOXwVD8UoJ
         GFlAJXjk5bip6TuZEryLoRVUdgTkXFWPW4aD4OzJ7uqRbqMu7DLajDrviY7g1A4jHOPJ
         eHfdaH5pc/CghBjQz7k3tG0+PNd5ee/u/TQ0rmubKYYsGZeUNexxJx5gz2rZPzf3Unli
         0Aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version;
        bh=NGspnAFOzJSoDZcuTuDayNTMlf+9yY8D8Ve789Ll0sM=;
        b=BwUmWwJfajdbacx1tozBJv8q5kRoMdjmfEWOtUFhHjLLK6ehulWjqHdvIOZzMdB0E4
         hvmPm00Z9juINy2pm68b2ETE4U9Zfx7DWcwQGOjQvASQCjnhSXyGfDea1rDfnXsNoxxb
         /8TOxH+tjr94c+k7gk75W+URjhb2iDMAhJ3i6OthWtRLwyRCfrm/aXYcBkPQlKfcYWR1
         4KvlrWeA5lO7QYH2rPDF1mkuQcBhtl3yA5ZWHf1svAjkMyAFWFH3Erj99fUNwKG9mDgm
         BCszYocV+yaE8awCYlGgRAKYh1nNjOQoAZwP8dk1vI7X4jQ4vrdZ+N9yUDgi9sVCVn2q
         MZ1Q==
X-Gm-Message-State: AOAM5312UOpDXiVsuvzJyMPfbWiPWf3g26KhwPll8Lj7OFDbgdNXaQzq
        0OvHfjknLbP36riHAdzuMPknCA==
X-Google-Smtp-Source: ABdhPJxZEMZqwqCh8vPDbf/fPBdNzAmZVrSRzj42G402jWvD8pjIgfONlUqwp3H8KQZmFogpt6dUnA==
X-Received: by 2002:a05:622a:552:b0:2e2:72c:a05b with SMTP id m18-20020a05622a055200b002e2072ca05bmr23563976qtx.409.1648497443168;
        Mon, 28 Mar 2022 12:57:23 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id q8-20020a05622a030800b002e1c9304db8sm13082619qtw.38.2022.03.28.12.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 12:57:22 -0700 (PDT)
Date:   Mon, 28 Mar 2022 12:57:20 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH] mm/munlock: remove fields to fix htmldocs warnings
Message-ID: <d2c8f66d-be8e-7c91-b0c8-b2f7ffb08bec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen reports that 'make htmldocs' currently issues two warnings:
include/linux/mm_types.h:275: warning: Function parameter or member
'__filler' not described in 'folio'
include/linux/mm_types.h:275: warning: Function parameter or member
'mlock_count' not described in 'folio'

Certainly __filler doesn't want documenting there, and all but one use of
mlock_count is through page->mlock_count at present: so I think it's best
just to remove them both from struct folio for now, and sort out the
right way to document folio->mlock_count once that is the one true way.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 07ca76067308 ("mm/munlock: maintain page->mlock_count while unevictable")
Signed-off-by: Hugh Dickins <hughd@google.com>
---

 include/linux/mm_types.h |    8 +-------
 mm/swap.c                |    4 ++--
 2 files changed, 3 insertions(+), 9 deletions(-)

--- 5.18-pre/include/linux/mm_types.h
+++ linux/include/linux/mm_types.h
@@ -253,13 +253,7 @@ struct folio {
 		struct {
 	/* public: */
 			unsigned long flags;
-			union {
-				struct list_head lru;
-				struct {
-					void *__filler;
-					unsigned int mlock_count;
-				};
-			};
+			struct list_head lru;
 			struct address_space *mapping;
 			pgoff_t index;
 			void *private;
--- 5.18-pre/mm/swap.c
+++ linux/mm/swap.c
@@ -1026,13 +1026,13 @@ static void __pagevec_lru_add_fn(struct
 		folio_clear_active(folio);
 		folio_set_unevictable(folio);
 		/*
-		 * folio->mlock_count = !!folio_test_mlocked(folio)?
+		 * page->mlock_count = !!PageMlocked(page)?
 		 * But that leaves __mlock_page() in doubt whether another
 		 * actor has already counted the mlock or not.  Err on the
 		 * safe side, underestimate, let page reclaim fix it, rather
 		 * than leaving a page on the unevictable LRU indefinitely.
 		 */
-		folio->mlock_count = 0;
+		folio_page(folio, 0)->mlock_count = 0;
 		if (!was_unevictable)
 			__count_vm_events(UNEVICTABLE_PGCULLED, nr_pages);
 	}
