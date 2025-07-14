Return-Path: <linux-next+bounces-7516-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BDEB03931
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 10:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2C261885D4E
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 08:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4379C23C4ED;
	Mon, 14 Jul 2025 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idyAmteb"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951CD23BCFF;
	Mon, 14 Jul 2025 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481108; cv=none; b=K0BzU/LvSskrvF1eloBS+u/X7zTdtXE1JLp91L46ASpqXTUhQYBeu8jo4j8QOwIlTf9BVAJp4Dgdnoyu6sfJ1j3RTwIh3ltWTMksXMb5PzFEFtubDrgmrQq/GzIiNc9ZFk5j1LSC1USP0stwsaR+qgoLbhWi05KdySLhw7wXCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481108; c=relaxed/simple;
	bh=DVzvCAS4WBOQ6fEg68/wYsIXVIbEcIe+ED6be7UMb3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kpbhxs/ZuACr9V8mH188m0nvFKb35ptxbbk/+TMBAHj88SHBB0J6SvqAZS2/zYKAuS8IeLigdNeN1Ta5NXftS/kqoXXWUmvFbzZhsBGBUwMJeSy2TcPv+1sZBbM8ziEwTOgACQA5M+dQE4Rn/katktJT4QpX2qHDx2kwkENDbJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idyAmteb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752481107; x=1784017107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DVzvCAS4WBOQ6fEg68/wYsIXVIbEcIe+ED6be7UMb3M=;
  b=idyAmtebe0FC7W3+Mnt0qQVHd6xyNG8SumTKQ68Pug/1RT1WooFT7Yir
   J/tCSOExJcBuknLlCZ5ZPolbxER5nZGaFqLTRnAwiFu+AKjjB/B5JP2s9
   FWCUfnHKe97vWInLhHOuWrNSrz0ySbZF1zKEETj7m+epFX4LcQgrN7uqG
   vXvcxFTsQoPIJ0z4l7x6RqVDQ4cWgAlfEmC+rQEUOQ6y7PuaF5b3+S88H
   iqWGM//OpjPfdUWAdl9SGT1uGem0IALS4dJknobtR2BKuTayq5esEBG0P
   he8eAEpZh36ZCuBhLT/i+ZbsdBv+ZGIXHgqcXNFNoW+SesjKrWrR871kh
   A==;
X-CSE-ConnectionGUID: ytUgjNJBQ+SHhn9HOUPuBA==
X-CSE-MsgGUID: MPe1KEymTVmSIIMovPk7fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54755840"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="54755840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:18:26 -0700
X-CSE-ConnectionGUID: o3UBGPzPTHS/KHyUIrLLgA==
X-CSE-MsgGUID: CXZhNxglS8GZNstwLhsaLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="180553789"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:18:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ubEOD-0000000FIvl-2WUm;
	Mon, 14 Jul 2025 11:18:21 +0300
Date: Mon, 14 Jul 2025 11:18:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the iio tree
Message-ID: <aHS9TZWsKThHilpQ@smile.fi.intel.com>
References: <20250714181341.1d10df2a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714181341.1d10df2a@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 14, 2025 at 06:13:41PM +1000, Stephen Rothwell wrote:
> 
> After merging the iio tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> Documentation/iio/adxl313.rst:230: ERROR: Error in "code-block" directive:
> maximum 1 argument(s) allowed, 11 supplied.
> 
> .. code-block:: bash

+ blank line here should fix it I think.
Same for the rest.

>         root:/sys/bus/iio/devices/iio:device0> echo 1.28125 > ./events/in_accel_mag_rising_value
>         root:/sys/bus/iio/devices/iio:device0> echo 1 > ./events/in_accel_x\|y\|z_mag_rising_en
> 
>         root:/sys/bus/iio/devices/iio:device0> iio_event_monitor adxl313
>         Found IIO device with name adxl313 with device number 0
>         <only while moving the sensor>
>         Event: time: 1748795762298351281, type: accel(x|y|z), channel: 0, evtype: mag, direction: rising
>         Event: time: 1748795762302653704, type: accel(x|y|z), channel: 0, evtype: mag, direction: rising
>         Event: time: 1748795762304340726, type: accel(x|y|z), channel: 0, evtype: mag, direction: rising

-- 
With Best Regards,
Andy Shevchenko



