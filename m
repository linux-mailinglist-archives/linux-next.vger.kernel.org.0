Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC0E262437
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 02:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgIIAtr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 20:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgIIAtq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 20:49:46 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE5BC061573;
        Tue,  8 Sep 2020 17:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=CS9bX/6NWAH+bwaOyj4vyLqngTqemqrtGhTrAvO3qS0=; b=QA/EEI7ih77/kk+1Vm/rihgHoB
        tKU/MDDrvI5cI+w9nxE+ngWNXl8Tndp31Tr/rm+d5CU5aMvHA8cTlCWdeXpGFse+tE2/QV35Bz4ra
        LZUMptYS2B8VRN+S2ZtH0UzNMFdBGCGzTUADbXKLmkDj+cBkMqKc50uEdzaTAEX7dwqpxEg7oo+CN
        8OSGJAVkkCZou5VCsibV1rdDnPbEbYrVH2E04FBL4qEnWxsq51WsL3X9FS73UjivjCvlc8v953Ziw
        PPMNAaDpBbJ+AkBi8+4k7CC1IAzDKyyHZbwTqhPxoZPBnNZY2nptcwrSBvVYyH0thzKL1yCTJluVG
        5ox0mnqA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFoIw-0005el-RE; Wed, 09 Sep 2020 00:49:43 +0000
Subject: Re: linux-next: Tree for Sep 2 (lib/ubsan.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200902180950.4bc7c4de@canb.auug.org.au>
 <3abfa193-a56e-66ba-1080-885906fa0196@infradead.org>
 <fdf322d4-cc01-2c85-67cd-86b2d6f4ebff@infradead.org>
 <CAFd5g44g6OrL3fxQNRZ1rR0PruAty8tBZr8JDzM-oonZJRDZyw@mail.gmail.com>
 <84531c68-2ac8-924b-5e71-077f9abb2503@infradead.org>
 <20200909104619.0902238c@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dea1bacd-48c2-067b-1bb2-00a0ee91196d@infradead.org>
Date:   Tue, 8 Sep 2020 17:49:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200909104619.0902238c@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/8/20 5:46 PM, Stephen Rothwell wrote:
> Hi Randy,
> 
> On Tue, 8 Sep 2020 07:38:31 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 9/4/20 12:59 AM, Brendan Higgins wrote:
>>> On Thu, Sep 3, 2020 at 11:12 PM Randy Dunlap <rdunlap@infradead.org> wrote:  
>>>>
>>>> On 9/2/20 8:44 AM, Randy Dunlap wrote:  
>>>>> On 9/2/20 1:09 AM, Stephen Rothwell wrote:  
>>>>>> Hi all,
>>>>>>
>>>>>> Changes since 20200828:
>>>>>>  
>>>>>
>>>>>
>>>>> on i386:
>>>>>
>>>>> ../lib/ubsan.c: In function ‘ubsan_prologue’:
>>>>> ../lib/ubsan.c:141:2: error: implicit declaration of function ‘kunit_fail_current_test’; did you mean ‘kunit_init_test’? [-Werror=implicit-function-declaration]
>>>>>   kunit_fail_current_test();
>>>>>
>>>>>
>>>>> Full randconfig file is attached.
>>>>>  
>>>>
>>>> Hi Brendan,
>>>>
>>>> Do you know anything about this build error?
>>>>
>>>> I can't find kunit_fail_current_test() anywhere.  
>>>
>>> Yeah, this got applied for some reason without the prerequisite
>>> patches. It is from a two patch series, the other being here:
>>>
>>> https://lore.kernel.org/linux-kselftest/20200813205722.1384108-1-urielguajardojr@gmail.com/
>>>
>>> which in turn depends on another patchset which didn't make it into 5.9.
>>>
>>> Again, I don't know why this was applied without it's prereqs. Sorry about that.
>>>   
>>
>> Well.  Who is responsible for this small mess?
>> It is still killing linux-next builds for me (2020-0908).
> 
> It came in via the kunit-next tree (Shuah cc'd).  I will revert commit
> abe83f7621ee ("kunit: ubsan integration") today.


Thank you!

-- 
~Randy

