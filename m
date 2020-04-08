Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4031A2A1C
	for <lists+linux-next@lfdr.de>; Wed,  8 Apr 2020 22:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730116AbgDHUNq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Apr 2020 16:13:46 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33968 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728853AbgDHUNq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Apr 2020 16:13:46 -0400
Received: by mail-pl1-f193.google.com with SMTP id a23so2947378plm.1
        for <linux-next@vger.kernel.org>; Wed, 08 Apr 2020 13:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HvcNb7NLBMH0eY+CYsVGjRf4i3OxRc/QvteoZAD9cMc=;
        b=CzkfdrQosPd2siO7j+MokKzT8c8ddhgpMZ+7VDICV7J+j7IPWdyT8Wu7JU6957t4+y
         USkz/UWMrpOiBXfm2GdOC1d1B+m98Yd8K+1957hytYaqKbF5EQpjmBbgzcgcin71PhFs
         xQ0WXZNySHYAmCfGDpogEjI617gDu9KoXiFewdxroGOsG830fK26qHOI0zgzymNzEEFw
         R1QG03Y/ABGBv9wdOCg+++n0LLxkkNXTTsif4oW/u+g/ZnqHpUZwSO7D18l60BmVjctN
         IG5v1DXw1UixUktSZcT0DIxCHtQsgPzTinACMKEAVm3stVHaW4Oxnhm669Yo3xD9x+Gh
         ayqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HvcNb7NLBMH0eY+CYsVGjRf4i3OxRc/QvteoZAD9cMc=;
        b=e8RKAvuNYSPKPV5huu7OCjpcV/TMyc0JAl6PkeGJKiN9b8MDzUnj62TLtR6kBx9iwF
         EqTXEGO4kFaVQIh1pcha8snnmANTRiXEVYCUjtu0Pjfii5JhV8Fm78ALiZff2RMfawln
         qt4CzwH0M2qc1OaYBHAJpScxXzdP3q1npFBdhuh8WAWTq7EstOVZewy1kUSkhxegi6L5
         yoa6BM5zAwcJ5nfOv3lMA4kleW35izuyxd/gORJKRirdRMXGBt83ooD5hzRjaeEWip8t
         rOslYTVkMCX6BRohTIhZXXAFjHGlcWzncRQIRo3iGSnkaoAHrvmSs2cWp64t6lmKnvUe
         X8zg==
X-Gm-Message-State: AGi0PuYQa5XPuSNwN48c/Cd9Cpz2Ff+p9fjMkLazqSDV7+Aw7QoUv3jm
        STGNXuIW/w4TeY+Og7phtx2BZTfOAwMl5A==
X-Google-Smtp-Source: APiQypJusogR0ovbPgOfFFxxPGL5QeX7kzCeHdVnQcwiqYn0pIwrBrjyjwflCm+ZME9RWHKG9ZE9xA==
X-Received: by 2002:a17:902:8487:: with SMTP id c7mr4705165plo.251.1586376822763;
        Wed, 08 Apr 2020 13:13:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e7sm17339124pfj.97.2020.04.08.13.13.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 13:13:42 -0700 (PDT)
Message-ID: <5e8e3076.1c69fb81.69b62.cbad@mx.google.com>
Date:   Wed, 08 Apr 2020 13:13:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200408
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 276 boots: 8 failed, 257 passed with 4 offline,
 7 untried/unknown (next-20200408)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 276 boots: 8 failed, 257 passed with 4 offline, 7 untried=
/unknown (next-20200408)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200408/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200408/

Tree: next
Branch: master
Git Describe: next-20200408
Git Commit: 5798bd75ab137611da5c4cb11b6795d14cb60ba2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 24 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200407)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 50 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200407)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200407)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: next-20200407)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200407)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20200407)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200407)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200407)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200407)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 12 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            stih410-b2120: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

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
