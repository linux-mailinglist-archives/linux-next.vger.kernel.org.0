Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98726175C0F
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 14:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgCBNsY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 08:48:24 -0500
Received: from foss.arm.com ([217.140.110.172]:32932 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbgCBNsY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Mar 2020 08:48:24 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90C8E2F;
        Mon,  2 Mar 2020 05:48:23 -0800 (PST)
Received: from [10.163.1.119] (unknown [10.163.1.119])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83AAE3F534;
        Mon,  2 Mar 2020 05:48:16 -0800 (PST)
Subject: Re: Linux-next-20200302: arm64 build failed
To:     Will Deacon <will@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        catalin.marinas@arm.com
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        rppt@linux.ibm.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        suzuki.poulose@arm.com, Anders Roxell <anders.roxell@linaro.org>
References: <CA+G9fYtAM-m0jygud+i0ymU+XknV9_GcAbDQChiD2NZjvQ+D3w@mail.gmail.com>
 <20200302104726.GA7995@willie-the-truck>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d2d8d359-3e48-b5b7-2944-be3d54ba1d32@arm.com>
Date:   Mon, 2 Mar 2020 19:18:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200302104726.GA7995@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 03/02/2020 04:17 PM, Will Deacon wrote:
> [+Anshuman and Catalin]
> 
> On Mon, Mar 02, 2020 at 01:58:26PM +0530, Naresh Kamboju wrote:
>> Linux-Next 20200302 arm64 build failed due to below errors,
>> Suspecting patch causing this build break.
>>
>> 87d900aef3e2  arm/arm64: add support for folded p4d page tables
>>
>> Error log,
>> -------------
>> arch/arm64/mm/mmu.c: In function 'unmap_hotplug_pud_range':
>> include/linux/compiler.h:284:1: error: incompatible type for argument
>> 1 of 'p4d_page_paddr'
>>  ({         \
>>  ^
>> arch/arm64/include/asm/memory.h:270:45: note: in definition of macro
>> '__phys_to_virt'
>>  #define __phys_to_virt(x) ((unsigned long)((x) - physvirt_offset))
>>                                              ^
>> arch/arm64/include/asm/pgtable.h:629:42: note: in expansion of macro '__va'
>>  #define pud_offset(dir, addr)  ((pud_t *)__va(pud_offset_phys((dir), (addr))))
>>                                           ^~~~
>> include/linux/compiler.h:293:22: note: in expansion of macro '__READ_ONCE'
>>  #define READ_ONCE(x) __READ_ONCE(x, 1)
>>                       ^~~~~~~~~~~
>> arch/arm64/include/asm/pgtable.h:628:52: note: in expansion of macro 'READ_ONCE'
>>  #define pud_offset_phys(dir, addr) (p4d_page_paddr(READ_ONCE(*(dir)))
>> + pud_index(addr) * sizeof(pud_t))
>>                                                     ^~~~~~~~~
>> arch/arm64/include/asm/pgtable.h:629:47: note: in expansion of macro
>> 'pud_offset_phys'
>>  #define pud_offset(dir, addr)  ((pud_t *)__va(pud_offset_phys((dir), (addr))))
>>                                                ^~~~~~~~~~~~~~~
>> arch/arm64/mm/mmu.c:827:10: note: in expansion of macro 'pud_offset'
>>    pudp = pud_offset(pgdp, addr);
>>           ^~~~~~~~~~
> 
> Looks like we need an implementation of unmap_hotplug_p4d_range() to
> walk the dummy p4d level. Unfortunately, we don't have the folded p4d
> patches in the arm64 tree so we'll either need a common branch or the
> hotplug patches will need to be dropped for the moment.

If we decide to get a common branch, will try to get this sorted with
an unmap_hotplug_p4d_range() implementation as you have suggested.

> 
> Will
> 
