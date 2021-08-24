Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB2F3F557C
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 03:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233492AbhHXBZb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 21:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbhHXBZb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 21:25:31 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB23C061575;
        Mon, 23 Aug 2021 18:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=hGpkKZDiwD3BmHE8QKgFdvjl3+ISDkWTfd1HK+eqDq0=; b=1Q2snXAJqPpTgI6S4nbW1A5XDj
        luDNcNivs9KfSD3dWnoDoAyeS2f/jhufeP1z9yN+VLy/9Te7+Bcr148XGjBZBz5CmLJYJTwDmgnOE
        ixYVAxCJTorNC3nUXTHLsfvGhLytoLy6vsz5PcbG1/gwPkNiOdGmFmbsf65bB6QxooAOboLXzu7qb
        YRU1ohQfxwnNtUjBW9+B3oS1XKkTVIw317CuZS9Npzfvsj1r/XlhHCPLt3bPnFiIsngN5sMxpnQCd
        ffqDbCRZTdpEq5ckbZCIJqZhDyvzFc04+wHuUIAq6mMmevLl9b+fxDGQDrReNQm6x2rVwmh0WaDZJ
        zJhTf0rg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mILBF-0019od-9e; Tue, 24 Aug 2021 01:24:45 +0000
Subject: Re: linux-next: Tree for Aug 20 (Wno-alloc-size-larger-than)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
References: <20210820192615.23e2e617@canb.auug.org.au>
 <2706a406-9f72-7df1-03f6-f8e852897eb2@infradead.org>
 <202108202248.921E8C66@keescook>
 <8b9cb816-9d8a-2633-1afa-f5c4597a8314@infradead.org>
 <20210823203742.5169ad54@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <66615de5-4acb-8d85-6d69-ddd0b9609348@infradead.org>
Date:   Mon, 23 Aug 2021 18:24:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210823203742.5169ad54@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/23/21 3:37 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Sat, 21 Aug 2021 12:09:48 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 8/20/21 10:48 PM, Kees Cook wrote:
>>> On Fri, Aug 20, 2021 at 02:54:05PM -0700, Randy Dunlap wrote:
>>>> On 8/20/21 2:26 AM, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20210819:
>>>>>   
>>>>
>>>> Both linux-next and mmotm have many of these warnings when using
>>>> gcc (SUSE Linux) 7.5.0:
>>>>
>>>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>>
>>> Ew. Thanks for letting me know. I thought I'd verified this existed in
>>> gcc going back to 4.9, but it looks like I did something wrong in that
>>> test.
>>>
>>> I think this should fix it:
>>>
>>> diff --git a/Makefile b/Makefile
>>> index b0fafc41b686..e33ffa05899e 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -1097,7 +1097,7 @@ endif
>>>    ifdef CONFIG_CC_IS_GCC
>>>    # The allocators already balk at large sizes, so silence the compiler
>>>    # warnings for bounds checks involving those possible values.
>>> -KBUILD_CFLAGS += -Wno-alloc-size-larger-than
>>> +KBUILD_CFLAGS += $(call cc-option, -Wno-alloc-size-larger-than)
>>>    endif
>>>    >   # disable invalid "can't wrap" optimizations for signed / pointers
>>>    
>>
>> Well. That didn't help. This is very weird.
>>
>> This -Wno... option works (is accepted, no warning) on most files
>> that are being built, but a few files report an error with it:
>>
>> ../drivers/gpu/drm/radeon/radeon_object.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>
>> ../drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>
>> ../drivers/hwmon/dell-smm-hwmon.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>
>>     CC      arch/x86/kernel/cpu/proc.o
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>
>> ../arch/x86/kvm/mmu/mmu.c: At top level:
>> cc1: error: unrecognized command line option '-Wno-alloc-size-larger-than' [-Werror]
>>
>> ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>
>> ../kernel/trace/trace_osnoise.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>
>>     CC      kernel/dma/mapping.o
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
>>
>>
>> It seems like it might be related to some .config option.
>>
>> I did a couple of partial builds with V=1 but that info didn't help me any.
>>
>>
>> If I am the only person seeing (reporting) this build warning, it could
>> just be (another) SUSE GCC-ism. (had one just last week with  -Wmain and
>> kernel/trace/trace_osnoise.c)
> 
> Today, I am also seeing thsese, but only with my sparc{,64} defconfig
> cross builds.  This is with gcc 7.3.1 built from sources.  I also just
> get a few of them.
> 
> Also, I have the above "fix" patch applied (Andrew added it to mmots
> today).
> 
> So something weird is happening.

