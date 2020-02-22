Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73E8168C09
	for <lists+linux-next@lfdr.de>; Sat, 22 Feb 2020 03:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbgBVCdq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Feb 2020 21:33:46 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37054 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgBVCdp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Feb 2020 21:33:45 -0500
Received: by mail-pf1-f196.google.com with SMTP id p14so2256570pfn.4
        for <linux-next@vger.kernel.org>; Fri, 21 Feb 2020 18:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VmlBHyDjywOIpSk2h4cHnus7c34v0T7890LG0xooKxg=;
        b=YI/Yu2GI19Q83QLlGEuItkoYPP4JVHAlO/xrxIosSlkuuhvNs9I5e2NxX95rIbi3OK
         sMwDEN5LScj5McN+wd2Wuq1OrYpOUzR5jBlTSO1DNy1yZDhWRQ9l2Lhw2yOtJo+XVGrz
         NyopGsknf2MAitB9Uepz4sQLHka0KQKNED6DSKzl5UDcG/EAQnK8MqMw4NcYllom6GJ/
         fhrsMOOGqBysttzNKEnqcaRcbefr8sfytfWtLQA7R+LOHL8a6VdcYCTofB49wDKFi/BY
         GNtIptkEg6jJWTqUEFmtkavCQyMAZ2ixVyl+Ilf/mSKL/1fYSXLOwtZNaXWcEC6hgbyP
         qWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VmlBHyDjywOIpSk2h4cHnus7c34v0T7890LG0xooKxg=;
        b=lcnPKjcbfhDNZ2pN/o4wJzXS4rzfV3URsRGlw/QnCK9IQca7hJlxFMrq32j1pZaa9h
         xWnd60FbC+KANomoPl9xpbQon+GKccFknu/a76QVruxF6p04MftP4qNT3umHND6KmoBN
         zhb7HQ63R38olayd9MrzCQnzr2fyYICm/xbMNH1JR1oh0X/pUdgy0U/WF5AyRhFwo2MO
         wHUwvq65LMDi6Fip907Erww831ypT9g414dgVrmLSCW/MdHw8p/aMPrlStOT3c2Vme+N
         B+I4mfQaCjkIJ7/oMGGod5HkRhjgdUn9lj/W04XmfZh8sJF4o4NsiCbd3Fur9+gwBTRa
         oyMA==
X-Gm-Message-State: APjAAAXNoQO1R2jZk+bddjh1FfDdgc1zbS6GmXpIR1kkXkSCPvxuRaCC
        Iqx0k9pnYj7byJHzDoHO4HVa5U98q3M=
X-Google-Smtp-Source: APXvYqzfw3FL43/6ENWGtcLFV3ViboEEpu3o+5viWDJKluxXlZn6o9iI58NOJ5i04X04IqkO/yk4zg==
X-Received: by 2002:a62:790e:: with SMTP id u14mr41657004pfc.174.1582338824746;
        Fri, 21 Feb 2020 18:33:44 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t28sm4230720pfq.122.2020.02.21.18.33.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 18:33:44 -0800 (PST)
Message-ID: <5e509308.1c69fb81.3705.dc22@mx.google.com>
Date:   Fri, 21 Feb 2020 18:33:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200221
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 69 boots: 26 failed,
 42 passed with 1 untried/unknown (next-20200221)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 69 boots: 26 failed, 42 passed with 1 untried/unknown (ne=
xt-20200221)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200221/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200221/

Tree: next
Branch: master
Git Describe: next-20200221
Git Commit: bee46b309a13ca158c99c325d0408fb2f0db207f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 33 unique boards, 14 SoC families, 12 builds out of 133

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200219)

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200212)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: next-20200213)
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: next-20200213)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: next-20200213)
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: next-20200213)
          sun7i-a20-cubieboard2:
              lab-baylibre: failing since 3 days (last pass: next-20200213 =
- first fail: next-20200217)
              lab-clabbe: failing since 3 days (last pass: next-20200213 - =
first fail: next-20200217)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 3 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-a33-olinuxino:
              lab-clabbe: failing since 3 days (last pass: next-20200213 - =
first fail: next-20200217)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: failing since 3 days (last pass: next-20200213 - =
first fail: next-20200217)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 3 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 3 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 3 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: failing since 3 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h3-orangepi-pc:
              lab-clabbe: failing since 3 days (last pass: next-20200213 - =
first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-cubieboard2:
              lab-baylibre: failing since 7 days (last pass: next-20200212 =
- first fail: next-20200214)
              lab-clabbe: failing since 7 days (last pass: next-20200212 - =
first fail: next-20200214)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 7 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-a33-olinuxino:
              lab-clabbe: failing since 7 days (last pass: next-20200212 - =
first fail: next-20200214)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: failing since 7 days (last pass: next-20200211 - =
first fail: next-20200214)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 7 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 7 days (last pass: next-20200207 =
- first fail: next-20200214)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 7 days (last pass: next-20200212 =
- first fail: next-20200214)
          sun8i-h3-orangepi-pc:
              lab-clabbe: failing since 7 days (last pass: next-20200212 - =
first fail: next-20200214)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200219)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

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

---
For more info write to <info@kernelci.org>
