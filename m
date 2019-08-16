Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA0290ABE
	for <lists+linux-next@lfdr.de>; Sat, 17 Aug 2019 00:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbfHPWJJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 18:09:09 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33451 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbfHPWJJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2019 18:09:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id p77so4046177wme.0
        for <linux-next@vger.kernel.org>; Fri, 16 Aug 2019 15:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fhCWCoEw5MsA3bFTVkAocO9gRopc/9nfKv6yj4nNokg=;
        b=1HmLxyprr92fY3KsmxOV7ehC0yE+fLOal9UTEvTUMmAnW0SobIg9GmidmxFbuXUuJi
         8WbOOOHXkWKhVifTkqXikPuPRIB50SftQ+aTYqGCB3AEd/wTwpn+84GWYzc5sPhanobF
         wLXqoHr0whAgDoaWdML9NCvCgUzveJyeatZw9w7ZleOzTDgOGLu3tqHWElUQVPFuTpTG
         0z6qAvj1aH+IMx7nd/aJs8rjgL62kwcC48x9AHOfFWQJ4+RHpGzrhF8+negoE12WJbOq
         /iGGqiCYxl1y/KZWNvOx+vc7QAQJ8SbovTaAiCivUuVyQ5vUcFGzG1cyY1cDqTZ2kG2q
         xfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fhCWCoEw5MsA3bFTVkAocO9gRopc/9nfKv6yj4nNokg=;
        b=QfBjKmxwsaSqVURnLIJ570ceoRhFekEYZSd8l+vx4gIoROQksDFJUme4Xvb5WnT/Dw
         rMGbjfgk35m3pFr9G9Pobnw9YoXpnMIjetKRaT1E0Zp9Ak9mJRa0EjvvEdjyi9qBuQSt
         +waVADoFRAuZmngkg1ui5un7KFGebj0rBpjlidOc7wO1pHHKCMzAxZB/XryCnUjEzE3z
         oNCrCfqOu4O8gQE9JnYgTNjOFKddGE7PvupSItJGkI1IpJSSWhyK7MYA7iTx4QgopILd
         9jqASLn4xzrkUV2MIvRv1iB8iHu0/3iXVMMN5eCrrD9+S184WPeN80eCdrzUAML8zPVL
         fcew==
X-Gm-Message-State: APjAAAUypsKMwxrkk8QgLVOCXuwhufQw/2sXMVvZis2u2pQPvPBJrLOv
        /zOemP8yeNHYCEt2GQzJoexsUPPrZ7E=
X-Google-Smtp-Source: APXvYqzHmCWuEuERV6RZ7SA1w6oOkO9wPKDJDLZG5IH16/hPzCxi3pNDum6kKq7BZKZWFYWXrlPT1A==
X-Received: by 2002:a1c:7914:: with SMTP id l20mr9289190wme.130.1565993346744;
        Fri, 16 Aug 2019 15:09:06 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e11sm17005588wrc.4.2019.08.16.15.09.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Aug 2019 15:09:06 -0700 (PDT)
Message-ID: <5d572982.1c69fb81.b4ebc.5aff@mx.google.com>
Date:   Fri, 16 Aug 2019 15:09:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-326-g770969a09276
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 243 boots: 3 failed,
 224 passed with 12 offline, 1 untried/unknown,
 3 conflicts (v5.3-rc4-326-g770969a09276)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 243 boots: 3 failed, 224 passed with 12 offline, 1=
 untried/unknown, 3 conflicts (v5.3-rc4-326-g770969a09276)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc4-326-g770969a09276/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc4-326-g770969a09276/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc4-326-g770969a09276
Git Commit: 770969a092768fbcb4a081f2ebaadc185b85156f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 28 SoC families, 22 builds out of 222

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: v5.3-rc4-220-g1999f09bb=
019)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-nanopi-k2:
              lab-baylibre: new failure (last pass: v5.3-rc4-220-g1999f09bb=
019)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc4-220-g1999f09bb=
019)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
