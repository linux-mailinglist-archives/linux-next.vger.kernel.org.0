Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1756B1D5BCC
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 23:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgEOVrb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 May 2020 17:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727814AbgEOVra (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 May 2020 17:47:30 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B03F1C061A0C
        for <linux-next@vger.kernel.org>; Fri, 15 May 2020 14:47:30 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q9so1583719pjm.2
        for <linux-next@vger.kernel.org>; Fri, 15 May 2020 14:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fIJIreMh03uniH7MHOHRg+y64/mDyKjFomMP765keZ4=;
        b=WAB44CPO2ojxAGdsV9KIOVE8rAfCVZ/dSg2o/jIm2KxeEuNwC6nyNzOun53MH8Q2JH
         PYDA7AJ6M9zrNfv7ceRDifbfsryHa2E5iXV1rd2h410uR75gu9mD+NQLIV/us0VAAJmx
         pOtD2xpqEnin2tyxY2ox1rzQ8zgldbY3v6BpaDPMleolJYg8eXZyzJWytDY2RR4UjgiX
         ICfSRB4QCIvVWqqkCbjjRdd8g4z2Ez1kauMIGZJ2KP3+3l2EtZKQ4AjwuoQxhDUKm4Hk
         kVT/TTdWcNgRFlX98UbeUSD80X+xp92noXceSY54WRdU1neV64chSHIvxsK6oBUzyEdX
         ZcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fIJIreMh03uniH7MHOHRg+y64/mDyKjFomMP765keZ4=;
        b=kB74e32za0pbUt2k28qekYjR2dYqqyAKdyG4RPUBCixxD1iVL/DKtEei5vvaM4Blpp
         JkcFxecrn9ni9N32KtSUZM4YUZjPKJWQlAqaPLW3lEfHwUs9ntIOYE732Yx7P6aIpwRh
         FCxFNFI69BBuVpWXKWn4OMmXB8oCZng4NRqZVx4kiA+pne1mDD+XCzk+zTv9ygYsjiHe
         WvtfpeHAxab3j0ixt0bkISI821mgaEvfzRZ0xW7lU+mBxhhBaAzQ/aTo48zlsZ2X3PCH
         fRYN3Jf71wrOCnGTX4e6DtWUQKQlzBFpskAl2r9gSRtNbQJrhHGZ0FfweK1QA8DnEpWv
         b9KQ==
X-Gm-Message-State: AOAM530ltMlvu4z5MterjuJSneQ6g0JLnirXBkzjAQQY2FaNy/TeVkpi
        QpkExI3lS0v64KtpDORNW1TaB2VEsP4=
X-Google-Smtp-Source: ABdhPJxfdjJCsS/Txmt4NBRIBqWszTiVTSF2g09KS+K8LOHQbfJMQxJLIy8S0BB46WJ9dN41KWD1IQ==
X-Received: by 2002:a17:902:9b8e:: with SMTP id y14mr5540956plp.109.1589579249729;
        Fri, 15 May 2020 14:47:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p10sm2640574pff.210.2020.05.15.14.47.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:47:29 -0700 (PDT)
Message-ID: <5ebf0df1.1c69fb81.1bd4a.8a88@mx.google.com>
Date:   Fri, 15 May 2020 14:47:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200515
X-Kernelci-Report-Type: boot
Subject: next/master boot: 289 boots: 16 failed, 262 passed with 5 offline,
 6 untried/unknown (next-20200515)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 289 boots: 16 failed, 262 passed with 5 offline, 6 untrie=
d/unknown (next-20200515)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200515/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200515/

Tree: next
Branch: master
Git Describe: next-20200515
Git Commit: bdecf38f228bcca73b31ada98b5b7ba1215eb9c9
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 111 unique boards, 26 SoC families, 32 builds out of 228

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200514)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
200501 - first fail: next-20200514)
          omap3-beagle-xm:
              lab-baylibre: failing since 1 day (last pass: next-20200501 -=
 first fail: next-20200514)
          omap4-panda:
              lab-baylibre: failing since 1 day (last pass: next-20200501 -=
 first fail: next-20200514)
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
200501 - first fail: next-20200514)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 87 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200514)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 2 days (last pass: next-20200501 - f=
irst fail: next-20200512)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200514)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200514)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200514)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 49 days (last pass: next-=
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
            meson-gxm-q200: 1 failed lab
            mt7622-rfb1: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle: 1 failed lab
            omap3-beagle-xm: 1 failed lab
            omap4-panda: 3 failed labs

    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

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
