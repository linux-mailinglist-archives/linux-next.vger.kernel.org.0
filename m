Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E504D365906
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 14:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhDTMgN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Apr 2021 08:36:13 -0400
Received: from mga03.intel.com ([134.134.136.65]:43892 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231590AbhDTMgM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Apr 2021 08:36:12 -0400
IronPort-SDR: xEqThQUN6nlb5dhoG/5TKM7vE9wm1jOkrNDwf3un3aaLpiRTzN1noMvlbuhFaZMcEF47V1NNTF
 8WvSsfVsCGVA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195524251"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="195524251"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 05:35:41 -0700
IronPort-SDR: nrb8/kN/VgVNhge7JJDIMnEyQiCNmn128axcyv3DT0Gz9w3vqYSuUdCVK0wAEBTKOVd72LmwsS
 uCmGT6zaTPHw==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="463098466"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 05:35:39 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lYpbN-005jqH-7X; Tue, 20 Apr 2021 15:35:37 +0300
Date:   Tue, 20 Apr 2021 15:35:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Apr 20
Message-ID: <YH7KmRQV2oD7fooj@smile.fi.intel.com>
References: <20210420194718.4a4a0e8f@canb.auug.org.au>
 <YH7C6xP5HsHYuobO@smile.fi.intel.com>
 <YH7G235DGG6bEDTF@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YH7G235DGG6bEDTF@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 20, 2021 at 03:19:39PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 20, 2021 at 03:02:51PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 20, 2021 at 07:47:18PM +1000, Stephen Rothwell wrote:

...

> > I have full of build warnings / errors in x86 and iommu

Found the culprit -- it was uncleaned stuff from the other build in the source
tree. So, it was only me who experienced that :-)

-- 
With Best Regards,
Andy Shevchenko


