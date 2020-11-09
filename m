Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BA22AC07D
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 17:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbgKIQHH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 11:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgKIQHH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 11:07:07 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFB2C0613CF
        for <linux-next@vger.kernel.org>; Mon,  9 Nov 2020 08:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=sCgAeIe4xj+YSbbSBnoftllYArFeB2ell1ztf8OUr8Q=; b=WQ8Lp+HtXaAEFw3JCMm5Yr4Q5
        yzuvx1KTybsUZ+BvoMQCcFrtAwNH6hgP+Ug+een3GS7btx4m+GRnnV1wARe0UvbNy3sRVe1Cutkes
        MVngbzHEr+3guMd0oPXAY7wJ4nwnlL2zm7Hm5W7PLTIV2KqofFbC/nEhl1Fmq7f9MQxkmI6NRqH74
        gkVwOfQNaBA+xf0BLs84M8tAGQNAEq2xIP8Y2i7G2obp6Pw9Kq2xIvTrbA3NSGKUOdpG5AuLsP/le
        XShWj88Z9ue0E5dSD+S/71mUleN+3FiRnMOCD7p2K3z8I7Fn3jj1vDUHxL6WfSA6DMHGsmjGp5hv9
        8uGEBgkqA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57588)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kc9gv-0008Rm-7B; Mon, 09 Nov 2020 16:06:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kc9gp-0000Yy-ND; Mon, 09 Nov 2020 16:06:43 +0000
Date:   Mon, 9 Nov 2020 16:06:43 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
Message-ID: <20201109160643.GY1551@shell.armlinux.org.uk>
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org>
 <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86>
 <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
 <20201106151554.GU1551@shell.armlinux.org.uk>
 <CACRpkdaaDMCmYsEptrcQdngqFW6E+Y0gWEZHfKQdUqgw7hiX1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaaDMCmYsEptrcQdngqFW6E+Y0gWEZHfKQdUqgw7hiX1Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 09, 2020 at 05:02:09PM +0100, Linus Walleij wrote:
> On Fri, Nov 6, 2020 at 4:16 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> > On Fri, Nov 06, 2020 at 02:37:21PM +0100, Linus Walleij wrote:
> 
> > > Aha. So shall we submit this to Russell? I figure that his git will not
> > > build *without* the changes from mmotm?
> > >
> > > That tree isn't using git either is it?
> > >
> > > Is this one of those cases where we should ask Stephen R
> > > to carry this patch on top of -next until the merge window?
> >
> > Another solution would be to drop 9017/2 ("Enable KASan for ARM")
> > until the following merge window, and queue up the non-conflicing
> > ARM KASan fixes in my "misc" branch along with the rest of KASan,
> > and the conflicting patches along with 9017/2 in the following
> > merge window.
> >
> > That means delaying KASan enablement another three months or so,
> > but should result in less headaches about how to avoid build
> > breakage with different bits going through different trees.
> >
> > Comments?
> 
> I suppose I would survive deferring it. Or we could merge the
> smaller enablement patch towards the end of the merge
> window once the MM changes are in.
> 
> If it is just *one* patch in the MM tree I suppose we could also
> just apply that one patch also to the ARM tree, and then this
> fixup on top. It does look a bit convoluted in the git history with
> two hashes and the same patch twice, but it's what I've done
> at times when there was no other choice that doing that or
> deferring development. It works as long as the patches are
> textually identical: git will cope.

I thought there was a problem that if I applied the fix then my tree
no longer builds without the changes in -mm?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
