Return-Path: <linux-next+bounces-6851-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33719ABDAE9
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 16:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4438D18949E4
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 14:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CB9246792;
	Tue, 20 May 2025 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVVFUmzA"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBCA2459FE;
	Tue, 20 May 2025 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749717; cv=none; b=cvRIt3TGVQZ1/QSjae+B5FRt8IV/h39ynEgxzXLZb9nU0pI5yghfvjwAoyDRb55Zz2Y8RRIffMQ1EprB30ROtCdBSmEgBcIS+OIsN0aHeRbxI+/VqfVzkgsNUyGB8Ha3cB1Cytuju8yylm0LURwq9YUcoOhuhQWp474itVXvKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749717; c=relaxed/simple;
	bh=8fVp9ZnpofKSq7wKkEZNR4N3yHYTktEXV+Uq6k2gtYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShkIwTW6oc1UFYZTmyAfvx+EjkmRQ72CxhHj+/VLtqDZJqx6hM0zRzylY0k2945w6J1WfC1jMqEPJP6sEC+dtw2CWG1hZ5BprXGfk9nX9GxEgpo9rBDeIlJVCV3ZomRaOC1IILkszXjrVeRX4qLtFuIFP2JgQmXL6DEvtgOSphU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVVFUmzA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747749716; x=1779285716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8fVp9ZnpofKSq7wKkEZNR4N3yHYTktEXV+Uq6k2gtYc=;
  b=TVVFUmzAMtGu2IORiE8GCNGtY9xYkjgitz9wLOev8vY2myVR7TPavRX2
   86RTleV4qJixkV/HfkjKjwlsJ17WmD9RC5kBkvxzKlEiuCGijNwRYHZtA
   zyLCyDtnMEVArFWcw2SeTRSC7ngU6nScbSsQEnCkc8PFzlnwdIucQFuKP
   Dsal/AkDbj11UF86s+hxdKezWSUNQCU/zKL8/0lvqXdXjZWTbP3cSMbmY
   /K2ow2SFtXI0haUX13hg3g5suDF1ps1cA991qwlgxoe/fbXw29qj8En2V
   nXwPSv539dYalH1SIdxlAVJwBNbblDBLUjG2na87SUs174XXnV23wATcI
   Q==;
X-CSE-ConnectionGUID: kY2qDnNjR0WF04IGbDRfEg==
X-CSE-MsgGUID: 9byoEXaJS/KziDvoktRJrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49839245"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49839245"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:01:56 -0700
X-CSE-ConnectionGUID: Jkg5BZR2SMWPVKvc5tOZ/w==
X-CSE-MsgGUID: 1nvea+dxRkuB4oEzywm6HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140218929"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 20 May 2025 07:01:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3D3BF368; Tue, 20 May 2025 17:01:51 +0300 (EEST)
Date: Tue, 20 May 2025 17:01:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-security-module@vger.kernel.org,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Subject: Re: linux-next: Tree for May 16 (security/landlock/ruleset.c)
Message-ID: <aCyLT2qr_7iJJHm6@black.fi.intel.com>
References: <20250516202417.31b13d13@canb.auug.org.au>
 <e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org>
 <20250519.jiveise8Rau8@digikod.net>
 <202505191117.C094A90F88@keescook>
 <20250519.ba8eoZu3XaeJ@digikod.net>
 <202505191212.61EE1AE80@keescook>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202505191212.61EE1AE80@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 19, 2025 at 12:15:30PM -0700, Kees Cook wrote:
> On Mon, May 19, 2025 at 08:41:17PM +0200, Mickaël Salaün wrote:

...

> >From 6fbf66fdfd0a7dac809b77faafdd72c60112bb8d Mon Sep 17 00:00:00 2001
> From: Kees Cook <kees@kernel.org>
> Date: Mon, 19 May 2025 11:52:06 -0700
> Subject: [PATCH] string.h: Provide basic sanity checks for fallback memcpy()
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Instead of defining memcpy() in terms of __builtin_memcpy() deep
> in arch/x86/include/asm/string_32.h, notice that it is needed up in
> the general string.h, as done with other common C String APIs. This
> allows us to add basic sanity checking for pathological "size"
> arguments to memcpy(). Besides the run-time checking benefit, this
> avoids GCC trying to be very smart about value range tracking[1] when
> CONFIG_PROFILE_ALL_BRANCHES=y but FORTIFY_SOURCE=n.
> 
> Link: https://lore.kernel.org/all/202505191117.C094A90F88@keescook/ [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202501040747.S3LYfvYq-lkp@intel.com/
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org/
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: "Mickaël Salaün" <mic@digikod.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: <x86@kernel.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Uros Bizjak <ubizjak@gmail.com>
> Cc: <linux-hardening@vger.kernel.org>
> ---
>  arch/x86/include/asm/string_32.h |  6 ------
>  include/linux/string.h           | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/string_32.h b/arch/x86/include/asm/string_32.h
> index e9cce169bb4c..74397c95fa37 100644
> --- a/arch/x86/include/asm/string_32.h
> +++ b/arch/x86/include/asm/string_32.h
> @@ -145,12 +145,6 @@ static __always_inline void *__constant_memcpy(void *to, const void *from,
>  #define __HAVE_ARCH_MEMCPY
>  extern void *memcpy(void *, const void *, size_t);
>  
> -#ifndef CONFIG_FORTIFY_SOURCE
> -
> -#define memcpy(t, f, n) __builtin_memcpy(t, f, n)
> -
> -#endif /* !CONFIG_FORTIFY_SOURCE */
> -
>  #define __HAVE_ARCH_MEMMOVE
>  void *memmove(void *dest, const void *src, size_t n);
>  
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 01621ad0f598..ffcee31a14f9 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -3,6 +3,7 @@
>  #define _LINUX_STRING_H_
>  
>  #include <linux/args.h>
> +#include <linux/bug.h>

In case you are go with this change, please keep the headers in order.

>  #include <linux/array_size.h>

(should be located here)

>  #include <linux/cleanup.h>	/* for DEFINE_FREE() */
>  #include <linux/compiler.h>	/* for inline */
> @@ -390,7 +391,19 @@ static inline const char *kbasename(const char *path)
>  
>  #if !defined(__NO_FORTIFY) && defined(__OPTIMIZE__) && defined(CONFIG_FORTIFY_SOURCE)
>  #include <linux/fortify-string.h>
> +#else
> +/* Basic sanity checking even without FORTIFY_SOURCE */
> +# ifndef __HAVE_ARCH_MEMCPY
> +#  define memcpy(t, f, n)					\
> +	do {							\
> +		typeof(n) __n = (n);				\
> +		/* Skip impossible sizes. */			\
> +		if (!WARN_ON(__n < 0 || __n == SIZE_MAX))	\
> +			__builtin_memcpy(t, f, __n);		\
> +	} while (0)
> +# endif
>  #endif
> +
>  #ifndef unsafe_memcpy
>  #define unsafe_memcpy(dst, src, bytes, justification)		\
>  	memcpy(dst, src, bytes)

-- 
With Best Regards,
Andy Shevchenko



