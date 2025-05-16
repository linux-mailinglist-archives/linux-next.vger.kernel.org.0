Return-Path: <linux-next+bounces-6813-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278AAB996A
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 11:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C25D84E3186
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 09:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3C5231849;
	Fri, 16 May 2025 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/oHqzV5"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732E9230BF9;
	Fri, 16 May 2025 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389220; cv=none; b=nTMT7DfGW9qgv/1uoXQlVhOSiJ99CE4fDZ76elFWAxoB0lBkEb3BS9SzRPOMPnPlWMZMbFNyq+PNAdE0S3x3J6+24UBMX26WQVOL8kyhYeKaXGroSf3/EgfJ8YeXCUyJzVUxHNzpafKdNf6JgqBv/ZBBG5cmAByEwMMGTEUTi6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389220; c=relaxed/simple;
	bh=kP/eP9CyFOzd2cYwS1iAvjzqmb3Swb4YgY0fKvf6BG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqScr49Xe/BcM9JfQ4a6xhM6c3cdZ+rNZXq/DUQGwV0i3JUTGCgy8jEpo0OB4qU4cJ0vc82OzMPc/ln110UHKNUud6lwQPsJyzTdRAmY9qHVjiWH5pgeF3qZfz9IEv0WuY2LFHcSbiI1z5lf1azLm7EcFtzjwdAk0RLFrwmcSRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/oHqzV5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747389220; x=1778925220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kP/eP9CyFOzd2cYwS1iAvjzqmb3Swb4YgY0fKvf6BG4=;
  b=V/oHqzV52NKBVvlGTDMPTpZy62BP/eUJb3X6/PxI/qi/jyvHevHkO51i
   oamcrZkz5dDeZhnLF+xzo+Oiw0aJNJ4gsl3cFe/7CGkuYrAb3BAlSlngd
   QTxHGy7yzcEBCwzhBVO1qECriJvzumTrp4PddWbgWfJzn4PzVFjohk8dJ
   6VAvc25DDT2OBti6gp4LFrFvfXbkSovMODiRofgUjk1iJvEuZmQAHnY6a
   P4lsvXUcUo8Kjy0capTrKjBdUkomlz4CRpGHHTfQaX6s9NgbmbUvD8ZZU
   x9xi4Doi8TS5NMTR6eJz5IQK+RAwix+os9gW15/VYTlAYoZWjQCjaVngN
   Q==;
X-CSE-ConnectionGUID: YjI2E9wlT/OtQHt61wxyMA==
X-CSE-MsgGUID: q1Lj2t4fRu+ah4m7UMVUEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60744157"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60744157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:53:39 -0700
X-CSE-ConnectionGUID: vU9s/vPYSHaj3tH7jQvyTw==
X-CSE-MsgGUID: KhfnSGfJRCSRgwtVcV3uKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="161957707"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:53:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uFrl1-000000026UO-2Wef;
	Fri, 16 May 2025 12:53:35 +0300
Date: Fri, 16 May 2025 12:53:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the gpio-intel tree
Message-ID: <aCcLH25PSNqtPeSk@smile.fi.intel.com>
References: <20250516193436.09bdf8cc@canb.auug.org.au>
 <aCcHKK8FflYRhx2m@smile.fi.intel.com>
 <20250516194237.03371ba7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516194237.03371ba7@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 16, 2025 at 07:42:37PM +1000, Stephen Rothwell wrote:
> On Fri, 16 May 2025 12:36:40 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, May 16, 2025 at 07:34:36PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the gpio-intel tree, today's linux-next build (htmldocs)
> > > failed like this:
> > > 
> > > Error: Cannot open file /home/sfr/next/next/drivers/gpio/gpiolib-acpi.c
> > > 
> > > Caused by commit
> > > 
> > >   babb541af627 ("gpiolib: acpi: Move quirks to a separate file")
> > > 
> > > I have to run
> > > 
> > > make KERNELDOC=$(pwd)/scripts/kernel-doc.pl htmldocs
> > > 
> > > as the newer Python version dies without a useful error :-(  
> > 
> > Thanks for the report! And can you share the output of the above?

I have just sent 20250516095306.3417798-1-andriy.shevchenko@linux.intel.com, it
should fix the error here.

> This is already being discussed in another thread.
> 
> https://lore.kernel.org/all/20250508184839.656af8f6@canb.auug.org.au/



-- 
With Best Regards,
Andy Shevchenko



