Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB453AB351
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 14:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbhFQMNh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 08:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbhFQMNe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 08:13:34 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81966C061574
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 05:11:25 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id di5so3257433ejc.9
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=abjyLhbT3u74Zgq1l+BEIdPMtx/D7+UT5cqLY6XM2/Y=;
        b=fzpEeib8QDNsXnonqUGJlZswtaQQxypCfy9fyjSw/U7Av49giNR+QSlWqnxQuaTia9
         umQwoADVt0GaiLDNambhR9MFHty7iCQiOSG0iLtYrmW0UbbJbmsmAmlv5L+caH9ZGwyM
         OWZuim0CrGslrkbqcsfUavjt9WCkh4XZy8U08eK5a7f/lWMnOrBgtiupj8qN//Pc5zkI
         dO0yPUEDaEP/aPDybzeQ088g/QaLJJDSuC0/mqiVAiwVMbJhcMcyvNRt1/+vUv2xvS3A
         K8HoAXLR4qZiEPIkN1CbV8eEosVdxhScorayuALxv0eLG9BOFk348bt4XtEmErIwn+gJ
         0A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=abjyLhbT3u74Zgq1l+BEIdPMtx/D7+UT5cqLY6XM2/Y=;
        b=kwDdZToY9vWgFFngoYZaf3TZ+aLm7mp90sMwY81YCqsjuYjLZp8ceYXtR7lhlXH/uy
         Q4DiUM6Pq3xm2iGxY2wBmzDZrDIPzSL6Yf30hihxBeNZdaCTEKFGsTeEhi7yCYIktcQg
         NPL08SfTZAv4BXNeJIYNyKeYNN8hN5v4aQTokPh7ayQeUwPMrzC9M1XH2Z029sw6IX7X
         aEQIw7AvJeEOg1qRLW/5n+86OAOEkQrzdmHESOWV6YGMEU7loQqXdEX6GrAMbB5yf87p
         3odarGXahDGziCOsAkr+RioYWJrqQzi1hZ0BGhwbXvrA+pYyorBVUQN8Nat4ikdSLP4Y
         5Hbg==
X-Gm-Message-State: AOAM532leqQfKzLJTncH2Q0qOmZbdWOvIGn3jB9eSep3gXlioiKHD/4B
        fVR+5cGozCd56sUKdctX/kF28AD3/D2q1mgKER/X3Y/Kd3rJS8Sb
X-Google-Smtp-Source: ABdhPJyFQtRp3k9GLGGUUL5cU0unA/h1TSqJ0oPCzicqdiMTG2yE3IuJ43v1Qi5mKXryABq6IPLP0MkYbP1boPfsbXE=
X-Received: by 2002:a17:906:9d05:: with SMTP id fn5mr4763120ejc.133.1623931883222;
 Thu, 17 Jun 2021 05:11:23 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 17 Jun 2021 17:41:11 +0530
Message-ID: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
Subject: [next] [clang] x86_64-linux-gnu-ld: mm/mremap.o: in function
 `move_pgt_entry': mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next 20210617 tag following x86_64 builds failed with clang-10
and clang-11.
Regressions found on x86_64:

 - build/clang-11-tinyconfig
 - build/clang-11-allnoconfig
 - build/clang-10-tinyconfig
 - build/clang-10-allnoconfig
 - build/clang-11-x86_64_defconfig
 - build/clang-10-defconfig

We are running git bisect to identify the bad commit.

Build log:
------------
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
eb_relocate_parse_slow()+0x466: stack state mismatch: cfa1=4+120
cfa2=-1+0
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
eb_copy_relocations()+0x1e0: stack state mismatch: cfa1=4+104
cfa2=-1+0
x86_64-linux-gnu-ld: mm/mremap.o: in function `move_pgt_entry':
mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
make[1]: *** [/builds/linux/Makefile:1252: vmlinux] Error 1
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:222: __sub-make] Error 2
make: Target '__all' not remade because of errors.
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=x86_64
CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang' headers_install
INSTALL_HDR_PATH=/home/tuxbuild/.cache/tuxmake/builds/current/install_hdr/
tar caf /home/tuxbuild/.cache/tuxmake/builds/current/headers.tar.xz -C
/home/tuxbuild/.cache/tuxmake/builds/current/install_hdr .

ref:
https://builds.tuxbuild.com/1u4ZKFTh12vrYBVf8b1xGpaFOrE/

# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.

tuxmake --runtime podman --target-arch x86_64 --toolchain clang-11
--kconfig x86_64_defconfig

ref:
https://builds.tuxbuild.com/1u4ZKFTh12vrYBVf8b1xGpaFOrE/

build info:
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 7d9c6b8147bdd76d7eb2cf6f74f84c6918ae0939
    git_short_log: 7d9c6b8147bd (\Add linux-next specific files for 20210617\)
    kconfig: x86_64_defconfig
    kernel_image:
    kernel_version: 5.13.0-rc6
    toolchain: clang-11

--
Linaro LKFT
https://lkft.linaro.org
