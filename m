Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 230361DED31
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 18:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbgEVQ0I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 12:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729040AbgEVQ0H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 12:26:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1659C061A0E
        for <linux-next@vger.kernel.org>; Fri, 22 May 2020 09:26:06 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e11so4452028pfn.3
        for <linux-next@vger.kernel.org>; Fri, 22 May 2020 09:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KvwTAsREu1bULUEjPvJCelbs3PNl+Wq8pJnSgoq9r98=;
        b=p4KcHbputgbruV3XaC3ISviS+87LQxSkK3JRuLe/JyGS37p/N+euGmnjOFybok/FDQ
         SAskejwYNfx9GomtmvKTIfQV6RlbZmmfgQrGKFWvIvvGedxD8tOYMHlpfa3Sg1QYj/Ht
         0jqnXrrcaDjZMDO/HAI5JRZto22d3DdMZI8+0WRY7vxfijOP8xntn4uifKzE1A4Rmdgw
         rd2Y9XX07VsxXNfGbVhg09pmNpVA88ZZGjuI3fxaMh9Mp0j7Va4y9FRhQFYmxp/OvapK
         ar8DY7cDoGfsguJOQN8CbQDt+S+7sbuIjKmhCp62Fw+HedMEvZNR/mTi0h32fCINLxiH
         2z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KvwTAsREu1bULUEjPvJCelbs3PNl+Wq8pJnSgoq9r98=;
        b=kBNAQs1BLTWXJNDnGQRRN0wH/WY/lJWTDwBV8t+YhjQpdnx4LSymWZ/RlIV4Oq+Fsx
         d+QytL9MsyYbbt+KCHd1VAnPqqpgTjrLHx/KYK9qPRslZ8myjQRgvNmw2nzA0QygTik7
         7zjcc6zgBESJprhZIQufclVh8u8oai8JHqtgkyctOAXnlnJveS4p0RkQX3jmsRM7trYh
         GP3Y5VnpNmVibeXNc4Ia9UWSfwEGns88S8FziBBXn/mSd7Azw93iTqSL7Gl4+GwHxo0/
         dF2sJ8Ip8JtHndUUdaPM4CIauCW8djp8n5FS3bMVm485yYwlKB5NcsLqtftxtUDYmklw
         RMog==
X-Gm-Message-State: AOAM530LeCtg4fpWlBjuQgwBR8vcDd1xn1alyF2jUckeGHmkUEj4ntVP
        TazDrI/lIrmrNMcewnH3NSnMY+Sp8g0=
X-Google-Smtp-Source: ABdhPJx2WadBXaxMvuJqgKB9g6cCVgid34+oRAVfcOBDnJ1ZfMh1Wkc0GOwNNppZ06qf0U57vzqcpg==
X-Received: by 2002:a63:d70b:: with SMTP id d11mr14596217pgg.372.1590164766093;
        Fri, 22 May 2020 09:26:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i25sm7484097pfd.45.2020.05.22.09.26.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 09:26:04 -0700 (PDT)
Message-ID: <5ec7fd1c.1c69fb81.c24e4.177f@mx.google.com>
Date:   Fri, 22 May 2020 09:26:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200521
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 245 boots: 19 failed, 219 passed with 4 offline,
 3 untried/unknown (next-20200521)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/next/branch/master/kernel/next-20200521/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 245 boots: 19 failed, 219 passed with 4 offline, 3 untrie=
d/unknown (next-20200521)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200521/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200521/

Tree: next
Branch: master
Git Describe: next-20200521
Git Commit: e8f3274774b45b5f4e9e3d5cad7ff9f43ae3add5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 103 unique boards, 26 SoC families, 30 builds out of 222

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 94 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: failing since 3 days (last pass: next-20200515=
 - first fail: next-20200518)

arm64:

    defconfig:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: new failure (last pass: next-20200519)
          meson-g12a-x96-max:
              lab-baylibre: new failure (last pass: next-20200519)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200519)
          meson-g12b-odroid-n2:
              lab-baylibre: new failure (last pass: next-20200519)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: next-20200515)
          meson-sm1-sei610:
              lab-baylibre: new failure (last pass: next-20200519)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: next-20200515)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: new failure (last pass: next-20200519)
          meson-g12a-x96-max:
              lab-baylibre: new failure (last pass: next-20200519)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200519)
          meson-g12b-odroid-n2:
              lab-baylibre: new failure (last pass: next-20200519)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: next-20200515)
          meson-sm1-sei610:
              lab-baylibre: new failure (last pass: next-20200519)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 56 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab
            sm8150-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
