Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A664F2E1E
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 13:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388157AbfKGMXQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 07:23:16 -0500
Received: from hetzy.fluff.org ([88.198.11.153]:46264 "EHLO hetzy.fluff.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727385AbfKGMXP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Nov 2019 07:23:15 -0500
X-Greylist: delayed 1382 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Nov 2019 07:23:15 EST
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
        (envelope-from <ben@fluff.org>)
        id 1iSgSA-0004Xt-TZ; Thu, 07 Nov 2019 11:59:54 +0000
Date:   Thu, 7 Nov 2019 11:59:54 +0000
From:   Ben Dooks <ben@fluff.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Linux-next-20191106 : arm64: Internal error: Oops: 96000007
Message-ID: <20191107115954.7sfjflcxwejcolpb@hetzy.fluff.org>
References: <CA+G9fYvm_QEq+9e+dni1Y+bJswr9bU5=shJcC+wKjjOyiPsXXQ@mail.gmail.com>
 <bfced8c8-c64f-982e-8797-d48b5ec65291@arm.com>
 <20191106161705.GA11849@sirena.co.uk>
 <CACRpkdY5JObOobs7VW043QYGd_xufwnQDBJseKp+_QWv4kdzaQ@mail.gmail.com>
 <20191107114553.GA6159@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107114553.GA6159@sirena.co.uk>
X-Disclaimer: These are my views alone.
X-URL:  http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 07, 2019 at 11:45:53AM +0000, Mark Brown wrote:
> On Thu, Nov 07, 2019 at 09:00:25AM +0100, Linus Walleij wrote:
> 
> > I wonder if it's worth to look at the static checkers like checkpatch
> > to warn for this?
> 
> I noticed this due to the warning emitted in the build process so I'm
> not sure there'd be much more chance that people would notice (though
> admittedly the warning during the build doesn't suggest a boot problem).
> There's hundreds of other examples in the tree that don't trigger
> crashes for whatever reason, I think this one was just noticable because
> it got built in.

Is it worth hving a attribute for 'can't be initdata' to add to sparse to
catch things like this. Not sure if checkpatch would be able to do the sort
of full level of catch for this.



-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

