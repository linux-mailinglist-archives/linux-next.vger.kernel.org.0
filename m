Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9583AB3EE
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 14:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbhFQMsI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 08:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhFQMsH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 08:48:07 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95DFC06175F
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 05:45:58 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id he7so9612198ejc.13
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mhQF38qVkFPjYjvziQjLIcfMR/G9GUoa3asUn5y7JgI=;
        b=iP9jNH0tsNgPvuewn/VT+nVMdkY8d7VD8RToapmMVc4oEjDzV28adxdL/W2cfFUJ5C
         F5CwqmsZmzqzCH0tvwCxTMPDtTLpuL1dWTEs6CA6jqifpQWiNkzlLilq5tMnzwzUnRuu
         FuT1f41khwhCA+Hz2m7SS+epxPjt/j1kED+vLCKKjz+YYC0vwOlHzQmdBFDzhbvo5yaS
         WkNusz1ipM2tUWcNf7gQRPDyD98E9eOJxJC57z9FAIbl+flpt17+4VIb+u7UB3ggQT7n
         mSvZTEBcsORfg730BYGVj9SVW6YZioO+2nF3oL5C0GaOzKQnTIioSsSp23D6Kx3zMka7
         caKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mhQF38qVkFPjYjvziQjLIcfMR/G9GUoa3asUn5y7JgI=;
        b=mWYsNcATCDuPoUAXLomsm/8p6XJ41BA+tbT9enTPccBEu1cidAIuCz+JrU3l+Qtb4O
         9vHGlPIkGBvo1GN4H+mwheuOEXMysSre6MrEw1z66Y9ktI/WnKr9YAoq+DcHMtRlPkcW
         0uhhMkPy24wdDZsW7bcjQOGBOfUzMkm9JDh5PpedysmuBsSbsLZTEwNhxv0UzXJeSnkt
         MfUF7IylbTLhloHNqIqGyUyzFSnAwdN1Gu45O5b1+iJZigkYq1GZb3YUoks7JC+AD5ro
         etxmMqX7T6sWXb8ILgqBM1cAFKXxVpHiWYKIHj12iV3Gfr949JiP4dAS3Y9Sob2+8DY5
         Q6Cw==
X-Gm-Message-State: AOAM5325JojeB5VGsrWEXMmKPAtC6rAPRjU/CDTJ7zEZlzowRqMMEF4E
        vA0OkhuN2C4Q/sA6CffThDY3VLyDz6sSdQh7j1zJ6bedpgCV1lBd
X-Google-Smtp-Source: ABdhPJw1z6C1ZQTkrUSlrFP8dk8VNTUofFEUxmGc5v/SabozxjsTDxMyELOzWkfDFYMMvqPHipsb+8mbE3xu0NWDWzQ=
X-Received: by 2002:a17:906:480a:: with SMTP id w10mr5071539ejq.18.1623933956354;
 Thu, 17 Jun 2021 05:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
In-Reply-To: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 17 Jun 2021 18:15:45 +0530
Message-ID: <CA+G9fYvvf+XTvZg1sTq4_f9OrVFsCazGo0ozaEbjVYgSeKCkWA@mail.gmail.com>
Subject: Re: [next] [clang] x86_64-linux-gnu-ld: mm/mremap.o: in function
 `move_pgt_entry': mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Stephen Boyd <swboyd@chromium.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Matthew Wilcox <willy@infradead.org>,
        Baoquan He <bhe@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Young <dyoung@redhat.com>, Ingo Molnar <mingo@redhat.com>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        Sasha Levin <sashal@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vivek Goyal <vgoyal@redhat.com>, Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 17 Jun 2021 at 17:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Linux next 20210617 tag following x86_64 builds failed with clang-10
> and clang-11.
> Regressions found on x86_64:
>
>  - build/clang-11-tinyconfig
>  - build/clang-11-allnoconfig
>  - build/clang-10-tinyconfig
>  - build/clang-10-allnoconfig
>  - build/clang-11-x86_64_defconfig
>  - build/clang-10-defconfig
>
> We are running git bisect to identify the bad commit.
>
> Build log:
> ------------
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
> eb_relocate_parse_slow()+0x466: stack state mismatch: cfa1=4+120
> cfa2=-1+0
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
> eb_copy_relocations()+0x1e0: stack state mismatch: cfa1=4+104
> cfa2=-1+0
> x86_64-linux-gnu-ld: mm/mremap.o: in function `move_pgt_entry':
> mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'

The git bisect pointed out the first bad commit.

