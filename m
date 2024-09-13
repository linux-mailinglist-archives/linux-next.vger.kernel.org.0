Return-Path: <linux-next+bounces-3825-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ADA977C85
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 11:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F5D31F28909
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 09:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1A51B9853;
	Fri, 13 Sep 2024 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nakq5lNk"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3DA1BC9E0;
	Fri, 13 Sep 2024 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726220793; cv=none; b=PvIvRe0e6FfaAGOY6MjqrlVYMeX1P+y9QaPH1PHdpXv5fTceegHX/oDy/PAkCqRLG4d1q+bKJH+ooK3PLvCbr3wbm6rrCIHNBaila2hFq9Zdib326xOsXOoaVlQVkMMEBsfrtpAgh+/TKNOy/dILmzxmOHU4KMkIE/bw6LgBEMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726220793; c=relaxed/simple;
	bh=BT6BwnWKIIo6f5KGZ9sOvCPyOrcdsUj54Uor+njpwy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuxp8zS565xWefK4zAy9K8eVBurMXkA82dK+wPEQMnSbRmKQU5/OsvTCsXM+DY5TmreXhtZKTChUixGRJSNVd6XdAn8GsVT57168aegVSRK6IOFgp7z3+qLgu6kVzz/kbOq+35oitB83/KnwPbm0XOV83xjFmanpKp8Ieke2m0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nakq5lNk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726220792; x=1757756792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BT6BwnWKIIo6f5KGZ9sOvCPyOrcdsUj54Uor+njpwy4=;
  b=Nakq5lNkXNu2CtZ/HV79dBsj2qoNACasyyjNuFMlqsOAx6GOLL42F/JU
   47MYl5Y+mMj3nZ83QoxEt5C3BQq/v4wH732DWhP7vhHBCNgWINc34nYVG
   kGFdaAMGcyucD+lUJwA+h+8pbtKk4RS5TEPfoJJnji9rCoXFcK5BJjCak
   FQc7gRrO75WJo+juPJp+DZgRAiBycDchvvy5q6TELueQaMRB+6HZnYOFp
   p8jUe4GuR+7F/f1TpcpQ0nyRydfZRVvJAiaVkeHYb4BiBDcB7/F6t4+GA
   MBebvXfJ+Xrqmy8VkILn6S+2JHa6A8AKXbqKQvJiY8JXea8Duby8yhOMY
   g==;
X-CSE-ConnectionGUID: nbVTXvomR+eOp66tTURE4Q==
X-CSE-MsgGUID: kZa7Ubz2SOys/5CRpZzfdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="42623337"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="42623337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 02:46:30 -0700
X-CSE-ConnectionGUID: ye8B9dbuTv2TLSkeGLljIg==
X-CSE-MsgGUID: g6rVSLVMSFS0WnLd04QiNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72803170"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 02:46:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp2sj-00000008FRk-142M;
	Fri, 13 Sep 2024 12:46:25 +0300
Date: Fri, 13 Sep 2024 12:46:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Olof Johansson <olof@lixom.net>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-next <linux-next@vger.kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the arm-soc
 tree
Message-ID: <ZuQJ8aGqrF_eMVEH@smile.fi.intel.com>
References: <20240912174842.57a43921@canb.auug.org.au>
 <a124f713-8cbb-46d3-850c-1dd1b9010258@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a124f713-8cbb-46d3-850c-1dd1b9010258@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 12, 2024 at 12:10:38PM +0000, Arnd Bergmann wrote:
> On Thu, Sep 12, 2024, at 07:48, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the gpio-brgl tree got a conflict in:
> >
> >   arch/arm/mach-ep93xx/vision_ep9307.c
> >
> > between commit:
> >
> >   3e0bae7f35c9 ("ARM: ep93xx: delete all boardfiles")
> >
> > from the arm-soc tree and commits:
> >
> >   4b2b0a2ce815 ("gpiolib: legacy: Kill GPIOF_INIT_* definitions")
> >   8c045ca534d0 ("gpiolib: legacy: Kill GPIOF_DIR_* definitions")
> >
> > from the gpio-brgl tree.
> >
> > I fixed it up (I removed the file)
> 
> Looks good, thanks,

Confirmed from my side, thanks.

-- 
With Best Regards,
Andy Shevchenko



