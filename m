Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F2544AE76
	for <lists+linux-next@lfdr.de>; Tue,  9 Nov 2021 14:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhKINKs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Nov 2021 08:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbhKINKs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Nov 2021 08:10:48 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CD2C061766
        for <linux-next@vger.kernel.org>; Tue,  9 Nov 2021 05:08:02 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id o8so76343114edc.3
        for <linux-next@vger.kernel.org>; Tue, 09 Nov 2021 05:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=z/G52I1JExpiE6TsSsLB/EzgZR9OB61hQ9ixNpsTNBE=;
        b=CuUtxJN4kwqiRiUowjq6mEvwrxbwdABBDFwboec9BwfBBdNKP+Sd0FJQ2oNClGFe3j
         6hsijBoQm6PVzx6rpcsIRMF5nRChEyRXjOnRF7zObCZ9zs4W8FYbDC3TqL5MdAIVjBzo
         milLxaXzmLHeJMIuFzf6v9W2QcdoPHr5bOLCBxuINtH/rYcVZXYJ7/O9um2gEGlnmlV4
         i4JxLxE1na3/h7vZTOWyGhLU1UZddywmHh87pC7KQNPyFcMH50nZ1Q6NqNgMMVnb6Bun
         0Qa1yfv8qDXSQfGhd6TknCcoLaUoj/aqjFVp02cArCjNPQuuLnPq24D2oN+Dyssuf2+L
         cPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=z/G52I1JExpiE6TsSsLB/EzgZR9OB61hQ9ixNpsTNBE=;
        b=jQke5xMmvmbyGeMfMSfZySSr5IT5EnUZ5WNhq9CLgyF6ECXzjNkP76fuYtjB5FstLD
         Tg9CpaAEULzmuYvta8Kkf1Lpzc/Q+YQLN7DQJiXVsoRBScxo65fMYyRsSD0E43Uj7aqZ
         vr+4h+az4ASfyxgcqZz9C7nroaSEAzuA1PcvoVYeS4f61hGo7ERO8eNenO46YPmR2jm2
         yShEUl5s4ivGIXoLp54p5evxcr1dY4fInep15RSZisyd1BN98QxdJAwZXl+YlhGU6aP8
         YZe+2nsqgCI0i0tYa2ibCdSHMpAbOw2g2UOlEMtZ+SonZAiOezKGT5js8KCz2BA9wSby
         ZFbg==
X-Gm-Message-State: AOAM532dbA0bXGk5U+uniLhJPrdGwrkI/xPv5G+S8DAT75YF1CjrAu+C
        P5xs4o01go9gCchoue/qXNJ9nLcCbjnPhvqKLfL3sw==
X-Google-Smtp-Source: ABdhPJwUTCxSCo1QVtNs5QZJ4bfRcHmVDxVbWaA72k99Wgx4nF22yhg3NcwJ+sONSsC0fGX1HlPTvHTRROvNktdXjz4=
X-Received: by 2002:a50:e184:: with SMTP id k4mr10018486edl.217.1636463280343;
 Tue, 09 Nov 2021 05:08:00 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 9 Nov 2021 18:37:48 +0530
Message-ID: <CA+G9fYvviLKpT7a-1ZDmVp8YN8cCG0ixLpxv2uSubtsw-CkZCQ@mail.gmail.com>
Subject: powerpc: mcu_mpc8349emitx.c:189:13: error: unused variable 'ret' [-Werror=unused-variable]
To:     Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Scott Wood <oss@buserror.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[Please ignore this email if it is already reported ]

Regression found on powerpc gcc-8/9/10 and gcc-11 built with ppc6xx_defconfig
Following build warnings / errors reported on linux next 20211109.

metadata:
    git_describe: next-20211109
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: c8109c2ba35e (\"Add linux-next specific files for 20211109\")
    target_arch: powerpc
    toolchain: gcc-11

build error :
--------------
<stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]
arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c: In function 'mcu_remove':
arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c:189:13: error: unused
variable 'ret' [-Werror=unused-variable]
  189 |         int ret;
      |             ^~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:288:
arch/powerpc/platforms/83xx/mcu_mpc8349emitx.o] Error 1
make[4]: Target '__build' not remade because of errors.
make[3]: *** [scripts/Makefile.build:571: arch/powerpc/platforms/83xx] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/20fICxLPRCpcISasoGwKGICBELv/build.log

build config:
-------------
https://builds.tuxbuild.com/20fICxLPRCpcISasoGwKGICBELv/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch powerpc --toolchain gcc-11
--kconfig ppc6xx_defconfig


--
Linaro LKFT
https://lkft.linaro.org
