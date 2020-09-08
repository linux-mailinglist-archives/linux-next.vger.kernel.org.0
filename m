Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E172616B7
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 19:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgIHRRQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 13:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728442AbgIHRRN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 13:17:13 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47D8C061573;
        Tue,  8 Sep 2020 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=KwK6puEgj9NP5gmpV/xbCpyKRaytrseSrQAvZ5WVpEI=; b=TA/yvZ0MXlRBniY0HdhXhrQPhs
        jvDKaReKcXRE6fAcJ3w1i58DQYsj+4mv1rDQYufzUOvZvkVpE3yg2mVCUolNXs+tzfVhvoWqQJuAh
        Rl1pwbQs1dFS2FvsmKGyxHxm73ikshABMcWwk3tupNclclkC4raPnttp/N5MGQ6R7CKYNeMw6nf/L
        cvg4CnTYIQaGIdOAU/TMH+KnVxbDJ7dGK/+DocyVb3fVdkfm/Q5dWXy8BlfIT7tpj+ieJRrSq5LKD
        tl1SB94XEhVXUo1+KVeONK7rPgZGZzfstmy8oZylf1+qUVyCAMMcNfXreGwTAPxagbbpU+zv5R/Ht
        FhnFAHVQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFhEx-0003eZ-Ux; Tue, 08 Sep 2020 17:17:08 +0000
Subject: Re: linux-next: Tree for Sep 8 (sched/topology.c)
To:     Valentin Schneider <valentin.schneider@arm.com>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>
References: <20200908205659.361b0a1b@canb.auug.org.au>
 <ddc76403-4b00-66ba-43ea-7889b9a32bb5@infradead.org>
 <CAKfTPtB-br6iKAMnofbPEmPVF-fpQpjkbXtfTcNkNzbc1Kdtug@mail.gmail.com>
 <jhj4ko86zk4.mognet@arm.com>
 <b6e6f676-d61b-5109-759f-4b4f2c24bab1@infradead.org>
 <jhj363s6ylu.mognet@arm.com> <jhj1rjc6xn3.mognet@arm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e6295346-0202-498a-d503-14f81022dbec@infradead.org>
Date:   Tue, 8 Sep 2020 10:17:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <jhj1rjc6xn3.mognet@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/8/20 9:28 AM, Valentin Schneider wrote:
> 
> On 08/09/20 17:07, Valentin Schneider wrote:
>> On 08/09/20 16:50, Randy Dunlap wrote:
>>> Sure, here it is again.  And
>>> CONFIG_SMP=y
>>> CONFIG_SCHED_DEBUG=y
>>>
>>> thanks.
>>
>> Okay so I can reproduce that with GCC-10.1, now to figure out WTH is going on...
> 
> Yet another fail from my end, the declaration is conditioned by:
> 
>   CONFIG_SCHED_DEBUG
>   CONFIG_SMP
>   CONFIG_SYSCTL
> 
> that last one being ofc stupid. Below lets me build; I'll go get
> something with caffeine in it and double-check the shuffles I've done
> before sending an actual patch.
> 
> Thanks for the report!

Works for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> 
> ---
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 0d7896d2a0b2..0ca486aa296b 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -185,6 +185,12 @@ late_initcall(sched_init_debug);
> 
>  #ifdef CONFIG_SMP
> 
> +#define SD_FLAG(_name, mflags) [__##_name] = { .meta_flags = mflags, .name = #_name },
> +const struct sd_flag_debug sd_flag_debug[] = {
> +#include <linux/sched/sd_flags.h>
> +};
> +#undef SD_FLAG
> +
>  #ifdef CONFIG_SYSCTL
> 
>  static struct ctl_table sd_ctl_dir[] = {
> @@ -245,12 +251,6 @@ set_table_entry(struct ctl_table *entry,
>         entry->proc_handler = proc_handler;
>  }
> 
> -#define SD_FLAG(_name, mflags) [__##_name] = { .meta_flags = mflags, .name = #_name },
> -const struct sd_flag_debug sd_flag_debug[] = {
> -#include <linux/sched/sd_flags.h>
> -};
> -#undef SD_FLAG
> -
>  static int sd_ctl_doflags(struct ctl_table *table, int write,
>                           void *buffer, size_t *lenp, loff_t *ppos)
>  {
> ---
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
