Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A01FE156D80
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 03:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgBJCAi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Feb 2020 21:00:38 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9712 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726910AbgBJCAi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Feb 2020 21:00:38 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id C03D8C65B9308F9A5CF2;
        Mon, 10 Feb 2020 10:00:36 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 10 Feb 2020
 10:00:28 +0800
Subject: Re: linux-next: build failure in Linus' tree
To:     Marc Zyngier <maz@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200210080821.691261a8@canb.auug.org.au>
 <CAHk-=wiM9gSf=EifmenHZOccd16xvFgQyV=V=9jEHR7_h3b0JA@mail.gmail.com>
 <20200209225735.3c2eacb6@why>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <9a5c79e4-066e-74ba-0d17-381b1e25ef12@huawei.com>
Date:   Mon, 10 Feb 2020 10:00:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200209225735.3c2eacb6@why>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020/2/10 6:57, Marc Zyngier wrote:
> On Sun, 9 Feb 2020 13:24:18 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> Stephen, Linus,
> 
>> On Sun, Feb 9, 2020 at 1:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> Just building Linus' tree, today's linux-next build (arm
>>> multi_v7_defconfig) failed like this:
>>>
>>> arm-linux-gnueabi-ld: drivers/irqchip/irq-gic-v3-its.o: in function `its_vpe_irq_domain_alloc':
>>> irq-gic-v3-its.c:(.text+0x3d50): undefined reference to `__aeabi_uldivmod'
>>>
>>> Caused by commit
>>>
>>>    4e6437f12d6e ("irqchip/gic-v4.1: Ensure L2 vPE table is allocated at RD level")
> 
> Gniii... Sorry for the breakage.

Sorry, my bad. I'm going to set up my 32bit ARM for tests (before
sending something out in the future).

> 
>>
>> Ahh. 64-bit divides without using do_div() and friends.
>>
>> Is GICv4 even relevant for 32-bit ARM?
> 
> Only should someone boot a large 64bit server in 32bit mode and run VMs
> with direct injection of interrupts. And definitely not once we get rid
> of 32bit KVM.
> 
> Do you mind applying the following patch on top? It fixes the breakage
> here.
> 
> Thanks,
> 
> 	M.
> 
>>From d06ab34c3491d3cd191e024bf2da1eb9b8caccdd Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Sun, 9 Feb 2020 22:48:50 +0000
> Subject: [PATCH] irqchip/gic-v4.1: Avoid 64bit division for the sake of 32bit
>   ARM
> 
> In order to allow the GICv4 code to link properly on 32bit ARM,
> make sure we don't use 64bit divisions when it isn't strictly
> necessary.
> 
> Fixes: 4e6437f12d6e ("irqchip/gic-v4.1: Ensure L2 vPE table is allocated at RD level")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   drivers/irqchip/irq-gic-v3-its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 1ee95f546cb0..83b1186ffcad 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -2444,8 +2444,8 @@ static u64 inherit_vpe_l1_table_from_rd(cpumask_t **mask)
>   static bool allocate_vpe_l2_table(int cpu, u32 id)
>   {
>   	void __iomem *base = gic_data_rdist_cpu(cpu)->rd_base;
> -	u64 val, gpsz, npg;
> -	unsigned int psz, esz, idx;
> +	unsigned int psz, esz, idx, npg, gpsz;
> +	u64 val;
>   	struct page *page;
>   	__le64 *table;
>   
> 

And thanks a lot for your help, Marc!


Zenghui

