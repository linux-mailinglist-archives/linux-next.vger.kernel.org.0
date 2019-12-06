Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F665114BBA
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2019 05:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfLFEoK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Dec 2019 23:44:10 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50856 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfLFEoJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Dec 2019 23:44:09 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so6436269wmg.0
        for <linux-next@vger.kernel.org>; Thu, 05 Dec 2019 20:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ubdim32bRcyCyJsdDd81N4cj5CjjIGgKdxrcEfZRmxo=;
        b=UXT7fwp3dQ0cfEv/N0V82KnDI14tcLhb5d2t+vtYkYYZGYCW7of9sO9SVCZO2TxjoK
         eXXMqrr8M6hPSPKCPGxmQNifadWXk0/eq6ogUKS6kQp++gpT+1Js6IZ7sT5RQRWErw8z
         q4tXXLc2etbWQNCVr6XJBlMM5MTCtIl59j7Qf4/jiXtykgxLFXcT/WiwROwg6V2jt/M2
         ccyV9VcIwV4cASLLeKuiPIvDgrx4/lwU/PYHWY+0mw3x4bhz5iJtPGLFGXb4WsOjgRJZ
         H7d8WaKOPM4IAfLzu/s2nceiKPYz1BGBrD3kOqwK0JGqaEuk5MEDF/9+h2z+NcRqP0O2
         upwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ubdim32bRcyCyJsdDd81N4cj5CjjIGgKdxrcEfZRmxo=;
        b=KL9ZQC9GBzvPk0oZ5VE87CRv59ljL4JdWOMW/bt/+xK6VVeFC/057BAS/NxswpDqGL
         jcUiJuZALtkwRJwoguPUwNFAymuHEiZsGxkO/Qzc7/2q4+Qzj8YksIXOzoNvoqBok/EF
         CL2ivdTS/N7eYJq2rGwuCvZsyCl3PTA1bEJjEBMxas4+FXM8eX4HNA5K+QMg0CRJP2ES
         edkZ3lK5zW+iWyt5U0Ad00JbsVc4d38XVDS0t10jyp31sKVyWQ4JBl4N4g2LGiPFqyyn
         EbXpy0/dfrKX8PTxXfpp44Z0S/yetD9aS1RVq4NMdZVICFoLwDq/y+LGR40lG9HzCGDh
         LlKQ==
X-Gm-Message-State: APjAAAX3S5ALxVaorcbZi1M/V+Nw+LwJlKgJzCPpsJZ5y+zRS5hgUJzP
        phR4i6ei+/wxVWgnCKDlCcCBfOs21APOzA==
X-Google-Smtp-Source: APXvYqx1WP5jR25ZWUn+FrZo3nAof5+fWGiLr+Xg8/Tp9PalU0Wxf3gNsduYCawIW+ZYxKsGAzFnqg==
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr8159148wme.26.1575607447263;
        Thu, 05 Dec 2019 20:44:07 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d14sm15536209wru.9.2019.12.05.20.44.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 20:44:06 -0800 (PST)
Message-ID: <5de9dc96.1c69fb81.4f6b0.f980@mx.google.com>
Date:   Thu, 05 Dec 2019 20:44:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-13052-g1d33c4208700
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 266 boots: 4 failed,
 248 passed with 9 offline, 2 untried/unknown,
 3 conflicts (v5.4-13052-g1d33c4208700)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 266 boots: 4 failed, 248 passed with 9 offline, 2 =
untried/unknown, 3 conflicts (v5.4-13052-g1d33c4208700)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-13052-g1d33c4208700/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-13052-g1d33c4208700/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-13052-g1d33c4208700
Git Commit: 1d33c420870032a90f85663d6d54a83d89eaa93d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 25 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig:
        gcc-8
            meson-sm1-khadas-vim3l: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-sm1-khadas-vim3l: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    exynos_defconfig:
        exynos5422-odroidxu3:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        meson-gxl-s905x-libretech-cc:
            lab-baylibre: PASS (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)
            lab-clabbe: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
