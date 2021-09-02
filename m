Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD8E3FEAFD
	for <lists+linux-next@lfdr.de>; Thu,  2 Sep 2021 11:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244843AbhIBJQS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Sep 2021 05:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbhIBJQR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Sep 2021 05:16:17 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE96C061575
        for <linux-next@vger.kernel.org>; Thu,  2 Sep 2021 02:15:19 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id p15so2305200ljn.3
        for <linux-next@vger.kernel.org>; Thu, 02 Sep 2021 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b7w0R6VDMHv6UT6JVPqf/kPPNWm6Bp4/tXYIQLznWTU=;
        b=k1YBKmWEwL6N9mTcLBnnh9GXkTMM6CzZR88O0IWOtw1nWLcAZ73gDLxqtcTBWTtiyB
         qbhxJjU4nHODlJYbvWegWLmzBsHnWZrVEjLUO0RbEmuHzI8C4gwPuYD5ak6btJdmnDGo
         GKRyY3efJIqpC1MF3zaxCuTZ1MJEfK2DGCpdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b7w0R6VDMHv6UT6JVPqf/kPPNWm6Bp4/tXYIQLznWTU=;
        b=O0gOHk2nJDu55jcYIp5T0A0QZetLczmDAg5YcIAAmveTfTKQA8rsDSlDMRS0oIgV0t
         ARPkVCBvlfitUE1cQXYweYFhfi03bDPiSkJxJ1cEC7xq4GFEHwa3ooA2n6/cSJSXc/P3
         ZRbo8zmb8v5ZzYSBw1fr36EAmlOKQCS4uvQ81tsRidteVY97ADrxzDUdqNTfoV4gDjh5
         K6m7jN+D341K7y+cSAGTyRGMwq+OXjRgEHgJT29PWAqJt6y6Ro6NnLpDOsZwHu/9WIOg
         LYM4f1t5Sf1u5+00LHBTgZ7eBUwvSJYwxzsJ070n5n3soVevtDye8aKyqFNzssD4aicq
         CsAQ==
X-Gm-Message-State: AOAM530pNu1loANWtNrM9h5+aZ40aQXDb56Fv8K1lu6SrGuzLC10qBFV
        mUG3WB6JnCT4q95oAVTt7fs3pXANEgUk+DCdYZ4H5mvn+4g=
X-Google-Smtp-Source: ABdhPJwVjOpDQBYigzY6w6VwefwZ+wyf8d0BezP9x8Aknsr+qgTjHr7dO/m7wLJWzzH4RENiT2Uh7fAV4c8H0EpokpU=
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr1736095ljm.18.1630574117548;
 Thu, 02 Sep 2021 02:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181740.3a0a69f2@canb.auug.org.au> <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
 <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
 <CAMuHMdXVxNfQYwP7+iMq+CbuDx3wjHgG2xsr9jP4WwL4OLLL-Q@mail.gmail.com> <43d231a765a2106b6ef0cbbe842ba3ec37b45878.camel@mediatek.com>
In-Reply-To: <43d231a765a2106b6ef0cbbe842ba3ec37b45878.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 2 Sep 2021 17:15:06 +0800
Message-ID: <CAGXv+5HPCUBziGoW9gbtHYGvF9_Pt6JPAFY2CuX05jOnoQUcnw@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 1 [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko]
To:     Trevor Wu <trevor.wu@mediatek.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Bicycle Tsai <bicycle.tsai@mediatek.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 2, 2021 at 4:52 PM Trevor Wu <trevor.wu@mediatek.com> wrote:
>
> On Thu, 2021-09-02 at 10:22 +0200, Geert Uytterhoeven wrote:
> > Hi Trevor,
> >
> > On Thu, Sep 2, 2021 at 4:37 AM Trevor Wu <trevor.wu@mediatek.com>
> > wrote:
> > > On Wed, 2021-09-01 at 13:55 -0700, Randy Dunlap wrote:
> > > > On 9/1/21 1:17 AM, Stephen Rothwell wrote:
> > > > > Please do not add any v5.16 related code to your linux-next
> > > > > included
> > > > > branches until after v5.15-rc1 has been released.
> > > > >
> > > > > Changes since 20210831:
> > > > >
> > > >
> > > >
> > > > on x86_64:
> > > >
> > > > ERROR: modpost: "clkdev_add" [sound/soc/mediatek/mt8195/snd-soc-
> > > > mt8195-afe.ko] undefined!
> > > > ERROR: modpost: "clkdev_drop" [sound/soc/mediatek/mt8195/snd-soc-
> > > > mt8195-afe.ko] undefined!
> > > > ERROR: modpost: "clk_unregister_gate"
> > > > [sound/soc/mediatek/mt8195/snd-
> > > > soc-mt8195-afe.ko] undefined!
> > > > ERROR: modpost: "clk_register_gate"
> > > > [sound/soc/mediatek/mt8195/snd-
> > > > soc-mt8195-afe.ko] undefined!
> > > >
> > > > Full randconfig file is attached.
> > > >
> > >
> > > Hi Randy,
> > >
> > > The problem is caused by the dependency declaration, because it's
> > > not a
> > > driver for x86_64.
> > > The dependency declaration has been added in the following patch.
> > >
> > >
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/alsa-devel/patch/7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert*renesas@glider.be/__;Kw!!CTRNKA9wMg0ARbw!wMq130mAo-s45pP6ShQ1S8UIRuJLhwOnCbQNAQHIE2zvNhjAd67h1rlqkIDxJvC5_g$
> > >
> >
> > That is not sufficient, if COMPILE_TEST is enabled.
> >
> > Looks like it needs a dependency on COMMON_CLK, too.
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
>
> Hi Geert,
>
> Because it's a ARM64 driver, ARM64 will select COMMON_CLK.
> It seems that some dependency should be checked if COMPILE_TEST is
> enabled and the driver is compiled on non-ARM64 environment.
> We don't expect the driver can be used on non-ARM64 environment,may I
> remove COMPILE_TEST to solve the problem?
> If the driver only depends on ARCH_MEDIATEK, it must be compiled on
> ARM64.

The whole point of COMPILE_TEST is that it gets compile-tested. It doesn't
have to actually run.

Since the driver is using parts of the common clk framework, it should
declare an explicit dependency, instead of implicitly depending on
other symbols to enable it.

ChenYu
