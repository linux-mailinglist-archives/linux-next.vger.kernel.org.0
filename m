Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00FEA1A5E03
	for <lists+linux-next@lfdr.de>; Sun, 12 Apr 2020 12:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgDLKWT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Apr 2020 06:22:19 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46224 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgDLKWT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Apr 2020 06:22:19 -0400
Received: by mail-pg1-f193.google.com with SMTP id k191so3178520pgc.13
        for <linux-next@vger.kernel.org>; Sun, 12 Apr 2020 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9FcW7h73qHrQX8rDi43pNIORbPPTupa1Keeheu35aSY=;
        b=ooqGmVcp6SHsV0ha1kPakqLGAfQRfUFNUKHUC8pHVc3pHJWNe0xve+ko9tiAI6uB0c
         /1biLcLFuZgBsqftVoqNWLKRl80hNsBw34tcWF3EgV0FuvYmuL3rE9jR48SfII4pBCEH
         K25AASB6rMnU9OoV129RT9Gtk2i2Z8oYkIOnuso8Xm26isS2+4FRd76QhrjdRU2SaQ3o
         pDwqHJkLBiM47xaYP03+9nLkpjL0zbj8ekDhejK3QWbl+JQUnnocPhVB43HpMaJ9CTj0
         GRc6301dk8drZzuAY1AaPrP/0lBWHDbVN/LO9rWXrf2ZUo1Y0EByRRzwInnD+5n+cQTu
         kNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9FcW7h73qHrQX8rDi43pNIORbPPTupa1Keeheu35aSY=;
        b=C0fKYxDIsOxnij1IBbfaaRCU3PF5sYs+Xxo0SU7N1/l5dSN8blpEPZ2SAnGBizNzKQ
         UQIuOJhcc/Y87rfCMVyWv8jKWjN5agSY9N8wfMw6Wh8XUhtc4m0Tq/tJaW0uaVTiFyz9
         9Ljwz5S9wp7l9IslrpA5KJHnS5bYJ5qgD33mZbYCRjqHkiPo3CBbyya5t7New+X/V5FJ
         iH8cJ7kMT2py5J3z9FSoJ3PXi3YL+KD3QRp+34yDJinmf/WKFu+f1HcSGYbnzVeRG5sT
         FuEZU8OFoUB8WzG7lhub/j1rl/SDSgu6rUSb9GnPLyx0KlvwC7ykJ8pgMWFK2t8po6Z+
         6rSA==
X-Gm-Message-State: AGi0PuYSwTBwgNZW0IyRy8V2nEq2v9uxDiZZkJU7Wz6TfTY9uil0Dl/z
        n9UIhUTPUkizby5PywdAYtAYn6B36i4=
X-Google-Smtp-Source: APiQypJEk8vou+gYyzZ7uuj9nOYiiJo4y8m+W0CB4gaDzUmaSC4/o6mB7SI6gDfAk7JeevzNfCjahQ==
X-Received: by 2002:a63:df0c:: with SMTP id u12mr10218411pgg.387.1586686938702;
        Sun, 12 Apr 2020 03:22:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f30sm6226298pje.29.2020.04.12.03.22.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 03:22:18 -0700 (PDT)
Message-ID: <5e92ebda.1c69fb81.5bf4d.42d0@mx.google.com>
Date:   Sun, 12 Apr 2020 03:22:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200412
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 264 boots: 3 failed, 249 passed with 4 offline,
 8 untried/unknown (next-20200412)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 264 boots: 3 failed, 249 passed with 4 offline, 8 untried=
/unknown (next-20200412)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200412/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200412/

Tree: next
Branch: master
Git Describe: next-20200412
Git Commit: d2a22790db7075dbd0738d24d1c5ee4611421c4c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 24 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 54 days (last pass: next-20200214=
 - first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20200411)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200411)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200411)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200411)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200411)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200411)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: next-20200411)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 15 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

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
