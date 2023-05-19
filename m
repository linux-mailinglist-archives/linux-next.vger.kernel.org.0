Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0138670952D
	for <lists+linux-next@lfdr.de>; Fri, 19 May 2023 12:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbjESKiO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 May 2023 06:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjESKiK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 May 2023 06:38:10 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEBF10EC
        for <linux-next@vger.kernel.org>; Fri, 19 May 2023 03:37:44 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-456d9652c24so478301e0c.1
        for <linux-next@vger.kernel.org>; Fri, 19 May 2023 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684492607; x=1687084607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CvfZBCHNWy968u7aLPnp5Zo1XFC9p4K3piymTX5dgXQ=;
        b=SrPi8HUSI2m1CwkatT1ojkj/3CV1aCEXdgE1hKoAZBdLC6Nkn8X4hPWyA7hU1sWZjx
         CTj06vpMZo0f3Dk49O1pBAtGzAVEO3d5kT8rIFxQGdxAXksVwdNZZwI+8uPGdH4sdYrE
         UB23OC3YbU2Uk3Wroa/AbUdhOcfMFRXA4zox2zuc9SNRyzAqfBgBloycKhqv0zufTqY0
         63UecnKxmpSGz5KhwH3Gg8p9c7SvvIHwpYf8gIXSE169qlTP77/7U2Ym/9J9ys+FuBjT
         iXuWldLGtGsuYWUkmzOnsgMp+uQ4N55t7cpjUdYrAbHRDwqcuBwonAnBzEGHzaMfx1Wa
         wKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684492607; x=1687084607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvfZBCHNWy968u7aLPnp5Zo1XFC9p4K3piymTX5dgXQ=;
        b=WLC8hspkbLW8FoMiYBxwB2FkZNCskFayw6iwXirZZccOEbyguLNP2sH2IIiVCRaozc
         xIvbU+izhkXrIEfWiPOWPnhh3wNWZf9XC/DDyiqudZ7PlruPtiJKo9kKjf+5oifBdtGA
         DLF5N1VvxhZtIqpdRBD9HVODBtNWa4DmMSCVPKwOE1U8wv4XSQNYH/EZh5JY43H4O6nY
         m5za1V138KmJLopBQb3sYXVVlfBT2SUzF4DcxE1boeyk52LmpHguyu0+e6Hiy6HBLPrR
         0Ffo55PvR5TKQ4XJ49K1sa+7fQ+lyFs4XbyTs48asbf3iXRUJ+WHN8P2TNmiijvzZVYp
         K9Fg==
X-Gm-Message-State: AC+VfDxcXT/+wXYVC29svIWB6HDdENGpWFDrDqMH6srryxPq0metKpTu
        q3dS/q4aEXTVE7OTd7pzaq++EadzEa137pKg8FQa1jJVhr6waLelVKpbnA==
X-Google-Smtp-Source: ACHHUZ63rAyzxMLOLFoCB/0JfXoAYgQfLby0OiaP4zlFx3N/kQ2zIAYTYoMyitVTf5OZIaUyzoTmOfB0OzBZ6p/yH18=
X-Received: by 2002:a05:6102:2143:b0:437:e2b7:4fab with SMTP id
 h3-20020a056102214300b00437e2b74fabmr857761vsg.0.1684492606975; Fri, 19 May
 2023 03:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYszL_ccRR+-YUXfm4tzv_bA=can-o-hYhQ+F1HyGY7Mtw@mail.gmail.com>
