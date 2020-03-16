Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1124186175
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 03:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbgCPCN6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Mar 2020 22:13:58 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:33537 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729324AbgCPCN6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Mar 2020 22:13:58 -0400
Received: by mail-pf1-f169.google.com with SMTP id n7so9062833pfn.0
        for <linux-next@vger.kernel.org>; Sun, 15 Mar 2020 19:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ABfC7oMBF6MP3hRG1QSWtlL5bllPDvnRXPuJtGWNIng=;
        b=EgkUq8jZEK7FkGARHpYw4pWxSVTXCDH9XZ9+5vuyESF8fTqUu96mhc9UHU80WT9q0H
         zkcDHDGv79gpAmALxUDKcJl1Yn/Lm/HjPjCki9WWXwhgnBcpcJs6Ep1/mt8KlWnuD4iR
         2AkejekuewSQfKMhsY8mGok1cY8Ne5vRwLnmJDnjlfN7A3OF/3FpmzgtZij6I0ZCMCeL
         VnFFmdrRISqCJCXTboAdgSi/xUdjXBYnyMNso1uEAgKYna7DV8Wt7zww/fT6jkMfTAHo
         UdvNXSSjUaFKXdjNcdkOwB5qvm89BqhC0tmgMVa7nw5VpNYuh/+ZwTkn+4etH96sTLLY
         lF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ABfC7oMBF6MP3hRG1QSWtlL5bllPDvnRXPuJtGWNIng=;
        b=jwdgdZNyr0A4uv8lqpITPA2Wx4pY4+5aHYUuBQUFSOHsiJnLJjGvsF/ERvrZ62B/Mk
         F32xX3/KHUxrJlJKwH4B4eCXcyEnrfvr2hCM0WJVy0YX7vQRsq+jN1lLKGU+6EET7uEy
         caqHlONlOEv2old9Ko2C0CjR7K65i9F+QmQ7EYYgZnnfTkjADQW0EE95tqyhpq7MtqY0
         3zyNYAW0b8SHMXzFpFQ/HyK/0sJ3yEzqlPd+8zU0kHs568U4kxPBrXSIs97pYEeCHx+a
         tjCpdPlZQu3cgQIlc8oTrDnLfYFt4nw64rfwaZ3xOS1QurnBW1PUJnlnmIkkVEVk4DDr
         UeIw==
X-Gm-Message-State: ANhLgQ38x5Mi2p/OV9iFSE/x+B0Pu0+NAM2UyUSeSUFBj3MX8ytSJ2Es
        BINOuDCw6TEmEzvWnyn+KSm4zH6VrGo=
X-Google-Smtp-Source: ADFU+vtl/GCJiG5GJ9LLa67XzAtUTKGQ2SMA9WsR9WVpk0zh7Qolj7GF5iSTARvF0s0WlZ2I9+CMPQ==
X-Received: by 2002:aa7:96a6:: with SMTP id g6mr24838772pfk.88.1584324834196;
        Sun, 15 Mar 2020 19:13:54 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q9sm61992539pgs.89.2020.03.15.19.13.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 19:13:53 -0700 (PDT)
Message-ID: <5e6ee0e1.1c69fb81.f3e6e.7a0e@mx.google.com>
Date:   Sun, 15 Mar 2020 19:13:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc5-468-g47d215bb9783
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 278 boots: 6 failed,
 259 passed with 8 offline, 5 untried/unknown (v5.6-rc5-468-g47d215bb9783)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 278 boots: 6 failed, 259 passed with 8 offline, 5 =
untried/unknown (v5.6-rc5-468-g47d215bb9783)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc5-468-g47d215bb9783/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc5-468-g47d215bb9783/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc5-468-g47d215bb9783
Git Commit: 47d215bb9783a05a8f790b7e316e9ced91af6a2f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 24 SoC families, 30 builds out of 215

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.6-rc5-338-gb1d59e1c=
c3e8)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 30 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc5-338-gb1d59e1c=
c3e8)

    vexpress_defconfig:
        gcc-8:
          vexpress-v2p-ca15-tc1:
              lab-collabora: new failure (last pass: v5.6-rc5-338-gb1d59e1c=
c3e8)
              lab-baylibre: new failure (last pass: v5.6-rc5-338-gb1d59e1cc=
3e8)
          vexpress-v2p-ca9:
              lab-collabora: new failure (last pass: v5.6-rc5-338-gb1d59e1c=
c3e8)
              lab-baylibre: new failure (last pass: v5.6-rc5-338-gb1d59e1cc=
3e8)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.6-rc5-338-gb1d59e1cc3e8)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-338-gb=
1d59e1cc3e8)
          meson-gxl-s905x-libretech-cc:
              lab-clabbe: new failure (last pass: v5.6-rc5-338-gb1d59e1cc3e=
8)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-338-gb=
1d59e1cc3e8)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc5-338-gb=
1d59e1cc3e8)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            sun4i-a10-cubieboard: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6q-wandboard: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

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

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
