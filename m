Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89EB391AC9
	for <lists+linux-next@lfdr.de>; Wed, 26 May 2021 16:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235148AbhEZOxU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 10:53:20 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:33567 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235077AbhEZOxU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2021 10:53:20 -0400
Received: by mail-vs1-f53.google.com with SMTP id f11so832628vst.0;
        Wed, 26 May 2021 07:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BARZY/Zm/Q9bSQpQWNCPuOu1nEYjPwLPq7uNIDXm7kk=;
        b=huwWK/bJ/slfWm1gMZrqQ/yHWUfm3NhNXNEs/iRyH9oPUl3vkmvR3DYsxtjGjuAbdp
         fGt1Fmv2/mzJtHvhbp2R6nBqsnhbsHY+C54aiSVLY98xOiStRLNbXxXSdpM3inev9fnV
         sMqbXrYwI5LfMMqagTkODkoWnqWkcz+1HJPf1Frm+yvDTKilHO0HwgdZMm6JWE8ORCmK
         L9ut/FPRGdlk0kI0IxqFqO3pXx/ePM9EeNeqiuVhr879l6mw+G3mz+Zf/OdIQz4vAAfo
         +FwUWG3AVfBVr2PtMgRm1kh7WH17QDjI7gsOi2vwPlZrBaTrx+rElxh3tq5UaDfWTf6h
         oFlA==
X-Gm-Message-State: AOAM5309/jGr3Q/7pldQ/PxS/rYJc2tjuZkNFpaQmwkCwym+1LhduSir
        XtcCjfWIYUuyEm1TdDk5WcepYGUg4YPTfzq+OofX3Iae
X-Google-Smtp-Source: ABdhPJxHFkT/Ut4XcWcmc+uY1kwmt7LbdgIdiTRddR/Hb6SvL9PjTUS3ABPW2ezC6FfM0VGqzQ9U1tJsbBQR15GYK4w=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr32558814vsq.40.1622040707282;
 Wed, 26 May 2021 07:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084536.1454449-1-geert@linux-m68k.org> <CAK7LNARq87zoD9-r4YfY5rewwieBOBJYETs4MLwBz9vddxMsRA@mail.gmail.com>
In-Reply-To: <CAK7LNARq87zoD9-r4YfY5rewwieBOBJYETs4MLwBz9vddxMsRA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 May 2021 16:51:35 +0200
Message-ID: <CAMuHMdW9CzMMwvJKHsLLD_BT9Roor6xWxzZYhv0fkEA7LT0Z9A@mail.gmail.com>
Subject: Re: [PATCH] m68k: Drop duplicate "core-y += arch/m68k/" rule causing
 link failures
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Yamada-san,

On Wed, May 26, 2021 at 4:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Wed, May 26, 2021 at 5:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >     Makefile:1949: target 'arch/m68k' given more than once in the same rule
> >     [...]
> >       LD      vmlinux.o
> >     m68k-linux-gnu-ld: arch/m68k/kernel/entry.o: in function `system_call':
> >     (.text+0x160): multiple definition of `system_call'; arch/m68k/kernel/entry.o:(.text+0x160): first defined here
> >     [...]
> >
> > All "core-y += arch/<arch>/" rules were dropped from the corresponding
> > arch/<arch>/Makefiles, but m68k was forgotten.
> >
> > Reported-by: noreply@ellerman.id.au
> > Fixes: 7d9677835b10b5de ("kbuild: require all architectures to have arch/$(SRCARCH)/Kbuild")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
>
> I will squash this.

Fine for me. Thx!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
