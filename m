Return-Path: <linux-next+bounces-156-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A77FF90B
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 19:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08DCCB20E14
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 18:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DE5584CC;
	Thu, 30 Nov 2023 18:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+uekesK"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9AB197
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701367599; x=1732903599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AOKXH1OKRZNG3wTcHGw2nymr46dES7Rffs1WJxkxKJc=;
  b=P+uekesKUkNdXpn0IJLCnm015NQZWy7mM+zh1EmiQkk9187z1K9W2njL
   3jjtB7/KxB1r0ZdmORW2OuOKqZfLHLYcEtiSNQGv1nt5u4zWfN5qOUlG9
   pFvR/pwSrQuT0ix56JA/aG6n0bmQ4yLd4DGLPWNRrmGtZF/mJz3aPM5Ng
   4tlGB+Kxy6CNv88hWuApANmflfai7KrFYT6jCBxcTPGqVTNFMnEQabgkz
   JfCdYs4Ss37612fdK1azvY9ipeqWAMSCsHoR56NqNKzoUG/p82Nd2WPFq
   QzwUvVl0c63u/GPZuTtkwIX8Dtucc1Pik5opuee0gEQfOG9xKiKNChKVl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="397257023"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="397257023"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 10:06:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1101017534"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="1101017534"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 10:06:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8lQO-00000000m8p-2pCO;
	Thu, 30 Nov 2023 20:06:08 +0200
Date: Thu, 30 Nov 2023 20:06:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Wenyu Huang <huangwenyu5@huawei.com>, pmladek@suse.com,
	rostedt@goodmis.org, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, akpm@linux-foundation.org,
	linux-next@vger.kernel.org, gustavoars@kernel.org
Subject: Re: [PATCH next] Fix the build failed caused by -Wstringop-overflow
Message-ID: <ZWjPEFMwEsVMwqZq@smile.fi.intel.com>
References: <20231130105741.2849670-1-huangwenyu5@huawei.com>
 <730544ae-1e7f-4622-b986-839f81e60384@embeddedor.com>
 <ZWjK_UX6skFwECNi@smile.fi.intel.com>
 <ZWjLehXvSPGm_gre@smile.fi.intel.com>
 <c3167ae2-fd98-4e68-9112-cfdfbb34b87b@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3167ae2-fd98-4e68-9112-cfdfbb34b87b@embeddedor.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 12:04:28PM -0600, Gustavo A. R. Silva wrote:
> On 11/30/23 11:50, Andy Shevchenko wrote:
> > On Thu, Nov 30, 2023 at 07:48:46PM +0200, Andy Shevchenko wrote:
> > > On Thu, Nov 30, 2023 at 09:52:42AM -0600, Gustavo A. R. Silva wrote:
> > > > On 11/30/23 04:57, Wenyu Huang wrote:

...

> > On top of that, Fixes tag is not enough to get it to stable. See the rules
> > on how to submit a material to stable kernels, it's in the documentation.
> 
> We are talking about different things. I'm talking about commit IDs staying
> unchanged (stable commit IDs). That's different to stable kernels. :)

I see, but look at my answer to your previous email.

-- 
With Best Regards,
Andy Shevchenko



