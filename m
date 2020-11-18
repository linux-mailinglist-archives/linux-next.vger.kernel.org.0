Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16232B7C0A
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 12:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgKRLA7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 06:00:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:57040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbgKRLA7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 06:00:59 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1657F238E6;
        Wed, 18 Nov 2020 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605697258;
        bh=LtPEeV37jqaOG4N9SOqPyVH8faRroDw/Z5ZgYdxXRZw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xFl5Ac2BRrER3nj5aMDBXN0McTSlR/sLpDPCkWLgqgJS9Q5xlkgPD4kTUrE8TQYYI
         sx8OfcQSC4t80HOf2jHMVz9iq4sLsIhEW7w8m8wZPfOIXEIMZZi/VFU/PPzfSUofcL
         NrP2We1WuNGcWzXZM/8uBTXDmkYLE6Q2ssyShfU0=
Date:   Wed, 18 Nov 2020 05:00:57 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gpio tree with the kspp-gustavo
 tree
Message-ID: <20201118110057.GA30719@embeddedor>
References: <20201118142445.461d3792@canb.auug.org.au>
 <CACRpkdahE38tamkVZLx+m3nkE_dDfaN-u7gEwH48BEnf1BvsFg@mail.gmail.com>
 <CAHp75VevuYCZVPw8HHcaoGdHBvXxHTNnujbf2BUyBECmFHZFDQ@mail.gmail.com>
 <CAHp75Vcuxc1Ypo6GV_a2hACWPFqg4m8mZr8mLHD=LgWpLLEWMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vcuxc1Ypo6GV_a2hACWPFqg4m8mZr8mLHD=LgWpLLEWMg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Andy,

On Wed, Nov 18, 2020 at 12:52:25PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 18, 2020 at 11:29 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Nov 18, 2020 at 9:53 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Wed, Nov 18, 2020 at 4:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > >   b8e0b635e6e6 ("gpio: Fix fall-through warnings for Clang")
> > > >
> > > > from the kspp-gustavo tree and commit:
> 
> Gustavo, one remark though. It's not okay to hide changes from
> maintainers. I have checked
> b8e0b635e6e6 ("gpio: Fix fall-through warnings for Clang") and found
> nothing except your SoB.
> 
> Please, inform maintainers about changes you are doing in their realm(s).

Sorry about that. I'll remove that change from my tree. I just wanted to
test some changes in linux-next.

Thanks for the feedback.
--
Gustavo


