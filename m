Return-Path: <linux-next+bounces-7571-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22366B071BE
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 11:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71A8D580ABB
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 09:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C062C1580;
	Wed, 16 Jul 2025 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hux4SLkM"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2357253356;
	Wed, 16 Jul 2025 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658441; cv=none; b=pju08R5PiGjc4x2fOzv9EsTNfvk4GhANmrubQTezN3gdfrYZHSl1g6OLZhpwbzcDVWriaYZBC/lwcITkmsgjdaoNHOSHRduHIrhSmyHW7h7qBXjTaD5b5bh2iiLjSxRN0pM7yNKFAbtIMYVOMSXfMAqNCANHWqny2/dvgMfoglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658441; c=relaxed/simple;
	bh=cHEfhWFXrCybHnY54wFHNIDzIVXMALti3G4z6Ampkx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa8tYX7fH4/89BHigRWOaLonChW5Vt2YWHaiJja7ysrY6YY47UZhF9gSjR1D0UDoZfAziqqipsUU9gy6Je7Zb8Tu7gpJJ3HPBYgyrRoXUE30nZf6J9o6arurCmKPZ2Qrj1CcuDGvUdoHFOVy2aZuBayPwes40uOcbP+FVpIxmgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hux4SLkM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752658440; x=1784194440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cHEfhWFXrCybHnY54wFHNIDzIVXMALti3G4z6Ampkx4=;
  b=Hux4SLkMt39Qu6MBoQUCgEWyFikTjHGsXP0uJ8Z1OIcykrmu+v29yVk/
   vck/Q1raZuTzPzGxyqpjHmoYnvYQgnO7r/sTi+/xKhz6tML+JJcx/kSdE
   wBCqy1C284bp8XZn57r+EPNQtZmlpln4+J54bqIURijc3bAiDYbV9JfCw
   X8+DQvgG94S9nNUkFj5FpukAeD9EljN7TzNx6M6u6WN77yGrCH7mw068k
   +xiG2wpZK1VXk1FoIdJv9qGlGsiTwMM/EEVjyWh3jM2GgtQx0gV2kX2jo
   X23HveKBdUvyGYpJ80vCEmxqI1hKOJCmTsDWUMIla0YGQMbS9xswcSjvJ
   g==;
X-CSE-ConnectionGUID: ETTONqHqS1SeSqMHRiXdxQ==
X-CSE-MsgGUID: ANUpcb+DTsSALceBPUb51g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="77427916"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="77427916"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 02:33:59 -0700
X-CSE-ConnectionGUID: m4U72yvrQR2K5QYw9WxicQ==
X-CSE-MsgGUID: +SA32eI3TFmM0uncvx428w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="161479108"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 02:33:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubyWQ-0000000FtoD-2doD;
	Wed, 16 Jul 2025 12:33:54 +0300
Date: Wed, 16 Jul 2025 12:33:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-serial@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Subject: Re: linux-next: Tree for Jul 15
 (drivers/tty/serial/8250/8250_ce4100.c)
Message-ID: <aHdyAm8tA64YSdOt@smile.fi.intel.com>
References: <20250715204504.36f41a8e@canb.auug.org.au>
 <cdf4ee46-7bf8-4379-9245-fed9db72e7e8@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdf4ee46-7bf8-4379-9245-fed9db72e7e8@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 15, 2025 at 06:42:52PM -0700, Randy Dunlap wrote:
> On 7/15/25 3:45 AM, Stephen Rothwell wrote:
> > 
> > Changes since 20250714:
> 
> on i386, when
> CONFIG_X86_INTEL_CE=y
> # CONFIG_SERIAL_8250 is not set
> 
> ../drivers/tty/serial/8250/8250_ce4100.c:90:13: error: redefinition of 'sdv_serial_fixup'
>    90 | void __init sdv_serial_fixup(void)
>       |             ^~~~~~~~~~~~~~~~
> In file included from ../drivers/tty/serial/8250/8250_ce4100.c:12:
> ../arch/x86/include/asm/ce4100.h:10:20: note: previous definition of 'sdv_serial_fixup' with type 'void(void)'
>    10 | static inline void sdv_serial_fixup(void) {};
>       |                    ^~~~~~~~~~~~~~~~

Indeed, thanks.
I'll make a fix ASAP.

-- 
With Best Regards,
Andy Shevchenko



