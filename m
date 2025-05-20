Return-Path: <linux-next+bounces-6855-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C3BABE071
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 18:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131FA189740D
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 16:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BA62580FE;
	Tue, 20 May 2025 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTgrPvgb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3C252287;
	Tue, 20 May 2025 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757745; cv=none; b=JRPAy8lRGtd4y0ByjnFrq+bloJx7+EMneApRIeCjjkzndsSkboB044bIa+rMCQHNH3ogDTEQA0XwCKYg+s1fuxUkx7phxZ7LkG4k8VGhwYI2A927crs0+qkGJFBr8Aon/0k0USqh5iBVTkCtsWfw980nyebhlI4gJ869nRdBM3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757745; c=relaxed/simple;
	bh=BPT15T5+vOCGnLdF240pZNL9NjPwhTkJWj2EJZTK5xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7PpLgHuXSrGmFaZSqJqWRmDRCOs1CJVySigWKq/yTRQ0yrtMomAgdDrIhw2SP7evGwD0yhtMaIShVU2IsR2bB1yoyhejoyBK+QSoCixI0HlD+yvea2p/shBUKnMuFyZqOFSL8cv6kFATYJowka1DxRylBjay66Gc2aIL8zRdE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTgrPvgb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA33C4CEEA;
	Tue, 20 May 2025 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747757743;
	bh=BPT15T5+vOCGnLdF240pZNL9NjPwhTkJWj2EJZTK5xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTgrPvgb81CGKTu1/Gj/w+fG7eSQz1u9s12G4x3rgmA9reCjMVtnjmP28j4faZecz
	 FgVnhLoxO9IRgpJXK8JlZ5zoKFbQrOt0j1uGN7k2HZmq+W/oUEf5bJPrssbmP1otNV
	 cCuszpGluGoANDH7TSJ4deu7GmS+Ea/eSZDhTCxg4PbFYDiF1BTx9f+ByC+84tmzxI
	 q4IHrWJF+Ivhv2h2GT2/goZFVsgRnFQ9gHRTY4xTNsO7AFzT5o6/j3gsLBrtGb7xPi
	 UKjbuAuiVNM/7IEMZA61iOb+Mo9DN0otPIjD9uB32LTD4b9em0oBNtgZwQKezit4gb
	 ntHEqvWejprig==
Date: Tue, 20 May 2025 09:15:40 -0700
From: Kees Cook <kees@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-security-module@vger.kernel.org,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Subject: Re: linux-next: Tree for May 16 (security/landlock/ruleset.c)
Message-ID: <202505200914.086A9D4@keescook>
References: <20250516202417.31b13d13@canb.auug.org.au>
 <e3754f69-1dea-4542-8de0-a567a14fb95b@infradead.org>
 <20250519.jiveise8Rau8@digikod.net>
 <202505191117.C094A90F88@keescook>
 <20250519.ba8eoZu3XaeJ@digikod.net>
 <202505191212.61EE1AE80@keescook>
 <20250520.uof4li6vac3I@digikod.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520.uof4li6vac3I@digikod.net>

