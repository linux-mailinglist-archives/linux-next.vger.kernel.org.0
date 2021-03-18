Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1089340CCB
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 19:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhCRST7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 14:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbhCRSTg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 14:19:36 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55875C06174A
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 11:19:36 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id z3so3303560ioc.8
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oF3ZUW+4J4CFMM7Juvx/eFO+KnFrLTNl0x25bnTL6cQ=;
        b=EjKtEX+xFlBYcUVGMVT8rDwEhj+phbsFS6yb9jT0W1rNTmGl7m4hzLIFB+ujjzOuep
         QMNrs5fzUu9QW4WbkVeBfQNn96h6bp9MG9KaCtxQp4mbcsmkaAGy/Xpd4VejZ7PBddnB
         52lif8yrBnZuR9b/AjAr4iH7DW6+ClccQhcI+2ZbH6dqg4drBT7tRkdRYTmVAtdosdPe
         0UK7zQqsOrSxq3bXNYWVbogZWDCSDFo4S3fPgvkkDfgwqff+iEor6CA8DAjG2RMfV99n
         0rkkr7E/loriLElLmTLdpLy4T+9emJ3EGWvu/ZwjgQ8yudsi+eNASx2Xd8t82bzmC1Mj
         r2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oF3ZUW+4J4CFMM7Juvx/eFO+KnFrLTNl0x25bnTL6cQ=;
        b=JuzqVAMKn9H+bnd/GQdYUjwyUS20tiTQ3WWdLum4HZzLfkipWAkcOmHs0fSN4ylSOu
         mEzqI3yPBaMDk6BoOHJwwutpYgiShthcVD8mPsXeB5B58X9MDfgUegXSecFQ7rUYQNQ+
         RCqT3jf9N8fm6p0hevId96EVVZ48/oCnRUbO5oUMdfoRVN6FL5gnYJ9jOOqVU4YFK54V
         amfgNNbdPkF1HAv3wYxAOfHu2gbLZrwiCs96FN7T4MIN3CL+8xQqJ4UVBOIxmX01ov7p
         bxJnLTnN+dSpVj+99Be2trSZ4ZmYEjwUSEJhxbhmd9nnBbo0pC3Om6XRdjcIiDwJuiBs
         lWDw==
X-Gm-Message-State: AOAM530vc5NTJxw72lbc41mFHG3l2+4PYuRu/km6lYIqFHGWWo5vw3r4
        NTstiHxUvAosL6ZW0LROg9tVTtrvVq2uFw==
X-Google-Smtp-Source: ABdhPJz+KCRumbxLMPvmy0nP13iuFKiNw7uhLGiA2Css6rHPzUMn9LXLwG8nVd8PUVJAPFxFd841Qw==
X-Received: by 2002:a02:9985:: with SMTP id a5mr7980431jal.122.1616091575551;
        Thu, 18 Mar 2021 11:19:35 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id q12sm668404ilm.63.2021.03.18.11.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 11:19:35 -0700 (PDT)
Subject: Re: linux-next: manual merge of the akpm-current tree with the block
 tree
To:     Shakeel Butt <shakeelb@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dan Schatzberg <schatzberg.dan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210318171720.61a3f59c@canb.auug.org.au>
 <CALvZod7iPJ1h0MVpBwNkqJBfNNWPb+x93q59okdK5oxevzbP_g@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <4fea89a5-0e18-0791-18a8-4c5907b0d2c4@kernel.dk>
Date:   Thu, 18 Mar 2021 12:19:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALvZod7iPJ1h0MVpBwNkqJBfNNWPb+x93q59okdK5oxevzbP_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/18/21 11:54 AM, Shakeel Butt wrote:
> On Wed, Mar 17, 2021 at 11:17 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>
>>   mm/memcontrol.c
>>
>> between commit:
>>
>>   06d69d4c8669 ("mm: Charge active memcg when no mm is set")
>>
>> from the block tree and commit:
>>
>>   674788258a66 ("memcg: charge before adding to swapcache on swapin")
>>
>> from the akpm-current tree.
>>
>> I fixed it up (I think - see below) and can carry the fix as necessary.
>> This is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> --
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc mm/memcontrol.c
>> index f05501669e29,668d1d7c2645..000000000000
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@@ -6691,65 -6549,73 +6550,80 @@@ out
>>    * @gfp_mask: reclaim mode
>>    *
>>    * Try to charge @page to the memcg that @mm belongs to, reclaiming
>>  - * pages according to @gfp_mask if necessary.
>>  + * pages according to @gfp_mask if necessary. if @mm is NULL, try to
>>  + * charge to the active memcg.
>>    *
>> +  * Do not use this for pages allocated for swapin.
>> +  *
>>    * Returns 0 on success. Otherwise, an error code is returned.
>>    */
>>   int mem_cgroup_charge(struct page *page, struct mm_struct *mm, gfp_t gfp_mask)
>>   {
>> -       unsigned int nr_pages = thp_nr_pages(page);
>> -       struct mem_cgroup *memcg = NULL;
>> -       int ret = 0;
>> +       struct mem_cgroup *memcg;
>> +       int ret;
>>
>>         if (mem_cgroup_disabled())
>> -               goto out;
>> +               return 0;
>>
>> -       if (PageSwapCache(page)) {
>> -               swp_entry_t ent = { .val = page_private(page), };
>> -               unsigned short id;
>>  -      memcg = get_mem_cgroup_from_mm(mm);
>> ++      if (!mm) {
>> ++              memcg = get_mem_cgroup_from_current();
>> ++              if (!memcg)
>> ++                      memcg = get_mem_cgroup_from_mm(current->mm);
>> ++      } else {
>> ++              memcg = get_mem_cgroup_from_mm(mm);
>> ++      }
>> +       ret = __mem_cgroup_charge(page, memcg, gfp_mask);
>> +       css_put(&memcg->css);
> 
> Things are more complicated than this. First we need a similar change
> in mem_cgroup_swapin_charge_page() but I am thinking of making
> get_mem_cgroup_from_mm() more general and not make any changes in
> these two functions.
> 
> Is it possible to get Dan's patch series in mm tree? More specifically
> the above two patches in the same tree then one of us can make their
> patch rebase over the other (I am fine with doing this myself).

Yes, I think we should do that, and since he's going to be respinning
the series anyway, I'll drop it right now and then let's take it through
Andrew to avoid unnecessary complications that way.

-- 
Jens Axboe

