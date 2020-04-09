Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 089361A3886
	for <lists+linux-next@lfdr.de>; Thu,  9 Apr 2020 19:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgDIRBV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Apr 2020 13:01:21 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53]:52286 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgDIRBV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2020 13:01:21 -0400
Received: by mail-pj1-f53.google.com with SMTP id ng8so1547641pjb.2
        for <linux-next@vger.kernel.org>; Thu, 09 Apr 2020 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5RAGCUA/K6YolMzBV/XXU4ixYENsb+CQ2Wl92erZdiQ=;
        b=sxdH9ikubIuISj4x5u9Dfzf31SL+lD5OqiC1/Wpj5a3OfmPnGqpDLl7dGxXUft0KKZ
         7z9f2y2zlaZTavR2hLNUShU6Jo2dR7LBAj06M+khQFO07WgF81wZXjn+xXNuZoBJ55Nm
         +NILwco4mYunaXMXm51LG3DpYDLfGxVyRZGJCId796HjsJ0++WaCz8zxwY8QYb9sAgmF
         8q5BFgpb9sqyJYQx2uxiH0bqT4PiNmf0/hxu73MGzVP+cbyhhyEyX2PAoxMzbFC74lrQ
         wLRSDoA5BppyqNU5wbf2aj3CIxpkeCkFtd8/YWbCCzr3uWwEbvDj/T8yosIQM9xx9vUV
         lB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5RAGCUA/K6YolMzBV/XXU4ixYENsb+CQ2Wl92erZdiQ=;
        b=bcpvTXIjecZpskPjOJ2ax7UAKmCoZZCxVu1BeTpaauoc9uDqkfPwoGurHL4exGsyzs
         NPWj6+z79YI7ER+2UuRkuFO2RQT+qwMpDsdtmoQbw10jvjcKrfaZRal0xXrtvZF/JPtx
         2H4AmEOP69JuYM5MQROYfNmMgjlhMgzLgiiijbBcrXJc4xoPabM00yBJZDMcCEZ8C3Ec
         qc6FJafVJBQBi9oSezRlvipWehbn0n+63FJ03sBVXu2r0UxPg2Xm4jVGnpVv1/9ZXoiI
         pu33JfEgOp+tQAmwOtQSVG6iN/eXOXBqlpBp2+GFRj4MozIbNN5zVGoa0rcDF10jH27g
         0qOg==
X-Gm-Message-State: AGi0PuYCZ4suI86iYSZMXKXpWYXqUL9EHKXW2okN0J5JaFlAegZqjJXv
        MVW7nY59GUlt1UmhVKC1VqLKXGS+jHA=
X-Google-Smtp-Source: APiQypLcdYeiQh937Al7KMCc7EjRUF4LC1upiawASOfNCULkqJEaNyrCg05dNWfVbpN6E4VAoBHV/g==
X-Received: by 2002:a17:90a:6582:: with SMTP id k2mr431107pjj.180.1586451678399;
        Thu, 09 Apr 2020 10:01:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j4sm19344673pfg.133.2020.04.09.10.01.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:01:17 -0700 (PDT)
Message-ID: <5e8f54dd.1c69fb81.275f8.598d@mx.google.com>
Date:   Thu, 09 Apr 2020 10:01:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200409
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 276 boots: 6 failed, 259 passed with 3 offline,
 8 untried/unknown (next-20200409)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 276 boots: 6 failed, 259 passed with 3 offline, 8 untried=
/unknown (next-20200409)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200409/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200409/

Tree: next
Branch: master
Git Describe: next-20200409
Git Commit: 873e37a44b1ee8ad4628ca257dc51c0c7c654326
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 24 SoC families, 29 builds out of 227

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 1 day (last pass: next-20200407 =
- first fail: next-20200408)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 51 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200408)

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200408)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200408)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200408)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200408)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200408)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 13 days (last pass: next-=
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
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

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

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
