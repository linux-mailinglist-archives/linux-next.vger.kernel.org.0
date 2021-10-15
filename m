Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3552142EE9E
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 12:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237807AbhJOKRq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 06:17:46 -0400
Received: from mga05.intel.com ([192.55.52.43]:22698 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237905AbhJOKR0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Oct 2021 06:17:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="314085993"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="314085993"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 03:15:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="492402292"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 03:15:11 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mbN32-000Oz6-PT;
        Fri, 15 Oct 2021 16:14:56 +0300
Date:   Fri, 15 Oct 2021 16:14:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <YWl+0PFixaNqgIxb@smile.fi.intel.com>
References: <20211015202908.1c417ae2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015202908.1c417ae2@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Cc: Rasmus

On Fri, Oct 15, 2021 at 08:29:08PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from include/linux/rcupdate.h:28,
>                  from include/linux/rculist.h:11,
>                  from include/linux/pid.h:5,
>                  from include/linux/sched.h:14,
>                  from arch/arm/kernel/asm-offsets.c:11:
> include/linux/bottom_half.h: In function 'local_bh_disable':
> include/linux/bottom_half.h:19:24: error: '_THIS_IP_' undeclared (first use in this function)
>    19 |  __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFFSET);
>       |                        ^~~~~~~~~
> include/linux/bottom_half.h:19:24: note: each undeclared identifier is reported only once for each function it appears in
> include/linux/bottom_half.h: In function 'local_bh_enable':
> include/linux/bottom_half.h:32:23: error: '_THIS_IP_' undeclared (first use in this function)
>    32 |  __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFFSET);
>       |                       ^~~~~~~~~
> 
> Presumably caused by a commit in the series that starts with
> 
>   dcaf7a5f413b ("kernel.h: drop unneeded <linux/kernel.h> inclusion from other headers")
> 
> I have applied the following patch for today (though there may be a
> better solution).

Thanks! As a quick fix looks good, but I think we need a separate header for
those _*_IP_ macros.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 15 Oct 2021 19:58:46 +1100
> Subject: [PATCH] bottom_half.h needs kernel.h
> 
> for _THIS_IP_ on arm at least
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/bottom_half.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/bottom_half.h b/include/linux/bottom_half.h
> index eed86eb0a1de..11d107d88d03 100644
> --- a/include/linux/bottom_half.h
> +++ b/include/linux/bottom_half.h
> @@ -2,6 +2,7 @@
>  #ifndef _LINUX_BH_H
>  #define _LINUX_BH_H
>  
> +#include <linux/kernel.h>
>  #include <linux/preempt.h>
>  
>  #if defined(CONFIG_PREEMPT_RT) || defined(CONFIG_TRACE_IRQFLAGS)

-- 
With Best Regards,
Andy Shevchenko


