Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43CE3B5D36
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 13:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbhF1Liz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 07:38:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:10856 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232486AbhF1Liu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Jun 2021 07:38:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="207877953"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="scan'208";a="207877953"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 04:36:24 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="scan'208";a="425098684"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 04:36:21 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lxpYm-0060zW-Sl; Mon, 28 Jun 2021 14:36:16 +0300
Date:   Mon, 28 Jun 2021 14:36:16 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>,
        David Miller <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Christoph Hellwig <hch@lst.de>,
        Finn Thain <fthain@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: linux-next: manual merge of the block tree with the ide and
 kspp-gustavo trees
Message-ID: <YNm0MBV6Sn+ceEZ9@smile.fi.intel.com>
References: <20210621141110.548ec3d0@canb.auug.org.au>
 <CAHp75VcJKX4xzP1PrCBixDzgGBGwVvbV3YtMebKxpRoi1_EhaA@mail.gmail.com>
 <20210621223045.018223b9@elm.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621223045.018223b9@elm.ozlabs.ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 21, 2021 at 10:30:45PM +1000, Stephen Rothwell wrote:
> On Mon, 21 Jun 2021 13:56:13 +0300 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Jun 21, 2021 at 7:13 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > >   2c8cbe0b2971 ("IDE SUBSYSTEM: Replace HTTP links with HTTPS ones")
> > >   9a51ffe845e4 ("ide: use generic power management")
> > >   f9e09a0711ca ("ide: sc1200: use generic power management")
> > >   d41b375134a9 ("ide: delkin_cb: use generic power management")
> > >   6800cd8cbc6e ("ide-acpi: use %*ph to print small buffer")
> > >   731d5f441e1c ("ide: Fix fall-through warnings for Clang")
> > >
> > > from the ide and kspp-gustavo trees and commits:  
> > 
> > As far as I can tell the IDE hasn't sent PR to LInus for a long time
> > (like a few release cycles). I don't know what happened there, though.
> 
> Yeah, the top commit in the ide tree (which is intended to hold bug
> fixes for Linus' tree) is dated 4 Aug 2020, so hopefully this will
> prompt Dave to do something with it.  There has been no ide "future
> development" tree in linux-next since 2011.

Yep, I think the best approach here may be to apply those (by sending a PR)
followed by marking subsystem orphaned or delete it entirely.

David, what are your thoughts?

-- 
With Best Regards,
Andy Shevchenko


