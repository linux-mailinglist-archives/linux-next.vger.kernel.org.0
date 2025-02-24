Return-Path: <linux-next+bounces-5552-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF4AA41B12
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 11:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 556EA7A6BF0
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 10:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D460B33993;
	Mon, 24 Feb 2025 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfK0rfZX"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24872253341;
	Mon, 24 Feb 2025 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740393008; cv=none; b=p6csTGaA3qEBC/VSBR9fihGlqOY8pHBtK3raB9vIl+oRjFLvgCwN97TiNgvH9cKDxcpgWbQ9bYVOn824fIuVuyfr6em5LPcSEWVe8mkpUwdvl/rVcpavhbnHUICDC/02F/gqRP4ErY8iQjm4aONki3b2GkkkzZ1Ll/rHNPHSwd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740393008; c=relaxed/simple;
	bh=8E4Zy6aJ7KWO5ZlimbfbI/RzaVKad0mBhvsftSpguGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xkv7uMpHPSMQBDSMgMJKUjPxKwjf/L+/MjneK3TxTnmLsrsZinNvhkBHhBt7jGUCnd3Iq8abwcA0A35hgDcIJunFPU6TluspuW1hl5xFAFjNiTYerWlvEzzss1V8Cf+iVE7wOIvu4AjNahN+t35Jag0i00PkIwwZLITbGNeRfLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfK0rfZX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740393007; x=1771929007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8E4Zy6aJ7KWO5ZlimbfbI/RzaVKad0mBhvsftSpguGA=;
  b=jfK0rfZX0MCEWxX2xp23XrQv63ABP0PM2ulYfntcSE8yqB+VzH4+9qiN
   CRHBkWpc30Tf2plEnWlEJ0JD9PvAwa/TgoE+zutN75uQkH1Wq/5JLI8kQ
   XzM29GMHcmgJA48SrzjZxLmWP3aHoAWp0cKmRtBZGKfM49AbDJta51++j
   /9slRoxH8QiOcL/4PgdXOuC5N7V7T1sick4OGuhU/3jgRpz4RX6jNYN1R
   hCmcDBCHay3M/8Bfe611CSTa36ErWLy/tV8rPr8o/SbcUXvTeV/OOHQcx
   XYuDoEYc0pr2cFQzy5Arid2dwY7GqjFEitkKBSxQSL9shyDySFMpnjjb+
   Q==;
X-CSE-ConnectionGUID: KBqOqB91SuacFtsKWHRs9A==
X-CSE-MsgGUID: amEZXsPGQm6pU1gNaqONPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41404251"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41404251"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:30:05 -0800
X-CSE-ConnectionGUID: hGm99oJEQbyO8Ft/BxGiFw==
X-CSE-MsgGUID: KUQpbSOSTyGRUlzt+0ccYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116039257"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:30:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmVis-0000000EfJo-0NIl;
	Mon, 24 Feb 2025 12:30:02 +0200
Date: Mon, 24 Feb 2025 12:30:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sebastian Reichel <sre@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the gpio-intel
 tree
Message-ID: <Z7xKKW-GrD6rEpYP@smile.fi.intel.com>
References: <20250224083406.6174f821@canb.auug.org.au>
 <Z7xDmddu6TZHNAFu@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7xDmddu6TZHNAFu@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 24, 2025 at 12:02:01PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 24, 2025 at 08:34:06AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commits
> > 
> >   b16e9f8547a3 ("input: ipaq-micro-keys: use devm_kmemdup_array()")
> >   67b12cda28e1 ("input: sparse-keymap: use devm_kmemdup_array()")
> >   5f95e8d0be63 ("iio: adc: xilinx-xadc-core: use devm_kmemdup_array()")
> >   18c4aec76056 ("pinctrl: pxa2xx: use devm_kmemdup_array()")
> >   d7f6555aec79 ("pinctrl: tangier: use devm_kmemdup_array()")
> >   6e1bba1140a9 ("pinctrl: cherryview: use devm_kmemdup_array()")
> >   af946f612dfe ("pinctrl: baytrail: copy communities using devm_kmemdup_array()")
> >   85ab35bae5ac ("pinctrl: intel: copy communities using devm_kmemdup_array()")
> >   4c176c256dd9 ("devres: Introduce devm_kmemdup_array()")
> >   d7a76a31c46e ("err.h: move IOMEM_ERR_PTR() to err.h")
> > 
> > are missing a Signed-off-by from their committer.
> 
> Thanks for the report!
> 
> But I dunno how to fix it now since it's most likely have been taken to some
> other repos before battery.
> 
> I can issue another tag with that being addressed, nevertheless.

Done as https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com.

> > Also, these have been merged into the battery tree.

-- 
With Best Regards,
Andy Shevchenko



