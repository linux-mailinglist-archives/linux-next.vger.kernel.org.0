Return-Path: <linux-next+bounces-6841-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C9ABC85F
	for <lists+linux-next@lfdr.de>; Mon, 19 May 2025 22:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7416189B2D3
	for <lists+linux-next@lfdr.de>; Mon, 19 May 2025 20:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DF12165E9;
	Mon, 19 May 2025 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CLscnDOK"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB03218ABA;
	Mon, 19 May 2025 20:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747686422; cv=none; b=X1cf8L5BIeAMimGGKCY01UTIkNMCGAxPBDIKa98iiSXTxmlhPCvQemU+LNLr6+oWkO1WEcF2NBBdeoFC7n5D54vTPo540wU0frj5Fld4CjH/7C7wh/eb5yjDrHAZetXIAPwulW3yrTrz0sbV07BmAPmJjaHxUXF07hkeN44v2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747686422; c=relaxed/simple;
	bh=l5upmzFVp75abDu6YqRT8MBIFAQxtBa3/aCt6W+nB2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfPnG6Dis7PSdhk8DYF7kOk5zQYOXGEkQUSTS7HH7iS4bDStMxK+mQs6K5NbN77svYgKf+keFNPk/VKBy8qKAlBmeeUI4FB+ZeQs5j1AnkfsmH7pWhu+dg7UyJ24G1UrwczXdZ7VUp7xRuRuyK5EJ2/isrYSJ35UJH3ltXcexkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CLscnDOK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=OdUPEKiubFLR9XRzcKGanx11EyQE8ZL6x7BAXWrg/PI=; b=CLscnDOKMkzEFZ5iGP70Ggp0PI
	LbQG+GsCzcZ69OfvnoiAm7kcYMOTdLZPZ8UBx+UdqLb3HQbRmO5rJglxm4OL5B4BLJGcKic3421jV
	zkYk7amFu6aj1s3+IVp+/b44zkJBZ/VEKRUyefCRyZ7Wik7ZQ/t2Tt8LHqIROBnb95bgb+1lVjFwk
	Rs+R0ohgaer/95Phhg0JaIgsokrSgNjEgvtuSiIt+oAHK4nOt7tPVnsqi4x9xXgUgbPrUvUfWJiWW
	fC1+8EoVhXrMOsog1exMDdkLYUD8YDqppmjrYx7cV7kPRN4sx/nOS2H/kM/TumkC4QswqiTpEBhM1
	FbEP/WnA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH74Z-00000002LEv-0zCU;
	Mon, 19 May 2025 20:26:55 +0000
Message-ID: <d645a0a2-4ffd-4dc6-b8a9-522ec3d27d7f@infradead.org>
Date: Mon, 19 May 2025 13:26:52 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 16 (security/landlock/ruleset.c)
To: Kees Cook <kees@kernel.org>, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org, =?UTF-8?Q?G=C3=BCnther_Noack?=
 <gnoack@google.com>
References: <20250516202417.31b13d13@canb.auug.org.au>
 <e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org>
 <20250519.jiveise8Rau8@digikod.net> <202505191117.C094A90F88@keescook>
 <20250519.ba8eoZu3XaeJ@digikod.net> <202505191212.61EE1AE80@keescook>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202505191212.61EE1AE80@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



> From 6fbf66fdfd0a7dac809b77faafdd72c60112bb8d Mon Sep 17 00:00:00 2001
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

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

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
>  #include <linux/array_size.h>
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
~Randy

