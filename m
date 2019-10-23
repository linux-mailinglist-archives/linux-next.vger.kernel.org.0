Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC4C2E128C
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 08:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfJWG5l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 02:57:41 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:46868 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725796AbfJWG5k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Oct 2019 02:57:40 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4F145F217A17E3EA47FD;
        Wed, 23 Oct 2019 14:57:38 +0800 (CST)
Received: from [127.0.0.1] (10.74.221.148) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
 14:57:37 +0800
Subject: Re: linux-next: Tree for Oct 23
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Salyzyn <salyzyn@android.com>
References: <20191023155519.2d6765d4@canb.auug.org.au>
 <d1a57062-24cb-e9c4-e1db-07406b1cea9a@hisilicon.com>
 <CAMuHMdX1rhmvpWBHzvDYRNeYyotNp2ct1ysy4Jd0SjVUvGJd-Q@mail.gmail.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <b2da5636-3907-2d34-af8a-5600729453d4@hisilicon.com>
Date:   Wed, 23 Oct 2019 14:57:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX1rhmvpWBHzvDYRNeYyotNp2ct1ysy4Jd0SjVUvGJd-Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.74.221.148]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Geert,

On 2019/10/23 14:44, Geert Uytterhoeven wrote:
> On Wed, Oct 23, 2019 at 8:17 AM Shaokun Zhang
> <zhangshaokun@hisilicon.com> wrote:
>> +Cc: Mark Salyzyn
>>
>> There is a compiler failure on arm64 platform, as follow:
>> zhangshaokun@ubuntu:~/linux-next$ make -j64
>>   CALL    scripts/atomic/check-atomics.sh
>>   CC      arch/arm64/kernel/asm-offsets.s
>> In file included from ./include/linux/sysctl.h:30:0,
>>                  from ./include/linux/umh.h:9,
>>                  from ./include/linux/kmod.h:9,
>>                  from ./include/linux/module.h:13,
>>                  from ./include/linux/acpi.h:29,
>>                  from ./include/acpi/apei.h:9,
>>                  from ./include/acpi/ghes.h:5,
>>                  from ./include/linux/arm_sdei.h:8,
>>                  from arch/arm64/kernel/asm-offsets.c:10:
>> ./include/uapi/linux/sysctl.h:561:29: error: expected ‘,’ or ‘}’ before ‘__attribute__’
>>   NET_IPV6_TEMP_PREFERED_LFT __attribute__((deprecated)) = /* NOTYPO */
>>                              ^
>> scripts/Makefile.build:99: recipe for target 'arch/arm64/kernel/asm-offsets.s' failed
>> make[1]: *** [arch/arm64/kernel/asm-offsets.s] Error 1
>> Makefile:1108: recipe for target 'prepare0' failed
>> make: *** [prepare0] Error 2
>>
>> It's the commit <79f0cf35dccb> ("treewide: cleanup: replace prefered with preferred").
> 
> After receiving a report from kisskb for failures for m68k, looking at
> http://kisskb.ellerman.id.au/kisskb/head/f3c452cfc59c817950b150b51ec2b33409d7640b/
> and doing some testing, it looks like this construct is supported by gcc-7
> and gcc-8, but not by gcc-4.6.3 and gcc-5. Don't know about gcc-6.
> 

GCC version is 5.4.0
zhangshaokun@ubuntu:~/linux-next$ gcc --version
gcc (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Thanks,

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
> .
> 

