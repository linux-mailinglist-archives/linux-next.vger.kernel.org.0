Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF873404AD
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 12:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhCRLeA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 07:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhCRLdx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 07:33:53 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A49C06175F
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 04:33:53 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id i3so978962oik.7
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 04:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tln9Cf6YXovRzvCEbIdoWQXhqU5IKqiApXmsrwWqBsk=;
        b=sQV1jB+vhMLeG5+w+HYHCbe9z+OiguEFLOKUP+BjDYzxcAccRoR/17rK9b7QeVYBFt
         DgloB226V/aKxbBsAzvTOtfrUVcNoIVbjX+BNoUb/+8Cf7SHOf5PpXUC4ecbNabYbdpK
         RnCiK5U1aGZS4rGkqkcjUl8T5ZzhmrbwY8gyuO3nWRnudVH+9KGiNVo5t+mg0PXLRKJK
         soee1/P1qYz++FJ9a9cEXpbwogwmHj/Updb0qAVLg85kZuP84Mr4GZjuL511gLWjFivK
         q8jRnZ/Zhd5sF/lnOT1bo9g+5vYrdYOmMU0gEA7Y3nmA7fVrSyt8a5G8ssn4SmR1ZTtO
         WK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tln9Cf6YXovRzvCEbIdoWQXhqU5IKqiApXmsrwWqBsk=;
        b=AGXzZgVMhwfIn5FxVGSao7BD74dKLWX35KVc3vMG58leAFxZ/wFtNb6Cr/ZbNebbF/
         jvnjDM2UnRVNdTJOhCSjVRx80VnjY0Q9b/CDKQBBv9pmpvvaFmwCWNJBCHTZdKr58jX3
         OECBn/7QSjkUtuUxZcZUTm7c2xf1ubt9IZk4Wp0d5R9f9LnuTh5LT8bmUm706cPbew46
         Lv88JnXGFo8gcTzzd03cKJqwQ0/7kg7YCnH9WIF6WRRTP9Y3eO027yV1thwFCCaOV0zt
         zm2G5+5V+pr/k87DLHD3/debbmYfYlzSabb6ZI7F4EQ79cBg5+dHwD16iyYZ7/yJN9R5
         Bjbw==
X-Gm-Message-State: AOAM530UZQGIelphFwoG5IJpwcyE89MuwnNy6sOGC1ALQiONMAGtu6CW
        tjqjNQ4ixTMgSmsdC02d6gc35z8otfvNMf+c3eiVMesCL3U0rg==
X-Google-Smtp-Source: ABdhPJyRo49L5T5a+4RF9SokcV0JVBawUdpm97h2L2bcHQvzyzDSdRZ0+x6+EbOW375MLiNJgOYAbREb1x2x0uwJ3Os=
X-Received: by 2002:aca:bb06:: with SMTP id l6mr2644622oif.121.1616067232234;
 Thu, 18 Mar 2021 04:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtZWp4MPs4QmM2gKTZGxX8PNzYRFHDy+zkhVTgOmitr7Q@mail.gmail.com>
In-Reply-To: <CA+G9fYtZWp4MPs4QmM2gKTZGxX8PNzYRFHDy+zkhVTgOmitr7Q@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 18 Mar 2021 12:33:40 +0100
Message-ID: <CANpmjNNYW+xoTbfLfJ_+JtCspb804=R9LJ=z4tSrqTa1NVoY5w@mail.gmail.com>
Subject: Re: next: arm64: compiler_types.h:320:38: error: call to
 '__compiletime_assert_417' declared with attribute error: BUILD_BUG_ON
 failed: KMALLOC_MIN_SIZE > 16 | KMALLOC_SHIFT_HIGH < 10
To:     Naresh Kamboju <naresh.kamboju@linaro.org>, glittao@gmail.com
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is a new test.
+Oliver Glitta, who authored test_slub.c.

On Thu, 18 Mar 2021 at 12:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> While building arm64 kernel modules the following kernel warnings /
> errors noticed on
> linux next 20210318 tag the gcc version is 7.3.0. I will check latest
> gcc version builds
> and keep you updated.
>
>  In file included from <command-line>:0:0:
>  In function 'resiliency_test',
>      inlined from 'test_slub_init' at   lib/test_slub.c:120:2:
>    include/linux/compiler_types.h:320:38: error: call to
> '__compiletime_assert_417' declared with attribute error: BUILD_BUG_ON
> failed: KMALLOC_MIN_SIZE > 16 | KMALLOC_SHIFT_HIGH < 10
>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                        ^
>    include/linux/compiler_types.h:301:4: note: in definition of macro
> '__compiletime_assert'
>      prefix ## suffix();    \
>      ^~~~~~
>    include/linux/compiler_types.h:320:2: note: in expansion of macro
> '_compiletime_assert'
>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>    ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro
> 'compiletime_assert'
>   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                       ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:50:2: note: in expansion of macro
> 'BUILD_BUG_ON_MSG'
>    BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>    ^~~~~~~~~~~~~~~~
>    lib/test_slub.c:101:2: note: in expansion of macro 'BUILD_BUG_ON'
>    BUILD_BUG_ON(KMALLOC_MIN_SIZE > 16 | KMALLOC_SHIFT_HIGH < 10);
>    ^~~~~~~~~~~~
>  make[2]: *** [  scripts/Makefile.build:273: lib/test_slub.o] Error 1
>  make[1]: *** [  Makefile:1980: lib] Error 2
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=juno,label=docker-buster-lkft/984/consoleFull
>
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=juno,label=docker-buster-lkft/984/consoleFull
>
>
> - Naresh
