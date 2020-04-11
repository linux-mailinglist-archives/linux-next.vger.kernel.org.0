Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155A81A4F35
	for <lists+linux-next@lfdr.de>; Sat, 11 Apr 2020 11:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgDKJxu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 11 Apr 2020 05:53:50 -0400
Received: from mail-pj1-f48.google.com ([209.85.216.48]:39542 "EHLO
        mail-pj1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgDKJxt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 11 Apr 2020 05:53:49 -0400
Received: by mail-pj1-f48.google.com with SMTP id o1so818289pjs.4
        for <linux-next@vger.kernel.org>; Sat, 11 Apr 2020 02:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gx5dgr4z/8IiW6hsu5kKGP+e1yL8kKLRht5ICz12F8w=;
        b=Oqrq5Uy3lltEyYD3gF2ZvCmLDbuPbnjlO5A6KvztQ2h6CpfzCz5AORKuRDjhLsVSNl
         y590XXu3xpi2g+KB4VMN4JcX75dqOBu5aERSBkJewJQFi6xNH61eCgtN7CHk2Wrnm4Jl
         mlDDmBp08FCwpwPBi3fhepMPt5V8s1w+nhxpve8gKKxZCQYYmgMRjTcvGVHTBJBQBkQi
         IHLgMdTSRmdZB3mCjILKnwAJe5ayCu43UlTQ04zA+6QoiWSVDwC6EkPwNiM9TQEsIQMf
         +epjSsYjrPG6pX1z6wFIIA6PwOx9rRA/cXbvRXSWksNTEgGzRCi/jCld09QsFUJCA1FU
         BZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gx5dgr4z/8IiW6hsu5kKGP+e1yL8kKLRht5ICz12F8w=;
        b=A2rpPtPliKhCMHiUgu7vVqcDZB09OR0BvbFY+Eq3j4U35jFeYqIU+0RmiCzoBfdmRC
         nsKrc+0z/Nr5jyDiBnqWynilSkIBQHwthiUWOhn+ZuQHgQZizrtWB+zQfbJzUxrj5H8o
         LRW7uUc69nF21vF42Mw7VB9A0bzxaOF9XnHN3wF9aF1GNLogcIkhpZba+IYg4xoMxXtm
         54Uq+8EOzy/VVDpzmXwgTrWIZ7BV8AfcizxrnCB6ZOeqZc3NsT+4r8pbk3wWMh30xoVW
         g6+E23yQNVtoXNfG1CclSW6WJgbLbcRfuzdyelVvp5uP8sbIHLVc3dcZxuavCPOqmojD
         TOeg==
X-Gm-Message-State: AGi0PubNctVhdeSRU0QelcWxVQXE4M2JY79LL8ZdPLu7Urhb0ZfOT5hb
        jAQ4fro0q0dMm/1g3BMTwC1Q4BcV418=
X-Google-Smtp-Source: APiQypKZYmnlHgUobqCKgs5SsVLzoIWOfYHjpmSupL+7m74aDqrDuX5xM7SgzK/ncsglSppBW8GO/A==
X-Received: by 2002:a17:90b:46c9:: with SMTP id jx9mr10604295pjb.2.1586598827179;
        Sat, 11 Apr 2020 02:53:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 11sm3730865pfz.91.2020.04.11.02.53.46
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 02:53:46 -0700 (PDT)
Message-ID: <5e9193aa.1c69fb81.646ec.c91d@mx.google.com>
Date:   Sat, 11 Apr 2020 02:53:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-12726-gcb0447b07277
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 216 boots: 5 failed,
 199 passed with 8 offline, 4 untried/unknown (v5.6-12726-gcb0447b07277)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 216 boots: 5 failed, 199 passed with 8 offline, 4 =
untried/unknown (v5.6-12726-gcb0447b07277)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-12726-gcb0447b07277/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-12726-gcb0447b07277/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-12726-gcb0447b07277
Git Commit: cb0447b07277fe25e112206486da92f8d999acd8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 22 SoC families, 29 builds out of 217

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: v5.6-12503-g3a0=
f8793ae13)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.6-12503-g3a0=
f8793ae13)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12503-g3a0=
f8793ae13)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.6-12503-g3a0f8793ae1=
3)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.6-12503-g3a0f8793ae1=
3)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12503-g3a0=
f8793ae13)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.6-12503-g3a0f8793ae1=
3)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12503-g3a0=
f8793ae13)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.6-12503-g3a0f8793ae1=
3)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.6-12=
182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            stih410-b2120: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

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

---
For more info write to <info@kernelci.org>
