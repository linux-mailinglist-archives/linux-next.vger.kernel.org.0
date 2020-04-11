Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA9C1A4F86
	for <lists+linux-next@lfdr.de>; Sat, 11 Apr 2020 13:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgDKLQs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 11 Apr 2020 07:16:48 -0400
Received: from mail-pf1-f176.google.com ([209.85.210.176]:33448 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgDKLQs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 11 Apr 2020 07:16:48 -0400
Received: by mail-pf1-f176.google.com with SMTP id c138so2216326pfc.0
        for <linux-next@vger.kernel.org>; Sat, 11 Apr 2020 04:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/EebWpNMQ0yc34+DzLKo0s1vA0LUj+dGeBC9tD7zQ0A=;
        b=CPX++w51SZWjcihbOHpqMBDVqbsEC2bMFv6am/4qVXyXYi0d/rFccsmItjWZ7v7TqW
         UGe4Dc8iuu1hI0syoYMppEB4QY0HfcnPcauNQXIPQCeqTUvuUzM+Na4Ss5xuTeFOhHml
         m8AImFse4/hLjnloZN687osmhiF0N4cEgWe+7LqxmzY74gL2I+SQre74uV3aa9J+iC+i
         fupbhpbTcM7/azH4yKQd9JXbNpSGtlFJ5DjToF4KQ+CtF30Lb4faOIL2Slhdex24l2dy
         a36EQpCn1QNQjcM22cprrG/Jfv3xmH7z3yj3pO0PluxlMFfJ6IUG+vj9mwmMDkG94U0E
         /CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/EebWpNMQ0yc34+DzLKo0s1vA0LUj+dGeBC9tD7zQ0A=;
        b=Uj+cTgjUuSCBkLaSvZbyMDtBL1QVT3b9YN787tIKuh4RTYR6fy3YVpUtdhGYKRoshX
         Ho9VrDJuFxZcl5Hrn0NJk8Huha1JtD+MXwMt/VZJ4LRQivnCtpdOyQPWkDjXtaopIktP
         8g5hvuGZqu9BsOf74v99dgDCl9DvD1FOMoee4cNK0VAQPPKluPKewOd6qrtp0Z7pavqN
         eJuF8I1JS7slk4XotKBqTYa0NU6rxfCGLybCYRqvxp2/YEDXFiGLPNUSn9x7Mb+7/LOE
         NSrydbB578pxXuiQV92ePc5Uil+XR1x3+sf+70v4dRGGyT08mc52gPH5l9xH1G9rW0iG
         4dqg==
X-Gm-Message-State: AGi0Pub08UShlJFa7Vh8ZRQrSsai1Li+1FRIYHdZWSe5rRkClmCBiCoc
        u+Jx9AGEX6rcqbBm4Mmk+rDya7BaggA=
X-Google-Smtp-Source: APiQypIIw4qemTrH8K5pysTxDeNE2NnRMF55MzS+uMhB+lZlNhthG8WnUnFoFaYF0PQK5zRokoeSzA==
X-Received: by 2002:a62:4dc3:: with SMTP id a186mr9645795pfb.40.1586603807597;
        Sat, 11 Apr 2020 04:16:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r24sm289428pfh.1.2020.04.11.04.16.46
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 04:16:46 -0700 (PDT)
Message-ID: <5e91a71e.1c69fb81.e39b5.0de6@mx.google.com>
Date:   Sat, 11 Apr 2020 04:16:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200411
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 273 boots: 6 failed, 253 passed with 7 offline,
 7 untried/unknown (next-20200411)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 273 boots: 6 failed, 253 passed with 7 offline, 7 untried=
/unknown (next-20200411)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200411/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200411/

Tree: next
Branch: master
Git Describe: next-20200411
Git Commit: 11ecafc691e130cff72cc793ee085f5e4a6e127e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 24 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200410)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 53 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200410)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200410)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200410)
          meson-gxl-s905d-p230:
              lab-baylibre: failing since 1 day (last pass: next-20200409 -=
 first fail: next-20200410)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200410)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: next-20200410)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200410)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200410)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 14 days (last pass: next-=
20200326 - first fail: next-20200327)

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
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

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
