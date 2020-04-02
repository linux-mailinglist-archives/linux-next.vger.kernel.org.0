Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A6A19C18C
	for <lists+linux-next@lfdr.de>; Thu,  2 Apr 2020 14:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388245AbgDBM4g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Apr 2020 08:56:36 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:37772 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387580AbgDBM4g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2020 08:56:36 -0400
Received: by mail-pf1-f181.google.com with SMTP id u65so1719639pfb.4
        for <linux-next@vger.kernel.org>; Thu, 02 Apr 2020 05:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EavKQbpVQj8lncwD/lQM50Vdh6Pmen59DTTyXPQocZw=;
        b=1b99R0LqqFBDSOHMAB7qiryottxhE6wFRigJc87ASML3bItTz4ilPHWMaBBddVMtbr
         +gP+zciozFSMHspZCpno3bO1bTp3+xfbWiYanrgJKitgOEU386jze6IqDf6e3gLt2dRB
         zn1+Mo3nrO0nNnWwaBx6cVOBxiefgfDEcjUEWTd0mB8jKubn0kyEbRw4ucLTVDxEJYu2
         qgCc32tIoxSxiTZbJ9oqXTuvJ85CVhCiX06iyw2gZhqQmD16gpO5lo7IEy5E6uS8YmNb
         kKoAhWuPiu7KPsAMOoCckpQQviUqAcPRtHriU9gA6Ssw9PcpUCpmLCny2FrWzVTL0n2s
         5jAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EavKQbpVQj8lncwD/lQM50Vdh6Pmen59DTTyXPQocZw=;
        b=msYPTp7XZ2S9OGda9BfTAO6xohR5Y6uhBB9nxRpD4OgpQmyCWAm+z/1e/KYAu3Npsv
         MvOXs8dsyyQhdzRvg5ookHVKgCQZMOPKH5ysxi6nQM25v7eccd7fc8jXjZpEhKNIX9HX
         2BAEOJ1GMc/NXQgKZG768MF1ha0jtx94Drl84ocU5Mq/+m6tDWeqrBDq/9aJgvXMGV6g
         CW0hs9F9SH9gWJlthLV+43OvfzfBAxowkTg8tb+xWatY7YOoUHjLwH6uli7l5Eqatj+K
         BJu1IEWtDoiZCu1IiaJH/TM0qt7kJUpSw/2GS4KoZtekEGLXJ0SLxo1QaDT8uh8/oepK
         rPog==
X-Gm-Message-State: AGi0PuYmJJUt3Xm+tnLZrsKaEW/dfeMjNL9xOOOyqDsvNEhUKANRDYpp
        ykEuhZ18PJIECQpVpQohU1t1FF3gM3I=
X-Google-Smtp-Source: APiQypLkNGvYJNMlbD5eQAdOOhUdQsA4qyaECh1WR7DfCTx3cYEgOEr+9GudktS6oCGuxw59+iLXdw==
X-Received: by 2002:a65:41c6:: with SMTP id b6mr3126493pgq.58.1585832194208;
        Thu, 02 Apr 2020 05:56:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 6sm3685701pfx.69.2020.04.02.05.56.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 05:56:33 -0700 (PDT)
Message-ID: <5e85e101.1c69fb81.940a5.1333@mx.google.com>
Date:   Thu, 02 Apr 2020 05:56:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200402
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 273 boots: 9 failed, 252 passed with 3 offline,
 8 untried/unknown, 1 conflict (next-20200402)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 273 boots: 9 failed, 252 passed with 3 offline, 8 untried=
/unknown, 1 conflict (next-20200402)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200402/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200402/

Tree: next
Branch: master
Git Describe: next-20200402
Git Commit: 17f166b56b2583b97f0f6612cfbbb7f99e6889bb
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 25 SoC families, 30 builds out of 227

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 12 days (last pass: next-2020031=
9 - first fail: next-20200320)
          exynos5800-peach-pi:
              lab-collabora: failing since 1 day (last pass: next-20200305 =
- first fail: next-20200331)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: failing since 1 day (last pass: next-20200129 =
- first fail: next-20200331)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20200401)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 44 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200401)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200401)
          meson-gxm-q200:
              lab-baylibre: failing since 1 day (last pass: next-20200331 -=
 first fail: next-20200401)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200401)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 1 day (last pass: next-20200331 -=
 first fail: next-20200401)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200401)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200401)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 2 failed labs

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
