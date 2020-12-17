Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E942DCAF1
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 03:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgLQCTd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 21:19:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9627 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbgLQCTd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2020 21:19:33 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CxFyp3SPjz15dlW;
        Thu, 17 Dec 2020 10:18:10 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 10:18:45 +0800
Subject: Re: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "Paul Walmsley" <paul@pwsan.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
References: <20201127183441.347e30e0@canb.auug.org.au>
 <20201217122616.410c88b9@canb.auug.org.au>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <539584e6-01b4-146f-d36a-87cfa50607e8@huawei.com>
Date:   Thu, 17 Dec 2020 10:18:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201217122616.410c88b9@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 2020/12/17 9:26, Stephen Rothwell wrote:
> Hi all,
>
> On Fri, 27 Nov 2020 18:34:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>
>>    arch/riscv/Kconfig
>>
>> between commit:
>>
>>    5cb0080f1bfd ("riscv: Enable ARCH_STACKWALK")
>>
>> from the risc-v tree and commit:
>>
>>    46b9b00649f6 ("arch, mm: restore dependency of __kernel_map_pages() on DEBUG_PAGEALLOC")
>>
>> from the akpm-current tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>>
>> diff --cc arch/riscv/Kconfig
>> index 8a2a0523a9a3,9283c6f9ae2a..000000000000
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@@ -14,7 -14,7 +14,8 @@@ config RISC
>>    	def_bool y
>>    	select ARCH_CLOCKSOURCE_INIT
>>    	select ARCH_SUPPORTS_ATOMIC_RMW
>>   +	select ARCH_STACKWALK
>> + 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>>    	select ARCH_HAS_BINFMT_FLAT
>>    	select ARCH_HAS_DEBUG_VM_PGTABLE
>>    	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> This is now a conflict between the risc-v tree and Linus' tree.

Could it be fixed in alphabetical order when merging riscv tree?



>
