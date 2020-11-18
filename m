Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCF82B7F38
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 15:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgKROOn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 09:14:43 -0500
Received: from mga12.intel.com ([192.55.52.136]:2450 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgKROOn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 09:14:43 -0500
IronPort-SDR: WEF/MeA3Fl6FCldwDWSvp+bh5rdWz9pCz19x0pEF8+mIh9hxhf9HP+C12KU2ic9XDa87pCQSib
 0FMamdxRvkNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="150390228"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="150390228"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 06:14:37 -0800
IronPort-SDR: D7WY4oclhyy/VoROe0p8bFypYOQlnkov4eqdcYFhBg4MNxPK7dw4S7lNirv+5OyrqNhZYGsxuX
 ZnzQT08TBGaA==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="534307437"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 06:14:35 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kfOFF-007e7W-PU; Wed, 18 Nov 2020 16:15:37 +0200
Date:   Wed, 18 Nov 2020 16:15:37 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gpio tree with the kspp-gustavo
 tree
Message-ID: <20201118141537.GU4077@smile.fi.intel.com>
References: <20201118142445.461d3792@canb.auug.org.au>
 <CACRpkdahE38tamkVZLx+m3nkE_dDfaN-u7gEwH48BEnf1BvsFg@mail.gmail.com>
 <CAHp75VevuYCZVPw8HHcaoGdHBvXxHTNnujbf2BUyBECmFHZFDQ@mail.gmail.com>
 <CAHp75Vcuxc1Ypo6GV_a2hACWPFqg4m8mZr8mLHD=LgWpLLEWMg@mail.gmail.com>
 <20201118110057.GA30719@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118110057.GA30719@embeddedor>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 18, 2020 at 05:00:57AM -0600, Gustavo A. R. Silva wrote:
> On Wed, Nov 18, 2020 at 12:52:25PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 18, 2020 at 11:29 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Wed, Nov 18, 2020 at 9:53 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > > On Wed, Nov 18, 2020 at 4:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > >   b8e0b635e6e6 ("gpio: Fix fall-through warnings for Clang")
> > > > >
> > > > > from the kspp-gustavo tree and commit:
> > 
> > Gustavo, one remark though. It's not okay to hide changes from
> > maintainers. I have checked
> > b8e0b635e6e6 ("gpio: Fix fall-through warnings for Clang") and found
> > nothing except your SoB.
> > 
> > Please, inform maintainers about changes you are doing in their realm(s).
> 
> Sorry about that. I'll remove that change from my tree. I just wanted to
> test some changes in linux-next.
> 
> Thanks for the feedback.

No problem, thanks for taking care of this.

As Linus mentioned, please send a formal patch he will include in his tree.
(I have noticed that there are two drivers in the same change, I recommend
 to split, so should be two separated patches)

-- 
With Best Regards,
Andy Shevchenko


