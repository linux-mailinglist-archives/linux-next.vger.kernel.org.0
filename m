Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304A4317104
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 21:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhBJUQA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 15:16:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:43712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232633AbhBJUPm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 15:15:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35E3664EDC;
        Wed, 10 Feb 2021 20:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612988102;
        bh=r/No3x3rSk0JYnz2UamJxVPWG/1ISWzATXx2W1f9E04=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tdT6r7r6eJMWlC552xlSFdforr/wNL0FhzRUrC+ju16LkunzX707FWzyjgAZk9gy3
         3LRbAockGDUgi/BGSzGg0PdxiusWj/f1guxVkqIQlHrVABF5vRs9vD2VVkabnrypRc
         k/naUOzADzYC04Q069OJn64tev058ePKH8adonDwydveyqCeRKsR6ZvGY9H9LZ7uyB
         ehT40x3/XJaEhFn1gKXun4g1hzsallbCuwp3abEsf/LRT7oZJETcwQTWDLkkLPo+vT
         RkNUj6JVnEx1hEvZ7Zt75jKyzMig34cqTPG9nX6UjYviaco9N3UtxWuj3CdLleNeW9
         xPElaD1Ti4Ldw==
Received: by mail-ej1-f52.google.com with SMTP id sa23so6471561ejb.0;
        Wed, 10 Feb 2021 12:15:02 -0800 (PST)
X-Gm-Message-State: AOAM533xls1ALlRljv95zKJbi+seFDoG9dU7b6HjOkO2gHpjZ4WvkFaT
        jSIZNIWLzue3LZ77jNh7dB0KL1XhnpafMIEEuQ==
X-Google-Smtp-Source: ABdhPJy4NyRQrC+yxTcZyeNeARG05mZWAUz1l9/Io0wEWT/h680z3Nef++CU9ppswAxT2p4Y8e+3G2+6unKgqsXEKzw=
X-Received: by 2002:a17:906:fca1:: with SMTP id qw1mr4421793ejb.130.1612988100766;
 Wed, 10 Feb 2021 12:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20210210214720.02e6a6be@canb.auug.org.au> <YCQjfqH415zIhhyz@kroah.com>
 <CAGETcx88Ln2XxuLN7P2BVhzB=OQxPLLsBN7WLL1j2JtR4+Z8ow@mail.gmail.com> <CAGETcx9zM2OdbNDcC7pXGtY9yqRgb-wt0YzFv6wfNgQi0gM+8w@mail.gmail.com>
In-Reply-To: <CAGETcx9zM2OdbNDcC7pXGtY9yqRgb-wt0YzFv6wfNgQi0gM+8w@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Feb 2021 14:14:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLrRQs2Q_ui2SLdEBJ7FuYNpC-_K+9yoQjyMDbhaRbLiQ@mail.gmail.com>
Message-ID: <CAL_JsqLrRQs2Q_ui2SLdEBJ7FuYNpC-_K+9yoQjyMDbhaRbLiQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 1:17 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Wed, Feb 10, 2021 at 11:06 AM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Wed, Feb 10, 2021 at 10:18 AM Greg KH <greg@kroah.com> wrote:
> > >
> > > On Wed, Feb 10, 2021 at 09:47:20PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > After merging the driver-core tree, today's linux-next build (sparc64
> > > > defconfig) failed like this:
> > > >
> > > > drivers/of/property.o: In function `parse_interrupts':
> > > > property.c:(.text+0x14e0): undefined reference to `of_irq_parse_one'
> > > >
> > > > Caused by commit
> > > >
> > > >   f265f06af194 ("of: property: Fix fw_devlink handling of interrupts/interrupts-extended")
> > > >
> > > > CONFIG_OF_IRQ depends on !SPARC so of_irq_parse_one() needs a stub.

It's always Sparc!

> > > > I have added the following patch for today.
> > > >
> > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Date: Wed, 10 Feb 2021 21:27:56 +1100
> > > > Subject: [PATCH] of: irq: make a stub for of_irq_parse_one()
> > > >
> > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > ---
> > > >  include/linux/of_irq.h | 9 +++++++--
> > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > Thanks Stephen!
>
> Actually the stub needs to return an error. 0 indicates it found the interrupt.

I have a slight preference if you could add an 'if
(!IS_ENABLED(CONFIG_OF_IRQ))' at the caller instead.

If you grep of_irq_parse_one, you'll see there's only a few users
which means it's on my hit list to make it private. Stub functions
give the impression 'use everywhere'.

Rob
