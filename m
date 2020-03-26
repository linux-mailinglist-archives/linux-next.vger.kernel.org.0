Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C286193D6A
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 11:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbgCZK7O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 06:59:14 -0400
Received: from foss.arm.com ([217.140.110.172]:59034 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727590AbgCZK7N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Mar 2020 06:59:13 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23C077FA;
        Thu, 26 Mar 2020 03:59:13 -0700 (PDT)
Received: from e107158-lin (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFDB73F71F;
        Thu, 26 Mar 2020 03:59:11 -0700 (PDT)
Date:   Thu, 26 Mar 2020 10:59:09 +0000
From:   Qais Yousef <qais.yousef@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Sebastian Reichel <sre@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200326105908.enebu3x4lmdvwnnf@e107158-lin>
References: <20200326135258.2764f0de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326135258.2764f0de@canb.auug.org.au>
User-Agent: NeoMutt/20171215
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen

On 03/26/20 13:52, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/power/reset/sc27xx-poweroff.c: In function 'sc27xx_poweroff_shutdown':
> drivers/power/reset/sc27xx-poweroff.c:38:4: error: implicit declaration of function 'cpu_down' [-Werror=implicit-function-declaration]
>    38 |    cpu_down(cpu);
>       |    ^~~~~~~~
> 
> Caused by commit
> 
>   33c3736ec888 ("cpu/hotplug: Hide cpu_up/down()")
> 
> interacting with commit
> 
>   274afbc3ad33 ("power: reset: sc27xx: Change to use cpu_down()")
> 
> from the battery tree.
> 
> I have added the following merge fix patch:

Your merge fix looks correct.

Though the original code is missing error handling if offlining the cpu failed
for one reason or another.

I don't know the details, but something feels off about the driver having to
bring cpus down.

Thanks

--
Qais Yousef

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 26 Mar 2020 13:42:00 +1100
> Subject: [PATCH] power: reset: sc27xx: use remove_cpu instead of cpu_down
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/power/reset/sc27xx-poweroff.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/reset/sc27xx-poweroff.c b/drivers/power/reset/sc27xx-poweroff.c
> index 69863074daf6..90287c31992c 100644
> --- a/drivers/power/reset/sc27xx-poweroff.c
> +++ b/drivers/power/reset/sc27xx-poweroff.c
> @@ -35,7 +35,7 @@ static void sc27xx_poweroff_shutdown(void)
>  
>  	for_each_online_cpu(cpu) {
>  		if (cpu != smp_processor_id())
> -			cpu_down(cpu);
> +			remove_cpu(cpu);
>  	}
>  #endif
>  }
> -- 
> 2.25.0
> 
> -- 
> Cheers,
> Stephen Rothwell


