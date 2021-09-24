Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95207416DA2
	for <lists+linux-next@lfdr.de>; Fri, 24 Sep 2021 10:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244633AbhIXIXh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Sep 2021 04:23:37 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:33371 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244581AbhIXIXh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Sep 2021 04:23:37 -0400
Received: by mail-vs1-f54.google.com with SMTP id 188so8195662vsv.0;
        Fri, 24 Sep 2021 01:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i2/k9vkfsXP1Rjvll2XmK4TRdZrKCTIiIGnciENfOsY=;
        b=HDKDVK3QNFAXV1h/mM5dzOn0t48pvVCLqWdTDzCNiVyfwM0HboD6glSwvInueK3KEg
         vCh1IvbMpXJ2pprxDS6MhMwn3OjbfTEQ/YtILcQJwyCVftQThKlBHQHj7DL3SEUg+4ij
         6HMJvTT1ailA+VEz8l/oMb5s34o6JCacwlf3I919lCMadAGYxaaFCLOsswewj9Albstm
         uTtWnzEu3VOEAkCNLMW10wJSy3VSY7i9rebdkyTL36rCmupBPxSLreCHuYbmZzOHeW2k
         RmeCX4ZUyPdRbDcsozhFYI8PZWyAlZrHCf6oyprXZjLliJP9whFCof66V9qvK4bhRYyk
         Ds6A==
X-Gm-Message-State: AOAM5339xBUoeIP8UerY0D5FzFIiqFf82TWarQYxRucGlTDHLjru66ci
        aroLQb2HIZhBs4TR/69XZkCfYTsNZZr84sNuwsNZ2OdB9nE=
X-Google-Smtp-Source: ABdhPJxz16u7JxuVVUcCiKKkliF3/HilP0UErr+bEdP9p710cgOuqzTeGl1XB7+LoP6m8VvFvIste3K6jAZ+Wfon5T4=
X-Received: by 2002:a05:6102:2086:: with SMTP id h6mr8032662vsr.50.1632471724192;
 Fri, 24 Sep 2021 01:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210924145436.5ff73179@canb.auug.org.au> <dfd54a2f-d1db-8897-ae49-5c681a99b281@infradead.org>
 <20210924074857.qbwdammzfujk4ozi@gilmour>
In-Reply-To: <20210924074857.qbwdammzfujk4ozi@gilmour>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 10:21:52 +0200
Message-ID: <CAMuHMdWieEsVUuGT9_jG92=PFssihNxtx-+k50cGEUu=10fs4A@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 24 (m68k allmodconfig & drm/vc4/)
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Maxime,

On Fri, Sep 24, 2021 at 9:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
> On Thu, Sep 23, 2021 at 10:54:49PM -0700, Randy Dunlap wrote:
> > On 9/23/21 9:54 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20210923:
> > >
> >
> > from commit 36e9bcb8edfc in linux-next:
> >
> >
> > m68k allmodconfig:
> >
> > WARNING: unmet direct dependencies detected for PM
> >   Depends on [n]: !MMU [=y]
> >   Selected by [m]:
> >   - DRM_VC4 [=m] && HAS_IOMEM [=y] && (ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST [=y]) && DRM [=m] && SND [=m] && SND_SOC [=m] && COMMON_CLK [=y]
>
> I don't really know how to fix this one, should we move that select to
> the ARCH_* symbol, or something else?

You cannot select PM from drivers, only from platform symbols, as the
former lack the knowledge if the platform supports PM or not.

IIf it builds without PM, drop the select.
If it does not build without PM, add a dependency on PM.

Do ARCH_BCM || ARCH_BCM2835 always imply PM?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
