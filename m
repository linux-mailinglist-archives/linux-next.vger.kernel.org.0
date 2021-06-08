Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B603D39FE98
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 20:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbhFHSIP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 14:08:15 -0400
Received: from mail-pj1-f50.google.com ([209.85.216.50]:50876 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234145AbhFHSIO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 14:08:14 -0400
Received: by mail-pj1-f50.google.com with SMTP id g4so2924050pjk.0
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Ia647W1LE+G4T9UShJYw1TmwqdR1fwU7tDj1UVZC7tU=;
        b=SKnBTphpKO1uU8jhs5nCP5XUUBUX94prIb9jfWT/TKiNjxqcL7wJWNWRDcxKalGDkk
         ci7SROBcuEfyT1D6wuvAocWeyUxu2QkLX8jM5DEr5fIolZiGCaCwYy6nk+rox7VFgCUC
         fUPe8fTV6zb1NGLkNHShR25VdAgFS3iBMzwlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Ia647W1LE+G4T9UShJYw1TmwqdR1fwU7tDj1UVZC7tU=;
        b=FAl5ukXqQXw0n62N72EC3iIbqeukK0Mcp28e5G9vWl7738c/7zV1lUWq7W8zpjKhJ+
         6WMUYs2gMEGYUNowZY4iAQ1palBgDaAzEcMgvM9dBtfbcwarU1rco74iU379oM5S4zpY
         k9FEK2Jh+FvROkbqRS8L7KvP21gjG2UyEJtFeUlhGncwwUCyIOI0Cu6+d5gXuH1Sjlvr
         5hxfg2RYgs8+UA7c4oZ3GFfoVNoiDQQspeWPM3jUFEVnT36Ip8YRkJz5zPSJNAWD99f4
         FxZEwzf1oNsnK4VIlFY0E8MXrRdYNDcKvDIqvD0RMZBeTejQqaDpBufRBR8B2v7jIhSc
         Yx3Q==
X-Gm-Message-State: AOAM530+7SiHCP/sfXdVsl3gcJve/Rmof4hOnAeTnKLVoTXnVlkYm3of
        z+/vycJduqTBu4RxqOAkEIZMfw==
X-Google-Smtp-Source: ABdhPJwzRxiSreIrumgnXclXEp5hCRdA13ZE2KIzSBafzPQ9u9suGwhzEWP1yNghwrVdvEHV8Yco8w==
X-Received: by 2002:a17:902:ecc6:b029:112:8ab6:9652 with SMTP id a6-20020a170902ecc6b02901128ab69652mr917666plh.8.1623175511422;
        Tue, 08 Jun 2021 11:05:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z5sm11363820pfa.172.2021.06.08.11.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:05:10 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 8 Jun 2021 11:05:10 -0700
To:     Shakeel Butt <shakeelb@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: do_migrate_range(): Error handling issues
Message-ID: <202106081105.B3E3DAE44@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210608 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Tue Dec 15 12:13:39 2020 -0800
    013339df116c ("mm/rmap: always do TTU_IGNORE_ACCESS")

Coverity reported the following:

*** CID 1505146:  Error handling issues  (CHECKED_RETURN)
/mm/memory_hotplug.c: 1422 in do_migrate_range()
1416     		 * the unmap as the catch all safety net).
1417     		 */
1418     		if (PageHWPoison(page)) {
1419     			if (WARN_ON(PageLRU(page)))
1420     				isolate_lru_page(page);
1421     			if (page_mapped(page))
vvv     CID 1505146:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "try_to_unmap" without checking return value (as is done elsewhere 4 out of 5 times).
1422     				try_to_unmap(page, TTU_IGNORE_MLOCK);
1423     			continue;
1424     		}
1425
1426     		if (!get_page_unless_zero(page))
1427     			continue;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1505146 ("Error handling issues")
Fixes: 013339df116c ("mm/rmap: always do TTU_IGNORE_ACCESS")

Thanks for your attention!

-- 
Coverity-bot
