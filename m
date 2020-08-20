Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A6024BD37
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 15:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgHTNBz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 09:01:55 -0400
Received: from mga05.intel.com ([192.55.52.43]:44475 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729033AbgHTJkl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Aug 2020 05:40:41 -0400
IronPort-SDR: ZLFWryVtWQ2sbvEQWyNXSFbHoj79jmR0bGsufnMp9JmdvE+ZmSEwEodLn1QOxUonp9DqZMRRbR
 ClI/Kr3sJi9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="240093999"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="240093999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 02:40:38 -0700
IronPort-SDR: E40CW/24bwrXLELWjiM6ePuqcHQIEYJyWgdOpngCph/tENCwJFg+8CovzvyYfMS1FKZoIu8e0O
 nlaEONdqORFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="327377344"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 20 Aug 2020 02:40:37 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k8h3k-00A50Z-2Y; Thu, 20 Aug 2020 12:40:36 +0300
Date:   Thu, 20 Aug 2020 12:40:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl-intel tree
Message-ID: <20200820094036.GU1891694@smile.fi.intel.com>
References: <20200820113039.71120e6a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820113039.71120e6a@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 20, 2020 at 11:30:39AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pinctrl-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> x86_64-linux-gnu-ld: drivers/pinctrl/intel/pinctrl-baytrail.o: in function `byt_pinctrl_probe':
> pinctrl-baytrail.c:(.text+0x12bf): undefined reference to `intel_pinctrl_get_soc_data'
> 
> Caused by commit
> 
>   2db97df9f29d ("pinctrl: baytrail: Switch to use intel_pinctrl_get_soc_data()")

Right, I have updated it. Shouldn't be issues now.

> CONFIG_PINCTRL_BAYTRAIL=y
> CONFIG_PINCTRL_INTEL=m
> 
> I have ised the pinctrl-intel tree from next-20200819 for today.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


