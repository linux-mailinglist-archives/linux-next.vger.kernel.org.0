Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5413B2B97B7
	for <lists+linux-next@lfdr.de>; Thu, 19 Nov 2020 17:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgKSQVt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Nov 2020 11:21:49 -0500
Received: from mga07.intel.com ([134.134.136.100]:10535 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728250AbgKSQVt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Nov 2020 11:21:49 -0500
IronPort-SDR: 9SdxGfpj6NpgvhyJvelOsv2ubS5lj+VJDPBkX3gpbURgifcMA9UTjeVd+A+jJQdK+B+1j0KOWT
 8B/1JsjamC2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="235464761"
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; 
   d="scan'208";a="235464761"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 08:21:48 -0800
IronPort-SDR: RVOY+vno/nCM5g0TlZgmppkFOyJxy8q+3+9tmOBPtwJQOKwtT76bHUPVzudlNUakyprSlnDH97
 ohr+B90joGIQ==
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; 
   d="scan'208";a="360063298"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 08:21:46 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kfmht-00800c-68; Thu, 19 Nov 2020 18:22:49 +0200
Date:   Thu, 19 Nov 2020 18:22:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pm tree
Message-ID: <20201119162249.GL4077@smile.fi.intel.com>
References: <20201119110901.1ad61658@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119110901.1ad61658@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 19, 2020 at 11:09:01AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in kernel/resource_kunit.o
> 
> Introduced by commit
> 
>   5df38ca6afec ("resource: Add test cases for new resource API")

I have sent a fix, thanks.

The cause was the same as for previous similar issue, i.e. KUnit silently
compiled and run tests even if the build process had warnings. I have been
told that it's now fixed in their tree and soon should be propagated further.

-- 
With Best Regards,
Andy Shevchenko


