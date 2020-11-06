Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAB72A9710
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 14:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbgKFNhf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 08:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbgKFNhf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 08:37:35 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50783C0613CF
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 05:37:34 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id l10so1398949lji.4
        for <linux-next@vger.kernel.org>; Fri, 06 Nov 2020 05:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1d9mjFc0ki/4lcF4Gjq/ke9oRs4vU8scTXfsKfjB4Zc=;
        b=u5oG+XvG+9ppyxui4jfxyKDaOB6IMdoTaJWCD9zSVLzv9z+iYwlq9EjV16DQoayEk9
         bTizX259ea3KtPgchEmJIjhCRGHS9cCXZ+ySAdS9eIdy/j631U5ZmF6u7X6GBjt/lSjk
         3QYSmDSTZpqbbLxcR5cdvWWZPb1IvSeOPbqUWpazj/E+T6nn0XlHm4jD/9ChndAEhj6G
         wxJKToj4R0hotsYjM7WNXIoeqSu3eu5cGD3plzuqTf4IzyRl1C53MbBX/qYf0fgaeYQw
         fD+GiCpnhcxMAKiaTF2gAEGQDKivJdkPUVGxT+l/RgNeUeOFX8XCi2hNBd+QZ+sMDCMC
         KiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1d9mjFc0ki/4lcF4Gjq/ke9oRs4vU8scTXfsKfjB4Zc=;
        b=XKTWbJ3ojnWRU4kaL2CA8Hll6Fb3gXpuJLBTJeAiROMnRvGc/6H5O75awpS9Z6XGgH
         YNmBMQcJjBpgncqUmQaRSdpJdaB7OmEPS05tzMVnUK92odteL+gYEWipA7e1XeMQpwjg
         hOKpznrejHPbspywH2CsyjBwAAebfmIlW+qQcgADfTsq0og7CscIy1FLZqCiIfVzZwae
         FWBhTJRFJvPrF/IVOVLaU738nHs8pNQc3tBcgdRj7eMdx0weHf0jYqdgMOMlZXgpSc/u
         7+Xd7L7t4kG5IiR/Ul76kup8b5GDLP3X1bSANLtd+T44jlqHqDO7UhuFynihkm1lpQAa
         91nQ==
X-Gm-Message-State: AOAM530rRbweu3Q5jN9qnMlTsY3YgX5p/MQ24uYU8R6WQiV/wq0wd7wi
        T+9GWosk0x6ZlTvokgP8X9BR9mYS/mYWoQQIbyoX5Q==
X-Google-Smtp-Source: ABdhPJxvQWpcAPxxmyuBOCCaSx2hfdnEnYoFklwQYVjEDK0+SqYrFAWh1ZheKIP5LS2F6/AohVw21TOOIw1Dz+moQKU=
X-Received: by 2002:a2e:8604:: with SMTP id a4mr178992lji.100.1604669852790;
 Fri, 06 Nov 2020 05:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org> <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com> <20201106094434.GA3268933@ubuntu-m3-large-x86>
In-Reply-To: <20201106094434.GA3268933@ubuntu-m3-large-x86>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Nov 2020 14:37:21 +0100
Message-ID: <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
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

On Fri, Nov 6, 2020 at 10:44 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> On Fri, Nov 06, 2020 at 09:28:09AM +0100, Ard Biesheuvel wrote:

> > AFAIK there is an incompatible change in -next to change the
> > definition of the __alias() macro
>
> Indeed. The following diff needs to be applied as a fixup to
> treewide-remove-stringification-from-__alias-macro-definition.patch in
> mmotm.
>
> Cheers,
> Nathan
>
> diff --git a/arch/arm/boot/compressed/string.c b/arch/arm/boot/compressed/string.c
> index 8c0fa276d994..cc6198f8a348 100644
> --- a/arch/arm/boot/compressed/string.c
> +++ b/arch/arm/boot/compressed/string.c
> @@ -21,9 +21,9 @@
>  #undef memcpy
>  #undef memmove
>  #undef memset
> -void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias(memcpy);
> -void *__memmove(void *__dest, __const void *__src, size_t count) __alias(memmove);
> -void *__memset(void *s, int c, size_t count) __alias(memset);
> +void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias("memcpy");
> +void *__memmove(void *__dest, __const void *__src, size_t count) __alias("memmove");
> +void *__memset(void *s, int c, size_t count) __alias("memset");
>  #endif
>
>  void *memcpy(void *__dest, __const void *__src, size_t __n)

Aha. So shall we submit this to Russell? I figure that his git will not
build *without* the changes from mmotm?

That tree isn't using git either is it?

Is this one of those cases where we should ask Stephen R
to carry this patch on top of -next until the merge window?

Yours,
Linus Walleij
