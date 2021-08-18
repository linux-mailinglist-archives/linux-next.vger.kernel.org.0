Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159353F0031
	for <lists+linux-next@lfdr.de>; Wed, 18 Aug 2021 11:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhHRJS7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Aug 2021 05:18:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:14187 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230118AbhHRJS6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Aug 2021 05:18:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="216284259"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="216284259"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 02:18:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="531480216"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 02:18:21 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mGHiA-00B3qD-PH; Wed, 18 Aug 2021 12:18:14 +0300
Date:   Wed, 18 Aug 2021 12:18:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the i2c
 tree
Message-ID: <YRzQVpCLwRDcKEN2@smile.fi.intel.com>
References: <20210818165439.1fc613e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210818165439.1fc613e2@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 18, 2021 at 04:54:39PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/linux/units.h
> 
> between commit:
> 
>   26471d4a6cf8 ("units: Add SI metric prefix definitions")
> 
> from the i2c tree and commits:
> 
>   d874da9a830f ("units: change from 'L' to 'UL'")
>   390618bdc78a ("units: add the HZ macros")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is correct fix, thank you, Stephen!

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/linux/units.h
> index 4a25e0cc8fb3,8b8dc8a84d93..000000000000
> --- a/include/linux/units.h
> +++ b/include/linux/units.h
> @@@ -4,25 -4,13 +4,29 @@@
>   
>   #include <linux/math.h>
>   
>  +/* Metric prefixes in accordance with Système international (d'unités) */
>  +#define PETA	1000000000000000ULL
>  +#define TERA	1000000000000ULL
>  +#define GIGA	1000000000UL
>  +#define MEGA	1000000UL
>  +#define KILO	1000UL
>  +#define HECTO	100UL
>  +#define DECA	10UL
>  +#define DECI	10UL
>  +#define CENTI	100UL
>  +#define MILLI	1000UL
>  +#define MICRO	1000000UL
>  +#define NANO	1000000000UL
>  +#define PICO	1000000000000ULL
>  +#define FEMTO	1000000000000000ULL
>  +
> - #define MILLIWATT_PER_WATT	1000L
> - #define MICROWATT_PER_MILLIWATT	1000L
> - #define MICROWATT_PER_WATT	1000000L
> + #define HZ_PER_KHZ		1000UL
> + #define KHZ_PER_MHZ		1000UL
> + #define HZ_PER_MHZ		1000000UL
> + 
> + #define MILLIWATT_PER_WATT	1000UL
> + #define MICROWATT_PER_MILLIWATT	1000UL
> + #define MICROWATT_PER_WATT	1000000UL
>   
>   #define ABSOLUTE_ZERO_MILLICELSIUS -273150
>   



-- 
With Best Regards,
Andy Shevchenko


