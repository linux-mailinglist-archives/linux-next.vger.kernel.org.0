Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34CADC37AA
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2019 16:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389089AbfJAOjx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Oct 2019 10:39:53 -0400
Received: from mga14.intel.com ([192.55.52.115]:39087 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388932AbfJAOjx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Oct 2019 10:39:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 07:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="205074460"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 07:39:50 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Oct 2019 17:39:49 +0300
Date:   Tue, 1 Oct 2019 17:39:49 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl-intel-fixes
 tree
Message-ID: <20191001143949.GY2714@lahna.fi.intel.com>
References: <20191002003004.16e51eec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002003004.16e51eec@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 02, 2019 at 12:30:04AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   d21556b6ff04 ("pinctrl: intel: Allocate IRQ chip dynamic")
> 
> Fixes tag
> 
>   Fixes: ee1a6ca43dba ("Add Intel Broxton pin controller support")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Should be fixed now, thanks!
