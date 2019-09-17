Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E116CB5161
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 17:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729450AbfIQPYX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 11:24:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55548 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728593AbfIQPYW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 11:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OIHLhHQfeRr2fl3C9thWZ18jcw+n7OADdJ9wQVy9euk=; b=lvc9JWlKBdKPmux1lu7lpLmM9
        eMK3GUqzObgFSqGptcpNtm7ouVFwY99pbSzlVpzW+sMCTzpre9rjhNU457iCHBHNhQ3ovMZpa/JsD
        1/Br7f2AkeA+7IT2S6vWbaS+Rw+ZN48cLal0+2ViaBnkQd9l9w2oMaIOuZuxLW6wru11Kz/VBpoaM
        O+5kcoR/wJpNPeZImdHTMEUImpH/ZFYmPL3cZukHcEMNCkHVW4d8i24EgIvCAZgqJAkOjFDCS+tUD
        CH8i3KDLnsS2EOKZhd3WCgYcsmzlDV1mCaw4sPaHSlCFqfK9IHYHe4e5TWjXgNcl1Y66vdI8E7odS
        Ays6Uhc+g==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iAFL3-0004KJ-12; Tue, 17 Sep 2019 15:24:21 +0000
Subject: Re: linux-next: Tree for Sep 16 (kernel/sched/core.c)
To:     Patrick Bellasi <patrick.bellasi@arm.com>,
        Ingo Molnar <mingo@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20190916223850.GQ4352@sirena.co.uk>
 <1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org>
 <20190917075242.GB49590@gmail.com> <8736gv2gbv.fsf@arm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <30eb4c83-a90d-21aa-3f9e-4da8e66769ef@infradead.org>
Date:   Tue, 17 Sep 2019 08:24:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8736gv2gbv.fsf@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/17/19 6:38 AM, Patrick Bellasi wrote:
> 
> On Tue, Sep 17, 2019 at 08:52:42 +0100, Ingo Molnar wrote...
> 
>> * Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>> On 9/16/19 3:38 PM, Mark Brown wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20190915:
>>>>
>>>
>>> on x86_64:
>>>
>>> when CONFIG_CGROUPS is not set:
> 
> Hi Randy,
> thanks for the report.
> 
>>>   CC      kernel/sched/core.o
>>> ../kernel/sched/core.c: In function ‘uclamp_update_active_tasks’:
>>> ../kernel/sched/core.c:1081:23: error: storage size of ‘it’ isn’t known
>>>   struct css_task_iter it;
>>>                        ^~
>>>   CC      kernel/printk/printk_safe.o
>>> ../kernel/sched/core.c:1084:2: error: implicit declaration of function ‘css_task_iter_start’; did you mean ‘__sg_page_iter_start’? [-Werror=implicit-function-declaration]
>>>   css_task_iter_start(css, 0, &it);
>>>   ^~~~~~~~~~~~~~~~~~~
>>>   __sg_page_iter_start
>>> ../kernel/sched/core.c:1085:14: error: implicit declaration of function ‘css_task_iter_next’; did you mean ‘__sg_page_iter_next’? [-Werror=implicit-function-declaration]
>>>   while ((p = css_task_iter_next(&it))) {
>>>               ^~~~~~~~~~~~~~~~~~
>>>               __sg_page_iter_next
>>> ../kernel/sched/core.c:1091:2: error: implicit declaration of function ‘css_task_iter_end’; did you mean ‘get_task_cred’? [-Werror=implicit-function-declaration]
>>>   css_task_iter_end(&it);
>>>   ^~~~~~~~~~~~~~~~~
>>>   get_task_cred
>>> ../kernel/sched/core.c:1081:23: warning: unused variable ‘it’ [-Wunused-variable]
>>>   struct css_task_iter it;
>>>                        ^~
>>>
>>
>> I cannot reproduce this build failue: I took Linus's latest which has all 
>> the -next scheduler commits included (ad062195731b), and an x86-64 "make 
>> defconfig" and a disabling of CONFIG_CGROUPS still resuls in a kernel 
>> that builds fine.
> 
> Same here Ingo, I cannot reproduce on arm64 and !CONFIG_CGROUPS and
> testing on tip/sched/core.
> 
> However, if you like, the following patch can make that code a
> bit more "robust".
> 
> Best,
> Patrick
> 
> ---8<---
> From 7e17b7bb08dd8dfc57e01c2a7b6875439eb47cbe Mon Sep 17 00:00:00 2001
> From: Patrick Bellasi <patrick.bellasi@arm.com>
> Date: Tue, 17 Sep 2019 14:12:10 +0100
> Subject: [PATCH 1/1] sched/core: uclamp: Fix compile error on !CONFIG_CGROUPS
> 
> Randy reported a compiler error on x86_64 and !CONFIG_CGROUPS which is due
> to uclamp_update_active_tasks() using the undefined css_task_iter().
> 
> Since uclamp_update_active_tasks() is used only when cgroup support is
> enabled, fix that by properly guarding that function at compile time.
> 
> Signed-off-by: Patrick Bellasi <patrick.bellasi@arm.com>
> Link: https://lore.kernel.org/lkml/1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org/
> Fixes: commit babbe170e05 ("sched/uclamp: Update CPU's refcount on TG's clamp changes")

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  kernel/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 3c7b90bcbe4e..14873ad4b34a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1043,6 +1043,7 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
>  		uclamp_rq_dec_id(rq, p, clamp_id);
>  }
>  
> +#ifdef CONFIG_UCLAMP_TASK_GROUP
>  static inline void
>  uclamp_update_active(struct task_struct *p, enum uclamp_id clamp_id)
>  {
> @@ -1091,7 +1092,6 @@ uclamp_update_active_tasks(struct cgroup_subsys_state *css,
>  	css_task_iter_end(&it);
>  }
>  
> -#ifdef CONFIG_UCLAMP_TASK_GROUP
>  static void cpu_util_update_eff(struct cgroup_subsys_state *css);
>  static void uclamp_update_root_tg(void)
>  {
> 


-- 
~Randy
