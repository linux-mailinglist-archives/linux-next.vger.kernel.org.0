Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E722C83F4
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 13:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgK3MPi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 30 Nov 2020 07:15:38 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41773 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgK3MPi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 07:15:38 -0500
Received: by mail-ot1-f67.google.com with SMTP id f48so2535182otf.8;
        Mon, 30 Nov 2020 04:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5qb1CWw5PmfOkyZxBUuxqZGbsX8FHBs0TJS0C52QqhU=;
        b=Oq3OcF96FybsjIsfW2VvKsmgJKgCl2sMrw4vKEc40TMzbv2SWUgG53GjvTN7X7Vjas
         ERmcE18EsF8/3ugWzrpYIAyyRmVIYKrM11yx2xnEDKlt0/qD2Q8QrVwreoNrQ5Ceo6Le
         3hI0DdlD0z0jNBa5NGtPTFvkljaCWq+ODPYLDDeSLQ8wbxgxlH14XDdYc7PTpvnjaoq2
         rygHFA1cblP7HBcSpyzjjtAw3XAlCy4DWvG5Buj6QdoKoOa78dib/PqXPqQGiOJ9nv4L
         vER3CCeuJhRmGcPlCQvoTXc9ol2vDVEnNXbAh8Tz9WAMSq0Awv2cgihev/Wv96NUkkvX
         rFKA==
X-Gm-Message-State: AOAM530Ujp6C+CVMRJa4Sd+RRasHS6MV6R3s4xruzzUbNv8DpfPPQ4Fm
        RMSfROLb/WAsBkvKu+DqydKwn3KD1naapLCWpno=
X-Google-Smtp-Source: ABdhPJzqOK1Q7fe5+sI/z81EMBGrzOpf7l2i1KenIH3yL3ceHNgKylUaW1ZxIAXULlF3ZetnmBf32qdcPR0AlLlaY4s=
X-Received: by 2002:a9d:686:: with SMTP id 6mr15367631otx.107.1606738496717;
 Mon, 30 Nov 2020 04:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20201117133214.29114-1-ardb@kernel.org> <CAMuHMdUzFLk=oYo1aK80d0H-qZ1_1BcdSULkYCxBnLWT_qUR2A@mail.gmail.com>
 <CAMj1kXGuxuB2iv-k60PCSkmec-=_+kKRnE3XSXeqNLihqrH9vQ@mail.gmail.com> <CAMj1kXH5SCe-v37BJrv3m2T6sHFkRfB6fPPk_+tvTtCZEZSkxQ@mail.gmail.com>
In-Reply-To: <CAMj1kXH5SCe-v37BJrv3m2T6sHFkRfB6fPPk_+tvTtCZEZSkxQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 13:14:45 +0100
Message-ID: <CAMuHMdWRA6fSxnY7D1kYvxXPy0UkA7=1iJU+hYxJFM-5zOtf9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] crypto: aegis128 enhancements
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Ondrej Mosnacek <omosnacek@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Ard,

