Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7AB1DADD1
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 10:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgETIoz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 04:44:55 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2233 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726224AbgETIoz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 May 2020 04:44:55 -0400
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.107])
        by Forcepoint Email with ESMTP id 71C196872E1953858488;
        Wed, 20 May 2020 09:44:51 +0100 (IST)
Received: from [127.0.0.1] (10.210.167.247) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 20 May
 2020 09:44:50 +0100
Subject: Re: BUG: sleeping function called from atomic due to "Balance initial
 LPI affinity across CPUs"
To:     Qian Cai <cai@lca.pw>, Marc Zyngier <maz@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <CAG=TAF6hJL-wfGLq3oa-ZGk3-YGEtuMyO2V9ePFUcbv99NWVSw@mail.gmail.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <81796a6e-718a-aa93-d183-6747e0654c8c@huawei.com>
Date:   Wed, 20 May 2020 09:43:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAG=TAF6hJL-wfGLq3oa-ZGk3-YGEtuMyO2V9ePFUcbv99NWVSw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.167.247]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 19/05/2020 23:09, Qian Cai wrote:
> Reverted the linux-next commit f068a62c548c ("irqchip/gic-v3-its:
> Balance initial LPI affinity across CPUs") fixed these warnings during
> boot,

Thanks for the notice. So we need the following set to see this:
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_PER_CPU_MAPS=y

> 
> its_select_cpu at drivers/irqchip/irq-gic-v3-its.c:1572
> 
> [  332.819381][ T3359] BUG: sleeping function called from invalid
> context at mm/slab.h:568
> [  332.827405][ T3359] in_atomic(): 1, irqs_disabled(): 128,
> non_block: 0, pid: 3359, name: irqbalance
> [  332.836455][ T3359] INFO: lockdep is turned off.
> [  332.841076][ T3359] irq event stamp: 0
> [  332.844836][ T3359] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [  332.851828][ T3359] hardirqs last disabled at (0):
> [<ffff9000101ea65c>] copy_process+0x98c/0x1f34
> [  332.860710][ T3359] softirqs last  enabled at (0):
> [<ffff9000101ea690>] copy_process+0x9c0/0x1f34
> [  332.869586][ T3359] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [  332.876560][ T3359] CPU: 155 PID: 3359 Comm: irqbalance Tainted: G
>        W    L    5.7.0-rc6-next-20200519 #1
> [  332.886563][ T3359] Hardware name: HPE Apollo 70
> /C01_APACHE_MB         , BIOS L50_5.13_1.11 06/18/2019
> [  332.897000][ T3359] Call trace:
> [  332.900151][ T3359]  dump_backtrace+0x0/0x22c
> [  332.904514][ T3359]  show_stack+0x28/0x34
> [  332.908543][ T3359]  dump_stack+0x104/0x194
> [  332.912738][ T3359]  ___might_sleep+0x314/0x328
> [  332.917274][ T3359]  __might_sleep+0x7c/0xe0
> [  332.921563][ T3359]  slab_pre_alloc_hook+0x44/0x8c
> [  332.926360][ T3359]  __kmalloc_node+0xb0/0x618
> [  332.930811][ T3359]  alloc_cpumask_var_node+0x48/0x94

We could use GFP_ATOMIC flag at the callsite here, but maybe there is a 
better solution.

> [  332.935868][ T3359]  alloc_cpumask_var+0x10/0x1c
> [  332.940496][ T3359]  its_select_cpu+0x58/0x2e4
> [  332.944945][ T3359]  its_set_affinity+0xe8/0x27c
> [  332.949576][ T3359]  msi_domain_set_affinity+0x78/0x114
> [  332.954813][ T3359]  irq_do_set_affinity+0x84/0x198
> [  332.959697][ T3359]  irq_set_affinity_locked+0x80/0x1a8
> [  332.964927][ T3359]  __irq_set_affinity+0x54/0x84
> [  332.969637][ T3359]  write_irq_affinity+0x16c/0x198
> [  332.974520][ T3359]  irq_affinity_proc_write+0x34/0x44
> [  332.979672][ T3359]  pde_write+0x5c/0x78
> [  332.983602][ T3359]  proc_reg_write+0x74/0xc0
> [  332.987974][ T3359]  __vfs_write+0x84/0x1d8
> [  332.992163][ T3359]  vfs_write+0x13c/0x1b8
> [  332.996265][ T3359]  ksys_write+0xb0/0x120
> [  333.000385][ T3359]  __arm64_sys_write+0x54/0x88
> [  333.005017][ T3359]  do_el0_svc+0x128/0x1dc
> [  333.009213][ T3359]  el0_sync_handler+0xd0/0x268
> [  333.013836][ T3359]  el0_sync+0x164/0x180
> [  336.527739][ T3356] mlx5_core 0000:0b:00.1 enp11s0f1np1: Link down
> .
> 

