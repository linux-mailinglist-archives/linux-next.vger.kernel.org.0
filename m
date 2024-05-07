Return-Path: <linux-next+bounces-2205-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4178BE357
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 15:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87918B25A8B
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 13:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D5715DBDD;
	Tue,  7 May 2024 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMwiN8zW"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F4315ECC5;
	Tue,  7 May 2024 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087805; cv=none; b=VjAiVCYxGN/ozalbmH4W1qzYzsy94r0BE/VVfx2nOb/yQvzgkDuDmE7kex/Ma+zjPQ/uXo+KZJ5/O1THYJEPCqfxooTRzY2Fl990zMQaVLtZnICkfNeXqshCFE1N8/N4uKne41c1XaD+qNgSO2iebdCEclBwO4JWhlIXl/TEQTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087805; c=relaxed/simple;
	bh=K/U0G9gpx8mauQWXnOuTKTaHfAt5+jcP218gGZB+Otc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hoc2TGUtGu0SB1rgHYefD6jrWFiUltTfrGA71Nc/tqU1iudtPZBozJDNbWu73a5ztSo9WXvuwISi7oECGI5szj0L5KKp2VqNfn+qZqO3ZDZzxPHguMyQb3Mn4UVDhTyWJpkznmU7CF1gjU30ZKgXwOHExpyGRLKmUbW89Jl2KDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMwiN8zW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715087805; x=1746623805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K/U0G9gpx8mauQWXnOuTKTaHfAt5+jcP218gGZB+Otc=;
  b=fMwiN8zW/BntVK7biy2AkmmHVfkjmVzhDu1+Wb8xZU71ZSNXuq+QX7qc
   b9U5EWrz0n1RKD87h9dJo2t7Z0tgrdmFsSTzoRAKppgwvxRmD1XxdorG/
   cTVLixtT/hlX8p/QoWWjUvMGzsW0y5YaeXffuWpCUL60C8b9baeP8PKqX
   O/5LRuX1zOVB0We9RBOATO7wIGvG9ICZGDjDmHfx85hsK+Mqa+y5XRp5l
   AI08mFm7EoA+S4ueVFgESFulLgatzN7BI4yPNrSZJKJujByqPq42VxRYr
   bWgMjMDCvtKWDT/XaKqjgSvTeYwNQW+ZRStNqhvuqkE7XRuFlk3r2KIHZ
   g==;
X-CSE-ConnectionGUID: 0Pepvnt3RNmqDS2ipnOyvQ==
X-CSE-MsgGUID: eNS5pdylT667z646zZGzZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10814612"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="10814612"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 06:16:44 -0700
X-CSE-ConnectionGUID: Fu2wNBcERv2y9Qs1pXcn1w==
X-CSE-MsgGUID: Y4vJq8tXTD6qjD+McfIEEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="28601845"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 06:16:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s4KgR-000000052iy-3iRL;
	Tue, 07 May 2024 16:16:39 +0300
Date: Tue, 7 May 2024 16:16:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the spi tree
Message-ID: <Zjopt_BSR4HAbArn@smile.fi.intel.com>
References: <20240507163131.183813ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507163131.183813ee@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 07, 2024 at 04:31:31PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the spi tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/spi/index.rst:7: WARNING: toctree contains reference to nonexisting document 'spi/pxa2xx'
> 
> Introduced by commit
> 
>   2d069c11e822 ("spi: pxa2xx: Remove outdated documentation")

Oh, good catch! I will send a fix soon.

-- 
With Best Regards,
Andy Shevchenko



