Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E8E19AEEF
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 17:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732961AbgDAPke (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 11:40:34 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:44016 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732861AbgDAPke (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 11:40:34 -0400
Received: by mail-pf1-f173.google.com with SMTP id f206so97348pfa.10
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2020 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ncpsl3gkJm79WCC+mzKR73+kcfsPG490ndXp8syoli8=;
        b=vj+49XU/vDuBKAaMFonlp6Jlh3+E6DA1u1H3pni5FiNsq7nHLV4OPs9JdO/hDI8ZTC
         zDC/qZOvFchp8KvsFv4/UzhOiWBgWf22q5VKEBT6mZpSNtIyn6Li1PDTsogN6fk9eNVS
         ATapvr90ym2jbb8vcIsuot0/sTYkmVgyQNEyBjwy8YHUti/Anjuchxve+tEH94FYu/N9
         1TXbl3HrBcASZ86zdCSfgV0APWNjel1bL4XV/dJ1VnjWU2qqaOr8umLr6TvMvsgRQ7QX
         jtC8DhP1+qgN+AngNVPtLiwfAUpbDX5HB9uxpz1mZWKHe7asZTWUsp4nGnSYUDZv2D0y
         Y7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ncpsl3gkJm79WCC+mzKR73+kcfsPG490ndXp8syoli8=;
        b=Y/MiZTmoF2adHcTcAF6Gl5jPAzvz67Xe9I5WkNT+XgdQ7QI0hBSG/xSvOsrplF68qz
         Co5BHkI36E7U9G1Uop/oGvLtWwEf93WkBkfZ2f/P+TVIuKEBubBIkhMSsAPbGTcSwuZD
         qpPpgRIZCM5shxBYNtUq3sSQBkf1PPs9mYZYN5bdPrEBxG6MFM8wKgZ2aCMlx2XkCucn
         qY4wuGwiXQdfB2sqkClGU9dYvyskMHdxd7AGQGiO5IKJd3dg2V/Bc3B/IaDY0MJfHmob
         cmc7QXJiJzYrb7JfiS95WrTDd6KwodQ35ehRT58h45D2sjijtj/bkILLWp/Vi9EMP8r0
         oxrw==
X-Gm-Message-State: ANhLgQ1nRIDSQCZh6GNJO66ZnpmKgsyly/lc7DHR1nvm1tY7sWmg3UmN
        tWulcihbc3fhzl8HPvL4L8BKD27falk=
X-Google-Smtp-Source: ADFU+vtSa3REpqQ11XpOlLphrwAVWY8uzp56S9j2R+LnqUMhzadrcK7ykang14SxMo3YToxPcpZCYg==
X-Received: by 2002:a63:2360:: with SMTP id u32mr23700126pgm.190.1585755632140;
        Wed, 01 Apr 2020 08:40:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u129sm1816787pfb.101.2020.04.01.08.40.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 08:40:31 -0700 (PDT)
Message-ID: <5e84b5ef.1c69fb81.8ff50.8125@mx.google.com>
Date:   Wed, 01 Apr 2020 08:40:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200401
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 284 boots: 9 failed, 264 passed with 3 offline,
 8 untried/unknown (next-20200401)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 284 boots: 9 failed, 264 passed with 3 offline, 8 untried=
/unknown (next-20200401)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200401/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200401/

Tree: next
Branch: master
Git Describe: next-20200401
Git Commit: 8274500e2b6748d2d2226873ac88cedc3ad833e8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 107 unique boards, 25 SoC families, 30 builds out of 227

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20200330)

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 11 days (last pass: next-2020031=
9 - first fail: next-20200320)
          exynos5800-peach-pi:
              lab-collabora: failing since 1 day (last pass: next-20200305 =
- first fail: next-20200331)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: failing since 1 day (last pass: next-20200129 =
- first fail: next-20200331)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 43 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200330)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200331)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200331)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200331)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200331)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200331)

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

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

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
