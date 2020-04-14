Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385461A7721
	for <lists+linux-next@lfdr.de>; Tue, 14 Apr 2020 11:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437498AbgDNJPS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 05:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437356AbgDNJPQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2020 05:15:16 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261EEC0A3BD0
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 02:15:16 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id l1so5782555pff.10
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3w7gSDDpCygGQsuxnFbSnGN/vGYV7pxbPEmtddZP0/k=;
        b=aoLnmxqBF7FOJgXYsc1A28iLYANq1+UbHVpBT77yyEBRcFi91banW3o1+a37R+QsQz
         gUyzczYrTlvyRa+f20TSY8/FXURb/WYzEZyPm5pCTDqoK1izTA0Z8/7KkS0MOAOTrtd7
         00G6hByxZAfQoBTNMbpgWf6i9S4Y0OHvpCGPkQiGkmVNdvFIBZzjv6CTk/gj46zb/Bf6
         rZIOjeo4M5ghRJo2hZYhlouh5hkUzwrlJaM0ZBx0mOH9ANiSGUARuL9SL0wHbogSCcmx
         1wBsbIi3LqSd/MyfwClja06pL1J0qG67lZLKR/XKZ7cotAzjNUePuzZfhhHFtxTI3KY2
         fJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3w7gSDDpCygGQsuxnFbSnGN/vGYV7pxbPEmtddZP0/k=;
        b=bTysw33vi3x/MyoPHLHzRSM/4EV1Q/yIKuzu5WPZk381+VxL213m/uuq3yNsF5xU8L
         lENV1MrogCEsoapz2RQs0TBuLaLGHxLALD6+ymNOFmq2W8BnPVhjOIjDrFny7mGxmUex
         /3Hy1iqcvznq/p5ecUPxmwuwnha8MU/3++aQe/Y5QAeAdoz3VX9XdQTQGe8Fk4/89c9R
         8XbE/6hP67D6/LSIEvifWs+lCx6PTrGnKKi0RC63S1gmK8/ULVSkwqSQFGDxpfy+Vmfj
         +Ltz3ec+xKvtwUYsI2Mc3r2aH+yBxgl/Z77D5j8MbId/elrCuOahaGIatULRfE57hRCF
         SuNw==
X-Gm-Message-State: AGi0PubGag/SoVJpuC1L95/jqJR8fLH38ruzTEnoDpcyosa9u2RpX6+A
        T3De0eYfOQLxoITAgp9kdAYskETndlk=
X-Google-Smtp-Source: APiQypItWi47h/N+YV7K2nu17zzMWdQjFJaZPtbfKTYS+dcJT/X1mRypsW9u/FpapZUcTBK+dnqr8w==
X-Received: by 2002:a62:5341:: with SMTP id h62mr21540749pfb.183.1586855714242;
        Tue, 14 Apr 2020 02:15:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p65sm5936056pgp.51.2020.04.14.02.15.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 02:15:13 -0700 (PDT)
Message-ID: <5e957f21.1c69fb81.b7a21.2a49@mx.google.com>
Date:   Tue, 14 Apr 2020 02:15:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200414
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 280 boots: 6 failed, 260 passed with 9 offline,
 5 untried/unknown (next-20200414)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 280 boots: 6 failed, 260 passed with 9 offline, 5 untried=
/unknown (next-20200414)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200414/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200414/

Tree: next
Branch: master
Git Describe: next-20200414
Git Commit: f19bb13a0eaf0034a603e3b54a7c3a50faf6821e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 107 unique boards, 23 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: next-20200413)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: next-20200413)

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200413)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 56 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        clang-9:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200412)
          sdm845-mtp:
              lab-bjorn: new failure (last pass: next-20200412)
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200413)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200413)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200413)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 17 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        clang-9:
            apq8096-db820c: 1 failed lab
            sdm845-mtp: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
