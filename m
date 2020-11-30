Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6472C89D1
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 17:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbgK3Qpr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 11:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728443AbgK3Qpr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 11:45:47 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B444BC0613CF;
        Mon, 30 Nov 2020 08:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=GFqvAPo7D6KlbvsNo07Q/7Bk8z8TPhjSBF/80g1vgTw=; b=RWTVM2RmyOuc4swcxfe6XdEK+7
        PeB1sSKEtNQDiVvmGbx4UaIwdsvNVW+5gddcDS8zbKoJ0j26o9Jp5TyhowIZZggyEYyhtk608ydpS
        dOIp6kEWgsh//BDG/wtc1Vh++wfYbdtV53cib9BktXLWkcQanRgyRREdn9pB6huDAFR0X2lm9d849
        xqIEmA6cSaVyFtbxqpNhbLEHAJeJcLOD14ysE1Fm22tDHG3Bcyl9LoaYUmD7qow+1OJT9rs49kU0H
        pPfpoUfVtEDpfSnsgx3Mh1SbX5RYdCTtxGa492ZDoa3jJb9zKyK/dzCH4DyG6ErrUWzYLSGrpzWbx
        7tKxaQeg==;
Received: from [2601:1c0:6280:3f0::cc1f]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kjmIN-0001K1-Bo; Mon, 30 Nov 2020 16:45:00 +0000
Subject: Re: linux-next: Tree for Nov 27 (drivers/idle/intel_idle.c)
To:     Peter Zijlstra <peterz@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Len Brown <lenb@kernel.org>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
 <0a6cc4c9-c48d-dbc4-6044-3b22cd133b76@infradead.org>
 <20201128083617.50021fff@canb.auug.org.au>
 <20201130115402.GO3040@hirez.programming.kicks-ass.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7170bbdb-1603-8aa6-144a-91ad99e6d579@infradead.org>
Date:   Mon, 30 Nov 2020 08:44:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130115402.GO3040@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/30/20 3:54 AM, Peter Zijlstra wrote:
> On Sat, Nov 28, 2020 at 08:36:17AM +1100, Stephen Rothwell wrote:
>> Hi Randy,
>>
>> On Fri, 27 Nov 2020 07:57:32 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> On 11/27/20 1:04 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20201126:
>>>>   
>>>
>>> (This looks strange to me.)
>>>
>>>
>>> on i386 or x86_64:
>>>
>>> # CONFIG_ACPI is not set
>>>
>>> ../drivers/idle/intel_idle.c: In function ‘intel_idle_init_cstates_icpu’:
>>> ../drivers/idle/intel_idle.c:1510:7: error: implicit declaration of function ‘intel_idle_state_needs_timer_stop’; did you mean ‘intel_idle_init_cstates_icpu’? [-Werror=implicit-function-declaration]
>>>    if (intel_idle_state_needs_timer_stop(&drv->states[drv->state_count]))
>>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> intel_idle_state_needs_timer_stop() is only defined when
>> CONFIG_ACPI_PROCESSOR_CSTATE is set, but is used once where that is not
>> necessarily set.  I assume CONFIG_ACPI_PROCESSOR_CSTATE is not set in
>> your config?
> 
> Bah... :/

Yep, thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
> index 7ee7ffe22ae3..d79335506ecd 100644
> --- a/drivers/idle/intel_idle.c
> +++ b/drivers/idle/intel_idle.c
> @@ -1140,6 +1140,20 @@ static bool __init intel_idle_max_cstate_reached(int cstate)
>  	return false;
>  }
>  
> +static bool __init intel_idle_state_needs_timer_stop(struct cpuidle_state *state)
> +{
> +	unsigned long eax = flg2MWAIT(state->flags);
> +
> +	if (boot_cpu_has(X86_FEATURE_ARAT))
> +		return false;
> +
> +	/*
> +	 * Switch over to one-shot tick broadcast if the target C-state
> +	 * is deeper than C1.
> +	 */
> +	return !!((eax >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK);
> +}
> +
>  #ifdef CONFIG_ACPI_PROCESSOR_CSTATE
>  #include <acpi/processor.h>
>  
> @@ -1210,20 +1224,6 @@ static bool __init intel_idle_acpi_cst_extract(void)
>  	return false;
>  }
>  
> -static bool __init intel_idle_state_needs_timer_stop(struct cpuidle_state *state)
> -{
> -	unsigned long eax = flg2MWAIT(state->flags);
> -
> -	if (boot_cpu_has(X86_FEATURE_ARAT))
> -		return false;
> -
> -	/*
> -	 * Switch over to one-shot tick broadcast if the target C-state
> -	 * is deeper than C1.
> -	 */
> -	return !!((eax >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK);
> -}
> -
>  static void __init intel_idle_init_cstates_acpi(struct cpuidle_driver *drv)
>  {
>  	int cstate, limit = min_t(int, CPUIDLE_STATE_MAX, acpi_state_table.count);
> 


-- 
~Randy
