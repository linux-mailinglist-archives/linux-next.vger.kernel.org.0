Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A371A736B
	for <lists+linux-next@lfdr.de>; Tue, 14 Apr 2020 08:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405819AbgDNGLx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 02:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405818AbgDNGLw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2020 02:11:52 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E32C0A3BDC
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 23:11:52 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id a22so415744pjk.5
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2020 23:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ELJzpMJDgqe5Q8V8O59UjPbusPXuSrWVE8UChFH42Pk=;
        b=z50yoRI8Tn53CWoeYp9r30fQAvCpaMLLRj+bmzNWpEgsVPQ3hD6t8Nif3B6MBS7XnP
         AWeE1502CT0/5TkMBzU7oVF7Ne3GF3cfJtLovjJ6rPSKlQ1DRdyNL3FH/dY58cAjcctq
         PtecWNr0behxj/QL+UhBL/4EAkFtRaI49Yi2iJiitoCNMSBfeeLfQLO86Gs6+Emt8zxc
         x5g4TzvgrzkiDZ/uE6qpLI6o3ILjciECNRV17nUdWicH1t2QXEVroWr73FFyZ/hK0sSW
         cZzUYpwQE1yQFdAwfC0OokGXdCXjBylgLAQFpBLaKYksda/jLWfuNxFRGONRgfC6XgwJ
         /tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ELJzpMJDgqe5Q8V8O59UjPbusPXuSrWVE8UChFH42Pk=;
        b=Z/ZQYlq5WnkzEDqV7C3rkITHj79Y2GKThQW0lkXf5qLoT3HERd61NcpdH2JLqIPWzJ
         XPlQMS+WWyS3Pgmthl2vuiS38SnPoFxWSEhGSULWo5nq/O57QM9cRO/YmyFZSRCx3t29
         MkPuYCuY8ZDMvd63YzFaVuwaFBK2WagZx+v9Ht4ZXAi6W+goE5Z0psd0sVmoDi9n5fiN
         MtqpvBX8u/wnO42AJ8YwiMQ4zF/o9LiGrP7Bu+ZZVf/zugCHfzVLEz7TDcvZZQ9Nbi6Q
         CcFgaFs6KvLllN9Wo6IuEHi2UW1WbgPIjPbdc1pYQglFnFLJaA+5T19u7FgBjXE/WfSp
         8qcw==
X-Gm-Message-State: AGi0PuadWID4RjOl5qIC8+wcOgCrTfkk6u+wtVKTkW7+aZJjhwCrfxoM
        HLgG88snXjjLdQ0sxS99hL5ylM/rSxc=
X-Google-Smtp-Source: APiQypLAL2w57q5NSj/NaOrh7JvnYrw/pJArLqoZ4Obv3fz+KXFFWHKNkw+/4qmZZyY+2j5yYp97xg==
X-Received: by 2002:a17:902:6503:: with SMTP id b3mr11521044plk.20.1586844711476;
        Mon, 13 Apr 2020 23:11:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m2sm10567733pjl.21.2020.04.13.23.11.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 23:11:50 -0700 (PDT)
Message-ID: <5e955426.1c69fb81.309b1.2149@mx.google.com>
Date:   Mon, 13 Apr 2020 23:11:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-rc1-162-gb5846b244239
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 274 boots: 4 failed,
 255 passed with 7 offline, 7 untried/unknown,
 1 conflict (v5.7-rc1-162-gb5846b244239)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 274 boots: 4 failed, 255 passed with 7 offline, 7 =
untried/unknown, 1 conflict (v5.7-rc1-162-gb5846b244239)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc1-162-gb5846b244239/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc1-162-gb5846b244239/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc1-162-gb5846b244239
Git Commit: b5846b2442395eadc4a7bac721fd691d95151bbf
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 23 SoC families, 29 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc1-138-ga7477b73=
db80)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 59 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.7-rc1-138-ga7477b73d=
b80)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-rc1-138-ga7477b73=
db80)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-138-ga=
7477b73db80)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-138-ga=
7477b73db80)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.7-rc1-138-ga7477b73d=
b80)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc1-138-ga=
7477b73db80)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 3 days (last pass: v5.6-1=
2182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

x86_64:
    x86_64_defconfig:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
