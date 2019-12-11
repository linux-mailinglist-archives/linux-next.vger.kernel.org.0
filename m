Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB53F11A154
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 03:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfLKC2L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 21:28:11 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:54757 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfLKC2L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 21:28:11 -0500
Received: by mail-wm1-f52.google.com with SMTP id b11so5337767wmj.4
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2019 18:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CcmlCh+tgvj+4OXAgpJQXzAng2x/O1EURVI18SYBHiI=;
        b=1Jew8Rrr8K4P3AZvl9+WTVkda9dxcBSsuxtQ+pNQmOgBwEoLOB38xpYpbhs/sk56Nm
         skSCxcgL1fx+Ynew3Sm3Er+rTtW+tCJe+qF4CJTvltiLIPG3s3GD8CqSaQiIFhcEL3kN
         02qAYr5hyMkljsgGUIRnYwR8v1F7CVwQJ5oyVIoPq1NQT14Qq1tMJY5IbWBM8g2icxO6
         EnHLd5RoB7Lq1qg/y4OVtePdxxx6I5mO9C921S9TV2wXdO++1mFCVSTWYTVEFpo7OaEN
         vY2t41bQ//nQ5tQ6WtEj2WIzEfvh5wehQuiXVHEs8um0YerCfBr3NBp9yI0jsVp/G+eQ
         uN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CcmlCh+tgvj+4OXAgpJQXzAng2x/O1EURVI18SYBHiI=;
        b=FtTt9/Bv9JW76HE4GL/ebzml3+z9641tNWG/s4Mc7P3442mkizYmFsLnQlLhmoyIO/
         T3ajMnjdQLA2OUDCKr4qEm4IKk2bd9pZzJPwJP/1YU51euuiR0vMfCLA1xawII5CYmRc
         P9tiAOIPJNsAc/m20WMCTV2ERFewrG2G5TTY8SwXW2xaEI7k3b5uZqIZBRZSOA5NU03K
         9Z1rTknk0FaX2mlT4uKl6x8Scz17ot38n0JVz7RAzwHfuWEXHglSmozy/BIWOrNcgWBp
         WmKQEpNCZn+0sbxiolW5/QLC9mae5yPlwvY21wuSupitBMx95ISkxqjxKS7eEIwOkjrr
         NswQ==
X-Gm-Message-State: APjAAAVknbbJWpgEfCCI0RaXOqCUJEutwi7nNXoYKjxRN+CM1voxMHUq
        EC+VpQioSgTROP53p/nc+4yv517cA8c=
X-Google-Smtp-Source: APXvYqy7u74uUGiqAxwCuhAT7SNmOQTS701bw3LAc6MJQNrTI/R/geVUIk8UeI6WSw/gnsJ+OkaIQQ==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr517501wmc.9.1576031289050;
        Tue, 10 Dec 2019 18:28:09 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o1sm482999wrn.84.2019.12.10.18.28.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 18:28:08 -0800 (PST)
Message-ID: <5df05438.1c69fb81.19108.1a99@mx.google.com>
Date:   Tue, 10 Dec 2019 18:28:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc1-284-g7644f71e5db4
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 303 boots: 9 failed,
 283 passed with 8 offline, 3 untried/unknown (v5.5-rc1-284-g7644f71e5db4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 303 boots: 9 failed, 283 passed with 8 offline, 3 =
untried/unknown (v5.5-rc1-284-g7644f71e5db4)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc1-284-g7644f71e5db4/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc1-284-g7644f71e5db4/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc1-284-g7644f71e5db4
Git Commit: 7644f71e5db423959de292907924fa118fd29151
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 26 SoC families, 30 builds out of 214

Boot Regressions Detected:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: v5.4-13541-g4663b79ece60)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5410-odroidxu: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            exynos5410-odroidxu: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-sm1-khadas-vim3l: 1 offline lab

---
For more info write to <info@kernelci.org>
