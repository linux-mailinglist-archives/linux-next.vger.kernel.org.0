Return-Path: <linux-next+bounces-5550-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B9A41A3B
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 11:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 225D2177995
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 10:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0566250BE7;
	Mon, 24 Feb 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2WPk2Sg"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5660D2F3B;
	Mon, 24 Feb 2025 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391330; cv=none; b=ZFC2HGQXx0VAfi6NAddbgujUtpt73yDg9sRDzYsnbZBZ7bLmdV27ulF6dUERhZRSFpMErlIcT+x1OCr7pEUZsPJsDOpC/HrDn5VmnFcsXmNLbLXIklD5n1z0jfmrlzPqDmO+jgzdZsE1o1xOKeKKdAUYKsxCPSa+D+xx5PdIq5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391330; c=relaxed/simple;
	bh=+z8XfJcexfKhI0cgpuZtTAoXymKaOc7Hk9T70kRAtA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbRiLaTQS3xeLJY3nFEkDzjUM29PV1v70mrJs/Pj1lzH8/gvXvOeMtXLefKZKv9hoHlHYcKkj8TWc/6abBtxSpXaTO3gUhBHFe2aBlsHH67j96zJ8PJUtc+IC9OCVQyxfxqbo2J30ebGgRALmkgUk/FMU7rSR+2+XXm0cZyUlfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2WPk2Sg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740391330; x=1771927330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+z8XfJcexfKhI0cgpuZtTAoXymKaOc7Hk9T70kRAtA0=;
  b=c2WPk2SgQNd/I3lQFws0y+Iu/ffarJZTewaJLnhrlq+MFsB8NtN5egAe
   /4hmfqaQ2EjndHJcO9TXPl2wdMAWreG6TyFPFU3ZZuqHxgRESgWJa28gL
   Sc0R79AXJBOuv1By8R7LcdqRYVle6PIFV7HI4ApLD51ExvGleHFpe/iOZ
   pWj0IMy3qWg/NpyRdgvHBZ7qxjvhHnBQryussFMY5ibdcu/lIWiXvrU3x
   kFKLxmrIQLwj5oSLET3v6Vc7IFenhrdvVI/lvfLek87yhcrvojD5vKduq
   02Ox7aNdxG3uLCmWPGjvithBvD9lIDDp2/hmeaPicNR1ndOx+uEv3bhLf
   w==;
X-CSE-ConnectionGUID: 1oM2vNJtTXSOLfmrZ/tQpQ==
X-CSE-MsgGUID: 9P7JVhQBQ3KSSKnuEGATzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52565316"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52565316"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:02:05 -0800
X-CSE-ConnectionGUID: Mx9DxBApTCyhjv8S1tc6Gg==
X-CSE-MsgGUID: J2QR8s9NST+/p0ppvPniqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116649514"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:02:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmVHl-0000000Eety-1wwk;
	Mon, 24 Feb 2025 12:02:01 +0200
Date: Mon, 24 Feb 2025 12:02:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sebastian Reichel <sre@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the gpio-intel
 tree
Message-ID: <Z7xDmddu6TZHNAFu@smile.fi.intel.com>
References: <20250224083406.6174f821@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224083406.6174f821@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 24, 2025 at 08:34:06AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   b16e9f8547a3 ("input: ipaq-micro-keys: use devm_kmemdup_array()")
>   67b12cda28e1 ("input: sparse-keymap: use devm_kmemdup_array()")
>   5f95e8d0be63 ("iio: adc: xilinx-xadc-core: use devm_kmemdup_array()")
>   18c4aec76056 ("pinctrl: pxa2xx: use devm_kmemdup_array()")
>   d7f6555aec79 ("pinctrl: tangier: use devm_kmemdup_array()")
>   6e1bba1140a9 ("pinctrl: cherryview: use devm_kmemdup_array()")
>   af946f612dfe ("pinctrl: baytrail: copy communities using devm_kmemdup_array()")
>   85ab35bae5ac ("pinctrl: intel: copy communities using devm_kmemdup_array()")
>   4c176c256dd9 ("devres: Introduce devm_kmemdup_array()")
>   d7a76a31c46e ("err.h: move IOMEM_ERR_PTR() to err.h")
> 
> are missing a Signed-off-by from their committer.

Thanks for the report!

But I dunno how to fix it now since it's most likely have been taken to some
other repos before battery.

I can issue another tag with that being addressed, nevertheless.

> Also, these have been merged into the battery tree.

-- 
With Best Regards,
Andy Shevchenko



