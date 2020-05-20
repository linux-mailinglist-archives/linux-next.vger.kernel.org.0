Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4687D1DAF53
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 11:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgETJvR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 05:51:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETJvQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 May 2020 05:51:16 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E245E2070A;
        Wed, 20 May 2020 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589968276;
        bh=I05Xto4txiriKlSQmPh36CUF6ZigsJtHe1MV6gwtr0U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=S5Vh1MMq9WJW18SFE3kUQ8DtR8pbNSiT3Ru/nq0BUk3EydRVMxyVGi4Qgna5ySx1x
         GqWO0lWjvCDXqz0/JOtjLr8fGgRQJKeGER+jFvbKxfLyua4Uyh8kSV3ZN27k6hI1BW
         CNsiSQ8J4Ykr6uK6QILOCF6bf650ZaRATlvwSDhY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jbLNa-00Dshk-89; Wed, 20 May 2020 10:51:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 May 2020 10:51:14 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     John Garry <john.garry@huawei.com>
Cc:     Qian Cai <cai@lca.pw>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: BUG: sleeping function called from atomic due to "Balance initial
 LPI affinity across CPUs"
In-Reply-To: <81796a6e-718a-aa93-d183-6747e0654c8c@huawei.com>
References: <CAG=TAF6hJL-wfGLq3oa-ZGk3-YGEtuMyO2V9ePFUcbv99NWVSw@mail.gmail.com>
 <81796a6e-718a-aa93-d183-6747e0654c8c@huawei.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <e07d73938a7534c6c2cd0517de378fcd@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: john.garry@huawei.com, cai@lca.pw, sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi John,

On 2020-05-20 09:43, John Garry wrote:
> On 19/05/2020 23:09, Qian Cai wrote:
>> Reverted the linux-next commit f068a62c548c ("irqchip/gic-v3-its:
>> Balance initial LPI affinity across CPUs") fixed these warnings during
>> boot,
> 
> Thanks for the notice. So we need the following set to see this:
> CONFIG_CPUMASK_OFFSTACK=y
> CONFIG_DEBUG_ATOMIC_SLEEP=y
> CONFIG_DEBUG_PER_CPU_MAPS=y

Ah, thanks for pointing this out.

>> its_select_cpu at drivers/irqchip/irq-gic-v3-its.c:1572
>> 
>> [  332.819381][ T3359] BUG: sleeping function called from invalid
>> context at mm/slab.h:568
>> [  332.827405][ T3359] in_atomic(): 1, irqs_disabled(): 128,
>> non_block: 0, pid: 3359, name: irqbalance
>> [  332.836455][ T3359] INFO: lockdep is turned off.
>> [  332.841076][ T3359] irq event stamp: 0
>> [  332.844836][ T3359] hardirqs last  enabled at (0): 
>> [<0000000000000000>] 0x0
>> [  332.851828][ T3359] hardirqs last disabled at (0):
>> [<ffff9000101ea65c>] copy_process+0x98c/0x1f34
>> [  332.860710][ T3359] softirqs last  enabled at (0):
>> [<ffff9000101ea690>] copy_process+0x9c0/0x1f34
>> [  332.869586][ T3359] softirqs last disabled at (0): 
>> [<0000000000000000>] 0x0
>> [  332.876560][ T3359] CPU: 155 PID: 3359 Comm: irqbalance Tainted: G
>>        W    L    5.7.0-rc6-next-20200519 #1
>> [  332.886563][ T3359] Hardware name: HPE Apollo 70
>> /C01_APACHE_MB         , BIOS L50_5.13_1.11 06/18/2019
>> [  332.897000][ T3359] Call trace:
>> [  332.900151][ T3359]  dump_backtrace+0x0/0x22c
>> [  332.904514][ T3359]  show_stack+0x28/0x34
>> [  332.908543][ T3359]  dump_stack+0x104/0x194
>> [  332.912738][ T3359]  ___might_sleep+0x314/0x328
>> [  332.917274][ T3359]  __might_sleep+0x7c/0xe0
>> [  332.921563][ T3359]  slab_pre_alloc_hook+0x44/0x8c
>> [  332.926360][ T3359]  __kmalloc_node+0xb0/0x618
>> [  332.930811][ T3359]  alloc_cpumask_var_node+0x48/0x94
> 
> We could use GFP_ATOMIC flag at the callsite here, but maybe there is
> a better solution.

I don't see one, and I doubt it is worth the hassle to have anything
but GFP_ATOMIC. The default arm64 config is to have on-stack cpumasks,
and only DEBUG_PER_CPU_MAPS allows this to be changed.

I'll stash a patch on top.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
