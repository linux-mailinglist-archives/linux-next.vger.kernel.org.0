Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7063E4D53EB
	for <lists+linux-next@lfdr.de>; Thu, 10 Mar 2022 22:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344107AbiCJVvQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Mar 2022 16:51:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243227AbiCJVvP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2022 16:51:15 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F3219416C
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 13:50:13 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2dc242a79beso73872627b3.8
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 13:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RugAVh3UxY4wxouftMk7HSkCKZXxSMxitrpzMJUbDGw=;
        b=yumWmESADJuFPPmH+EtMDxkbnBz3MrLfSXwMRNgdxayrVqgqXQjF+dFfpG09SB8AgZ
         Vt2seFJlz7xwGqzYUlfnyY09fgqq2EqR4V0HqvkvxQKQT8tD4FWh+pBf3odrlgvCIwcY
         dayBgw0BltAr1ix3kX0FiKz9v92+vM77KpWar3Jne6OJxNSR/2NvyPHjJ8VhbFXQYY8n
         rkh9DcU+fIx9EiFqffBVlKtQMoXQc0CNPbH/qSzX+yl7S8TMaDSZw4+sp5tk1Xxxxr1z
         2MRxRyl6Ib0CCQrWM46LdlUUrgLAF4JYHEuiIEAwbvwPx5Yu8SyUzTB7nFGeZnDciiIO
         n3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RugAVh3UxY4wxouftMk7HSkCKZXxSMxitrpzMJUbDGw=;
        b=SgKz3HFdZTGkh3sBPjMEm21I8uaHWcIs2PEllhW8JssJCVjFvSqCwg0ZhCF8rrI7Pr
         hdrUqUF4ymZxtNygXkNbV/03uXLY5v2tttoWVCrLgo+DrWjpQ9uhUziUe+vLrHm3Upig
         +ZhulsrUAiHlXpKCiqnqTOciqeK6NRxS2vUgRR/KZL8Qbd3d94sGZuiSl1mouYvUGrQU
         xVLEP7uZVC0rsFv/4+7BI8yKU+fc4DYqaD2N3MiU/8wpiOHx6IEQB4xhF3wSmdopyZJk
         F6GaEs6p72MHdfP5LgoGMg39lDfeIs+CgJ+dCuYttBy2rkn1f61kG6p+ALVhXML0/pnJ
         mcgg==
X-Gm-Message-State: AOAM530F9/oIFjmY2OfwDPo8VR3aYBx2oTt4NhH/vS66zoYexV6uYbhF
        98jbiMsss7Oe9UzsPRIAe0ABlZ8iuVkaxZo3aDyNPA==
X-Google-Smtp-Source: ABdhPJy+ZRYKSMj0R6GUYoyQw0PK9dinkwFaI6DzHdB9OxXJb0bgmX5v2PdS8AZp7tYTIlZYBPGLeMwmY8a9EeZwX64=
X-Received: by 2002:a81:2f12:0:b0:2d7:d366:164a with SMTP id
 v18-20020a812f12000000b002d7d366164amr5982945ywv.265.1646949013038; Thu, 10
 Mar 2022 13:50:13 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXEFZVeWLaRQJmwO+Nn6uW4q6vXJOaNNTVKju1p2bMQksA@mail.gmail.com>
 <YijCkHHhpleeADAO@shell.armlinux.org.uk> <CA+G9fYtjrAMg8TykZdRyZEfRthyqom_73x87F-60C_QFeEL8Bg@mail.gmail.com>
 <YijfzAhWAgfGGqCO@shell.armlinux.org.uk> <CAMj1kXFvjawvOzeTb2m1H=P-_aXgW-ozvaOK1FtjBv7G0sCDFA@mail.gmail.com>
 <Yij2cZVKwPexGsTf@shell.armlinux.org.uk> <CAMj1kXE02HH7vRUjF3iKAL+1idKTy-oOYyGnBd3g90m6eObBxg@mail.gmail.com>
 <YikByJteDEtKi4Xv@shell.armlinux.org.uk> <CAMj1kXGnwbe=YYWaRxaXioEfTJOdXg9JYcNddO8iifpWLRZCWg@mail.gmail.com>
 <Yinwq3Z9l0selLLS@shell.armlinux.org.uk> <Yin2jQqW+pUWJZ7E@shell.armlinux.org.uk>
 <CAMj1kXGkUJ=-4oA4GvBZNK94A1MrZ7UwKDN_tJRgwq8KF06VmA@mail.gmail.com>
 <CA+G9fYvEANOMekjvtu7agdVYQ_b8OMtxQdyAV2JT_vMdBU3VRA@mail.gmail.com> <CAMj1kXEVVZTKX_86bbTfLpFuDriV0-uwCMgSKDP+dzcD1L4XCw@mail.gmail.com>
In-Reply-To: <CAMj1kXEVVZTKX_86bbTfLpFuDriV0-uwCMgSKDP+dzcD1L4XCw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 11 Mar 2022 03:20:02 +0530
Message-ID: <CA+G9fYuO-sy+sZnhSz=A7Xm0LdSp2AT+7jCKLB33tZzK4izj3g@mail.gmail.com>
Subject: Re: [next] arm: Internal error: Oops: 5 PC is at __read_once_word_nocheck
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 11 Mar 2022 at 02:55, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 10 Mar 2022 at 22:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Hi Ard and Russell,
> >
> > The boot test pass on linux next-20220310 tag with  KASAN=y on BeagleBoard x15
> > device. but LTP cve tests reproduced the reported kernel crash  [1].
> > From the available historical data I can confirm that this is an
> > intermittent issue on
> > BeagleBoard x15 devices.
> >
> > OTOH, the kernel crash is always reproducible on qemu-arm with KASAN=y
> > while booting which has been known to fail for a long time.
> >
> > From the Ardb tree I have boot tested qemu-arm with KASAN=y the reported
> > kernel crash is always reproducible.
> >
> > The build steps [3] and extra Kconfigs.
> >
> > - Naresh
> > [1] https://lkft.validation.linaro.org/scheduler/job/4701310
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/
> > [3] https://builds.tuxbuild.com/2661dIAPUjE2DMJvye91He2gus0/tuxmake_reproducer.sh
>
> Thanks Naresh. I'm having trouble to make sense of this, though. The
> linked output log appears to be from a build that lacks my 'ARM:
> entry: fix unwinder problems caused by IRQ stacks' patch, as it
> doesn't show any occurrences of call_with_stack() on any of the call
> stacks.
>
> Do you have a link to the vmlinux and zImage files for this build?

Yes.

vmlinux.xz:  https://builds.tuxbuild.com/26BmIasJnAyCii0SkgbKarkF369/vmlinux.xz
zImage: https://builds.tuxbuild.com/26BmIasJnAyCii0SkgbKarkF369/zImage
System.map: https://builds.tuxbuild.com/26BmIasJnAyCii0SkgbKarkF369/System.map
Build log: https://builds.tuxbuild.com/26BmIasJnAyCii0SkgbKarkF369/

- Naresh