In-Reply-To: <CA+G9fYszL_ccRR+-YUXfm4tzv_bA=can-o-hYhQ+F1HyGY7Mtw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 19 May 2023 16:06:35 +0530
Message-ID: <CA+G9fYuoo5OKBj4ymCrM05eEnPEjk6rVX+3=p3+WTW1A5L6Pmg@mail.gmail.com>
Subject: Re: next: arm64: build/gcc-12-lkftconfig-64k_page_size - error: call
 to '__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON
 failed: (((16 - 3) * (4 - (2)) + 3)-16) > 10
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Will Deacon <will@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        jforbes@fedoraproject.org, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 17 May 2023 at 18:56, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Following arm64 builds failed on Linux next-20230517.
>
>  - build/gcc-12-lkftconfig-64k_page_size
>  - build/gcc-11-lkftconfig-64k_page_size
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build log:
> ======
> include/asm-generic/div64.h:46:27: warning: conversion from 'long
> unsigned int' to 'uint32_t' {aka 'unsigned int'} changes value from
> '4398046511104' to '0' [-Woverflow]
>    46 |         uint32_t __base = (base);                               \
>       |                           ^
> include/linux/math.h:40:44: note: in expansion of macro 'do_div'
>    40 |         ({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
>       |                                            ^~~~~~
> include/linux/math.h:43:9: note: in expansion of macro 'DIV_ROUND_DOWN_ULL'
>    43 |         DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
>       |         ^~~~~~~~~~~~~~~~~~
> arch/arm64/kvm/mmu.c:95:22: note: in expansion of macro 'DIV_ROUND_UP_ULL'
>    95 |                 n += DIV_ROUND_UP_ULL(range, PUD_SIZE);
>       |                      ^~~~~~~~~~~~~~~~
> In file included from <command-line>:
> mm/huge_memory.c: In function 'hugepage_init':
> include/linux/compiler_types.h:397:45: error: call to
> '__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON
> failed: (((16 - 3) * (4 - (2)) + 3)-16) > 10
>   397 |         _compiletime_assert(condition, msg,
> __compiletime_assert_, __COUNTER__)
>       |                                             ^
> include/linux/compiler_types.h:378:25: note: in definition of macro
> '__compiletime_assert'
>   378 |                         prefix ## suffix();
>          \
>       |                         ^~~~~~
> include/linux/compiler_types.h:397:9: note: in expansion of macro
> '_compiletime_assert'
>   397 |         _compiletime_assert(condition, msg,
> __compiletime_assert_, __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:39:37: note: in expansion of macro
> 'compiletime_assert'
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>       |         ^~~~~~~~~~~~~~~~
> include/linux/bug.h:24:25: note: in expansion of macro 'BUILD_BUG_ON'
>    24 |                         BUILD_BUG_ON(cond);             \
>       |                         ^~~~~~~~~~~~
> mm/huge_memory.c:470:9: note: in expansion of macro 'MAYBE_BUILD_BUG_ON'
>   470 |         MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER > MAX_ORDER);
>       |         ^~~~~~~~~~~~~~~~~~
> make[3]: *** [scripts/Makefile.build:252: mm/huge_memory.o] Error 1

Linux next 20230517 arm64 64k page size build failed.

  - CONFIG_ARM64_64K_PAGES=y

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected and found the following is the first bad commit.

commit fd2d1cb8c5454888f67aba4c6218e30106862070
Author: Catalin Marinas <catalin.marinas@arm.com>
Date:   Wed May 3 13:33:42 2023 +0100

    arm64: Make the ARCH_FORCE_MAX_ORDER config input prompt unconditional

    Commit 34affcd7577a ("arm64: drop ranges in definition of
    ARCH_FORCE_MAX_ORDER") dropped the ranges from the config entry and
    introduced an EXPERT condition on the input prompt instead. This change
    may affect some distro kernels that change ARCH_FORCE_MAX_ORDER but do
    not want to enable EXPERT.

    Drop EXPERT from the input prompt together with the (ARM64_4K_PAGES ||
    ARM64_16K_PAGES) condition as the latter no longer makes sense after the
    ranges were removed. The latter makes all the page size configurations
    consistent w.r.t. ARCH_FORCE_MAX_ORDER.

    Fixes: 34affcd7577a ("arm64: drop ranges in definition of
ARCH_FORCE_MAX_ORDER")
    Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
    Reported-by: Justin M. Forbes <jforbes@fedoraproject.org>
    Cc: Will Deacon <will@kernel.org>
    Cc: Mike Rapoport <rppt@kernel.org>
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Acked-by: Justin M. Forbes <jforbes@fedoraproject.org>
    Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
    Link: https://lore.kernel.org/r/20230503123342.90538-1-catalin.marinas@arm.com
    Signed-off-by: Will Deacon <will@kernel.org>

 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


--
Linaro LKFT
https://lkft.linaro.org


>
>
> logs:
> =====
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031010/suite/build/test/gcc-12-lkftconfig-64k_page_size/log
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031010/suite/build/test/gcc-12-lkftconfig-64k_page_size/history/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031010/suite/build/test/gcc-12-lkftconfig-64k_page_size/details/
>
>
> Steps to reproduce:
> ====
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
> # Original tuxmake command with fragments listed below.
> # tuxmake   \
>  --runtime podman   \
>  --target-arch arm64   \
>  --toolchain gcc-12   \
>  --kconfig defconfig   \
>  --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft.config
>   \
>  --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft-crypto.config
>   \
>  --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/distro-overrides.config
>   \
>  --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/systemd.config
>   \
>  --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/virtio.config
>   \
>  --kconfig-add CONFIG_ARM64_MODULE_PLTS=y   \
>  --kconfig-add CONFIG_SYN_COOKIES=y   \
>  --kconfig-add CONFIG_SCHEDSTATS=y   \
>  --kconfig-add CONFIG_ARM64_64K_PAGES=y
>
> OR
>
> tuxmake   \
>  --runtime podman   \
>  --target-arch arm64   \
>  --toolchain gcc-12   \
>  --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2PtylMMZpP2yGvgCnhE5SZngOYJ/config
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
