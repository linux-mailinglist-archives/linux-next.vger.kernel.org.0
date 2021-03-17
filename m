Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC6D33EDF0
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 11:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhCQKEb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 06:04:31 -0400
Received: from mga04.intel.com ([192.55.52.120]:60414 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230044AbhCQKEA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 06:04:00 -0400
IronPort-SDR: 1JeqLWGYcCQ7TMKrLdGe5UVOwVJP3G9qeDPv8pdvqU9EHM/XFbTUKGNHK60//4oiHcK1AnM0ud
 ihgP+9mLXdxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="187059856"
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; 
   d="scan'208";a="187059856"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2021 03:03:58 -0700
IronPort-SDR: wdF42FOBhSLVxPRUlRvbNDBu9g64InEd/ShhtrjDurfGnQB/eGpImS4hQLaT7UIGbJFFPukVQb
 FazB16q3R5HA==
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; 
   d="scan'208";a="440402824"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2021 03:03:54 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lMT1r-00DE4M-W2; Wed, 17 Mar 2021 12:03:51 +0200
Date:   Wed, 17 Mar 2021 12:03:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the gpio-brgl-fixes tree
Message-ID: <YFHUB731xqyJhE3e@smile.fi.intel.com>
References: <20210317090200.2fe81618@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317090200.2fe81618@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 09:02:00AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   6cb59afe9e5b ("gpiolib: Assign fwnode to parent's if no primary one provided")
> 
> Fixes tag
> 
>   Fixes: 2afa97e9868f ("gpiolib: Read "gpio-line-names" from a firmware node")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: b41ba2ec54a7 ("gpiolib: Read "gpio-line-names" from a firmware node")

Right. I have two hashes in my tree for the same commit :-(
In any case it has older commit in another Fixes tag which is okay.

-- 
With Best Regards,
Andy Shevchenko


