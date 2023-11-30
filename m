Return-Path: <linux-next+bounces-151-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143947FF8C9
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 18:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A4991C20BA9
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 17:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77856584C9;
	Thu, 30 Nov 2023 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bduPkwYP"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B27091
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 09:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701366533; x=1732902533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l8NwuQdBLg5jrHvxxoFUJ39IwEmz34Zh36YN1NuoI1U=;
  b=bduPkwYPHnvrVUKoAGjuwTpz5nBnXtZA8ijJx1i5FlZiqMc7/oqm4ZdL
   QXLS2oB24/CZMkq4lcmW5dy71NFuEaZ/udI7LQORBmBr1MdLEbB5S5Noy
   fdQRzxPkLSX/W4udToHW1Ru0sCWZ0l9AFCpLfQfwX1uQmYI5nrG8kEqX0
   yzHYLZQe8DbBp4k2Mo816VhDCT8EY8RpfbTvQWYxIyd58xrpyf/QM2Gel
   DOc7e+kgit4cenuAkTP3mE2yWv/TEODsUYLwLyxLHnP9PtA2tVxKFjkUE
   xM9ffw0eNWXYCs9vBHABFDSJeyA2a5gHM2Ij7d6w1x1TAwqPUWzuiUDOP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="459856860"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="459856860"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 09:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="803776657"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="803776657"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 09:48:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8l9a-00000000lvd-0bz4;
	Thu, 30 Nov 2023 19:48:46 +0200
Date: Thu, 30 Nov 2023 19:48:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Wenyu Huang <huangwenyu5@huawei.com>, pmladek@suse.com,
	rostedt@goodmis.org, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, akpm@linux-foundation.org,
	linux-next@vger.kernel.org, gustavoars@kernel.org
Subject: Re: [PATCH next] Fix the build failed caused by -Wstringop-overflow
Message-ID: <ZWjK_UX6skFwECNi@smile.fi.intel.com>
References: <20231130105741.2849670-1-huangwenyu5@huawei.com>
 <730544ae-1e7f-4622-b986-839f81e60384@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <730544ae-1e7f-4622-b986-839f81e60384@embeddedor.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 09:52:42AM -0600, Gustavo A. R. Silva wrote:
> On 11/30/23 04:57, Wenyu Huang wrote:

...

> > Fixes: 89741e7e42f6 ("Makefile: Enable -Wstringop-overflow globally")
> 
> The commit ID is from a patch that's currently in linux-next, which
> does not guarantee it's a stable commit. So, it shouldn't be used
> for any tag in any changelog text. In fact, it has changed a couple
> of times in the last couple of weeks.

I disagree on this in general.

The case in practice I have. I does something in new cycle that broke the
enumeration of some devices. The patch is in the maintainer's tree pending
for the next release (v6.8-rc1). There are I see two options:
- revert patch completely and redo it properly
- add a fix (which is one liner)

Now, what you are suggesting is to drop the Fixes tag on the grounds that
the culprit and the fix are to be in the same release (as we go let's say
with the latter approach). In case that the culprit will be backported
(let's say to satisfy dependencies, as per se it's not a fix), it will
bring a regression and become unnoticed for some time until first reports
will appear. Additional resources would be need for all this.

So, I'm fully in favour of using Fixes tag as it makes clear if we have
some broken changes in the kernel for which the fix is known and exists.


-- 
With Best Regards,
Andy Shevchenko



