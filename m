Return-Path: <linux-next+bounces-6856-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3AABE0EF
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 18:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C10D3A7DC3
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 16:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950AA248F46;
	Tue, 20 May 2025 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2wWhl4R"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E9724C07A;
	Tue, 20 May 2025 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759451; cv=none; b=pSCmsOOOuAGW+f+XytQZ63r4yAo1EG4yvOhir4Bvgomw7AITprgCEr9MfnKnOjb1qdmyEyq+j39wkdSeiP/LFSxA6Ig/2bUdyT9QOl4xKCB/pkuRRXg4UsJgERmjcO+1ZGif+Scs8dEpkfiqYarRdu7dPiD6t/hg4icgJ34tvbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759451; c=relaxed/simple;
	bh=7Jo866HOUWpn98YMZXcLAEx5hpVa/54PC3BmcqcA+Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0yarsRxa3RqBmgoF9EgcRwMeVRcePKCt4HINicXOvMT8GsgcfFe/fPTfTfigFRKggQjs9RahDC5LhRz5GMf4Ii+78EM+u7I4S5ZeMKiEOdAoD3c89SrRfU0kjpsAoRD8tMEl+/UavoLr5D0ecvXIRnFgT0hHHjh+0O6oX0kCS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2wWhl4R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4115C4CEE9;
	Tue, 20 May 2025 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747759449;
	bh=7Jo866HOUWpn98YMZXcLAEx5hpVa/54PC3BmcqcA+Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2wWhl4RO4BZBOSVjU8Oooqz/TfZkyXX7COE0J9D9hWU2WOSDHIdtlhDl16YNy7WM
	 GO0GvAoYdWX2SiDxqOmRcFxPVVxbUGU2ErbjPCfGy83BCsagQbWiKIF5A8zb1SYkBX
	 naTnmwHVyFsVRqmaLD+ACfqKm1JgZ1Y+aP5klSv0JcVXhVlac0lHKY08KPhGxyje9q
	 p4NWoLEGG9UXOVW5XsGI9DQsl3CjV/BdGEBpi3i/M9ilVQ2p4K2IJeiOlYDCzVUQto
	 svxltGDQyrKPv5Cd1+ByP/r9zAcRrq79duz5HSXocy7OF9iev8AYluvIX6rkMqHT5w
	 eEBntP2IRqVNA==
Date: Tue, 20 May 2025 09:44:06 -0700
From: Kees Cook <kees@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-security-module@vger.kernel.org,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Subject: Re: linux-next: Tree for May 16 (security/landlock/ruleset.c)
Message-ID: <202505200943.1A699B9@keescook>
References: <20250516202417.31b13d13@canb.auug.org.au>
 <e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org>
 <20250519.jiveise8Rau8@digikod.net>
 <202505191117.C094A90F88@keescook>
 <20250519.ba8eoZu3XaeJ@digikod.net>
 <202505191212.61EE1AE80@keescook>
 <d645a0a2-4ffd-4dc6-b8a9-522ec3d27d7f@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d645a0a2-4ffd-4dc6-b8a9-522ec3d27d7f@infradead.org>

On Mon, May 19, 2025 at 01:26:52PM -0700, Randy Dunlap wrote:
> 
> 
> > From 6fbf66fdfd0a7dac809b77faafdd72c60112bb8d Mon Sep 17 00:00:00 2001
> > From: Kees Cook <kees@kernel.org>
> > Date: Mon, 19 May 2025 11:52:06 -0700
> > Subject: [PATCH] string.h: Provide basic sanity checks for fallback memcpy()
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=UTF-8
> > Content-Transfer-Encoding: 8bit
> > 
> > Instead of defining memcpy() in terms of __builtin_memcpy() deep
> > in arch/x86/include/asm/string_32.h, notice that it is needed up in
> > the general string.h, as done with other common C String APIs. This
> > allows us to add basic sanity checking for pathological "size"
> > arguments to memcpy(). Besides the run-time checking benefit, this
> > avoids GCC trying to be very smart about value range tracking[1] when
> > CONFIG_PROFILE_ALL_BRANCHES=y but FORTIFY_SOURCE=n.
> > 
> > Link: https://lore.kernel.org/all/202505191117.C094A90F88@keescook/ [1]
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/all/202501040747.S3LYfvYq-lkp@intel.com/
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Closes: https://lore.kernel.org/all/e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org/
> > Signed-off-by: Kees Cook <kees@kernel.org>
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

I missed this when I sent out the proper patch. I'll add it locally.
Thanks!

-Kees

> 
> Thanks.
> 
> > ---
> > Cc: "Mickaël Salaün" <mic@digikod.net>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: <x86@kernel.org>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Andy Shevchenko <andy@kernel.org>
> > Cc: Uros Bizjak <ubizjak@gmail.com>
> > Cc: <linux-hardening@vger.kernel.org>
> > ---
> >  arch/x86/include/asm/string_32.h |  6 ------
> >  include/linux/string.h           | 13 +++++++++++++
> >  2 files changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/string_32.h b/arch/x86/include/asm/string_32.h
> > index e9cce169bb4c..74397c95fa37 100644
> > --- a/arch/x86/include/asm/string_32.h
> > +++ b/arch/x86/include/asm/string_32.h
> > @@ -145,12 +145,6 @@ static __always_inline void *__constant_memcpy(void *to, const void *from,
> >  #define __HAVE_ARCH_MEMCPY
> >  extern void *memcpy(void *, const void *, size_t);
> >  
> > -#ifndef CONFIG_FORTIFY_SOURCE
> > -
> > -#define memcpy(t, f, n) __builtin_memcpy(t, f, n)
> > -
> > -#endif /* !CONFIG_FORTIFY_SOURCE */
> > -
> >  #define __HAVE_ARCH_MEMMOVE
> >  void *memmove(void *dest, const void *src, size_t n);
> >  
> > diff --git a/include/linux/string.h b/include/linux/string.h
> > index 01621ad0f598..ffcee31a14f9 100644
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -3,6 +3,7 @@
> >  #define _LINUX_STRING_H_
> >  
> >  #include <linux/args.h>
> > +#include <linux/bug.h>
> >  #include <linux/array_size.h>
> >  #include <linux/cleanup.h>	/* for DEFINE_FREE() */
> >  #include <linux/compiler.h>	/* for inline */
> > @@ -390,7 +391,19 @@ static inline const char *kbasename(const char *path)
> >  
> >  #if !defined(__NO_FORTIFY) && defined(__OPTIMIZE__) && defined(CONFIG_FORTIFY_SOURCE)
> >  #include <linux/fortify-string.h>
> > +#else
> > +/* Basic sanity checking even without FORTIFY_SOURCE */
> > +# ifndef __HAVE_ARCH_MEMCPY
> > +#  define memcpy(t, f, n)					\
> > +	do {							\
> > +		typeof(n) __n = (n);				\
> > +		/* Skip impossible sizes. */			\
> > +		if (!WARN_ON(__n < 0 || __n == SIZE_MAX))	\
> > +			__builtin_memcpy(t, f, __n);		\
> > +	} while (0)
> > +# endif
> >  #endif
> > +
> >  #ifndef unsafe_memcpy
> >  #define unsafe_memcpy(dst, src, bytes, justification)		\
> >  	memcpy(dst, src, bytes)
> 
> -- 
> ~Randy

-- 
Kees Cook

