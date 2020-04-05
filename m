Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C4119E8F5
	for <lists+linux-next@lfdr.de>; Sun,  5 Apr 2020 06:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgDEETj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Apr 2020 00:19:39 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:35026 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgDEETj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Apr 2020 00:19:39 -0400
Received: by mail-pl1-f175.google.com with SMTP id c12so4536758plz.2
        for <linux-next@vger.kernel.org>; Sat, 04 Apr 2020 21:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xmRJ2NlqbIINfUXGrMGFuodF1sqXAakNvuKnwB+lhUs=;
        b=2Ixs6rcw+qy5lxUUuMXTu+hGXEwwIXBigRDH15BkkA6CEtzHZQVUaM5m9ntmOAbrUP
         0FeBtmN0rQ5yDhVeiIQqushj2kabiksHsrmuocJuKjejTSDZRSXxJSQvKyfIK+ORKNm2
         qeWGMpLdQd/9HBuHaZQn/4HrOKdPk3rVqp2D3Af1UvggjwHJqNLwoq/OEiTG1KftAvSG
         6xFcOuQTU7P6ofFHAKjJTGmZI9pBhPXjL8AWl1iQItE7FU+AOj6Kv/8d2W5khJEqy+8N
         6RxtdzHzVTL3I4VPt6BRcNgJWEfPm767kds4gWBRTXi90pR/6Y8TGkROEmoVa5R/40EL
         6k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xmRJ2NlqbIINfUXGrMGFuodF1sqXAakNvuKnwB+lhUs=;
        b=ktuo3ASgr4hjzSixKHdqZwTUDve6cQdUq9dSzcIIX5SD4fmhkf3VWc2dzEkJgpiiLv
         /HPWl5J73RIbLVC0YxwB0vgrdHoCOAUxZRVE2ti5P4zhcbOMP26B0AXrQ311qkuhcP78
         b6Hj6BT6eRVV5gdhEhQpvVLc4NgGapvCRqiIqTScJ6MqPd5pKtmDIIP8wADSB7vEC3ut
         nm+iHwtzGUOssl6CSHZ+QiHx8eFeqmfEd+MN9AVDZ75+dGlKXDjCzhL4TMqu8I/1Pg73
         5PQrvKu/1bLUsUBaMuSHIc5EXinaMSSvm/CxuLjVW2XIpf4bVZIfgAmUHa3PC6L/btli
         Bv+A==
X-Gm-Message-State: AGi0PuaCZ2UKfPowpGZZ5K8MT1kgBS/j+dBYmJAbvvhq/3pacl7G8ayy
        WsesYA247a6VK7/bedW9IgNOZxq4TFg=
X-Google-Smtp-Source: APiQypKoIuYy4uKEoCYPmmMIFaLDkS3ZQ/U1u5y2R2VUo2OJxgnCZX+cBiZwD6YAiE/JwA2m/brZgg==
X-Received: by 2002:a17:90a:228c:: with SMTP id s12mr19028398pjc.68.1586060377359;
        Sat, 04 Apr 2020 21:19:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t1sm964998pjf.26.2020.04.04.21.19.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 21:19:36 -0700 (PDT)
Message-ID: <5e895c58.1c69fb81.c28c4.615b@mx.google.com>
Date:   Sat, 04 Apr 2020 21:19:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-11001-g25533a084e59
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 278 boots: 7 failed,
 260 passed with 4 offline, 7 untried/unknown (v5.6-11001-g25533a084e59)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 278 boots: 7 failed, 260 passed with 4 offline, 7 =
untried/unknown (v5.6-11001-g25533a084e59)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-11001-g25533a084e59/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-11001-g25533a084e59/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-11001-g25533a084e59
Git Commit: 25533a084e59597e6dc636ab031e94c8f8d772a5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 24 SoC families, 29 builds out of 215

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 4 days (last pass: v5.6-rc7-404-=
gbcaebd8567a2 - first fail: v5.6-1227-ga325aefb3560)
          exynos5800-peach-pi:
              lab-collabora: failing since 30 days (last pass: v5.6-rc4-203=
-g8f169e319c63 - first fail: v5.6-rc4-359-gd038c5cebb94)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 50 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: new failure (last pass: v5.6-9886-g0b1e9f1086f=
3)
          tegra124-jetson-tk1:
              lab-baylibre: new failure (last pass: v5.6-9886-g0b1e9f1086f3)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: failing since 3 days (last pass: v5.6-1227-ga3=
25aefb3560 - first fail: v5.6-3095-g771732386d6d)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-9886-g0b1e9f1086f=
3)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-9886-g0b1e=
9f1086f3)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-9886-g0b1e=
9f1086f3)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.6-rc6-220-g39ff0c2fc=
628)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-9886-g0b1e=
9f1086f3)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 2 failed labs

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

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

---
For more info write to <info@kernelci.org>
