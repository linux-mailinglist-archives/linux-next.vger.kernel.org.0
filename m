Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08A5161DC8
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2020 00:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgBQXUv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Feb 2020 18:20:51 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]:52828 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgBQXUv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Feb 2020 18:20:51 -0500
Received: by mail-wm1-f47.google.com with SMTP id p9so941708wmc.2
        for <linux-next@vger.kernel.org>; Mon, 17 Feb 2020 15:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IXfFT9w4NpT/Fdov76FMynTFMdTjyuOwBLGkvr34+NY=;
        b=sCXiN1EjBKrYxAeOBva7J5GQqx9+SBLLbYSaklp5bp/KnNWOLBv0bmoApc5ufDWEtN
         bjE8PH6fgnERiaP7Wp3lqirV+Z2Ckuqx6yBfbBA5d07zfgd7dibtZqj7GVhnCygOXiXy
         Z8GFa9CQzSawS6Cop8Bd2Q+Q9WLazlkdI2gCDgG8XiGFsgXDvQXjNCHY9ov+Bto+CyLT
         RdKlxQhN45QRtnMmCOfrjbCjdSh0QtPBo0oX8ueAs4oj9pcYBqLTznjNMzApzdrN9GX4
         q9KgnV83RsWZHrdk5c0L65tHCqDQnaTdxqhD3JTx5Yuh3KWo5GhgQtPXx5pMHClmnpbu
         5nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IXfFT9w4NpT/Fdov76FMynTFMdTjyuOwBLGkvr34+NY=;
        b=Io7exOsba8JW+Oa5yRMfQwpaakDTjKsfaI0++yZ6I4dOjEXNVP6bWAEVmM7sxnOH1O
         icIJ7cAPmEVnnC3WCETeMESNrcottY3+U8jdxVaqV8DTsoNUdkjBvnVNCOjspIn7iQJn
         CrRem2MV64oVhfqOj7SbzE8GpfDy87BxkPN55L+cLMNscay20Au2RsWJK8P/zAbtTCPK
         keuTDrh0yH0eVT6fpYAIeKTJHxRguxocTzo9VPTStaGECBDzsedT5negFLzEFHWJjFAg
         K0ZN6l+ZHhJ5to8lFPHbY1zqS0I/o+erZDoxe3yxfICvCKONyeNDesk/P+77/HJ5+Fjn
         Ixug==
X-Gm-Message-State: APjAAAWw9HFb3CCmT+D4zatC2y0iojUKyREIk/m8SLL/jNzwO9Y/PXDr
        VkeNQsZFRjUxC6/8i8zOJUvLq8YFijvOIQ==
X-Google-Smtp-Source: APXvYqy6PVbU5lh6sX6oC0ab3P7KZQO3p+Ebc6DK/HFqCwADDGJKA3QxQjshe5IjnqB0LXJ8K0UyEA==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr1162577wme.153.1581981648861;
        Mon, 17 Feb 2020 15:20:48 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e1sm3204787wrt.84.2020.02.17.15.20.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:20:48 -0800 (PST)
Message-ID: <5e4b1fd0.1c69fb81.28880.f10c@mx.google.com>
Date:   Mon, 17 Feb 2020 15:20:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200217
Subject: next/master boot: 155 boots: 35 failed, 113 passed with 5 offline,
 2 untried/unknown (next-20200217)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 155 boots: 35 failed, 113 passed with 5 offline, 2 untrie=
d/unknown (next-20200217)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200217/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200217/

Tree: next
Branch: master
Git Describe: next-20200217
Git Commit: c25a951c50dca1da4a449a985a9debd82dc18573
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 20 SoC families, 16 builds out of 168

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-cubieboard2:
              lab-baylibre: new failure (last pass: next-20200213)
              lab-clabbe: new failure (last pass: next-20200213)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: next-20200213)
          sun8i-a33-olinuxino:
              lab-clabbe: new failure (last pass: next-20200213)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: new failure (last pass: next-20200213)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200213)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20200213)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: new failure (last pass: next-20200213)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200213)
          sun8i-h3-orangepi-pc:
              lab-clabbe: new failure (last pass: next-20200213)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: new failure (last pass: next-20200213)
          sun7i-a20-cubieboard2:
              lab-baylibre: new failure (last pass: next-20200213)
              lab-clabbe: new failure (last pass: next-20200213)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: next-20200213)
          sun8i-a33-olinuxino:
              lab-clabbe: new failure (last pass: next-20200213)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: new failure (last pass: next-20200213)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200213)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20200213)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: new failure (last pass: next-20200213)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200213)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20200214)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: new failure (last pass: next-20200214)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-cubieboard2:
              lab-baylibre: failing since 3 days (last pass: next-20200212 =
- first fail: next-20200214)
              lab-clabbe: failing since 3 days (last pass: next-20200212 - =
first fail: next-20200214)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 3 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-a33-olinuxino:
              lab-clabbe: failing since 3 days (last pass: next-20200212 - =
first fail: next-20200214)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: failing since 3 days (last pass: next-20200211 - =
first fail: next-20200214)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 3 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 3 days (last pass: next-20200207 =
- first fail: next-20200214)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 3 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-h3-orangepi-pc:
              lab-clabbe: failing since 3 days (last pass: next-20200212 - =
first fail: next-20200214)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200211)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200213)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200213)
          meson-gxl-s905x-libretech-cc:
              lab-clabbe: new failure (last pass: next-20200213)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200213)
          rk3399-puma-haikou:
              lab-theobroma-systems: new failure (last pass: next-20200213)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20200213)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxm-q200: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

    defconfig:
        clang-8:
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
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
