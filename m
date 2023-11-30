Return-Path: <linux-next+bounces-155-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B687FF907
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 19:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A153B20DEF
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 18:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EFF58103;
	Thu, 30 Nov 2023 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jg/CBQzp"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33C61A4
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 10:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701367525; x=1732903525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=optsMxmBjwkmXGGOipLNa/DLaoRqv8jHCmq7VBXyo0U=;
  b=Jg/CBQzpipq1jh6pTT8XaRDM+6e24Kig928yGS6/ItXMKpRqWe5zPe8r
   bwtH56+v3Q/njHfWWE8JIUzXMG5Kv4SCYoNTeMHzOwZIrHoWEMtwOegxa
   S/5Ktp5blC1/nMwDw4aNUVT9kFNao40BSqVB2GCx5H+3z32mqoXviDrV7
   67piT9DnLC2pb/20j/NLjAQWPslA/Qa6cqaVFrEtBOzJ2GmMDZwSRBXEF
   cYzYNVtCs2okpgyPS6MuEKZNOitKfQ9su1VDk0a3gKPyoAKf0tNO63EmX
   6R7lsvOvQChVBFchtxqVdL4HxgO+mXyk5dEwE6JQFQWiiZ/QlJrP1U+aQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="359093"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="359093"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 10:05:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="839887303"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="839887303"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 10:05:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8lPa-00000000m85-1S8s;
	Thu, 30 Nov 2023 20:05:18 +0200
Date: Thu, 30 Nov 2023 20:05:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Wenyu Huang <huangwenyu5@huawei.com>, pmladek@suse.com,
	rostedt@goodmis.org, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, akpm@linux-foundation.org,
	linux-next@vger.kernel.org, gustavoars@kernel.org
Subject: Re: [PATCH next] Fix the build failed caused by -Wstringop-overflow
Message-ID: <ZWjO3dAJonO05JYI@smile.fi.intel.com>
References: <20231130105741.2849670-1-huangwenyu5@huawei.com>
 <730544ae-1e7f-4622-b986-839f81e60384@embeddedor.com>
 <ZWjK_UX6skFwECNi@smile.fi.intel.com>
 <508507b2-be1d-403a-876e-f49f5d0a2a49@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <508507b2-be1d-403a-876e-f49f5d0a2a49@embeddedor.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 11:56:29AM -0600, Gustavo A. R. Silva wrote:
> On 11/30/23 11:48, Andy Shevchenko wrote:
> > On Thu, Nov 30, 2023 at 09:52:42AM -0600, Gustavo A. R. Silva wrote:
> > > On 11/30/23 04:57, Wenyu Huang wrote:

...

> > > > Fixes: 89741e7e42f6 ("Makefile: Enable -Wstringop-overflow globally")
> > > 
> > > The commit ID is from a patch that's currently in linux-next, which
> > > does not guarantee it's a stable commit. So, it shouldn't be used
> > > for any tag in any changelog text. In fact, it has changed a couple
> > > of times in the last couple of weeks.
> > 
> > I disagree on this in general.
> > 
> > The case in practice I have. I does something in new cycle that broke the
> > enumeration of some devices. The patch is in the maintainer's tree pending
> > for the next release (v6.8-rc1). There are I see two options:
> > - revert patch completely and redo it properly
> > - add a fix (which is one liner)
> > 
> > Now, what you are suggesting is to drop the Fixes tag on the grounds that
> > the culprit and the fix are to be in the same release (as we go let's say
> > with the latter approach). In case that the culprit will be backported
> > (let's say to satisfy dependencies, as per se it's not a fix), it will
> > bring a regression and become unnoticed for some time until first reports
> > will appear. Additional resources would be need for all this.
> > 
> > So, I'm fully in favour of using Fixes tag as it makes clear if we have
> > some broken changes in the kernel for which the fix is known and exists.
> 
> I'm fully in favor, as well. :)
> 
> I'm talking about patches in linux-next, exclusively.

And I am. And I think it's a good practice independently on the Linux Next
case. The only what you should think about is that the maintainer has to
take care about proper commit ID in case they rebase their tree (spoiler:
they shouldn't in 99.99% of cases).

My "in general" was to make sure we are on the page not specifically related
to _this_ patch.

-- 
With Best Regards,
Andy Shevchenko



