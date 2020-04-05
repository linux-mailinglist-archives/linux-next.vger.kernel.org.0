Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29E6E19EA68
	for <lists+linux-next@lfdr.de>; Sun,  5 Apr 2020 12:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgDEKdD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Apr 2020 06:33:03 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:46054 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgDEKdD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Apr 2020 06:33:03 -0400
Received: by mail-pl1-f173.google.com with SMTP id t4so4711811plq.12
        for <linux-next@vger.kernel.org>; Sun, 05 Apr 2020 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pU5dlP6gQAB2+D2mODfyWbnej6AgZKfBwlSaGUYedYo=;
        b=0dftIIZnZULI6KUx9BvtpgFdnKBR0LAvfSJsBjWNFN0TcXiFNmuPSZrbcChEWT+poH
         GTPfMj1i2SonHYQDMl87aWO4Zn09N6f5oIeUavjakU547x3T+qfGHmkLQX/0BrN5kQq6
         YX7VqOcBg5JgWYdscX0hz8cPRcCivv9isJ8404GVOa4hwA4mz+d67XT26yjDQpzhKy+G
         mlY0HhIdPbfBcTIELkvebVNGZlCg2c6BidTyW02iOIlZw2IxgeXPUoORZbttzvqOgqcc
         mj+rk2TyVYQ701AA2FT8UjA9nBUZcMNDba0EYLp076wE1dZbOQX6sHUY6LMVF1wluAho
         6evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pU5dlP6gQAB2+D2mODfyWbnej6AgZKfBwlSaGUYedYo=;
        b=oj3fSTU3Ru5cMtF0lzNjvG3uM19UojNxEAOMTfD5k3Kt+kZsYhHfBvIT51uhI4nUAY
         Q/mqz0MX0aSd0H8/drie9tAo1WnMwI8U/rdzeN3tdJXjK/1YGMTpmm8a1JH4su4I+5j4
         ld3o0Vjky00dvYyX8FUwPCuCx7QEKeKMupCqZKqFvtc2SE6B5RlHaNru+hAlwpOHt6sB
         JtAITKO++1bkTtYK/d5Y4c3X5DDE+J+imgtG1VIe+gejEssCRadoZDbw+wc3II2cScE8
         VAyx3X8X+8csYLf8bgYrMRamx+N9HiDQ6s6yjbFCMLoPDqH/IPMOv6dPIyRMTrrSZlNB
         yO5w==
X-Gm-Message-State: AGi0PuYJ3MZAbzeCJ9e2m7Ev812s+pQ5nxw9K9bagjExwz3cbDB9dJPR
        AoGsNu5thdXFrKY9sclVIjVAf1n3410=
X-Google-Smtp-Source: APiQypK9l4797GN84zsI9WsZrFxzD6idyupmNgjq/q9rp4jMPVCSAIpBw/KCDw4fZIa4HZCaNZPtOQ==
X-Received: by 2002:a17:902:449:: with SMTP id 67mr15212516ple.339.1586082781159;
        Sun, 05 Apr 2020 03:33:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q6sm9485079pja.34.2020.04.05.03.32.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 03:33:00 -0700 (PDT)
Message-ID: <5e89b3dc.1c69fb81.c73ea.e873@mx.google.com>
Date:   Sun, 05 Apr 2020 03:33:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200405
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 278 boots: 9 failed, 258 passed with 4 offline,
 7 untried/unknown (next-20200405)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 278 boots: 9 failed, 258 passed with 4 offline, 7 untried=
/unknown (next-20200405)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200405/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200405/

Tree: next
Branch: master
Git Describe: next-20200405
Git Commit: 57021046c3316f8a6970506b09ec83337a4f5304
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 24 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 15 days (last pass: next-2020031=
9 - first fail: next-20200320)
          exynos5800-peach-pi:
              lab-collabora: failing since 4 days (last pass: next-20200305=
 - first fail: next-20200331)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: failing since 4 days (last pass: next-20200129=
 - first fail: next-20200331)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20200404)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 47 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200404)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200404)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200404)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200404)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200404)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200404)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 8 days (last pass: next-2=
0200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 2 failed labs

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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
