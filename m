Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCA82C8158
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 10:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727696AbgK3JqV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 04:46:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:55238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgK3JqU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 04:46:20 -0500
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 438852087C;
        Mon, 30 Nov 2020 09:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606729539;
        bh=KT1+7YktjRooS/9hqcGOO8XhLw6DtECjYur0Z5buZ2M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WqcYMOv9vaXd96YObWndy96IlQvOe7edyIZWmdeMyFMWrbjXCAeoDkWMsZeY+v3kP
         y5ABJIuKD7fGaemMmtQ9RzEBwjAoelILVRvpL1vGf1gD4+fAlUOsEuP2NBZbRvsQ1F
         XB+omyGhE1eoeb3Id+C7IeAFFhFooTYHZhh+iecs=
Received: by mail-ot1-f51.google.com with SMTP id z23so7024978oti.13;
        Mon, 30 Nov 2020 01:45:39 -0800 (PST)
X-Gm-Message-State: AOAM531ZieMOnHpRigSg6Lz3dfQ7I6Hka5ermKrtx7Ldrm4tn1CQU35d
        MVQ2fGjtkQZ10rL57b5L81518l5+x6XB70ip0Ds=
X-Google-Smtp-Source: ABdhPJyJEbZfGx39QhXGY/3Nb6wQbbM9zPm5u+cJMEglEaVqnUpWV+d8P3qi/YSOp/KQUMpE1WdfuqDKb9mD98B3gCE=
X-Received: by 2002:a9d:62c1:: with SMTP id z1mr15971191otk.108.1606729538468;
 Mon, 30 Nov 2020 01:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20201117133214.29114-1-ardb@kernel.org> <CAMuHMdUzFLk=oYo1aK80d0H-qZ1_1BcdSULkYCxBnLWT_qUR2A@mail.gmail.com>
 <CAMj1kXGuxuB2iv-k60PCSkmec-=_+kKRnE3XSXeqNLihqrH9vQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGuxuB2iv-k60PCSkmec-=_+kKRnE3XSXeqNLihqrH9vQ@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 30 Nov 2020 10:45:27 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH5SCe-v37BJrv3m2T6sHFkRfB6fPPk_+tvTtCZEZSkxQ@mail.gmail.com>
Message-ID: <CAMj1kXH5SCe-v37BJrv3m2T6sHFkRfB6fPPk_+tvTtCZEZSkxQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] crypto: aegis128 enhancements
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Ondrej Mosnacek <omosnacek@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 30 Nov 2020 at 10:43, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 30 Nov 2020 at 10:37, Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> >
> > Hi Ard,
> >
> > On Tue, Nov 17, 2020 at 2:38 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > This series supersedes [0] '[PATCH] crypto: aegis128/neon - optimize =
tail
> > > block handling', which is included as patch #3 here, but hasn't been
> > > modified substantially.
> > >
> > > Patch #1 should probably go to -stable, even though aegis128 does not=
 appear
