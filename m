Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A140615ABCE
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 16:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgBLPQf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 10:16:35 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50605 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728247AbgBLPQf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Feb 2020 10:16:35 -0500
Received: by mail-wm1-f65.google.com with SMTP id a5so2727103wmb.0
        for <linux-next@vger.kernel.org>; Wed, 12 Feb 2020 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=K7RIY+4kAOToikoZA87KbVKD/yPHm259oFpCQyJwGC4=;
        b=ENoDiFSH5yBF5jcv+prsG5x0FVNfTDGKUujRnb1yTgVozjYkY3RTn9i3UYA/KJUSLi
         R9WER3wuXP59UrA1Z7O+wBFYWjtne77FIj0vdGYfUNTs+7ALQw2lwjmzTvYt55e8MJ2e
         0IZdWM45scYpf5kQAfmaKXSG3iDotjgJNguk1J83Dnialky/D+7pFx5HW113ybJlqxlz
         gQNMzwAfGWkbgocaIbvbdT+HSiLb5Hpi9YBvD79kOtPexOoB7PBYxz6o968a9Qa7tDkK
         odH7OyTskS3UsBXNey2xDXrzeAEBarp3gl/YDQ/L68iX3xIeJgnsQvY/FHe06hP8tt1q
         u2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=K7RIY+4kAOToikoZA87KbVKD/yPHm259oFpCQyJwGC4=;
        b=eOAsptJWH9VytTD42VhfzbiZQwsOnyroSlITxFyKISjPbr4yxErhkLQkOf3FqH3n3F
         2elQkkL91VpdIKMMBExwt98FVjCuj+QkyV0tXykafE6z47NcwNx50ni9/ZlwNbIYXuZp
         VRA9tNpM/ry4NvV2sJZmZ6rvyPj+tmSfG5llsaR0nowapHeKDYkFf7XefjgVWHF0Ojyh
         JQs5lNf5/Q9XjI6+ofZFn7AtjIoFrJ4SSU+gmKe9x9aHFDkj6fTOr0QevAE5E0FZSTpp
         NFeIjl4Q1alM4FXE1AFCfcNNN/0h0Ief3D2AuXuv9SsSImQCaZYhjv/k1O77LhxiY4SD
         wf3g==
X-Gm-Message-State: APjAAAXC4HlFnrqQ/A31qcqxIqOaXrTV//QyGrCd6FEKRUcK6xzqNwrs
        Dg30wbT04hoe+NG2QCatQ47jAFwjCf531g==
X-Google-Smtp-Source: APXvYqwBNmb9e+2ggGElOlA/Hsoy0lkmJ/6svvGQv9OFnlHDbeUyPIwJw+G7+5DyQXokO31lZRSMlg==
X-Received: by 2002:a05:600c:2c53:: with SMTP id r19mr13282960wmg.39.1581520593894;
        Wed, 12 Feb 2020 07:16:33 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z6sm998915wrw.36.2020.02.12.07.16.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 07:16:33 -0800 (PST)
Message-ID: <5e4416d1.1c69fb81.87ea6.5b23@mx.google.com>
Date:   Wed, 12 Feb 2020 07:16:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc1-154-g2c2a150a97e7
Subject: next/pending-fixes boot: 94 boots: 4 failed,
 85 passed with 5 offline (v5.6-rc1-154-g2c2a150a97e7)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 94 boots: 4 failed, 85 passed with 5 offline (v5.6=
-rc1-154-g2c2a150a97e7)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc1-154-g2c2a150a97e7/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc1-154-g2c2a150a97e7/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc1-154-g2c2a150a97e7
Git Commit: 2c2a150a97e729922815d12c2c3be883713f79ac
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 73 unique boards, 19 SoC families, 24 builds out of 168

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.5-11478-g1433b2950f=
a9)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 6 days (last pass: v5.5-9475-g7c2eb3=
712de1 - first fail: v5.5-9670-g2c46fb8a6882)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-120-ge=
3ed5d1c150d)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.5-11478-g143=
3b2950fa9)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-120-ge=
3ed5d1c150d)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-120-ge=
3ed5d1c150d)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
