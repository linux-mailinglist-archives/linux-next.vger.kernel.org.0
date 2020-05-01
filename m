Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330701C1176
	for <lists+linux-next@lfdr.de>; Fri,  1 May 2020 13:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbgEALYk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 May 2020 07:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728581AbgEALYk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2020 07:24:40 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E28C08E859
        for <linux-next@vger.kernel.org>; Fri,  1 May 2020 04:24:40 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id 18so1475076pfx.6
        for <linux-next@vger.kernel.org>; Fri, 01 May 2020 04:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mT1IXj/+llodZwrOhokUF0i5q49QHz8ZGAizuOauuoc=;
        b=Gz1hNbz1RXFdaXO1RxCBRJGc6luxZPsuGsV3WqoXsn0uP02rcuO6BYtqXzauw1ItvZ
         6GFA/b3ZMc7p7W1Je+vCf4mzt0c8bUm9TnDz3USXuuXdeGtOVTUjay0pqD9h/1d0ah5z
         xHuZx2/EHllkb+H2CWyyo9uCb6zDdOtWjnOxVYFnDSrZD4lKZRtXapzyrI8oHePIL6yt
         IPwNlCHf3L+k9Q3m3Fc7LL9CCAQLIB8xjrXCz4yjz5hlkh6bNL4RDRFwkPNdq82KAv4V
         fgOJPIgZxORn3KXRQk2ft0866r3XDsV83E0tFZEJ4dIBpYdwtzTMkAE/H7hlUR5lse1p
         Eu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mT1IXj/+llodZwrOhokUF0i5q49QHz8ZGAizuOauuoc=;
        b=MKrU58MpwDgwZqsSRR2bKxo9kcnWXjQ4DbknvRmWdtNU23gVqY7aUfONO3I9bBv4BK
         qc9gQRlX3cdP2EPN8AXZJeSQUM1rps12Oz4T1XQKW+xi+SBX+VhYT7ZE9OrkEOgPKnIV
         rnSzVFJSHND6/B2pi51JS1LrhvV68eMZrBguWM8+7wvunqs9PL+RGwdgcsyhWM3bVEAy
         f+ndD8ALhiesfWIPohRhhJ8MPVQQI769ORfySleSTvBkOWG1pNrk6UN48++vy6MN2aDO
         x2QAow2qjaMebzZJjwCXjvxqx4tnmTKD9niljr8AeHRgGbUie0nSRUYi6UEr/DKLadl5
         x+cw==
X-Gm-Message-State: AGi0PubPjfCTNTBcEbc+BdCWTNuhCv0UYmWUrwFqaRBoHT6jD9rLIAfM
        0isF9OY1kJ2Rkp5BxCMIgmWHPmAtacc=
X-Google-Smtp-Source: APiQypI8Qxttn4fsueH1DhpMLy+2w9utLsw1Jd50dAJpDggxGrFlRRxy+TFZRz5/ygApOvtvVQttiw==
X-Received: by 2002:a63:4446:: with SMTP id t6mr3708562pgk.450.1588332278571;
        Fri, 01 May 2020 04:24:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h193sm2099163pfe.30.2020.05.01.04.24.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:24:37 -0700 (PDT)
Message-ID: <5eac06f5.1c69fb81.f37ee.7d11@mx.google.com>
Date:   Fri, 01 May 2020 04:24:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc3-277-ga37f92ef57b2
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 287 boots: 7 failed,
 262 passed with 7 offline, 8 untried/unknown,
 3 conflicts (v5.7-rc3-277-ga37f92ef57b2)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 287 boots: 7 failed, 262 passed with 7 offline, 8 =
untried/unknown, 3 conflicts (v5.7-rc3-277-ga37f92ef57b2)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc3-277-ga37f92ef57b2/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc3-277-ga37f92ef57b2/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc3-277-ga37f92ef57b2
Git Commit: a37f92ef57b279fe62c67b74e17b963d37cef0bf
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 109 unique boards, 25 SoC families, 31 builds out of 217

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: v5.7-rc3-247-gf693cee80=
1ec)

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 76 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc3-247-gf693cee8=
01ec)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: new failure (last pass: v5.7-rc3-247-gf693cee80=
1ec)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 2 days (last pass: v5.7-rc3-194-g163=
1e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc3-247-gf=
693cee801ec)
          sm8150-mtp:
              lab-bjorn: failing since 1 day (last pass: v5.7-rc3-194-g1631=
e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc3-247-gf=
693cee801ec)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc3-247-gf=
693cee801ec)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.7-rc3-247-gf693cee80=
1ec)

i386:

    i386_defconfig+kselftest:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: v5.7-rc3-247-gf693cee8=
01ec)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 20 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

x86_64:

    x86_64_defconfig+kselftest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-rc3-247-gf693cee8=
01ec)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: v5.7-rc3-247-gf693cee8=
01ec)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

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

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    x86_64_defconfig+kvm_guest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
