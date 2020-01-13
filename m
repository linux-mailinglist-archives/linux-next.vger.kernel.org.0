Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 763EC13937A
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 15:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgAMORf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 09:17:35 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37807 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgAMORe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 09:17:34 -0500
Received: by mail-wm1-f66.google.com with SMTP id f129so9829210wmf.2
        for <linux-next@vger.kernel.org>; Mon, 13 Jan 2020 06:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zZvfan/gshCqUSYOLlH4aminH1sxQr2O7tdxwLRibeA=;
        b=qnoASoM4MPbOdkbJC1N1GFDiDyQ5qwjYTf01YufBLphy/ze6dg5f2I3mCkJ1On7p9L
         8VtGh8DAgspnBO7LZ33kdbx3SLSADQjUHJfJStPCq+2lc6nEF5PnNiJR5+uRaNIK1sT6
         VfzpPaoynpKmu0VcvlLxaK8sP0fRSShqhpxSLL2eQnvAWw9fQQLd2/giP+eP2Pi1ZF9M
         8MKRGcEtlYNr7bCQVwkacitq2tVSJ00IMFOarXxqIgW2L2zkAOL6Ka50/WTv6VzPmg0K
         Kg5/0cqBx4vZrkmrj1fZE684BVmCVqKB4UE49KZJN7e3M7ytlXTmi6G1Mg+6Ug5BaeeZ
         0nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zZvfan/gshCqUSYOLlH4aminH1sxQr2O7tdxwLRibeA=;
        b=bdhjeu180uME/oJ0MNvUJG7qrwCDR08l6/lLpjS3q82+t79sKQxpFieChX/qrE5jVf
         Go1jS8UFpvNXwN6nT825otC0ZqQFl5+kQLpnOjiKsm3pDCir168onD4PQXFUaddZkch4
         TplChHZ44OUCgoBVjSy2yku3ArSde2cn+5WSU7wWdJQt3A2DzIKBmN0f9C84uyhyEuHU
         yHC6nIiaPevzlQZ48i9nBwSbBlijrfi9KaccqUzo9Le//dbJiBz+ysS0AS0SPRc7Q3gy
         4qU9GWfbktp03qLmsbiTvaIeHRmLh+XCW/+0g1MTd7BX0bm/A83qIpJEN54v9hMO3ctP
         a1kw==
X-Gm-Message-State: APjAAAVHsPMjmwwaQ8+LOS9L1ZzzZCAwG5NhEbYkLK9BQVIP3TOIQDef
        IP8xEv+Lk+vqb2PLpNXzxSJteg8wgdVnQg==
X-Google-Smtp-Source: APXvYqzF1M5V1Ivg6LKguNp6XHgVGIFF+SPrP/I8wVFIM+hYjjTdKBtHGayp9H7dUe10m0cYOj2RCw==
X-Received: by 2002:a05:600c:246:: with SMTP id 6mr21265905wmj.122.1578925052251;
        Mon, 13 Jan 2020 06:17:32 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f127sm14508381wma.4.2020.01.13.06.17.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 06:17:31 -0800 (PST)
Message-ID: <5e1c7bfb.1c69fb81.3cd71.b956@mx.google.com>
Date:   Mon, 13 Jan 2020 06:17:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200113
Subject: next/master boot: 184 boots: 14 failed,
 166 passed with 4 untried/unknown (next-20200113)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 184 boots: 14 failed, 166 passed with 4 untried/unknown (=
next-20200113)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200113/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200113/

Tree: next
Branch: master
Git Describe: next-20200113
Git Commit: 8a28e614e1dba64463521149af18a2fede7d9e08
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 64 unique boards, 16 SoC families, 25 builds out of 215

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200110)

    multi_v7_defconfig:
        gcc-8:
          omap4-panda:
              lab-baylibre: failing since 7 days (last pass: next-20191220 =
- first fail: next-20200106)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          omap4-panda:
              lab-baylibre: failing since 7 days (last pass: next-20191220 =
- first fail: next-20200106)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: new failure (last pass: next-20200110)

    omap2plus_defconfig:
        gcc-8:
          omap4-panda:
              lab-baylibre: failing since 7 days (last pass: next-20191220 =
- first fail: next-20200106)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 7 days (last pass: next-20191220 - f=
irst fail: next-20200106)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200110)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200110)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200110)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200110)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxm-q200: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            omap4-panda: 2 failed labs

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 2 failed labs

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 2 failed labs

---
For more info write to <info@kernelci.org>