On Tue, May 20, 2025 at 04:45:19PM +0200, Mickaël Salaün wrote:
> On Mon, May 19, 2025 at 12:15:30PM -0700, Kees Cook wrote:
> > On Mon, May 19, 2025 at 08:41:17PM +0200, Mickaël Salaün wrote:
> > > On Mon, May 19, 2025 at 11:19:53AM -0700, Kees Cook wrote:
> > > > On Mon, May 19, 2025 at 05:29:30PM +0200, Mickaël Salaün wrote:
> > > > > On Fri, May 16, 2025 at 07:54:14PM -0700, Randy Dunlap wrote:
> > > > > > 
> > > > > > 
> > > > > > On 5/16/25 3:24 AM, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > > 
> > > > > > > Changes since 20250515:
> > > > > 
> > > > > Thanks for the report.
> > > > > 
> > > > > It is the same warning as reported here:
> > > > > https://lore.kernel.org/all/202501040747.S3LYfvYq-lkp@intel.com/
> > > > > 
> > > > > I don't know what the actual issue is though.
> > > > > 
> > > > > > 
> > > > > > on i386:
> > > > > > 
> > > > > > In file included from ../arch/x86/include/asm/string.h:3,
> > > > > >                  from ../include/linux/string.h:65,
> > > > > >                  from ../include/linux/bitmap.h:13,
> > > > > >                  from ../include/linux/cpumask.h:12,
> > > > > >                  from ../include/linux/smp.h:13,
> > > > > >                  from ../include/linux/lockdep.h:14,
> > > > > >                  from ../security/landlock/ruleset.c:16:
> > > > > > ../security/landlock/ruleset.c: In function 'create_rule':
> > > > > > ../arch/x86/include/asm/string_32.h:150:25: warning: '__builtin_memcpy' accessing 4294967295 bytes at offsets 20 and 0 overlaps 6442450943 bytes at offset -2147483648 [-Wrestrict]
> > > > > >   150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
> > > > > >       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > ../security/landlock/ruleset.c:137:9: note: in expansion of macro 'memcpy'
> > > > > >   137 |         memcpy(new_rule->layers, layers,
> > > > > >       |         ^~~~~~
> > > > > > 
> > > > > > 
> > > > > > Full randconfig file is attached.
> > > > 
> > > > The trigger appears to be CONFIG_PROFILE_ALL_BRANCHES, and GCC getting
> > > > tricked into thinking check_mul_overflow() returns true:
> > > > 
> > > > In file included from ../arch/x86/include/asm/string.h:3,
> > > >                  from ../include/linux/string.h:65,
> > > >                  from ../include/linux/bitmap.h:13,
> > > >                  from ../include/linux/cpumask.h:12,
> > > >                  from ../include/linux/smp.h:13,
> > > >                  from ../include/linux/lockdep.h:14,
> > > >                  from ../security/landlock/ruleset.c:16:
> > > > ../security/landlock/ruleset.c: In function 'create_rule':
> > > > ../arch/x86/include/asm/string_32.h:150:25: warning: '__builtin_memcpy' accessing 4294967295 bytes at offsets 0 and 0 overlaps 6442450943 bytes at offset -2147483648 [-Wrestrict]
> > > >   150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
> > > >       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > > ../security/landlock/ruleset.c:137:9: note: in expansion of macro 'memcpy'
> > > >   137 |         memcpy(new_rule->layers, layers,
> > > >       |         ^~~~~~
> > > >   'create_rule': event 1
> > > > ../include/linux/compiler.h:69:46:
> > > >    68 |         (cond) ?                                        \
> > > >       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >    69 |                 (__if_trace.miss_hit[1]++,1) :          \
> > > >       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
> > > >       |                                              |
> > > >       |                                              (1) when the condition is evaluated to true
> > > >    70 |                 (__if_trace.miss_hit[0]++,0);           \
> > > >       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
> > > > ../include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
> > > >    57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
> > > >       |                                                                     ^~~~~~~~~~~~~~~~
> > > > ../include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
> > > >    55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
> > > >       |                            ^~~~~~~~~~~~~~
> > > > ../include/linux/overflow.h:270:9: note: in expansion of macro 'if'
> > > >   270 |         if (check_mul_overflow(factor1, factor2, &bytes))
> > > >       |         ^~
> > > >   'create_rule': event 2
> > > > ../arch/x86/include/asm/string_32.h:150:25:
> > > >   150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
> > > >       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > >       |                         |
> > > >       |                         (2) out of array bounds here
> > > > ../security/landlock/ruleset.c:137:9: note: in expansion of macro 'memcpy'
> > > >   137 |         memcpy(new_rule->layers, layers,
> > > >       |         ^~~~~~
> > > > make[1]: Leaving directory '/srv/code/gcc-bug'
> > > 
> > > That's interesting...
> > > 
> > > > 
> > > > 
> > > > I'll take a look at ways to make either the overflow macros or memcpy
> > > > robust against this kind of weirdness...
> > > 
> > > Thanks!
> > 
> > I'm doing some build testing, but the below patch makes GCC happy.
> > Alternatively we could make CONFIG_PROFILE_ALL_BRANCHES=y depend on
> > CONFIG_FORTIFY_SOURCE=y ...
> > 
> > 
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
> 
> It works for me but I couldn't reproduce the issue.  I tried with
> CONFIG_PROFILE_ALL_BRANCHES=y and CONFIG_FORTIFY_SOURCE=n but it always
> works without a warning.  I'm using GCC 15.  Is it specific to a version
> of GCC?

It must be more than just those options -- I reproduced it with Randy's
randconfig under GCC 15.

-- 
Kees Cook