The first bad commit:
commit 928cf6adc7d60c96eca760c05c1000cda061604e
Author: Stephen Boyd <swboyd@chromium.org>
Date:   Thu Jun 17 15:21:35 2021 +1000
    module: add printk formats to add module build ID to stacktraces

    Let's make kernel stacktraces easier to identify by including the build
    ID[1] of a module if the stacktrace is printing a symbol from a module.
    This makes it simpler for developers to locate a kernel module's full
    debuginfo for a particular stacktrace.  Combined with
    scripts/decode_stracktrace.sh, a developer can download the matching
    debuginfo from a debuginfod[2] server and find the exact file and line
    number for the functions plus offsets in a stacktrace that match the
    module.  This is especially useful for pstore crash debugging where the
    kernel crashes are recorded in something like console-ramoops and the
    recovery kernel/modules are different or the debuginfo doesn't exist on
    the device due to space concerns (the debuginfo can be too large for space
    limited devices).

    Originally, I put this on the %pS format, but that was quickly rejected
    given that %pS is used in other places such as ftrace where build IDs
    aren't meaningful.  There was some discussions on the list to put every
    module build ID into the "Modules linked in:" section of the stacktrace
    message but that quickly becomes very hard to read once you have more than
    three or four modules linked in.  It also provides too much information
    when we don't expect each module to be traversed in a stacktrace.  Having
    the build ID for modules that aren't important just makes things messy.
    Splitting it to multiple lines for each module quickly explodes the number
    of lines printed in an oops too, possibly wrapping the warning off the
    console.  And finally, trying to stash away each module used in a
    callstack to provide the ID of each symbol printed is cumbersome and would
    require changes to each architecture to stash away modules and return
    their build IDs once unwinding has completed.

    Instead, we opt for the simpler approach of introducing new printk formats
    '%pS[R]b' for "pointer symbolic backtrace with module build ID" and '%pBb'
    for "pointer backtrace with module build ID" and then updating the few
    places in the architecture layer where the stacktrace is printed to use
    this new format.

    Before:

     Call trace:
      lkdtm_WARNING+0x28/0x30 [lkdtm]
      direct_entry+0x16c/0x1b4 [lkdtm]
      full_proxy_write+0x74/0xa4
      vfs_write+0xec/0x2e8

    After:

     Call trace:
      lkdtm_WARNING+0x28/0x30 [lkdtm 6c2215028606bda50de823490723dc4bc5bf46f9]
      direct_entry+0x16c/0x1b4 [lkdtm 6c2215028606bda50de823490723dc4bc5bf46f9]
      full_proxy_write+0x74/0xa4
      vfs_write+0xec/0x2e8

    Link: https://lkml.kernel.org/r/20210511003845.2429846-6-swboyd@chromium.org
    Link: https://fedoraproject.org/wiki/Releases/FeatureBuildId [1]
    Link: https://sourceware.org/elfutils/Debuginfod.html [2]
    Signed-off-by: Stephen Boyd <swboyd@chromium.org>
    Cc: Jiri Olsa <jolsa@kernel.org>
    Cc: Alexei Starovoitov <ast@kernel.org>
    Cc: Jessica Yu <jeyu@kernel.org>
    Cc: Evan Green <evgreen@chromium.org>
    Cc: Hsin-Yi Wang <hsinyi@chromium.org>
    Cc: Petr Mladek <pmladek@suse.com>
    Cc: Steven Rostedt <rostedt@goodmis.org>
    Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
    Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
    Cc: Matthew Wilcox <willy@infradead.org>
    Cc: Baoquan He <bhe@redhat.com>
    Cc: Borislav Petkov <bp@alien8.de>
    Cc: Catalin Marinas <catalin.marinas@arm.com>
    Cc: Dave Young <dyoung@redhat.com>
    Cc: Ingo Molnar <mingo@redhat.com>
    Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
    Cc: Sasha Levin <sashal@kernel.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Cc: Vivek Goyal <vgoyal@redhat.com>
    Cc: Will Deacon <will@kernel.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
 Documentation/core-api/printk-formats.rst |  11 ++++
 include/linux/kallsyms.h                  |  20 +++++-
 include/linux/module.h                    |   8 ++-
 kernel/kallsyms.c                         | 101 ++++++++++++++++++++++++------
 kernel/module.c                           |  31 ++++++++-
 lib/vsprintf.c                            |   8 ++-
 6 files changed, 154 insertions(+), 25 deletions(-)
Previous HEAD position was b2dcc0267277 dump_stack: add vmlinux build
ID to stack traces
HEAD is now at 7d9c6b8147bd Add linux-next specific files for 20210617



> make[1]: *** [/builds/linux/Makefile:1252: vmlinux] Error 1
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:222: __sub-make] Error 2
> make: Target '__all' not remade because of errors.
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=x86_64
> CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
> clang' headers_install
> INSTALL_HDR_PATH=/home/tuxbuild/.cache/tuxmake/builds/current/install_hdr/
> tar caf /home/tuxbuild/.cache/tuxmake/builds/current/headers.tar.xz -C
> /home/tuxbuild/.cache/tuxmake/builds/current/install_hdr .
>
> ref:
> https://builds.tuxbuild.com/1u4ZKFTh12vrYBVf8b1xGpaFOrE/
>
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
> tuxmake --runtime podman --target-arch x86_64 --toolchain clang-11
> --kconfig x86_64_defconfig
>
> ref:
> https://builds.tuxbuild.com/1u4ZKFTh12vrYBVf8b1xGpaFOrE/
>
> build info:
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_sha: 7d9c6b8147bdd76d7eb2cf6f74f84c6918ae0939
>     git_short_log: 7d9c6b8147bd (\Add linux-next specific files for 20210617\)
>     kconfig: x86_64_defconfig
>     kernel_image:
>     kernel_version: 5.13.0-rc6
>     toolchain: clang-11

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

> --
> Linaro LKFT
> https://lkft.linaro.org
