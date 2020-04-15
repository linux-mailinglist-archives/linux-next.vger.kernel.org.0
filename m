Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68D51A95F5
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 10:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635713AbgDOIPf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 04:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635706AbgDOIPd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2020 04:15:33 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474C4C061A0C
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2020 01:15:32 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id g2so985269plo.3
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2020 01:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uZp4vzsenadtVuRv5W5iMJLEYzOPDbXBB4D+QbUWMYg=;
        b=ZgZA4VzktBf+IMExnQXt8osjCMxoxgn3yI7ty7vFrEVk6rJeHFsFsMbenuxQPGkIXH
         3sRwMUTS0T4eMmM6OPLXzVgJssCqb+0H+021TBXf1WQf/426KYhErZwVcJpx0EKmld/j
         6ZtuyEXP8pfXPh7v6XW103Y4Cfd85iIMhBqq0281Ftpy+5I0AH15zM0Wd2B92Wl2Hdvq
         kEdUOY12otf/kA8/JtmM0FW1PqTEx949Lmyi5I+gMTfVKmoconNFwP3K3xlax6n2nQns
         V8D1IDAhBbF60acsFlx/yRYlqNkG4kCydzTkJM45q8hOc/CVPNDjESnSaHjalkEMv1rz
         W67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uZp4vzsenadtVuRv5W5iMJLEYzOPDbXBB4D+QbUWMYg=;
        b=OD/nmJFWcjAALQ5Og2Cngh9H9iNC0gw3aU8/+7jNYJSsMQoKp0ceVhPi0huDO4Rof+
         AGv9bCTZeNhKMb6TszmwHN41VCuisw6b71enmHCTRM/lCE6oeRYsfIqPqVlzLF/eD2wZ
         NKqWTla7woYtHvUr4U/o11t929IDnJPtKY/2w/ccQGu3F6xtsI7RKmkVAVHgruPWmHH1
         UC0UM2lXEJfxtoMYYZ0o+x7gJhTQKlQyonRaT2xoo+zeRzDyLsOcIU0sg4qjyet9l8Uk
         1YHbGQMLF2rKpQ2UJzkrv+WjoF6wGtNceqbL8T2tEVwC00FNIIeGbgHylQi8fsYmCKm4
         7A9A==
X-Gm-Message-State: AGi0PuZtgfXhc+EFe1K2BCBouQHpvORELrCfrePq1WTRBTw3Y/c4A28c
        257cSbacFkZ6qRdXEhhpHiDnyDMLDBo=
X-Google-Smtp-Source: APiQypLuLFfBn1USRsQ52EdqvKzDIrWLk8LAOfOyFm4xecL5++BYnbHDs033fSCOzRJZQK6sZdQJkA==
X-Received: by 2002:a17:902:968f:: with SMTP id n15mr3715080plp.11.1586938531266;
        Wed, 15 Apr 2020 01:15:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a23sm7283191pfo.145.2020.04.15.01.15.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 01:15:30 -0700 (PDT)
Message-ID: <5e96c2a2.1c69fb81.f0f28.9c5c@mx.google.com>
Date:   Wed, 15 Apr 2020 01:15:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-rc1-227-g598f941cf1a8
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 283 boots: 7 failed,
 266 passed with 5 offline, 5 untried/unknown (v5.7-rc1-227-g598f941cf1a8)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 283 boots: 7 failed, 266 passed with 5 offline, 5 =
untried/unknown (v5.7-rc1-227-g598f941cf1a8)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc1-227-g598f941cf1a8/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc1-227-g598f941cf1a8/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc1-227-g598f941cf1a8
Git Commit: 598f941cf1a8bf617bdeed0c93f2f1a1971fba0e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 109 unique boards, 25 SoC families, 30 builds out of 217

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: failing since 13 days (last pass: v5.6-3095-g77=
1732386d6d - first fail: v5.6-6294-g700297ff160a)

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 1 day (last pass: v5.7-rc1-138-g=
a7477b73db80 - first fail: v5.7-rc1-162-gb5846b244239)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 60 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc1-162-gb5846b24=
4239)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: v5.6-3095-g7717323=
86d6d - first fail: v5.6-12726-gcb0447b07277)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-162-gb=
5846b244239)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: v5.7-rc1-162-gb5846b244=
239)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-162-gb=
5846b244239)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.7-rc1-162-gb5846b244=
239)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-162-gb=
5846b244239)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 4 days (last pass: v5.6-1=
2182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

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
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

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
