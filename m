Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECAD1BBCC9
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 13:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgD1LrB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 07:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgD1LrA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Apr 2020 07:47:00 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26AFC03C1A9
        for <linux-next@vger.kernel.org>; Tue, 28 Apr 2020 04:47:00 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id t9so1042109pjw.0
        for <linux-next@vger.kernel.org>; Tue, 28 Apr 2020 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=W/N9LMf9bLtJYNnCJpbc7MJg5E7SiiykJi6oTJ9o+tA=;
        b=IWWaarXsVC9o/7n84DKMfE3ec5+U3AWw1tlANSm8Eu2B/jfvpH0UWAf446pOp6+Ver
         bgPSosHGT+q7f2BTr1V/PgVO3p31L8ArliVO5LYyRhtVIGSTionshwrhITk8GiYrLhak
         GurlMTRQDQJO0g9Lene2URVs3FEPER6DBVhCKJSuzV0OkjeFbb2PNRhZE6o1zmLK7AmY
         w/VgLA21Dqw5Tnt9OMUfV7qdSkF583LXZcf9ykCYFutHPV1KwwwVCXFVK5xtn027Z5qa
         2hxuXrIgnc1xlK5owMwSgs9015h8DDYmuCdLtwCuIQJRllFNdlAWKXzIyz5BQCe/pDgO
         1lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=W/N9LMf9bLtJYNnCJpbc7MJg5E7SiiykJi6oTJ9o+tA=;
        b=Gdrn5npBGtgCe+edGt586UI810nq3b7eOaVPbFB0vBhfSP/gumjgoUglMU1RAJqAez
         QW2LzGA+4wZXehrhYX18hqnX+s6UTVABPfjUA6nwBvpsuN3t/fzp+uHN43NUNyROveh6
         JPepRVp7mFCEVhrjtLUk4jUfVIWYfYXaf7LTaaupIfYay5uux66ZLv61VxHMwxUjObS9
         GSSZ5Vk2W/MHEB+e/JmobNX5FgI/PkpKlvBVKdWWKDOcKKrbAh+kqt5x7Zai9yB+Y2yG
         2ZyODNIQ+Glo89ZVkplirCYZWf1DC6yc+6tO9EHEc0NPSvVdiNCcBO/xXNTHpkAqP7ZS
         P4aQ==
X-Gm-Message-State: AGi0PubQbWm8OwdBCEN/Fzn6EPzle2jzl8cLeMbIGeSDPPlWtzVp29lV
        79Y4Hkvzi+kGvWFm5M7FoDGCDfPlELg=
X-Google-Smtp-Source: APiQypJdoNyHgUGuAA8kDPfeG+UX7AHSaWJCg4bR9bzBXPkaU/9LNL/thcvWnLgBtweilNn8GKL4tA==
X-Received: by 2002:a17:902:a40e:: with SMTP id p14mr26684046plq.297.1588074419868;
        Tue, 28 Apr 2020 04:46:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q64sm14725309pfc.112.2020.04.28.04.46.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 04:46:59 -0700 (PDT)
Message-ID: <5ea817b3.1c69fb81.a5ea8.97b6@mx.google.com>
Date:   Tue, 28 Apr 2020 04:46:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc3-194-g1631e20d9729
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 289 boots: 6 failed,
 267 passed with 5 offline, 9 untried/unknown,
 2 conflicts (v5.7-rc3-194-g1631e20d9729)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 289 boots: 6 failed, 267 passed with 5 offline, 9 =
untried/unknown, 2 conflicts (v5.7-rc3-194-g1631e20d9729)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc3-194-g1631e20d9729/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc3-194-g1631e20d9729/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc3-194-g1631e20d9729
Git Commit: 1631e20d9729917cd40ae7a93ec25e1f6b237802
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 109 unique boards, 25 SoC families, 31 builds out of 217

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: new failure (last pass: v5.7-rc1-369-gddfbb9697=
55d)
          bcm2836-rpi-2-b:
              lab-collabora: failing since 73 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.7-rc1-369-gddfbb9697=
55d)

arm64:

    defconfig:
        gcc-8:
          hip07-d05:
              lab-collabora: new failure (last pass: v5.7-rc2-530-g15caa57c=
062a)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-530-g1=
5caa57c062a)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.7-rc2-266-g3c7f529d1=
0ff)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-530-g1=
5caa57c062a)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.7-rc1-369-gddfbb9697=
55d)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.7-rc2-530-g15caa57c062=
a)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc2-530-g1=
5caa57c062a)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.7-rc2-266-g3c7f529d1=
0ff)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 17 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

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
            stih410-b2120: 1 offline lab

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

---
For more info write to <info@kernelci.org>
