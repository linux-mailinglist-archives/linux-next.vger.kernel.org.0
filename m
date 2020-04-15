Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA441AA037
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 14:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369095AbgDOMXp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 08:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369144AbgDOMXL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2020 08:23:11 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E05C061A0C
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2020 05:23:10 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id m21so1415573pff.13
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2020 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3Ow++0AGrKlr+ZAnYGyAkm0ec4546B6aSiXHgM1j3zc=;
        b=tYylK10+fNP/1eqsXLANgmDMcJ38kEOUCwYS9+8r2K88ytKFOAXezi83FYBMu8v28V
         YK6VMbV3DscwO7gHMAF7MkjsAk02PWdyFar98xq/SmoJYstTg3UlFmnJVmh4H7pK78FG
         XeF/fus4I/2gD8LJCqgyRSk4qPmYivXJVzivBvS1lgxl+MEfzapmXABSNq/LER26XDS3
         DGiwvaKvyBP+PwXbdQ8YnFP9pkvsusmFbbxqeKU5fopr7zUryi+skfw9NeZe6op8RorI
         JBN2LyYNllDUIN/pY6rSNCc0i596eTZ7Iht5n/IlaB4j4iku04JCyBaEfeur/om0ovCn
         blQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3Ow++0AGrKlr+ZAnYGyAkm0ec4546B6aSiXHgM1j3zc=;
        b=Bzgz03BCJXD62VfCC4IxTcTcZfxbnxpTgbgPBhjPouYMTGmR9mtJgx8vS9s5vqvWPu
         i7ByNSXnmtl+cBFT7QUo4VBHf1Ejas4vlinViITloWogueTV3Ei4we8wX0xB0i30776g
         TSZUkSPrNW96IRN0v/hBcHGEGK1YgEuzuiPxOb3LoI52yED1tYto7HqgMFQZ11p3rNQu
         GkVa19RCnrMP17p7QSYyAuMOrvPYfWahnmyPIi9exjvt1vXMqt0yiVYy4Np806fV8sRt
         Ug80+dkJYJv08gxDpxWr0JdfFgaaEL36gWYXizIhweYPrSRM0z545JyeTs5ObmjiedNJ
         zX3g==
X-Gm-Message-State: AGi0PuauZwq2Vw+LnxeKFvV0/is9jBheFut9Z6/NJHnGEMkH6pcSSYqa
        c2nNv5HH7Ro95+FH9eGxcGN2TWxVsjs=
X-Google-Smtp-Source: APiQypLFxIs8mgx/r8UfuO/xZB5ThTsqJww3kVpXsF7ukAOeAwlu43A9HD0BadO1wAZI1h5iruHI3w==
X-Received: by 2002:a63:6f45:: with SMTP id k66mr27420421pgc.246.1586953389868;
        Wed, 15 Apr 2020 05:23:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ie14sm2145458pjb.34.2020.04.15.05.23.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:23:08 -0700 (PDT)
Message-ID: <5e96fcac.1c69fb81.b56d3.71c8@mx.google.com>
Date:   Wed, 15 Apr 2020 05:23:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200415
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 279 boots: 6 failed, 261 passed with 5 offline,
 6 untried/unknown, 1 conflict (next-20200415)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 279 boots: 6 failed, 261 passed with 5 offline, 6 untried=
/unknown, 1 conflict (next-20200415)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200415/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200415/

Tree: next
Branch: master
Git Describe: next-20200415
Git Commit: ac935d22736659be734251247dcc6f444fb98972
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 107 unique boards, 25 SoC families, 30 builds out of 228

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20200414)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200414)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 57 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200414)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 13 days (last pass: next-20200330 - =
first fail: next-20200401)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200414)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200414)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200414)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200414)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 18 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig+kselftest:
        gcc-8:
          qemu_x86_64:
              lab-baylibre: new failure (last pass: next-20200414)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
