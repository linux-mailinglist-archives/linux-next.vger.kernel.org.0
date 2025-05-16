Return-Path: <linux-next+bounces-6811-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB66FAB9903
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 11:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 053F21895329
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 09:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D721922FA;
	Fri, 16 May 2025 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gh3gtIqr"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377E121171C;
	Fri, 16 May 2025 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747388210; cv=none; b=Pgaut/QZYPnCj0RDVu4Z1GmREtAFQXV8pnnZnmcF7nqx4jWVjgnfaLoxaqdnZEqCu3yY1gzkD+X+fOMG6kWE8sybc3aXQSGBJceaT3joQPKO8ieVxcKOjDU6pJFduPFqg+dLb6BfVjbLxF3CX/T/A8DMKdFnwsEMRt187J5vslo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747388210; c=relaxed/simple;
	bh=MGlGGtGGLDQtfJysXvQBmUo346Zwfu/9IRxcnGAjiJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0sY0I6SGVXfIuR8aa+57fINwGMHwJKgd7TfS/dKfAb01olxK5F6k7y4/+0ey74AM9tA8VRKbZtRBEu49Nu82DkA4JagOT20/CxHCsMIw/9v6eg3mUowjVJn2WYJPDvXUJerGkKApdjFhj4e3im10Pt45r5kpahW7ZnhtCt6Cbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gh3gtIqr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747388208; x=1778924208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGlGGtGGLDQtfJysXvQBmUo346Zwfu/9IRxcnGAjiJg=;
  b=Gh3gtIqrwBQqE/21KY8h8HM2/n5wk+LsIwxVQNlSORV2MCdI7STOfaK5
   qdjtEqJJ4i2Kzt4Oh8EudZafQL02a0Ebl5/ISeq6ftP5aOGaS55tr2ZG5
   z+fubjcij/uNgg8u2NRyapTosQatWYqWoDQSVsfy94/1k/mfruNSNIBhi
   jbjtuQP3FFe73fbvgvm5hAuTbGLAlqN5dI27exklKlO1owxWmBbEgfRox
   6Fs4z80OJ5QTEu3l11I+yKQ8FBS31NUgEiIitt6j8AUfH6k3IfxYZ7jHE
   07DZwiJWz43dDYDVF+9mOtzxpFycrJXDp7kyGlqmuXVWPqqCmGCDibLu0
   w==;
X-CSE-ConnectionGUID: QXy6CZLVQROgvjUW34GRmw==
X-CSE-MsgGUID: 5a2qZx6uTvm8QX36wJ4l7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49049967"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49049967"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:36:43 -0700
X-CSE-ConnectionGUID: yd4VvbKWSEOLHyENQ02l2Q==
X-CSE-MsgGUID: ZJNIFkHMT6K5AshbAGluPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="142649170"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 02:36:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uFrUe-000000026Ec-10Fk;
	Fri, 16 May 2025 12:36:40 +0300
Date: Fri, 16 May 2025 12:36:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the gpio-intel tree
Message-ID: <aCcHKK8FflYRhx2m@smile.fi.intel.com>
References: <20250516193436.09bdf8cc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516193436.09bdf8cc@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 16, 2025 at 07:34:36PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the gpio-intel tree, today's linux-next build (htmldocs)
> failed like this:
> 
> Error: Cannot open file /home/sfr/next/next/drivers/gpio/gpiolib-acpi.c
> 
> Caused by commit
> 
>   babb541af627 ("gpiolib: acpi: Move quirks to a separate file")
> 
> I have to run
> 
> make KERNELDOC=$(pwd)/scripts/kernel-doc.pl htmldocs
> 
> as the newer Python version dies without a useful error :-(

Thanks for the report! And can you share the output of the above?

-- 
With Best Regards,
Andy Shevchenko



