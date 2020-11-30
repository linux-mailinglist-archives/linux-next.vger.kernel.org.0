Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472A32C8881
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 16:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgK3Pny (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 10:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbgK3Pnw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 10:43:52 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B067C0613D4
        for <linux-next@vger.kernel.org>; Mon, 30 Nov 2020 07:43:12 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id m19so16920157ejl.11
        for <linux-next@vger.kernel.org>; Mon, 30 Nov 2020 07:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=oA+fEndH75xbc0OixuyB04zTGqn2xK8SCRoPv3aj8MA=;
        b=VlcNZOAfjG+HQtuk6fo/9fQYCKuyQe9rEUMGaXLAE234oriJbsuS8G0ndef2EOr1yb
         VJ4KUbD71vRQHQe8MDYNycwA4O9YAjb39MNqTiIs/MSqJYDvo7JikfTDne0V57Q+de7B
         PKMmo6qDGbpFVx8bOAxWsXSdN0L0EwFT2EowUojI0OEUqB+RCXruGOYpqE1N0bbogg96
         AZX/DMmr5Oxr7toDJmZxhQsfkG6Kod1CVOiyW5Lqop2KDD1eWz0DnHudMthYfQR4qZm8
         aLIpmD5/Y5zc3dmB3t5bEzDcersDawsMQLwjhv+s6iy9etYwaDox0hUVC72dkwuhnyhV
         L97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=oA+fEndH75xbc0OixuyB04zTGqn2xK8SCRoPv3aj8MA=;
        b=hAuCduHodYim2Cvu2ic7ZyZd9aOLGQEBWXSCTbNcQaMjLaF31eg1UGxvxNEOm6LsV4
         H+R3uRjTEMrhI9ibVdRZGAV2GQMBXJuUJPZBRhVhqXKJ6dPL+m8v6HgWfKcPYAqRM2wG
         SCbIsqZA/XZ+cdeVuxnkT+t+DFn6rnOK7EoL1MApzbRzrpRE1KXkVb/gd+xHatZ9llaN
         Q0eAdMsbjkj+TAzYAbD2NEZ5NjT0RsrlT586k3G3JlUIe3/R44M31bvHeeOAYC8QwjkU
         uETVYimFEMvO31Ki2ggpyrtBRoAGCTl7PiKRRIKKO6yLviGc7gpOyFlSqBu80eISmxBt
         0G8A==
X-Gm-Message-State: AOAM532GY5vHT5vRfBWgftWZCiJQXvmwnAlPMisWfe43j6s3gzORrtRK
        3bLSUzWdvefUhzOMB2ZfFLb4joO4s03nLrMSIn16DuCUg1CzyBWI
X-Google-Smtp-Source: ABdhPJzQfSIa9uM7M8D0mUHtBGmywxzFSREkGpnVtMnJ5xHF1SFnvIRFVybpn/ikF+SwaJaDcb0A2i/02ui2Ff/Kmqk=
X-Received: by 2002:a17:906:bd2:: with SMTP id y18mr21284947ejg.503.1606750990014;
 Mon, 30 Nov 2020 07:43:10 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 30 Nov 2020 21:12:58 +0530
Message-ID: <CA+G9fYuTS-Kmwy4wfNrFMLnon0v5No3KQeu262c9L91wOrcxkA@mail.gmail.com>
Subject: [next] arm64: mte.c:176:17: error: 'struct thread_struct' has no
 member named 'sctlr_tcf0'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>, andreyknvl@google.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Collingbourne <pcc@google.com>, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next tag 20201130 arm64 build failed due to below error,
  - gcc-9, gcc-10 and clang-10 build FAIL
  - gcc-8 build PASS.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/2/tmp ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
arch/arm64/kernel/mte.c: In function 'set_sctlr_el1_tcf0':
arch/arm64/kernel/mte.c:176:17: error: 'struct thread_struct' has no
member named 'sctlr_tcf0'
  176 |  current->thread.sctlr_tcf0 = tcf0;
      |                 ^
At top level:
arch/arm64/kernel/mte.c:168:13: warning: 'set_sctlr_el1_tcf0' defined
but not used [-Wunused-function]
  168 | static void set_sctlr_el1_tcf0(u64 tcf0)
      |             ^~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:283: arch/arm64/kernel/mte.o] Error 1
make[3]: Target '__build' not remade because of errors.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

steps to reproduce:

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


tuxmake --runtime docker --target-arch arm64 --toolchain gcc-9
--kconfig defconfig --kconfig-add
https://builds.tuxbuild.com/1l0FGU7GBRQu6kT79iDAwsHkQ6d/config


-- 
Linaro LKFT
https://lkft.linaro.org
