Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C6A2C641A
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 12:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgK0LxN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 06:53:13 -0500
Received: from mga07.intel.com ([134.134.136.100]:48347 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbgK0LxN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Nov 2020 06:53:13 -0500
IronPort-SDR: TzO67/01xOtaTwjpaEl9Hh0dIaA2vLJALHnp4/qqr1W3zMpgbc5e8RbdHdKXd32N9rqVsvX+cz
 p9FP9yNXB7TQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="236511423"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; 
   d="scan'208";a="236511423"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 03:53:12 -0800
IronPort-SDR: bFTPw9H7yrLy64Kbw5KmlJpKb8cKbhk2p9wKsj3qG/dQSDzCCZxxpcD1npZicnpBgm/Xrzjf2h
 RV497TweQwUA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; 
   d="scan'208";a="363137400"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 03:53:10 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kicKJ-00ARXC-TX; Fri, 27 Nov 2020 13:54:11 +0200
Date:   Fri, 27 Nov 2020 13:54:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Message-ID: <20201127115411.GF4077@smile.fi.intel.com>
References: <20201127183924.36696fb0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127183924.36696fb0@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 27, 2020 at 06:39:24PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/linux/kernel.h
> 
> between commit:
> 
>   74d862b682f5 ("sched: Make migrate_disable/enable() independent of RT")
> 
> from the tip tree and commit:
> 
>   761ace49e56f ("kernel.h: Split out mathematical helpers")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, from my perspective looks good, dunno if scheduler part is okay.

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/linux/kernel.h
> index dbf6018fc312,f97ab3283a8b..000000000000
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@@ -272,48 -145,13 +159,6 @@@ extern void __cant_migrate(const char *
>   
>   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
>   
> - /**
> -  * abs - return absolute value of an argument
> -  * @x: the value.  If it is unsigned type, it is converted to signed type first.
> -  *     char is treated as if it was signed (regardless of whether it really is)
> -  *     but the macro's return type is preserved as char.
> -  *
> -  * Return: an absolute value of x.
> -  */
> - #define abs(x)	__abs_choose_expr(x, long long,				\
> - 		__abs_choose_expr(x, long,				\
> - 		__abs_choose_expr(x, int,				\
> - 		__abs_choose_expr(x, short,				\
> - 		__abs_choose_expr(x, char,				\
> - 		__builtin_choose_expr(					\
> - 			__builtin_types_compatible_p(typeof(x), char),	\
> - 			(char)({ signed char __x = (x); __x<0?-__x:__x; }), \
> - 			((void)0)))))))
> - 
> - #define __abs_choose_expr(x, type, other) __builtin_choose_expr(	\
> - 	__builtin_types_compatible_p(typeof(x),   signed type) ||	\
> - 	__builtin_types_compatible_p(typeof(x), unsigned type),		\
> - 	({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
> - 
> - /**
> -  * reciprocal_scale - "scale" a value into range [0, ep_ro)
> -  * @val: value
> -  * @ep_ro: right open interval endpoint
> -  *
> -  * Perform a "reciprocal multiplication" in order to "scale" a value into
> -  * range [0, @ep_ro), where the upper interval endpoint is right-open.
> -  * This is useful, e.g. for accessing a index of an array containing
> -  * @ep_ro elements, for example. Think of it as sort of modulus, only that
> -  * the result isn't that of modulo. ;) Note that if initial input is a
> -  * small value, then result will return 0.
> -  *
> -  * Return: a result based on @val in interval [0, @ep_ro).
> -  */
> - static inline u32 reciprocal_scale(u32 val, u32 ep_ro)
> - {
> - 	return (u32)(((u64) val * ep_ro) >> 32);
> - }
>  -#ifndef CONFIG_PREEMPT_RT
>  -# define cant_migrate()		cant_sleep()
>  -#else
>  -  /* Placeholder for now */
>  -# define cant_migrate()		do { } while (0)
>  -#endif
> --
>   #if defined(CONFIG_MMU) && \
>   	(defined(CONFIG_PROVE_LOCKING) || defined(CONFIG_DEBUG_ATOMIC_SLEEP))
>   #define might_fault() __might_fault(__FILE__, __LINE__)



-- 
With Best Regards,
Andy Shevchenko


