Return-Path: <linux-next+bounces-6858-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5593DABE10F
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 18:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB3968C3894
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 16:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CCA256C60;
	Tue, 20 May 2025 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCuvvuqa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88461211497;
	Tue, 20 May 2025 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759663; cv=none; b=dLiJPOhYJ9xPwL2dTwqdCS4/8JINAaMq6Iz+6b9MBUOqvdRL9rssZ0EtjwLpqeeb98uUqNDn0Nk6idEN7AAgt6FtQ+FemieAGumQTS4vzmLpjieEQQDjcrWqYL7GXPSdiXz4IhKayPu3A2r23gY6ElykuSnbotIc+WTpx/KoPBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759663; c=relaxed/simple;
	bh=Axihyr7398qJC9RwLmYp5/r6di4dlvly/GLdLRtqlU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZ+BSMptyx5tAGCjTnyu7rchYEzXCuvLPismr3pOdBDRt6EdpeRBcXQoRQXSywsKVlVjIoc42QhlMrDEbA/sU/SZqdDpT9tQO1gkDi6gBpfDkfuPf3mts3+KE0vGX5+0QUDWvmn/o6+q82WYBMvfX5SW8q4tzWmGxrRU0W2EP6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCuvvuqa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11428C4CEE9;
	Tue, 20 May 2025 16:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747759663;
	bh=Axihyr7398qJC9RwLmYp5/r6di4dlvly/GLdLRtqlU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCuvvuqapQz8wD3YmbuiGIaIhFV/qE2/rzrctpKMqUT3/85sx1phf199drMZ6vd68
	 03j6/3Z1RnTtUMBSofERWU+vvpph+vtyw6u6QZaXp0hmWXUSH7ZpiB6d2WHJacxZni
	 ZnHO0ZaAn5uxa4ZUnL7/Iw/mptR54MX3vtqUVgxlt7kfKNhKONlYJYdQNKao9z9l8z
	 zfazmU2qHq7OgXNgg2d4H//lnb+q4qtTHwbDtiyc1wBw6R2gRiyXyTSTzP6KzqNSs9
	 hOHHu717m1hVIBkmkfEzqykCjEa5ZJ1tF4neVA4GU599F5wTOVExAOQPG2x9BLDBEJ
	 Uov/l3VO9/UBw==
Date: Tue, 20 May 2025 09:47:39 -0700
From: Kees Cook <kees@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-security-module@vger.kernel.org,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Subject: Re: linux-next: Tree for May 16 (security/landlock/ruleset.c)
Message-ID: <202505200947.5D9CE9EBE1@keescook>
References: <20250516202417.31b13d13@canb.auug.org.au>
 <e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org>
 <20250519.jiveise8Rau8@digikod.net>
 <202505191117.C094A90F88@keescook>
 <20250519.ba8eoZu3XaeJ@digikod.net>
 <202505191212.61EE1AE80@keescook>
 <aCyLT2qr_7iJJHm6@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCyLT2qr_7iJJHm6@black.fi.intel.com>

On Tue, May 20, 2025 at 05:01:51PM +0300, Andy Shevchenko wrote:
> On Mon, May 19, 2025 at 12:15:30PM -0700, Kees Cook wrote:
> > On Mon, May 19, 2025 at 08:41:17PM +0200, Mickaël Salaün wrote:
> 
> ...
> 
> > >From 6fbf66fdfd0a7dac809b77faafdd72c60112bb8d Mon Sep 17 00:00:00 2001
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
> 
> In case you are go with this change, please keep the headers in order.
> 
> >  #include <linux/array_size.h>
> 
> (should be located here)

Oops, yes, that was my intent but I typoed my insert, it seems. Fixed
now; thanks!

-Kees

-- 
Kees Cook

