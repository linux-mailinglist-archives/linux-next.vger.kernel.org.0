Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C712F5B002E
	for <lists+linux-next@lfdr.de>; Wed,  7 Sep 2022 11:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiIGJTE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Sep 2022 05:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiIGJTD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Sep 2022 05:19:03 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B428CA8CF7
        for <linux-next@vger.kernel.org>; Wed,  7 Sep 2022 02:19:01 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3378303138bso120616487b3.9
        for <linux-next@vger.kernel.org>; Wed, 07 Sep 2022 02:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=l0xEQsbE2eoqhPdBFlcigg1eN1FK5AXrP7+HDFAlaUE=;
        b=sUS1aDgkN2F7qDNQFo7UhD5sIWnOsIti/09pvl8QW2dvlDcrWdWMWhSCBnJPOVWWw/
         LCza7grxM0GEHXYfbaYp7mCIHrSp8qPirbI6CnCxPC7H8KmRqKXeSNY8eGYJ8GJ4hvCd
         yHmviexb3XBBXRYvr7S4mRDKFgU5qbCOcTjSxxSusazG4KgJZEaEDoNrrosAdxpRq0L4
         DM8qYmkbI4AnjMwS4GbqGFBy2HPy9VX16T1gHZ9uL24h/YYcwbmRMEC+CzIpqRpKM5Z8
         NaQwiM6YY7HhhlVPucpDtDPxhSyDklnzVLhA2JzHYldjutBkTes37WSX25Q/xAZ4MAc9
         +9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=l0xEQsbE2eoqhPdBFlcigg1eN1FK5AXrP7+HDFAlaUE=;
        b=WN6bIGaBHSUCqilbnzMtKNlkg0PR9HHj/Wius/SOtlGjRkl5rW5UOaZmJk/C49Vc9j
         hXq+WkfKjRfOYaNhlXhtU35eufVASITb6m618hIs08M0tpfRY/K6zcil5Kqid4p9zUiI
         3g1PgzPY2GIcOSs6EnnjTsGJpv0RZqGAv8RjbOuzLitccBp4vP1s/SHhtY7qoHKurmIv
         43FCQFo9CizZ/q3Cthc+Qb2eH0Rq5yXo5EImSvIy4wDJgzuC6LaGA1Yn2PQ63+ZOGFBg
         FTErT244iTG8tQz+AYw/Qe2ttT8N2ruEJ8ozqm0WvCcvWgYNC5mB59Qb2JNqCTXRW5dA
         Tp5Q==
X-Gm-Message-State: ACgBeo2rpzHUzaOhzOxoarLPniFfy2gcHkw/t/jCVsZ3iXs4yFRlaY7p
        9oIzsLUl9ewo+udxeRP8ELx6CaNKTjfW4EuaGYvZ5w==
X-Google-Smtp-Source: AA6agR4sGDmad8J6SsCn9OzzNznBTVx37Wjtmkh4S0tz8IuBXk4DHNwwKMcMYxXfF4zetY6o1eGSrmXVp75zdbZ5nV0=
X-Received: by 2002:a81:92c4:0:b0:340:bd1f:3e35 with SMTP id
 j187-20020a8192c4000000b00340bd1f3e35mr2227850ywg.324.1662542340831; Wed, 07
 Sep 2022 02:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220906202017.5093fd23@canb.auug.org.au> <YxfFzGObDWsylCK+@quark>
In-Reply-To: <YxfFzGObDWsylCK+@quark>
From:   Alexander Potapenko <glider@google.com>
Date:   Wed, 7 Sep 2022 11:18:24 +0200
Message-ID: <CAG_fn=UcWy+gbYLDM2WQZ=BZuVRML17KJ0L+=zsSg7+yDo4oGA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with the crypto tree
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 7, 2022 at 12:12 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Tue, Sep 06, 2022 at 08:20:17PM +1000, Stephen Rothwell wrote:
> > diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
> > index 9bb0f7939c6b..856f5d8ca65f 100644
> > --- a/arch/x86/crypto/Kconfig
> > +++ b/arch/x86/crypto/Kconfig
> > @@ -5,6 +5,7 @@ menu "Accelerated Cryptographic Algorithms for CPU (x86=
)"
> >  config CRYPTO_CURVE25519_X86
> >       tristate "Public key crypto: Curve25519 (ADX)"
> >       depends on X86 && 64BIT
> > +     depends on !KMSAN # avoid false positives from assembly
> >       select CRYPTO_LIB_CURVE25519_GENERIC
> >       select CRYPTO_ARCH_HAVE_LIB_CURVE25519
> >       help
> > @@ -16,6 +17,7 @@ config CRYPTO_CURVE25519_X86
> >  config CRYPTO_AES_NI_INTEL
> >       tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XTR, XTS, GCM =
(AES-NI)"
> >       depends on X86
> > +     depends on !KMSAN # avoid false positives from assembly
> >       select CRYPTO_AEAD
> >       select CRYPTO_LIB_AES
> >       select CRYPTO_ALGAPI
> > @@ -32,6 +34,7 @@ config CRYPTO_AES_NI_INTEL
> >  config CRYPTO_BLOWFISH_X86_64
> >       tristate "Ciphers: Blowfish, modes: ECB, CBC"
> >       depends on X86 && 64BIT
> > +     depends on !KMSAN # avoid false positives from assembly
> >       select CRYPTO_SKCIPHER
> >       select CRYPTO_BLOWFISH_COMMON
> >       imply CRYPTO_CTR
> > @@ -44,6 +47,7 @@ config CRYPTO_BLOWFISH_X86_64
> >  config CRYPTO_CAMELLIA_X86_64
> >       tristate "Ciphers: Camellia with modes: ECB, CBC"
> >       depends on X86 && 64BIT
> > +     depends on !KMSAN # avoid false positives from assembly
> >       select CRYPTO_SKCIPHER
> >       imply CRYPTO_CTR
> >       help
> > @@ -55,6 +59,7 @@ config CRYPTO_CAMELLIA_X86_64
> >  config CRYPTO_CAMELLIA_AESNI_AVX_X86_64
> >       tristate "Ciphers: Camellia with modes: ECB, CBC (AES-NI/AVX)"
> >       depends on X86 && 64BIT
> > +     depends on !KMSAN # avoid false positives from assembly
> >       select CRYPTO_SKCIPHER
> >       select CRYPTO_CAMELLIA_X86_64
> >       select CRYPTO_SIMD
>
> Are there any options in arch/x86/crypto/Kconfig that *don't* need a depe=
ndency
> on !KMSAN?  If not, this could be done in a much simpler way.

Am I understanding right that arch/x86/crypto is supposed to contain
algorithms implemented in x86 assembly rather than plain C?
If so, we should definitely disable all of them under KMSAN to avoid
false positives. And, yes, in a simpler way :)

What's the best way to handle this? Send another patch series? Or
maybe just an update for "crypto: kmsan: disable accelerated configs
under KMSAN"?

> - Eric



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
