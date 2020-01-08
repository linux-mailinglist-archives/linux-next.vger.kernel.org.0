Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51AA1345ED
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 16:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbgAHPRj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 10:17:39 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:46163 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgAHPRj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jan 2020 10:17:39 -0500
Received: by mail-wr1-f46.google.com with SMTP id z7so3713809wrl.13
        for <linux-next@vger.kernel.org>; Wed, 08 Jan 2020 07:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yTai2f2DsIoTx6MhKUju2GApFxFcOe5QMLzXB/EO6bU=;
        b=V0GfMYxv0WDeknuAqBsGNybKQKRhTSvKPdd5OLAQuZ8/Gh8J75/0CsupzAU44kV1oF
         AgNqbEh8m1ZqiqeTKvqL6UwUOYw1zVmm+uL6aoQ+knN+nswJveJPsSkbDm93l8be/7WJ
         he+h5SKXUQ24Tzis/cm+kkp0+EBP0tfX1vNT0J8Ehxk4qfHOKwsFYmcyTSYxGA9HirKu
         m6nICaw4oKnYkptax59N8q1o5fOxsUQs6O2PChDVl6a0RHxlf0ilVdS6dIpGOOK5rLKg
         hEMGNk0pOEcWMR++5Ntp/z6RI8Fa3bZZ8h4FgK04b84Hx9TdAwUPnAsOwvL9Hnx//Gyj
         zIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yTai2f2DsIoTx6MhKUju2GApFxFcOe5QMLzXB/EO6bU=;
        b=gN/dQFeIST2ivochBbSN980FEzhglUZ3Lbk7hAs6BflgJ1cAsBzV7TugwdzZVjjpSo
         e/TMJDvmEXlpD3mb2dmAvpb0GxcgLLna2+HDUQOvZ3HLfFng+MriS8E/7DX3X01DIljh
         tYq+vDsO6L173kN/hxvqPoVV3URNiFHey5dHua1lyYWoUUa6ijWT39znwSvwESn9Cq92
         5MdHZp9WFoixSdfnLKA40CchyXuyEBb9WzHGS24F471r/R8bNVdxIgf0eSYTk9hLDKS7
         KEvi9Z5W+rOBJ3HVkQKrFHDs1hJegRpW0WsjZX01KVzW9RsX9TVbVBCgVS1CteLQfrEe
         IGbQ==
X-Gm-Message-State: APjAAAUml+SA6CvD7sdBT/1TnOCm0vlJq+0UKK3IchhigvEHTQKgm5lq
        ScU7LKME7wQvYLK2F4asVd5N85Cz9dP3Xw==
X-Google-Smtp-Source: APXvYqyjXlblLyEziUlQ9A6Qfy9iU1bTYshwzYnkCCSfx1XcVnCr3NpuQAGYZoh7KftIgNMP0MefEg==
X-Received: by 2002:adf:c446:: with SMTP id a6mr4973742wrg.218.1578496656468;
        Wed, 08 Jan 2020 07:17:36 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l3sm4503245wrt.29.2020.01.08.07.17.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 07:17:35 -0800 (PST)
Message-ID: <5e15f28f.1c69fb81.64fc1.49b9@mx.google.com>
Date:   Wed, 08 Jan 2020 07:17:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200108
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 165 boots: 37 failed,
 127 passed with 1 untried/unknown (next-20200108)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 165 boots: 37 failed, 127 passed with 1 untried/unknown (=
next-20200108)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200108/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200108/

Tree: next
Branch: master
Git Describe: next-20200108
Git Commit: 4becfd1b26ef4014a20fb38dd17554077adbed5d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 66 unique boards, 17 SoC families, 25 builds out of 214

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)
          imx6q-sabrelite:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)
          omap4-panda:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)
          rk3288-rock2-square:
              lab-collabora: failing since 1 day (last pass: next-20191220 =
- first fail: next-20200107)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: failing since 2 days (last pass: next-20191217 =
- first fail: next-20200106)
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 2 days (last pass: next-20191220 - =
first fail: next-20200106)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)
          tegra124-jetson-tk1:
              lab-collabora: failing since 1 day (last pass: next-20191220 =
- first fail: next-20200107)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: failing since 1 day (last pass: next-20191220 =
- first fail: next-20200107)
          tegra124-jetson-tk1:
              lab-collabora: failing since 1 day (last pass: next-20191220 =
- first fail: next-20200107)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)
          imx6q-sabrelite:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)
          omap4-panda:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)
          rk3288-rock2-square:
              lab-collabora: failing since 1 day (last pass: next-20191220 =
- first fail: next-20200107)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: failing since 2 days (last pass: next-20191219 =
- first fail: next-20200106)
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 2 days (last pass: next-20191220 - =
first fail: next-20200106)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)
          tegra124-jetson-tk1:
              lab-collabora: failing since 1 day (last pass: next-20191220 =
- first fail: next-20200107)

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)
          omap4-panda:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: failing since 2 days (last pass: next-20191219 =
- first fail: next-20200106)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: failing since 2 days (last pass: next-20191219 =
- first fail: next-20200106)
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 2 days (last pass: next-20191220 - =
first fail: next-20200106)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 2 days (last pass: next-20191220 =
- first fail: next-20200106)

    tegra_defconfig:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 1 day (last pass: next-20191220 =
- first fail: next-20200107)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 2 days (last pass: next-20191220 - f=
irst fail: next-20200106)
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200107)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200107)
          qcs404-evb-4k:
              lab-bjorn: failing since 1 day (last pass: next-20200106 - fi=
rst fail: next-20200107)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200107)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            apq8096-db820c: 1 failed lab
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab
            qcs404-evb-4k: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

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
            sun7i-a20-cubieboard2: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab
            tegra124-jetson-tk1: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab
            omap4-panda: 2 failed labs

    multi_v7_defconfig:
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

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

---
For more info write to <info@kernelci.org>
