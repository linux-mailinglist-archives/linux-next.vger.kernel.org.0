Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEC12AB1CE
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 08:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgKIHkd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 02:40:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:51166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728038AbgKIHkc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Nov 2020 02:40:32 -0500
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 144F42083B;
        Mon,  9 Nov 2020 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604907632;
        bh=CdqrK974gDlyEi/kvuoxck4jtpAjC9LfgZm6/XYiZgY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DEDESS5UTt89rYpFy1JTo9+eem+U8D0PsL3fFNaZMEE3KjiBJ03elc67iZw4FU1bB
         mUCHsOebOnjlDvpmNwsrc6KtbCEsHjGYM+OqDZbmyt8Ed0JpSoV3utniogLonjsiOn
         ABNS9Tkomj/MdnUmIA1AYQqsNKjurVKyqcJyGsJk=
Received: by mail-ot1-f47.google.com with SMTP id g19so8030577otp.13;
        Sun, 08 Nov 2020 23:40:32 -0800 (PST)
X-Gm-Message-State: AOAM5335BhvIbH2xYNIN2geCrdjLnSQPlsqrMfBUL6YnDwLZE9ph/YZk
        kNP7Cxzj1KhrrPm4/S8ZMu0LJWUU8bXqx7ybLg4=
X-Google-Smtp-Source: ABdhPJzngTfH1SnBjj+5ECgJpfUB+wr03SXOGvAH4gaRFZ2p15uaAw/DgQYJzq6/q9wQlR70F3l67DMeWQ/5c/moYT8=
X-Received: by 2002:a9d:62c1:: with SMTP id z1mr9182745otk.108.1604907631229;
 Sun, 08 Nov 2020 23:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20201108222156.GA1049451@ubuntu-m3-large-x86> <20201109001712.3384097-1-natechancellor@gmail.com>
In-Reply-To: <20201109001712.3384097-1-natechancellor@gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 9 Nov 2020 08:40:19 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEVX7za8JM3_STCeS8-j7WcvYq_vtUU7Or=yT+T9Jj7vw@mail.gmail.com>
Message-ID: <CAMj1kXEVX7za8JM3_STCeS8-j7WcvYq_vtUU7Or=yT+T9Jj7vw@mail.gmail.com>
Subject: Re: [PATCH] ARM: boot: Quote aliased symbol names in string.c
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Abbott Liu <liuwenliang@huawei.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joe Perches <joe@perches.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 9 Nov 2020 at 01:19, Nathan Chancellor <natechancellor@gmail.com> w=
rote:
>
> Patch "treewide: Remove stringification from __alias macro definition"
> causes arguments to __alias to no longer be quoted automatically, which
> breaks CONFIG_KASAN on ARM after commit d6d51a96c7d6 ("ARM: 9014/2:
> Replace string mem* functions for KASan"):
>
> arch/arm/boot/compressed/string.c:24:1: error: attribute 'alias' argument=
 not a string
>    24 | void *__memcpy(void *__dest, __const void *__src, size_t __n) __a=
lias(memcpy);
>       | ^~~~
> arch/arm/boot/compressed/string.c:25:1: error: attribute 'alias' argument=
 not a string
>    25 | void *__memmove(void *__dest, __const void *__src, size_t count) =
__alias(memmove);
>       | ^~~~
> arch/arm/boot/compressed/string.c:26:1: error: attribute 'alias' argument=
 not a string
>    26 | void *__memset(void *s, int c, size_t count) __alias(memset);
>       | ^~~~
> make[3]: *** [scripts/Makefile.build:283: arch/arm/boot/compressed/string=
.o] Error 1
>
> Quote the names like the treewide patch does so there is no more error.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Valdis Kl=C4=93tnieks <valdis.kletnieks@vt.edu>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>
> Hi Andrew,
>
> Stephen said I should send this along to you so that it can be applied
> as part of the post -next series. Please let me know if you need any
> more information or clarification, I tried to document it succinctly in
> the commit message.
>
> Cheers,
> Nathan
>
>  arch/arm/boot/compressed/string.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/compressed/string.c b/arch/arm/boot/compressed=
/string.c
> index 8c0fa276d994..cc6198f8a348 100644
> --- a/arch/arm/boot/compressed/string.c
> +++ b/arch/arm/boot/compressed/string.c
> @@ -21,9 +21,9 @@
>  #undef memcpy
>  #undef memmove
>  #undef memset
> -void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias(me=
mcpy);
> -void *__memmove(void *__dest, __const void *__src, size_t count) __alias=
(memmove);
> -void *__memset(void *s, int c, size_t count) __alias(memset);
> +void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias("m=
emcpy");
> +void *__memmove(void *__dest, __const void *__src, size_t count) __alias=
("memmove");
> +void *__memset(void *s, int c, size_t count) __alias("memset");
>  #endif
>
>  void *memcpy(void *__dest, __const void *__src, size_t __n)
> --
> 2.29.2
>
