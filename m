Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410312E921B
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 09:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbhADIox (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 03:44:53 -0500
Received: from ptr.189.cn ([183.61.185.102]:12618 "EHLO 189.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726289AbhADIox (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Jan 2021 03:44:53 -0500
X-Greylist: delayed 531 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Jan 2021 03:44:51 EST
HMM_SOURCE_IP: 172.27.8.53:49401.1510557771
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-123.150.8.42 (unknown [172.27.8.53])
        by 189.cn (HERMES) with SMTP id 67190100896;
        Mon,  4 Jan 2021 16:32:47 +0800 (CST)
Received: from  ([123.150.8.42])
        by SZ-WEBMAIL05 with ESMTP id 25eea934587e4f18bbd903edeb6bea94 for linux-next@vger.kernel.org;
        Mon Jan  4 16:32:48 2021
X-Transaction-ID: 25eea934587e4f18bbd903edeb6bea94
X-filter-score: 
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Subject: Re: linux-next: build failures after merge of the staging tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210104122653.6f35b9bb@canb.auug.org.au>
 <CAMuHMdXWqO2WPKSxsfbr=-_rrXenEwJRW3rYko7VJCPwCnyeLA@mail.gmail.com>
From:   "chensong_2000@189.cn" <chensong_2000@189.cn>
Message-ID: <75a11414-fa59-a630-c025-7b232dc14be8@189.cn>
Date:   Mon, 4 Jan 2021 16:32:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXWqO2WPKSxsfbr=-_rrXenEwJRW3rYko7VJCPwCnyeLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

i will take care of this

在 2021/1/4 下午4:27, Geert Uytterhoeven 写道:
> On Mon, Jan 4, 2021 at 6:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> After merging the staging tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> In file included from include/linux/printk.h:6,
>>                   from include/linux/kernel.h:16,
>>                   from drivers/staging/board/kzm9d.c:4:
>> drivers/staging/board/kzm9d.c:28:17: error: initialization of 'initcall_t' {aka 'int (*)(void)'} from incompatible pointer type 'void (*)(void)' [-Werror=incompatible-pointer-types]
>>     28 | device_initcall(kzm9d_init);
>>        |                 ^~~~~~~~~~
>> include/linux/init.h:197:50: note: in definition of macro '___define_initcall'
>>    197 |   __attribute__((__section__(#__sec ".init"))) = fn;
>>        |                                                  ^~
>> include/linux/init.h:229:30: note: in expansion of macro '__define_initcall'
>>    229 | #define device_initcall(fn)  __define_initcall(fn, 6)
>>        |                              ^~~~~~~~~~~~~~~~~
>> drivers/staging/board/kzm9d.c:28:1: note: in expansion of macro 'device_initcall'
>>     28 | device_initcall(kzm9d_init);
>>        | ^~~~~~~~~~~~~~~
>> cc1: some warnings being treated as errors
>> In file included from include/linux/printk.h:6,
>>                   from include/linux/kernel.h:16,
>>                   from include/asm-generic/bug.h:20,
>>                   from arch/arm/include/asm/bug.h:60,
>>                   from include/linux/bug.h:5,
>>                   from include/linux/thread_info.h:12,
>>                   from include/asm-generic/current.h:5,
>>                   from ./arch/arm/include/generated/asm/current.h:1,
>>                   from include/linux/sched.h:12,
>>                   from include/linux/ratelimit.h:6,
>>                   from include/linux/dev_printk.h:16,
>>                   from include/linux/device.h:15,
>>                   from include/linux/dma-mapping.h:7,
>>                   from drivers/staging/board/armadillo800eva.c:12:
>> drivers/staging/board/armadillo800eva.c:90:17: error: initialization of 'initcall_t' {aka 'int (*)(void)'} from incompatible pointer type 'void (*)(void)' [-Werror=incompatible-pointer-types]
>>     90 | device_initcall(armadillo800eva_init);
>>        |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/init.h:197:50: note: in definition of macro '___define_initcall'
>>    197 |   __attribute__((__section__(#__sec ".init"))) = fn;
>>        |                                                  ^~
>> include/linux/init.h:229:30: note: in expansion of macro '__define_initcall'
>>    229 | #define device_initcall(fn)  __define_initcall(fn, 6)
>>        |                              ^~~~~~~~~~~~~~~~~
>> drivers/staging/board/armadillo800eva.c:90:1: note: in expansion of macro 'device_initcall'
>>     90 | device_initcall(armadillo800eva_init);
>>        | ^~~~~~~~~~~~~~~
>>
>> Caused by commit
>>
>>    850c35bb28ec ("staging: board: Remove macro board_staging")
>>
>> I have used the staging tree from next-20201223 for today.
> 
> Note that a similar patch was (IMHO rightfully) rejected 3 years ago:
> https://lore.kernel.org/lkml/20170220175506.GA30142@kroah.com/
> 
> So please drop it. Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 
