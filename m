Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740714768E6
	for <lists+linux-next@lfdr.de>; Thu, 16 Dec 2021 05:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbhLPEA6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Dec 2021 23:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbhLPEA5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Dec 2021 23:00:57 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80298C06173E
        for <linux-next@vger.kernel.org>; Wed, 15 Dec 2021 20:00:57 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id e3so82992238edu.4
        for <linux-next@vger.kernel.org>; Wed, 15 Dec 2021 20:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=QJxb1JEGPxD4yEQCGU0VH/KYdWKAlFiltK8ynZyYUQA=;
        b=PaAuuOgRuo5PIJnrVTOrmg6Jkd8Ntl40deiptCEo9RMXKl43NoIfJd/ZdAHr4bdA3L
         NM3I6vIAJXV8uxfSHOxAsbLR/xUOaLsNKx0bcL9d3VUgtN3gAcRQQbVOzlf0Xi67N5ch
         ll+tEYeCMCHa5VwwH+/XO6Wf8LqUTa3siIcc42AmNt7Ta7elFJc5wuixKLwZqKEmDGT6
         D1EcuTLmf/nTmSYu7IIM0HB7n+YNLiVDbNmrBvSZjTpv6fbJYk06JiiJX5V1Xc07z6+A
         h+4+lJd+vnqbsiyzjWmeAgO++GEQOSJauGiAsf4ZOpYHIj4ur+Macxdxlk7HN5XXAmBc
         zzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=QJxb1JEGPxD4yEQCGU0VH/KYdWKAlFiltK8ynZyYUQA=;
        b=CE2OLva69xSKZEKSn70CQTuoBKN2ZopgKwCypXnOF8dckj8Koh4ThaM5kwxPIyb9Q8
         AmHGIa/hpsJ7gyvXbGEJ4F6VFiLC6pAeVvw1ohb287m5Q0JzS7gxpvBVcINMyTtoonll
         BNnOxURq3UY4b3K89mYTmRehoJbHPk+Wj/Z5famlTuAmgZbv9smmy4ONyFmbihOaqkeG
         p+Emq1fc5SMALB/pCLlZl/wdIadrSSTtQtw4YrUR4CzEvrUhHoyU0jeq2l+gzjELzjN/
         a4S5e/BpZnqfglT0y5p1/bbwPQhZqoMEkFBBCom6VWKNUFB3/2HsLtmJOoSBcLZpPzUR
         BvqQ==
X-Gm-Message-State: AOAM530XHNd2gAoEf/d4KdpLCOaVQo770bl3v82O8P61qmTIIRD7HXJK
        xqwXi1QkmlIicpkRcfHcF+gVJDMzOXJQlKP4yYNi8Q==
X-Google-Smtp-Source: ABdhPJyPrcl3loEFxLvFPSTGUV5QfkxLlPEtFHW/nLOy8LNGAqrJHf7uKMveYGOI+40h/R25xGzvRIZb34kWGjD9J9U=
X-Received: by 2002:a05:6402:4312:: with SMTP id m18mr18403124edc.273.1639627255989;
 Wed, 15 Dec 2021 20:00:55 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 16 Dec 2021 09:30:44 +0530
Message-ID: <CA+G9fYt-k1daHarGoXKz7uYvsAcDMNM2bk7jRcYBNf0sRE=+LQ@mail.gmail.com>
Subject: [next] arm64: efi-rt-wrapper.S:8: Error: unknown mnemonic `bti' --
 `bti c'
To:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[ Please ignore this email if it is already reported ]

While building Linux next 20211215 arm64 defconfig with gcc-8
following warnings / errors noticed.
and gcc-9, gcc-10 and gcc-11 builds pass.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current \
  ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
  CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- \
  'CC=sccache aarch64-linux-gnu-gcc' \
  'HOSTCC=sccache gcc'

/builds/linux/arch/arm64/kernel/efi-rt-wrapper.S: Assembler messages:
/builds/linux/arch/arm64/kernel/efi-rt-wrapper.S:8: Error: unknown
mnemonic `bti' -- `bti c'
make[3]: *** [/builds/linux/scripts/Makefile.build:411:
arch/arm64/kernel/efi-rt-wrapper.o] Error 1


meta data:
-----------
    git describe: next-20211215
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    git_sha: 93bf6eee76c0e716f6b32de690b1c52991547bb4
    git_short_log: 93bf6eee76c0 (\"Add linux-next specific files for 20211215\")
    target_arch: arm64
    toolchain: gcc-8

steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
https://builds.tuxbuild.com/22LCvXNzzZHquxsEYJUxEGe1kHW/

--
Linaro LKFT
https://lkft.linaro.org
