Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F82D30E856
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 01:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbhBDAL1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 19:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233795AbhBDALZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2021 19:11:25 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A84C061573;
        Wed,  3 Feb 2021 16:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=WCEV4h3i5ZqwbY+9PCW/R5i4NnrGI9VK8JSkI4Ieh7o=; b=f14gDCvQjBalANLQAwQaViRP5i
        FVaQ4l+s5l/E2uM+VjvFvVDuqojUYXq5VXmGsOfQa9HjTnvwTkRvwXxUyeYLWdfxC6jqkoh/kcWjd
        4zEcPRdxoYg4qACpBYoq4y9yz/kf2qH0eNvvvmrmyfsHW8GlFr26xGNtDyPfr+iyoX3p13wL2Nbc8
        i0ilVLXYCwgFPigw5zzqrqejc4WOExKPAn272428Th0dkWjcqhbBJQjEtK5ly2Bh8TZBcFyuO3TcH
        1sDPMYiN+td6lOlEyXrWplFtUbttuV1UnzY7MJVbDVVOnbe1U54IPXpZGDkVJy1/yGEaHnBkZIcit
        yvb3kkkQ==;
Received: from [2601:1c0:6280:3f0::aec2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l7SEM-0002r5-59; Thu, 04 Feb 2021 00:10:42 +0000
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210202200324.5179db33@canb.auug.org.au>
 <CAK8P3a3uJfyt6vsgTdSjnE23V4E_Mw=N89nrMPLJ6bhA363nqw@mail.gmail.com>
 <5504da4f-7eec-ecb0-c47d-7821d06dc880@infradead.org>
 <CAK8P3a2Y9-5dhk1MaZhhnKQkbOtqOSqfqZA0c4ncBXgD8tJTZg@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4979e1dc-463c-7626-2c94-cb64ec09cd73@infradead.org>
Date:   Wed, 3 Feb 2021 16:10:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2Y9-5dhk1MaZhhnKQkbOtqOSqfqZA0c4ncBXgD8tJTZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/3/21 2:22 PM, Arnd Bergmann wrote:
> On Wed, Feb 3, 2021 at 6:34 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 2/3/21 9:09 AM, Arnd Bergmann wrote:
>>> On Tue, Feb 2, 2021 at 10:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>>>
>>>>   983cb10d3f90 ("mm/gup: do not migrate zero page")
>>>>
>>>> I have applied the following patch for today:
>>>>
>>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> Date: Tue, 2 Feb 2021 19:49:00 +1100
>>>> Subject: [PATCH] make is_pinnable_page a macro
>>>>
>>>> As it is currently defined before page_to_section() which it needs.
>>>>
>>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>
>>> I still see the same problem in next-20210203, and your patch below
>>> fixes it for me.
>>> Did you drop it from the latest build?
>>>
>>
>> After the most recent build errors, I tried to apply Pavel's patch
>>   https://lore.kernel.org/linux-mm/CA+CK2bBjC8=cRsL5VhWkcevPsqSXWhsANVjsFNMERLT8vWtiQw@mail.gmail.com/
>> but patch said that it was already applied (by Andrew I think),
>> so I bailed out (gave up).
> 
> As far as I can tell, there are two different bugs that got mixed up, and
> we need both Pavel's patch (which is now in -next) and Stephen's
> (which got dropped again).

Thanks. Having both patches makes my builds happy again. :)

-- 
~Randy

