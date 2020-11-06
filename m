Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 090E92A90B2
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 08:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgKFHt1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 02:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgKFHt1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 02:49:27 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A195EC0613CF
        for <linux-next@vger.kernel.org>; Thu,  5 Nov 2020 23:49:26 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id o9so629397ejg.1
        for <linux-next@vger.kernel.org>; Thu, 05 Nov 2020 23:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jjc7vxJ+kNZjLh3qkBHMLjHb5L9dL8FqV47EXnVphz8=;
        b=mj7Hy0x0h1XDUx6QtWzEb6NLy/gw8+W1dPa8TvBPSPf0lrAEP/VtpsTHwETWj6wdTo
         OlIxHsKukW0xBNx/eccVSH730fswAADnbHaZWDoNOAV/15FAK8qekUj1s6oolRStQWY5
         DFJjZOpvZJa2ySuI37JuFiCWiU9K3ILFsSSYgLSgafgxpJ3Ax4fPbO9ybDrz7rNh6URr
         aL6oCq3vHwREEqXj65L+LrdmQ83PW5k2dmR6UY55N1nShpolDFDpRbYnjv3sTXdBCKHu
         7OkAuDSDZcrmTx5qmP76qeUH37GvCoqzfCC9dlarwN76X1TjFA4bwmMa+G1pkle6Bs7s
         c5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jjc7vxJ+kNZjLh3qkBHMLjHb5L9dL8FqV47EXnVphz8=;
        b=bczVCuA/kfb77Cn+aMt8FMUwLQRE5pbf2RwlMz2ob5APExP2CeyI3/SWI1O8LqYtBE
         V5FYVcQACg6JdtBUvB0K08dQ8y9kWV1OLrBdYjtahsFpJSHF+B7dnVXYoDpkpYDcGMc+
         rp+ERE6oC54ZgHnC9kuA+7t1XtT+1EI2P8bECWUoqsCqRXSjXqLUpIa5XbTV+C5EYK8e
         wEGftPTsQsjyboEh3tgSGeFrUg2yjhSY1lGjel3hvmQjoKD3xRQvdXfZgqNamVP7xFuh
         n5FRx9Wz9Gv9ktZG4kuB6wgR6EOLPZJ9D1eO2gfz5P4zR+khq05jrQ4Zq7cF1VycxEZv
         fYlA==
X-Gm-Message-State: AOAM532AYe8Cv+Dyexr4DmZlZQv7GhPDkMTekiAF5NYiM5+h/jWCPcvT
        p2L2oQxVU7h/xUBZZfh/22o+4Fq1L3eB4STK5ik8Ew==
X-Google-Smtp-Source: ABdhPJwL1YMqWn5H/GoXi4gN1vMy47d+zfK8NpaJgUcxxH9z4ay3PC3E9C8G/fuustnwBND455FksYMuLWhi9Z7nyjc=
X-Received: by 2002:a17:906:6987:: with SMTP id i7mr877544ejr.18.1604648965186;
 Thu, 05 Nov 2020 23:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20201019084140.4532-1-linus.walleij@linaro.org> <20201019084140.4532-3-linus.walleij@linaro.org>
In-Reply-To: <20201019084140.4532-3-linus.walleij@linaro.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 6 Nov 2020 13:19:14 +0530
Message-ID: <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
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

