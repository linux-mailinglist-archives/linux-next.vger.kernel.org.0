Return-Path: <linux-next+bounces-7398-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F10AFC2C9
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 08:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50C164A48DC
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 06:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F51F220F4C;
	Tue,  8 Jul 2025 06:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PlQsXOmW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="65kOwGLL"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA5381BA;
	Tue,  8 Jul 2025 06:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956351; cv=none; b=ddgKErvpfZ+X9YqT0GsvItqoG61BQoMmbRLK8b8zWehNTBmM7Cg42ZWeI4r4uEDruIgvxPLi6/zDzD9oH28qNh+1R9LuH3tAWgow0+E5uNeorqrKIwmTBP2TCbn9zVWkgbwTuT0DhotkUx4jZlGhnONk1rTXlGse6+YcS67JWJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956351; c=relaxed/simple;
	bh=QvKD1K4PJoOwwKBgcaBXF83ag/PuXhhYOqmRMyy6Mic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXMbwODUMcw08Y4CP0c5P5l9njoX/MZ3nHvKLFU3NEEEpcHpUgNP9MvxCjcdWbqIOz3WjVZDyHRBiTYV70/tDB/FFRyLPxwLTOLRaSH9V84NDw64jx5QIBpEWmp95S4fN//NVOjM3xIJ7+8rL1CxQNWM6VYw8u7CR0DqNLCvXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PlQsXOmW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=65kOwGLL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 8 Jul 2025 08:32:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751956347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DjvxOL93iYQyr3YyLmUGWLh/xq+jflhMRBCIUpOs3sA=;
	b=PlQsXOmWKzlCGGLP1H+0W+jXdFEqvwyHPRP0MHfbrhgyaRgPC4Ldlu+xy7Oq7Sxbl6Peb1
	TovWQw8QvB34DX8dl975PAvUfGp6DqisgBPcWvJGdVyrvaST015XJFSgqsgtLrFL1bPelz
	Rzau7MpY7qMJbvJVLAxmericdV8HgX0oX8v1lOBTYR+/ehAQozOgOSQarYrcnxwG0SWmrY
	VgQP2jGRYocLa4RmVRKXWCRl8wxCyTWrYDA6/RjNAb532rv5bvzsnhmiAVGRSlBCQvjU3r
	zMMOtz3kFUg36FeCK0bTXMOiW+y4ezEj9AgcfK8Gc5qg/IaNanfVWimrSRcYaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751956347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DjvxOL93iYQyr3YyLmUGWLh/xq+jflhMRBCIUpOs3sA=;
	b=65kOwGLLQKtS+azuYk7YF99BcyaIyY/n7gLjQLjAyOKWdkf9KdX8zZCP49IxWYLsodl8M2
	lDFCbDixTvis8FBA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20250708082658-851e75f2-6899-49b2-9923-a33df9e2029f@linutronix.de>
References: <20250708160830.36ddf20f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708160830.36ddf20f@canb.auug.org.au>

Hi Stephen,

On Tue, Jul 08, 2025 at 04:08:30PM +1000, Stephen Rothwell wrote:
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_allmodconfig) produced this warning:
> 
> In file included from include/vdso/datapage.h:8,
>                  from lib/vdso/gettimeofday.c:6,
>                  from <command-line>:
> lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime_common':
> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
>     7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
>       |                                                        ^~
> include/vdso/datapage.h:50:25: note: in expansion of macro '__GENMASK'
>    50 | #define VDSO_AUX        __GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
>       |                         ^~~~~~~~~
> lib/vdso/gettimeofday.c:335:24: note: in expansion of macro 'VDSO_AUX'
>   335 |         else if (msk & VDSO_AUX)
>       |                        ^~~~~~~~
> lib/vdso/gettimeofday.c: In function '__cvdso_clock_getres_common':
> include/uapi/linux/bits.h:7:56: warning: right shift count >= width of type [-Wshift-count-overflow]
>     7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
>       |                                                        ^~
> include/vdso/datapage.h:50:25: note: in expansion of macro '__GENMASK'
>    50 | #define VDSO_AUX        __GENMASK(CLOCK_AUX_LAST, CLOCK_AUX)
>       |                         ^~~~~~~~~
> lib/vdso/gettimeofday.c:481:26: note: in expansion of macro 'VDSO_AUX'
>   481 |         } else if (msk & VDSO_AUX) {
>       |                          ^~~~~~~~
> 
> Introduced by commit
> 
>   7893ea1006fc ("vdso/gettimeofday: Add support for auxiliary clocks")

thanks for the report. I am aware of this issue and working on resolving it.
Is this warning a blocking issue for -next at the moment?

Background, from [0]:

This [commit] depends on v6.16-rc2 *exactly*.
The specific dependency is commit 11fcf368506d ("uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again"),
which is available in v6.16-rc2.
Unfortunately that got broken again in v6.16-rc3 by
commit  fc92099902fb ("tools headers: Synchronize linux/bits.h with the kernel sources").
Another fix for this is pending [1] and should make it into v6.16.

[0] https://lore.kernel.org/lkml/20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de/
[1] https://lore.kernel.org/lkml/20250630-uapi-genmask-v1-1-eb0ad956a83e@linutronix.de/


Thomas

