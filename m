Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA8F61502AB
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2020 09:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgBCIeK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Feb 2020 03:34:10 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:42780 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbgBCIeJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Feb 2020 03:34:09 -0500
Received: by mail-wr1-f41.google.com with SMTP id k11so16736207wrd.9
        for <linux-next@vger.kernel.org>; Mon, 03 Feb 2020 00:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZIjKmOjUjKeV9qsnmgOBey7EIR4OrA6X9XoBjD4lxws=;
        b=YzQee9dukLnWSgS3/zehly443I5CUS0eO5m4Ac/N5bAAHfnL9TVzjNEWXKnEYS+DkE
         nKoIX36b86YRXQt4eK3vUpJ8/nytsS3K/xhJXRbromHPop68JolHSthFh6dSrTcNK+zT
         uHAk0hXenBcDmxeNXKIcvC8gk5XsEwnqHBz5XHWQGBuqI+0qakqESpL9XVikVFtosao7
         2+R+ULYFaRh9+A8cSuT+NU+dqaa+S7Yr+D0xv4z2f8x5tuKSbN7WDW/g5xCb6/unliFE
         vJEHASmWhREJ6Nu7fI2iBY+Q9RZEo05F9UxOODGuFWKy3Q7ilQ7C/qcyTQq4O7ctWlSO
         5Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZIjKmOjUjKeV9qsnmgOBey7EIR4OrA6X9XoBjD4lxws=;
        b=JR3Hu4LvJerUaWJPqOFWy4sCDHodl/eBihgWbipZJigANYBQU5QQLmFkzjzpniJidS
         AUTKT+cVjoWNdA9NlcqDKNg05nh8Xwn5urKcjSZIJpE3M2jqUyg1+O0dIX6gTkxFqbYY
         hWidfGMCsuaLNHAKom4fkBaPJl/VEXCSW5xrQWrKFYn6OHnD2mS47qvsCSzs9Zs/EX9k
         ADkr3DBQktuqkfAa4QvjAytyn0P6h5P0V+3lWvRPwtSnjCWleypx+S8pDzYDP0YL3yTF
         5xp0sYOf1ecn8NBiFxbl5tee5eXpm9ydRulxNNpwYffHsbT3O/CkwvrtPhb2Ai9hQm5p
         Uu2w==
X-Gm-Message-State: APjAAAU4hYqWHD96gz+O2whn7MDEmh7pC3R7chUFeKAXeXDy/hqJ6DUY
        UfI5FnCNIs5zqdGfK4FL8jXE6pPh1Co=
X-Google-Smtp-Source: APXvYqwSk3Bsqs5b3JyZQfnF4XMi3m+Db/ndUq3QaFnvmJCPpOvgQ2idyNkbJ8HMsoZqGD1+SprZyA==
X-Received: by 2002:adf:f288:: with SMTP id k8mr14953647wro.301.1580718846335;
        Mon, 03 Feb 2020 00:34:06 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a9sm22275975wmm.15.2020.02.03.00.34.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 00:34:05 -0800 (PST)
Message-ID: <5e37dafd.1c69fb81.4be02.f324@mx.google.com>
Date:   Mon, 03 Feb 2020 00:34:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200203
X-Kernelci-Report-Type: boot
Subject: next/master boot: 255 boots: 10 failed, 238 passed with 6 offline,
 1 untried/unknown (next-20200203)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 255 boots: 10 failed, 238 passed with 6 offline, 1 untrie=
d/unknown (next-20200203)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200203/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200203/

Tree: next
Branch: master
Git Describe: next-20200203
Git Commit: cee5a42837d4a6c4189f06f7bf355b97a24c3c93
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 25 SoC families, 27 builds out of 202

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          mt7629-rfb:
              lab-baylibre-seattle: new failure (last pass: next-20200130)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: new failure (last pass: next-20200131)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200130)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 2 days (last pass: next-20200130 - f=
irst fail: next-20200131)
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200131)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200131)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20200131)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200131)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200131)

Boot Failures Detected:

arm:
    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab
            dm365evm,legacy: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            mt7629-rfb: 1 offline lab
            tegra30-beaver: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

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
