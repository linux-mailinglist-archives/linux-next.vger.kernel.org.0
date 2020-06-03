Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A971ED1BA
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 16:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgFCOJx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 10:09:53 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2271 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725833AbgFCOJx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 10:09:53 -0400
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.107])
        by Forcepoint Email with ESMTP id 33AC13A63DD522D2A079;
        Wed,  3 Jun 2020 15:09:51 +0100 (IST)
Received: from [127.0.0.1] (10.47.0.59) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 3 Jun 2020
 15:09:48 +0100
Subject: Re: arm64 build issue and mainline crash (was Re: linux-next: Tree
 for Jun 3)
To:     Ard Biesheuvel <ardb@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20200603210603.1fcf63ed@canb.auug.org.au>
 <ba1f622a-6866-2a58-706b-045e8a0d9012@huawei.com>
 <20200603221341.0705a2f9@canb.auug.org.au>
 <20200603222026.4cf661e0@canb.auug.org.au>
 <CAMj1kXFes_Q2r8o-7bNYoYzz0OLSy+h70fBd6-Vse=3syJDptg@mail.gmail.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <9f5863f0-9352-92df-8009-60dcc5a34ab9@huawei.com>
Date:   Wed, 3 Jun 2020 15:08:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFes_Q2r8o-7bNYoYzz0OLSy+h70fBd6-Vse=3syJDptg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.0.59]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

>>>> In addition, the reason I was testing this was because Linus' master
>>>> (d6f9469a03d8 Merge tag 'erofs-for-5.8-rc1' of
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs) was crashing:
>>>>
>>>> [ 5.368948] loop: module loaded
>>>> [ 5.372113] Unable to handle kernel paging request at virtual address
>>>> fffff9ffcfec4000
>>>> [ 5.380067] Mem abort info:
>>>> [ 5.382865]ESR = 0x96000044
>>>> [ 5.385927]EC = 0x25: DABT (current EL), IL = 32 bits
>>>> [ 5.391260]SET = 0, FnV = 0
>>>> [ 5.394319]EA = 0, S1PTW = 0
>>>> [ 5.397467] Data abort info:
>>>> [ 5.400354]ISV = 0, ISS = 0x00000044
>>>> [ 5.404203]CM = 0, WnR = 1
>>>> [ 5.407178] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000002f3f1000
>>>> [ 5.413909] [fffff9ffcfec4000] pgd=0000000000000000
>>>> [ 5.418807] Internal error: Oops: 96000044 [#1] PREEMPT SMP
>>>> [ 5.424399] Modules linked in:
>>>> [ 5.427462] CPU: 11 PID: 1 Comm: swapper/0 Not tainted
>>>> 5.7.0-05047-gd6f9469a03d8 #388
>>>> [ 5.435325] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05
>>>> IT21 Nemo 2.0 RC0 04/18/2018
>>>> [ 5.444499] pstate: 40000005 (nZcv daif -PAN -UAO BTYPE=--)
>>>> [ 5.450098] pc : __memset+0x16c/0x1c0
>>>> [ 5.453770] lr : pcpu_alloc+0x1a0/0x668
>>>> [ 5.457615] sp : ffff800011d3bbd0
>>>> [ 5.460936] x29: ffff800011d3bbd0 x28: ffff001fb5495180
>>>> [ 5.466267] x27: 0000000000000001 x26: 0000000000000100
>>>> [ 5.471597] x25: 0000000000000001 x24: 0000000000000001
>>>> [ 5.476928] x23: ffff80001135e9a0 x22: ffff80001196a200
>>>> [ 5.482259] x21: ffff80001196a360 x20: 0000000000000000
>>>> [ 5.487590] x19: 0000000000000000 x18: fffffe107e6fdb08
>>>> [ 5.492920] x17: 000000000000003f x16: 0000000000000000
>>>> [ 5.498251] x15: ffff001ffbffee00 x14: 0000000000000002
>>>> [ 5.503581] x13: 0000000000000000 x12: 000000000000003f
>>>> [ 5.508912] x11: 0000000000000040 x10: 0000000000000040
>>>> [ 5.514243] x9 : 0000000000000000 x8 : fffff9ffcfec4000
>>>> [ 5.519573] x7 : 0000000000000000 x6 : 000000000000003f
>>>> [ 5.524904] x5 : 0000000000000040 x4 : 0000000000000000
>>>> [ 5.530234] x3 : 0000000000000004 x2 : 00000000000000c0
>>>> [ 5.535565] x1 : 0000000000000000 x0 : fffff9ffcfec4000
>>>> [ 5.540896] Call trace:
>>>> [ 5.543344]  __memset+0x16c/0x1c0
>>>> [ 5.546666]  __alloc_percpu+0x14/0x1c
>>>> [ 5.550338]  alloc_workqueue+0x164/0x42c
>>>> [ 5.554273]  init+0x24/0xa4
>>>> [ 5.557071]  do_one_initcall+0x50/0x194
>>>> [ 5.560917]  kernel_init_freeable+0x1e4/0x250
>>>> [ 5.565288]  kernel_init+0x10/0x104
>>>> [ 5.568785]  ret_from_fork+0x10/0x18
>>>> [ 5.572372] Code: 91010108 54ffff4a 8b040108 cb050042 (d50b7428)
>>>> [ 5.578568] ---[ end trace 63c299bbe9b8ea9e ]---
>>>> [ 5.583205] Kernel panic - not syncing: Attempted to kill init!
>>>> exitcode=0x0000000b
>>>> [ 5.590903] SMP: stopping secondary CPUs
>>>> [ 5.594846] Kernel Offset: 0xf0000 from 0xffff800010000000
>>>> [ 5.600350] PHYS_OFFSET: 0x0
>>>> [ 5.603235] CPU features: 0x240022,20806008
>>>> [ 5.607430] Memory Limit: none
>>>> [ 5.610500] ---[ end Kernel panic - not syncing: Attempted to kill init!
>>>> exitcode=0x0000000b ]---
>>>>
>>>> I'll check that when I get a chance. Maybe all just transient.
>>>
>>> Yeah, I forgot to add a patch to make arm64 build again (it will be in
>>> linux-next tomorrow).  If you want to apply it to your tree, here is
>>> what I was given:
>>>
>>> diff --git a/Makefile b/Makefile
>>> index f80c4ff93ec9..fbb4b95ae648 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -1074,7 +1074,7 @@ build-dirs        := $(vmlinux-dirs)
>>>   clean-dirs     := $(vmlinux-alldirs)
>>>
>>>   # Externally visible symbols (used by link-vmlinux.sh)
>>> -KBUILD_VMLINUX_OBJS := $(head-y) $(addsuffix built-in.a, $(core-y))
>>> +KBUILD_VMLINUX_OBJS := $(head-y) $(patsubst %/,%/built-in.a, $(core-y))
>>>   KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(filter %/, $(libs-y)))
>>>   ifdef CONFIG_MODULES
>>>   KBUILD_VMLINUX_OBJS += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
>>

thanks, that works. And, for anyone interested, no crash, like mainline, 
above.

John

> 
> 
> 9203be13ef5bfd1fcf39f7b7fe94597d2d2a0eb4 is the first bad commit
> commit 9203be13ef5bfd1fcf39f7b7fe94597d2d2a0eb4
> Author: Masahiro Yamada <masahiroy@kernel.org>
> Date:   Mon Jun 1 14:56:59 2020 +0900
> 
>      kbuild: refactor KBUILD_VMLINUX_{OBJS,LIBS} calculation
> 
>      Do not overwrite core-y or drivers-y. Remove libs-y1 and libs-y2.
> 
>      Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> .
> 

