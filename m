Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1461C171F56
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 15:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733166AbgB0Od5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 09:33:57 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39022 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733150AbgB0Od4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 09:33:56 -0500
Received: by mail-oi1-f193.google.com with SMTP id r16so1821169oie.6;
        Thu, 27 Feb 2020 06:33:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iazGFV0/AdGMbS8cIoxIj45xiJT6uT7qxe6QWrKdivk=;
        b=m8C5X+/LiWiC9LavLEDvnnkvcph+a6hDEMC6ZvzHIKt9/nVkSfFX6NR+fEkDS673ur
         +REMX4arHza/sAVlygHoUnsGjWWNmss9vLUScWAkY0LcAZbgqE85nakp5q8DJcUrU+P8
         QLC0JiCB7644WqR49JzwH4SZkPVT6gSaXaQFEBiHcrq6a+qlYG5vREDeSrRytZ6CQVYU
         HRgp1TQ0AZ9G6elL9cVnulq9QSQ8Rz4g/B13hPKKYZxS6GHxipUkTXhYYu/Dz62sLkdl
         zsL8TfIRZai59M37gC7JSyKAheXy4lC3vqG8seQO6oIt3HGIOhVDPeTZWduvgx1L1TEx
         rDpg==
X-Gm-Message-State: APjAAAXLWQq3RUIvOy6Hqd3h1Tw3gjekV/5mI4xhskEVXisU57KfHoFF
        ekSjji2XHAfc1CrmYMGtvch+hkccmqP2XrykpUg=
X-Google-Smtp-Source: APXvYqy5IFVSWV6b6wQFhhGt1TR8aI1RVsmZ9SM+888Y8GkOYCeG4Jn33omesaC3db4cUJaAC9F6faMRciwO4h/uRI8=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr2932212oig.153.1582814035925;
 Thu, 27 Feb 2020 06:33:55 -0800 (PST)
MIME-Version: 1.0
References: <20200225220551.d9a409bc04b77cdf48eae3ea@kernel.org>
 <158264140162.23842.11237423518607465535.stgit@devnote2> <CAMuHMdW+JECxNPX8yDswARq+fLXig7VAo0oosCPAkZhtc_XR0g@mail.gmail.com>
 <20200227092518.2096344e@gandalf.local.home>
In-Reply-To: <20200227092518.2096344e@gandalf.local.home>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Feb 2020 15:33:44 +0100
Message-ID: <CAMuHMdUXqH6yE17Us+k7T4VnhyiWdRuEexWXMyc9x5yuT_41vg@mail.gmail.com>
Subject: Re: [PATCH] bootconfig: Fix CONFIG_BOOTTIME_TRACING dependency issue
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Steven,

On Thu, Feb 27, 2020 at 3:25 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> On Thu, 27 Feb 2020 10:18:08 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Feb 25, 2020 at 4:47 PM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > > Since commit d8a953ddde5e ("bootconfig: Set CONFIG_BOOT_CONFIG=n by
> > > default") also changed the CONFIG_BOOTTIME_TRACING to select
> > > CONFIG_BOOT_CONFIG to show the boot-time tracing on the menu,
> > > it introduced wrong dependencies with BLK_DEV_INITRD as below.
> > >
> > > WARNING: unmet direct dependencies detected for BOOT_CONFIG
> > >   Depends on [n]: BLK_DEV_INITRD [=n]
> > >   Selected by [y]:
> > >   - BOOTTIME_TRACING [=y] && TRACING_SUPPORT [=y] && FTRACE [=y] && TRACING [=y]
> > >
> > > This makes the CONFIG_BOOT_CONFIG selects CONFIG_BLK_DEV_INITRD to
> > > fix this error and make CONFIG_BOOTTIME_TRACING=n by default, so
> > > that both boot-time tracing and boot configuration off but those
> > > appear on the menu list.
> > >
> > > Fixes: d8a953ddde5e ("bootconfig: Set CONFIG_BOOT_CONFIG=n by default")
> > > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> > > ---
> > >  init/Kconfig         |    2 +-
> > >  kernel/trace/Kconfig |    1 -
> > >  2 files changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index a84e7aa89a29..8b4c3e8c05ea 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -1217,7 +1217,7 @@ endif
> > >
> > >  config BOOT_CONFIG
> > >         bool "Boot config support"
> > > -       depends on BLK_DEV_INITRD
> > > +       select BLK_DEV_INITRD
> > >         help
> > >           Extra boot config allows system admin to pass a config file as
> > >           complemental extension of kernel cmdline when booting.
> > > diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> > > index 795c3e02d3f1..402eef84c859 100644
> > > --- a/kernel/trace/Kconfig
> > > +++ b/kernel/trace/Kconfig
> > > @@ -145,7 +145,6 @@ config BOOTTIME_TRACING
> > >         bool "Boot-time Tracing support"
> > >         depends on TRACING
> >
> > Why not "depends on BLK_DEV_INITRD?" here?
> >
> > /me tries to contain the bloat introduced by the bootconfig stuff.
>
> Because people like me will be scratching my head trying to figure out why
> I don't see Boot-time Tracing support ;-)

AFAIUI, without using an initrd, your fancy bootconfig cannot be appended
anywhere anyway?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
