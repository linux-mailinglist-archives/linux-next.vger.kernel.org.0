Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D213531501C
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 14:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhBINZV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 08:25:21 -0500
Received: from foss.arm.com ([217.140.110.172]:51664 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230414AbhBINZU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 08:25:20 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 114E0ED1;
        Tue,  9 Feb 2021 05:24:34 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.42.209])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF71E3F719;
        Tue,  9 Feb 2021 05:24:32 -0800 (PST)
Date:   Tue, 9 Feb 2021 13:24:30 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] lockdep: Noinstr annotate warn_bogus_irq_restore()
Message-ID: <20210209132430.GB71297@C02TD0UTHF1T.local>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
 <YCJJAoC+r414zO+2@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCJJAoC+r414zO+2@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 09, 2021 at 09:34:10AM +0100, Peter Zijlstra wrote:
> 
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

Whoops; sorry for missing that!

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  include/linux/irqflags.h |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> --- a/include/linux/irqflags.h
> +++ b/include/linux/irqflags.h
> @@ -153,8 +153,11 @@ do {						\
>  extern void warn_bogus_irq_restore(void);
>  #define raw_check_bogus_irq_restore()			\
>  	do {						\
> -		if (unlikely(!arch_irqs_disabled()))	\
> +		if (unlikely(!arch_irqs_disabled())) {	\
> +			instrumentation_begin();	\
>  			warn_bogus_irq_restore();	\
> +			instrumentation_end();		\
> +		}					\
>  	} while (0)
>  #else
>  #define raw_check_bogus_irq_restore() do { } while (0)
