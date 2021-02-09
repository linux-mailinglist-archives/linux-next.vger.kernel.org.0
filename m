Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A9331564A
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 19:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbhBISrB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 13:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233500AbhBIS3V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 13:29:21 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E94C061794;
        Tue,  9 Feb 2021 10:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=8F8qTneyF1oxisYOCOkgV5cowkuUejUJ2qzhXmwkNw0=; b=fTs5e35749PXu8LILdjOhJeUt9
        BPrkTVy/m/u8g9OK6kxI20QcRJyct2gdobEIvV1Iu8EFL/NREgj+ZwmzCVk226pOWnnfRiTmj3OcD
        m3d6FSkKvWkPtVR/DQLAbNnVqVM5KYXyRurNP/fn957XsHOh6L/M1WyGkTjScSP+LsDzdBCps9fHN
        vTGp0btnmuGQMRJlmTGhCbRwZrMeVFuzkKtx9F4EjZr2qgdPxv9nsqqTgMgFIatiaKLtGNCUi7MQ9
        DNQSKrUOeytMSmuc71OYSNK3o3QgK5jZVChDoVaAbCLNT1eR3OpuCQ/LDpoTA6RogPE6M2VRLTIQj
        281gv3mA==;
Received: from [2601:1c0:6280:3f0::cf3b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l9Xka-000067-SY; Tue, 09 Feb 2021 18:28:37 +0000
Subject: Re: [PATCH] lockdep: Noinstr annotate warn_bogus_irq_restore()
To:     Peter Zijlstra <peterz@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
 <YCJJAoC+r414zO+2@hirez.programming.kicks-ass.net>
 <20210209132430.GB71297@C02TD0UTHF1T.local>
 <YCKyYg53mMp4E7YI@hirez.programming.kicks-ass.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e92d4652-d6df-7fcd-6f0e-e1504653563b@infradead.org>
Date:   Tue, 9 Feb 2021 10:28:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCKyYg53mMp4E7YI@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/9/21 8:03 AM, Peter Zijlstra wrote:
> On Tue, Feb 09, 2021 at 01:24:30PM +0000, Mark Rutland wrote:
>> On Tue, Feb 09, 2021 at 09:34:10AM +0100, Peter Zijlstra wrote:
>>>
>>> Subject: lockdep: Noinstr annotate warn_bogus_irq_restore()
>>> From: Peter Zijlstra <peterz@infradead.org>
>>> Date: Tue Feb 9 09:30:03 CET 2021
>>>
>>>   vmlinux.o: warning: objtool: lock_is_held_type()+0x107: call to warn_bogus_irq_restore() leaves .noinstr.text section
>>>
>>> As per the general rule that WARNs are allowed to violate noinstr to
>>> get out, annotate it away.
>>>
>>> Fixes: 997acaf6b4b5 ("lockdep: report broken irq restoration")
>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>
>> Whoops; sorry for missing that!
>>
>> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> This runs into sodding header hell on mips (and possibly others)
> 
> How's this then?
> 
> ---
> Subject: lockdep: Noinstr annotate warn_bogus_irq_restore()
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Tue Feb 9 09:30:03 CET 2021
> 
>   vmlinux.o: warning: objtool: lock_is_held_type()+0x107: call to warn_bogus_irq_restore() leaves .noinstr.text section
> 
> As per the general rule that WARNs are allowed to violate noinstr to
> get out, annotate it away.
> 
> Fixes: 997acaf6b4b5 ("lockdep: report broken irq restoration")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  include/linux/irqflags.h       |    5 ++++-
>  kernel/locking/irqflag-debug.c |    4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> --- a/kernel/locking/irqflag-debug.c
> +++ b/kernel/locking/irqflag-debug.c
> @@ -4,8 +4,10 @@
>  #include <linux/export.h>
>  #include <linux/irqflags.h>
>  
> -void warn_bogus_irq_restore(void)
> +noinstr void warn_bogus_irq_restore(void)
>  {
> +	instrumentation_begin();
>  	WARN_ONCE(1, "raw_local_irq_restore() called with IRQs enabled\n");
> +	instrumentation_end();
>  }
>  EXPORT_SYMBOL(warn_bogus_irq_restore);
> 


-- 
~Randy


