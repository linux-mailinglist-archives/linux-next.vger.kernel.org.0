Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C65429AB2
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 03:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhJLBFn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 21:05:43 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:14326 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhJLBFm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 21:05:42 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HSy3G6HCHz8ypD;
        Tue, 12 Oct 2021 08:58:50 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 12 Oct 2021 09:03:39 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 12 Oct 2021 09:03:39 +0800
Message-ID: <3796d319-10a9-9721-f300-44a28f1f7507@huawei.com>
Date:   Tue, 12 Oct 2021 09:03:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: mm/kasan/init.c:282:20: error: redefinition of
 'kasan_populate_early_vm_area_shadow'
Content-Language: en-US
To:     Andrew Morton <akpm@linux-foundation.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
CC:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYv1Vbc-Y_czipb-z1bG=9axE4R1BztKGqWz-yy=+Wcsqw@mail.gmail.com>
 <CA+G9fYtD2EFu7-j1wPLCiu2yVpZb_wObXXXebKNSW5o4gh9vgA@mail.gmail.com>
 <20211011135345.9506437ee2504a81054dc06f@linux-foundation.org>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211011135345.9506437ee2504a81054dc06f@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2021/10/12 4:53, Andrew Morton wrote:
> On Mon, 11 Oct 2021 18:12:44 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> 
>> + Andrew Morton <akpm@linux-foundation.org>
>>
>> On Mon, 11 Oct 2021 at 17:08, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>>
>>> Regression found on x86_64 gcc-11 built with KASAN enabled.
>>> Following build warnings / errors reported on linux next 20211011.
>>>
>>> metadata:
>>>      git_describe: next-20211011
>>>      git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>>>      git_short_log: d3134eb5de85 (\"Add linux-next specific files for 20211011\")
>>>      target_arch: x86_64
>>>      toolchain: gcc-11
>>>
>>> build error :
>>> --------------
>>> mm/kasan/init.c:282:20: error: redefinition of
>>> 'kasan_populate_early_vm_area_shadow'
>>>    282 | void __init __weak kasan_populate_early_vm_area_shadow(void *start,
>>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> In file included from include/linux/mm.h:34,
>>>                   from include/linux/memblock.h:13,
>>>                   from mm/kasan/init.c:9:
>>> include/linux/kasan.h:463:20: note: previous definition of
>>> 'kasan_populate_early_vm_area_shadow' with type 'void(void *, long
>>> unsigned int)'
>>>    463 | static inline void kasan_populate_early_vm_area_shadow(void *start,
>>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> make[3]: *** [scripts/Makefile.build:288: mm/kasan/init.o] Error 1
>>> make[3]: Target '__build' not remade because of errors.
>>>
>>>
>>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>>
>>> build link:
>>> -----------
>>> https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/build.log
>>>
>>> build config:
>>> -------------
>>> https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/config
>>>
>>> # To install tuxmake on your system globally
>>> # sudo pip3 install -U tuxmake
>>> tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-11
>>> --kconfig defconfig --kconfig-add
>>> https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/config
> 
> Presumably "kasan: arm64: fix pcpu_page_first_chunk crash with
> KASAN_VMALLOC".  Let's cc Kefeng.

Yes, I send a fix patch, and reply this mail, see
https://lore.kernel.org/linux-mm/5077aa7e-0167-33b6-35f0-0ea7df8f2375@huawei.com/

> 
> .
> 
