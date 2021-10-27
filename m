Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B7E43CD28
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 17:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237818AbhJ0PNs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 11:13:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:60999 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236709AbhJ0PNq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Oct 2021 11:13:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="217355195"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; 
   d="scan'208";a="217355195"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 08:11:20 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; 
   d="scan'208";a="447582988"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 08:11:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mfkZv-001U9K-7f;
        Wed, 27 Oct 2021 18:10:59 +0300
Date:   Wed, 27 Oct 2021 18:10:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <YXlsAjSYEw2TbsMN@smile.fi.intel.com>
References: <20211015202908.1c417ae2@canb.auug.org.au>
 <YWl+0PFixaNqgIxb@smile.fi.intel.com>
 <20211018133538.2a0dec43@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018133538.2a0dec43@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 18, 2021 at 01:35:38PM +1100, Stephen Rothwell wrote:
> On Fri, 15 Oct 2021 16:14:56 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> Like this (on top of my previous fix - which I assume Andrew will
> squash out of existence)?

Andrew, can you incorporate this one, please?

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Oct 2021 13:27:54 +1100
> Subject: [PATCH] kernel.h: split out instrcutions pointer accessors
> 
> botton_half.h needs _THIS_IP_ to be standalone, so split that and _RET_IP_
> out from kernel.h into the new instruction_pointer.h.  kernel.h directly
> needs them, so include it there and replace the include of kernel.h with
> this new file in bottom_half.h.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/bottom_half.h         | 2 +-
>  include/linux/instruction_pointer.h | 8 ++++++++
>  include/linux/kernel.h              | 4 +---
>  3 files changed, 10 insertions(+), 4 deletions(-)
>  create mode 100644 include/linux/instruction_pointer.h
> 
> diff --git a/include/linux/bottom_half.h b/include/linux/bottom_half.h
> index 11d107d88d03..fc53e0ad56d9 100644
> --- a/include/linux/bottom_half.h
> +++ b/include/linux/bottom_half.h
> @@ -2,7 +2,7 @@
>  #ifndef _LINUX_BH_H
>  #define _LINUX_BH_H
>  
> -#include <linux/kernel.h>
> +#include <linux/instruction_pointer.h>
>  #include <linux/preempt.h>
>  
>  #if defined(CONFIG_PREEMPT_RT) || defined(CONFIG_TRACE_IRQFLAGS)
> diff --git a/include/linux/instruction_pointer.h b/include/linux/instruction_pointer.h
> new file mode 100644
> index 000000000000..19e979425bda
> --- /dev/null
> +++ b/include/linux/instruction_pointer.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_INSTRUCTION_POINTER_H
> +#define _LINUX_INSTRUCTION_POINTER_H
> +
> +#define _RET_IP_		(unsigned long)__builtin_return_address(0)
> +#define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> +
> +#enfif /* _LINUX_INSTRUCTION_POINTER_H */
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 973c61ff2ef9..be84ab369650 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -20,6 +20,7 @@
>  #include <linux/printk.h>
>  #include <linux/build_bug.h>
>  #include <linux/static_call_types.h>
> +#include <linux/instruction_pointer.h>
>  #include <asm/byteorder.h>
>  
>  #include <uapi/linux/kernel.h>
> @@ -53,9 +54,6 @@
>  }					\
>  )
>  
> -#define _RET_IP_		(unsigned long)__builtin_return_address(0)
> -#define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> -
>  /**
>   * upper_32_bits - return bits 32-63 of a number
>   * @n: the number we're accessing
> -- 
> 2.33.0

-- 
With Best Regards,
Andy Shevchenko


