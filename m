Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A3429EA06
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 12:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgJ2LHU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Oct 2020 07:07:20 -0400
Received: from mga11.intel.com ([192.55.52.93]:63758 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726829AbgJ2LHT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Oct 2020 07:07:19 -0400
IronPort-SDR: sYl/l+XEocFQQlLpqNjeQkPyGesGG6V0X0TjKvAYbT0qlTjkpFAPDjI+9u0GTHkVXqcF1OutBD
 HQCju5pX1Mtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="164914974"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="164914974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 04:07:18 -0700
IronPort-SDR: mXKfpekO16aD71rLRixEkhm0DuQVDFWwhXvJpAXq4ReEpjgwEx678WwvzQsb4Prwpm0DBwR4A2
 0ygbD6FOL80w==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="323669920"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 04:07:17 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kY5n2-001CDy-7s; Thu, 29 Oct 2020 13:08:20 +0200
Date:   Thu, 29 Oct 2020 13:08:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20201029110820.GH4077@smile.fi.intel.com>
References: <20201029150809.13059608@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029150809.13059608@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 29, 2020 at 03:08:09PM +1100, Stephen Rothwell wrote:
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> lib/math/div64.c: In function 'mul_u64_u64_div_u64':
> lib/math/div64.c:202:6: error: implicit declaration of function 'ilog2' [-Werror=implicit-function-declaration]
>   202 |  if (ilog2(a) + ilog2(b) > 62) {
>       |      ^~~~~
> 
> Caused by commit
> 
>   4ec993a18ff6 ("kernel.h: Split out mathematical helpers")
> 
> I have applied the following patch for today:

Right, thanks! It seems x86 has this inclusion somewhere else and my patch
reveals this on PPC which has cleaner inclusion chain.

Andrew, can you attach this fix to your tree?

-- 
With Best Regards,
Andy Shevchenko


