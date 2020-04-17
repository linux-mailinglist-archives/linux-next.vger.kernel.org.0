Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF6A1AE0F1
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 17:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgDQPWT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 11:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728684AbgDQPWT (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 11:22:19 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE06C061A0C
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 08:22:19 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id a7so993514pju.2
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XWCa4np2PNbrjH82Pr3NO1byd8B6S7zlT+C8GbojGPc=;
        b=IOUH0aRhgILp2iT6EyAaWaX/SwyIZCwUDuOOuAL4thFNkBfPePRHFFWX1Vw6n4Uhjq
         X7FeJLGlE2Hcypf3y1QzGYEHLYKOVhKSdLGKb3JMDmnJzjRn43OP23Wzwkr9yoqaetCT
         wcWpKlXu3taIxkJEMBT37AQmLwJSfWWNnFvK3sJuyrf9EvTtoEeQpDyOWLsmA2vxozX9
         qz8x+hnM10l9awutcssl6TawUE1aFyrPUHq2JvSDlDrIMKuanc7TwRF32iWxkuREgevP
         5fOPJn4gpmTwbRtMvIWRGb/J5/pp2qaS2KuYunuwthao3YqVnXyoz1mVlixZCW6dmAwo
         Ku0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XWCa4np2PNbrjH82Pr3NO1byd8B6S7zlT+C8GbojGPc=;
        b=rlW0aIQ4SHP92CsCpMnkAqjPdEkTRH1PDwgquRD+J5sYoBailyYdOCUPGx7G2ErigR
         Ua//HSHiYaWsCq41b13zBQGND8u9Pb9H84lDSlDNG8jAw5Emb9InbrNcz+o69i6BRq+e
         WmH0A4JjTO0TMX5hQdqo4LdKDBC/SfSsKoq84Ki+rEeVgNWL5MU6ukhfHS5n00Z7p65p
         oGIxrtlAOvSn8vDvlPNUWa/eIrseZhq5S7Ky8wS5gyuazrlRS7Mlt54wllcQN8e9Qkqp
         lgcWNwe5LTJ/xeJiL2yXHI5VCiiRmJDKRCkmBLiQFMVKu9G5EvR5RaExFEHVC8mx0t6c
         jOhg==
X-Gm-Message-State: AGi0PuY/U390/deKsDbVkCvZbF3E04sua13c3zqvu2mklb0XZvnxQIbk
        HipyB2dpeUbOLN0H6LoXgjKzccPcGdM=
X-Google-Smtp-Source: APiQypLM/tp5vMed10XvxAE4nPmTdZ4PSEhoZ9o36KuIwbeHPhoaSoheayljjm1HfwucPv1lCpTKMA==
X-Received: by 2002:a17:902:8341:: with SMTP id z1mr3802434pln.94.1587136938434;
        Fri, 17 Apr 2020 08:22:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x186sm19653236pfb.151.2020.04.17.08.22.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 08:22:17 -0700 (PDT)
Message-ID: <5e99c9a9.1c69fb81.c72d1.634f@mx.google.com>
Date:   Fri, 17 Apr 2020 08:22:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc1-369-gddfbb969755d
Subject: next/pending-fixes boot: 276 boots: 6 failed,
 260 passed with 4 offline, 6 untried/unknown (v5.7-rc1-369-gddfbb969755d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 276 boots: 6 failed, 260 passed with 4 offline, 6 =
untried/unknown (v5.7-rc1-369-gddfbb969755d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc1-369-gddfbb969755d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc1-369-gddfbb969755d/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc1-369-gddfbb969755d
Git Commit: ddfbb969755d048c34535939ca8c57d9c6e160b1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 107 unique boards, 24 SoC families, 30 builds out of 217

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: v5.7-rc1-279-gd450baa50=
f41)

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc1-279-gd450baa5=
0f41)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 63 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.7-rc1-279-gd450baa50=
f41)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 3 days (last pass: v5.6-3095-g771732=
386d6d - first fail: v5.6-12726-gcb0447b07277)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-279-gd=
450baa50f41)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-279-gd=
450baa50f41)
          meson-gxl-s805x-p241:
              lab-baylibre: failing since 1 day (last pass: v5.7-rc1-227-g5=
98f941cf1a8 - first fail: v5.7-rc1-279-gd450baa50f41)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.7-rc1-279-gd450baa50=
f41)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-279-gd=
450baa50f41)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.7-rc1-279-gd450baa50=
f41)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.7-rc1-279-gd450baa50=
f41)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 7 days (last pass: v5.6-1=
2182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
