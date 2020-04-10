Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1281A470C
	for <lists+linux-next@lfdr.de>; Fri, 10 Apr 2020 15:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgDJNss (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 09:48:48 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:32958 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgDJNss (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2020 09:48:48 -0400
Received: by mail-pf1-f195.google.com with SMTP id c138so1083661pfc.0
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2020 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ymPIbGUxHh8L4hzhyuLM8otG5DZ20lS9XRvEzeXBG5g=;
        b=T80+b/Xt0sNiGo3LlrKiAmvtpfm8v8QmT3t7/x7deAQ+7eJSrPWNrfyU1r5ibaVQo5
         U2/OLHnuKhU03/S5d7ZT1GyHZ0YxaKl/EoJWWMDw8Be/KlnZQL/wTf3EMiOzb39nCKcF
         /MvsSy5aKgRkSvaP4cKfX/duMpNnsNbk9uO49pz/l9XNCqmnWorFgqV+LdzSdqo5axi2
         G6B4gYxh2trtPD7ByiDWmtN16l5rdK/YXEQEcjbPi0HlC5k0FvlOqb4YJQbOCuJv6EDK
         Rn1nSFtm5CB+j61WN4zK1MzM34MFzNu/c4O8KZ1dg64Krf4eEtEkXiwauJbXGxo7iBq9
         KnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ymPIbGUxHh8L4hzhyuLM8otG5DZ20lS9XRvEzeXBG5g=;
        b=agI1LTi2ejuYkxj83M6F/asqRcbgcCJ7eYeCRUIZrYK5CoJm1+nESLRsK62Z8GZvQ4
         4UG2LlLJ620f4AdoPdeAstALpsu6CsUcAd+Hl0LbAy3CFedQ1/tVQGwb8T8czELzmwGa
         /dQgbPVb9QMCmTxG1YzH8IUOv3AT5gnpUU/u1anB7A3ItfhV1LY7EXOYXEty+hn5cmjK
         wLWqD8BE0lkkFPr6ifQXVDbgpCHWvqgc9HuACaUjTZKJLncc4iEKIyT889rLL/x9m5PG
         eiFdNROn0PqoZ4nwFclNqJrn1o3qVhegFMnUrK0uldPr4mGnZwzHhU7bGBAIJbuNvxee
         5BkA==
X-Gm-Message-State: AGi0PubkCenk9TW/nWdNzZjw5RcTVNNS5KECfVZYEbbrbAzIl6l0Pq/c
        g4bYG2J3cuE/pwrweJWs6al9xxzE7CI=
X-Google-Smtp-Source: APiQypLbLYBXZhop0rWL3jkESYEmPbhIiiKM9s0hUhzybRZsKeMIXt7hOJ0LSyq6SgwMf5xh+lHptg==
X-Received: by 2002:aa7:943c:: with SMTP id y28mr4987944pfo.52.1586526526142;
        Fri, 10 Apr 2020 06:48:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y18sm1781356pfe.82.2020.04.10.06.48.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 06:48:45 -0700 (PDT)
Message-ID: <5e90793d.1c69fb81.a6f0f.5ad9@mx.google.com>
Date:   Fri, 10 Apr 2020 06:48:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-12503-g3a0f8793ae13
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 271 boots: 7 failed,
 253 passed with 4 offline, 7 untried/unknown (v5.6-12503-g3a0f8793ae13)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 271 boots: 7 failed, 253 passed with 4 offline, 7 =
untried/unknown (v5.6-12503-g3a0f8793ae13)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-12503-g3a0f8793ae13/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-12503-g3a0f8793ae13/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-12503-g3a0f8793ae13
Git Commit: 3a0f8793ae13e69da6ef8c43421832d2f1f1acd0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 23 SoC families, 29 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 10 days (last pass: v5.6-rc7-404=
-gbcaebd8567a2 - first fail: v5.6-1227-ga325aefb3560)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 56 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.6-12182-g8614d419a4d=
6)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12182-g861=
4d419a4d6)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12182-g861=
4d419a4d6)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.6-12182-g8614d419a4d=
6)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-12182-g861=
4d419a4d6)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: v5.6-12182-g8614d419a4d=
6)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: new failure (last pass: v5.6-12182-g861=
4d419a4d6)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            stih410-b2120: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

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

---
For more info write to <info@kernelci.org>
