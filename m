Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F502B4069
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 11:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgKPKCx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 05:02:53 -0500
Received: from mga03.intel.com ([134.134.136.65]:32102 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726837AbgKPKCx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Nov 2020 05:02:53 -0500
IronPort-SDR: 9ece2WyK63vwo7Gj8xHEggEvIQUiG2atIzTiRgLsSVF1A3/wea5i7MGbRz3QlfUbtPKwMGxamr
 Mvnp2woIW0KQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="170827185"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="170827185"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 02:02:52 -0800
IronPort-SDR: zJijbnzD6nC8kqv8OC7t5Mts4a4YzkgSO/pNBfKqE3uDu6gNxdIqEZa8pD1PYfiaQy1So7QKcw
 cCD7QXqJGj/g==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="324753302"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 02:02:51 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kebMX-0072Qu-Fa; Mon, 16 Nov 2020 12:03:53 +0200
Date:   Mon, 16 Nov 2020 12:03:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20201116100353.GT4077@smile.fi.intel.com>
References: <20201113170101.00ad0712@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113170101.00ad0712@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 13, 2020 at 05:01:01PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in lib/cmdline_kunit.o
> 
> Introduced by commit
> 
>   f1a15df76475 ("lib/cmdline_kunit: add a new test suite for cmdline API")

I'm on it right now, thanks!

-- 
With Best Regards,
Andy Shevchenko


