Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886C9143C0E
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2020 12:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbgAUL32 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jan 2020 06:29:28 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:37130 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbgAUL32 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jan 2020 06:29:28 -0500
Received: by mail-wm1-f48.google.com with SMTP id f129so2597739wmf.2
        for <linux-next@vger.kernel.org>; Tue, 21 Jan 2020 03:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+sMC+PXX89WyoWpvOk01DAeswEW1AdGdG3zLz83H3L4=;
        b=LbqFPYlRoo4xYGCL49A45BPKnMC655knNy424lrk8tqvHwTf9EXB6YaB2JNqp8hPQU
         rb2PUHPAZRAXTt0d46nIDfC+fgotDq1b3sOJiNOfDCN355xjkFeIt1BzDC3J/aYquOtM
         XRM0GxehK2gbOxxSE9QuaHsr3bdaDTzkOdAR5c3y87DgDXoDuKVj0JaJM3eFIapWERuF
         gxXFjyIm7iEmg3DjfIGMnE2TCCdddiggDRdPPUc0Tvr+sOxbMeM7WZVEzMLMv7iHRK04
         QlkjtSGgSa3hdAHECYufTq8RswnrH29caJT/Bj/W88P/UPjolgxJdYaiM+WARPIdTqxi
         itUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+sMC+PXX89WyoWpvOk01DAeswEW1AdGdG3zLz83H3L4=;
        b=PoMH6tVtRrtA3sXIAaDR6JDlo1HCHDGx3uA6sq1rL6HucqXYTUjFFE4iGimGAJh2k6
         cRDRakTURvsp+F5UCE5uFVuk7lKMtosBlGjMxhU0plUFrGDT0FQ44dDtNsBCCLvvTp3G
         4NwIJECfg16HdwYzaUxEM0I0nFKRP/EOPvl+jyiaKN/gOyPt8S7p/rzf8O8EIOSZjk4P
         bdP9xTuI5+nMp+9FwPTvZTKxijQ+MubUFfI+QZa+Fgs8iGlNmg3LAgE8/FiiFj0ElSgh
         VHlYsHRSYWvSncxzIrGli7pdM42yk/MsbWJj6aBqg7kdZtIyzX6k6CsAsZshVWLoAloo
         f7sw==
X-Gm-Message-State: APjAAAVKye8bXBs707H+SuAPNNF2QfzjAbP9tH8kcZcLrTG0tR5rRrgC
        2HKg9ZOWJeMmL44SGX21nWHafZW0kXZa/w==
X-Google-Smtp-Source: APXvYqwvcTtFNmSsbGXRM5dEClFwL5JXQ0WBApfN1MW+zK7+36QjrSDJaHevarjhOyLsGBVPmij7Gw==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr3884056wmi.128.1579606166242;
        Tue, 21 Jan 2020 03:29:26 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l19sm3434425wmj.12.2020.01.21.03.29.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 03:29:25 -0800 (PST)
Message-ID: <5e26e095.1c69fb81.5027c.d8a1@mx.google.com>
Date:   Tue, 21 Jan 2020 03:29:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200121
Subject: next/master boot: 240 boots: 11 failed, 207 passed with 20 offline,
 2 untried/unknown (next-20200121)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 240 boots: 11 failed, 207 passed with 20 offline, 2 untri=
ed/unknown (next-20200121)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200121/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200121/

Tree: next
Branch: master
Git Describe: next-20200121
Git Commit: bc80e6ad8ee12b0ee6c7d05faf1ebd3f2fb8f1e5
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 22 SoC families, 29 builds out of 215

Boot Regressions Detected:

arm:

    socfpga_defconfig:
        gcc-8:
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
200117 - first fail: next-20200120)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20200120)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: next-20200120)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            meson8b-odroidc1: 2 failed labs

    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            meson8b-odroidc1: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab
            mt7629-rfb: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

---
For more info write to <info@kernelci.org>
