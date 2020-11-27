Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B6F2C6D14
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 23:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732063AbgK0Vj3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 16:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731224AbgK0Viy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 16:38:54 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E84C0613D4;
        Fri, 27 Nov 2020 13:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=nO4RXuLseZ9MllgwTyIUkN6yFSiutROqckJ+OiN9Exk=; b=LkWve4UNDL+zocHWZAlhr7y2Gj
        u/UHYsXNREBswsFjIg5zoMAfXgomJ6MT7tF555vGL5q7ygZhq+jlBIYJWUh6hNn1t/5xEoSreQoYO
        vYhtzN0rJqnK8D03nZvhYHaMc6vtmhOLXOtSO8P6yZgbrEvs+x44NKBwqncjjvxkHSM33IytDa7A2
        oE0FMx1Px8LNwMUIHQXMPUXK6ko0e4njkwxi+/zIdntevqOjFLFwZ6AmVJ9/+IqQTi44lEe23xObL
        dJtIoVMzqhNtP1SaZzU/3Ea57bu3GgpGe1VJT7vhNDZYdKN75UN1qMceoP7Ejj1tBQUJJK3Y/vImM
        WAj4NYCw==;
Received: from [2601:1c0:6280:3f0::cc1f]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kilS1-0004ga-Ln; Fri, 27 Nov 2020 21:38:46 +0000
Subject: Re: linux-next: Tree for Nov 27 (drivers/idle/intel_idle.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Len Brown <lenb@kernel.org>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
 <0a6cc4c9-c48d-dbc4-6044-3b22cd133b76@infradead.org>
 <20201128083617.50021fff@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d9a42bb5-7a5d-cc19-2866-0cee1b8dd9bd@infradead.org>
Date:   Fri, 27 Nov 2020 13:38:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128083617.50021fff@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/27/20 1:36 PM, Stephen Rothwell wrote:
> Hi Randy,
> 
> On Fri, 27 Nov 2020 07:57:32 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 11/27/20 1:04 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20201126:
>>>   
>>
>> (This looks strange to me.)
>>
>>
>> on i386 or x86_64:
>>
>> # CONFIG_ACPI is not set
>>
>> ../drivers/idle/intel_idle.c: In function ‘intel_idle_init_cstates_icpu’:
>> ../drivers/idle/intel_idle.c:1510:7: error: implicit declaration of function ‘intel_idle_state_needs_timer_stop’; did you mean ‘intel_idle_init_cstates_icpu’? [-Werror=implicit-function-declaration]
>>    if (intel_idle_state_needs_timer_stop(&drv->states[drv->state_count]))
>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> intel_idle_state_needs_timer_stop() is only defined when
> CONFIG_ACPI_PROCESSOR_CSTATE is set, but is used once where that is not
> necessarily set.  I assume CONFIG_ACPI_PROCESSOR_CSTATE is not set in
> your config?

Yes, you are correct (not set).

> Caused by commit
> 
>   6e1d2bc675bd ("intel_idle: Fix intel_idle() vs tracing")
> 
> from the tip tree.


-- 
~Randy

