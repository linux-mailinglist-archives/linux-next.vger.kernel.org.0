Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAE099911
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2019 18:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbfHVQYU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 12:24:20 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40715 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389867AbfHVQYU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Aug 2019 12:24:20 -0400
Received: by mail-wm1-f66.google.com with SMTP id c5so6190775wmb.5
        for <linux-next@vger.kernel.org>; Thu, 22 Aug 2019 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fscHfU0Q/1yo8BsUxOGGsIZVI2xKxYXl4QUkj7Anplw=;
        b=G58peksyjQXzgniH0GoNRaA99nbi6CDxSSNa2uH5zukwMYPJcq6HmVw309agvsUwua
         Le0bqPqXEwnM4EdbzwItOQ2Y+8O5GjtOhQGI41JXMLqrnBqSkDow9E6ZHE5QCZul6s4n
         SLJs+bPF0nSWzOM7lqn02H3hYMx+7GEaAUpBzBuS6KLsyHffDH6r1s36iz5RVeaKbUh5
         o6yn868EsUvXUdYleDZZ/kWBr2lecyf1WL3JdiVDlsdjXd/47gL3lhFWXEDxLo/Eh51q
         fBgvQzNydPO45hcxs87hw26aKmAJOerMHmVx2i/6nPUoCs79cZt9GNl/YLcKpH7Rlabp
         bIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fscHfU0Q/1yo8BsUxOGGsIZVI2xKxYXl4QUkj7Anplw=;
        b=Kg8V3qTFErtPE8JqEPCa7XvH4Y4dxU+9Ir5h3emyM2DrBfRcrdrcoGp7pHfUsKyzWh
         J2Db7wRt5ZUKmEpGo9HYYhCl2HZN0MC6EdQYIjHhL4bgIoBrrsDXeK25BCG1WPclqjkt
         dCv80m5NASd9mA5+hbJ6TzgLa/NKHSfkJqf7pVvs/p361/0fjmh+Ku30e92ZhkPHx9Aw
         7RRnP5cnL8MYQ9CTV20gAEHAcl86WuhmpYYwdzD5qhUj1t8H50GBwZ5XwsMEiakHACA7
         xLTSC7jPx1Q+ogU5TxlDXPZ318WC0rglRUKawKsdiGWm3odNIUGm2jZ0JGDRhEqiPIGp
         N7zQ==
X-Gm-Message-State: APjAAAWddsOlrF0zZitfbZ/mUkAovN2iO58FHoRq1wU4xeefdnAw+G/P
        pGBOyYq9o9g/ZHPEUHzQe0ZRlJA06CGtyA==
X-Google-Smtp-Source: APXvYqzhnbMw3vNeVzGGRk2ecFT7XVXtOBS3CL2SLrfCRdaUu3wd1tl7hRzwxlEgN9jMJd8r0CwUdw==
X-Received: by 2002:a05:600c:21d3:: with SMTP id x19mr7273882wmj.45.1566491057957;
        Thu, 22 Aug 2019 09:24:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h23sm5001530wml.43.2019.08.22.09.24.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 09:24:16 -0700 (PDT)
Message-ID: <5d5ec1b0.1c69fb81.b88d6.58a5@mx.google.com>
Date:   Thu, 22 Aug 2019 09:24:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190822
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 286 boots: 9 failed, 256 passed with 14 offline,
 3 untried/unknown, 4 conflicts (next-20190822)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 286 boots: 9 failed, 256 passed with 14 offline, 3 untrie=
d/unknown, 4 conflicts (next-20190822)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190822/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190822/

Tree: next
Branch: master
Git Describe: next-20190822
Git Commit: b5835edc8dd4317d3793cf3d45ac3740b52c3c02
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 27 SoC families, 22 builds out of 222

Boot Regressions Detected:

arm64:

    defconfig:
        clang-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20190821)
          sun50i-h6-orangepi-one-plus:
              lab-clabbe: new failure (last pass: next-20190821)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            exynos5250-snow: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

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
            sun7i-a20-bananapi: 1 offline lab

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
    sama5_defconfig:
        at91-sama5d4_xplained:
            lab-baylibre: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)

    multi_v7_defconfig:
        sun7i-a20-cubieboard2:
            lab-baylibre: FAIL (gcc-8)
            lab-clabbe: PASS (gcc-8)

    sunxi_defconfig:
        sun7i-a20-cubieboard2:
            lab-baylibre: FAIL (gcc-8)
            lab-clabbe: PASS (gcc-8)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        sun7i-a20-cubieboard2:
            lab-baylibre: FAIL (gcc-8)
            lab-clabbe: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
