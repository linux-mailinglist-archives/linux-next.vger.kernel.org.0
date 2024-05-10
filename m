Return-Path: <linux-next+bounces-2268-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 654548C275B
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 17:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 971521C22076
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 15:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18444168AFC;
	Fri, 10 May 2024 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJE88Yu+"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CC12C461;
	Fri, 10 May 2024 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715353717; cv=none; b=iFzsUCZXCmvVgNuMzjwIyE/ba2a31hEO1phP/ugH0axPQn1UI2aEeCyUIda4O9Gf9nHC7lSNWwEgsYc6x5EgNg5DIUltr4zYnpW673uA89Lk2rhbMLclKbDENUpIfEW8fChr3eurCg93ZgY7MZ66fGkdlQGdSvixP46P1t/MlhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715353717; c=relaxed/simple;
	bh=/lJNxijefJ/utW/c1qkfBk8egXnkRoHiD+hGQWtMKi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXZsi1XTBI07jYM4fdPGWwH5Pbj45mCzQkZBkHBWf8efgaiTgUuQlOs58mwEMZcPdcgTMqmJOZsotIG0UYq2NB/YgmgJSieGUHFDGqU1aJFMJDrVyb4/ouBm6BiEunT8GGtNDeuCF3qyZv2rSeoPmeuTYeR//lH0e+JmTpxNUbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJE88Yu+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715353715; x=1746889715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/lJNxijefJ/utW/c1qkfBk8egXnkRoHiD+hGQWtMKi0=;
  b=HJE88Yu+GQcgtbJSxt6icceHGJhHO3rrKCGdximUSeUBcqPi0yGJMHca
   JEHgtJkZUyL9mKSQinQsE7pPeRdzakEMCpTit0769CeDJYJuJt9LPYFjS
   PrJuMr1jkouPz8YbEiKWTVKLU1XnicXNe/Tz2IfzS7VffJBWZ5ltX6lR5
   UEXotnPZm8XED2TTbRi3rBH9d3pvejOIAOZZ5g2VxFdAzLw27c/5aA+G9
   foQW+IClFS0+Pf5vPCy5q7PA3IjGWr+6NZCmXkMCh7JowkZBFUR14iGuB
   TRfb8ATMpNLxTysDbfFaEQChCWWJ5JSrIAjQyIiy5/pVY7Ed5wa39iHq0
   w==;
X-CSE-ConnectionGUID: rlJH3kONQb2EhhVCzlBmxA==
X-CSE-MsgGUID: bFlHVRgaRn6H/gU8OmTyEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11465773"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11465773"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:08:35 -0700
X-CSE-ConnectionGUID: NThJguWNTcG2TAIhx/OkQw==
X-CSE-MsgGUID: gkPfs8l1RO+MJ8WG84blCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34517822"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:08:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5RrL-000000068gN-09s0;
	Fri, 10 May 2024 18:08:31 +0300
Date: Fri, 10 May 2024 18:08:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <Zj44bgNE5Fav2Qfv@smile.fi.intel.com>
References: <20240510153212.246fbf31@canb.auug.org.au>
 <CACMJSev6EDeLdQ0e7A7f6AMhh08FznA67x5ONG+vSseC5QLt6A@mail.gmail.com>
 <20240510170827.2b655636@canb.auug.org.au>
 <20240510171049.2e0e3c56@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510171049.2e0e3c56@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 05:10:49PM +1000, Stephen Rothwell wrote:
> On Fri, 10 May 2024 17:08:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > On Fri, 10 May 2024 08:33:37 +0200 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> wrote:
> > >
> > > Thanks! I will send the fixes upstream today and then pull v6.9 into
> > > my tree before the merge window PR to fix this conflict.  
> > 
> > Or you could just merge your for-current branch into your for-next
> > branch and avoid possible issues with all the rest of v6.9 ...
> 
> Or, since it is a pretty simple conflict, just do not merge and just
> mention the conflict to Linus in your merge window PR.

I also would go the latest suggestion.

-- 
With Best Regards,
Andy Shevchenko



