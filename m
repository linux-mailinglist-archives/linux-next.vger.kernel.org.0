Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99BE1BD7F7
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 11:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgD2JKf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Apr 2020 05:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726355AbgD2JKf (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Apr 2020 05:10:35 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C0BC03C1AD
        for <linux-next@vger.kernel.org>; Wed, 29 Apr 2020 02:10:35 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s18so730202pgl.12
        for <linux-next@vger.kernel.org>; Wed, 29 Apr 2020 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5PcnfJdcwvdTPZhKIEZu1VwXYnUSCGnU0hGusn/U5AE=;
        b=WgaHgXl4M4m2ZQQ+3YL58OBYm7Oy5vfbKKWqV01c6+upbyi4I0z9nURIg99xMCV2uV
         Emtcj+4pyTW9JStpMQ14QKiJdPALZ2qfY77GxwU+4vx8yUowA14Y6tWV2cR6HT3pUvck
         wmZOFog9yh3tNUivMx4GnoUmKgR/lgV/lyeWluommT802r8WMyCzlnzSnMnkGIIWB+Hr
         2PF/Et4dJzpaYdGtemVdY8Jm2svyLw8RLrMlKL1Ge/oun74rKeEoQtJAiQOk0KmXKv7z
         gLvArKRYmCZQtaXI5o3Zm4TId/voRZev3QT3HNnZ6taJHpa9oKf9QZksjUhi4+MdGk9f
         D+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5PcnfJdcwvdTPZhKIEZu1VwXYnUSCGnU0hGusn/U5AE=;
        b=dvOou45MHqIOA76pjms3qEtUnXRo1hRNg6hYECClZdYFNjPBO6tlSEZWxnVCeBAeAG
         4SS46nNUBL8N+iTjwQywOJ1kNy7S3dLBKgkqyQXdwCCwJKSieNe9keOYEE3pTXYwN9R1
         1gxUDkQ4XWVDzdAMT66H5N9bFij3FWAHT4L1Tn2Qmfm9Lv8+8joMhzB45qQIGhSkCsix
         nVJlvdmQq+0DnaO4jsH1B+GfAax+M52v8ScaoruHD/Q2d97VjLahKtpuwwuBPY0zd8e2
         a91usXLMF4Uemd2JGbhcoPaHIjeuLuQ01Cf+l4JkHFRjSDdnXmnWIu7njz0iSL1cn0HG
         1zaw==
X-Gm-Message-State: AGi0Pua61UddMJKaBvNYZYTvdQHoTIbHLvQj6VvVGaJF6SPmq05HtxbM
        COEpDaHcAyc6zAMEi6k5JEH0cg9dK80=
X-Google-Smtp-Source: APiQypJrTHZqcpRMq6IlpfSu0/AkwkjoL+31Waz9zeShde3qt/zO+wo0d3talBHAIKTQCcpxa+l5og==
X-Received: by 2002:a63:82c1:: with SMTP id w184mr26712043pgd.268.1588151434251;
        Wed, 29 Apr 2020 02:10:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w66sm634534pfw.50.2020.04.29.02.10.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 02:10:33 -0700 (PDT)
Message-ID: <5ea94489.1c69fb81.7d3ed.1c89@mx.google.com>
Date:   Wed, 29 Apr 2020 02:10:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc3-228-g76a37a4cf830
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 285 boots: 9 failed,
 261 passed with 6 offline, 6 untried/unknown,
 3 conflicts (v5.7-rc3-228-g76a37a4cf830)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 285 boots: 9 failed, 261 passed with 6 offline, 6 =
untried/unknown, 3 conflicts (v5.7-rc3-228-g76a37a4cf830)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc3-228-g76a37a4cf830/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc3-228-g76a37a4cf830/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc3-228-g76a37a4cf830
Git Commit: 76a37a4cf830b1f46e34037426b2f25c29acf8eb
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 108 unique boards, 24 SoC families, 31 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc3-194-g1631e20d=
9729)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 74 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc3-194-g1631e20d=
9729)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-rc3-194-g1631e20d=
9729)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.7-rc3-194-g1631e20d9729)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc3-194-g1=
631e20d9729)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.7-rc3-194-g1631e20d9=
729)
          sun50i-a64-pine64-plus:
              lab-baylibre: failing since 1 day (last pass: v5.7-rc2-266-g3=
c7f529d10ff - first fail: v5.7-rc3-194-g1631e20d9729)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc3-194-g1=
631e20d9729)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc3-194-g1=
631e20d9729)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.7-rc3-194-g1631e20d9=
729)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: v5.7-rc3-194-g1631e20d9=
729)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 18 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

x86_64:

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-rc3-194-g1631e20d=
9729)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig:
        qemu_i386:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

x86_64:
    x86_64_defconfig:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    x86_64_defconfig+kvm_guest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
