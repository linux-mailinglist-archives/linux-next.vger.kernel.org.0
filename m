Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76FFD198CBE
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 09:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgCaHMu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 03:12:50 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:44196 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgCaHMu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2020 03:12:50 -0400
Received: by mail-pf1-f180.google.com with SMTP id b72so9902454pfb.11
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2020 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WHZKHwtM+LRtcMW1kjmT3X9ukKeqkgqUzn0l65REAVg=;
        b=u/8jbZAOYi/N1SsWlm3r+3bVQ+YTMyBmp9Vei42QrPYyP13F9BC0mEl/MPTc7Tj9H/
         uiqwfKK8lx/jdaguz1Z7m9f4sWVlN0RnjzYHOsr9O1MX6JDIUee8g/TsXWN/8nm166he
         S7nhOZhLPelDHo6IK31gR1Dnd3AlToqCfjKbTxEvWQQ7RAaXFdkEp77kJUio3dTuX7Bi
         Iub5RE00vGkCFysX8eBazUt9ezdRb9on/K6yYt7oiKSXOXQ939nKh902DgKSQYVWIWK1
         VgrEqgpchG32WO1XSrzYQVsU7y7YEelWfSnR3MmK1TrXlMH1bn1GoXgqwQC4uCrlGVU4
         Kc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WHZKHwtM+LRtcMW1kjmT3X9ukKeqkgqUzn0l65REAVg=;
        b=eKHUirmw60XGDJZBWMYUBz0BUa0eIxsxC72V4pn3A5H9qwmjmhl8JO5k30Ua23Zy1w
         SXRYcYlDWz/3CMOx4W3kV5pVfX99QvJ/dt8RrI5eah/EZLEunDjKNVIWgmgjwGha6BYj
         ijdHED/r6B1opIUSAdAAs4bAAlLIn/KO3tW02k98DhLajxRRX3QXDv9cmrGkKnvCmV77
         fiXGE2I5Tx8KPZtb8nnCRSg48JtbK61yjaolcSk96LZFJycajw/VqNOWY1v8MjgFIabN
         paCWx+FshijI8JslyXG14R72UhEfk1jJTuQPDpdwTS7uG3dihbq/NxsuywI0VX5XsHmc
         4R8A==
X-Gm-Message-State: ANhLgQ2P+b0FcOLuLj9Ei+iJz0kh0kLy4/GQH0rtDBUP0LFEVz6kAqXG
        ut5vms4c9mPds32cQmHmNE4EC06OzDI=
X-Google-Smtp-Source: ADFU+vtd73umCHQFI2Gw/NC8my8rKBZ9MpgvNZidlxpnBRkswO8A6snkW4TLOQVgqY09SD7DaEvMWA==
X-Received: by 2002:a63:6cc5:: with SMTP id h188mr16212037pgc.337.1585638768401;
        Tue, 31 Mar 2020 00:12:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a26sm11218333pgn.14.2020.03.31.00.12.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 00:12:47 -0700 (PDT)
Message-ID: <5e82ed6f.1c69fb81.f4217.3b8c@mx.google.com>
Date:   Tue, 31 Mar 2020 00:12:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-1227-ga325aefb3560
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 276 boots: 6 failed,
 261 passed with 4 offline, 5 untried/unknown (v5.6-1227-ga325aefb3560)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 276 boots: 6 failed, 261 passed with 4 offline, 5 =
untried/unknown (v5.6-1227-ga325aefb3560)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-1227-ga325aefb3560/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-1227-ga325aefb3560/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-1227-ga325aefb3560
Git Commit: a325aefb35605c718cc79da13d74977bd13029a8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 24 SoC families, 30 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.6-rc7-404-gbcaebd85=
67a2)
          exynos5800-peach-pi:
              lab-collabora: failing since 25 days (last pass: v5.6-rc4-203=
-g8f169e319c63 - first fail: v5.6-rc4-359-gd038c5cebb94)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 45 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-404-gb=
caebd8567a2)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc7-404-gbcaebd856=
7a2)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc7-404-gb=
caebd8567a2)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 2 failed labs

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
