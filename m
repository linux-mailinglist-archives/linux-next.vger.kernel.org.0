Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403C23079AC
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 16:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhA1P1K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jan 2021 10:27:10 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:42981 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbhA1P1B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Jan 2021 10:27:01 -0500
Received: by mail-oi1-f180.google.com with SMTP id x71so6354895oia.9;
        Thu, 28 Jan 2021 07:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=22NNIJdwFVtaiYnEXy306Fq0ou0H+TSG6fT0yU8Xc64=;
        b=OhWYNVIobtqgnaJY70ID61jJE3nRay9VuOGtlfKmorSp3Iaxd39AbgGtIka5pXnmBK
         1I53mfOe5A16GSyO9YEC6zff0WlUWAPodpURmA4uGvPncyb2WiroOd1+YD2BFc5kDRBv
         ZrGMoWZR9B3KpFBFit3ko13G41faJuY+Sr3/5Xkbmvh25/e6bgynd6kgsxe5Az5/e7ye
         H51oxjh7yzr4NVaVyCBycvLNLl1HNw28WGw8UAxQ8VbC8w+mRdhUTsgpkfttCskO/z5B
         F6TS8ge6SAJNj83bgwTYFZ5cMBQTpTQfliCGhPCXKz4zeJLJ/Yo/+qmqwFole2t3I0rt
         Ed4g==
X-Gm-Message-State: AOAM533IcOwYA//M6SdBqmOm9hpSXs7Vqy6HPc+F5pzTrsRgJVqk2Sxz
        k1v11UhvkxSXPKiVopOyCEDhzQlVCNUlAVPijmc=
X-Google-Smtp-Source: ABdhPJwtbqub3RLU0ojGN/DhaJhbIQp0M2FPhLkgMFxBJXtpYqt2MlrWj8HIYEH5Ijo/ju/HPcDtnyakbL0+WizWBWY=
X-Received: by 2002:aca:4d8d:: with SMTP id a135mr6655596oib.153.1611847580638;
 Thu, 28 Jan 2021 07:26:20 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYta_uOLktmMnZHUTK9Uqx-rjtmQSSvHFCsvQsVdZDdm8A@mail.gmail.com>
In-Reply-To: <CA+G9fYta_uOLktmMnZHUTK9Uqx-rjtmQSSvHFCsvQsVdZDdm8A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Jan 2021 16:26:09 +0100
Message-ID: <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
Subject: Re: [next] mm/nommu.c:1671:6: error: conflicting types for 'filemap_map_pages'
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Naresh,

On Thu, Jan 28, 2021 at 3:25 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
> arm, sh and riscv architecture build failed on today's Linux next tag 20210128.
>
> FYI,
> # CONFIG_MMU is not set on these failed configs.
> config file attached to this email.
>
> make --silent --keep-going --jobs=8 O=/home/tux  -
> build/.cache/tuxmake/builds/1/tmp ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
> arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
> mm/nommu.c:1671:6: error: conflicting types for 'filemap_map_pages'
>  1671 | void filemap_map_pages(struct vm_fault *vmf,
>       |      ^~~~~~~~~~~~~~~~~
> In file included from mm/nommu.c:20:
> include/linux/mm.h:2578:19: note: previous declaration of
> 'filemap_map_pages' was here
>  2578 | extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
>       |                   ^~~~~~~~~~~~~~~~~

Care to give "[PATCH -next] mm/nommu: Fix return type of
filemap_map_pages()" a try?
https://lore.kernel.org/lkml/20210128100626.2257638-1-geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
