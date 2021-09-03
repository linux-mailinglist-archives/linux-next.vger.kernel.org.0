Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE9D3FFAE9
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 09:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347649AbhICHSj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 03:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234713AbhICHSj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Sep 2021 03:18:39 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E4DC061757
        for <linux-next@vger.kernel.org>; Fri,  3 Sep 2021 00:17:39 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id f2so8187589ljn.1
        for <linux-next@vger.kernel.org>; Fri, 03 Sep 2021 00:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fBPFZDdudXT9nLyNa5jIhm1InOCc+X/nullyt3ssKfA=;
        b=HMYZWGRVfbuPlEk2Fi9n+aluSUDZFov3xnXvw3NkJsZxgQOhzS4UEfd6AmNC0MjomZ
         pVetIl95zkIc+acmuL7xJ2uCWVrE0Fi/S3Yrz96OQIXepcuHzo3SJlV+C+D/8YY36ObQ
         2czD+fZyOqbil310sVL6vVE/l8pi1r2EzZTfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fBPFZDdudXT9nLyNa5jIhm1InOCc+X/nullyt3ssKfA=;
        b=nO6HmJDbr4lanbtTeJ3qehFM3fY8IFaT/XdqNIMTztLdbtY694zA2ahVQ2GhkND4mi
         hH7OR2P4j1eCJ+UXWMIpMX9Ne27FFqOhsWgcK+5qFwQIY1K52KObiTpDa3uICax2UMhO
         Ju197CuGPvC4RpVURlK6Qg9oEyTumTLmuoaxJqqHcWqzD6E7DDT55yYgtQhBItS85Dr+
         QHu/bznRTy0Ce54ZWYVizLo32XuU9iS6GJR1R5m/nxWNUjnFFjuu21rjHl97GMrfNefS
         oLfkGhDb59I5tYtb9NInTFrNWu5BrtVXroz7CCBiDCizroAOPudJmkNShnN/07PCgGWU
         QFiQ==
X-Gm-Message-State: AOAM530WK9cKezYDjRcW29rcyIbbzC0BkQu9IYciIHd6Wal6cpF6dwYJ
        mKhTGf/IWsEfcU+zLeHdL1cbynRu+BKs6l1VB/VMdA==
X-Google-Smtp-Source: ABdhPJwyAjvWIoz2kJco/SwHAa7+pc3/F79fMs0FabkcA/zUxzsCRz+0c0N+gXIasHWNuy2ARRrVSBISK69nnDE5/mw=
X-Received: by 2002:a05:651c:211a:: with SMTP id a26mr1840127ljq.305.1630653457485;
 Fri, 03 Sep 2021 00:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181740.3a0a69f2@canb.auug.org.au> <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
 <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
 <CAMuHMdXVxNfQYwP7+iMq+CbuDx3wjHgG2xsr9jP4WwL4OLLL-Q@mail.gmail.com>
 <43d231a765a2106b6ef0cbbe842ba3ec37b45878.camel@mediatek.com>
 <CAGXv+5HPCUBziGoW9gbtHYGvF9_Pt6JPAFY2CuX05jOnoQUcnw@mail.gmail.com> <13a16d4b47d4cb36061add729eca6c35ad84c814.camel@mediatek.com>
In-Reply-To: <13a16d4b47d4cb36061add729eca6c35ad84c814.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Sep 2021 15:17:26 +0800
Message-ID: <CAGXv+5E-BtTea=V6nQTHtHMYwA_-FeD=yLgEohS7AzEsaOCqZg@mail.gmail.com>
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

On Fri, Sep 3, 2021 at 3:05 PM Trevor Wu <trevor.wu@mediatek.com> wrote:
>
> On Thu, 2021-09-02 at 17:15 +0800, Chen-Yu Tsai wrote:
> > On Thu, Sep 2, 2021 at 4:52 PM Trevor Wu <trevor.wu@mediatek.com>
> > wrote:
> > >
> > > On Thu, 2021-09-02 at 10:22 +0200, Geert Uytterhoeven wrote:
> > > > Hi Trevor,
> > > >
> > > > On Thu, Sep 2, 2021 at 4:37 AM Trevor Wu <trevor.wu@mediatek.com>
> > > > wrote:
> > > > > On Wed, 2021-09-01 at 13:55 -0700, Randy Dunlap wrote:
> > > > > > On 9/1/21 1:17 AM, Stephen Rothwell wrote:
> > > > > > > Please do not add any v5.16 related code to your linux-next
> > > > > > > included
> > > > > > > branches until after v5.15-rc1 has been released.
> > > > > > >
> > > > > > > Changes since 20210831:
> > > > > > >
> > > > > >
> > > > > >
> > > > > > on x86_64:
> > > > > >
> > > > > > ERROR: modpost: "clkdev_add" [sound/soc/mediatek/mt8195/snd-
> > > > > > soc-
> > > > > > mt8195-afe.ko] undefined!
> > > > > > ERROR: modpost: "clkdev_drop" [sound/soc/mediatek/mt8195/snd-
> > > > > > soc-
> > > > > > mt8195-afe.ko] undefined!
> > > > > > ERROR: modpost: "clk_unregister_gate"
> > > > > > [sound/soc/mediatek/mt8195/snd-
> > > > > > soc-mt8195-afe.ko] undefined!
> > > > > > ERROR: modpost: "clk_register_gate"
> > > > > > [sound/soc/mediatek/mt8195/snd-
> > > > > > soc-mt8195-afe.ko] undefined!
> > > > > >
> > > > > > Full randconfig file is attached.
> > > > > >
> > > > >
> > > > > Hi Randy,
> > > > >
> > > > > The problem is caused by the dependency declaration, because
> > > > > it's
> > > > > not a
> > > > > driver for x86_64.
> > > > > The dependency declaration has been added in the following
> > > > > patch.
> > > > >
> > > > >
> > >
> > >
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/alsa-devel/patch/7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert*renesas@glider.be/__;Kw!!CTRNKA9wMg0ARbw!wMq130mAo-s45pP6ShQ1S8UIRuJLhwOnCbQNAQHIE2zvNhjAd67h1rlqkIDxJvC5_g$
> > > > >
> > > >
> > > > That is not sufficient, if COMPILE_TEST is enabled.
> > > >
> > > > Looks like it needs a dependency on COMMON_CLK, too.
> > > >
> > > > Gr{oetje,eeting}s,
> > > >
> > > >                         Geert
> > > >
> > >
> > > Hi Geert,
> > >
> > > Because it's a ARM64 driver, ARM64 will select COMMON_CLK.
> > > It seems that some dependency should be checked if COMPILE_TEST is
> > > enabled and the driver is compiled on non-ARM64 environment.
> > > We don't expect the driver can be used on non-ARM64 environment,may
> > > I
> > > remove COMPILE_TEST to solve the problem?
> > > If the driver only depends on ARCH_MEDIATEK, it must be compiled on
> > > ARM64.
> >
> > The whole point of COMPILE_TEST is that it gets compile-tested. It
> > doesn't
> > have to actually run.
> >
> > Since the driver is using parts of the common clk framework, it
> > should
> > declare an explicit dependency, instead of implicitly depending on
> > other symbols to enable it.
> >
> > ChenYu
>
> Hi ChenYu,
>
> Got it. I will send a patch for the problem.

I believe the background for this is that the kernel gets tested the most
on x86, even for build tests. We want code to get tested more, especially
for API changes for which the authors most likely do not have hardware
to test all combinations.

ChenYu