On Mon, 19 Oct 2020 at 14:14, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> From: Andrey Ryabinin <aryabinin@virtuozzo.com>
>
> Functions like memset()/memmove()/memcpy() do a lot of memory
> accesses.
>
> If a bad pointer is passed to one of these functions it is important
> to catch this. Compiler instrumentation cannot do this since these
> functions are written in assembly.
>
> KASan replaces these memory functions with instrumented variants.
>
> The original functions are declared as weak symbols so that
> the strong definitions in mm/kasan/kasan.c can replace them.
>
> The original functions have aliases with a '__' prefix in their
> name, so we can call the non-instrumented variant if needed.
>
> We must use __memcpy()/__memset() in place of memcpy()/memset()
> when we copy .data to RAM and when we clear .bss, because
> kasan_early_init cannot be called before the initialization of
> .data and .bss.
>
> For the kernel compression and EFI libstub's custom string
> libraries we need a special quirk: even if these are built
> without KASan enabled, they rely on the global headers for their
> custom string libraries, which means that e.g. memcpy()
> will be defined to __memcpy() and we get link failures.
> Since these implementations are written i C rather than
> assembly we use e.g. __alias(memcpy) to redirected any
> users back to the local implementation.
>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: kasan-dev@googlegroups.com
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Tested-by: Ard Biesheuvel <ardb@kernel.org> # QEMU/KVM/mach-virt/LPAE/8G
> Tested-by: Florian Fainelli <f.fainelli@gmail.com> # Brahma SoCs
> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de> # i.MX6Q
> Reported-by: Russell King - ARM Linux <linux@armlinux.org.uk>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v15->v16:
> - Fold in Ahmad Fatoum's fixup for fortify
> - Collect Florian's Tested-by
> - Resend with the other patches
> ChangeLog v14->v15:
> - Resend with the other patches
> ChangeLog v13->v14:
> - Resend with the other patches
> ChangeLog v12->v13:
> - Rebase on kernel v5.9-rc1
> ChangeLog v11->v12:
> - Resend with the other changes.
> ChangeLog v10->v11:
> - Resend with the other changes.
> ChangeLog v9->v10:
> - Rebase on v5.8-rc1
> ChangeLog v8->v9:
> - Collect Ard's tags.
> ChangeLog v7->v8:
> - Use the less invasive version of handling the global redefines
>   of the string functions in the decompressor: __alias() the
>   functions locally in the library.
> - Put in some more comments so readers of the code knows what
>   is going on.
> ChangeLog v6->v7:
> - Move the hacks around __SANITIZE_ADDRESS__ into this file
> - Edit the commit message
> - Rebase on the other v2 patches
> ---
>  arch/arm/boot/compressed/string.c | 19 +++++++++++++++++++
>  arch/arm/include/asm/string.h     | 26 ++++++++++++++++++++++++++
>  arch/arm/kernel/head-common.S     |  4 ++--
>  arch/arm/lib/memcpy.S             |  3 +++
>  arch/arm/lib/memmove.S            |  5 ++++-
>  arch/arm/lib/memset.S             |  3 +++
>  6 files changed, 57 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/compressed/string.c b/arch/arm/boot/compressed/string.c
> index ade5079bebbf..8c0fa276d994 100644
> --- a/arch/arm/boot/compressed/string.c
> +++ b/arch/arm/boot/compressed/string.c
> @@ -7,6 +7,25 @@
>
>  #include <linux/string.h>
>
> +/*
> + * The decompressor is built without KASan but uses the same redirects as the
> + * rest of the kernel when CONFIG_KASAN is enabled, defining e.g. memcpy()
> + * to __memcpy() but since we are not linking with the main kernel string
> + * library in the decompressor, that will lead to link failures.
> + *
> + * Undefine KASan's versions, define the wrapped functions and alias them to
> + * the right names so that when e.g. __memcpy() appear in the code, it will
> + * still be linked to this local version of memcpy().
> + */
> +#ifdef CONFIG_KASAN
> +#undef memcpy
> +#undef memmove
> +#undef memset
> +void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias(memcpy);
> +void *__memmove(void *__dest, __const void *__src, size_t count) __alias(memmove);
> +void *__memset(void *s, int c, size_t count) __alias(memset);
> +#endif
> +
>  void *memcpy(void *__dest, __const void *__src, size_t __n)

arm KASAN build failure noticed on linux next 20201106 tag.
gcc: 9.x

Build error:
---------------
arch/arm/boot/compressed/string.c:24:1: error: attribute 'alias'
argument not a string
   24 | void *__memcpy(void *__dest, __const void *__src, size_t __n)
__alias(memcpy);
      | ^~~~
arch/arm/boot/compressed/string.c:25:1: error: attribute 'alias'
argument not a string
   25 | void *__memmove(void *__dest, __const void *__src, size_t
count) __alias(memmove);
      | ^~~~
arch/arm/boot/compressed/string.c:26:1: error: attribute 'alias'
argument not a string
   26 | void *__memset(void *s, int c, size_t count) __alias(memset);
      | ^~~~

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Build details link,
https://builds.tuxbuild.com/1juBs4tXRA6Cwhd1Qnhh4vzCtDx/

-- 
Linaro LKFT
https://lkft.linaro.org
