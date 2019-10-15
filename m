Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8D7ED70E6
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 10:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfJOIXx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 04:23:53 -0400
Received: from mga14.intel.com ([192.55.52.115]:45082 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbfJOIXx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Oct 2019 04:23:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2019 01:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,298,1566889200"; 
   d="scan'208";a="194454949"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 15 Oct 2019 01:23:34 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iKI7B-0003bE-II; Tue, 15 Oct 2019 11:23:33 +0300
Date:   Tue, 15 Oct 2019 11:23:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the pm tree
Message-ID: <20191015082333.GV32742@smile.fi.intel.com>
References: <20191015100855.31b8a3d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015100855.31b8a3d5@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 15, 2019 at 10:08:55AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from include/linux/irqchip.h:14,
>                  from arch/arm/kernel/irq.c:26:
> include/linux/acpi.h:682:31: warning: 'struct acpi_device' declared inside parameter list will not be visible outside of this definition or declaration
>   682 | acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2)
>       |                               ^~~~~~~~~~~
> 
> and many more.
> 
> Introduced by commit
> 
>   d1748b57dc88 ("ACPI / utils: Introduce acpi_dev_hid_uid_match() helper")
> 
> CONFIG_ACPI is not set for this build.

I'm puzzled. Why it builds before?

Another function has struct acpi_device *adev in its prototype and it was
before above mentioned commit.


-- 
With Best Regards,
Andy Shevchenko


