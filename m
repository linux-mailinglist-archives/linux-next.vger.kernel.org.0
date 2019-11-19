Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96F1D10274D
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 15:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfKSOtp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 09:49:45 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:36559 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfKSOtp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 09:49:45 -0500
Received: by mail-wr1-f51.google.com with SMTP id r10so24175254wrx.3
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2019 06:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rSZxq+B+Q3qLaCMMfkNF0Tceswiznfx/+sgnxTbKZmc=;
        b=kE1Ld/60x5ssdmzBZfykz4kehHia98P08dKAvFtvkgKUfL+S18SxzJun8Pouj1W/+g
         th2+FK3ij2DsGiL3qUx7Z9bZoldOyigUmQQfwUY52U6FDQd9zD0GTJNbE7VZleQ7phsK
         yJfufmq0WcWuGuyx0ihfiH3hkQrbDHKij1Zqbz1Zy/8ZALEXvkZPvq8cPgMukRaQhfjL
         ESFQyxCxYivqQGcY9HYD4adCh3PyxFp853gR2D+j94oJ+Q41jXOKdxvcxdibyk9kF5eZ
         FBSpVYXLnfoV1tCeijoiyOFG59OzzPgvr/Pf9MoCkQpJXYh7qOF0QnRBbXUZ9PKIB3aW
         LZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rSZxq+B+Q3qLaCMMfkNF0Tceswiznfx/+sgnxTbKZmc=;
        b=gxyulr8ZQBR9aVdGatXLAcQqWzXxAdINYKA0jNDMySbWvJ+C/zlHW+c+ssBeZRI+Q4
         SwLxCOTn9byJ00TqNZeDQFLsPsyqXu6T/exZUoSaWWHUo9LH1hSlIeOqvzkCmQMRk0FA
         hBQxsSbBm/wKIVbi4WynekVvOv6mMeXlW0M+jTD04bv87j91ufMLhdnj0yeKvfuzS3el
         t4Z6dElzkpLGZ4clK+SE+wcZtUvWggW3UmX9Rvry+D7TBC2sToz1qd9CznR+5V4vLg8i
         cCa9QI5JYztwu2+AGZdOI8TU40JuXahaC4I4UJPS/GE3c0hWSfElQ19eDgSOWF7t/sEl
         v21w==
X-Gm-Message-State: APjAAAUx+MFkd5G3y8NaUFJOn1LqJkjaivL0j5BLMVFgdPrOxmrvpMpB
        HUR1RFZqIyFtEqU8pse6VPhcVjNcQ06UeA==
X-Google-Smtp-Source: APXvYqxAj84kPebWlVO2BIVOC9RNjC5C72k80M5cjph94JUc4f+MnwTfMa9x+e630t8Jq2EwNSqTLw==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr33903153wro.259.1574174982764;
        Tue, 19 Nov 2019 06:49:42 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x9sm26671047wru.32.2019.11.19.06.49.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 06:49:40 -0800 (PST)
Message-ID: <5dd40104.1c69fb81.685e7.f6d3@mx.google.com>
Date:   Tue, 19 Nov 2019 06:49:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191119
Subject: next/master boot: 257 boots: 10 failed, 226 passed with 19 offline,
 2 untried/unknown (next-20191119)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 257 boots: 10 failed, 226 passed with 19 offline, 2 untri=
ed/unknown (next-20191119)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191119/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191119/

Tree: next
Branch: master
Git Describe: next-20191119
Git Commit: 5d1131b4d61e52e5702e0fa4bcbec81ac7d6ef52
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 27 SoC families, 28 builds out of 217

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20191115)

arm:

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191115 - first fail: next-20191118)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191115 - first fail: next-20191118)
          exynos5800-peach-pi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191115 - first fail: next-20191118)
              lab-collabora: new failure (last pass: next-20191115)

    socfpga_defconfig:
        gcc-8:
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191115 - first fail: next-20191118)

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20191118)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20191115)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab
            exynos5420-arndale-octa: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab
            exynos5420-arndale-octa: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            juno-r2: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

---
For more info write to <info@kernelci.org>
