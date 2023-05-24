Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E252070FAA8
	for <lists+linux-next@lfdr.de>; Wed, 24 May 2023 17:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237549AbjEXPng (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 May 2023 11:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237399AbjEXPnO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 May 2023 11:43:14 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5007E47
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 08:42:30 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2533ed4f1dcso298163a91.1
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684942884; x=1687534884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcbUUGVfTv0206jjEB8o4zl0tBTpQPMIXhfv9powgIA=;
        b=JUoEUqL9GCgT64YKyjTsSQLQyssCo2s5DjVICCVLyGVKEPYbtva9Ge94Hou/lv8gyq
         ekATbbNOC0VO/PyLa2Ep7VjZXnnzTvur5bs2GALGrLH+HNpQIycHn2U2iN8xzbm6NCGs
         N6TEpy93B1shn1wbe+dPvnPBcSVNJH89RxOyalT3qgkSP2YttLq7MLe7J6bDG6eqvfd0
         tUv7oIdZ0U+r2cqKzOceAj+u6Uw8rLTTdGRLVYycyweaWQ+P/ZwFbTXoyYulKXCTILzk
         9P6YeOun9KmQDSvlhV76rsTPsaBCf6kmxtvkRt+8Zx/BxB6hJ6jWIKhFZZsYELImuZRh
         x6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684942884; x=1687534884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcbUUGVfTv0206jjEB8o4zl0tBTpQPMIXhfv9powgIA=;
        b=GZ4IGykMHgUHWMdnfaZLCaSO7QACAHURbRWh7DVbIBRB8FHdYOeqRgBqRld83OfUoV
         oDvsMoluWr6z/xYFghQA/hG7sU3v8AC0jNQRndqb/nyBraUTS7dugzfR4y6x3XzsYlY5
         wWqJQ93pzgsVX0sAZYMKAlQFj7O+57X7rqXh8F4JMgfgw6FoI5A0tCmZgTsdDvR2ewQr
         oVumqNjeDFaipKvqsRqlPdsPu0RuL5MgSCaPLD3OK4PFMLnkWtjpvmmWmH9/UPPkKv+6
         5jq8p8VhX+JiFzU9xTF3xquNlgqHgwt1Y4UvzyYZad2TZDuSuqkXZehw5bgWvHpwnNTT
         pGKA==
X-Gm-Message-State: AC+VfDzgliPpvi0uBI/EssgTNl2wR4K9j1rVOGDpHCRQqRuHd+KkrMR3
        epu4Q9TRwYmibaEOIR4XmTPnx/PHLxUeLIQ3EU57DA==
X-Google-Smtp-Source: ACHHUZ5dswG3Tqnl2xznNJrUJTgaWJumpj8L1ig619SMi30QFXbZx6bqoCnlMVQEF4vymExc6hDQ1r5IL1lElyMkZog=
X-Received: by 2002:a17:90a:b389:b0:255:a1db:346d with SMTP id
 e9-20020a17090ab38900b00255a1db346dmr6718829pjr.25.1684942884011; Wed, 24 May
 2023 08:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com>
 <20230524153918.GA869320@dev-arch.thelio-3990X>
In-Reply-To: <20230524153918.GA869320@dev-arch.thelio-3990X>
From:   =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date:   Wed, 24 May 2023 09:41:12 -0600
Message-ID: <CAEUSe7-PUh4cDs_pQR6kp6GvAfz6qoqdPaOxRMMHz6YeXRuxAA@mail.gmail.com>
Subject: Re: next: clang: x86_64: /intel_display.c:6012:3: error: unannotated
 fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        arun.r.murthy@intel.com, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

On Wed, 24 May 2023 at 09:39, Nathan Chancellor <nathan@kernel.org> wrote:
> Hi Naresh,
>
> On Wed, May 24, 2023 at 12:32:24PM +0530, Naresh Kamboju wrote:
> > Linux next-20230523 and next-20230524 the x86_64 and i386 builds failed
> > with clang.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > make --silent --keep-going \
> >   --jobs=3D8 O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=3Dx8=
6_64 \
> >   SRCARCH=3Dx86 CROSS_COMPILE=3Dx86_64-linux-gnu- \
> >   'HOSTCC=3Dsccache clang' 'CC=3Dsccache clang' \
> >    LLVM=3D1 LLVM_IAS=3D1
> >
> > drivers/gpu/drm/i915/display/intel_display.c:6012:3: error:
> > unannotated fall-through between switch labels
> > [-Werror,-Wimplicit-fallthrough]
> >                 case I915_FORMAT_MOD_X_TILED:
> >                 ^
> > drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert
> > 'break;' to avoid fall-through
> >                 case I915_FORMAT_MOD_X_TILED:
> >                 ^
> >                 break;
> > 1 error generated.
>
> Thanks for the report, I have sent
> https://lore.kernel.org/20230524-intel_async_flip_check_hw-implicit-fallt=
hrough-v1-1-83de89e376a1@kernel.org/
> for this.

Better link: https://lore.kernel.org/dri-devel/20230524-intel_async_flip_ch=
eck_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org/

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
