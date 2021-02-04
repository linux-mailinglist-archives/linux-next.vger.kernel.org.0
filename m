Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A1A30F7A7
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 17:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237166AbhBDQXY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 11:23:24 -0500
Received: from mga12.intel.com ([192.55.52.136]:62963 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237042AbhBDPHh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Feb 2021 10:07:37 -0500
IronPort-SDR: IeMgd1RmCdrLHewfCP5nkj2MyMsY17rk04+6NvBtekd3QkPWUH579pPrvZMkYK2nEYzkmZ6Wn1
 6fOeTSzyXnAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160420162"
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; 
   d="scan'208";a="160420162"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 07:05:51 -0800
IronPort-SDR: poRwnzyt7zxPp5Ci3mDHcdCKs79uKBOse0v7tl+uRAVzIK7YF8TVE7sVnl8mIsdzw0bsvJJYGo
 arDlJe3hvjiA==
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; 
   d="scan'208";a="415395862"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 07:05:50 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l7gCZ-001vYb-6A; Thu, 04 Feb 2021 17:05:47 +0200
Date:   Thu, 4 Feb 2021 17:05:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <mark.gross@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Message-ID: <YBwNS6iO1RhY+2Lf@smile.fi.intel.com>
References: <20210204161351.5c934ea2@canb.auug.org.au>
 <5461d70a-39a0-0322-e2ae-6434e0d1e0a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5461d70a-39a0-0322-e2ae-6434e0d1e0a3@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 04, 2021 at 08:38:40AM +0100, Hans de Goede wrote:
> Hi Stephen, Andy,
> 
> On 2/4/21 6:13 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the drivers-x86 tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > drivers/platform/x86/intel_scu_wdt.c: In function 'register_mid_wdt':
> > drivers/platform/x86/intel_scu_wdt.c:66:28: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
> >    66 |  wdt_dev.dev.platform_data = (const struct intel_mid_wdt_pdata *)id->driver_data;
> >       |                            ^
> > 
> > Introduced by commit
> > 
> >   a507e5d90f3d ("platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison")
> 
> Thank you for the bug report.
> 
> Andy can you send me a fix for this please ?

Fix just has been sent.

-- 
With Best Regards,
Andy Shevchenko


