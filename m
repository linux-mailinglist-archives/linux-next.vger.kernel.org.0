Return-Path: <linux-next+bounces-7661-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C385B0C37F
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 13:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 666DB4E5E17
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 11:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6622D23AD;
	Mon, 21 Jul 2025 11:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4ofNjYw"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8D2BFC7B;
	Mon, 21 Jul 2025 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753098149; cv=none; b=p55iT2zxHVJqyLOxT/P8F13nEvi5+E5ABNhESyz+HNstEVDIp8lInPAAWvJvoOEiS5gQA0/ehx1mKN3+Un01VazrRHV/PAnYMn5gys7Jc71rAZ8tA4DCkM6FbiIY1O3PSb5YHHUo8vBDzgoEscNrzosFicg6X+JXFs0QQEP+h18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753098149; c=relaxed/simple;
	bh=WezkxZb+PXy8GmsDUb+kAjkO/qBnvKppURLnc8BKBdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xz+ZZ1znO7Qq11kH+38k1+0+b6ePBaW6ndiVKWkxakQPdjGX9Tynr7Gh3ZwPT9jznEU6/n8ooc0aI8bwyX2tvWb+4xBFRxvqTGTsXdcLQVuplhCQXdc7Ot1UwjYGkvqtJp8MQiicTGEv+QfQJ31O8xTo7bMFFS6O942GYHTFmLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4ofNjYw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753098148; x=1784634148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WezkxZb+PXy8GmsDUb+kAjkO/qBnvKppURLnc8BKBdI=;
  b=Z4ofNjYw50bUPz2z07+UdrFMksOc4ywmwV/ulVFDwyLWNi+ww0QJeGew
   f65yOU8r8qVQcY7ZvmroRDvWrtRiEDRDlR/pgHWk0h7DLuhMX8r2iPqwm
   zSWPCYgwtvQR64BR4ZG0MtZ60w4qnjMwBuq4q+a+URBZJ+JYEtQFc9Z3u
   A/RNQY2wtKVuK8mQ40zeoxJtoXvvPdIXog4ANhDixuXvykVIPBKoXlRKB
   TqXB//NkExdgva7nBjWvFnAuGfOaOAfNTvyskp06eMEYTkluk1cBUhn0I
   pRzKK0KRdUazq66Ujn3nVeUWphhr4Jgkrq+9tZVy0hymqLdF/ak6+msNN
   w==;
X-CSE-ConnectionGUID: QIbaI1gRSNqQqfyF9e251A==
X-CSE-MsgGUID: 0SH5F338SdaTjmC0jRp/2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="66658244"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="66658244"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 04:42:27 -0700
X-CSE-ConnectionGUID: h7xVXM/FSd+STnjxiO+gSw==
X-CSE-MsgGUID: F+SIR6XET4GP2hgSKWd4GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="189771089"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 04:42:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1udouU-0000000HKQ9-3aWd;
	Mon, 21 Jul 2025 14:42:22 +0300
Date: Mon, 21 Jul 2025 14:42:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	George Abraham P <george.abraham.p@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of all the trees
Message-ID: <aH4nnsecLEqrCrpK@smile.fi.intel.com>
References: <20250721173754.42865913@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721173754.42865913@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 21, 2025 at 05:37:54PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging all the trees, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from drivers/crypto/intel/qat/qat_common/adf_pm_dbgfs_utils.c:4:
> include/linux/sprintf.h:11:54: error: unknown type name 'va_list'
>    11 | __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
>       |                                                      ^~~~~~~
> include/linux/sprintf.h:1:1: note: 'va_list' is defined in header '<stdarg.h>'; this is probably fixable by adding '#include <stdarg.h>'
>   +++ |+#include <stdarg.h>
>     1 | /* SPDX-License-Identifier: GPL-2.0 */
> include/linux/sprintf.h:13:71: error: unknown type name 'va_list'
>    13 | __printf(3, 0) int vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
>       |                                                                       ^~~~~~~
> include/linux/sprintf.h:13:71: note: 'va_list' is defined in header '<stdarg.h>'; this is probably fixable by adding '#include <stdarg.h>'
> include/linux/sprintf.h:15:72: error: unknown type name 'va_list'
>    15 | __printf(3, 0) int vscnprintf(char *buf, size_t size, const char *fmt, va_list args);
>       |                                                                        ^~~~~~~
> include/linux/sprintf.h:15:72: note: 'va_list' is defined in header '<stdarg.h>'; this is probably fixable by adding '#include <stdarg.h>'
> include/linux/sprintf.h:17:70: error: unknown type name 'va_list'
>    17 | __printf(2, 0) __malloc char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);
>       |                                                                      ^~~~~~~
> include/linux/sprintf.h:17:70: note: 'va_list' is defined in header '<stdarg.h>'; this is probably fixable by adding '#include <stdarg.h>'
> include/linux/sprintf.h:18:73: error: unknown type name 'va_list'
>    18 | __printf(2, 0) const char *kvasprintf_const(gfp_t gfp, const char *fmt, va_list args);
>       |                                                                         ^~~~~~~
> include/linux/sprintf.h:18:73: note: 'va_list' is defined in header '<stdarg.h>'; this is probably fixable by adding '#include <stdarg.h>'
> include/linux/sprintf.h:21:55: error: unknown type name 'va_list'
>    21 | __scanf(2, 0) int vsscanf(const char *, const char *, va_list);
>       |                                                       ^~~~~~~
> include/linux/sprintf.h:21:55: note: 'va_list' is defined in header '<stdarg.h>'; this is probably fixable by adding '#include <stdarg.h>'
> 
> I don't know what root caused this, but I have applied the following
> patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 21 Jul 2025 16:15:57 +1000
> Subject: [PATCH] sprintf.h requires stdarg.h
> 
> In file included from drivers/crypto/intel/qat/qat_common/adf_pm_dbgfs_utils.c:4:
> include/linux/sprintf.h:11:54: error: unknown type name 'va_list'
>    11 | __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
>       |                                                      ^~~~~~~
> include/linux/sprintf.h:1:1: note: 'va_list' is defined in header '<stdarg.h>'; this is probably fixable by adding '#include <stdarg.h>'
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/sprintf.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
> index 521bb2cd2648..f06f7b785091 100644
> --- a/include/linux/sprintf.h
> +++ b/include/linux/sprintf.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/compiler_attributes.h>
>  #include <linux/types.h>
> +#include <linux/stdarg.h>
>  
>  int num_to_str(char *buf, int size, unsigned long long num, unsigned int width);
>  
> -- 
> 2.50.1
> 
> Is there any good reason not to do this?
> 
> I guess this patch should have
> 
> Fixes: 39ced19b9e60 ("lib/vsprintf: split out sprintf() and friends")

This sounds correct to me and your patch should be sent as a fix to the stable
kernels as well.

> but that is not the immediate cause.  This has been exposed by the
> inclusion of a new file
> (drivers/crypto/intel/qat/qat_common/adf_pm_dbgfs_utils.c in commit
> 7c68005a4610 ("crypto: qat - relocate power management debugfs helper
> APIs").  Maybe every other use of sprintf.h also has (explicitly or
> implicitly) an include of stdarg.h - possibly via kernel.h.

It just a first who started using the header in the correct way without
proxying others.


-- 
With Best Regards,
Andy Shevchenko



