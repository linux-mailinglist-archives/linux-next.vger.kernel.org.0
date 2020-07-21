Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0024622841D
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 17:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgGUPqj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 11:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgGUPqj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2020 11:46:39 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCCFC061794;
        Tue, 21 Jul 2020 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=aGFJni586xHZsL52SXijS9vqEQ32qjwVvpyXHnp48Wk=; b=l3gMlr/0yQuUhq90OWfVkxYwA
        F3zo5GHL17f6FtuW3WAI1aZhs2qfq2YgRq+lpavULUd3dEqsGmgArNbwHcOotNL2fQWRJPNZDOjdc
        bEyLOExVXNmZi8Q3V1werPA+ZScF2FHZIdCTjChOjVsFzlb8dZIHAOAgkSVERtXsyKXJF9/EARpHh
        DwJLhQkFTUp2CBEuMxVdmGwx0jaxVyvib0pn+N5BvuCxZ+D4e55mptoGPJasm79yoQ66Luv7wF29A
        Maj1IBZg2V9N/zHCm8Q7aCK8l79uJvnfCCPVJyCvBTyGj5islZrABtM+GsAf1zpV1hu8v2S6l42ST
        pyA5GO1Ow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42370)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jxuTV-0004W1-2C; Tue, 21 Jul 2020 16:46:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jxuTU-00067c-1b; Tue, 21 Jul 2020 16:46:36 +0100
Date:   Tue, 21 Jul 2020 16:46:36 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: arm: tinyconfig: entry-common.S:156: Error: r13 not allowed here
 -- `bic tsk,sp,#(((1<<12)<<1)-1)&~63'
Message-ID: <20200721154635.GA1551@shell.armlinux.org.uk>
References: <CA+G9fYtYPA7jHPNB5D+JFHpmtB5+Wj+YG8W33GhffHjmFaMiUg@mail.gmail.com>
 <CAK8P3a1DYvyzkFQDPPnK1p4yUZ-Zp+Pg2Lg9QKO_wnjbnHygnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1DYvyzkFQDPPnK1p4yUZ-Zp+Pg2Lg9QKO_wnjbnHygnw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 21, 2020 at 05:43:15PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 21, 2020 at 5:07 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > This might add little value.
> >
> > arm build sets failed on linux next 20200721.
> > The defconfig ( +config fragments ) builds PASS.
> > The tinyconfig and allnoconfig FAILED with gcc-8, gcc-9 and gcc-10.
> >
> > make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j32 ARCH=arm
> > CROSS_COMPILE=arm-linux-gnueabihf- HOSTCC=gcc CC="sccache
> > arm-linux-gnueabihf-gcc" O=build zImage
> > #
> > ../arch/arm/kernel/entry-common.S: Assembler messages:
> > ../arch/arm/kernel/entry-common.S:156: Error: r13 not allowed here --
> > `bic tsk,sp,#(((1<<12)<<1)-1)&~63'
> > ../arch/arm/kernel/entry-common.S:243: Error: r13 not allowed here --
> > `bic tsk,sp,#(((1<<12)<<1)-1)&~63'
> > make[3]: *** [../scripts/Makefile.build:361:
> > arch/arm/kernel/entry-common.o] Error 1
> > ../arch/arm/kernel/entry-v7m.S: Assembler messages:
> > ../arch/arm/kernel/entry-v7m.S:60: Error: r13 not allowed here -- `bic
> > tsk,sp,#(((1<<12)<<1)-1)&~63'
> > ../arch/arm/kernel/entry-v7m.S:86: Error: r13 not allowed here -- `bic
> > tsk,sp,#(((1<<12)<<1)-1)&~63'
> > make[3]: *** [../scripts/Makefile.build:361:
> > arch/arm/kernel/entry-v7m.o] Error 1
> >
> > full build link,
> > https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/648560264
> 
> This must come from
> ac5bb8f8445f ("ARM: 8983/1: asm: Rewrite get_thread_info using BIC")
> 
> Adding Linus and Ard to Cc as well.

Absolutely no point.

It was known about last night (see your irc scrollback - I mentioned it
to sfr).  It was reported earlier this afternoon just after I dropped
the commit.  It's now been reported again.

So, please ignore these reports.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
