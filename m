Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6947A2C8144
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 10:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgK3Joa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 04:44:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:54564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgK3Joa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 04:44:30 -0500
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01B162084C;
        Mon, 30 Nov 2020 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606729429;
        bh=WPjDf9shA+FZpM1rRreXiB4/UFq0Y4al8X/x+PuX5pU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZNkuebfZEbYG53BbH5aBNwc4RZW0WyGbXQnSoJm2TQ+u4hoa8YMkVIcRbWV45EaTD
         wRHuzEydWQ1scbN/wDOQswBaTEuD8cNiU8Kzsx5mnHxnBVV9izIwqtIXoK4cFWXg2e
         /0xDr2HwtHe/ukuySTqx+Xr6zvM/lmiZ4JPvP5EA=
Received: by mail-oi1-f180.google.com with SMTP id v202so13476755oia.9;
        Mon, 30 Nov 2020 01:43:48 -0800 (PST)
X-Gm-Message-State: AOAM533WZ1F9qv+SPGEbXd6pEywHpDE/Px+fhxmxcopB8SVfP6TCEpG2
        AJMyWHi7sq0W8dfN/Lt/DS0OpPmj8yFP7s9br+o=
X-Google-Smtp-Source: ABdhPJw/REwXYyXN0jfy0b3VxUwHejdWOAInYsaPwUI85V+Rz597zCnCwZw42AZfK6tKdfyMxtQ/5vMU5yDB54EUM8M=
X-Received: by 2002:aca:c657:: with SMTP id w84mr13734473oif.47.1606729428170;
 Mon, 30 Nov 2020 01:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20201117133214.29114-1-ardb@kernel.org> <CAMuHMdUzFLk=oYo1aK80d0H-qZ1_1BcdSULkYCxBnLWT_qUR2A@mail.gmail.com>
In-Reply-To: <CAMuHMdUzFLk=oYo1aK80d0H-qZ1_1BcdSULkYCxBnLWT_qUR2A@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 30 Nov 2020 10:43:37 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGuxuB2iv-k60PCSkmec-=_+kKRnE3XSXeqNLihqrH9vQ@mail.gmail.com>
Message-ID: <CAMj1kXGuxuB2iv-k60PCSkmec-=_+kKRnE3XSXeqNLihqrH9vQ@mail.gmail.com>
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

On Mon, 30 Nov 2020 at 10:37, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Ard,
>
> On Tue, Nov 17, 2020 at 2:38 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > This series supersedes [0] '[PATCH] crypto: aegis128/neon - optimize ta=
il
> > block handling', which is included as patch #3 here, but hasn't been
> > modified substantially.
> >
> > Patch #1 should probably go to -stable, even though aegis128 does not a=
ppear
> > to be widely used.
> >
> > Patches #2 and #3 improve the SIMD code paths.
> >
> > Patch #4 enables fuzz testing for the SIMD code by registering the gene=
ric
> > code as a separate driver if the SIMD code path is enabled.
> >
> > Changes since v2:
> > - add Ondrej's ack to #1
> > - fix an issue spotted by Ondrej in #4 where the generic code path woul=
d still
> >   use some of the SIMD helpers
> >
> > Cc: Ondrej Mosnacek <omosnacek@gmail.com>
> > Cc: Eric Biggers <ebiggers@kernel.org>
> >
> > [0] https://lore.kernel.org/linux-crypto/20201107195516.13952-1-ardb@ke=
rnel.org/
> >
> > Ard Biesheuvel (4):
> >   crypto: aegis128 - wipe plaintext and tag if decryption fails
> >   crypto: aegis128/neon - optimize tail block handling
> >   crypto: aegis128/neon - move final tag check to SIMD domain
>
> crypto/aegis128-core.c: In function =E2=80=98crypto_aegis128_decrypt=E2=
=80=99:
> crypto/aegis128-core.c:454:40: error: passing argument 2 of
> =E2=80=98crypto_aegis128_process_crypt=E2=80=99 from incompatible pointer=
 type
> [-Werror=3Dincompatible-pointer-types]
>   454 |    crypto_aegis128_process_crypt(NULL, req, &walk,
>       |                                        ^~~
>       |                                        |
>       |                                        struct aead_request *
> crypto/aegis128-core.c:335:29: note: expected =E2=80=98struct skcipher_wa=
lk *=E2=80=99
> but argument is of type =E2=80=98struct aead_request *=E2=80=99
>   335 |       struct skcipher_walk *walk,
>       |       ~~~~~~~~~~~~~~~~~~~~~~^~~~
> crypto/aegis128-core.c:454:45: error: passing argument 3 of
> =E2=80=98crypto_aegis128_process_crypt=E2=80=99 from incompatible pointer=
 type
> [-Werror=3Dincompatible-pointer-types]
>   454 |    crypto_aegis128_process_crypt(NULL, req, &walk,
>       |                                             ^~~~~
>       |                                             |
>       |                                             struct skcipher_walk =
*
> crypto/aegis128-core.c:336:14: note: expected =E2=80=98void (*)(struct
> aegis_state *, u8 *, const u8 *, unsigned int)=E2=80=99 {aka =E2=80=98voi=
d (*)(struct
> aegis_state *, unsigned char *, const unsigned char *, unsigned int)=E2=
=80=99}
> but argument is of type =E2=80=98struct skcipher_walk *=E2=80=99
>   336 |       void (*crypt)(struct aegis_state *state,
>       |       ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   337 |              u8 *dst, const u8 *src,
>       |              ~~~~~~~~~~~~~~~~~~~~~~~
>   338 |              unsigned int size))
>       |              ~~~~~~~~~~~~~~~~~~
> crypto/aegis128-core.c:454:4: error: too many arguments to function
> =E2=80=98crypto_aegis128_process_crypt=E2=80=99
>   454 |    crypto_aegis128_process_crypt(NULL, req, &walk,
>       |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> crypto/aegis128-core.c:334:5: note: declared here
>   334 | int crypto_aegis128_process_crypt(struct aegis_state *state,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[1]: *** [scripts/Makefile.build:283: crypto/aegis128-core.o] Error 1
>
> >   crypto: aegis128 - expose SIMD code path as separate driver
>
> Fixes the above, but causes
>
> ERROR: modpost: "crypto_aegis128_update_simd" [crypto/aegis128.ko] undefi=
ned!
>
> as reported by noreply@ellerman.id.au for m68k/defconfig and
> m68k/sun3_defconfig.
> (neon depends on arm).
>

Thanks for the report.

It seems like GCC is not optimizing away calls to routines that are
unreachable. Which GCC version are you using?
