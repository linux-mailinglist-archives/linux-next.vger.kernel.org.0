Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF124D392C
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 19:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbiCIStZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 13:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236796AbiCIStX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 13:49:23 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB54171EC2;
        Wed,  9 Mar 2022 10:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=i5b4RZa7ZGU8BzAqKcxR7htqsIE/qrDUybnyPYPDJl8=; b=SFNj4S76wlmtds4dW0mXQqzRvG
        S6RzZt/BN8ktkWjDJJrWn+WFAei1UEg/UzAfSu2rIz/L3aVo8HWRmERv4VEHY62nEiK6PjT1ja64S
        OvVEqvEqA0tjijVhBFGspAPKjUtVKvj22qe536MwoaAd+Bx1lZx6WbuRsKykzsk9q4NdllKG2f06v
        xNvz94eGUkoa+seoJoGW/ForRiU2sldlLWzYH8bH5GqSAyUocCAI+CV06QI3nJwG6gfHh9Otw8bpW
        jj6K18cMXv/vI+oF8D8YI4/1IIYuCZ6cMzSGUydDW3+myuKI2Hh/uKnMf1Pitg3TsPrx06RJ89ZZh
        O6DAGeeg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57752)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1nS1MB-0002OU-Um; Wed, 09 Mar 2022 18:48:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1nS1M9-0008Bp-CW; Wed, 09 Mar 2022 18:48:17 +0000
Date:   Wed, 9 Mar 2022 18:48:17 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [next] arm: Internal error: Oops: 5 PC is at
 __read_once_word_nocheck
Message-ID: <Yij2cZVKwPexGsTf@shell.armlinux.org.uk>
References: <CA+G9fYtpy8VgK+ag6OsA9TDrwi5YGU4hu7GM8xwpO7v6LrCD4Q@mail.gmail.com>
 <YiiDZ7jjG38gqP+Q@shell.armlinux.org.uk>
 <CAMj1kXHTdk1Abm7ShoZzrW6EpM9eyFMPSdaa58Ziie4ZMecCnQ@mail.gmail.com>
 <CA+G9fYvCvBBi+dZ+CnUy=ZK6GhCFhBw72_==Cav=Q8QP5T1r5w@mail.gmail.com>
 <CA+G9fYt73AYs=z-BeZh22RBp==sf73pKky6m4iPSH7a4FssK7w@mail.gmail.com>
 <CAMj1kXEFZVeWLaRQJmwO+Nn6uW4q6vXJOaNNTVKju1p2bMQksA@mail.gmail.com>
 <YijCkHHhpleeADAO@shell.armlinux.org.uk>
 <CA+G9fYtjrAMg8TykZdRyZEfRthyqom_73x87F-60C_QFeEL8Bg@mail.gmail.com>
 <YijfzAhWAgfGGqCO@shell.armlinux.org.uk>
 <CAMj1kXFvjawvOzeTb2m1H=P-_aXgW-ozvaOK1FtjBv7G0sCDFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFvjawvOzeTb2m1H=P-_aXgW-ozvaOK1FtjBv7G0sCDFA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 09, 2022 at 06:43:42PM +0100, Ard Biesheuvel wrote:
