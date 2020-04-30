Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C3A1BFF75
	for <lists+linux-next@lfdr.de>; Thu, 30 Apr 2020 17:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgD3PCZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Apr 2020 11:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726421AbgD3PCZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Apr 2020 11:02:25 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53D0C035494
        for <linux-next@vger.kernel.org>; Thu, 30 Apr 2020 08:02:23 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id hi11so804139pjb.3
        for <linux-next@vger.kernel.org>; Thu, 30 Apr 2020 08:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X1ixrh4ZNHUP81Dwv3vgm9oNYtrW+BSxHINUueR5Gxo=;
        b=voUChC9TU4nI/qlNsYAzGqhDe4IKkkWPPw17dBJoDXyMY9avE9mF+mtI/Kc/XqCr2T
         4CCxuaC0APTEam2fV6a7GW1dssVqvKQVLRxIaQXZV8OcTJ+5EimwM1nppZMZ0vtSAXuE
         MObMgU+1t9CPvJ1cka3F6yorVPPXNo6KZEIGGAfTeKTDBsjl3DwMar4shhVWYaKyPBDe
         VL3wekI2HW2Hrqd88I8etY90BWehmHJ0qN7V60n+D4V3JbhuWPxm7fEowO7wi2ZhH+dp
         aw3+SIBOeezG3u0hh+c8dqvZBzeKuiQB3H5J93B78l9B5ReModqRT3R9cXLLmNUBy/CO
         loyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X1ixrh4ZNHUP81Dwv3vgm9oNYtrW+BSxHINUueR5Gxo=;
        b=TrKQovfJMoNhAiRR3TcClEbGjHCIKznt48xMW2t+e+EoSEkYCzPrYU8/q1+VtELrDT
         aG+FpAiYJQt8kWC8VyBmihQrvKcooAQA5sDAyUobXedS2U579vzMqfxXHNOWFsXRuOYr
         PRuumxaFayVHvXitoYArm9PxYI90N5CS+I76/jqtIv4XmopnHcrha3KDRjoeC2+kG22g
         X/wCZjUOVDPmG8AG1XD0x/5sIwnfRmtkAiHVI6PiigIBogR/bbpAf53i3fa2PMjFTuPH
         En+Hf6sXFjTvJHU0AFZQQm1GpXbLNU9uaBT1tHo8+W/Idh+g1fiKPq90HbE8VJBGrpzv
         5LRw==
X-Gm-Message-State: AGi0PubluxuBXdEwF1RJg1e7zVvr6TAnZhLN9m5ESXHM7bNN5fgC0w8y
        LfoKPFFme1DGW093nIdaQp/BmQDypdA=
X-Google-Smtp-Source: APiQypI6pPWLVydmZFq7oifhDePDmTF4/etWjJe/hWVF9Y5UAocdBw9nlEvi1tIkpmRHiQ+EnpzrYA==
X-Received: by 2002:a17:90a:f985:: with SMTP id cq5mr3460094pjb.193.1588258942544;
        Thu, 30 Apr 2020 08:02:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gv7sm146811pjb.16.2020.04.30.08.02.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 08:02:16 -0700 (PDT)
Message-ID: <5eaae878.1c69fb81.85f2b.0720@mx.google.com>
Date:   Thu, 30 Apr 2020 08:02:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc3-247-gf693cee801ec
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 289 boots: 6 failed,
 266 passed with 7 offline, 6 untried/unknown,
 4 conflicts (v5.7-rc3-247-gf693cee801ec)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 289 boots: 6 failed, 266 passed with 7 offline, 6 =
untried/unknown, 4 conflicts (v5.7-rc3-247-gf693cee801ec)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc3-247-gf693cee801ec/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc3-247-gf693cee801ec/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc3-247-gf693cee801ec
Git Commit: f693cee801ecec79722128a2bf506d381df9ed9d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 109 unique boards, 25 SoC families, 31 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 1 day (last pass: v5.7-rc3-194-g=
1631e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 76 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.7-rc3-228-g76a37a4cf=
830)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: v5.7-rc3-194-g1631=
e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc3-228-g7=
6a37a4cf830)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.7-rc3-228-g76a37a4cf=
830)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.7-rc3-228-g76a37a4cf=
830)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc3-228-g7=
6a37a4cf830)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.7-rc3-228-g76a37a4cf=
830)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc3-228-g7=
6a37a4cf830)

i386:

    i386_defconfig+kselftest:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: v5.7-rc3-228-g76a37a4c=
f830)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 20 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-rc3-228-g76a37a4c=
f830)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-rc3-228-g76a37a4c=
f830)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxm-q200: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

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

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig+kselftest:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    i386_defconfig:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

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
