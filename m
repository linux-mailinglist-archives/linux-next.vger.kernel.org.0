Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098232AEFF6
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 12:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgKKLuJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 06:50:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:48134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbgKKLuF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Nov 2020 06:50:05 -0500
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B063216C4;
        Wed, 11 Nov 2020 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605095405;
        bh=0EhvhswHcU3rrJtRVTsbEpzJvoEUKSBwyL0JvCJfGGU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zLemUS8t/UPYHsIae/eoltR1ZjZlgvZLJ+sASYWo+fPpzd2sxi97XPHgOhtMB3jFt
         DVLR39W/8kcsHmdve/Ze2lfmTueHXaFzi9eqpyfWPUxtPbXWMZUx5BNOF6wPCXs5w5
         5cEYc0TVUAQio+KTBru53ni1a1wBElipU+s2JPtM=
Received: by mail-oi1-f176.google.com with SMTP id m13so1841915oih.8;
        Wed, 11 Nov 2020 03:50:05 -0800 (PST)
X-Gm-Message-State: AOAM532/dc1QbE11CRBOkXWGODqKAgpYeMz1fvNtEAmzm8cChqPri52c
        xPRpy8KQHWelS1Dcud30N0Cp0UolpwLxa165jxM=
X-Google-Smtp-Source: ABdhPJx1pa0j1Bdeb7dFvCaT72nI4bMOnXTC7YJU5YZQ69emDiEFaLR7JcW0cW71t/mNGhnQpjSP6wC3oHmcSS0V5VM=
X-Received: by 2002:aca:d583:: with SMTP id m125mr1709838oig.47.1605095404430;
 Wed, 11 Nov 2020 03:50:04 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYv7qiVPQZ5RUF4e0o+ZWnotrHBZ6hyTs2FPkQb=PRHwWw@mail.gmail.com>
In-Reply-To: <CA+G9fYv7qiVPQZ5RUF4e0o+ZWnotrHBZ6hyTs2FPkQb=PRHwWw@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 11 Nov 2020 12:49:52 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG4BZCSvX-tW3qCM+ZMbarxc3Dyjr4u+NhOLZZwdB+OCw@mail.gmail.com>
Message-ID: <CAMj1kXG4BZCSvX-tW3qCM+ZMbarxc3Dyjr4u+NhOLZZwdB+OCw@mail.gmail.com>
Subject: Re: arm64: tinyconfig: compiler_types.h:326:38: error: call to
 '__compiletime_assert_382' declared with attribute error: BUILD_BUG_ON
 failed: !is_power_of_2(sizeof(struct page))
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        ": Linus Walleij" <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Roman Gushchin <guro@fb.com>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 11 Nov 2020 at 12:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> FYI,
> Linux next tag 20201111 arm64 tinyconfig build failed due to below error(s).
> tinyconfig arm64 build test failed with gcc-8, gcc-9 and gcc-10.
> config file attached to this email.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>

Thanks Naresh. This will be fixed shortly.

> make  -j16  ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
>
> arch/arm64/mm/init.c: In function 'mem_init':
> include/linux/compiler_types.h:326:38: error: call to
> '__compiletime_assert_382' declared with attribute error: BUILD_BUG_ON
> failed: !is_power_of_2(sizeof(struct page))
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                       ^
> include/linux/compiler_types.h:307:4: note: in definition of macro
> '__compiletime_assert'
>     prefix ## suffix();    \
>     ^~~~~~
> include/linux/compiler_types.h:326:2: note: in expansion of macro
> '_compiletime_assert'
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>   ^~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:39:37: note: in expansion of macro
> 'compiletime_assert'
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>   BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>   ^~~~~~~~~~~~~~~~
> arch/arm64/mm/init.c:443:2: note: in expansion of macro 'BUILD_BUG_ON'
>   BUILD_BUG_ON(!is_power_of_2(sizeof(struct page)));
>   ^~~~~~~~~~~~
> make[3]: *** [scripts/Makefile.build:284: arch/arm64/mm/init.o] Error 1
> make[3]: Target '__build' not remade because of errors.
>
>
> Build details:
>     kconfig: tinyconfig
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     target_arch: arm64
>     toolchain: gcc-9
>     git_short_log: 3e14f70c05cd (\Add linux-next specific files for 20201111\)
>     git_describe: next-20201111
>     build link: https://builds.tuxbuild.com/1k8NvVvTvJrxp6CsgUXoZJZXzFy/
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
