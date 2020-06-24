Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3614020734C
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 14:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389033AbgFXM3E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 08:29:04 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12376 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388296AbgFXM3E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 08:29:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef346b30000>; Wed, 24 Jun 2020 05:27:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 24 Jun 2020 05:29:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 24 Jun 2020 05:29:04 -0700
Received: from [10.26.73.205] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Jun
 2020 12:29:02 +0000
Subject: Re: linux-next: Tree for Jun 24 [build failure on arm64]
To:     Will Deacon <will@kernel.org>
CC:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20200624165323.3dffcde5@canb.auug.org.au>
 <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
 <20200624105528.GB6134@willie-the-truck>
 <b561e663-a9aa-d600-e23b-09793199141e@nvidia.com>
 <20200624122242.GA6270@willie-the-truck>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a7ebe7c1-49ae-5bc9-9c4f-fcc693ca3834@nvidia.com>
Date:   Wed, 24 Jun 2020 13:29:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624122242.GA6270@willie-the-truck>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593001651; bh=mhqQyRnIhUnnHze33p7MtHXb3BfkZ0S9zF5m7Y8of3k=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=QC2Xr9k/f3TIk+or9phPd1Z6auiCULuSyRQFjtM0J64EntiPSZbznvuNgvP9h9hMp
         HpgnisYAIWKSMUOXGd/NxiiUrejBaE4RDnUpPEsBWP9/RfIRkB5l0FPuDYYXf6C8+v
         O24CQMPO7cGhb9iLk8D4bQjQvNTt4YhJrSogayG52zBR019FAQ9VeSntW1P/TuiCi4
         yQbBfkipzCmJg0GuzXxzR/hekMOyAW/PyHJr4dB7Vp4hqVwghvfgKMs5uYE3qdD95j
         YLQ56iq2USVYg4mgmimMsPw4OOAObJcapenBTns40GjC4FDjtnyZB31fF1jXCCqJi8
         D4QF/2AGTXNYg==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 24/06/2020 13:22, Will Deacon wrote:
> On Wed, Jun 24, 2020 at 12:57:23PM +0100, Jon Hunter wrote:
>> On 24/06/2020 11:55, Will Deacon wrote:
>>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>>> index 1e5a940532da..97d3d3632093 100644
>>> --- a/arch/arm64/kernel/vdso/Makefile
>>> +++ b/arch/arm64/kernel/vdso/Makefile
>>> @@ -23,8 +23,9 @@ btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
>>>  # potential future proofing if we end up with internal calls to the exported
>>>  # routines, as x86 does (see 6f121e548f83 ("x86, vdso: Reimplement vdso.so
>>>  # preparation in build-time C")).
>>> -ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv \
>>> -               -Bsymbolic --no-eh-frame-hdr --build-id -n $(btildflags-y) -T
>>> +ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv       \
>>> +            -Bsymbolic $(call ld-option, --no-eh-frame-hdr) --build-id -n      \
>>> +            $(btildflags-y) -T
>>>  
>>>  ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
>>>  ccflags-y += -DDISABLE_BRANCH_PROFILING
>>>
>>
>>
>> I am seeing the same build failure and the above does fix it for me.
> 
> Cheers, Jon. I'll get this into -next with your Tested-by.

Thanks, that will be great.

Jon

-- 
nvpublic
