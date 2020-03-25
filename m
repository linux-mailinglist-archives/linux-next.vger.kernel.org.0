Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B36C192670
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 12:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgCYLAg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 07:00:36 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52898 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgCYLAg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Mar 2020 07:00:36 -0400
Received: by mail-pj1-f65.google.com with SMTP id ng8so886137pjb.2
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2020 04:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CmrNsEcw4m2m+C5g9sugzfyHTslwKBSnHw/D+z4wpGo=;
        b=UTa6RGqvF+crokG4YSu6e094BLeArPjQ7obK4pJjxg72vI5LRX5XbWOInfkrVWd9t1
         JQfsZ3o5ItU84vKGWpo2lLmcSsy71igKmteMjAfoaska1qT4pkkAHZFw3U0ZMKCu91Q0
         zjOr45c7A+oge7LUsZSDflh4k2zsh4+c6m2c/sJWDmJYSpad3vp4kDNuQ243AfZb71A7
         zAPPDASZg3UBz4nUxRhVbqXxaQbl311WGfmOCrIe3XPlnasNg7/Vo+MsF8Kv8TUFzunb
         LCZTO61mhVmLX/pRw6Z31tj6qOlTMqfNLFgTOhepECByZ0VSqJgJsrkb86esSvWMWWTg
         iXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CmrNsEcw4m2m+C5g9sugzfyHTslwKBSnHw/D+z4wpGo=;
        b=koKfqWmrQFmyyePYM3ZHT5tNgG2Mn2CGAJn9wORODmpEn8WrDTacHLv5yIfJd/fMK6
         0htjW4sj6utWxcc71tLJoBwhzc5UApjvv/Hj2OvTy9Z443NwhpDw/Q0D/N7bo+0GUzKw
         FD09EWeB1qPxSqjeto97Q5Re0Wmz8vD42NPYO28CKU6uv7vYs2wVZJIDbZfA5d7FVSdS
         Uq9MjuaHfEt9FUGTn/zTaYY/aiFd3RZ0yvfi8lrhvVeZI41sczFy3tRB3v+8t2LXJGHa
         TEBHaiv2hIjPwHheVCr+3I/m7zg4YE8ky1cp0+btrBDhv7v8pMJzHRYQnpLoD5qsabk9
         I1og==
X-Gm-Message-State: ANhLgQ3cVKkaTzC76gdl246OQTyd1tvI6xNpypFGsS4MSRMEJnWkwznU
        ZIQNRRmp0soIUy9MZA7YEhF8BqRzgJw=
X-Google-Smtp-Source: ADFU+vsvJ/IGh+9Cpeni54+i9UXdd8gDhbtMaU8npamMkg0T7nj71KjlVaacDZ8AL8gqIAavktl6pg==
X-Received: by 2002:a17:90a:25c6:: with SMTP id k64mr3051122pje.9.1585134032317;
        Wed, 25 Mar 2020 04:00:32 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 193sm11284397pfa.182.2020.03.25.04.00.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 04:00:31 -0700 (PDT)
Message-ID: <5e7b39cf.1c69fb81.8450e.c90c@mx.google.com>
Date:   Wed, 25 Mar 2020 04:00:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc7-277-g1e07787fb89d
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 273 boots: 5 failed,
 253 passed with 4 offline, 9 untried/unknown,
 2 conflicts (v5.6-rc7-277-g1e07787fb89d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 273 boots: 5 failed, 253 passed with 4 offline, 9 =
untried/unknown, 2 conflicts (v5.6-rc7-277-g1e07787fb89d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc7-277-g1e07787fb89d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc7-277-g1e07787fb89d/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc7-277-g1e07787fb89d
Git Commit: 1e07787fb89ded7f9b290af70c788c9f82f13cc1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 25 SoC families, 31 builds out of 216

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: v5.6-rc6-295-g996cfaad8=
d71)

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 39 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.6-rc7-236-gaf338e2cb=
004)

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.6-rc7-236-gaf338e2cb=
004)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc7-236-gaf338e2c=
b004)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-236-ga=
f338e2cb004)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.6-rc7-236-gaf338e2cb=
004)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: failing since 1 day (last pass: v5.6-rc6-370-ga=
32dcb4acc60 - first fail: v5.6-rc7-236-gaf338e2cb004)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-236-ga=
f338e2cb004)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.6-rc7-236-gaf338e2cb=
004)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: v5.6-rc7-236-gaf338e2cb=
004)

    i386_defconfig+kselftest:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: v5.6-rc7-236-gaf338e2cb=
004)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig+kselftest:
        qemu_i386:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

    i386_defconfig:
        qemu_i386:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