> > > to be widely used.
> > >
> > > Patches #2 and #3 improve the SIMD code paths.
> > >
> > > Patch #4 enables fuzz testing for the SIMD code by registering the ge=
neric
> > > code as a separate driver if the SIMD code path is enabled.
> > >
> > > Changes since v2:
> > > - add Ondrej's ack to #1
> > > - fix an issue spotted by Ondrej in #4 where the generic code path wo=
uld still
> > >   use some of the SIMD helpers
> > >
> > > Cc: Ondrej Mosnacek <omosnacek@gmail.com>
> > > Cc: Eric Biggers <ebiggers@kernel.org>
> > >
> > > [0] https://lore.kernel.org/linux-crypto/20201107195516.13952-1-ardb@=
kernel.org/
> > >
> > > Ard Biesheuvel (4):
> > >   crypto: aegis128 - wipe plaintext and tag if decryption fails
> > >   crypto: aegis128/neon - optimize tail block handling
> > >   crypto: aegis128/neon - move final tag check to SIMD domain
> >
> > crypto/aegis128-core.c: In function =E2=80=98crypto_aegis128_decrypt=E2=
=80=99:
> > crypto/aegis128-core.c:454:40: error: passing argument 2 of
> > =E2=80=98crypto_aegis128_process_crypt=E2=80=99 from incompatible point=
er type
> > [-Werror=3Dincompatible-pointer-types]
> >   454 |    crypto_aegis128_process_crypt(NULL, req, &walk,
> >       |                                        ^~~
> >       |                                        |
> >       |                                        struct aead_request *
> > crypto/aegis128-core.c:335:29: note: expected =E2=80=98struct skcipher_=
walk *=E2=80=99
> > but argument is of type =E2=80=98struct aead_request *=E2=80=99
> >   335 |       struct skcipher_walk *walk,
> >       |       ~~~~~~~~~~~~~~~~~~~~~~^~~~
> > crypto/aegis128-core.c:454:45: error: passing argument 3 of
> > =E2=80=98crypto_aegis128_process_crypt=E2=80=99 from incompatible point=
er type
> > [-Werror=3Dincompatible-pointer-types]
> >   454 |    crypto_aegis128_process_crypt(NULL, req, &walk,
> >       |                                             ^~~~~
> >       |                                             |
> >       |                                             struct skcipher_wal=
k *
> > crypto/aegis128-core.c:336:14: note: expected =E2=80=98void (*)(struct
> > aegis_state *, u8 *, const u8 *, unsigned int)=E2=80=99 {aka =E2=80=98v=
oid (*)(struct
> > aegis_state *, unsigned char *, const unsigned char *, unsigned int)=E2=
=80=99}
> > but argument is of type =E2=80=98struct skcipher_walk *=E2=80=99
> >   336 |       void (*crypt)(struct aegis_state *state,
> >       |       ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   337 |              u8 *dst, const u8 *src,
> >       |              ~~~~~~~~~~~~~~~~~~~~~~~
> >   338 |              unsigned int size))
> >       |              ~~~~~~~~~~~~~~~~~~
> > crypto/aegis128-core.c:454:4: error: too many arguments to function
> > =E2=80=98crypto_aegis128_process_crypt=E2=80=99
> >   454 |    crypto_aegis128_process_crypt(NULL, req, &walk,
> >       |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > crypto/aegis128-core.c:334:5: note: declared here
> >   334 | int crypto_aegis128_process_crypt(struct aegis_state *state,
> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: some warnings being treated as errors
> > make[1]: *** [scripts/Makefile.build:283: crypto/aegis128-core.o] Error=
 1
> >
> > >   crypto: aegis128 - expose SIMD code path as separate driver
> >
> > Fixes the above, but causes
> >
> > ERROR: modpost: "crypto_aegis128_update_simd" [crypto/aegis128.ko] unde=
fined!
> >
> > as reported by noreply@ellerman.id.au for m68k/defconfig and
> > m68k/sun3_defconfig.
> > (neon depends on arm).
> >
>
> Thanks for the report.
>
> It seems like GCC is not optimizing away calls to routines that are
> unreachable. Which GCC version are you using?

Also, mind checking whether the below works around this?

diff --git a/crypto/aegis128-core.c b/crypto/aegis128-core.c
index 2b05f79475d3..89dc1c559689 100644
--- a/crypto/aegis128-core.c
+++ b/crypto/aegis128-core.c
@@ -89,7 +89,7 @@ static void crypto_aegis128_update_a(struct
aegis_state *state,
                                     const union aegis_block *msg,
                                     bool do_simd)
 {
-       if (do_simd) {
+       if (IS_ENABLED(CONFIG_CRYPTO_AEGIS128_SIMD) && do_simd) {
                crypto_aegis128_update_simd(state, msg);
                return;
        }
@@ -101,7 +101,7 @@ static void crypto_aegis128_update_a(struct
aegis_state *state,
 static void crypto_aegis128_update_u(struct aegis_state *state, const
void *msg,
                                     bool do_simd)
 {
-       if (do_simd) {
+       if (IS_ENABLED(CONFIG_CRYPTO_AEGIS128_SIMD) && do_simd) {
                crypto_aegis128_update_simd(state, msg);
                return;
        }
