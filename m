Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4AF160850
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 03:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgBQCs0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Feb 2020 21:48:26 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:46098 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgBQCs0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 16 Feb 2020 21:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=WBxLcH9VY8AjnGBBYA4FdXsvq+t0rERSLZNQb6yrbxA=; b=FP6DSOG9oGq1xYczGykMbC5URl
        kWqXG5cSmGpuqCWWUpEmZ+uBypEX49QpQuC5L8Wr3XAAMOPOgi3byDJ/azIhtsE2r58rvJW2NtnGi
        N/lV9i9xIvT4Bqo/7kZtZu9SpcXKwwC/vRAJzsR9ZsPZL4Zhd6TvbtXKwxsv0SJrE7L902qBWWdw3
        +sWtPBEtrd20gjB9q5a+FJ1qbxLDG2KxTq1W1uY38unBNSg2RG9mlbVbWYvsm8HqGXXFRH4+NMtHE
        OZVS8rAWi5yX6HbAyqX5Y7GNpe1xtSEfn4pzb4v4WnpSjZs0kLBzFKPYUB6LS78+zeCh+VWWq1uNg
        v/JLYdQA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3WSM-0001D1-Re; Mon, 17 Feb 2020 02:48:22 +0000
Subject: Re: [PATCH] hugetlb: fix CONFIG_CGROUP_HUGETLB ifdefs
To:     Mina Almasry <almasrymina@google.com>
Cc:     linux-mm@kvack.org, linux-next@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        David Rientjes <rientjes@google.com>,
        Greg Thelen <gthelen@google.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <7ff9e944-1c6c-f7c1-d812-e12817c7a317@oracle.com>
 <20200214204544.231482-1-almasrymina@google.com>
 <CAHS8izMjyLzCsSga59dE+zDC3sLBuA=_u4EtsShN+EZQ1EQitw@mail.gmail.com>
 <5237b9bc-2614-0a3a-afa5-5015f30d28bc@infradead.org>
 <f0fd4a6b-1d4a-8e7d-65c0-a454fbf550a2@infradead.org>
 <CAHS8izP36oTFJdrV7+NSc1sc1fuGB48QDMCkamRM2nW2ni=tSg@mail.gmail.com>
 <CAHS8izOTc_7RKHoJVG_dOKEjT1d4KxNOUwMqqZwyqZm0fe=HcA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cad14d07-199e-fd2e-f2ac-0d7460277d62@infradead.org>
Date:   Sun, 16 Feb 2020 18:48:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHS8izOTc_7RKHoJVG_dOKEjT1d4KxNOUwMqqZwyqZm0fe=HcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/16/20 1:03 PM, Mina Almasry wrote:
> On Sun, Feb 16, 2020 at 12:40 PM Mina Almasry <almasrymina@google.com> wrote:
>>
>> On Fri, Feb 14, 2020 at 5:57 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> On 2/14/20 5:17 PM, Randy Dunlap wrote:
>>>> On 2/14/20 1:00 PM, Mina Almasry wrote:
>>>>> On Fri, Feb 14, 2020 at 12:46 PM Mina Almasry <almasrymina@google.com> wrote:
>>>>>>
>>>>>> Fixes an #ifdef bug in the patch referred to below that was
>>>>>> causing a build error when CONFIG_DEBUG_VM &&
>>>>>> !CONFIG_CCGROUP_HUGETLB.
>>>>
>>>> Hi Mina,
>>>>
>>>> I don't know if this was supposed to fix the 2 build reports that I made,
>>>> but this does not apply cleanly to mmotm (and it's a reply email so it's
>>>> more difficult to apply anyway):
>>>>
>>>> Applying patch mm-hugetlb-fix-CONFIG_CGROUP_HUGETLB.patch
>>>> patching file mm/hugetlb.c
>>>> Hunk #1 succeeded at 289 with fuzz 1.
>>>> Hunk #2 succeeded at 325 with fuzz 2.
>>>> Hunk #3 FAILED at 435.
>>>> 1 out of 3 hunks FAILED -- rejects in file mm/hugetlb.c
>>>>
>>>
>>> OK, I applied this patch manually and it does fix most of the reported build problems.
>>> The only one remaining is this:
>>>
>>>   CC      mm/migrate.o
>>> In file included from ../mm/migrate.c:39:0:
>>> ../include/linux/hugetlb_cgroup.h:146:21: warning: ‘struct file_region’ declared inside parameter list will not be visible outside of this definition or declaration
>>>               struct file_region *rg,
>>>                      ^~~~~~~~~~~
>>> ../include/linux/hugetlb_cgroup.h:145:63: warning: ‘struct resv_map’ declared inside parameter list will not be visible outside of this definition or declaration
>>>  static inline void hugetlb_cgroup_uncharge_file_region(struct resv_map *resv,
>>>                                                                ^~~~~~~~
>>> ../include/linux/hugetlb_cgroup.h:233:59: warning: ‘struct resv_map’ declared inside parameter list will not be visible outside of this definition or declaration
>>>  static inline void hugetlb_cgroup_uncharge_counter(struct resv_map *resv,
>>>                                                            ^~~~~~~~
>>>
>>
>> Hi Randy,
>>
>> Yes this was supposed to fix the build errors. I'm having trouble
>> reproducing the one you have pending above. This is my development
>> environment:
>>
>> ➜  prodkernel2 git:(mm-build-fix) git remote show github-akpm
>> * remote github-akpm
>>   Fetch URL: https://github.com/hnaz/linux-mm.git
>>   Push  URL: https://github.com/hnaz/linux-mm.git
>>
>> ➜  prodkernel2 git:(mm-build-fix) git s
>> ## mm-build-fix...github-akpm/master [ahead 1]
>>
>> ➜  prodkernel2 git:(mm-build-fix) make -j80 mm/migrate.o
>> (succeeds with no warnings).
>>
>> ➜  prodkernel2 git:(mm-build-fix) make -j80
>> (succeeds with no warnings)
>>
>> Is my development environment wrong? Shouldn't I be able to reproduce
>> this build warning on this tree with my fix?
>> https://github.com/hnaz/linux-mm.git
>>
>> I'm using config-r9887 that you sent earlier.
>>
>> I'm probably supposed to use a different branch since you also say
>> that my patch doesn't apply cleanily, but the mmotm readme says that
>> github mirrors Andrew's tree?
>>
> 
> Just looking at the build error without being able to reproduce, it
> looks like this diff would fix it?

Hi Mina,
This patch does not fix the build warnings that I reported.

The initial report is here:
https://lore.kernel.org/lkml/97879032-f159-f1c6-9cde-d4e0389b2d7f@infradead.org/
and the kernel .config file is named config-r9883 (not r9887).


> ➜  prodkernel2 git:(mm-build-fix) ✗ git diff
> diff --git a/include/linux/hugetlb_cgroup.h b/include/linux/hugetlb_cgroup.h
> index a09d4164ba910..5f66cdcbe9b10 100644
> --- a/include/linux/hugetlb_cgroup.h
> +++ b/include/linux/hugetlb_cgroup.h
> @@ -15,6 +15,7 @@
>  #ifndef _LINUX_HUGETLB_CGROUP_H
>  #define _LINUX_HUGETLB_CGROUP_H
> 
> +#include <linux/hugetlb.h>
>  #include <linux/mmdebug.h>
> 
>  struct hugetlb_cgroup;
> 
> Can you let me know? Or any insight into why I can't reproduce the
> warning? Wrong tree perhaps?
> 
> I suspect a forward declaration of struct resv_map and struct
> file_region in hugetlb_cgroup.h would also fix.



-- 
~Randy

