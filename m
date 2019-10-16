Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 427B0D8C51
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2019 11:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfJPJP4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Oct 2019 05:15:56 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35392 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfJPJP4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Oct 2019 05:15:56 -0400
Received: by mail-ot1-f67.google.com with SMTP id z6so19533359otb.2;
        Wed, 16 Oct 2019 02:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eWO83wYFqov3AURoB4G7/bCXBpqXaFMJWMjygt9Ir1A=;
        b=PKG4oOyIca1ZGeKhK6yRZHClyQ/WwsVQqCe5m39P8gpknGWLV7NvdTsmOPA6xXCLHF
         3iEuBZuw1IiMNZxLcOIusrJZj7NAahimXGz3UPnd71KaY5zxuUK4w0ScPWQAXZaTPBaO
         l66ZIXGNQq2q5e+FDrE1HrZsdeDbZGT0c8NUQ3u7f3sZco/vWosoq0riLSbJSyKlTrL5
         4W/1HVIu7chHVRdeyFHN30tFJsnK9DKkLkkja1KV25txfD0RzSZv4BZXrchYlTs+/l+U
         nrT+FDvmposnV/MmrkQJreNOgCgU09Z1alxggQtQBp4aG+/lt11RH1v6q+n3PZK6CTTm
         9/8w==
X-Gm-Message-State: APjAAAVGPNV95qCOlfkaUwBdIepA2/S45CdiTjtNJQlRvoRfRe80iGKj
        mUlqc6Po36XNfpaGCWfxr5XahkD25G8ouhUAV90=
X-Google-Smtp-Source: APXvYqw0snyYEnJ9KGBkCofEGhgxg06s9+onQzn0NdIGkspLr5VILCpL5FR3c4FDj4FlxNcKVkE0yiHpK89ckBEDHIM=
X-Received: by 2002:a05:6830:1544:: with SMTP id l4mr18168789otp.297.1571217355138;
 Wed, 16 Oct 2019 02:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191015100855.31b8a3d5@canb.auug.org.au> <20191015101650.2a1541af@canb.auug.org.au>
 <4823987.OjxUhv8yZC@kreacher>
In-Reply-To: <4823987.OjxUhv8yZC@kreacher>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 11:15:44 +0200
Message-ID: <CAMuHMdUc7unFPvb2hhy9kL6WcJGsDTpjOW=CD=0n+pw-OGH9Dg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pm tree (Was:
 linux-next: build warning after merge of the pm tree)
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Rafael,

On Tue, Oct 15, 2019 at 1:27 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> On Tuesday, October 15, 2019 1:16:50 AM CEST Stephen Rothwell wrote:
> > On Tue, 15 Oct 2019 10:08:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
> > wrote:
> > >
> > > After merging the pm tree, today's linux-next build (arm
> > > multi_v7_defconfig) produced this warning:
> > >=20
> > > In file included from include/linux/irqchip.h:14,
> > >                  from arch/arm/kernel/irq.c:26:
> > > include/linux/acpi.h:682:31: warning: 'struct acpi_device' declared insid=
> > e parameter list will not be visible outside of this definition or declarat=
> > ion
> > >   682 | acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2=
> > , const char *uid2)
> > >       |                               ^~~~~~~~~~~
> > >=20
> > > and many more.
> > >=20
> > > Introduced by commit
> > >=20
> > >   d1748b57dc88 ("ACPI / utils: Introduce acpi_dev_hid_uid_match() helper")
> > >=20
> > > CONFIG_ACPI is not set for this build.
> >
> > This became a build failure for the powerpc ppc64_allmodconfig build:
> >
> > In file included from include/linux/i2c.h:13,
> >                  from arch/powerpc/platforms/pasemi/misc.c:14:
> > include/linux/acpi.h:682:31: error: 'struct acpi_device' declared inside pa=
> > rameter list will not be visible outside of this definition or declaration =
> > [-Werror]
> >   682 | acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, =
> > const char *uid2)
> >       |                               ^~~~~~~~~~~
> > cc1: all warnings being treated as errors
> >
> > (and many more)
> >
> > I have used the pm tree from next-20191014 for today.
>
> So this looks weird, because there is an acpi_dev_put() stub in
> include/linux/acpi.h too in the same #else block and it takes a
> (struct acpi_device *) pointer too and it has not been touched by
> the commit in question.  So why has it built successfully so far?

Looks like that never warned because acpi_dev_put() is located after

    static inline struct acpi_device *
    acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
    {
            return NULL;
    }

Moving acpi_dev_hid_uid_match() down gets rid of the warning, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
