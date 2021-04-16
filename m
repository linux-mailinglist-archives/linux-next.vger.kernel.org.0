Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC53A3623A9
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 17:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245588AbhDPPRI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 11:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343492AbhDPPPm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2021 11:15:42 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3D5C061574
        for <linux-next@vger.kernel.org>; Fri, 16 Apr 2021 08:15:17 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id w18so32773319edc.0
        for <linux-next@vger.kernel.org>; Fri, 16 Apr 2021 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=gPjPQ5qDzGBkOSXJMCrPfM0jmXAYxV0r6RQg7u3LJuI=;
        b=C7ZZFn861CebUylijr5WPKczKv6VxTRpf7M/lt1VmVJ3pR861CRGNmDaBE03/Roz7F
         VrtIfwRZbpLI9//Xk9wHekBP6SoRqaksrmuhrwaz0n1dMRKAPI0r2Y+vRMZVNEBaE+2G
         kJGmIaKM9a7Nvx422NzgwIR2bVfcN2Zh+tKVZO/GZ52IFA0TbHmaPJxOqHgfu3lOIq5x
         Vp4CsHzoDpsithdfYe79Z+KDOzIcsFnuIUamu6fJ5aFmIX4h5rXc/d7B7i6ljN0f7yAj
         IJVE95q3G7S/n7INJQQ+dUBhxDzaOT5q7rL35QzeNAZV4bOhq7iqaDU/ZLQwbv1pkN9E
         vlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=gPjPQ5qDzGBkOSXJMCrPfM0jmXAYxV0r6RQg7u3LJuI=;
        b=oWC1PeDvNjUP5dndDoOtKhbxqlovNpab38HapzvRblS011eVA1fTl+4jfBqWeYN5uK
         BP2oihLuOabOpYXjAlNGewJQ97aju5KEp3gZNga1CBQET2XMdx6xybq9/PMIq4uSQxnB
         Uy8HvgBQBziGnV61h5Gstz8fQVJa5xDM1DocrGB7FcAVLDyFNDE02+6xDB1cXpfP1HKv
         thO3xJT9WFwQA4wvPUKVSDQVFx7CpEv9jfZQHTrbbv7En1+syirGlV8OPOERKT9HwAN0
         /RpXuzDibKvI5V4kj/4SzBDz7Jr72plM7+Oi/y5J9T5ZcG5DXJ4o77jamQKw49B95rZi
         tYGg==
X-Gm-Message-State: AOAM5334yvYU250/+rN/af/yFAVZ09rpGi7snY/eAax1Kqir8MaQ7698
        f8sHPuv8Rz1OwayeMrp+RwHEwvRchKmFiE25LGbAQlS6NkUdh7xw
X-Google-Smtp-Source: ABdhPJyLqnjexATn6QDAqGAVkppBTUayPGgGyCVS0rPaONsvFuwHmnuxbNdPsEJZ3ZyRkKkXah7HATHTJgMQc25C0Jw=
X-Received: by 2002:a05:6402:145:: with SMTP id s5mr10495472edu.221.1618586115402;
 Fri, 16 Apr 2021 08:15:15 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 16 Apr 2021 20:45:04 +0530
Message-ID: <CA+G9fYtVGhCJbnY8Hro2qx-i21cOeEBD6t_yz7B=O6Y7gD5bkQ@mail.gmail.com>
Subject: [next] aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The arm64 allnoconfig build failed on linux -next tag 20210416

kernel/sched/fair.c:8428:13: warning: 'update_nohz_stats' defined but
not used [-Wunused-function]
 static bool update_nohz_stats(struct rq *rq)
             ^~~~~~~~~~~~~~~~~
aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: arch/arm64/kernel/fpsimd.o: in function
`task_fpsimd_load':
fpsimd.c:(.text+0x144): undefined reference to `sve_load_state'
aarch64-linux-gnu-ld: arch/arm64/kernel/fpsimd.o: in function `fpsimd_save':
fpsimd.c:(.text+0x1f8): undefined reference to `sve_get_vl'
aarch64-linux-gnu-ld: fpsimd.c:(.text+0x230): undefined reference to
`sve_save_state'
make[1]: *** [/builds/linux/Makefile:1277: vmlinux] Error 1
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:222: __sub-make] Error 2
make: Target '__all' not remade because of errors.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

steps to reproduce:
--------------------
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


tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig allnoconfig

metadata:
---------
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_describe: next-20210415
    kconfig: allnoconfig
    target_arch: arm64
    toolchain: gcc-8


--
Linaro LKFT
https://lkft.linaro.org
