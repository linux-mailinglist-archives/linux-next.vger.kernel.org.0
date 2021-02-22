Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F136321E43
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 18:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhBVRi7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 12:38:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhBVRi6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 12:38:58 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7CFC061786
        for <linux-next@vger.kernel.org>; Mon, 22 Feb 2021 09:38:17 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id u4so14434399lja.3
        for <linux-next@vger.kernel.org>; Mon, 22 Feb 2021 09:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v7wqePzSgwskG1/tuXGQ+kZYGBboCrb+s/SmtJNtNR4=;
        b=iT3LsK4hvs9RPodo+tY+HqAJBe3Hvz+r+KHAKjmMJStqt4wt1/WysDdi0gAGLEK4Bw
         CJ+OzgExS/5XgubOnDIswVin/bTIgOJB5qvCk1i6z2ZyrNPZJfBbVhM613Ed7uKvZWTO
         nSg1qBG19ojFuhnlNxgILWPkvZ7s2TBKHixJAf5cRve1TAINmKyjKaf9HktrwQm6l6fQ
         lPhqmqobRfYZPaQZLWO6AXrL7dLCZcdWLoxLnnHenbkp6vc8c2v3Geds6/6fqKqWJh5x
         2S1uvC2H/Uq/qLyU3D4OKrD3nb7jYLVXCstO7ntjDse8TgT9w+b4M0VZJ2mUG3Pi7OGu
         1uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v7wqePzSgwskG1/tuXGQ+kZYGBboCrb+s/SmtJNtNR4=;
        b=DcHatt3sNdgwH923nqhqlUMgZYA2L4N4iW0NKgBGYE8zoyqNUfXfWkT+FXZeL/5zkb
         LpUwlpGxmU6RSRLbLtHQCSBQnAbyfviyRrmP9id44vTcLQkYJ+yzbqGsMgfqQAhYBHyd
         LeR+0juWueQFpbKFmenk3HDRl6+iqRrYAFc6z+H3KQupB+x1mpz+cG+B9H545dctIFtK
         9qmQCrBnrAr0C303UUKhxoJFgJGcwTYzWIf09g9iy+67WQIHuY/Fh4rDoVCziBU+uxy/
         Dr6Co+Aanvf2e836U1w5xEbvQH8FhNQR4sTt6ZgHSfELaPlhdG0AaL9h44b72zufA4GZ
         UyhQ==
X-Gm-Message-State: AOAM533AOKBdkT5F8SXMpeNvc321gE1eF/bo1CEG4URtiOWI+zk8I8t7
        lv8aNP2u3FYujpz7Vu6cNkwu9zGoI10+ZgZamXWLTg==
X-Google-Smtp-Source: ABdhPJzJu6kPRlidgAXH+mByKlsyWeNFjgfFNfeNG1fnrvbBXk259RMGQMZFtEzlwcP93DWjKCcYxJzhPgRdgyUpnnw=
X-Received: by 2002:a05:651c:2042:: with SMTP id t2mr14080474ljo.233.1614015496303;
 Mon, 22 Feb 2021 09:38:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsb0LRBatwtbjULObmc4zA6SrYBE6W+S_AjxXedPwPdVQ@mail.gmail.com>
In-Reply-To: <CA+G9fYsb0LRBatwtbjULObmc4zA6SrYBE6W+S_AjxXedPwPdVQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 Feb 2021 09:38:05 -0800
Message-ID: <CAKwvOdm+z0PeK3HDyTqvs4ZTq8hf9UKvfMOrTawy3zKG=RzDYg@mail.gmail.com>
Subject: Re: gfp.h:20:32: error: redefinition of typedef 'gfp_t' is a C11 feature
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 22, 2021 at 9:36 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> arm davinci_all_defconfig config with clang 10, 11 and 12 failing
> on Linux next tag 20210222 due to below listed errors / warnings.
>
>  - arm (davinci_all_defconfig) with clang-10
>  - arm (davinci_all_defconfig) with clang-11
>  - arm (davinci_all_defconfig) with clang-12
>
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf- 'HOSTCC=sccache clang' 'CC=sccache
> clang' davinci_all_defconfig
>
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf- 'HOSTCC=sccache clang' 'CC=sccache
> clang'
>
>
> include/linux/gfp.h:20:32: error: redefinition of typedef 'gfp_t' is a
> C11 feature [-Werror,-Wtypedef-redefinition]
> typedef unsigned int __bitwise gfp_t;   // repeated here for kernel-doc
>                                ^

Thanks for the report, sounds like this has already been fixed:
https://lore.kernel.org/linux-mm/CAKwvOdmbx+rLv+z-POUq+DPedhrWFEFVHhWW9j5vWpzH0J53Kg@mail.gmail.com/T/#m7d7d6f2905b1be082f31628011d51056a7e94abc

> include/linux/types.h:148:32: note: previous definition is here
> typedef unsigned int __bitwise gfp_t;
>                                ^
> 1 warning generated.
> 1 warning generated.
> 1 warning generated.
> 1 warning generated.
> 1 error generated.
> make[5]: *** [scripts/Makefile.build:287:
> drivers/gpu/drm/tilcdc/tilcdc_plane.o] Error 1
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> Step to reproduce:
> ---------------------------
> # TuxMake is a command line tool and Python library that provides
> # portable and repeatable Linux kernel builds across a variety of
> # architectures, toolchains, kernel configurations, and make targets.
> #
> # TuxMake supports the concept of runtimes.
> # See https://docs.tuxmake.org/runtimes/, for that to work it requires
> # that you install podman or docker on your system.
> #
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
>
> tuxmake --runtime podman --target-arch arm --toolchain clang-10
> --kconfig davinci_all_defconfig
>
> build log,
> https://builds.tuxbuild.com/1opbM56yvX4uyeXV8JBwFNz9WEQ/
>
> --
> Linaro LKFT
> https://lkft.linaro.org



-- 
Thanks,
~Nick Desaulniers