On Mon, Nov 30, 2020 at 10:45 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Mon, 30 Nov 2020 at 10:43, Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Mon, 30 Nov 2020 at 10:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Nov 17, 2020 at 2:38 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > This series supersedes [0] '[PATCH] crypto: aegis128/neon - optimize tail
> > > > block handling', which is included as patch #3 here, but hasn't been
> > > > modified substantially.
> > > >
> > > > Patch #1 should probably go to -stable, even though aegis128 does not appear
> > > > to be widely used.
> > > >
> > > > Patches #2 and #3 improve the SIMD code paths.
> > > >
> > > > Patch #4 enables fuzz testing for the SIMD code by registering the generic
> > > > code as a separate driver if the SIMD code path is enabled.
> > > >
> > > > Changes since v2:
> > > > - add Ondrej's ack to #1
> > > > - fix an issue spotted by Ondrej in #4 where the generic code path would still
> > > >   use some of the SIMD helpers
> > > >
> > > > Cc: Ondrej Mosnacek <omosnacek@gmail.com>
> > > > Cc: Eric Biggers <ebiggers@kernel.org>
> > > >
> > > > [0] https://lore.kernel.org/linux-crypto/20201107195516.13952-1-ardb@kernel.org/
> > > >
> > > > Ard Biesheuvel (4):
> > > >   crypto: aegis128 - wipe plaintext and tag if decryption fails
> > > >   crypto: aegis128/neon - optimize tail block handling
> > > >   crypto: aegis128/neon - move final tag check to SIMD domain
> > >
> > > crypto/aegis128-core.c: In function ‘crypto_aegis128_decrypt’:
> > > crypto/aegis128-core.c:454:40: error: passing argument 2 of
> > > ‘crypto_aegis128_process_crypt’ from incompatible pointer type
> > > [-Werror=incompatible-pointer-types]
> > >   454 |    crypto_aegis128_process_crypt(NULL, req, &walk,
> > >       |                                        ^~~
> > >       |                                        |
> > >       |                                        struct aead_request *
> > > crypto/aegis128-core.c:335:29: note: expected ‘struct skcipher_walk *’
> > > but argument is of type ‘struct aead_request *’
> > >   335 |       struct skcipher_walk *walk,
> > >       |       ~~~~~~~~~~~~~~~~~~~~~~^~~~
> > > crypto/aegis128-core.c:454:45: error: passing argument 3 of
> > > ‘crypto_aegis128_process_crypt’ from incompatible pointer type
> > > [-Werror=incompatible-pointer-types]
> > >   454 |    crypto_aegis128_process_crypt(NULL, req, &walk,
> > >       |                                             ^~~~~
> > >       |                                             |
> > >       |                                             struct skcipher_walk *
> > > crypto/aegis128-core.c:336:14: note: expected ‘void (*)(struct
> > > aegis_state *, u8 *, const u8 *, unsigned int)’ {aka ‘void (*)(struct
> > > aegis_state *, unsigned char *, const unsigned char *, unsigned int)’}
> > > but argument is of type ‘struct skcipher_walk *’
> > >   336 |       void (*crypt)(struct aegis_state *state,
> > >       |       ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   337 |              u8 *dst, const u8 *src,
> > >       |              ~~~~~~~~~~~~~~~~~~~~~~~
> > >   338 |              unsigned int size))
> > >       |              ~~~~~~~~~~~~~~~~~~
> > > crypto/aegis128-core.c:454:4: error: too many arguments to function
> > > ‘crypto_aegis128_process_crypt’
> > >   454 |    crypto_aegis128_process_crypt(NULL, req, &walk,
> > >       |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > crypto/aegis128-core.c:334:5: note: declared here
> > >   334 | int crypto_aegis128_process_crypt(struct aegis_state *state,
> > >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > cc1: some warnings being treated as errors
> > > make[1]: *** [scripts/Makefile.build:283: crypto/aegis128-core.o] Error 1
> > >
> > > >   crypto: aegis128 - expose SIMD code path as separate driver
> > >
> > > Fixes the above, but causes
> > >
> > > ERROR: modpost: "crypto_aegis128_update_simd" [crypto/aegis128.ko] undefined!
> > >
> > > as reported by noreply@ellerman.id.au for m68k/defconfig and
> > > m68k/sun3_defconfig.
> > > (neon depends on arm).
> > >
> >
> > Thanks for the report.
> >
> > It seems like GCC is not optimizing away calls to routines that are

The code is not unreachable. Both crypto_aegis128_encrypt_simd() and
crypto_aegis128_decrypt_simd() call crypto_aegis128_process_ad(..., true);

> > unreachable. Which GCC version are you using?

I'm using 9.3.0, Kisskb is using 8.1.0.

> Also, mind checking whether the below works around this?
>
> diff --git a/crypto/aegis128-core.c b/crypto/aegis128-core.c
> index 2b05f79475d3..89dc1c559689 100644
> --- a/crypto/aegis128-core.c
> +++ b/crypto/aegis128-core.c
> @@ -89,7 +89,7 @@ static void crypto_aegis128_update_a(struct
> aegis_state *state,
>                                      const union aegis_block *msg,
>                                      bool do_simd)
>  {
> -       if (do_simd) {
> +       if (IS_ENABLED(CONFIG_CRYPTO_AEGIS128_SIMD) && do_simd) {
>                 crypto_aegis128_update_simd(state, msg);
>                 return;
>         }
> @@ -101,7 +101,7 @@ static void crypto_aegis128_update_a(struct
> aegis_state *state,
>  static void crypto_aegis128_update_u(struct aegis_state *state, const
> void *msg,
>                                      bool do_simd)
>  {
> -       if (do_simd) {
> +       if (IS_ENABLED(CONFIG_CRYPTO_AEGIS128_SIMD) && do_simd) {
>                 crypto_aegis128_update_simd(state, msg);
>                 return;
>         }

Thanks, that fixes the build for me.

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
