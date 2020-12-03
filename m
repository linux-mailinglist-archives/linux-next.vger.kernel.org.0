Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251812CD46C
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 12:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbgLCLQ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 06:16:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:50836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728546AbgLCLQ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 06:16:57 -0500
Date:   Thu, 3 Dec 2020 11:16:12 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20201203111611.GD2224@gaia>
References: <20201203190426.5a2cc067@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203190426.5a2cc067@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 03, 2020 at 07:06:01PM +1100, Stephen Rothwell wrote:
> diff --cc arch/arm64/include/asm/uaccess.h
> index d841a560fae7,abb31aa1f8ca..000000000000
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@@ -186,64 -159,20 +159,43 @@@ static inline void __uaccess_enable_hw_
>   			CONFIG_ARM64_PAN));
>   }
>   
> - #define __uaccess_disable(alt)						\
> - do {									\
> - 	if (!uaccess_ttbr0_disable())					\
> - 		asm(ALTERNATIVE("nop", SET_PSTATE_PAN(1), alt,		\
> - 				CONFIG_ARM64_PAN));			\
> - } while (0)
> - 
> - #define __uaccess_enable(alt)						\
> - do {									\
> - 	if (!uaccess_ttbr0_enable())					\
> - 		asm(ALTERNATIVE("nop", SET_PSTATE_PAN(0), alt,		\
> - 				CONFIG_ARM64_PAN));			\
> - } while (0)
> - 
>  +/*
>  + * The Tag Check Flag (TCF) mode for MTE is per EL, hence TCF0
>  + * affects EL0 and TCF affects EL1 irrespective of which TTBR is
>  + * used.
>  + * The kernel accesses TTBR0 usually with LDTR/STTR instructions
>  + * when UAO is available, so these would act as EL0 accesses using
>  + * TCF0.
>  + * However futex.h code uses exclusives which would be executed as
>  + * EL1, this can potentially cause a tag check fault even if the
>  + * user disables TCF0.
>  + *
>  + * To address the problem we set the PSTATE.TCO bit in uaccess_enable()
>  + * and reset it in uaccess_disable().
>  + *
>  + * The Tag check override (TCO) bit disables temporarily the tag checking
>  + * preventing the issue.
>  + */
> - static inline void uaccess_disable(void)
> + static inline void uaccess_disable_privileged(void)
>   {
>  +	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(0),
>  +				 ARM64_MTE, CONFIG_KASAN_HW_TAGS));
>  +
> - 	__uaccess_disable(ARM64_HAS_PAN);
> + 	if (uaccess_ttbr0_disable())
> + 		return;
> + 
> + 	__uaccess_enable_hw_pan();
>   }
>   
> - static inline void uaccess_enable(void)
> + static inline void uaccess_enable_privileged(void)
>   {
>  +	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1),
>  +				 ARM64_MTE, CONFIG_KASAN_HW_TAGS));
>  +
> - 	__uaccess_enable(ARM64_HAS_PAN);
> - }
> - 
> - /*
> -  * These functions are no-ops when UAO is present.
> -  */
> - static inline void uaccess_disable_not_uao(void)
> - {
> - 	__uaccess_disable(ARM64_ALT_PAN_NOT_UAO);
> - }
> + 	if (uaccess_ttbr0_enable())
> + 		return;
>   
> - static inline void uaccess_enable_not_uao(void)
> - {
> - 	__uaccess_enable(ARM64_ALT_PAN_NOT_UAO);
> + 	__uaccess_disable_hw_pan();
>   }
>   
>   /*

Thanks Stephen, it looks fine. I may clean it up a bit with dedicated
functions for the asm statements but after -rc1.

-- 
Catalin
