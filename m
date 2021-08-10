Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA183E59B4
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 14:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240426AbhHJMNk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 10 Aug 2021 08:13:40 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:36591 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240385AbhHJMNk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 08:13:40 -0400
Received: by mail-ua1-f53.google.com with SMTP id v3so8463509uau.3;
        Tue, 10 Aug 2021 05:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fLj82slZXz/iYkfqnFTc5Yp76dViJebG6AniQ5dEgiU=;
        b=h9nOzXeoFaONdDj0YPPP2GHqwDbaPZSWRKJzAD7RCFlimtT7Up2jlJsmsoozAhuHJ8
         pEod5I2BEXgRFeM/3aHajXwmlFvaTDxrCnZrE6Eybz1Hkrc+TQW8D4zeL5zGYHRJ1yx2
         cLOeoHvliw/dmF+VUbbGJ69bzPIP8cEf3DMqNp7UuqMknhbGxFVoPdEy6HYDMbZALV8B
         T82yvF58hrNTsTw76fvqNTi0XpKx6AcZSKN9ptKdTP2GbMeEvrAXGnYZ1HT5/DvNa82B
         NY+J+ZRH9Al8Be50PkY5EFnmMtWwZnXvlmcZM/x3iQYoq86jeank7KVpAgVLOgIzcmTH
         Jiuw==
X-Gm-Message-State: AOAM5318SfV0MM7Mx26d8BN1H9DEak0RAxEkq0B68W2sya5w8AjE3zaK
        VO3cSjFEcjemQq6kNoeCemVvopq2CxdLqInWvWRF0PkILJP0/A==
X-Google-Smtp-Source: ABdhPJyQFTass/VoSbVTqzkWApbaXk9OOVu3k1ggWU0/EnRo0tdvOkP+djRBqu26XX64MRXe4AnkujkFVBV5MuxWZJ4=
X-Received: by 2002:a9f:31ad:: with SMTP id v42mr7648477uad.58.1628597597982;
 Tue, 10 Aug 2021 05:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210723150944.528c10af@canb.auug.org.au> <20210723053418.fizdbfnu4if2hs5x@pengutronix.de>
In-Reply-To: <20210723053418.fizdbfnu4if2hs5x@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 14:13:06 +0200
Message-ID: <CAMuHMdUCWdys_Xgh0wSuUX9coNFEics6rwnRWrx8f=OW0AYHEA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 23, 2021 at 7:35 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> On Fri, Jul 23, 2021 at 03:09:44PM +1000, Stephen Rothwell wrote:
> > After merging the driver-core tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > drivers/gpu/drm/drm_dp_aux_bus.c:106:13: error: initialization of 'void (*)(struct device *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
> >   106 |  .remove  = dp_aux_ep_remove,
> >       |             ^~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_dp_aux_bus.c:106:13: note: (near initialization for 'dp_aux_bus_type.remove')
> >
> > Caused by commit
> >
> >   aeb33699fc2c ("drm: Introduce the DP AUX bus")
> >
> > from the drm tree interacting with commit
> >
> >   fc7a6209d571 ("bus: Make remove callback return void")
> >
> > from the driver-core tree.
> >
> > I applied the following merge fix patch.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 23 Jul 2021 14:58:25 +1000
> > Subject: [PATCH] fix for "drm: Introduce the DP AUX bus"
> >
> > interaction with "bus: Make remove callback return void"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/drm_dp_aux_bus.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_aux_bus.c b/drivers/gpu/drm/drm_dp_aux_bus.c
> > index e49a70f3691b..298ea7a49591 100644
> > --- a/drivers/gpu/drm/drm_dp_aux_bus.c
> > +++ b/drivers/gpu/drm/drm_dp_aux_bus.c
> > @@ -67,9 +67,8 @@ static int dp_aux_ep_probe(struct device *dev)
> >   *
> >   * Calls through to the endpoint driver remove.
> >   *
> > - * Return: 0 if no error or negative error code.
> >   */
> > -static int dp_aux_ep_remove(struct device *dev)
> > +static void dp_aux_ep_remove(struct device *dev)
> >  {
> >       struct dp_aux_ep_driver *aux_ep_drv = to_dp_aux_ep_drv(dev->driver);
> >       struct dp_aux_ep_device *aux_ep = to_dp_aux_ep_dev(dev);
> > @@ -77,8 +76,6 @@ static int dp_aux_ep_remove(struct device *dev)
> >       if (aux_ep_drv->remove)
> >               aux_ep_drv->remove(aux_ep);
> >       dev_pm_domain_detach(dev, true);
> > -
> > -     return 0;
> >  }
>
> This looks right.
>
> Greg provided a tag containing fc7a6209d571 ("bus: Make remove callback
> return void") at
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/bus_remove_return_void-5.15
>
> (see https://lore.kernel.org/lkml/YPkwQwf0dUKnGA7L@kroah.com).
>
> It would be great if this could be merged into the drm tree with the
> above diff squashed into the merge commit.

+1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
