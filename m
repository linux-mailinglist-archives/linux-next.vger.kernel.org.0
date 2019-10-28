Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D28E7CAD
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbfJ1XE0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:04:26 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:46940 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbfJ1XE0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:04:26 -0400
Received: by mail-pg1-f172.google.com with SMTP id f19so8015712pgn.13
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=aayVcg8kU5Ap1gMeOZGvS0EsllvmBvmclVUlxdQMjEk=;
        b=DwKODlJCgo1x2TrUtisEd/ducqDF/Q0dhYDYOrgR6neJXaUweZcG1CdVhMdQGw0FPw
         40aEvmZT5uGKkHYB5SILBkWw/74TSuW4wZRoyHMLrsEssYb8ETUolQeuo88zt8jfMQ/k
         hDMvtvqRzw77sgxI3VemC3Xjc80QCXRg3/aDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=aayVcg8kU5Ap1gMeOZGvS0EsllvmBvmclVUlxdQMjEk=;
        b=kN91ywtSVtEwOWX0Za6iSY/VBI8+/AfP7kOEc/i9cDi7WH5/Oe/Hm7mRA7KUlIpDBl
         +aob0ZtBZHH3D9dtoA6J67UTr6l9r3igkEvnhObHMorUSc/J+V+JLiDsTaShjQ+JGYWX
         Mc1AEQfVsYgPLLOCxEXMp7mw+VC8Qhi8t7tfc3rK4ynczi4JWnGyMKKJHhoGAuqQzktY
         1Nbq7CrN2NiVzlpMXFWRzRSwuMpDqYxgSg5M9Dbm0kr/D/OsbOHRKp17xbAToTqlV5xK
         mVCE7Lh7fTjRwg0w+ocdb6QuHUSDOdAlYWBpHtS08yOj4HcvBwrDMEMNq0Y5u0JKdzYd
         LZOw==
X-Gm-Message-State: APjAAAWpfFGRITmoXEeWstLLF90gjs3tJz6Gv4vkQQ0nb8FdRQ2gy4bz
        dkIsco9oRn0MS/2+PL0feTYXTQ==
X-Google-Smtp-Source: APXvYqwraDAs2c1U7hAHKZ61XfGBdH5TTN0fpO3Mwiy0K0FSOe07CBbxeoB3++7r5A46LcpKfdcSVw==
X-Received: by 2002:a63:7942:: with SMTP id u63mr3695856pgc.328.1572303864944;
        Mon, 28 Oct 2019 16:04:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z18sm13408185pfq.182.2019.10.28.16.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:04:24 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:04:23 -0700
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Michal Hocko <mhocko@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vladimir Davydov <vdavydov@virtuozzo.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: reclaim_high(): Error handling issues
Message-ID: <201910281604.EC4A108@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191025 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

f7e1cb6ec51b ("mm: memcontrol: account socket memory in unified hierarchy memory controller")

Coverity reported the following:

*** CID 1487368:  Error handling issues  (CHECKED_RETURN)
/mm/memcontrol.c: 2343 in reclaim_high()
2337     			 gfp_t gfp_mask)
2338     {
2339     	do {
2340     		if (page_counter_read(&memcg->memory) <= memcg->high)
2341     			continue;
2342     		memcg_memory_event(memcg, MEMCG_HIGH);
vvv     CID 1487368:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "try_to_free_mem_cgroup_pages" without checking return value (as is done elsewhere 5 out of 6 times).
2343     		try_to_free_mem_cgroup_pages(memcg, nr_pages, gfp_mask, true);
2344     	} while ((memcg = parent_mem_cgroup(memcg)));
2345     }
2346
2347     static void high_work_func(struct work_struct *work)
2348     {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487368 ("Error handling issues")
Fixes: f7e1cb6ec51b ("mm: memcontrol: account socket memory in unified hierarchy memory controller")


Thanks for your attention!

-- 
Coverity-bot
