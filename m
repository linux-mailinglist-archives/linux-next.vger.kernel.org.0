Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00199192DC9
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 17:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgCYQFF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 12:05:05 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:42756 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgCYQFF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Mar 2020 12:05:05 -0400
Received: by mail-pf1-f170.google.com with SMTP id 22so1241414pfa.9
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2020 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3qUTMp5UF/IwIY/gMkMkLz2Z42kPrf3bvB/0exH/8sg=;
        b=XQM0uonAJt3jVUrlEwJP1to+rk0cr+Hu3P6ZwBpigkZ+kl83iujTJ7KZcImGK+Kg9l
         P1F6BKqbi4p2jzh0tZ48m0AidEYrcQa5DSPK/pJzpMbASlTxhiuLgJrr/ymFrAMKp9+D
         ZjA3Eg8tOm4REbp8g7GrjPa45J5a9iBpygLFZIKIQ/x7LB9T9S594tvIBltyV+gAVtaH
         Oh5aFJcFopmbJ0Od12782AG1g1KwvBkJaCwjEsLXXFeJ9jEc7c9e1jXOVudDGBn65siU
         aPc2XfnpkP0pXY5O16v/OIiLwqU0d4UJsHqEWKDZuIUAiZa6wcv3xDKgzig79//IiZw0
         uaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3qUTMp5UF/IwIY/gMkMkLz2Z42kPrf3bvB/0exH/8sg=;
        b=r8UzWGxZq1r9ie464PbZWeaPIuL1VD/x+HxHjoNXKTBX/gmQzbWLWsRq3jtQKtUqLq
         njfsYrQcMRQGIc1UBvQb3ocESUBv/MB296PsNhTDzXCBdlzH8jWzm35mZvmb6HVk2ZpD
         TCU+U+FF+rdMlkMzyk5VhqpqJTOwYrn9+wLQ/O7vdRLdrnL9+l/0EXxGkOBx9uDt2w1K
         PgLLpr2Pm75qty2Vw7qhv5vpTknqHANK0DhzPuYKEUcd6XSppF9NdvWSdSc39SpxaAXO
         91ZrcGLyjLMFb3uANmvPa1FaMyyksckktJ16iruLYSqteqFizpoNZOUc4Ltf4ANdiG2h
         HOkw==
X-Gm-Message-State: ANhLgQ1Q5CSCCkrH5wSGPyZWljHoFqbjAgCzEmXm/Bb5CCDXv54rLoPC
        9SK1/3CvR9Cz0sArYhLKPi7+ZYU6DOI=
X-Google-Smtp-Source: ADFU+vs8WUOUw+5EHEzYAP9idvzaB3Lcs8mG3JHO1minkHmMRynhHhSlr0vXChmj+l4OIjqBa6k9aQ==
X-Received: by 2002:a63:ec42:: with SMTP id r2mr3892302pgj.386.1585152303520;
        Wed, 25 Mar 2020 09:05:03 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id my15sm5108778pjb.28.2020.03.25.09.05.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 09:05:01 -0700 (PDT)
Message-ID: <5e7b812d.1c69fb81.eae8.5a03@mx.google.com>
Date:   Wed, 25 Mar 2020 09:05:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200325
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 270 boots: 7 failed, 253 passed with 2 offline,
 8 untried/unknown (next-20200325)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 270 boots: 7 failed, 253 passed with 2 offline, 8 untried=
/unknown (next-20200325)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200325/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200325/

Tree: next
Branch: master
Git Describe: next-20200325
Git Commit: bfd7a248502373da8b1c8eb0e811fdb19cc3f8b6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 104 unique boards, 25 SoC families, 30 builds out of 329

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: failing since 1 day (last pass: next-20200320 -=
 first fail: next-20200324)

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 4 days (last pass: next-20200319=
 - first fail: next-20200320)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20200324)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 36 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200324)
          meson-gxm-q200:
              lab-baylibre: failing since 1 day (last pass: next-20200323 -=
 first fail: next-20200324)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200324)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            juno-r2: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
