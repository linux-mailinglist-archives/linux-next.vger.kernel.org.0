Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977252A9143
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 09:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgKFI2W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 03:28:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:59876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726242AbgKFI2W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Nov 2020 03:28:22 -0500
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E842321D46
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604651302;
        bh=PM+bmzd5TAs4baRCe83HDbWJ8moh7nNJI6PQur0XjI4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Fw9Lu2DmXPhFW7Zam2sMBXT4x1wQe3oIx8XeEqCmTVilaFxWsr23Wtafjnd1l8gnm
         A1kCel8o8JkPfCfE/HiyptG4lJumTYNste33tY2wX1DeY4ZWMIML9DHnCdevkO1RCg
         gWk0yejU6JTcMrwPna04qMaQyZknWIFU61eU+NZA=
Received: by mail-ot1-f52.google.com with SMTP id n11so574853ota.2
        for <linux-next@vger.kernel.org>; Fri, 06 Nov 2020 00:28:21 -0800 (PST)
X-Gm-Message-State: AOAM533MDQ1v1CGxC1+qOxzgDFPg4rEpZDVOnKN50T6NmHHPZYGDXX1b
        9olKS76gvpa9tYcADTDYJY0fEldT5OGDESSzLS8=
X-Google-Smtp-Source: ABdhPJwdWuqJjd6zF6X7nfz4IFIGNvs6daEpjTqw7oPqZoDG1FO6ft4sTojSukea7WBYhp3iGQ/2E3mEgQ/EnacabZk=
X-Received: by 2002:a05:6830:115a:: with SMTP id x26mr453687otq.77.1604651301053;
 Fri, 06 Nov 2020 00:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org> <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
In-Reply-To: <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 6 Nov 2020 09:28:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
Message-ID: <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Alexander Potapenko <glider@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 6 Nov 2020 at 09:26, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Nov 6, 2020 at 8:49 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> > arm KASAN build failure noticed on linux next 20201106 tag.
> > gcc: 9.x
> >
> > Build error:
> > ---------------
> > arch/arm/boot/compressed/string.c:24:1: error: attribute 'alias'
> > argument not a string
> >    24 | void *__memcpy(void *__dest, __const void *__src, size_t __n)
> > __alias(memcpy);
> >       | ^~~~
> > arch/arm/boot/compressed/string.c:25:1: error: attribute 'alias'
> > argument not a string
> >    25 | void *__memmove(void *__dest, __const void *__src, size_t
> > count) __alias(memmove);
> >       | ^~~~
> > arch/arm/boot/compressed/string.c:26:1: error: attribute 'alias'
> > argument not a string
> >    26 | void *__memset(void *s, int c, size_t count) __alias(memset);
> >       | ^~~~
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >
> > Build details link,
> > https://builds.tuxbuild.com/1juBs4tXRA6Cwhd1Qnhh4vzCtDx/
>
> This looks like a randconfig build.
>
> Please drill down and try to report which combination of config
> options that give rise to this problem so we have a chance of
> amending it.
>

AFAIK there is an incompatible change in -next to change the
definition of the __alias() macro
