Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D405B240481
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 12:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgHJKMf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Aug 2020 06:12:35 -0400
Received: from mga06.intel.com ([134.134.136.31]:6343 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbgHJKMe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Aug 2020 06:12:34 -0400
IronPort-SDR: KcuP1oweT0ur7dqDacVv+UmdS2FPjdGLvgppfd8LuCri00malYFUGZGYPKZ3Z/Wxvif3bYYY/h
 DBlrtDFioZJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="215023207"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="215023207"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 03:12:33 -0700
IronPort-SDR: O46JcrHJt4xdaeyOvGHz3MLP9EniilR5tg3mqan4zcO3UY5vVGFJXBXtrKz8jUXJjcG+6mzFDa
 y2bIGn2tDSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="398180335"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 10 Aug 2020 03:12:30 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 10 Aug 2020 13:12:30 +0300
Date:   Mon, 10 Aug 2020 13:12:30 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the thunderbolt tree
Message-ID: <20200810101230.GI1375436@lahna.fi.intel.com>
References: <20200630160346.696f6419@canb.auug.org.au>
 <20200809181838.23c6b829@canb.auug.org.au>
 <CAHk-=wjjsrVPKirEN7hTioibRYSOZuo82seuUm6k7=tqeWHnZg@mail.gmail.com>
 <20200810091053.2757b97f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810091053.2757b97f@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

On Mon, Aug 10, 2020 at 09:10:53AM +1000, Stephen Rothwell wrote:
> Hi Linus,
> 
> On Sun, 9 Aug 2020 11:04:28 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > On Sun, Aug 9, 2020 at 1:19 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > I looks like the above report got lost along the way to you :-(  
> > 
> > Hmm. Why didn't I see this as a build failure?
> > 
> > Oh. Because the USB4_KUNIT_TEST stuff requires everything to be built
> > in. And I have them as modules.
> 
> Yeah, I only saw it because I do an allyesconfig build late in my day.

Sorry about this. I was not sure how to deal with this as Thunderbolt
goes through Greg's USB tree, so I just ended up mentioning it in my
pull request without actually including the complete patch.

The reason for the built in dependency is that KUnit adds its own
module_init() in kunit_test_suite() so that causes linker error since
the TBT driver does the same. I guess the better alternative would be to
not use kunit_test_suite() and instead make calls to
__kunit_test_suites_init() and __kunit_test_suites_exit() in the
driver's nhi_init()/nhi_exit().

> > > Here's the patch in case you want to directly apply it:  
> > 
> > Will do. Thanks,
> 
> Thanks.

Thanks!
