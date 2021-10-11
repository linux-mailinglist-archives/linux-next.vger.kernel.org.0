Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23300428D3F
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 14:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbhJKMo6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 08:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235034AbhJKMo6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 08:44:58 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435BEC06161C
        for <linux-next@vger.kernel.org>; Mon, 11 Oct 2021 05:42:58 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z20so67142145edc.13
        for <linux-next@vger.kernel.org>; Mon, 11 Oct 2021 05:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aH+daMH8/JBhYD/VNld/K3vNCe4mWktvAcObPC4aWG4=;
        b=xLAEEpeguQ0woOp63ioI84nC66mr/vNC4iM/XmaXMiR9QYFGYakzTcnCnaHK0Zc1e9
         F6SVKNckvU9wm9BB5+GFFc5UNe+g/qDBgYlf7xCE6cKla83nQsT0yJy3JCE7ac6G9KJq
         XADRbelRbMcY+njlJNQLn1PW7duC4Vj6rnp0iM7FWu9pPI//hOj0ra+tRNKgsOEbqqhL
         vX6oQOe0/+oBUJhXHqiH+UYFE+t6drOSbO7orVfi6uwUrGSpthmNLpMq/WxwZbuqJA53
         qKDIBq882XZzIobYK11lbxtPNhoujcK7bDUlmekVqSfHwHnN4AIswFT6iM2pJDUpoNgy
         9sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aH+daMH8/JBhYD/VNld/K3vNCe4mWktvAcObPC4aWG4=;
        b=Y7tFFMlIM/Uv1Mlm62Leoc0AKIDGmvNawmbOUP1huKqWfvM2O9p/kG1r4mfB1UEthM
         jaYBE/PLx3777yypwp6dYkbl50MAYsqTAMTUDgGADa4Q9M9e/UJIFlpGqv+yfzY6GLrM
         65U19XhRWX1SGvDj2KI2XeRj/pJLRZl9+yw1XqYm9PulJJ8NVya8FmLMucb6pF4xiIA5
         QaBDhOp+fOQHe17q0/4Dwbjo9Cx1uZ2wUuMT4/AXUNCB7Y42+BUzf9GpPwcr2VTjAHuX
         J+j6tl2OxqjIBiGJvwNb1mWSL3xE3FIAMs4hcLSHXDqQxTptpQS9ocO+uAWV8syrK2pu
         gbzA==
X-Gm-Message-State: AOAM53375onq3Vg/dnV4uA7w5GNIILYMXv2WZoTn/cRe6rdc2NozJCd4
        A7/8Sb/f3l9w5j55F66PrFZkejU/aqpJBzf90ree+3i6CwlyRQ==
X-Google-Smtp-Source: ABdhPJykj6TCtLZRl69RScymhuL6xnVXERm419IM+Tqe+l6k+vL0tbI4Gbo/sD+X5hpP0r9q9iM2ImzMDT4aN+LSPZ4=
X-Received: by 2002:a50:9993:: with SMTP id m19mr40386265edb.357.1633956175595;
 Mon, 11 Oct 2021 05:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv1Vbc-Y_czipb-z1bG=9axE4R1BztKGqWz-yy=+Wcsqw@mail.gmail.com>
In-Reply-To: <CA+G9fYv1Vbc-Y_czipb-z1bG=9axE4R1BztKGqWz-yy=+Wcsqw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 11 Oct 2021 18:12:44 +0530
Message-ID: <CA+G9fYtD2EFu7-j1wPLCiu2yVpZb_wObXXXebKNSW5o4gh9vgA@mail.gmail.com>
Subject: Re: mm/kasan/init.c:282:20: error: redefinition of 'kasan_populate_early_vm_area_shadow'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Cc:     Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+ Andrew Morton <akpm@linux-foundation.org>

On Mon, 11 Oct 2021 at 17:08, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regression found on x86_64 gcc-11 built with KASAN enabled.
> Following build warnings / errors reported on linux next 20211011.
>
> metadata:
>     git_describe: next-20211011
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_short_log: d3134eb5de85 (\"Add linux-next specific files for 20211011\")
>     target_arch: x86_64
>     toolchain: gcc-11
>
> build error :
> --------------
> mm/kasan/init.c:282:20: error: redefinition of
> 'kasan_populate_early_vm_area_shadow'
>   282 | void __init __weak kasan_populate_early_vm_area_shadow(void *start,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/mm.h:34,
>                  from include/linux/memblock.h:13,
>                  from mm/kasan/init.c:9:
> include/linux/kasan.h:463:20: note: previous definition of
> 'kasan_populate_early_vm_area_shadow' with type 'void(void *, long
> unsigned int)'
>   463 | static inline void kasan_populate_early_vm_area_shadow(void *start,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> make[3]: *** [scripts/Makefile.build:288: mm/kasan/init.o] Error 1
> make[3]: Target '__build' not remade because of errors.
>
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> build link:
> -----------
> https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/build.log
>
> build config:
> -------------
> https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/config
>
> # To install tuxmake on your system globally
> # sudo pip3 install -U tuxmake
> tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-11
> --kconfig defconfig --kconfig-add
> https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org
