Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43AF3F7BB3
	for <lists+linux-next@lfdr.de>; Wed, 25 Aug 2021 19:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242337AbhHYRuJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Aug 2021 13:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbhHYRuI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Aug 2021 13:50:08 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E1DC061757;
        Wed, 25 Aug 2021 10:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=PrWkaC3oZYQq319udCsme3fnU3/flYB0GPD+uh3jvX4=; b=wtOcjZOEdZQ8ep3ZcYzHWcrXub
        5hEd8Zyu8gXYp1BYRSdDXTTZHtuuKeZViyzK/LmNqRTuKiv4Aemff/9zrCZaVDiU38wf6H/hLEqBH
        uTRaSakaYpjO8+YF9zU3VRT5DldJjLyQAkxN1Xk3mPL7etQ77Tr7vPmLye2vKhiwGl7VbiXZ8Z92Y
        nACvT082cTh7HamOeIcGySzrnIkfmpHWZy6n57jWu7CmcQmceH+BaKO2AfonB6HOXGf6HTfnRYgVV
        4SAFtNM8n1QCBca+XRFQZemAoo9UbJ/RNjyFlIs4IpB2+4ZJt4Cxn/W3ymVyD9/12dO3DV3Wo2tgs
        v3GQw4Tw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mIx1d-0087sf-39; Wed, 25 Aug 2021 17:49:21 +0000
Subject: Re: linux-next: Tree for Aug 20 (Wno-alloc-size-larger-than)
To:     Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
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
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1d7780f0-424b-71d4-732b-c28a796d1166@infradead.org>
Date:   Wed, 25 Aug 2021 10:49:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202108250959.CD734CED@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/25/21 10:04 AM, Kees Cook wrote:
> On Tue, Aug 24, 2021 at 11:58:59AM +1000, Stephen Rothwell wrote:
>> On Mon, 23 Aug 2021 18:24:44 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> This is just weird. What I am seeing is that for every source file
>>> where gcc emits a warning: it then follows that up with this
>>>>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>
>> I see the same, as well as:
>>
>> <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>
>> But only on my gcc 7.3.1 builds (the rest are gcc 10).
>>
>>> Smells like a gcc bug to me.
>>
>> Yes
>>
>> Also noted here: https://github.com/DynamoRIO/drmemory/issues/2099 (second comment)
> 
> Okay, I think this work-around should work. I've been able to reproduce
> the weird conditions, and this seems to behave correctly. Andrew, can
> you fixup the fixup with this?
> 
> 
> diff --git a/Makefile b/Makefile
> index 26640899e7ca..c1842014a5de 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1094,8 +1094,13 @@ endif
>   
>   ifdef CONFIG_CC_IS_GCC
>   # The allocators already balk at large sizes, so silence the compiler
> -# warnings for bounds checks involving those possible values.
> -KBUILD_CFLAGS += $(call cc-option, -Wno-alloc-size-larger-than)
> +# warnings for bounds checks involving those possible values. While
> +# -Wno-alloc-size-larger-than would normally be used here, some versions
> +# of gcc (<9.1) weirdly don't handle the option correctly when _other_
> +# warnings are produced (?!), so instead use SIZE_MAX to effectively
> +# disable it.
> +# https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
> +KBUILD_CFLAGS += $(call cc-option, -Walloc-size-larger-than=SIZE_MAX)
>   endif
>   
>   # disable invalid "can't wrap" optimizations for signed / pointers
> 

Hi Kees,

I get a lot of these:

../include/linux/slab.h: In function ‘keyctl_instantiate_key_common’:
cc1: warning: invalid argument ‘SIZE_MAX’ to ‘-Walloc-size-larger-than=’



-- 
~Randy

