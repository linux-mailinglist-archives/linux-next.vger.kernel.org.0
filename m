Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0472C3915
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 07:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgKYGY5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 01:24:57 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:46548 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726027AbgKYGY5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Nov 2020 01:24:57 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0UGTbpu3_1606285491;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UGTbpu3_1606285491)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 25 Nov 2020 14:24:51 +0800
Subject: Re: linux-next boot error: WARNING in prepare_kswapd_sleep
To:     Lorenzo Stoakes <lstoakes@gmail.com>,
        syzbot <syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hui Su <sh_def@163.com>
References: <00000000000054aea005b4d59e71@google.com>
 <CAA5enKZ=6=AoknavW4RJ+T+aiPBFSf8uEjJ+ODcc+nMTD2k5kQ@mail.gmail.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <bda71012-f2e2-9a4c-5dcb-7ad14655c2f5@linux.alibaba.com>
Date:   Wed, 25 Nov 2020 14:24:51 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAA5enKZ=6=AoknavW4RJ+T+aiPBFSf8uEjJ+ODcc+nMTD2k5kQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



在 2020/11/25 上午1:59, Lorenzo Stoakes 写道:
> On Tue, 24 Nov 2020 at 07:54, syzbot
> <syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com> wrote:
>> syzbot found the following issue on:
>>
>> HEAD commit:    d9137320 Add linux-next specific files for 20201124
> 
> This appears to be a product of 4b2904f3 ("mm/memcg: add missed
> warning in mem_cgroup_lruvec") adding a VM_WARN_ON_ONCE() to
> mem_cgroup_lruvec, which when invoked from a function other than
> mem_cgroup_page_lruvec() can in fact be called with the condition
> false.
> If we move the check back into mem_cgroup_page_lruvec() it resolves
> the issue. I enclose a simple version of this below, happy to submit
> as a proper patch if this is the right approach:
> 
> 
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 87ed56dc75f9..27cc40a490b2 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -618,7 +618,6 @@ static inline struct lruvec
> *mem_cgroup_lruvec(struct mem_cgroup *memcg,
>                 goto out;
>         }
> 
> -       VM_WARN_ON_ONCE(!memcg);
>         if (!memcg)
>                 memcg = root_mem_cgroup;
> 
> @@ -645,6 +644,7 @@ static inline struct lruvec
> *mem_cgroup_lruvec(struct mem_cgroup *memcg,
>  static inline struct lruvec *mem_cgroup_page_lruvec(struct page *page,
>                                                 struct pglist_data *pgdat)
>  {
> +       VM_WARN_ON_ONCE_PAGE(!page_memcg(page), page);
>         return mem_cgroup_lruvec(page_memcg(page), pgdat);
>  }
> 

Acked.

Right. Would you like to remove the bad commit 4b2904f3 ("mm/memcg: add missed
 warning in mem_cgroup_lruvec") and replace yours.

and further more, could you like try another patch?

Thanks
Alex

From 073b222bd06a96c39656b0460c705e48c7eedafc Mon Sep 17 00:00:00 2001
From: Alex Shi <alex.shi@linux.alibaba.com>
Date: Wed, 25 Nov 2020 14:06:33 +0800
Subject: [PATCH] mm/memcg: bail out early when !memcg in mem_cgroup_lruvec

In some scenarios, we call NULL memcg in mem_cgroup_lruvec(NULL, pgdat)
so we could get out early to skip unnecessary check.

Also warning if both parameter are NULL.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 include/linux/memcontrol.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 3a995bb3157f..5e4da83eb9ce 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -613,7 +613,9 @@ static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
 	struct mem_cgroup_per_node *mz;
 	struct lruvec *lruvec;
 
-	if (mem_cgroup_disabled()) {
+	VM_WARN_ON_ONCE(!memcg && !pgdat);
+
+	if (mem_cgroup_disabled() || !memcg) {
 		lruvec = &pgdat->__lruvec;
 		goto out;
 	}
-- 
2.29.GIT

