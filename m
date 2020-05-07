Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377CF1C90CD
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 16:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgEGOwZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 10:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgEGOwZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 10:52:25 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD12C05BD43
        for <linux-next@vger.kernel.org>; Thu,  7 May 2020 07:52:25 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s18so2594397pgl.12
        for <linux-next@vger.kernel.org>; Thu, 07 May 2020 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Kbwl17WkB9I518G0iWXCFe6mrmpNghiUD0pZESZOB7k=;
        b=YirQN2Z7ZTWpqkDsbtaJBo89jDirFneVpbaC28/gy+k45+W+VUbzy/O3cyzsWSbibm
         gTQA/DkhLN1VHSL4EcHO5qF3peq2iNZ9Cd59LoYdH6ocDVH4Zd+veyjZtLit9NBaKm4y
         Ej/c0Px9tOJfM/9VvFlUYaIMBh/Jgcm5oMC5BICDaEErrrlDiR34uMoVbgPO5XyAOtY4
         2EQr9D4u+/UY+QPAY6aaHKqWTfhAZG14ZOcvmC09qmLcuwX3qMuwiLbjMImIQkL6ZPta
         Vw10LeDiJXdyc/qGBCAsXzNNGoXbHYxpaEYbkBSBkqmq4ZFXtK0cRmzbOzOSzEDFQFX+
         RQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Kbwl17WkB9I518G0iWXCFe6mrmpNghiUD0pZESZOB7k=;
        b=oEX17f+KoERD73AU6bQr67r70UmYFxBSpjb85691A3gcswNefZ6VePzW8hkuY+an+p
         o2ri5+W9BorwMlfGdPfjrDvaKEmqc9DWDSA0euKGmJsUNElwKxcArnTDQLAgxh4SJOF/
         wIxbzlzCq25xq6+QdH+G0lTemjeSoaQh2Md3aVfH4BuEKW+5idqCYHovYI8zRJmCdWK0
         A/f0Cqpe2khhg1nFEFI5W9daaC4eqk989PsbJrDakSYq2WXU0hGDq6RH6f7dDls/ObmR
         NxF/fpZNEAyvA7jcjfAgb3rTe1oyvHvCskhAEwcPPzgPNWURnDgehYUJIhVR4mEMPBvj
         lnmQ==
X-Gm-Message-State: AGi0PuaixPNtLW5ugGZg0amzBOiyeauvj3FyNg3uVSkQ0Z6eikL2NYF1
        u4/ay8kL+Q15dnxFsGrD1I6g700fWLM=
X-Google-Smtp-Source: APiQypIzOLqCchs8tbr5s6WspjK65DcyM4D35q+TP84eD9dlMYAuXoNtbzoI2YxKe81EitVE8w69Hw==
X-Received: by 2002:a63:d16:: with SMTP id c22mr11471860pgl.34.1588863144256;
        Thu, 07 May 2020 07:52:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w12sm5074914pfq.133.2020.05.07.07.52.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 07:52:23 -0700 (PDT)
Message-ID: <5eb420a7.1c69fb81.f9406.fa41@mx.google.com>
Date:   Thu, 07 May 2020 07:52:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200507
X-Kernelci-Report-Type: boot
Subject: next/master boot: 241 boots: 17 failed, 215 passed with 5 offline,
 4 conflicts (next-20200507)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 241 boots: 17 failed, 215 passed with 5 offline, 4 confli=
cts (next-20200507)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200507/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200507/

Tree: next
Branch: master
Git Describe: next-20200507
Git Commit: 6b43f715b6379433e8eb30aa9bcc99bd6a585f77
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 22 SoC families, 23 builds out of 231

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: new failure (last pass: next-20200505)
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: next-20200505)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: new failure (last pass: next-20200505)
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: next-20200505)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: new failure (last pass: next-20200505)
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: next-20200505)

    tegra_defconfig:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: new failure (last pass: next-20200505)
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: next-20200505)
          tegra30-beaver:
              lab-baylibre-seattle: new failure (last pass: next-20200505)

arm64:

    defconfig:
        clang-9:
          apq8016-sbc:
              lab-bjorn: new failure (last pass: next-20200505)
          sm8150-mtp:
              lab-bjorn: failing since 1 day (last pass: next-20200430 - fi=
rst fail: next-20200505)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20200505)

i386:

    i386_defconfig+kselftest:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: next-20200505)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 40 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab
            tegra124-nyan-big: 1 failed lab
            tegra30-beaver: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            tegra124-jetson-tk1: 1 failed lab
            tegra124-nyan-big: 1 failed lab
            tegra30-beaver: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab
            tegra124-nyan-big: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab
            tegra124-nyan-big: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig+kselftest:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    i386_defconfig:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    x86_64_defconfig+kvm_guest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
