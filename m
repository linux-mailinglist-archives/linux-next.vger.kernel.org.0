Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD3C2A9868
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 16:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbgKFPS6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 10:18:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:49032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbgKFPS6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Nov 2020 10:18:58 -0500
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 508CB206D4
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604675937;
        bh=A4d8M7joxX8jC+mnfsQcVfaZrwjW3MK0rl2CafGm3S4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HK+nBRdrLF7+q7dDS0ap2QoU+01eVgFpOJJaBoyLUeSKVtwbpLE2paRKjuLPjyECK
         hzjqaKxqcOcNlbmGQnXg+JAqCNw9QBcczfJLdfTkYW3Wy7GVUSC/6rW0i3nHP/knKN
         A97clWKxE/X2dAONe0pEqYNpjYvIxJR2D2D86hRw=
Received: by mail-oi1-f181.google.com with SMTP id q206so1629315oif.13
        for <linux-next@vger.kernel.org>; Fri, 06 Nov 2020 07:18:57 -0800 (PST)
X-Gm-Message-State: AOAM531dhExIwo0E0fk95Dav7WTSCsP+bk7VaWD7Z2SjGGfT1ZSM/P/b
        Q5A6Qohc9SkBbZt3wkxza02L6W8pN98r57Ur08c=
X-Google-Smtp-Source: ABdhPJwUmg/6YaOmW0tPfD/f2xc58geWT5yhT2jZgjZZxgfjtQwFJ8xhClOEO5MscQXP4nknsZE1Ss4C0VyHKQbMzEE=
X-Received: by 2002:aca:5c82:: with SMTP id q124mr1427723oib.33.1604675936524;
 Fri, 06 Nov 2020 07:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org> <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86> <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
 <20201106151554.GU1551@shell.armlinux.org.uk>
In-Reply-To: <20201106151554.GU1551@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 6 Nov 2020 16:18:43 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHoKOTtzB645EYZzGtt2tJaZS15Hzn+yoeV3_Ffer_DQw@mail.gmail.com>
Message-ID: <CAMj1kXHoKOTtzB645EYZzGtt2tJaZS15Hzn+yoeV3_Ffer_DQw@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 6 Nov 2020 at 16:16, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Fri, Nov 06, 2020 at 02:37:21PM +0100, Linus Walleij wrote:
> > On Fri, Nov 6, 2020 at 10:44 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > > On Fri, Nov 06, 2020 at 09:28:09AM +0100, Ard Biesheuvel wrote:
> >
> > > > AFAIK there is an incompatible change in -next to change the
> > > > definition of the __alias() macro
> > >
> > > Indeed. The following diff needs to be applied as a fixup to
> > > treewide-remove-stringification-from-__alias-macro-definition.patch in
> > > mmotm.
> > >
> > > Cheers,
> > > Nathan
> > >
> > > diff --git a/arch/arm/boot/compressed/string.c b/arch/arm/boot/compressed/string.c
> > > index 8c0fa276d994..cc6198f8a348 100644
> > > --- a/arch/arm/boot/compressed/string.c
> > > +++ b/arch/arm/boot/compressed/string.c
> > > @@ -21,9 +21,9 @@
> > >  #undef memcpy
> > >  #undef memmove
> > >  #undef memset
> > > -void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias(memcpy);
> > > -void *__memmove(void *__dest, __const void *__src, size_t count) __alias(memmove);
> > > -void *__memset(void *s, int c, size_t count) __alias(memset);
> > > +void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias("memcpy");
> > > +void *__memmove(void *__dest, __const void *__src, size_t count) __alias("memmove");
> > > +void *__memset(void *s, int c, size_t count) __alias("memset");
> > >  #endif
> > >
> > >  void *memcpy(void *__dest, __const void *__src, size_t __n)
> >
> > Aha. So shall we submit this to Russell? I figure that his git will not
> > build *without* the changes from mmotm?
> >
> > That tree isn't using git either is it?
> >
> > Is this one of those cases where we should ask Stephen R
> > to carry this patch on top of -next until the merge window?
>
> Another solution would be to drop 9017/2 ("Enable KASan for ARM")
> until the following merge window, and queue up the non-conflicing
> ARM KASan fixes in my "misc" branch along with the rest of KASan,
> and the conflicting patches along with 9017/2 in the following
> merge window.
>
> That means delaying KASan enablement another three months or so,
> but should result in less headaches about how to avoid build
> breakage with different bits going through different trees.
>
> Comments?
>

Alternatively, we could simply switch these to the bare
__attribute__((alias(".."))) syntax now, and revert that change again
one cycle later.
