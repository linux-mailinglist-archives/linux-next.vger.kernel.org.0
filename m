Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24984E4567
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2019 10:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407448AbfJYIPO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Oct 2019 04:15:14 -0400
Received: from mga12.intel.com ([192.55.52.136]:33640 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404323AbfJYIPO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Oct 2019 04:15:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 01:15:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="188858812"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 25 Oct 2019 01:15:11 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iNukZ-0001zf-5D; Fri, 25 Oct 2019 11:15:11 +0300
Date:   Fri, 25 Oct 2019 11:15:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the
 pinctrl-intel tree
Message-ID: <20191025081511.GH32742@smile.fi.intel.com>
References: <20191025071552.609fcead@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191025071552.609fcead@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 25, 2019 at 07:15:52AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   ec7ec598997d ("pinctrl: cherryview: Fix irq_valid_mask calculation")
>   2fe72dbce079 ("pinctrl: cherryview: restore Strago DMI workaround for all versions")
> 
> are missing a Signed-off-by from their committer.

Thank you!
It's now fixed and will be published till the end of the day.

-- 
With Best Regards,
Andy Shevchenko


