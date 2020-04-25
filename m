Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E3A1B83BD
	for <lists+linux-next@lfdr.de>; Sat, 25 Apr 2020 06:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgDYEb4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 25 Apr 2020 00:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725909AbgDYEb4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 25 Apr 2020 00:31:56 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44863C09B049
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 21:31:56 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id o10so5633632pgb.6
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 21:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IDJHc68qQ9P00GxeRFZInrZ7jtEBPdRMWTGuXOj7RSs=;
        b=eplpmHPGyMwMOwB+5CW8XZ4n7JoOnGY2r7Qcc52ZWCOrTNJHABObmrcRLKIAHdikC7
         exU18rtgJv7tMYbPJtoIst1+JEMUI4HywL4CqsEeY+o3XA+HImhcJcnG31J1dtAjVCkz
         TIr9fGRy9sT7a7LioD1ZgPw4BHH4lRI7Gkrvj13T5eJ0A5ivOG24KvLVzgY2/rSetND7
         Ju5wupG9J8Vy1QWSxYIXDrTBiQ+RECR7fEn8Rf/WLyXtNn0FosEez3dY/X0SMPrtiOP2
         h8qXyYp/gbSv2+lTKKeFg0HM6siFkolBXpCcTAvAxsEE0bGOHp0C8cIe7qw0xfb8/Et/
         XeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IDJHc68qQ9P00GxeRFZInrZ7jtEBPdRMWTGuXOj7RSs=;
        b=WS7LXgsAG/rmkqBtX2g4kXJoAZroir48WUHnCZuN3l6i1GlTgIilIFaDzqPiVbKasF
         lPS+ddjQxieCu83RzuqpeJojvxZqUf9HeZuC0hSQEK6uXXd4kbRks0fuAuDZ+ebLHPEx
         89a9QRI5JDIpeTXzZg7x2PnmV7V8oT4OfTFZ6v1C+yxzYT8PrbplnBoG3PvQn7jo1quy
         9MKxuqL1dqsdwghym7r4Bd5y6Fp84H1lGaejEFxNVdYBfBhgW1/9HrJ86FzQEmrN13mS
         C/wsBVUIgi58AHSlR/ijO/JCYNzjZTG1VQk0LNigySIXltVMdluxPXatmQkUEEpJ6QoU
         +KOA==
X-Gm-Message-State: AGi0Pua25FQs66WzRQ4Mq8Gy7ZWPwg9D6A3npxhmn6eGliyQ2bxgqano
        Mvv0vASH7wjti1B+kRJPi22oZP14tgM=
X-Google-Smtp-Source: APiQypIrbXhD2VuzP9q5jOSW1mmTfksMsUqGmMC0cLv2irSrv/+ykEEKjjgJTj4mO5fnfU470Hf+nA==
X-Received: by 2002:a62:a504:: with SMTP id v4mr6745870pfm.117.1587789115225;
        Fri, 24 Apr 2020 21:31:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o40sm6282139pjb.18.2020.04.24.21.31.54
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 21:31:54 -0700 (PDT)
Message-ID: <5ea3bd3a.1c69fb81.3a9d2.2fd1@mx.google.com>
Date:   Fri, 24 Apr 2020 21:31:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200424
X-Kernelci-Report-Type: boot
Subject: next/master boot: 293 boots: 10 failed, 268 passed with 4 offline,
 7 untried/unknown, 4 conflicts (next-20200424)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 293 boots: 10 failed, 268 passed with 4 offline, 7 untrie=
d/unknown, 4 conflicts (next-20200424)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200424/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200424/

Tree: next
Branch: master
Git Describe: next-20200424
Git Commit: 8bdabd09ec86a993419c8c98a4f34c12bc902c6c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 111 unique boards, 26 SoC families, 31 builds out of 231

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20200417)

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 67 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200423)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200417)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200423)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200417)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200417)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200423)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200417)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: next-20200423)

    i386_defconfig+kselftest:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: next-20200423)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 28 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-baylibre: new failure (last pass: next-20200423)
              lab-collabora: new failure (last pass: next-20200423)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

x86_64:
    x86_64_defconfig:
        gcc-8:
            qemu_x86_64: 2 failed labs

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            imx7s-warp: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

    x86_64_defconfig+kvm_guest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
