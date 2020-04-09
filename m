Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F1F1A2CD3
	for <lists+linux-next@lfdr.de>; Thu,  9 Apr 2020 02:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgDIAYh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Apr 2020 20:24:37 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:39514 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgDIAYh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Apr 2020 20:24:37 -0400
Received: by mail-pl1-f173.google.com with SMTP id k18so3176706pll.6
        for <linux-next@vger.kernel.org>; Wed, 08 Apr 2020 17:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=E1LqqGIBT7Z0Lwah7c8vSMhZ2oPnKEdonOQFg2MD7Go=;
        b=OQSr/ka6ZX0H0ooXyeNElNuYXWYRJHbNDzC+PK1+DD7Pddl1K3at7LOle+HF6odU2X
         VogMh+N0GuK7r/2Y7Aivwy+XZXe0FDtxVEgaXAsOGFBqpSFK9SUsHsk4JZAqchE89UD6
         9CMNHju5GJ+83t+/sDaF+z+OKKB/Rh3GBQpJHsYY/vEaXD+zGqQ+pnWM0vuYFDepHisU
         CHoqQRf5RO3WH7XMOgM8JbGMA0tR+wmmGw7iWFtegthEHIazCUnx01pRHL3vtnHdHM+4
         RlwAtPQHF1z7XBxYyES0idv0FVsm+KiNWaAl3PwLzHGP2XFm1U8d1UDabPjnfXjG5SV6
         Q1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=E1LqqGIBT7Z0Lwah7c8vSMhZ2oPnKEdonOQFg2MD7Go=;
        b=HpstbPjFg3lcH5THARDpH9wegL5+fLaiaV/4CV+fUnDi/fzVGBU3asxF/ffn+/czvj
         crf0MNTvPHohbKNnC2pVWUljaT/akyEIMfCv9Yq1eP4tF+GwkYjmwgIrHSUzQM1Wu1kG
         VSvTEiwgKv6LYMEra8Lr2ZpDeVnEWOOJSEw+H1XC/Btgou61F7odzjj6RPQ5USMgHwe1
         5o9T73Q1q5C1IkYDByUIV4xArZIIKVD3fnmkESuXOgNbgX3bK9iPXM4d9kQwoPeKuEYD
         C7WYYOJYb0c5udRL7KQQmYgxjpYJyrAB37svzCqmQV35uO7QqsNALn2daP0i0E/U4p/4
         tDHA==
X-Gm-Message-State: AGi0PuZVtRMipqhHh5/kYOOxP4SetypuRc5d+gozHQGzQPS1SX2nLLiI
        lJW6YcD6kT8iCCBuX+3KUdPmoe3iZK1BuQ==
X-Google-Smtp-Source: APiQypJNfUXOrjox+w5bf22BEmKgEqwyhC5shF7+LH4p7Rd9NM+MNk7kM3TQfXzxH0CThvVHulExFQ==
X-Received: by 2002:a17:90a:24c5:: with SMTP id i63mr8228569pje.177.1586391874181;
        Wed, 08 Apr 2020 17:24:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h66sm2168802pgc.42.2020.04.08.17.24.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 17:24:33 -0700 (PDT)
Message-ID: <5e8e6b41.1c69fb81.72587.6f8b@mx.google.com>
Date:   Wed, 08 Apr 2020 17:24:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-11990-gbfd24b8ae88a
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 276 boots: 5 failed,
 256 passed with 8 offline, 7 untried/unknown (v5.6-11990-gbfd24b8ae88a)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 276 boots: 5 failed, 256 passed with 8 offline, 7 =
untried/unknown (v5.6-11990-gbfd24b8ae88a)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-11990-gbfd24b8ae88a/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-11990-gbfd24b8ae88a/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-11990-gbfd24b8ae88a
Git Commit: bfd24b8ae88a989cbc45a665d0d5c8492cb12c18
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 24 SoC families, 29 builds out of 216

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: v5.6-11479-gba5=
5f0e014e7)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.6-11479-gba5=
5f0e014e7)

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 8 days (last pass: v5.6-rc7-404-=
gbcaebd8567a2 - first fail: v5.6-1227-ga325aefb3560)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 54 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          imx53-qsrb:
              lab-pengutronix: new failure (last pass: v5.6-11479-gba55f0e0=
14e7)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-11479-gba5=
5f0e014e7)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: v5.6-11479-gba55f0e014e7)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.6-11001-g25533a084e59)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-11479-gba5=
5f0e014e7)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.6-11479-gba55f0e014e=
7)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-11479-gba5=
5f0e014e7)

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
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

    defconfig:
        gcc-8:
            sun50i-a64-bananapi-m64: 1 failed lab

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
