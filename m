Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87140262445
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 02:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgIIAzv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 20:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIIAzs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 20:55:48 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB173C061755
        for <linux-next@vger.kernel.org>; Tue,  8 Sep 2020 17:55:46 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id r25so1437308ioj.0
        for <linux-next@vger.kernel.org>; Tue, 08 Sep 2020 17:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6Dx2MkY/ggkdjnu/P51HmBKn7Ik/BCOoZh0L3EKoOjQ=;
        b=UBe2XT6X42KA1qEeTkeBquNQbFbcZQkfUPGWDhtROFlB5Gz2LVPYHf/NF33qENcdGF
         jTf6zZzxfOg38mOk741tMj2q4AGBQbJYRQpz1ayC5pM4/bnEB6dmrs6GJd3G0D0JQqNO
         s2b9DvuzNl0PgJhIFA2evp3LTDLZYUkFZ4408=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Dx2MkY/ggkdjnu/P51HmBKn7Ik/BCOoZh0L3EKoOjQ=;
        b=Hd0JShx68cdGrf0XlhMnYuHbQAJOnQwVcwMIt73moXKbMm10NuMtWi6V1Z5FOMT5K4
         jUScVjp2wtXn0CC59PeXKdZ9khvftM3/d0ax1I92jgWfAr91gKEawjC5GYIxrBYUY3q+
         AcWxFzZKiXKh4ejW+t+uJ0q7hyGIKxxD8ZNhugB33iiyrgigzIkCcOuDfWMN6HoT2QCZ
         q1DhnzidZlcbOqVH8N7U0obM2vwhXLh9Kl4mCQUGcNBLRJI1J3PM2/kbqzWsVWaRhr/I
         yK46FjvUhnCD7rZtNwfVluNiJ30wxBousaPa5WlrtS2hd7uRw4kOJagXjfr4GL9t57qD
         +glA==
X-Gm-Message-State: AOAM531psEJ7bCE7SlQddllqonST2sLrGNjMyzV97nv2ehr2u7+6RGJ2
        SlD0SoY6HBLgYxJoQVtyife1DYlzdzgPRQ==
X-Google-Smtp-Source: ABdhPJwMWuH/oc8NL3nYvyy8iW+VTg8aZ8cxeSxipUktwCAWv4LAuNEPbCJD7QDErXkFldmxOVNDFw==
X-Received: by 2002:a02:887:: with SMTP id 129mr1771603jac.130.1599612946225;
        Tue, 08 Sep 2020 17:55:46 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id h2sm502376ioj.5.2020.09.08.17.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 17:55:45 -0700 (PDT)
Subject: Re: linux-next: Tree for Sep 2 (lib/ubsan.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200902180950.4bc7c4de@canb.auug.org.au>
 <3abfa193-a56e-66ba-1080-885906fa0196@infradead.org>
 <fdf322d4-cc01-2c85-67cd-86b2d6f4ebff@infradead.org>
 <CAFd5g44g6OrL3fxQNRZ1rR0PruAty8tBZr8JDzM-oonZJRDZyw@mail.gmail.com>
 <84531c68-2ac8-924b-5e71-077f9abb2503@infradead.org>
 <20200909104619.0902238c@canb.auug.org.au>
 <dea1bacd-48c2-067b-1bb2-00a0ee91196d@infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <90719242-ab0e-7bd9-1cce-5aac8940eb23@linuxfoundation.org>
Date:   Tue, 8 Sep 2020 18:55:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dea1bacd-48c2-067b-1bb2-00a0ee91196d@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/8/20 6:49 PM, Randy Dunlap wrote:
> On 9/8/20 5:46 PM, Stephen Rothwell wrote:
>> Hi Randy,
>>
>> On Tue, 8 Sep 2020 07:38:31 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> On 9/4/20 12:59 AM, Brendan Higgins wrote:
>>>> On Thu, Sep 3, 2020 at 11:12 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>>
>>>>> On 9/2/20 8:44 AM, Randy Dunlap wrote:
>>>>>> On 9/2/20 1:09 AM, Stephen Rothwell wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> Changes since 20200828:
>>>>>>>   
>>>>>>
>>>>>>
>>>>>> on i386:
>>>>>>
>>>>>> ../lib/ubsan.c: In function ‘ubsan_prologue’:
>>>>>> ../lib/ubsan.c:141:2: error: implicit declaration of function ‘kunit_fail_current_test’; did you mean ‘kunit_init_test’? [-Werror=implicit-function-declaration]
>>>>>>    kunit_fail_current_test();
>>>>>>
>>>>>>
>>>>>> Full randconfig file is attached.
>>>>>>   
>>>>>
>>>>> Hi Brendan,
>>>>>
>>>>> Do you know anything about this build error?
>>>>>
>>>>> I can't find kunit_fail_current_test() anywhere.
>>>>
>>>> Yeah, this got applied for some reason without the prerequisite
>>>> patches. It is from a two patch series, the other being here:
>>>>
>>>> https://lore.kernel.org/linux-kselftest/20200813205722.1384108-1-urielguajardojr@gmail.com/
>>>>
>>>> which in turn depends on another patchset which didn't make it into 5.9.
>>>>
>>>> Again, I don't know why this was applied without it's prereqs. Sorry about that.
>>>>    
>>>
>>> Well.  Who is responsible for this small mess?
>>> It is still killing linux-next builds for me (2020-0908).
>>
>> It came in via the kunit-next tree (Shuah cc'd).  I will revert commit
>> abe83f7621ee ("kunit: ubsan integration") today.
> 
> 

Sorry about that. I picked this up for 5.10 since it had the reviewed
by tags from Brendan.

I will drop this from kselftest kunit

thanks,
-- Shuah

