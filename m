Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B791E317199
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 21:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbhBJUpH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 15:45:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbhBJUpC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 15:45:02 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676D8C06178B
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 12:44:06 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id p186so3402624ybg.2
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 12:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8f1XjpNELN9zsfANF+FH1lk4KW13Kba1bid4uzYN8Ws=;
        b=oy6sII0U3E3uIbMdr3LS1uwg/JacXpfPdfQILUh6etskJImlykEHzzQjuQP40GmMZJ
         ABRwUIaDOpvvJ2YdD1qDm4VhSfrAOaPc6j4JpYL34kYXNqbxn8UR0IUuNgYptKgRWCOd
         m6iwJU6LQQY4KNeSzE2L+LG0JQMQJVHbKVEfOIYF1OmsZwPoOx8aXAhsRlsAQPTwQhuc
         M9BiFNFC8bL35R7qAyw7X7LL2Jx3uFXeySCvWsfvkU64mTmFf9nCbEEnwuALPHqZsfYz
         qpDYuLZQ4sx5MQmY5E7ly1EqP0WDacjdHWiGyvpG7H0UlkJ+Wc+/ALPYlomlk6mG9Inb
         TIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8f1XjpNELN9zsfANF+FH1lk4KW13Kba1bid4uzYN8Ws=;
        b=F1WgaoBj8OBVKrg2ELQWKqW4HC1vLLbOa7J45DptK9Hgnv/JEW/WjqSbKuNPjE1Dy2
         sZcagNxzrB0NM38V6OE439sHRJ7W5P0qEyrvaAyy+l92lkbK7thnMeT8e4EquUhcI6Ux
         WW8f6tIktsl60VaBzkn4sc331Gc0vlhwnzdOxFqlYwrnHvFbj3p+wuzZkAHXMTheUBYs
         7TizrnJ6Jc0VkF/4tBmJVnmi8SnymlvtS4Ovo4HZsI8ZaOwENAgQ91f7j5cDztoh43Ah
         k1uWm3IAvmj6NRHjqe/7XIthsHihe5K1QhOlGBneSY17/W/YaIo+bBsYlOspHkp19Oaq
         SAPA==
X-Gm-Message-State: AOAM5313xUcWT4ScF/585Kcm/b/Bj7/9LJ6G6AprT96+zsrcjmVdgQxf
        G9QUDAaOdnGW9LKBunsjESg0g+FaBwWQKIUtYUuFmqXwTpab0A==
X-Google-Smtp-Source: ABdhPJzHRkwwySiKSgHdTLepBiBJmKQc2WktlG1U/Wcb3SY6WEPBKAi8xHvRcVe/FZIAsAWokyaNW4lzuG7DDUU62NU=
X-Received: by 2002:a25:718b:: with SMTP id m133mr7034554ybc.412.1612989845498;
 Wed, 10 Feb 2021 12:44:05 -0800 (PST)
MIME-Version: 1.0
References: <20210210214720.02e6a6be@canb.auug.org.au> <YCQjfqH415zIhhyz@kroah.com>
 <CAGETcx88Ln2XxuLN7P2BVhzB=OQxPLLsBN7WLL1j2JtR4+Z8ow@mail.gmail.com>
 <CAGETcx9zM2OdbNDcC7pXGtY9yqRgb-wt0YzFv6wfNgQi0gM+8w@mail.gmail.com> <CAL_JsqLrRQs2Q_ui2SLdEBJ7FuYNpC-_K+9yoQjyMDbhaRbLiQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLrRQs2Q_ui2SLdEBJ7FuYNpC-_K+9yoQjyMDbhaRbLiQ@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 10 Feb 2021 12:43:29 -0800
Message-ID: <CAGETcx9dPER2NoOx5vcS7BbCNw=Bao20kKk82uMe_8Bjf-XoFw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 12:15 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Feb 10, 2021 at 1:17 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Wed, Feb 10, 2021 at 11:06 AM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > On Wed, Feb 10, 2021 at 10:18 AM Greg KH <greg@kroah.com> wrote:
> > > >
> > > > On Wed, Feb 10, 2021 at 09:47:20PM +1100, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > After merging the driver-core tree, today's linux-next build (sparc64
> > > > > defconfig) failed like this:
> > > > >
> > > > > drivers/of/property.o: In function `parse_interrupts':
> > > > > property.c:(.text+0x14e0): undefined reference to `of_irq_parse_one'
> > > > >
> > > > > Caused by commit
> > > > >
> > > > >   f265f06af194 ("of: property: Fix fw_devlink handling of interrupts/interrupts-extended")
> > > > >
> > > > > CONFIG_OF_IRQ depends on !SPARC so of_irq_parse_one() needs a stub.
>
> It's always Sparc!
>
> > > > > I have added the following patch for today.
> > > > >
> > > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > Date: Wed, 10 Feb 2021 21:27:56 +1100
> > > > > Subject: [PATCH] of: irq: make a stub for of_irq_parse_one()
> > > > >
> > > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > ---
> > > > >  include/linux/of_irq.h | 9 +++++++--
> > > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > Thanks Stephen!
> >
> > Actually the stub needs to return an error. 0 indicates it found the interrupt.
>
> I have a slight preference if you could add an 'if
> (!IS_ENABLED(CONFIG_OF_IRQ))' at the caller instead.
>
> If you grep of_irq_parse_one, you'll see there's only a few users
> which means it's on my hit list to make it private. Stub functions
> give the impression 'use everywhere'.

I already sent out a fix :(

Will that check optimize out the code and not cause build errors? If
so, I can send out a patch later.

-Saravana
