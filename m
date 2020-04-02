Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05D6519BA50
	for <lists+linux-next@lfdr.de>; Thu,  2 Apr 2020 04:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732435AbgDBCb6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 22:31:58 -0400
Received: from mail-pj1-f47.google.com ([209.85.216.47]:38223 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbgDBCb6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 22:31:58 -0400
Received: by mail-pj1-f47.google.com with SMTP id m15so921699pje.3
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2020 19:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7aC7iYsdHNnfjaXJwDbSdx7z9fPytLAhKtkVoX375kw=;
        b=VUqISJ84J5C7ktlDYb2LH9ljS4x+ruxLUdoTPbC8kZxihVkVmnG04J8uLveocH56n1
         tLlE53uHLNxgp0awNeUF9Tr/vSRttxJzfh2tzMAOSX/1IxMQr0cA84r20mELbZDp/6Uj
         IVKgebA7cqB6NTOLosJSUBl5o4N1fV6MWZLlXDjKJ6qDW6q/NOPDQEzPycnqzAeK4T1m
         d6jA46fWgS9C0CAm/oa4rk/vm+McmW/xsI4lbhTHM31N11oEoUBruzwPflSQ5jFRwp+F
         ubNIds0UVeZELYaDkhFiw7k01/Yx7dXd3VGqmrhhAl/5wWtv7uvcKfljgTzo78XnrC/i
         ScQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7aC7iYsdHNnfjaXJwDbSdx7z9fPytLAhKtkVoX375kw=;
        b=a+OQLWrRu5Tplrm1K3etrouqbgYuROHqC27noPZay9NMNvaXXcmawjuSr6bkchgcOM
         H2eK5sjGPohJz/rtf4M9oc45Uhcg3FuSvApf+YJvs4ml+w0hhVWYph7shoSx4VB/jTfz
         p3RlUGN3c4U6pcgCUU+YZEVbTPOch8ZM5o5X8T+p22VvANJI1g7prMMNoMHvb1CP6gxh
         SMiqOvzPqF8mIsDLSqM5oZKkpikmXiLxniUxIzzDhsQO6KM/MxcPa/0tyBORuYS9OJhr
         RxqzdlCpa/r48WAlZoYXtMJnal13vqhu2ws3PdFqqscjuylFac4+133lOzeyqRmPzlzj
         rPNA==
X-Gm-Message-State: AGi0Puac7WiiLz8uOb2V6e5zbJNpl8Ex6wGeGxZHVQe5VS7HtXvGZAMT
        gDXFkhzpevovWYFobYQpMmvV0pIgt/o=
X-Google-Smtp-Source: APiQypIo2BOjHAHeihlLvSA2wrh8dyGQ5cEbOVH9sEX+MJbs8ay0DAFASSVgrB9gDLS83hnvy0Iykg==
X-Received: by 2002:a17:90a:fb41:: with SMTP id iq1mr1170344pjb.89.1585794716234;
        Wed, 01 Apr 2020 19:31:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 6sm2366666pgm.51.2020.04.01.19.31.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 19:31:55 -0700 (PDT)
Message-ID: <5e854e9b.1c69fb81.e93fc.b97d@mx.google.com>
Date:   Wed, 01 Apr 2020 19:31:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-6294-g700297ff160a
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 191 boots: 7 failed,
 167 passed with 7 offline, 9 untried/unknown,
 1 conflict (v5.6-6294-g700297ff160a)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 191 boots: 7 failed, 167 passed with 7 offline, 9 =
untried/unknown, 1 conflict (v5.6-6294-g700297ff160a)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-6294-g700297ff160a/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-6294-g700297ff160a/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-6294-g700297ff160a
Git Commit: 700297ff160a843dcde7ccd11f97385f1b5f771e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 72 unique boards, 23 SoC families, 30 builds out of 216

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: v5.6-3095-g771732386d6d)

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 1 day (last pass: v5.6-rc7-404-g=
bcaebd8567a2 - first fail: v5.6-1227-ga325aefb3560)
          exynos5800-peach-pi:
              lab-collabora: failing since 27 days (last pass: v5.6-rc4-203=
-g8f169e319c63 - first fail: v5.6-rc4-359-gd038c5cebb94)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 47 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.6-3095-g771732386d6d)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: new failure (last pass: v5.6-3095-g771732386d6d)
          exynos5800-peach-pi:
              lab-collabora: failing since 1 day (last pass: v5.6-1227-ga32=
5aefb3560 - first fail: v5.6-3095-g771732386d6d)
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.6-3095-g771732386d6d)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: new failure (last pass: v5.6-3095-g771732386d6d)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-3095-g7717=
32386d6d)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-3095-g7717=
32386d6d)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-3095-g7717=
32386d6d)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            bcm4708-smartrg-sr400ac: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 2 failed labs

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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
            meson-gxm-nexbox-a1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        sun7i-a20-cubieboard2:
            lab-clabbe: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
