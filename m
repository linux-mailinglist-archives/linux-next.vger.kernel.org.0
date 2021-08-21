Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE14B3F3C3A
	for <lists+linux-next@lfdr.de>; Sat, 21 Aug 2021 21:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhHUTKc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 21 Aug 2021 15:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbhHUTKc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 21 Aug 2021 15:10:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55CAC061575;
        Sat, 21 Aug 2021 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=iZEDPivKwlo3Uk1kOv8lxw8OGv8caEXIgqwMoBsElr4=; b=SzCQyHfG1yILh1LK+X7M0joqRv
        VceUsJgtVK0XeZfY0zDI+kObDv1Ji0FLV0z/J4EVtbMgt4sAJRxquM/klnFTI2h9C/8oHsc9duUiR
        mPxN15P+Ips9zH2NqyXPct+n6ezejKcHZgLzZk1uNbHMDd1Mm4sbZ59LurBsEPoneLaiF4Okg3Lkf
        3b5YDiPHenXtPaDf9b5eyx+67rhA5xSWicrnXbWAT7MqNIZt7jaaMmbTT48ArcdD/px/Cy+7NfZoB
        dx7gmiRt5Kp91Mr/cnMaexwYHEegI8zAdXgWeR6JiHNK33f/BifTNRO6+G27DzgALIdKXze31f7Q4
        TuY/akAA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mHWNK-00D7HB-58; Sat, 21 Aug 2021 19:09:50 +0000
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
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8b9cb816-9d8a-2633-1afa-f5c4597a8314@infradead.org>
Date:   Sat, 21 Aug 2021 12:09:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202108202248.921E8C66@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/20/21 10:48 PM, Kees Cook wrote:
> On Fri, Aug 20, 2021 at 02:54:05PM -0700, Randy Dunlap wrote:
>> On 8/20/21 2:26 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20210819:
>>>
>>
>> Both linux-next and mmotm have many of these warnings when using
>> gcc (SUSE Linux) 7.5.0:
>>
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
> 
> Ew. Thanks for letting me know. I thought I'd verified this existed in
> gcc going back to 4.9, but it looks like I did something wrong in that
> test.
> 
> I think this should fix it:
> 
> diff --git a/Makefile b/Makefile
> index b0fafc41b686..e33ffa05899e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1097,7 +1097,7 @@ endif
>   ifdef CONFIG_CC_IS_GCC
>   # The allocators already balk at large sizes, so silence the compiler
>   # warnings for bounds checks involving those possible values.
> -KBUILD_CFLAGS += -Wno-alloc-size-larger-than
> +KBUILD_CFLAGS += $(call cc-option, -Wno-alloc-size-larger-than)
>   endif
>   
>   # disable invalid "can't wrap" optimizations for signed / pointers
> 

Well. That didn't help. This is very weird.

This -Wno... option works (is accepted, no warning) on most files
that are being built, but a few files report an error with it:

../drivers/gpu/drm/radeon/radeon_object.c: At top level:
cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'

../drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: At top level:
cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'

../drivers/hwmon/dell-smm-hwmon.c: At top level:
cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'

   CC      arch/x86/kernel/cpu/proc.o
cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'

../arch/x86/kvm/mmu/mmu.c: At top level:
cc1: error: unrecognized command line option '-Wno-alloc-size-larger-than' [-Werror]

../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c: At top level:
cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'

../kernel/trace/trace_osnoise.c: At top level:
cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'

   CC      kernel/dma/mapping.o
cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'


It seems like it might be related to some .config option.

I did a couple of partial builds with V=1 but that info didn't help me any.


If I am the only person seeing (reporting) this build warning, it could
just be (another) SUSE GCC-ism. (had one just last week with  -Wmain and
kernel/trace/trace_osnoise.c)


-- 
~Randy

