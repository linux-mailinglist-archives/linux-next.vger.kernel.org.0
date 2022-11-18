Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C577062FA89
	for <lists+linux-next@lfdr.de>; Fri, 18 Nov 2022 17:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240700AbiKRQnc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Nov 2022 11:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242176AbiKRQn3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Nov 2022 11:43:29 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFAEC47
        for <linux-next@vger.kernel.org>; Fri, 18 Nov 2022 08:43:24 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso5251288pjt.0
        for <linux-next@vger.kernel.org>; Fri, 18 Nov 2022 08:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bFpydVEsN0sToFVtM7jELuhoofQy9t2jPUFLTcIXRx8=;
        b=PHxZLY8Iha2TaDny05JWQTVe0OvBw0y5kIlu1jrIxQ+y043xEur9SKJwSXJGZdYF/C
         zq1dqTPaNBWrbbSY2FkMBWe5upYYu4TBKzmWhWP/uY+H7Mu+CtEdN3peJYoo9fHOgNqT
         R5v38A+RV3qaU4RRHUv5Htt/vmgr5kCH78AXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFpydVEsN0sToFVtM7jELuhoofQy9t2jPUFLTcIXRx8=;
        b=wdrKlx68lGMAyD3vXmjKzdcXDos6euMesHEW1pq2Nz6s9dHYARNRszQeG8qh8qNj83
         o4vGnQxx/plUqeoS+6ZrZvWouDGBSqqKOvc08ahEWvS7ZeRsbOaGJOwrKtn88xGo+Deq
         mCPw009WrstSZfpQLJKywVjR1QR4m8s/dKE+MEzWFjSd1FfeQUB21rv/T2tV1ZpnaRbk
         p6m5ha9Mgeo/qomT8WophjDFrhGOBVdDzQtQMCydWJIuKvmvutxf3RGxo7r8tcn1nbrC
         rF4fUYx4lde3lreqeBFuw8Oj2jrCQ65OFqLOuAOvIMgGXFFI1UD8skmhb7mk3vvyoYTU
         eW+Q==
X-Gm-Message-State: ANoB5pkQF0N95I9iM9XTGebJ7N7kuVrFIBnvQJOokIPDywuH8r47mxO6
        jd6wltWAHFTRP/6gcD1LY0PU6Q==
X-Google-Smtp-Source: AA0mqf40QW2uM/mdUZtAUwUfmrT0ybXaxtav/kplbk3xWLYOjhj55pBX/fcy0ASDVHC8fxxYw0QVxA==
X-Received: by 2002:a17:902:7242:b0:17c:4ae7:cf23 with SMTP id c2-20020a170902724200b0017c4ae7cf23mr448359pll.2.1668789804136;
        Fri, 18 Nov 2022 08:43:24 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c3-20020a170903234300b0017f59ebafe7sm3928259plh.212.2022.11.18.08.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 08:43:20 -0800 (PST)
Date:   Fri, 18 Nov 2022 08:43:19 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Ananda Badmaev <a.badmaev@clicknet.pro>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Vitaly Wool <vitaly.wool@konsulko.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: zblock_alloc(): Memory - illegal accesses
Message-ID: <202211180841.39558B5E5@keescook>
References: <202211171419.FCDC8EE@keescook>
 <74337ebd-0222-2e78-9149-8fa40b0c815e@clicknet.pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74337ebd-0222-2e78-9149-8fa40b0c815e@clicknet.pro>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 18, 2022 at 04:05:36PM +0300, Ananda Badmaev wrote:
> 18.11.2022 01:20, coverity-bot пишет:
> > Coverity reported the following:
> > 
> > *** CID 1527352:  Memory - illegal accesses  (OVERRUN)
> > mm/zblock.c:320 in zblock_alloc()
> > 314     	}
> > 315     	list = &(pool->block_lists[block_type]);
> > 316
> > 317     check:
> > 318     	spin_lock(&list->lock);
> > 319     	/* check if there are free slots in cache */
> > vvv     CID 1527352:  Memory - illegal accesses  (OVERRUN)
> > vvv     Overrunning array of 10208 bytes at byte offset 10208 by dereferencing pointer "list".
> > 320     	block = cache_find_block(list);
> > 321     	if (block)
> > 322     		goto found;
> > 323     	spin_unlock(&list->lock);
> > 324
> > 325     	/* not found block with free slots try to allocate new empty block */
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
> > 
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1527352 ("Memory - illegal accesses")
> > Fixes: 9097e28c25c8 ("mm: add zblock - new allocator for use via zpool API")
> > 
> > It looks like block_type is not checked to be < ARRAY_SIZE(block_desc)
> > after exiting the earlier loop, so the access through "list" may be past
> > the end of pool->block_lists.
> > 
> 
> There is no need for this check because it is guaranteed that this code will
> be executed only if size <= PAGE_SIZE. Since slot_size for the last list
> even exceeds PAGE_SIZE, block_type will be always valid.

Ah-ha, understood. Well, if you do want to catch it if there is ever a
typo in the block_desc values (which are not obviously >4096 without
sitting down and calculating them), perhaps add:

        if (WARN_ON(block_type >= ARRAY_SIZE(block_desc))
                return -ENOSPC;


-- 
Kees Cook