This is just weird. What I am seeing is that for every source file
where gcc emits a warning: it then follows that up with this
>> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'

E.g.:

../kernel/printk/index.c:146:13: warning: ‘pi_remove_file’ defined but not used [-Wunused-function]
  static void pi_remove_file(struct module *mod)
              ^~~~~~~~~~~~~~
cc1: warning: unrecognized command line option ‘-Wno-alloc-size-larger-than’

../fs/remap_range.c: In function ‘remap_verify_area’:
../fs/remap_range.c:102:16: warning: unused variable ‘inode’ [-Wunused-variable]
   struct inode *inode = file_inode(file);
                 ^~~~~
../fs/remap_range.c: At top level:
cc1: warning: unrecognized command line option ‘-Wno-alloc-size-larger-than’

../fs/locks.c: In function ‘fcntl_setlk64’:
../fs/locks.c:2509:16: warning: unused variable ‘inode’ [-Wunused-variable]
   struct inode *inode = locks_inode(filp);
                 ^~~~~
../fs/locks.c: At top level:
cc1: warning: unrecognized command line option ‘-Wno-alloc-size-larger-than’

../drivers/platform/chrome/./cros_ec_trace.h: In function ‘trace_raw_output_cros_ec_sensorhub_filter’:
../drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format ‘%d’ expects argument of type ‘int’, but argument 7 has type ‘s64 {aka long long int}’ [-Wformat=]
   TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld len: %d x: %12lld y: %12lld",
             ^
../include/trace/trace_events.h:399:27: note: in definition of macro ‘DECLARE_EVENT_CLASS’
   trace_event_printf(iter, print);    \
                            ^~~~~
../include/trace/trace_events.h:80:9: note: in expansion of macro ‘PARAMS’
          PARAMS(print));         \
          ^~~~~~
../drivers/platform/chrome/./cros_ec_trace.h:135:1: note: in expansion of macro ‘TRACE_EVENT’
  TRACE_EVENT(cros_ec_sensorhub_filter,
  ^~~~~~~~~~~
../drivers/platform/chrome/./cros_ec_trace.h:156:2: note: in expansion of macro ‘TP_printk’
   TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld len: %d x: %12lld y: %12lld",
   ^~~~~~~~~
In file included from ../include/trace/trace_events.h:433:0,
                  from ../include/trace/define_trace.h:102,
                  from ../drivers/platform/chrome/cros_ec_trace.h:178,
                  from ../drivers/platform/chrome/cros_ec_trace.c:215:
../drivers/platform/chrome/./cros_ec_trace.h:156:80: note: format string is defined here
   TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld len: %d x: %12lld y: %12lld",
                                                                                ~^
                                                                                %lld
../drivers/platform/chrome/cros_ec_trace.c: At top level:
cc1: warning: unrecognized command line option ‘-Wno-alloc-size-larger-than’

warning: unsafe strscpy() usage lacked '__write_overflow' warning in ../lib/test_fortify/write_overflow-strscpy.c
   CC      drivers/base/driver.o
In file included from ../include/linux/string.h:253:0,
                  from ../arch/x86/include/asm/page_32.h:35,
                  from ../arch/x86/include/asm/page.h:14,
                  from ../arch/x86/include/asm/thread_info.h:12,
                  from ../include/linux/thread_info.h:60,
                  from ../arch/x86/include/asm/preempt.h:7,
                  from ../include/linux/preempt.h:78,
                  from ../include/linux/spinlock.h:55,
                  from ../include/linux/mmzone.h:8,
                  from ../include/linux/gfp.h:6,
                  from ../include/linux/slab.h:15,
                  from ../lib/test_fortify/test_fortify.h:4,
                  from ../lib/test_fortify/write_overflow-strscpy.c:5:
In function ‘strscpy’,
     inlined from ‘do_fortify_tests’ at ../lib/test_fortify/test_fortify.h:34:2:
../include/linux/fortify-string.h:154:3: error: call to ‘__write_overflow’ declared with attribute error: detected write beyond size of object (1st parameter)
    __write_overflow();
    ^~~~~~~~~~~~~~~~~~
../lib/test_fortify/write_overflow-strscpy.c: At top level:
cc1: error: unrecognized command line option ‘-Wno-alloc-size-larger-than’ [-Werror]

Smells like a gcc bug to me.

-- 
~Randy

