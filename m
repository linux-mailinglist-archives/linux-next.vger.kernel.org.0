Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0CD387516
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 11:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242478AbhERJ3k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 May 2021 05:29:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:44376 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240100AbhERJ3i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 May 2021 05:29:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 60CE4AE8D;
        Tue, 18 May 2021 09:28:19 +0000 (UTC)
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in kmalloc_index()
 to compile-time
To:     Nathan Chancellor <nathan@kernel.org>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc:     akpm@linux-foundation.org, iamjoonsoo.kim@lge.com,
        rientjes@google.com, penberg@kernel.org, cl@linux.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        naresh.kamboju@linaro.org, clang-built-linux@googlegroups.com,
        linux-next@vger.kernel.org, ndesaulniers@google.com,
        lkft-triage@lists.linaro.org, sfr@canb.auug.org.au, arnd@arndb.de,
        Marco Elver <elver@google.com>
References: <20210511173448.GA54466@hyeyoo> <20210515210950.GA52841@hyeyoo>
 <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
 <YKC9CeAfw3aBmHTU@archlinux-ax161> <20210518003859.GC80297@hyeyoo>
 <a1287a21-bcbb-77ed-c88d-f5890b785213@kernel.org>
From:   Vlastimil Babka <vbabka@suse.cz>
Message-ID: <71416382-2e4c-5e03-df9c-265fda41c2de@suse.cz>
Date:   Tue, 18 May 2021 11:28:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a1287a21-bcbb-77ed-c88d-f5890b785213@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/18/21 2:43 AM, Nathan Chancellor wrote:
> On 5/17/2021 5:38 PM, Hyeonggon Yoo wrote:
>> On Sat, May 15, 2021 at 11:34:49PM -0700, Nathan Chancellor wrote:
>>> This should work I think:
>>
>> compiled well with clang-10.0.1, clang-11.0.0,
>> and gcc-10.2.0 with x86_64 default config.
>>
>> is the condition CONFIG_CLANG_VERSION > 110000,
>> not including 110000 it self?

Good spot.

> Ah sorry, that should definitely be >= :(
> 
> That is what I get for writing an email that late... in reality, it probably
> won't matter due to the availability of 11.0.1 and 11.1.0 but it should
> absolutely be changed.
> 
> I have not given Nick's patch a go yet but would something like this be
> acceptable?

Yes.

> If so, did you want me to send a formal fixup patch or did you want
> to send a v4? I have no personal preference.

At this point a fixup is the usual way. Andrew might squash it to the original
patch (also with Marco's fixup) before sending to Linus.

>>> diff --git a/include/linux/slab.h b/include/linux/slab.h
>>> index 9d316aac0aba..1b653266f2aa 100644
>>> --- a/include/linux/slab.h
>>> +++ b/include/linux/slab.h
>>> @@ -413,7 +413,7 @@ static __always_inline unsigned int
>>> __kmalloc_index(size_t size,
>>>       if (size <=  16 * 1024 * 1024) return 24;
>>>       if (size <=  32 * 1024 * 1024) return 25;
>>>   -    if (size_is_constant)
>>> +    if ((IS_ENABLED(CONFIG_CC_IS_GCC) || CONFIG_CLANG_VERSION > 110000) &&
>>> size_is_constant)
>>>           BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
>>>       else
>>>           BUG();
> 

