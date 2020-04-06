Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5270619EF91
	for <lists+linux-next@lfdr.de>; Mon,  6 Apr 2020 05:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDFD3L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Apr 2020 23:29:11 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:33339 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDFD3L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Apr 2020 23:29:11 -0400
Received: by mail-pl1-f179.google.com with SMTP id ay1so5384115plb.0
        for <linux-next@vger.kernel.org>; Sun, 05 Apr 2020 20:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cy9r15nKDd9m4JxIH7VGHxV7cElogqcjUqR8Z3mSTkQ=;
        b=J4YIX0Hokyjtfe8Fhl3vIInsVdVVa8hVKYsoPDEQde90iX2jtK4ynK9tW5Gjb4lsYF
         u2CW3I3QhHGo6q6VC3GcAGV1tX5LcGxSAGeDtI2T415i5gAk8jba+pa81MQptx6nExGm
         1bjYFnRV5XGm4Tmy4JCnNBkP681+shncpexaDylkz7/CcFTsO4sLnpgX92Beif7rSEZX
         EDfzrOWCFUK4a+1EQXuAcOPdQx+foSpEZ/Luc3Eho1pWzOHGF1gcY1EfegxHpTLMXn0t
         f9Ishp+01o7OAmZ0AFq5iE47jDy6cy4rENplqhkWl5tbcRSMvVkNEgvQ3wECuRrOlFsv
         PDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cy9r15nKDd9m4JxIH7VGHxV7cElogqcjUqR8Z3mSTkQ=;
        b=O+un8CU5Z64gDD/fDSMfaPq1VeYLg0CX0QIvXz4AjC6SeA3QMhWwKpjX5HXPVTp13I
         6wjGzBe5QFeUCmEHiVuKKBINXZr683mkgruELIlbUnH4xQSzPyNi7JxA3FG4jSlFVupC
         adlprhYmNk47YESoIDZqptfCwmV63KRsS1xn9bf65f4e0+xagLULRJ9da4jqVj/cphG3
         q3MjbIxrIChofd+uBnQW66u/R/s78zH6TV6S0fuLsHd1Tc4wUpD+8rGMxvl0Clil57h7
         cf0Cawf5tAq/fjv/0ZIKv/Io0IVLPwsAMPqoWoHFIoMNI6ekKgMb8yn6WUXyE2tG64KD
         aTkQ==
X-Gm-Message-State: AGi0PuYAfjB5caT2x1/t2EWN5HiFiBDxBMwgAP47R5T6GgruLNEP4FSp
        Io4iwlPhZxKOkTp6CApIJUzPhREn4DU=
X-Google-Smtp-Source: APiQypJjW0K2eUMLP+EhnCa2vFQLrTwiZtZDhpNhYA3qQABSapZUDHaJjMrv0/KIckPa9JMtGU1myg==
X-Received: by 2002:a17:90b:46d0:: with SMTP id jx16mr23591414pjb.155.1586143749163;
        Sun, 05 Apr 2020 20:29:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a2sm11109709pja.44.2020.04.05.20.29.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 20:29:08 -0700 (PDT)
Message-ID: <5e8aa204.1c69fb81.a1862.1004@mx.google.com>
Date:   Sun, 05 Apr 2020 20:29:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-11479-gba55f0e014e7
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 271 boots: 5 failed,
 255 passed with 4 offline, 7 untried/unknown (v5.6-11479-gba55f0e014e7)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 271 boots: 5 failed, 255 passed with 4 offline, 7 =
untried/unknown (v5.6-11479-gba55f0e014e7)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-11479-gba55f0e014e7/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-11479-gba55f0e014e7/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-11479-gba55f0e014e7
Git Commit: ba55f0e014e72f058937bf4e67eec873d5bba8a3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 24 SoC families, 29 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 5 days (last pass: v5.6-rc7-404-=
gbcaebd8567a2 - first fail: v5.6-1227-ga325aefb3560)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 51 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.6-11001-g25533a084e5=
9)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: v5.6-11001-g25533a084e=
59)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-11001-g25533a084e=
59)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-11001-g255=
33a084e59)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-11001-g255=
33a084e59)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-11001-g255=
33a084e59)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

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
