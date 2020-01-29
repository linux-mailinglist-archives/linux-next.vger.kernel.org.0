Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B226A14C723
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2020 09:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgA2IBM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jan 2020 03:01:12 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:34333 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgA2IBM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jan 2020 03:01:12 -0500
Received: by mail-wr1-f49.google.com with SMTP id t2so19004935wrr.1
        for <linux-next@vger.kernel.org>; Wed, 29 Jan 2020 00:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FJCTGeNs7Yz9Sm5gHt1l1V7OJCzErejTB1qP4vMsuWU=;
        b=OfTSGFyO8brFoaz32kKMR81YgL8KuwdYP9hduVINEFrsR1TPYN9vpnCtLne/UhW03A
         D8iRGPniA0+wsMUYJkA5ikE9ZGoedXrOgx2Rdt2WzJy+txLecEws2ybT+m3hhg3fxgWF
         +PPDT5pma0aJstKxTCzERzs5DfzCmo6i2h7D+3Y3Fc7fsyHpHFZBR8/X20RxHpmfmg2O
         T00QuWoAH3X4d2lZW9Kvu3+PueNnT0FHw8VM9BNhzMGc06TATjyxLSaWdEy98Znt0bVL
         1rpYLiiP4DHrGdfIBbhAVDld4gpoRRm+cgtnJXYsTlPOTrF0VSD1OFBu4F/mV/ncMMmO
         FuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FJCTGeNs7Yz9Sm5gHt1l1V7OJCzErejTB1qP4vMsuWU=;
        b=auRmyLvcANmc6mxjW9jdxXdl7pLyebMCnojusKtabe1NLm5TJqbofCYsSGmKawCUeh
         u++fH+LjpIsIy6ffIAK7kbQPtrRpQWkBmHjySmWUyuJq7W+bu1J3KqSlALc1vdH/Umxw
         dhk7/4S+BhGqU7tANECR2gLOGHzmzUwLw+hpuZYlx64eO9ymM2E7evSwRcFZnXpwYrkg
         dVLvWZTFEDlnbFs+dfyTZeBZ/ho345B8cIJWhu7vrG8hgcxT92m7kN1OZVgmIa1qM0gw
         JxpLaQlhYPzW8lga8uRhOzabl+oHFuL2z4CrRW92QXzZqrmRrWwtcSaHDZRusqeFx7y4
         HBpA==
X-Gm-Message-State: APjAAAWVJCT41t/FgGuBBuQk9xK1cYtOdlL0xIsCcTgRRw/qalSdxDYt
        eOCsXSy104yv++IrgrRvME8aYzpnx2ZPNg==
X-Google-Smtp-Source: APXvYqzedbxxVPUIAe/dhRTm2Vza0eLP/eRFNZ6omCwjtpOOzaUXiuYJDrDGhNwDHDYJNwaN1+RCng==
X-Received: by 2002:a5d:44cd:: with SMTP id z13mr34372065wrr.104.1580284870326;
        Wed, 29 Jan 2020 00:01:10 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a9sm1312577wmm.15.2020.01.29.00.01.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 00:01:09 -0800 (PST)
Message-ID: <5e313bc5.1c69fb81.4be02.4b1b@mx.google.com>
Date:   Wed, 29 Jan 2020 00:01:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.5-3974-gf60232fa162d
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 184 boots: 10 failed,
 172 passed with 2 untried/unknown (v5.5-3974-gf60232fa162d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 184 boots: 10 failed, 172 passed with 2 untried/un=
known (v5.5-3974-gf60232fa162d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-3974-gf60232fa162d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-3974-gf60232fa162d/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-3974-gf60232fa162d
Git Commit: f60232fa162dc5f5f83d71775957c24976b144eb
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 66 unique boards, 17 SoC families, 22 builds out of 200

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: new failure (last pass: v5.5-rc7-273-g56dd35ec=
1a09)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: new failure (last pass: v5.5-rc7-366-g2e30f8d4=
8084)
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.5-rc7-366-g2e30f8d4=
8084)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.5-rc7-366-g2e30f8d48084)
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: v5.5-rc7-366-g2e30f8d48=
084)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.5-rc7-366-g2e30f8d48=
084)
          rk3399-gru-kevin:
              lab-collabora: new failure (last pass: v5.5-rc7-366-g2e30f8d4=
8084)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: v5.5-rc7-366-g2e30f8d48=
084)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-rc7-366-g2e30f8d48=
084)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            msm8998-mtp: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab

---
For more info write to <info@kernelci.org>
