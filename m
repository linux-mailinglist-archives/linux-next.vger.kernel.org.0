Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FACF1A626C
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 07:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgDMFfp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 01:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:41718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbgDMFfp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2020 01:35:45 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D474C00860C
        for <linux-next@vger.kernel.org>; Sun, 12 Apr 2020 22:35:44 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id h11so3026060plk.7
        for <linux-next@vger.kernel.org>; Sun, 12 Apr 2020 22:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zNSmUKl2gILoHjicr4VLBRrn3ETsI+BGnY9bL/Wzrzw=;
        b=cR6xnEv9UKDxP4tzgE3Oxd19hqQbuc0wjDFIADtavgC59CwHTMjFRHE2pEB/R5ejRH
         VUeyA0ScNUvjFlm6nn+4rBv06LSWKp6uj87OAOg1yedzKrd3tK51gb9r4r8LThY44RwE
         rKaun7HhEYDOM9W4+fCr78TbyUxifh2oNG0oNaIaYTdZbywNzD5c0M6MLmmnxzLau1OL
         iWBQGNERlkrPXtI0IY8gq4apTLfMba7zQQ1dDEyNWdYv/nSzIHupPwk4qFTEdUmVf1GH
         lujkD6lcuyW/HNhXfUt1ZlwT8Y+aXbKSdT53AQWa8WdKzqBBPH1bT6/kxcchhwlUCI+k
         +eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zNSmUKl2gILoHjicr4VLBRrn3ETsI+BGnY9bL/Wzrzw=;
        b=a+RJF5YmxDlKWIcUH/0BFP3wMifQeaT1CQFznTmlOcQE+5YQKSxU+GYZS91poEFfLi
         Fo7mi5Kz8OSFo3Q7OnAgWssxzXf2U2bGiFLaQKiObfUOwuz+BtxFGPzJ/U4HiXT07Pmf
         UwDQnTfyAq2gsdOA5e2B6VW4IEx8DZWhmCr91b+iyjDAg4nJNacT7E//pcx6kZBsgMa2
         7y08+3O84J2SkV5ByI7e9hENs1Ai5MgO28I3LfaTBdTXguo8luDKQtHttK+MEqNdQZYS
         kDrEhbpJUO2WDpeiAOrUHFuQZ84lDAtWUuBCve+R7Wui4iGGx5jj3qpBj0GFsqya7AMd
         uVDQ==
X-Gm-Message-State: AGi0PuYhHUoJvFECKjn5ODKtgsyK6xZU1xAGPWnTWkwbYmymthM1pGfK
        tBuqkyPt5rx61I2UWCTAUxPsffVVBZ0=
X-Google-Smtp-Source: APiQypJrFp8H4ClDY2XIKNtV3jYwFZeQIsSPyt4DF5qp1BUPhUEcSnpY07dIwk8inYPdh78CofUMiw==
X-Received: by 2002:a17:90a:a888:: with SMTP id h8mr11134635pjq.174.1586756143513;
        Sun, 12 Apr 2020 22:35:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q67sm8086265pjq.29.2020.04.12.22.35.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 22:35:42 -0700 (PDT)
Message-ID: <5e93fa2e.1c69fb81.c5368.a6c1@mx.google.com>
Date:   Sun, 12 Apr 2020 22:35:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-rc1-138-ga7477b73db80
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 274 boots: 5 failed,
 257 passed with 4 offline, 7 untried/unknown,
 1 conflict (v5.7-rc1-138-ga7477b73db80)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 274 boots: 5 failed, 257 passed with 4 offline, 7 =
untried/unknown, 1 conflict (v5.7-rc1-138-ga7477b73db80)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc1-138-ga7477b73db80/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc1-138-ga7477b73db80/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc1-138-ga7477b73db80
Git Commit: a7477b73db80e3667d178e9fe8932015a22c0099
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 23 SoC families, 29 builds out of 217

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: new failure (last pass: v5.6-12833-gd8068e4ee00=
a)
          bcm2836-rpi-2-b:
              lab-collabora: failing since 58 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12833-gd80=
68e4ee00a)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12833-gd80=
68e4ee00a)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.6-12833-gd8068e4ee00=
a)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12833-gd80=
68e4ee00a)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-12833-gd8068e4ee00=
a)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: v5.6-12833-gd8068e4ee00=
a)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: v5.6-12833-gd8068e4ee00=
a)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 2 days (last pass: v5.6-1=
2182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

i386:
    i386_defconfig:
        qemu_i386:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