> On Wed, 9 Mar 2022 at 18:11, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Wed, Mar 09, 2022 at 10:08:25PM +0530, Naresh Kamboju wrote:
> > > Hi Russell,
> > >
> > > On Wed, 9 Mar 2022 at 20:37, Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > On Wed, Mar 09, 2022 at 03:57:32PM +0100, Ard Biesheuvel wrote:
> > > > > On Wed, 9 Mar 2022 at 15:44, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > > >
> > > <trim>
> > > > Well, we unwound until:
> > > >
> > > >  __irq_svc from migrate_disable+0x0/0x70
> > > >
> > > > and then crashed - and the key thing there is that we're at the start
> > > > of migrate_disable() when we took an interrupt.
> > > >
> > > > For some reason, this triggers an access to address 0x10, which faults.
> > > > We then try unwinding again, and successfully unwind all the way back
> > > > to the same point (the line above) which then causes the unwinder to
> > > > again access address 0x10, and the cycle repeats with the stack
> > > > growing bigger and bigger.
> > > >
> > > > I'd suggest also testing without the revert but with my patch.
> > >
> > > I have tested your patch on top of linux next-20220309 and still see kernel
> > > crash as below [1]. build link [2].
> > >
> > > [   26.812060] 8<--- cut here ---
> > > [   26.813459] Unhandled fault: page domain fault (0x01b) at 0xb6a3ab70
> > > [   26.816139] [b6a3ab70] *pgd=fb28a835
> > > [   26.817770] Internal error: : 1b [#1] SMP ARM
> > > [   26.819636] Modules linked in:
> > > [   26.820956] CPU: 0 PID: 211 Comm: haveged Not tainted
> > > 5.17.0-rc7-next-20220309 #1
> > > [   26.824519] Hardware name: Generic DT based system
> > > [   26.827148] PC is at __read_once_word_nocheck+0x0/0x8
> > > [   26.829856] LR is at unwind_frame+0x7dc/0xab4
> > >
> > > - Naresh
> > >
> > > [1] https://lkft.validation.linaro.org/scheduler/job/4688599#L596
> > > [2] https://builds.tuxbuild.com/269gYLGuAdmltuLhIUDAjS2fg1Q/
> >
> > I think the problem has just moved:
> >
> > [   27.113085]  __irq_svc from __copy_to_user_std+0x24/0x378
> >
> > The code at the start of __copy_to_user_std is:
> >
> >    0:   e3a034bf        mov     r3, #-1090519040        ; 0xbf000000
> >    4:   e243c001        sub     ip, r3, #1
> >    8:   e05cc000        subs    ip, ip, r0
> >    c:   228cc001        addcs   ip, ip, #1
> >   10:   205cc002        subscs  ip, ip, r2
> >   14:   33a00000        movcc   r0, #0
> >   18:   e320f014        csdb
> >   1c:   e3a03000        mov     r3, #0
> >   20:   e92d481d        push    {r0, r2, r3, r4, fp, lr}
> >   24:   e1a0b00d        mov     fp, sp
> >
> > and the unwind information will be:
> >
> > 0xc056f14c <arm_copy_to_user+0x1c>: @0xc0b89b84
> >   Compact model index: 1
> >   0x9b      vsp = r11
> >   0xb1 0x0d pop {r0, r2, r3}
> >   0x84 0x81 pop {r4, r11, r14}
> >   0xb0      finish
> >
> > The problem is that the unwind information says "starting at offset
> > 0x1c, to unwind do the following operations". The first of which is
> > to move r11 (fp) to the stack pointer. However, r11 isn't setup
> > until function offset 0x24. You've hit that instruction, which hasn't
> > executed yet, but the stack has been modified by pushing r0, r2-r4,
> > fp and lr onto it.
> >
> > Given this, there is no way that the unwinder (as it currently stands)
> > can do its job properly between 0x1c and 0x24.
> >
> > I don't think this is specifically caused by Ard's patches, but by
> > the addition of KASAN, which has the effect of calling the unwinder
> > at random points in the kernel (when an interrupt happens) and it's
> > clear from the above that there are windows in the code where, if
> > we attempt to unwind using the unwind information, we faill fail
> > because the program state is not consistent with the unwind
> > information.
> >
> > Ard's patch that changes:
> >
> >         ctrl->vrs[reg] = READ_ONCE_NOCHECK(*(*vsp));
> >
> > to use get_kernel_nofault() should have the effect of protecting
> > against the oops, but the side effect is that it is fundamentally not
> > possible with the way these things are to unwind at these points -
> > which means its not possible to get a stacktrace there.
> >
> > So, I don't think this is a "new" problem, but a weakness of using
> > the unwinder to get a backtrace for KASAN.
> >
> 
> It essentially means that we cannot unwind through asynchronous
> exceptions, and so we should probably make the svc_entry macro
> .nounwind, instead of pretending that we can reliably unwind through
> it.

Doesn't that impact the ability to debug the kernel over things like
oopses and the like?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
