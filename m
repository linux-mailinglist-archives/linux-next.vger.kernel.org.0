Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 200205BA94F
	for <lists+linux-next@lfdr.de>; Fri, 16 Sep 2022 11:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbiIPJY1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Sep 2022 05:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiIPJY0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Sep 2022 05:24:26 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05080642FA
        for <linux-next@vger.kernel.org>; Fri, 16 Sep 2022 02:24:25 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3378303138bso252409207b3.9
        for <linux-next@vger.kernel.org>; Fri, 16 Sep 2022 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ICLxIYLKXePaeX7uqOrK23uRDuhGBueBgNNfHGZTbYo=;
        b=iKuPoaJFZuGpISn2LNxjPZDTYltZp2yYz7EjsSDOTMSrsmWKISyQWE+8R0W3Noaxdh
         J67WD0GhPNbs2ZfwpPxNgbFMM4v//+o2m6W92oNOWGoQp8Pm2HMq1js5UI1sFo87fUI9
         MvqGeHVFn9D1YGWApSlPSYmnXrGlHwaLfjdQFN0BwObXO3DUgO3RrA6T3xaQqEPGLzXQ
         0EXws5GnRh/SMbPaMkkyLZ+getRmmxwYdyMEUYQYwgzjcGGlv3ejcfImrZFEFoXl2eih
         RHAeAef5dhW/OI5ZfMGUohaRMTire37kk8EJdr2qZumLOUhrmXM2g5T6Apj/GBOEG16z
         rgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ICLxIYLKXePaeX7uqOrK23uRDuhGBueBgNNfHGZTbYo=;
        b=hpc97svDeuReCkFvedlNgdqrVOjspwQTarXwQea++1oQQQQKHPYlY1UtOSj9n4Vaeo
         Cv78nE4yhJBho8QnYSVu95cZb46z+Uy4yfQF6fFzCIy9gGMfOE7h4BC228ipHPgZlAkV
         kdX+gHqfEtiHn891KyBQPvz7z+0BaQug8ZJSKRSbDujXxkwHHqR+RQuON3s15wNwHM12
         unHqe/UZ4gM6+8VqCOeSL3jJJdDl9ftgShyXpaqcWvFAVxsOTG3NTd/lzR3dFaVY0Siy
         RXa8CgGplml+c6luY1+deq4gpQ0DpM7gIJH4P3lCT7BEhz3WzFnitZUC/S0mj8hDtlyc
         Lm2A==
X-Gm-Message-State: ACrzQf1SH6DH7uq6TqARRWYoX65FimdCkAOCyS5ZHLIA1dd4SaIAgIBG
        CemGRbKVAb5vFdlh0wOblGAkCiimCX8OqttVc65OvJIQIUFHxw==
X-Google-Smtp-Source: AMsMyM4IEyu4SELoiPZYqJXqFSsxD8xWUmDmdqx1BOynAfW+NapM9J/HLecVe0kFGIteirFbOOlJXPKdVbsta53L3Cs=
X-Received: by 2002:a0d:d64b:0:b0:345:2455:a1c with SMTP id
 y72-20020a0dd64b000000b0034524550a1cmr3593259ywd.295.1663320264035; Fri, 16
 Sep 2022 02:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220909095811.2166073-1-glider@google.com> <20220909095811.2166073-2-glider@google.com>
In-Reply-To: <20220909095811.2166073-2-glider@google.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Fri, 16 Sep 2022 11:23:47 +0200
Message-ID: <CAG_fn=UT24yoY=amdXF5gXQjM9jw8bMamjC-mqJndiXNtNhvLA@mail.gmail.com>
Subject: Re: [PATCH -next 2/2] crypto: x86: kmsan: disable accelerated configs
 in KMSAN builds
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Robert Elliott <elliott@hpe.com>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-next <linux-next@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Please use this patch to replace "crypto: x86: kmsan: disable
accelerated configs in KMSAN builds" when merging linux-mm into
linux-next (assuming arch/x86/crypto/Kconfig is still in -next).

On Fri, Sep 9, 2022 at 11:58 AM Alexander Potapenko <glider@google.com> wro=
te:
>
> KMSAN is unable to understand when initialized values come from assembly.
> Disable accelerated configs in KMSAN builds to prevent false positive
> reports.
>
> Signed-off-by: Alexander Potapenko <glider@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Robert Elliott <elliott@hpe.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-next@vger.kernel.org
> ---
>  crypto/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 40423a14f86f5..4a2915bd40d1f 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1430,7 +1430,9 @@ endif
>  if SPARC
>  source "arch/sparc/crypto/Kconfig"
>  endif
> -if X86
> +# KMSAN is unable to understand when initialized values come from assemb=
ly.
> +# Disable accelerated configs to prevent false positive reports.
> +if X86 && !KMSAN
>  source "arch/x86/crypto/Kconfig"
>  endif
>
> --
> 2.37.2.789.g6183377224-goog
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
