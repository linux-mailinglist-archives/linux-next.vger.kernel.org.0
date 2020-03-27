Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290AE195ACC
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 17:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgC0QOU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 12:14:20 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:43987 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727548AbgC0QOU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2020 12:14:20 -0400
Received: by mail-pf1-f182.google.com with SMTP id f206so4714025pfa.10
        for <linux-next@vger.kernel.org>; Fri, 27 Mar 2020 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=V5v0GEO7kzzTD4ehCAeBThlyEOk5fjX5UfW/0wOXDoo=;
        b=p2jffmva2XoERogvXZAyDxtLPX+Hvzg/DCRKmiOsu+0EbIM9pZ87FcqSOMcyVNVyUA
         bEht/iHPRQKebRJGf5vATwluBvq8W5bc+BbA6hONA6c9dTPXNp14ezOy/sTzyo9qsKRi
         o7WK6amnip7fJoYBgLyrc7XyfbqE213c25QcJUR2K3v4OUwjfe0RIkZC0u7gMyTdAeMT
         7ltEwx9BLF2CTVRYiMhSg7t7pKji80ViT0iMiQMv9Q5ywy4Nj7i5wMZNQ2Ijj2fefxgj
         X1M/ARUfjoFJXAu/QQovUZ8zhOxfHS4io/w4t49Rf6LUcNsw+Bjd9Hn3n2Zz7oqAGWwg
         P71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=V5v0GEO7kzzTD4ehCAeBThlyEOk5fjX5UfW/0wOXDoo=;
        b=ipGwq60Bg7u+ylIupkBZ5IB0l696gUcK6qDBYNgwfRsCTFa5+h5akJLjMLVmRHiCbr
         lB1KSNtEGy1sSNNy0H6VMzaJIaCDDCA6lMsKq9jVegGhj3aLTwV7Ia/qAP1tuG4JVR9F
         6OmqUgzbUlQ61jKmkzASAlaV6Zi9PFN7a17PuowOBwPWCtZpVKGBmf4eQqukJncQeTwI
         3C11sg/aHVCHtktkzV1AoEWVTRe5Go1JEA7YcyNOx/I1D6f63qNepEEpSu5J7xxyT726
         5m8QbLRDFXNhTYOZO4vQY7nuVB5+e33UGE3G/Xm25zDPI2qHXppZiZ6iv9NQ9ZwUjIuM
         gOEA==
X-Gm-Message-State: ANhLgQ2diWvDbGPo/4eYggXZzZtZcnK140HZjqyGEFJj9ZSqZMR+pUTs
        GL+kgiDMXF9NYlzc9p+4LDehOidbNRw=
X-Google-Smtp-Source: ADFU+vs+znQzxHjx9YGZxJGA1v+G+3E1TDzkGc4/cSpqlzM5ZQBmVqG3+cs3P17k+sh4Hgc5CtHaPA==
X-Received: by 2002:a63:1f14:: with SMTP id f20mr21028pgf.411.1585325657808;
        Fri, 27 Mar 2020 09:14:17 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i3sm4245465pgj.13.2020.03.27.09.14.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 09:14:16 -0700 (PDT)
Message-ID: <5e7e2658.1c69fb81.6b9d2.1502@mx.google.com>
Date:   Fri, 27 Mar 2020 09:14:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200327
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 212 boots: 18 failed, 188 passed with 4 offline,
 2 untried/unknown (next-20200327)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 212 boots: 18 failed, 188 passed with 4 offline, 2 untrie=
d/unknown (next-20200327)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200327/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200327/

Tree: next
Branch: master
Git Describe: next-20200327
Git Commit: 975f7a88c64dfdfde014530730ba7a6f3141f773
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 23 SoC families, 29 builds out of 227

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2835-rpi-b:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
200325 - first fail: next-20200326)
          bcm2837-rpi-3-b:
              lab-baylibre: failing since 1 day (last pass: next-20200325 -=
 first fail: next-20200326)

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 1 day (last pass: next-20200325 -=
 first fail: next-20200326)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 1 day (last pass: next-20200325 -=
 first fail: next-20200326)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 38 days (last pass: next-20200214=
 - first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 1 day (last pass: next-20200325 -=
 first fail: next-20200326)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: next-20200325 - fi=
rst fail: next-20200326)
          bcm2711-rpi-4-b:
              lab-baylibre: failing since 1 day (last pass: next-20200325 -=
 first fail: next-20200326)
          bcm2837-rpi-3-b:
              lab-baylibre: failing since 1 day (last pass: next-20200325 -=
 first fail: next-20200326)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200326)
          sun50i-h6-pine-h64:
              lab-clabbe: failing since 1 day (last pass: next-20200325 - f=
irst fail: next-20200326)
          sun50i-h6-pine-h64-model-b:
              lab-baylibre: new failure (last pass: next-20200325)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200326)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          bcm2711-rpi-4-b:
              lab-baylibre: failing since 1 day (last pass: next-20200325 -=
 first fail: next-20200326)
          bcm2837-rpi-3-b:
              lab-baylibre: failing since 1 day (last pass: next-20200325 -=
 first fail: next-20200326)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200326)
          sun50i-h6-pine-h64:
              lab-clabbe: failing since 1 day (last pass: next-20200325 - f=
irst fail: next-20200326)
          sun50i-h6-pine-h64-model-b:
              lab-baylibre: new failure (last pass: next-20200325)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: new failure (last pass: next-20200326)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun7i-a20-olinuxino-lime2: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-olinuxino-lime2: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-olinuxino-lime2: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            bcm2711-rpi-4-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            sun50i-h6-pine-h64: 1 failed lab
            sun50i-h6-pine-h64-model-b: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            bcm2711-rpi-4-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            sun50i-h6-pine-h64: 1 failed lab
            sun50i-h6-pine-h64-model-b: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
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
