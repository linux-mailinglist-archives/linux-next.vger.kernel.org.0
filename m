Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581F230E125
	for <lists+linux-next@lfdr.de>; Wed,  3 Feb 2021 18:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhBCRfd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 12:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbhBCRfb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2021 12:35:31 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D2DC0613D6;
        Wed,  3 Feb 2021 09:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=IplVCXo/fDkx+BXjEgdOrbEbvFLMTzBBOaSFZdXnnUo=; b=O+0QFz8WNyP+bUpVa4sYuqhOA+
        qCcgnBgu+rf/UQE/qghz9ETIkklfhYRfO6XHR5D6amQ5W33jcZSo8+JtSB+/EdRSZD2GifxI/AdTO
        RXALNbkSx3r5+OGLtoPQUk8m+ytOtMPdPz5JrMFHnBAjE6mtBblfHkgkUQ8lZy0ywG+Qup0VJYazD
        JzW5h9zsj5qJw9+hpVqQFsKrI+V5MmOH1OwvThoaR2WdYIJUDHVO884SQbq29NkeUwTN0sgQXVo8y
        uNMkzJncApz+ueehvrUdhfPDsSJ6U9Jb8wMOOnOvOtp7HXMoKdJ92GgHPnq6hunA739Eg6pEhbtux
        eSnT5zjA==;
Received: from [2601:1c0:6280:3f0::aec2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l7M3D-0001ML-P8; Wed, 03 Feb 2021 17:34:48 +0000
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Arnd Bergmann <arnd@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210202200324.5179db33@canb.auug.org.au>
 <CAK8P3a3uJfyt6vsgTdSjnE23V4E_Mw=N89nrMPLJ6bhA363nqw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5504da4f-7eec-ecb0-c47d-7821d06dc880@infradead.org>
Date:   Wed, 3 Feb 2021 09:34:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3uJfyt6vsgTdSjnE23V4E_Mw=N89nrMPLJ6bhA363nqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/3/21 9:09 AM, Arnd Bergmann wrote:
> On Tue, Feb 2, 2021 at 10:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>>
>>   983cb10d3f90 ("mm/gup: do not migrate zero page")
>>
>> I have applied the following patch for today:
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Tue, 2 Feb 2021 19:49:00 +1100
>> Subject: [PATCH] make is_pinnable_page a macro
>>
>> As it is currently defined before page_to_section() which it needs.
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> I still see the same problem in next-20210203, and your patch below
> fixes it for me.
> Did you drop it from the latest build?
> 
>        Arnd

After the most recent build errors, I tried to apply Pavel's patch
  https://lore.kernel.org/linux-mm/CA+CK2bBjC8=cRsL5VhWkcevPsqSXWhsANVjsFNMERLT8vWtiQw@mail.gmail.com/
but patch said that it was already applied (by Andrew I think),
so I bailed out (gave up).


>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 58f250cabea6..a608feb0d42e 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1128,11 +1128,9 @@ static inline bool is_zone_movable_page(const struct page *page)
>>  }
>>
>>  /* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
>> -static inline bool is_pinnable_page(struct page *page)
>> -{
>> -       return !(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||
>> -               is_zero_pfn(page_to_pfn(page));
>> -}
>> +#define is_pinnable_page(page)         \
>> +       (!(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||  \
>> +               is_zero_pfn(page_to_pfn(page)))
>>
>>  #ifdef CONFIG_DEV_PAGEMAP_OPS
>>  void free_devmap_managed_page(struct page *page);


-- 
~Randy

