Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68AB3FEA8E
	for <lists+linux-next@lfdr.de>; Thu,  2 Sep 2021 10:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243655AbhIBIXv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Sep 2021 04:23:51 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:34662 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbhIBIXv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Sep 2021 04:23:51 -0400
Received: by mail-vs1-f53.google.com with SMTP id x137so785212vsx.1;
        Thu, 02 Sep 2021 01:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HNCpdSsGpy5YO2fKUf5jrX7dkYGtMSNaPXgN/Pc9hLg=;
        b=Vsh1tBGfKJn9Vng2n2zSCmoJDySRn5/YA5eD9TUcqQeCRdvIam52AhK0pTw2mlisKR
         BO0kFP079v7m0VsEIcpkNL5psI72av3i+fL8TmBeFbMfqDRml3lgBJRZNKV4LRNCMehT
         e2iXp2AsVKAxutgxOM7du1/3LaQ6sqDuBvm31QbE7p8Amj8Ip4Q2sEKyfCLOqhbbcSsI
         cCGTzdiO54FB3Kww7i37oxk+gxwAbcKO4nZ9gJLmm9pPGCiTvf1PyWp1SwGpPlPelIBw
         Nnya/wgJE66Yqu9XGWF3wYd8OXjoX97BWs6XIeIxs6JkLrwp5IdMTyEzalSLN8pjXMgz
         JRFw==
X-Gm-Message-State: AOAM531dOmKu3MVrjVJCAM/dgMzf4d8DoadAQrovB5iNArucQvTlzzjp
        dodIoZoJkiAkthT2GlRwkBR17AkeA69qjOFlx1o=
X-Google-Smtp-Source: ABdhPJyNJSOdmU3np2Afm9GG+piP6Z5QWWRSIHEGOqDNKIIMn+kfSujuXQrMi+smK4QAXyICbviEls6eGdpJ4fgr8OY=
X-Received: by 2002:a67:c789:: with SMTP id t9mr985119vsk.60.1630570972366;
 Thu, 02 Sep 2021 01:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181740.3a0a69f2@canb.auug.org.au> <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
 <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
In-Reply-To: <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Sep 2021 10:22:40 +0200
Message-ID: <CAMuHMdXVxNfQYwP7+iMq+CbuDx3wjHgG2xsr9jP4WwL4OLLL-Q@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 1 [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko]
To:     Trevor Wu <trevor.wu@mediatek.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bicycle Tsai <bicycle.tsai@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Trevor,

On Thu, Sep 2, 2021 at 4:37 AM Trevor Wu <trevor.wu@mediatek.com> wrote:
> On Wed, 2021-09-01 at 13:55 -0700, Randy Dunlap wrote:
> > On 9/1/21 1:17 AM, Stephen Rothwell wrote:
> > > Please do not add any v5.16 related code to your linux-next
> > > included
> > > branches until after v5.15-rc1 has been released.
> > >
> > > Changes since 20210831:
> > >
> >
> >
> > on x86_64:
> >
> > ERROR: modpost: "clkdev_add" [sound/soc/mediatek/mt8195/snd-soc-
> > mt8195-afe.ko] undefined!
> > ERROR: modpost: "clkdev_drop" [sound/soc/mediatek/mt8195/snd-soc-
> > mt8195-afe.ko] undefined!
> > ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-
> > soc-mt8195-afe.ko] undefined!
> > ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-
> > soc-mt8195-afe.ko] undefined!
> >
> > Full randconfig file is attached.
> >
>
> Hi Randy,
>
> The problem is caused by the dependency declaration, because it's not a
> driver for x86_64.
> The dependency declaration has been added in the following patch.
>
> https://patchwork.kernel.org/project/alsa-devel/patch/7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be/

That is not sufficient, if COMPILE_TEST is enabled.

Looks like it needs a dependency on COMMON_CLK, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
