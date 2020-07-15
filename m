Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629262210C4
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 17:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgGOPWY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 11:22:24 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39920 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgGOPWY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2020 11:22:24 -0400
Received: by mail-ot1-f68.google.com with SMTP id 18so1745877otv.6;
        Wed, 15 Jul 2020 08:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rsv1c9eB/tCtTHdeCJGRATFVUgVys8lI2UmJmc98OKo=;
        b=NDoDhSZ7vwnugKj/p3+OHoA8j/JBKo38XOEnT1cy/nbsadMsDag8IKKNC/w8Q/obdA
         u/wm898H85ePCaYVTg8XMqB4EgAppDik5quncndr8TtqdyQ+pScUR8s3hkSd3xzXqVKC
         bR/8dHApqTws2T8ICCioo76rAMSXB8lHUHwkebV+XkWVsX95aYOP7JVGoxiU+N7iqRlP
         2vpcJDOZb4/6Qu+8433INkrLMxMsMtklc4RHVJENM6YEdxRQk1nHbLvI6nS3P2F04LrE
         N1gCpmLlJvRH6XaFEOBioo3oXKMHAQd52IWwhFzFmc8XN3oZEpTlwokmf+seZJ+f2L9u
         jcyg==
X-Gm-Message-State: AOAM530vfM2VLQYKMuEt5zqfqbzcFns+Dj5l+kV0EYhJegT7Asjg8qMl
        3eaoFNMPaUQCisSnp0Db6mZe1iMI7fFeH9vQSvVSllL7TlQ=
X-Google-Smtp-Source: ABdhPJxGq3tVdyw6liOjZ+4tE3zElVO3AArR6jCMi7VtW+YTmYvo4wB07qnrEIzTrp5A6o5ErgZwj2cqUNywZl8LihY=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr117304otl.145.1594826542998;
 Wed, 15 Jul 2020 08:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200715121423.6c20731b@canb.auug.org.au> <CAMuHMdWMmP_YHEwnqmuTMw4-+LSieRaSHeqPLYLZyLq+O7zhyQ@mail.gmail.com>
 <6bc36827-83a7-3695-530d-4b90c08b92c7@kernel.dk> <CAMuHMdU3uRV+8ep0YRKuqBitkfVchh1L7=+RVxCAL0rMrQHAiQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU3uRV+8ep0YRKuqBitkfVchh1L7=+RVxCAL0rMrQHAiQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 17:22:11 +0200
Message-ID: <CAMuHMdW78E0xe2ogeF0tAK3EN0vBr-B1RBOQTqi4t_9ByUiEEw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jens,

> On Wed, Jul 15, 2020 at 5:08 PM Jens Axboe <axboe@kernel.dk> wrote:
> > On 7/15/20 3:24 AM, Geert Uytterhoeven wrote:
> > > On Wed, Jul 15, 2020 at 4:26 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >> After merging the block tree, today's linux-next build (arm
> > >> multi_v7_defconfig) failed like this:
> > >>
> > >> block/blk-timeout.c: In function 'blk_round_jiffies':
> > >> block/blk-timeout.c:96:14: error: 'CONFIG_HZ_ROUGH_MASK' undeclared (first use in this function)
> > >>    96 |  return (j + CONFIG_HZ_ROUGH_MASK) + 1;
> > >>       |              ^~~~~~~~~~~~~~~~~~~~
> > >>
> > >> Caused by commit
> > >>
> > >>   91ba0f529364 ("block: relax jiffies rounding for timeouts")
> > >>
> > >> CONFIG_HZ_ROUGH_MASK is not defined for this build even though
> > >> CONFIG_HZ_100 is set. The arm arch does not include kernel/Kconfig.hz.
> > >>
> > >> I have reverted that commit for today.
> > >
> > > (as I don't have the original patch in my email, I'm commenting here)
> > >
> > >     +config HZ_ROUGH_MASK
> > >     +       int
> > >     +       default 127 if HZ_100
> > >     +       default 255 if HZ_250 || HZ_300
> > >     +       default 1023 if HZ_1000
> > >
> > > What about other HZ_* values?
> >
> > Which other ones do we have?
>
> $ git grep "\<HZ_[0-9]" -- "*Kconf*"
> arch/alpha/Kconfig:     default HZ_128 if ALPHA_QEMU
> arch/alpha/Kconfig:     default HZ_1200 if ALPHA_RAWHIDE
> arch/alpha/Kconfig:     default HZ_1024

And ARC allows you to enter any integer value:

    config HZ
            int "Timer Frequency"
            default 100

So probably you want to derive something from the integer value itself.

Note that not all architectures include kernel/Kconfig.hz.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
