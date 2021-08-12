Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2783EAC1C
	for <lists+linux-next@lfdr.de>; Thu, 12 Aug 2021 22:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233400AbhHLUvz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 16:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbhHLUvw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Aug 2021 16:51:52 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F559C061756
        for <linux-next@vger.kernel.org>; Thu, 12 Aug 2021 13:51:27 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id 188so10239675ioa.8
        for <linux-next@vger.kernel.org>; Thu, 12 Aug 2021 13:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3ZW1F160xjgvVTZH6mN2PNrOraONDIFvuUTyJLurpfM=;
        b=mcBwEpGRXaT0MgQ7pqa8NiL7Eb3vyTjw2YOg+6dGn9Dme8SMPucCFOd+dRZqUifC/R
         d2+8wvhoNy3C2lGIE26gMla0F0ENG43CwsQYhufGzIw+yHP05VNXyeyJW2B2NF9judO4
         QNjkeLLrZ65wZuclJ+lnOHSUMDMPB1yLDzu1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3ZW1F160xjgvVTZH6mN2PNrOraONDIFvuUTyJLurpfM=;
        b=Mw92yOKwFlOCVTcp90r5aOPJWKgAy73uiaATvT3OgZc9rhPfSALAVHGHNKNUD27nSn
         HX6VXSUpQzu2/PdCrxX8RCZbrfOheM4yPoxPhygfo1IaZkQGndwb6160EBAlDoAH9Zl3
         EY7+9oRmG+jun1NO3UTpzvFmejOkrxI00FLfNJ3E7lUsOHrAGbCzuqvJRKpzNPsOwssU
         Iep+S8iyTwqnAzh15B0fGqmt23CYLESVPRgvSMrsZLQ+0ODSQIOxuiDx84WgRgt/t4+f
         MEjgLHb+q2DtcRClhr6brTjCFA3VjH4U4XuLH95QK3/8F1Keq41FGQ58aI82z362z1dn
         KBNQ==
X-Gm-Message-State: AOAM5324UdxvrSUhmeo9gqxS1Xur5DvT6bPRX1rpxf2mPl4d8i+AmX7H
        U6n7cqLaD6+C3FCCUjkbXzHPCye8pwfjpA==
X-Google-Smtp-Source: ABdhPJwJScclCHjOw3145nDgxdeDsbQJelcyh+RLDvjkJzcHafFVJ2/bQTakUHtQwg9SzEBCCe5m1g==
X-Received: by 2002:a05:6602:25da:: with SMTP id d26mr4460029iop.106.1628801486323;
        Thu, 12 Aug 2021 13:51:26 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id m18sm1947358ilj.61.2021.08.12.13.51.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 13:51:25 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id 188so10239566ioa.8
        for <linux-next@vger.kernel.org>; Thu, 12 Aug 2021 13:51:25 -0700 (PDT)
X-Received: by 2002:a05:6602:713:: with SMTP id f19mr4618750iox.140.1628801484808;
 Thu, 12 Aug 2021 13:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210723150944.528c10af@canb.auug.org.au> <20210723053418.fizdbfnu4if2hs5x@pengutronix.de>
 <CAMuHMdUCWdys_Xgh0wSuUX9coNFEics6rwnRWrx8f=OW0AYHEA@mail.gmail.com>
In-Reply-To: <CAMuHMdUCWdys_Xgh0wSuUX9coNFEics6rwnRWrx8f=OW0AYHEA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Aug 2021 13:51:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WxwVQ5o3C8QkRe4BQwhQMimme1tX_2x-+Vw-BRm5D9jA@mail.gmail.com>
Message-ID: <CAD=FV=WxwVQ5o3C8QkRe4BQwhQMimme1tX_2x-+Vw-BRm5D9jA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Greg KH <greg@kroah.com>, Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Tue, Aug 10, 2021 at 5:13 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> On Fri, Jul 23, 2021 at 7:35 AM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Fri, Jul 23, 2021 at 03:09:44PM +1000, Stephen Rothwell wrote:
> > > After merging the driver-core tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >
> > > drivers/gpu/drm/drm_dp_aux_bus.c:106:13: error: initialization of 'vo=
id (*)(struct device *)' from incompatible pointer type 'int (*)(struct dev=
ice *)' [-Werror=3Dincompatible-pointer-types]
> > >   106 |  .remove  =3D dp_aux_ep_remove,
> > >       |             ^~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/drm_dp_aux_bus.c:106:13: note: (near initialization f=
or 'dp_aux_bus_type.remove')
> > >
> > > Caused by commit
> > >
> > >   aeb33699fc2c ("drm: Introduce the DP AUX bus")
> > >
> > > from the drm tree interacting with commit
> > >
> > >   fc7a6209d571 ("bus: Make remove callback return void")
> > >
> > > from the driver-core tree.
> > >
> > > I applied the following merge fix patch.
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Fri, 23 Jul 2021 14:58:25 +1000
> > > Subject: [PATCH] fix for "drm: Introduce the DP AUX bus"
> > >
> > > interaction with "bus: Make remove callback return void"
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/gpu/drm/drm_dp_aux_bus.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_dp_aux_bus.c b/drivers/gpu/drm/drm_d=
p_aux_bus.c
> > > index e49a70f3691b..298ea7a49591 100644
> > > --- a/drivers/gpu/drm/drm_dp_aux_bus.c
> > > +++ b/drivers/gpu/drm/drm_dp_aux_bus.c
> > > @@ -67,9 +67,8 @@ static int dp_aux_ep_probe(struct device *dev)
> > >   *
> > >   * Calls through to the endpoint driver remove.
> > >   *
> > > - * Return: 0 if no error or negative error code.
> > >   */
> > > -static int dp_aux_ep_remove(struct device *dev)
> > > +static void dp_aux_ep_remove(struct device *dev)
> > >  {
> > >       struct dp_aux_ep_driver *aux_ep_drv =3D to_dp_aux_ep_drv(dev->d=
river);
> > >       struct dp_aux_ep_device *aux_ep =3D to_dp_aux_ep_dev(dev);
> > > @@ -77,8 +76,6 @@ static int dp_aux_ep_remove(struct device *dev)
> > >       if (aux_ep_drv->remove)
> > >               aux_ep_drv->remove(aux_ep);
> > >       dev_pm_domain_detach(dev, true);
> > > -
> > > -     return 0;
> > >  }
> >
> > This looks right.
> >
> > Greg provided a tag containing fc7a6209d571 ("bus: Make remove callback
> > return void") at
> >
> >         git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-cor=
e.git tags/bus_remove_return_void-5.15
> >
> > (see https://lore.kernel.org/lkml/YPkwQwf0dUKnGA7L@kroah.com).
> >
> > It would be great if this could be merged into the drm tree with the
> > above diff squashed into the merge commit.
>
> +1.

I looked at trying to do this but I think it's beyond the scope of
privileges that I'm granted as a drm_misc committer (not a drm_misc
maintainer). Adding the official maintainers [1].
Maarten/Maxime/Thomas would this be something you could do?

[1] https://drm.pages.freedesktop.org/maintainer-tools/repositories.html

-Doug
