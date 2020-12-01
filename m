Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219F92CA0E6
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgLALFl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 06:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730421AbgLALFl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 06:05:41 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B2EC0613CF;
        Tue,  1 Dec 2020 03:05:00 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id f16so1223015otl.11;
        Tue, 01 Dec 2020 03:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TOJPFDAki2IagrZHYtumbypS6zIINz1kZxu7dIlDd8k=;
        b=DR/xVklxZTgSTwXCPKUL5s5vUA7EIEP1oEQjFufUjLzskiHuGN2C+9zIM8jP4NsVfd
         f1CE57lNq3OGWh0wpBEDYyianBB6Jp+zLAP9/E/fplxL8QTGpx9Qnb1FAjmS35BUlNrJ
         KKkYFsI/ZpU4zW6xg0ueY7FV1E/mCqAZg1lRBQY24Zzz6tgG7Sd7q+Xt23J+Sko3a3cY
         Wpw8cIHzz1DMS6G1WjFBXR4JX2TVWXyuQQFkyHFqUZlZJUl7X+FBTuTPEAqzpvSCjMcC
         pqMNsjHLp9ERV3IrHa9SA0coJMImVtfGO1bl5vGFE8pOAmuLk5+S5k7HPNmHm71IxZ3l
         oKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TOJPFDAki2IagrZHYtumbypS6zIINz1kZxu7dIlDd8k=;
        b=J3uNDD8EmvGc9MWMoBw5i6DVukvJJVz3ltGbwESieb7JmZZVhKFfJpPH/Tou4xsgvS
         kn2EUcf3LFmzwRHXw4gZM/VPHqGQtG9l3g/r4X7jjmyjsTYbWOYyYk03jZJn346kr4/H
         G1UevKU/fbyftaS2OiX7pkmd0GDLjnlZJsEMbawb38Dy+EZ0prFwhqx/IglWywypDLQh
         KE5OcXLriqQsI/Mgal3Ev+PINYsYLN49LprS+ct3JKCAZL/ZpLhKgOi+z+Iyi9C+me3+
         xkGf3HS0+6FiiwnHRC/xoo0l2bODZ9+0IYUH/qq3DhFUl1mHYx3jGKMGrKMFLzf6u41h
         QJoQ==
X-Gm-Message-State: AOAM530ZB24GnJIgTTDLiDT0gIuPid/yIZQRlB9AcqrzjrLxO32j5Yvy
        P9vANsq+v4AnSTNO5XiWaYr1FrV5MHQ3USY7t5o=
X-Google-Smtp-Source: ABdhPJx/pyF2XH2lI8F9xW4x6avGG/l6MZIAYLzyZI2hDUrGDDdeD6wlJZqDG9/gWoOzzKGEq/46swI6PEUFsfzv9nw=
X-Received: by 2002:a05:6830:160d:: with SMTP id g13mr1471474otr.74.1606820700328;
 Tue, 01 Dec 2020 03:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
 <20201201101612.28458-2-sergio.paracuellos@gmail.com> <20201201104246.GA8403@vkoul-mobl>
 <CAMhs-H_9MTZvC+NkFm28MuiRQ0tpNw7gd97sN9dBgsqYD7_1LA@mail.gmail.com> <20201201110245.GB8403@vkoul-mobl>
In-Reply-To: <20201201110245.GB8403@vkoul-mobl>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 1 Dec 2020 12:04:49 +0100
Message-ID: <CAMhs-H_HhDp1_h3Zc4W+Wga9hTxJs4YSybzN7Xu_BeXWx3AxsA@mail.gmail.com>
Subject: Re: [PATCH 1/3] phy: ralink: phy-mt7621-pci: add include search path
 in Makefile
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Vinod,

On Tue, Dec 1, 2020 at 12:02 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 01-12-20, 11:47, Sergio Paracuellos wrote:
> > Hi Vinod,
> >
> > On Tue, Dec 1, 2020 at 11:42 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > On 01-12-20, 11:16, Sergio Paracuellos wrote:
> > > > This driver includes the following two files directly:
> > > > - mt7621.h
> > > > - ralink_regs.h
> > > >
> > > > Compilation for its related platform properly works because
> > > > its real path is included in 'arch/mips/ralink/Platform' as
> > > > cflags.
> > > >
> > > > This driver depends on RALINK but also is enabled for COMPILE_TEST
> > > > where nothing about its platform is known and this directly
> > > > included files are not found at all breaking compilation.
> > > >
> > > > Fix this problem adding include search path for ralink in
> > > > ralink phy directory Makefile.
> > > >
> > > > Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
> > >
> > > Pls add reported-by sfr..
> >
> > Ok, Will change this and send v2.
> >
> > >
> > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > ---
> > > >  drivers/phy/ralink/Makefile | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/phy/ralink/Makefile b/drivers/phy/ralink/Makefile
> > > > index cda2a4a7ca5e..c8f9adba0d82 100644
> > > > --- a/drivers/phy/ralink/Makefile
> > > > +++ b/drivers/phy/ralink/Makefile
> > > > @@ -1,3 +1,6 @@
> > > >  # SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +ccflags-y    += -I$(srctree)/arch/mips/include/asm/mach-ralink
> > >
> > > Can we include <asm/mips/...> instead of using this?
> >
> > Doing that also fails because path for 'arch/mips/include' is not
> > added also because we are compiling in x86_64.
> > Looking into other drivers I see the way to avoid this kind of
> > platform specific stuff is adding related paths in
> > cflags. So I don't really know if there is another way.
>
> Right, ideally these headers should have been in include/linux, but.. I
> dont like this way, can we drop compile test..?

Ok, will drop it then and resend.

Thanks,
    Sergio Paracuellos
>
> --
> ~Vinod
