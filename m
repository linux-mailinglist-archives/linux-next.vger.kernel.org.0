Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706AB2072A8
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 13:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389131AbgFXL53 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 07:57:29 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19503 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388522AbgFXL52 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 07:57:28 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef33f9b0000>; Wed, 24 Jun 2020 04:57:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 24 Jun 2020 04:57:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 24 Jun 2020 04:57:27 -0700
Received: from [10.26.73.205] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Jun
 2020 11:57:26 +0000
Subject: Re: linux-next: Tree for Jun 24 [build failure on arm64]
To:     Will Deacon <will@kernel.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20200624165323.3dffcde5@canb.auug.org.au>
 <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
 <20200624105528.GB6134@willie-the-truck>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b561e663-a9aa-d600-e23b-09793199141e@nvidia.com>
Date:   Wed, 24 Jun 2020 12:57:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624105528.GB6134@willie-the-truck>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592999835; bh=rOGvVUO5Jofmog2XlYA47AUYPd77eAO/iMznUOpsZTA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=FolcO0Lhu102UNN+IOpFKapnSg1QpiGhx0+13N/cRopcM27ErziLlkX/cCH586W+R
         9SQ9Hjv3LYB+o0qFGxJDBN8LDJSJ+x7JffjkWqoASG9sTA/grgUjrN86dnPm3vVAoT
         05atCNOtOG8rqu76ihP+ZS877I7aC8T0JM+2ZNIomdxdagplu4XcibnxCf14+K1KOh
         E0csrlL//kHH8znL5/tlrwye/1iMBBzutvUIRBuow6kID9osQHebg6mI2osqR3EV0H
         6GfOt1DlcHorgQ8tJGYhb4nzpO3/GKrb6u9PnqJSWMZUGjuTq3R7u5IjSZNlEYzNWY
         srcy8+o0nq6aw==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 24/06/2020 11:55, Will Deacon wrote:
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


I am seeing the same build failure and the above does fix it for me.

Thanks
Jon

-- 
nvpublic
