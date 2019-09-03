Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0020A716D
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 19:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729537AbfICRM1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 13:12:27 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:53404 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbfICRM1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2019 13:12:27 -0400
Received: by mail-wm1-f41.google.com with SMTP id q19so310488wmc.3
        for <linux-next@vger.kernel.org>; Tue, 03 Sep 2019 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=piQjlYrnPetUeeoVyl4nkNBu1PId1Cufk8x1GfycER0=;
        b=QdHb7q87RdoV44gGXaoqBvwrOaAjCvsWN5If8z9Q87sTTaW8GUpyuZnyB1aReufgS3
         sqEObHLPJEi0rJ19eKBfG+5Py0uLXX75D2X5yUNh2fEbo3w4MadVZNp+8RcddLEfpsNq
         Ppc489ynQYLVItecH0eYUIGc0PfYOBiV709+uBcrTGL1eL2Xeex5g0MGbVFW8zqTGXyy
         7IGe7ExkzaF0rtMKfMKOdLwUI0V4AWLJr4u2hKUcp7mV4KhJCISpIHMsrbesIgZSwfKj
         1kqK6ily+SrdozkwQ+fxuxC3wJpuz2KS+6qxPZeFTBZz+YzW+lDMgiWpFAnl+gifCkB1
         8IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=piQjlYrnPetUeeoVyl4nkNBu1PId1Cufk8x1GfycER0=;
        b=pROawT3+8IjmjvFfSgYZTtTLim4LtA9VK7kWD4NOg8M9z01M9qhVGwMhZB6uI0VHn9
         Pz3DQuuqfk11mNam5DMyFU1VT4/Wt6qCfZELtTpN7bNQ8uvtwJxZKZLcy7RtN07JkM4R
         aF2rO3+AawpWJoDdC7ojrFA6PuizqVbTsOminPt8URHaWwmw7IigyAKS2+wIfPkYeu/I
         qNWcP9RwMtxLHzs/il+mCwdkm5ut3srKAkipa5d6oTJX/wK8eAzyJEtIP7ysvhHF91nN
         5AHmNjohV2PqsV9viGSuCCPn2z1fEzfNTJmB4n2TSyFa53SlVjf/3Giw6YKwokAQ0VZU
         9KxA==
X-Gm-Message-State: APjAAAX5Vk+ltX0KR9dgN/cHEB9y7LTwcXx5CyG7nfxBbwThW8SKadCr
        fVk98lzStdubIbfOqCPU/racMA2TKlDnRQ==
X-Google-Smtp-Source: APXvYqwCJXd6bqj6yBFM2BdVR1PyW/PPvBSodleZaRgBnUx3bjEOqCfAYffSFEfvQSBmPmHXwDq7rg==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr414852wml.36.1567530744039;
        Tue, 03 Sep 2019 10:12:24 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o22sm13918666wra.96.2019.09.03.10.12.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 10:12:23 -0700 (PDT)
Message-ID: <5d6e9ef7.1c69fb81.a5c0d.d925@mx.google.com>
Date:   Tue, 03 Sep 2019 10:12:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190903
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 220 boots: 11 failed, 140 passed with 58 offline,
 11 untried/unknown (next-20190903)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 220 boots: 11 failed, 140 passed with 58 offline, 11 untr=
ied/unknown (next-20190903)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190903/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190903/

Tree: next
Branch: master
Git Describe: next-20190903
Git Commit: 7dc4585e03786f84d6e9dc16caa3ba5b8b44d986
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 28 SoC families, 19 builds out of 218

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: next-20190902)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: next-20190902)

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: new failure (last pass: next-20190902)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: new failure (last pass: next-20190902)
          exynos5800-peach-pi:
              lab-baylibre-seattle: new failure (last pass: next-20190902)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20190902)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: next-20190902)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: next-20190902)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: new failure (last pass: next-20190902)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

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

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

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
            mt7629-rfb: 1 offline lab
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

---
For more info write to <info@kernelci.org>
