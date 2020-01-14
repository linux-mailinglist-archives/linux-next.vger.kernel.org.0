Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90C9013A437
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 10:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgANJur (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 04:50:47 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42528 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgANJur (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jan 2020 04:50:47 -0500
Received: by mail-ot1-f68.google.com with SMTP id 66so12015829otd.9;
        Tue, 14 Jan 2020 01:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+6LmuYuMGTmOXwHbUpttOywfmJXsazPd2oXoQf5XGBk=;
        b=sAkjrObHzFrvBzi9+b+Ji0dFWCxf/PpZ1vjpgxMar39HaDuQlYjcvQbZeQ4yR/OH0H
         4NgmcKZdAdaspNWSwmhSBIcfYzPZmyxqMKlwfG2Y+vVOVkm/Kna4ohxdFZbd3vHkYytB
         fQnF+8Gndk5VJaGCaDk8Ux1rv/ZNHALGy0HDiGbwmCCMT6+DMIfuT8DsqrS0TDWdkp5u
         2t6BDi4CxN+1SnQYYx1n/n17js3KzAGUtxbb20GKdpWOkdftP3F40tqLRJ2XmyrLhWUJ
         xRJ0kTq+XUUnYuDboQ0jyNjfaKDg9UgZD10KjSF1OebSZCNZwlR0qi/oT9o+Y+Xvucp8
         Apdw==
X-Gm-Message-State: APjAAAWdqwU4EKQJGJkH0QyHeJg/8vkwn/rR/c5bZhTgTwli7hUGETIU
        5GSboSMyEpI78nfvtRCrY9S+2VKMADJ87hpliGSiug==
X-Google-Smtp-Source: APXvYqxnrI58HGC3YYQXRgw1TBmOivT+m91WMqatQDgHBMmGpJ0SrmHcIqLmIgDHc8Clm56u3EkDP0o5hNDc+VXS4Zs=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr16859866otm.297.1578995446820;
 Tue, 14 Jan 2020 01:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20200113103040.23661-1-geert@linux-m68k.org>
In-Reply-To: <20200113103040.23661-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jan 2020 10:50:34 +0100
Message-ID: <CAMuHMdXx8Y2qvqg8tMqrzQJuU9DMgSNryGch3XgrTPyqwrkN=A@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement copy_thread_tls()
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Amanieu d'Antras" <amanieu@gmail.com>,
        Christian Brauner <christian@brauner.io>,
        Kars de Jong <jongk@linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 13, 2020 at 11:30 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> This is required for clone3(), which passes the TLS value through a
> struct rather than a register.
>
> As do_fork() is only available if CONFIG_HAVE_COPY_THREAD_TLS is set,
> m68k_clone() must be changed to call _do_fork() directly.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This is a dependency for the combination of commits
> e8bb2a2a1d51511e ("m68k: Wire up clone3() syscall") in m68k/for-next,
> dd499f7a7e342702 ("clone3: ensure copy_thread_tls is implemented") in
> v5.5-rc6.

Applied and queued for v5.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
