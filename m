Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51001A3222
	for <lists+linux-next@lfdr.de>; Thu,  9 Apr 2020 11:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgDIJ4C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Apr 2020 05:56:02 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55724 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDIJ4C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2020 05:56:02 -0400
Received: by mail-pj1-f67.google.com with SMTP id a32so1085186pje.5
        for <linux-next@vger.kernel.org>; Thu, 09 Apr 2020 02:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ik+jNmfeIThukL26VKfVX/lf1sR6dphIUZ/LK+RhUI4=;
        b=P+I7yqeec+0Wofh60P524YAm6B5rUaEal8nbHNYv7Qh+vZxJtrZjNfXEp3o4YJTcMw
         thWiCMv+JMxDVqH5FjPbFDF13UriuY/VWR8riylS5tINme+LOERqyZJ70yL6FN2zQlya
         rcQ/FEzksGJR5RdW6xRW9ZHjimpJjJ9GMN3O5SxHDxV9aTE9BO5pCDm7WVddK7Zwjlw8
         vj/kd8IHcxQoXE/RBObcT+QEQvgQnh9E4nw88aqPwRtMDUeujwlawPO3uQ9N/9L71ZiL
         8g6Cx0GuIa0cWk1YpkjP8QNw0UPZikbCYFNCZGXXi1IfSBzALNmN8IDWt+gvntGEeytZ
         W7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ik+jNmfeIThukL26VKfVX/lf1sR6dphIUZ/LK+RhUI4=;
        b=nkLtLGhqnd2d3imoXgpl++9kQOR5tbcSj3tWWZxztUNr6L07ldUDsMzrh/xk04jxHx
         4k1nWKkQBeKNorUR6nIQubHjP8NPmHL/bqQja73vEJdlE2VdojDeIcqxQG9rF/xYs9w+
         XY/pSzoUW+bp0XXZqAMk4ycQvlaEF2AWTNm0iqU8NjtmQgAWiJXCvnxguY/vM10L3Lkp
         OCxB/noZaFAZuY1mkACtHSz4v97XZuegc+U1ahB8IriZL0qG3qN+y6FoNA6hkp1lKmg7
         YnpFCpap4OkJV+NB2rafIPDkqWkXdHhkalX0uEkJMNZ8Ars2wVq5uYogz5KKJQT4zm7y
         3kRw==
X-Gm-Message-State: AGi0PuY3ipAspghBxk8d1TR5EzBj/j0tocw0zOkgr+SDIcE+GoayFoj9
        shJw1T2z+VQgs84SKLsmx7OyePaKwyYueg==
X-Google-Smtp-Source: APiQypKXxtSON1lk9O05kDRoOf4v32mjYxoDEQBcxrUIymqDm/l33qlXuK1oLGkdRbGzL6hUP2y1Lw==
X-Received: by 2002:a17:902:8ec1:: with SMTP id x1mr11411687plo.325.1586426160033;
        Thu, 09 Apr 2020 02:56:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ih15sm1809268pjb.27.2020.04.09.02.55.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 02:55:59 -0700 (PDT)
Message-ID: <5e8ef12f.1c69fb81.f19f5.791b@mx.google.com>
Date:   Thu, 09 Apr 2020 02:55:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-12182-g8614d419a4d6
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 276 boots: 5 failed,
 258 passed with 4 offline, 9 untried/unknown (v5.6-12182-g8614d419a4d6)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 276 boots: 5 failed, 258 passed with 4 offline, 9 =
untried/unknown (v5.6-12182-g8614d419a4d6)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-12182-g8614d419a4d6/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-12182-g8614d419a4d6/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-12182-g8614d419a4d6
Git Commit: 8614d419a4d6f46b91439de79032bc207b132609
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 24 SoC families, 29 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 9 days (last pass: v5.6-rc7-404-=
gbcaebd8567a2 - first fail: v5.6-1227-ga325aefb3560)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 54 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-11990-gbfd=
24b8ae88a)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: v5.6-11990-gbfd24b8ae88=
a)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-11990-gbfd=
24b8ae88a)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.6-11990-gbfd24b8ae88a)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-11990-gbfd=
24b8ae88a)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-11990-gbfd24b8ae88=
a)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.6-11990-gbfd24b8ae88=
a)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.6-11990-gbfd24b8ae88a)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab

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
