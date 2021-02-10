Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3643171D5
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 22:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhBJVAW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 16:00:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:50990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231193AbhBJVAV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 16:00:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 194F764DE7;
        Wed, 10 Feb 2021 20:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612990779;
        bh=8UVcBcBHgwUxXmdgoCQ0LoimmZZgbh9qAu0ypgoozQM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=O/7DHup661kD7BHH5z8EHVcdfxNpadTFO7zBNfdUcfayg7KJcoNwsnei/VmtDu/ft
         1AS19f9C3h0nMWSbGTnpkesv0ACKcdsyIHojzH9BS7jm9gjm3E5ztstpUWbp7Y+fSY
         frQS1JoJptmgYK4O0A6BRfjqZIlt4MAshvlS/rigIUJyN+V0ZCmAFo95rCExXnBbkQ
         HY5CmLtckc/uf8pMorCohr9FpbWPGhAY2IrADVKhSHxkH9+3JCIndCsGOGftq3I8SB
         XQ2UxhFYd27xbTyjVALvg1r8pWPL8xIlpDtsM+vrm2pKVZY+zC3CnGGnd3t0s2fGU2
         1Fp86/Btwq1UQ==
Received: by mail-ed1-f47.google.com with SMTP id v7so4634444eds.10;
        Wed, 10 Feb 2021 12:59:39 -0800 (PST)
X-Gm-Message-State: AOAM530fNqxxP8OqmMbiUV1IZIlYe4XfUJko0qmrJV/EBo+JeBSkcps1
        YddUOJjkjNZ0HD9x7YgkLpnZ7B1tc3Y5VvGAEw==
X-Google-Smtp-Source: ABdhPJxacO0wf1xtajhT6TgBmNau1cOl6EP0XT0wnGuAql3GiyYkRv8xoZQ8EpumIQDdN7LoduVFbTVtabNCICboevM=
X-Received: by 2002:a50:ee10:: with SMTP id g16mr5022978eds.62.1612990777710;
 Wed, 10 Feb 2021 12:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20210210214720.02e6a6be@canb.auug.org.au> <YCQjfqH415zIhhyz@kroah.com>
 <CAGETcx88Ln2XxuLN7P2BVhzB=OQxPLLsBN7WLL1j2JtR4+Z8ow@mail.gmail.com>
 <CAGETcx9zM2OdbNDcC7pXGtY9yqRgb-wt0YzFv6wfNgQi0gM+8w@mail.gmail.com>
 <CAL_JsqLrRQs2Q_ui2SLdEBJ7FuYNpC-_K+9yoQjyMDbhaRbLiQ@mail.gmail.com> <CAGETcx9dPER2NoOx5vcS7BbCNw=Bao20kKk82uMe_8Bjf-XoFw@mail.gmail.com>
In-Reply-To: <CAGETcx9dPER2NoOx5vcS7BbCNw=Bao20kKk82uMe_8Bjf-XoFw@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Feb 2021 14:59:26 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+54eRFoSwmo0jSqo9oj88zrLhOQLNRgPtctfZgB_0ahQ@mail.gmail.com>
Message-ID: <CAL_Jsq+54eRFoSwmo0jSqo9oj88zrLhOQLNRgPtctfZgB_0ahQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 2:44 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Wed, Feb 10, 2021 at 12:15 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Wed, Feb 10, 2021 at 1:17 PM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > On Wed, Feb 10, 2021 at 11:06 AM Saravana Kannan <saravanak@google.com> wrote:
> > > >
> > > > On Wed, Feb 10, 2021 at 10:18 AM Greg KH <greg@kroah.com> wrote:
> > > > >
> > > > > On Wed, Feb 10, 2021 at 09:47:20PM +1100, Stephen Rothwell wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > After merging the driver-core tree, today's linux-next build (sparc64
> > > > > > defconfig) failed like this:
> > > > > >
> > > > > > drivers/of/property.o: In function `parse_interrupts':
> > > > > > property.c:(.text+0x14e0): undefined reference to `of_irq_parse_one'
> > > > > >
> > > > > > Caused by commit
> > > > > >
> > > > > >   f265f06af194 ("of: property: Fix fw_devlink handling of interrupts/interrupts-extended")
> > > > > >
> > > > > > CONFIG_OF_IRQ depends on !SPARC so of_irq_parse_one() needs a stub.
> >
> > It's always Sparc!
> >
> > > > > > I have added the following patch for today.
> > > > > >
> > > > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > > Date: Wed, 10 Feb 2021 21:27:56 +1100
> > > > > > Subject: [PATCH] of: irq: make a stub for of_irq_parse_one()
> > > > > >
> > > > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > > ---
> > > > > >  include/linux/of_irq.h | 9 +++++++--
> > > > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > >
> > > > Thanks Stephen!
> > >
> > > Actually the stub needs to return an error. 0 indicates it found the interrupt.
> >
> > I have a slight preference if you could add an 'if
> > (!IS_ENABLED(CONFIG_OF_IRQ))' at the caller instead.
> >
> > If you grep of_irq_parse_one, you'll see there's only a few users
> > which means it's on my hit list to make it private. Stub functions
> > give the impression 'use everywhere'.
>
> I already sent out a fix :(

Okay, it's fine. I misread Greg's mail.

> Will that check optimize out the code and not cause build errors? If
> so, I can send out a patch later.

Yes, it will not trigger link errors. You could still get compile
errors if say a struct member is ifdef'ed out.

Rob
