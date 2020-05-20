Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986911DB1BB
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 13:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgETL3J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 07:29:09 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2234 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726403AbgETL3J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 May 2020 07:29:09 -0400
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.107])
        by Forcepoint Email with ESMTP id 96BA5E6039F64A421650;
        Wed, 20 May 2020 12:29:06 +0100 (IST)
Received: from [127.0.0.1] (10.210.167.247) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 20 May
 2020 12:29:05 +0100
Subject: Re: BUG: sleeping function called from atomic due to "Balance initial
 LPI affinity across CPUs"
To:     Marc Zyngier <maz@kernel.org>
CC:     Qian Cai <cai@lca.pw>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <CAG=TAF6hJL-wfGLq3oa-ZGk3-YGEtuMyO2V9ePFUcbv99NWVSw@mail.gmail.com>
 <81796a6e-718a-aa93-d183-6747e0654c8c@huawei.com>
 <e07d73938a7534c6c2cd0517de378fcd@kernel.org>
From:   John Garry <john.garry@huawei.com>
Message-ID: <e47cf647-0a9a-e3ae-063f-ce17b6229400@huawei.com>
Date:   Wed, 20 May 2020 12:28:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <e07d73938a7534c6c2cd0517de378fcd@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.210.167.247]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 20/05/2020 10:51, Marc Zyngier wrote:
> Hi John,
> 
> On 2020-05-20 09:43, John Garry wrote:
>> On 19/05/2020 23:09, Qian Cai wrote:
>>> Reverted the linux-next commit f068a62c548c ("irqchip/gic-v3-its:
>>> Balance initial LPI affinity across CPUs") fixed these warnings during
>>> boot,
>>
>> Thanks for the notice. So we need the following set to see this:
>> CONFIG_CPUMASK_OFFSTACK=y
>> CONFIG_DEBUG_ATOMIC_SLEEP=y
>> CONFIG_DEBUG_PER_CPU_MAPS=y
> 
> Ah, thanks for pointing this out.
> 
>>> its_select_cpu at drivers/irqchip/irq-gic-v3-its.c:1572
>>>
>>> [  332.819381][ T3359] BUG: sleeping function called from invalid
>>> context at mm/slab.h:568
>>> [  332.827405][ T3359] in_atomic(): 1, irqs_disabled(): 128,
>>> non_block: 0, pid: 3359, name: irqbalance
>>> [  332.836455][ T3359] INFO: lockdep is turned off.
>>> [  332.841076][ T3359] irq event stamp: 0
>>> [  332.844836][ T3359] hardirqs last  enabled at (0): 
>>> [<0000000000000000>] 0x0
>>> [  332.851828][ T3359] hardirqs last disabled at (0):
>>> [<ffff9000101ea65c>] copy_process+0x98c/0x1f34
>>> [  332.860710][ T3359] softirqs last  enabled at (0):
>>> [<ffff9000101ea690>] copy_process+0x9c0/0x1f34
>>> [  332.869586][ T3359] softirqs last disabled at (0): 
>>> [<0000000000000000>] 0x0
>>> [  332.876560][ T3359] CPU: 155 PID: 3359 Comm: irqbalance Tainted: G
>>>        W    L    5.7.0-rc6-next-20200519 #1
>>> [  332.886563][ T3359] Hardware name: HPE Apollo 70
>>> /C01_APACHE_MB         , BIOS L50_5.13_1.11 06/18/2019
>>> [  332.897000][ T3359] Call trace:
>>> [  332.900151][ T3359]  dump_backtrace+0x0/0x22c
>>> [  332.904514][ T3359]  show_stack+0x28/0x34
>>> [  332.908543][ T3359]  dump_stack+0x104/0x194
>>> [  332.912738][ T3359]  ___might_sleep+0x314/0x328
>>> [  332.917274][ T3359]  __might_sleep+0x7c/0xe0
>>> [  332.921563][ T3359]  slab_pre_alloc_hook+0x44/0x8c
>>> [  332.926360][ T3359]  __kmalloc_node+0xb0/0x618
>>> [  332.930811][ T3359]  alloc_cpumask_var_node+0x48/0x94
>>
>> We could use GFP_ATOMIC flag at the callsite here, but maybe there is
>> a better solution.
> 
> I don't see one, and I doubt it is worth the hassle to have anything
> but GFP_ATOMIC. The default arm64 config is to have on-stack cpumasks,
> and only DEBUG_PER_CPU_MAPS allows this to be changed.

JFYI, I was able to recreate on my D05:

[11.951739] CPU: 21 PID: 1 Comm: swapper/0 Tainted: G 
W5.7.0-rc6-next-20200519-dirty #16
[11.961262] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05 
IT21 Nemo 2.0 RC0 04/18/2018
[11.970435] Call trace:
[11.972890]  dump_backtrace+0x0/0x1b0
[11.976561]  show_stack+0x14/0x1c
[11.979884]  dump_stack+0xc0/0xf0
[11.983207]  ___might_sleep+0x10c/0x12c
[11.987052]  __might_sleep+0x4c/0x80
[11.990637]  __kmalloc_node+0x1ac/0x2dc
[11.994483]  alloc_cpumask_var_node+0x28/0x60
[11.998852]  alloc_cpumask_var+0x10/0x18
[12.002787]  its_select_cpu+0x2c/0x19c
[12.006546]  its_irq_domain_activate+0x38/0xf0
[12.011004]  __irq_domain_activate_irq+0x6c/0xac
[12.011108] sd 0:0:7:0: [sdh] Attached SCSI disk
[12.015636]  __irq_domain_activate_irq+0x34/0xac
[12.015638]  __irq_domain_activate_irq+0x34/0xac
[12.015640]  irq_domain_activate_irq+0x3c/0x4c
[12.015643]  irq_activate+0x20/0x30
[12.037482]  __setup_irq+0x538/0x6ec
[12.041065]  request_threaded_irq+0xdc/0x18c
[12.045350]  usb_add_hcd+0x4b0/0x6c0
[12.048934]  ehci_platform_probe+0x1f4/0x438
[12.053218]  platform_drv_probe+0x4c/0xa0
[12.057239]  really_probe+0xf4/0x35c
[12.060823]  driver_probe_device+0x54/0xb0
[12.064931]  device_driver_attach+0x68/0x70
[12.069126]  __driver_attach+0x9c/0xf8
[12.072884]  bus_for_each_dev+0x50/0xa0
[12.076730]  driver_attach+0x20/0x28
[12.080313]  bus_add_driver+0x148/0x1fc
[12.084159]  driver_register+0x6c/0x124
[12.088005]  __platform_driver_register+0x48/0x50
[12.092727]  ehci_platform_init+0x54/0x64
[12.096747]  do_one_initcall+0x50/0x194
[12.100593]  kernel_init_freeable+0x1e4/0x250
[12.104964]  kernel_init+0x10/0x108
[12.108460]  ret_from_fork+0x10/0x18
[12.112077] ehci-platform PNP0D20:00: irq 361, io mem 0xa7020000

And setting GFP_ATOMIC removes that BUG.

Cheers,
John

