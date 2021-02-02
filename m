Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585A730CD1F
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 21:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhBBUcZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 15:32:25 -0500
Received: from mga01.intel.com ([192.55.52.88]:64352 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231713AbhBBUby (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Feb 2021 15:31:54 -0500
IronPort-SDR: xcD+GDjrmv6SPS0NiyXBo8CfOr6d61et6QNljHwmoBoDVrlqqCHhyEYcDrEgUPFtMjjML+gi00
 adPNdo8aXL/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="199862100"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="199862100"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 12:30:28 -0800
IronPort-SDR: Mx4tMkIT+Do7OunarwgSuUOt9+EtmlhQ+WJrSglzwxIibEHchapRekDxwIxN07qc0OI2kkeVye
 sPQ8TSFxUKiA==
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="355440083"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 12:30:24 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8C9482074F; Tue,  2 Feb 2021 22:30:22 +0200 (EET)
Date:   Tue, 2 Feb 2021 22:30:22 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Dan Scally <djrscally@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>
Subject: Re: [PATCH 1/1] ipu3-cio2: Build bridge only if ACPI is enabled
Message-ID: <20210202203022.GX32460@paasikivi.fi.intel.com>
References: <20210202201440.10613-1-sakari.ailus@linux.intel.com>
 <070d3585-e21c-0bef-3740-d38fcd106f25@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <070d3585-e21c-0bef-3740-d38fcd106f25@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 02, 2021 at 12:24:54PM -0800, Randy Dunlap wrote:
> On 2/2/21 12:14 PM, Sakari Ailus wrote:
> > ipu3-cio2-bridge uses several features of the ACPI framework that have no
> > meaningful replacement when ACPI is disabled. Instead of adding #ifdefs to
> > the affected places, only build the bridge code if CONFIG_ACPI is enabled.
> > 
> > Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks! I'll include this in a pull request to Mauro shortly.

-- 
Sakari Ailus
