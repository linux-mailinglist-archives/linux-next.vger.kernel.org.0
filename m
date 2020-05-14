Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567A41D389E
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 19:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgENRrF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 13:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725965AbgENRrF (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 13:47:05 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71CEC061A0C
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 10:47:03 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x2so1622086pfx.7
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 10:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hufuY47pvf71evQjsCrqDw4CuxKxHjfuAY4T7lUs+ks=;
        b=h0BMNOyd6cpQBdlss+PJF6oNrbCpifg8f15HN4y/JbVdVQnD49g9oMnILzPqxq0aJs
         LzCC5CsnBw0Ia6Nr3HlN9YWjS/OAP1XSEFeUQbfyB11wX3kl9LbpH5QEi0YUa7OZ4Oy4
         P1kXoQ34VVnk9hYMlx0nMzMgc0/MqStnBrJIlHkM3snq2bYwDoyQ8Hbr7AODK+SPe9tL
         +JfQ5lCdFWIljCpf7HW6N42To2Ct/MkV5677uNBXMijBnd0vhenKv9FL5rEjUf9YO3Y9
         zDysteuT5JwygmPTDw3YUOc2h0em9WLWWy8qgXt77U60JNO6NmQCE07tgeK2FBXDeh5B
         u6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hufuY47pvf71evQjsCrqDw4CuxKxHjfuAY4T7lUs+ks=;
        b=hIEBc3wGHGRNfxY9hWI9I9vDREW1NZ+mEi0Czx/0UWC0c9whixmEvEpC1Y41VSKLSf
         CDWhob6XfGVaCSDiqFlZxjMywKs5JVRdTs/0m+fh5JedE0Im4H27PEMS0lXPH5obFaWF
         3bWBQKF5UC2DmGhdPN31MeBJcH7kFOCcpbzacWZaqBpg6GPoUkUWqQZzyY/XQI9xZxjy
         wsroAPDFnXMpHBH17ex/QivWRExbMBnv9du52+q/l20N/TfS4AMAp9fl3+Tzsqma57vh
         af6RBJa9Dw4fIJj4/xGkXgXKKeq0KbDzQzWVbIvZC9moNPt4+04wVMC1nG/vcm3pQXxj
         VjLA==
X-Gm-Message-State: AOAM531go0zVFsYGwXKOA3sRKAlsIwwkghmloZ/j5qZ4TtmFMpl84nnL
        hLWVtBJKq2GfXRKHA6NGi6g8DXXBvu8=
X-Google-Smtp-Source: ABdhPJy064hTMVr/7F+3zqDc7l0d2hQ6JGCj1uBOnkcBW6jMfQuPmggVDUQZwrrppC7NgvJkEBcvMw==
X-Received: by 2002:aa7:9297:: with SMTP id j23mr5434531pfa.15.1589478423032;
        Thu, 14 May 2020 10:47:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g1sm18650789pjt.25.2020.05.14.10.47.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:47:01 -0700 (PDT)
Message-ID: <5ebd8415.1c69fb81.5e362.0b44@mx.google.com>
Date:   Thu, 14 May 2020 10:47:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200514
X-Kernelci-Report-Type: boot
Subject: next/master boot: 227 boots: 10 failed, 207 passed with 5 offline,
 5 untried/unknown (next-20200514)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 227 boots: 10 failed, 207 passed with 5 offline, 5 untrie=
d/unknown (next-20200514)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200514/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200514/

Tree: next
Branch: master
Git Describe: next-20200514
Git Commit: c9529331c7a22b8eb7eb03e1e0e221d0f58b43de
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 24 SoC families, 31 builds out of 228

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun8i-r40-bananapi-m2-ultra:
              lab-clabbe: failing since 1 day (last pass: next-20191004 - f=
irst fail: next-20200512)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle:
              lab-baylibre-seattle: new failure (last pass: next-20200501)
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20200501)
          omap4-panda:
              lab-baylibre: new failure (last pass: next-20200501)
              lab-baylibre-seattle: new failure (last pass: next-20200501)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 86 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 1 day (last pass: next-20200501 - fi=
rst fail: next-20200512)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200512)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200512)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 48 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            mt7622-rfb1: 1 failed lab
            sm8150-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle: 1 failed lab
            omap3-beagle-xm: 1 failed lab
            omap4-panda: 2 failed labs

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
