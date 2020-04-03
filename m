Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCAD19DEEA
	for <lists+linux-next@lfdr.de>; Fri,  3 Apr 2020 21:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgDCT4H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 15:56:07 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:36747 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgDCT4H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Apr 2020 15:56:07 -0400
Received: by mail-pf1-f172.google.com with SMTP id n10so4060781pff.3
        for <linux-next@vger.kernel.org>; Fri, 03 Apr 2020 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jAwVTLLNmA2tXhM7Swt4hZt0ySHk2ZVCDfOhwnJ0PkU=;
        b=TG/B0LKIDpRjoifAoDfjPQzag+TerK/ZV4+btsmf4xwq5ABztWgXFapxSQkNI7iwKH
         UPMZJhc+rJJBaBFi3V3I4xQegRQ6zILefNmMYdfek/nqnwLXEGQyBgjTpEvbC3l9JxB/
         XEDqVTq2TPcngP2QVEEeaj5rUSq7Gp3bJszjBTJTT2vSqJ7si0aNeWSrpExgBbRgxrMa
         VJTmjUKGPfFN4lVguFVzdoSh9OYhdaivL4rjkuKDoiqojneipHaOO9V/Sid8aJIwNLX9
         tWQBwcmh7Nq4lUEgVEM53K3X/v6dQjrZw6YDV4ONabDYBOOQxh2+ZSUuRorL03vLV6Cf
         9qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jAwVTLLNmA2tXhM7Swt4hZt0ySHk2ZVCDfOhwnJ0PkU=;
        b=korScmP7eqQjtb0RVNXP+Gxynt8f04Dn6NBT/WEbSKGr5g47+1E38+gSiHrOGFlNdc
         bk1shMHR9VnFDxiKupzc//SqwSlKMm8d8SvoE++pvatab6eFMaIEivjnz9dN99qu18y4
         hiSH2dONhGH7KZ+uzBSV858O8InSOSa1ntnyPgQ4NOqgLA2edgntTuqjKPfC0kIQpG18
         zoQshS2UetTGZv3C3fAxNDDuffUdwkl593Z0tapTACFGVjCnzE6Lu13+lmIQHkLXBg6K
         wjdC3O1aV0rWB3E8o4Ylryk3L0O3qJ5KflKLqEv6eZFD8BmxLlS2dm2uFjWQdk+nAD/9
         A7IQ==
X-Gm-Message-State: AGi0PuYcOiWsNGECJj/O8u1K3Z7YlZLY0NpCBEMgUEgrfn6zWxQ1wWuT
        LemYY4+YN0yNGpa/3G7inN0hw5yjd60=
X-Google-Smtp-Source: APiQypI+Xmw6skjYFCUWQygAmlHUxzhcjA4gWEvRDhXdXikDLKulwGNe2fdFs+ZDPECDNQO5odj6Tg==
X-Received: by 2002:a63:a601:: with SMTP id t1mr9902296pge.23.1585943765455;
        Fri, 03 Apr 2020 12:56:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id fa16sm6305406pjb.39.2020.04.03.12.56.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 12:56:04 -0700 (PDT)
Message-ID: <5e8794d4.1c69fb81.faf4e.c215@mx.google.com>
Date:   Fri, 03 Apr 2020 12:56:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200403
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 278 boots: 7 failed, 261 passed with 4 offline,
 6 untried/unknown (next-20200403)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 278 boots: 7 failed, 261 passed with 4 offline, 6 untried=
/unknown (next-20200403)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200403/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200403/

Tree: next
Branch: master
Git Describe: next-20200403
Git Commit: 606b5dac8e15e82e5866fa59e675ca6a6b7276c0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 24 SoC families, 29 builds out of 227

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 13 days (last pass: next-2020031=
9 - first fail: next-20200320)
          exynos5800-peach-pi:
              lab-collabora: failing since 3 days (last pass: next-20200305=
 - first fail: next-20200331)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: failing since 3 days (last pass: next-20200129=
 - first fail: next-20200331)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20200401)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 45 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200402)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200402)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200402)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 7 days (last pass: next-2=
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
