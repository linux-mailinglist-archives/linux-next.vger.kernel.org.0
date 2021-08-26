Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F343F81F2
	for <lists+linux-next@lfdr.de>; Thu, 26 Aug 2021 07:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238002AbhHZFLV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 01:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbhHZFLU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Aug 2021 01:11:20 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB1DC0613C1;
        Wed, 25 Aug 2021 22:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=TVE7NbZzacaIfYVVXIofUoCaNaohrGP23Wzj79Kg2Mc=; b=xtZ25buKGe3aeldaTxY5JiXwN6
        mh4GutnkQfR8wqJ9R28p2ERKyW+9Wt7gVrcrpnIGCaTbg37ftWzEe/DLvNZZLcWOfx1SHGJq8OosJ
        Oq80GAveXcgPTVPbjrOGPpeLQA0C0UvYtetrsHBHANW92DtZ3qzNDtF2Hj3a3qSoNWwx4ZEptRSj3
        U0LSVooCEIpbRYnrAm0AXjXyc1diL/1QbhjuhLYm4vK1nhkWgmJlCvDDZ2bxSHGoKd1ggxQ5JV0SU
        N7b6EMIcIkiw8qUCgEoWj7BeStr5KOUQF4aGHkiEMNRcOOa4IuznQvJF7IFj4VojsMlloaIwCfdoZ
        pQwy5XvA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mJ7ek-009BKQ-Q4; Thu, 26 Aug 2021 05:10:26 +0000
Subject: Re: linux-next: Tree for Aug 20 (Wno-alloc-size-larger-than)
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
References: <20210820192615.23e2e617@canb.auug.org.au>
 <2706a406-9f72-7df1-03f6-f8e852897eb2@infradead.org>
 <202108202248.921E8C66@keescook>
 <8b9cb816-9d8a-2633-1afa-f5c4597a8314@infradead.org>
 <20210823203742.5169ad54@canb.auug.org.au>
 <66615de5-4acb-8d85-6d69-ddd0b9609348@infradead.org>
 <20210824115859.187f272f@canb.auug.org.au> <202108250959.CD734CED@keescook>
 <1d7780f0-424b-71d4-732b-c28a796d1166@infradead.org>
 <202108251958.4BA654453@keescook>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6b2b9423-4b25-a31e-290f-3ab26a92a655@infradead.org>
Date:   Wed, 25 Aug 2021 22:10:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202108251958.4BA654453@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/25/21 8:54 PM, Kees Cook wrote:
> On Wed, Aug 25, 2021 at 10:49:19AM -0700, Randy Dunlap wrote:
>> On 8/25/21 10:04 AM, Kees Cook wrote:
>>> On Tue, Aug 24, 2021 at 11:58:59AM +1000, Stephen Rothwell wrote:
>>>> On Mon, 23 Aug 2021 18:24:44 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>>
>>>>> This is just weird. What I am seeing is that for every source file
>>>>> where gcc emits a warning: it then follows that up with this
>>>>>>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>>>
>>>> I see the same, as well as:
>>>>
>>>> <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>>>
>>>> But only on my gcc 7.3.1 builds (the rest are gcc 10).
>>>>
>>>>> Smells like a gcc bug to me.
>>>>
>>>> Yes
>>>>
>>>> Also noted here: https://github.com/DynamoRIO/drmemory/issues/2099 (second comment)
>>>
>>> Okay, I think this work-around should work. I've been able to reproduce
>>> the weird conditions, and this seems to behave correctly. Andrew, can
>>> you fixup the fixup with this?
>>>
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 26640899e7ca..c1842014a5de 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -1094,8 +1094,13 @@ endif
>>>    ifdef CONFIG_CC_IS_GCC
>>>    # The allocators already balk at large sizes, so silence the compiler
>>> -# warnings for bounds checks involving those possible values.
>>> -KBUILD_CFLAGS += $(call cc-option, -Wno-alloc-size-larger-than)
>>> +# warnings for bounds checks involving those possible values. While
>>> +# -Wno-alloc-size-larger-than would normally be used here, some versions
>>> +# of gcc (<9.1) weirdly don't handle the option correctly when _other_
>>> +# warnings are produced (?!), so instead use SIZE_MAX to effectively
>>> +# disable it.
>>> +# https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
>>> +KBUILD_CFLAGS += $(call cc-option, -Walloc-size-larger-than=SIZE_MAX)
>>>    endif
>>>    # disable invalid "can't wrap" optimizations for signed / pointers
>>>
>>
>> Hi Kees,
>>
>> I get a lot of these:
>>
>> ../include/linux/slab.h: In function ‘keyctl_instantiate_key_common’:
>> cc1: warning: invalid argument ‘SIZE_MAX’ to ‘-Walloc-size-larger-than=’
> 
> O_o
> 
> I love how the documentation on this option is consistently wrong. :)
> 
> I haven't been able to exactly reproduce this error on godbolt.org, but
> I got close with trunk GCC:
> gcc: error: argument to '-Walloc-size-larger-than=' should be a non-negative integer optionally followed by a size unit
> 
> Even though stdint.h is included. :(
> 
> Okay. How about _this_ fix?
> 
> diff --git a/Makefile b/Makefile
> index efa9bd36b158..141a851930e6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1096,8 +1096,17 @@ endif
>   
>   ifdef CONFIG_CC_IS_GCC
>   # The allocators already balk at large sizes, so silence the compiler
> -# warnings for bounds checks involving those possible values.
> -KBUILD_CFLAGS += $(call cc-option, -Wno-alloc-size-larger-than)
> +# warnings for bounds checks involving those possible values. While
> +# -Wno-alloc-size-larger-than would normally be used here, earlier versions
> +# of gcc (<9.1) weirdly don't handle the option correctly when _other_
> +# warnings are produced (?!). Using -Walloc-size-larger-than=SIZE_MAX
> +# doesn't work (as it is documented to), silently resolving to "0" prior to
> +# version 9.1 (and producing an error more recently). Numeric values larger
> +# than PTRDIFF_MAX also don't work prior to version 9.1, which are silently
> +# ignored, continuing to default to PTRDIFF_MAX. So, left with no other
> +# choice, we must perform a versioned check to disable this warning.
> +# https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
> +KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
>   endif
>   
>   # disable invalid "can't wrap" optimizations for signed / pointers

Yes, this works for me. Thanks.

Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

