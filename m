Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31301A7174
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 19:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbfICROF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 13:14:05 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:42234 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727624AbfICROF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2019 13:14:05 -0400
Received: by mail-wr1-f50.google.com with SMTP id b16so18310852wrq.9
        for <linux-next@vger.kernel.org>; Tue, 03 Sep 2019 10:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9tChLDskjMShd3UfP1aK1CiKzMzYe5nIBo7kb63GdrE=;
        b=MiX5GwwGZS63doFSgA5FcycNBVG1alb7OUvpdrahdPDMw0tjFoun0pS7dGedDAvtks
         72r4p7JoDZDQEU4ZnYpmgqbkm2DLj0Z+a6E5NvMIH/7ZURznR88kLPN65PHBgQurtTz4
         pr/Wzps8GIRC9LwIWYQdUqY22eKjcHcpa2bBYEYGDONX+yFiNX9v4nHTSJG9jaPpIG3A
         4bnTkOssLnptA20n9sQxsXBAaz+mX2Tyu3TEw7h0mDqPABcV+nZLB5NeYg/a/xNhBWjo
         Xz1nMLwft/IGx51/TGD7JkdAP101PHV6jtrGb2xMlRUTCj8jH/l//7HR+KmfG43q2LpB
         RdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9tChLDskjMShd3UfP1aK1CiKzMzYe5nIBo7kb63GdrE=;
        b=ck3mDRWSQRawm/xaDfI2RyXUC9Lz08+7ksO2xtcsQAnyXuCvAie0lR8S8thJUFOWuw
         SDuyILURQHuCAzmFn0++BGTcdOOH6An8gEb6MmCoSY0ieknwqvpo6TY2lMHcv2KbiMH6
         ptD0bPnbKaIFIfWiFPN2FW0/xNtfnOKksUxXlCcNmzC6R4vAKxhGoQCwypnXpXxGS7tS
         1lQz+SXy0Hpq6aKGeKISj/DfZfMS537/S70xNiOinfjuE75avbh3h/td5oq0rQRY77tu
         mz/8CLYk6xt+qMraGpkw/nfBPxME1R40IPLXCRTGnmqPzWIuFXEhCNzavLsXac35az9M
         93Ww==
X-Gm-Message-State: APjAAAU3Ap4NToyUL1CJavCnzdUwOvxYuhXQUoZuX+olRFyWr6yX+uFT
        DYyG3jRnVZ8MMInXRQcyA3lpBTs33tVDLw==
X-Google-Smtp-Source: APXvYqxaZod4XC7XB5tcXPZfgxD2AWx0mCdLRwnvdvlhQxoIzUc+lhxMqUsgpyk+o0OhgRbbdaYYgQ==
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr42897742wrn.229.1567530842049;
        Tue, 03 Sep 2019 10:14:02 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f186sm274761wmg.21.2019.09.03.10.14.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 10:14:01 -0700 (PDT)
Message-ID: <5d6e9f59.1c69fb81.deb65.1708@mx.google.com>
Date:   Tue, 03 Sep 2019 10:14:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-98-g65a07b01360a
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 291 boots: 7 failed,
 218 passed with 63 offline, 2 untried/unknown,
 1 conflict (v5.3-rc7-98-g65a07b01360a)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 291 boots: 7 failed, 218 passed with 63 offline, 2=
 untried/unknown, 1 conflict (v5.3-rc7-98-g65a07b01360a)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc7-98-g65a07b01360a/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc7-98-g65a07b01360a/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc7-98-g65a07b01360a
Git Commit: 65a07b01360a6f831f92acdd1d1a8c7512b1500f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 28 SoC families, 26 builds out of 222

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)
          exynos5800-peach-pi:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc6-459-gc=
6e2add224b4)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    vexpress_defconfig:
        gcc-8:
            qemu_arm-virt-gicv3: 5 failed labs

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            rk3399-firefly: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            rk3399-firefly: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab

    mvebu_v7_defconfig:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun4i-a10-cubieboard: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab

    omap2plus_defconfig:
        gcc-8
            omap3-beagle: 1 offline lab
            omap4-panda: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            bcm72521-bcm97252sffe: 1 offline lab
            bcm7445-bcm97445c: 1 offline lab
            exynos5250-arndale: 1 offline lab
            exynos5420-arndale-octa: 1 offline lab
            exynos5800-peach-pi: 1 offline lab
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            meson8b-odroidc1: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            omap3-beagle: 1 offline lab
            omap4-panda: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            stih410-b2120: 1 offline lab
            sun4i-a10-cubieboard: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab
            tegra30-beaver: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab
            zynq-zc702: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5250-arndale: 1 offline lab
            exynos5420-arndale-octa: 1 offline lab
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
