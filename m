Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC31E891F
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 14:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388098AbfJ2NOD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 09:14:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:41592 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732534AbfJ2NOD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Oct 2019 09:14:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 00693AC31;
        Tue, 29 Oct 2019 13:14:00 +0000 (UTC)
Date:   Tue, 29 Oct 2019 14:13:58 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     coverity-bot <keescook@chromium.org>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vladimir Davydov <vdavydov@virtuozzo.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: reclaim_high(): Error handling issues
Message-ID: <20191029131358.GM31513@dhcp22.suse.cz>
References: <201910281604.EC4A108@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201910281604.EC4A108@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon 28-10-19 16:04:23, Kees Cook wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191025 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> f7e1cb6ec51b ("mm: memcontrol: account socket memory in unified hierarchy memory controller")

JFTR This seems misleading wrt to the issue reported here AFAICS. The
code was there even before this commit.

> Coverity reported the following:
> 
> *** CID 1487368:  Error handling issues  (CHECKED_RETURN)
> /mm/memcontrol.c: 2343 in reclaim_high()
> 2337     			 gfp_t gfp_mask)
> 2338     {
> 2339     	do {
> 2340     		if (page_counter_read(&memcg->memory) <= memcg->high)
> 2341     			continue;
> 2342     		memcg_memory_event(memcg, MEMCG_HIGH);
> vvv     CID 1487368:  Error handling issues  (CHECKED_RETURN)
> vvv     Calling "try_to_free_mem_cgroup_pages" without checking return value (as is done elsewhere 5 out of 6 times).
> 2343     		try_to_free_mem_cgroup_pages(memcg, nr_pages, gfp_mask, true);

Yes we do not check for the return value here because the high limit is
a best effort feature. A more highlevel throttling which is not based on
the reclaim directly is implemented in mem_cgroup_handle_over_high


> 2344     	} while ((memcg = parent_mem_cgroup(memcg)));
> 2345     }
> 2346
> 2347     static void high_work_func(struct work_struct *work)
> 2348     {
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include:
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487368 ("Error handling issues")
> Fixes: f7e1cb6ec51b ("mm: memcontrol: account socket memory in unified hierarchy memory controller")
> 
> 
> Thanks for your attention!
> 
> -- 
> Coverity-bot

-- 
Michal Hocko
SUSE Labs
