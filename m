Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BA520C50E
	for <lists+linux-next@lfdr.de>; Sun, 28 Jun 2020 02:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgF1Ay3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 27 Jun 2020 20:54:29 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6839 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726101AbgF1Ay3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 27 Jun 2020 20:54:29 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 976348C2E1FA1402C814;
        Sun, 28 Jun 2020 08:54:25 +0800 (CST)
Received: from [127.0.0.1] (10.67.76.251) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Sun, 28 Jun 2020
 08:54:24 +0800
Subject: Re: linux-next: Tree for Jun 24 [build failure on arm64]
To:     Will Deacon <will@kernel.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200624165323.3dffcde5@canb.auug.org.au>
 <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
 <20200624105528.GB6134@willie-the-truck>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <6f5dd89a-17f3-8907-4494-da125823c3e2@hisilicon.com>
Date:   Sun, 28 Jun 2020 08:54:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200624105528.GB6134@willie-the-truck>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.76.251]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Will£¬

My apologies for reply later because of a short holiday in China.

ÔÚ 2020/6/24 18:55, Will Deacon Ð´µÀ:
> On Wed, Jun 24, 2020 at 05:08:56PM +0800, Shaokun Zhang wrote:
>> +Will Deacon,
>>
>> Hi Will,
>>
>> There's a build failure on arm64:
>>
>>   CALL    scripts/atomic/check-atomics.sh
>>   CALL    scripts/checksyscalls.sh
>>   LD      arch/arm64/kernel/vdso/vdso.so.dbg
>> ld: unrecognized option '--no-eh-frame-hdr'
>> ld: use the --help option for usage information
>> arch/arm64/kernel/vdso/Makefile:64: recipe for target
>> 'arch/arm64/kernel/vdso/vdso.so.dbg' failed
>> make[1]: *** [arch/arm64/kernel/vdso/vdso.so.dbg] Error 1
>> arch/arm64/Makefile:175: recipe for target 'vdso_prepare' failed
>> make: *** [vdso_prepare] Error 2
>>
>> GCC version is followed:
>> gcc (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609
>>
>> It seems caused by
>> 87676cfca141 arm64: vdso: Disable dwarf unwinding through the sigreturn
>> trampoline
> 
> Urgh, binutils quality strikes again. If you're able to reproduce locally,
> can you try the diff below, please? All the linkers I have kicking around

It works, I saw Jon has already tested it.
Thanks your quick reply.

Shaokun

> seem to support --no-eh-frame-hdr.
> 
> Will
> 
> --->8
> 
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 1e5a940532da..97d3d3632093 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -23,8 +23,9 @@ btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
>  # potential future proofing if we end up with internal calls to the exported
>  # routines, as x86 does (see 6f121e548f83 ("x86, vdso: Reimplement vdso.so
>  # preparation in build-time C")).
> -ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv \
> -               -Bsymbolic --no-eh-frame-hdr --build-id -n $(btildflags-y) -T
> +ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv       \
> +            -Bsymbolic $(call ld-option, --no-eh-frame-hdr) --build-id -n      \
> +            $(btildflags-y) -T
>  
>  ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
>  ccflags-y += -DDISABLE_BRANCH_PROFILING
> 
> 
> .
> 

