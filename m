Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F4125132DB0
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 18:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgAGR4H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 12:56:07 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38652 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728266AbgAGR4H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jan 2020 12:56:07 -0500
Received: by mail-wm1-f65.google.com with SMTP id u2so493994wmc.3
        for <linux-next@vger.kernel.org>; Tue, 07 Jan 2020 09:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zWtVZ2mPaQyhV05fhLGyFc22WtDvmlFzORtB5rKK4Ec=;
        b=PrVIoNSLJDki12v5daVLUz2H13Ay7ChDipeh/KBJb1vKt+Mt9bnQBHvTvSFZ47K43y
         O+3zh0fTeYBCA/K75ip2lb9+PXAYYmi8rMja1i5p3G8ISI+YjT7ptE9T+UE7ihaWmQcQ
         rMkUU/GcwzORVYoCha8tSPblxMkgeuUHq59jqdKGtJOZDL2DBXo3Fmwtb/yFziqN2b7Y
         Ysov/eLRAgqfn1dL/6ev20fpPHPNrrlqWnpqeVgHmpM/NPgS1EOYuyasjAjdjUi1hNrl
         T6bs7ZSMdtMycQlL0aiaxgkUl4+hg3cKomyd4clPgjsUOldrhS9Yf6QyK9iaqY9OVqJA
         3l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zWtVZ2mPaQyhV05fhLGyFc22WtDvmlFzORtB5rKK4Ec=;
        b=JmOJtyh87XE+At6l1t1//Rs9UJRMYeJ40WXXzhPpnEakqJndExhgwdei8wJWKx3DWY
         mHnK5DiGuz54od7r8GaoA85n0R/luZdiHT42WHFaRHk8FbPbuVaakO7HwcccnLpxfCBc
         NMwKghxg8uyPLQyQ6YboejNLwnKTYuXC5YQk9+xxh0F8gVkLb1NrS2uEbG/7Mo1ZAHYI
         i5OF+R/Tg6/YbnZ/vpI1uC+5v0/0TgQ+exUEUv9lo0PhKy6hercWjoA/PHAU/9xBAuEF
         cQGGZj0jY7hsdqkDVeqdiEVYsDPAaLv2WcfiZiKJP+dfNamrFjJJXs8qwg2pswjWLuCG
         VktA==
X-Gm-Message-State: APjAAAVRG1CXmBLuS/lH8oWr8pL77sudJxVktTd4TB+lQOvRcyl0a/HW
        5PcUND3S82Ra2ZqbIX6BmeuW2IgKUtOXug==
X-Google-Smtp-Source: APXvYqzrrp6imfZSFtysyruUBh2SNhJVIKgf5y2RGRFtlGtlsKrqUPSykAYAtO21bybXWqA5vm6Zkg==
X-Received: by 2002:a1c:18e:: with SMTP id 136mr249874wmb.53.1578419764129;
        Tue, 07 Jan 2020 09:56:04 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u22sm723091wru.30.2020.01.07.09.56.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 09:56:03 -0800 (PST)
Message-ID: <5e14c633.1c69fb81.35e9b.4266@mx.google.com>
Date:   Tue, 07 Jan 2020 09:56:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200107
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 190 boots: 41 failed,
 146 passed with 3 untried/unknown (next-20200107)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 190 boots: 41 failed, 146 passed with 3 untried/unknown (=
next-20200107)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200107/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200107/

Tree: next
Branch: master
Git Describe: next-20200107
Git Commit: 2646738520338211e74394857e36df7c455a8a91
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 67 unique boards, 16 SoC families, 25 builds out of 214

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
              lab-drue: failing since 1 day (last pass: next-20191220 - fir=
st fail: next-20200106)
          am57xx-beagle-x15:
              lab-drue: failing since 1 day (last pass: next-20191220 - fir=
st fail: next-20200106)
          imx6q-sabrelite:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
          omap4-panda:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: next-20191220)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: failing since 1 day (last pass: next-20191217 -=
 first fail: next-20200106)
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 1 day (last pass: next-20191220 - f=
irst fail: next-20200106)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
          tegra124-jetson-tk1:
              lab-collabora: new failure (last pass: next-20191220)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: next-20191220)
          tegra124-jetson-tk1:
              lab-collabora: new failure (last pass: next-20191220)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
          imx6q-sabrelite:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
          omap4-panda:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: next-20191220)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: failing since 1 day (last pass: next-20191219 -=
 first fail: next-20200106)
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 1 day (last pass: next-20191220 - f=
irst fail: next-20200106)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
          tegra124-jetson-tk1:
              lab-collabora: new failure (last pass: next-20191220)

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
              lab-drue: failing since 1 day (last pass: next-20191220 - fir=
st fail: next-20200106)
          am57xx-beagle-x15:
              lab-drue: failing since 1 day (last pass: next-20191220 - fir=
st fail: next-20200106)
          omap4-panda:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: failing since 1 day (last pass: next-20191219 -=
 first fail: next-20200106)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: failing since 1 day (last pass: next-20191219 -=
 first fail: next-20200106)
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 1 day (last pass: next-20191220 - f=
irst fail: next-20200106)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: new failure (last pass: next-20200106)

    tegra_defconfig:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: new failure (last pass: next-20191220)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 1 day (last pass: next-20191220 - fi=
rst fail: next-20200106)
          meson-gxbb-p200:
              lab-baylibre: failing since 1 day (last pass: next-20191220 -=
 first fail: next-20200106)
          qcs404-evb-4k:
              lab-bjorn: new failure (last pass: next-20200106)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            msm8998-mtp: 1 failed lab
            qcs404-evb-4k: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            tegra124-jetson-tk1: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun7i-a20-cubieboard2: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am335x-boneblack: 1 failed lab
            imx6q-sabrelite: 2 failed labs
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 2 failed labs
            rk3288-rock2-square: 1 failed lab
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun7i-a20-cubieboard2: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab
            tegra124-jetson-tk1: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab
            am57xx-beagle-x15: 1 failed lab
            omap4-panda: 2 failed labs

    multi_v7_defconfig:
        gcc-8:
            am335x-boneblack: 2 failed labs
            am57xx-beagle-x15: 1 failed lab
            imx6q-sabrelite: 2 failed labs
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 2 failed labs
            rk3288-rock2-square: 1 failed lab
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun7i-a20-cubieboard2: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab
            tegra124-jetson-tk1: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

---
For more info write to <info@kernelci.org>
