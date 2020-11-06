Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549D82A9140
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 09:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgKFI0z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 03:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgKFI0z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 03:26:55 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B43C0613CF
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 00:26:53 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id i6so762101lfd.1
        for <linux-next@vger.kernel.org>; Fri, 06 Nov 2020 00:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VC/T1FT9GsTzXt8MrK2U0stjqybJMsRT6B8SzwuOs7A=;
        b=XW4NMtB+Ujwgd6Lpz6/YuaW41AbEFHJL2paxyODyG7aXpoDMLWfcgjyc5QLwBY6egK
         7jFxceZoKefxNEsjWAqPqkaTsE4elO1if2AX85oB0bN4UwLdlCsUytVGDIYJRYoWXGRQ
         Y80adprrS43dlRuKO2Bc2dGDdNPuNC6mcohGWzirvPpO7ydNwIUOiUFk3+O4c1uZ8WJX
         nisTUV8XpqEqoDPAjGDwsuinB/QLzLHD0DgUsYRFCwBKiNQYKiBkgO6yS7yf5X8qAle+
         JH7H5qAY/YZAKaRG9dLR7FZI5KYfnkti7WFR8s4wptO2s+BavFrrc1omEM8C36LjH9QO
         G95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VC/T1FT9GsTzXt8MrK2U0stjqybJMsRT6B8SzwuOs7A=;
        b=BVZt8N0CN1RVhVs5wGSzPu2MzBAPiBxTxK2Ca+yAlQFtiLScFYaaB3YKsa1G6g6bDz
         9gMmXm69ZQAlOK4yG9IDHCcxPUOF7sQsHDA5QhRYsXHeDNGev6eAAQRqDgpt0wCe0EuX
         EmfUcu4ytIEUqrT/R44ZNLgPzOyrFkwzQQZe2OB6lgVlOep+k9s0jOqG8KZB4AV8ubkw
         dp0gkaUYhIF9+TKrYHPlN6f4VNKvZoIwpol/CwleM7Sw4rIzKd4M0MvDW/9cntF+IkM2
         sOPUFfNoGUr2LN67KaPLJwTsbKiZSRYiJTYis2uU+yMOLIJ2ys4WZMwlUXVeodzxsIR+
         BAQA==
X-Gm-Message-State: AOAM532q9KgDQUjSgbFoyVjyW34Zlqrg4QPw4vLkHZKy03fnixLdI8fB
        54ySA+nmhMNqKRLvLhExHyntVR7IsOZdsKUVjg1b7g==
X-Google-Smtp-Source: ABdhPJxcEer3vKFbZWP9sxEEBz6qBK+m8PN9kXZJsgpVRZ+BkuNOw5785VmNlavj7hyCFJ4puhVp5SUF6NdaFGq7QBc=
X-Received: by 2002:a19:5e0b:: with SMTP id s11mr405072lfb.502.1604651212485;
 Fri, 06 Nov 2020 00:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org> <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
In-Reply-To: <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Nov 2020 09:26:41 +0100
Message-ID: <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
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

On Fri, Nov 6, 2020 at 8:49 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> arm KASAN build failure noticed on linux next 20201106 tag.
> gcc: 9.x
>
> Build error:
> ---------------
> arch/arm/boot/compressed/string.c:24:1: error: attribute 'alias'
> argument not a string
>    24 | void *__memcpy(void *__dest, __const void *__src, size_t __n)
> __alias(memcpy);
>       | ^~~~
> arch/arm/boot/compressed/string.c:25:1: error: attribute 'alias'
> argument not a string
>    25 | void *__memmove(void *__dest, __const void *__src, size_t
> count) __alias(memmove);
>       | ^~~~
> arch/arm/boot/compressed/string.c:26:1: error: attribute 'alias'
> argument not a string
>    26 | void *__memset(void *s, int c, size_t count) __alias(memset);
>       | ^~~~
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> Build details link,
> https://builds.tuxbuild.com/1juBs4tXRA6Cwhd1Qnhh4vzCtDx/

This looks like a randconfig build.

Please drill down and try to report which combination of config
options that give rise to this problem so we have a chance of
amending it.

Yours,
Linus Walleij
