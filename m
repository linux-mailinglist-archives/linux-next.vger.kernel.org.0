Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E13E9103183
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 03:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfKTCXH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 21:23:07 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:35454 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfKTCXH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 21:23:07 -0500
Received: by mail-wr1-f43.google.com with SMTP id s5so26272645wrw.2
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2019 18:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0W+JSGpMrKvoiuBwLtZ6eiNBi/Gk9262hrroytYqRZI=;
        b=krEzofEUIAtnt/LeMeqxGmN4YA7sYH0P92AvFK87mF9atI+kas749jESTXb7n9mJuz
         +JRDVthN6sTPjT0ZaM2d+KCuCntP0Aw9JpV50+/9IU/uIAU8czVAsYhQnBaAr7ObYcTC
         Yt4mvmxHqMViBERp3LCw1GZMG57c7orK5HaVKqc2FpNq6QpgcirYKEuWOarCMSGRdC/i
         l1Iez7NnVSmXEAcVA4+K7sTK/wYbqJM7d8kWY+G+H8bMedpQnhfudZOL5ao1d7WVoOOT
         Xx8JSWAqt9vptowwYuLYQnP8j+zf8mNkvrkBlM/9ylqv2OJyov8Odw05puTn/ZDKYAZ/
         Ps+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0W+JSGpMrKvoiuBwLtZ6eiNBi/Gk9262hrroytYqRZI=;
        b=BZFq37J58DhmcuhLdOp3WbS5/n3SiiNcO5tF9gBWnRMRArhXNgQHdtlJmctKqb9G2i
         bjTwKQC+dhHtjO3tuf31IikGD5ZgLEcBJrkqHKqWs1b2SctOhKUHsh0H6S55zLEdf0Eg
         oA8NL/c/gYfPSZ0rXBUxH0KqANK9zUt1itjTeW2uP55fk6JuYYjGc8FkfXFed2u214wE
         2KoxZAvdtWCK/X6fDnaxJpPE+qsghJvUz5z1Q802nynbO1fXJfqt9SEve0mF2Q9IGOWw
         sf19ByCq/34dhLDaueCrk1FtwWPhKo/iCwbjEf+w+0l5dL79GGuncLrDZGL/5e2zF6sO
         Gi5g==
X-Gm-Message-State: APjAAAUNpj66hQOR+zHs3p4eotIMVqwFZhS+wsoSrzzpgaL3mmZRN1ZZ
        HjrWb8lFbFDawpk3fzHvRd5wPNN+U+Tv9g==
X-Google-Smtp-Source: APXvYqw3NafjGw7VZ8ePhLioknjWb8B5E7kFWGIiku3JI5NVFOtCYLMopyLIR1UzpI3j1LR7kPIsMw==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr202448wrj.102.1574216584717;
        Tue, 19 Nov 2019 18:23:04 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 72sm31378794wrl.73.2019.11.19.18.23.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 18:23:04 -0800 (PST)
Message-ID: <5dd4a388.1c69fb81.bbff9.62ea@mx.google.com>
Date:   Tue, 19 Nov 2019 18:23:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc8-95-g08504765f773
Subject: next/pending-fixes boot: 257 boots: 5 failed,
 233 passed with 19 offline (v5.4-rc8-95-g08504765f773)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 257 boots: 5 failed, 233 passed with 19 offline (v=
5.4-rc8-95-g08504765f773)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc8-95-g08504765f773/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc8-95-g08504765f773/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc8-95-g08504765f773
Git Commit: 08504765f773b151ff96f75b36e6a7f1c3308ccf
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 27 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2835-rpi-b:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc8-85-g06=
32e899eb04)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4ek:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc8-85-g06=
32e899eb04)

    socfpga_defconfig:
        gcc-8:
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc8-85-g06=
32e899eb04)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.4-rc8-85-g0632e899eb04)
          meson-g12a-u200:
              lab-baylibre: new failure (last pass: v5.4-rc8-85-g0632e899eb=
04)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.4-rc8-85-g0632e899eb=
04)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.4-rc8-85-g0632e899eb=
04)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-g12a-u200: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

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
