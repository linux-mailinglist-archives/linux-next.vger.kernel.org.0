Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8346434C4DA
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 09:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhC2HZa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 03:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbhC2HZY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 03:25:24 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27C9C061574
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 00:25:19 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id f19so1102156vsl.10
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 00:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4zdRzaWEuScCxUZNvADZ4Dib7S9ZHh3RpkYP8ExLQq8=;
        b=ShRf0xxq50mTHYGrh9xmu9l8UaDjOjMpAOpvWXq5Z2E9qGUk5HKG0yD/nroyUlIJ3L
         fvsEr7iBEq2uglhoZ7d4VauZu0hAxljU25kUDf5oJLFSE/I5KIdNZkOu24JZqMCxJOIA
         yE4Zr1MklDaBQFTN5GywoGecsAOU9tQsQcj825cZho9Nr5vkCMYLSfofe5blNBLbxepT
         0h6t4ztL/97Ulx7fzKiQLp5I/gny4ofI/X7yb35r47NLkKsuTej1AWli0dxwD/PeKvHv
         6GDpl22TUmbr2Bj67Tx1WexepjuQoaSb34MYPiuk4TEnWGpbQ+Ljr8pMNVNcfYA3IP5X
         eygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4zdRzaWEuScCxUZNvADZ4Dib7S9ZHh3RpkYP8ExLQq8=;
        b=dP5lthOmsU7akp894D2UgSRZFmYuU5VD7PQUMjdGRwll9gl+qhNHFZimikM/64PrSO
         K2f1xiGD7JOrqe840Lilmo1JfTQ4XXboVVzhZ17jQY9VOz6Ls8seblimnneIoWPRGX+U
         VJk/S57NslEbIlem2f78nHVu1yIyV+c6OYD28vci+YrDgyfxhgDMQ1QC+r2UCwkI1Q5l
         gEDNtHoU+R2z6q/TorE0XRMZM7yMFlq3tCw8Kxq426b63oB/RoAHKxpONsGBniW/zv9F
         RtWif1nNv2xSdrg9blbAd6bvjw01SJ/ECqsUBBoPmVUozizS6a47+4cDOkaunQ0OUJ7w
         0m3A==
X-Gm-Message-State: AOAM531XWpqPa1rceLIpsIBxQ3FmXVnZCKPk6Nuio659HXfXEqIX8Fy5
        KIvJ8RlZRkcuh5/Y4v7DBfJDR6pNwhv3AZAaZFl6fg==
X-Google-Smtp-Source: ABdhPJymWMQk5svSmDMu6V2U4rABI7ob9eG2P1+8TQaRG+orYiJKy2lli1R8836VaypGo1zGwtisVj+htjpwsTuRDg0=
X-Received: by 2002:a67:b918:: with SMTP id q24mr10719649vsn.19.1617002718899;
 Mon, 29 Mar 2021 00:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210329165525.32d51a3a@canb.auug.org.au> <YGFwWq//sh6onrUH@kroah.com>
In-Reply-To: <YGFwWq//sh6onrUH@kroah.com>
From:   Alexandru Ardelean <aardelean@deviqon.com>
Date:   Mon, 29 Mar 2021 10:25:06 +0300
Message-ID: <CAASAkoZgn1WJ377164yjp2UEvp4fMUezsf2=WsHs5wtRj1inMA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the staging tree
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 29 Mar 2021 at 09:15, Greg KH <greg@kroah.com> wrote:
>
> On Mon, Mar 29, 2021 at 04:55:25PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the staging tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_read_reg':
> > drivers/iio/adc/ti-ads131e08.c:180:5: error: 'struct spi_transfer' has no member named 'delay_usecs'
> >   180 |    .delay_usecs = st->sdecode_delay_us,
> >       |     ^~~~~~~~~~~
> > drivers/iio/adc/ti-ads131e08.c: In function 'ads131e08_write_reg':
> > drivers/iio/adc/ti-ads131e08.c:206:5: error: 'struct spi_transfer' has no member named 'delay_usecs'
> >   206 |    .delay_usecs = st->sdecode_delay_us,
> >       |     ^~~~~~~~~~~
> >
> > Caused by commit
> >
> >   d935eddd2799 ("iio: adc: Add driver for Texas Instruments ADS131E0x ADC family")
> >
> > interacting with commit
> >
> >   3ab1cce55337 ("spi: core: remove 'delay_usecs' field from spi_transfer")
> >
> > from the spi tree.
> >
> > I have applied the following merge fix patch.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 29 Mar 2021 16:51:22 +1100
> > Subject: [PATCH] iio: adc: merge fix for "spi: core: remove 'delay_usecs'
> >  field from spi_transfer"
> >

Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>

> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/iio/adc/ti-ads131e08.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iio/adc/ti-ads131e08.c b/drivers/iio/adc/ti-ads131e08.c
> > index 0060d5f0abb0..764dab087b41 100644
> > --- a/drivers/iio/adc/ti-ads131e08.c
> > +++ b/drivers/iio/adc/ti-ads131e08.c
> > @@ -177,7 +177,10 @@ static int ads131e08_read_reg(struct ads131e08_state *st, u8 reg)
> >               {
> >                       .tx_buf = &st->tx_buf,
> >                       .len = 2,
> > -                     .delay_usecs = st->sdecode_delay_us,
> > +                     .delay = {
> > +                             .value = st->sdecode_delay_us,
> > +                             .unit = SPI_DELAY_UNIT_USECS,
> > +                     },
> >               }, {
> >                       .rx_buf = &st->rx_buf,
> >                       .len = 1,
> > @@ -203,7 +206,10 @@ static int ads131e08_write_reg(struct ads131e08_state *st, u8 reg, u8 value)
> >               {
> >                       .tx_buf = &st->tx_buf,
> >                       .len = 3,
> > -                     .delay_usecs = st->sdecode_delay_us,
> > +                     .delay = {
> > +                             .value = st->sdecode_delay_us,
> > +                             .unit = SPI_DELAY_UNIT_USECS,
> > +                     },
> >               }
> >       };
> >
> > --
> > 2.30.0
> >
>
> Thanks for the fix, looks correct to me.
>
> greg k-h
