Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C40C2C3FB0
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 13:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgKYMPS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 07:15:18 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:50561 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727219AbgKYMPR (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Nov 2020 07:15:17 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0UGVZDcx_1606306511;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UGVZDcx_1606306511)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 25 Nov 2020 20:15:11 +0800
Subject: Re: [PATCH] mm/memcg: warn on missing memcg on
 mem_cgroup_page_lruvec()
To:     Lorenzo Stoakes <lstoakes@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Hui Su <sh_def@163.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Shakeel Butt <shakeelb@google.com>,
        Roman Gushchin <guro@fb.com>
Cc:     syzbot <syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <00000000000054aea005b4d59e71@google.com>
 <20201125112202.387009-1-lstoakes@gmail.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <0918d6f5-8459-7b5e-82a3-6c9792d17433@linux.alibaba.com>
Date:   Wed, 25 Nov 2020 20:15:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201125112202.387009-1-lstoakes@gmail.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Acked-by: Alex Shi <alex.shi@linux.alibaba.com>


ÔÚ 2020/11/25 ÏÂÎç7:22, Lorenzo Stoakes Ð´µÀ:
> Move memcg check to mem_cgroup_page_lruvec() as there are callers which
> may invoke this with !memcg in mem_cgroup_lruvec(), whereas they should
> not in mem_cgroup_page_lruvec().
> 
> We expect that we have always charged a page to the memcg before
> mem_cgroup_page_lruvec() is invoked, so add a warning to assert that this
> is the case.
> 
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> Reported-by: syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com
> ---
>  include/linux/memcontrol.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 87ed56dc75f9..3e6a1df3bdb9 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -618,7 +618,6 @@ static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
>  		goto out;
>  	}
>  
> -	VM_WARN_ON_ONCE(!memcg);
>  	if (!memcg)
>  		memcg = root_mem_cgroup;
>  
> @@ -645,7 +644,10 @@ static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
>  static inline struct lruvec *mem_cgroup_page_lruvec(struct page *page,
>  						struct pglist_data *pgdat)
>  {
> -	return mem_cgroup_lruvec(page_memcg(page), pgdat);
> +	struct mem_cgroup *memcg = page_memcg(page);
> +
> +	VM_WARN_ON_ONCE_PAGE(!memcg, page);
> +	return mem_cgroup_lruvec(memcg, pgdat);
>  }
>  
>  static inline bool lruvec_holds_page_lru_lock(struct page *page,
> 
