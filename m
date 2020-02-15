Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0EE915FBF0
	for <lists+linux-next@lfdr.de>; Sat, 15 Feb 2020 02:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgBOBR0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Feb 2020 20:17:26 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51340 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbgBOBRZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Feb 2020 20:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=BGvB+FUoLlv3HEvXBrhnN6JC/LJ+icLfki58Vl6nukc=; b=ipYruDIPj+zk6cpFBRObvJS06t
        isg4YhZtjLeVW5eANUzKiagfCMgZN7EByJnT7ohok/+UsWjhxyxzrFq0jahiqPl+rmYWktsIzxzp9
        ojbtGe4koFplx0wlQN2DgCQEJ1w0Whuwbo1ECTPacv+hQK4w0hioXsah9oWDPPtScrxClhuA4XXUr
        kQHVJViJq73EoU+GihPEr5nit1FuU+ahQiqSFDmFKf+ltK/eBfqH4iCTbXSXcvoRbTH/IaivA6iFv
        kEPTnVWoz+xXBbkbn6zOeBhH+piiLwuItzGAY+9UejAH1WU61yqgk4StQBiJmgSDcGjPSs6EHfiiG
        biprHyjA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j2m5D-00088W-MI; Sat, 15 Feb 2020 01:17:23 +0000
Subject: Re: [PATCH] hugetlb: fix CONFIG_CGROUP_HUGETLB ifdefs
To:     Mina Almasry <almasrymina@google.com>, linux-mm@kvack.org,
        linux-next@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     David Rientjes <rientjes@google.com>,
        Greg Thelen <gthelen@google.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <7ff9e944-1c6c-f7c1-d812-e12817c7a317@oracle.com>
 <20200214204544.231482-1-almasrymina@google.com>
 <CAHS8izMjyLzCsSga59dE+zDC3sLBuA=_u4EtsShN+EZQ1EQitw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5237b9bc-2614-0a3a-afa5-5015f30d28bc@infradead.org>
Date:   Fri, 14 Feb 2020 17:17:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHS8izMjyLzCsSga59dE+zDC3sLBuA=_u4EtsShN+EZQ1EQitw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/14/20 1:00 PM, Mina Almasry wrote:
> On Fri, Feb 14, 2020 at 12:46 PM Mina Almasry <almasrymina@google.com> wrote:
>>
>> Fixes an #ifdef bug in the patch referred to below that was
>> causing a build error when CONFIG_DEBUG_VM &&
>> !CONFIG_CCGROUP_HUGETLB.

Hi Mina,

I don't know if this was supposed to fix the 2 build reports that I made,
but this does not apply cleanly to mmotm (and it's a reply email so it's
more difficult to apply anyway):

Applying patch mm-hugetlb-fix-CONFIG_CGROUP_HUGETLB.patch
patching file mm/hugetlb.c
Hunk #1 succeeded at 289 with fuzz 1.
Hunk #2 succeeded at 325 with fuzz 2.
Hunk #3 FAILED at 435.
1 out of 3 hunks FAILED -- rejects in file mm/hugetlb.c


>> Fixes: b5f16a533ce8a ("hugetlb: support file_region coalescing again")
>> Signed-off-by: Mina Almasry <almasrymina@google.com>
>> Cc: David Rientjes <rientjes@google.com>
>> Cc: Greg Thelen <gthelen@google.com>
>> Cc: Mike Kravetz <mike.kravetz@oracle.com>
>> Cc: Shakeel Butt <shakeelb@google.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> ---
>>  mm/hugetlb.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index ee6d262fe6ac0..95d34c58981d2 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -289,7 +289,7 @@ static bool has_same_uncharge_info(struct file_region *rg,
>>  #endif
>>  }
>>
>> -#ifdef CONFIG_DEBUG_VM
>> +#if defined(CONFIG_DEBUG_VM) && defined(CONFIG_CGROUP_HUGETLB)
>>  static void dump_resv_map(struct resv_map *resv)
>>  {
>>         struct list_head *head = &resv->regions;
>> @@ -325,6 +325,10 @@ static void check_coalesce_bug(struct resv_map *resv)
>>                 }
>>         }
>>  }
>> +#else
>> +static void check_coalesce_bug(struct resv_map *resv)
>> +{
>> +}
>>  #endif
>>
>>  static void coalesce_file_region(struct resv_map *resv, struct file_region *rg)
>> @@ -431,9 +435,7 @@ static long add_reservation_in_range(struct resv_map *resv, long f, long t,
>>         }
>>
>>         VM_BUG_ON(add < 0);
>> -#ifdef CONFIG_DEBUG_VM
>>         check_coalesce_bug(resv);
>> -#endif
>>         return add;
>>  }
>>
>> --
>> 2.25.0.265.gbab2e86ba0-goog

thanks.
-- 
~Randy

