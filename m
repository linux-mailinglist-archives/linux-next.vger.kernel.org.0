Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4C0198526
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 22:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgC3UMT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 16:12:19 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:37410 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbgC3UMT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 16:12:19 -0400
Received: by mail-pl1-f180.google.com with SMTP id x1so7179799plm.4
        for <linux-next@vger.kernel.org>; Mon, 30 Mar 2020 13:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=T2NHDEm2F4UI5c9tNJ0H4l5GCrRH0MULN5O0CqevR2I=;
        b=INAJO1EhSbzQ2MxUUVzFSq63+iNU2hHbqROKAsW9LwwJGgMZJTVGFIS7Cacj2wfg5L
         f6youb8D8moaOiKVB6TkyX89gHGIJR1rfyalcXoNS88Gxsk3ymeeISoYSAWuPGL35e6P
         cmZZAaMNi5VaEpkV5siqxmuaT6DcBzCnPg8yRSGlitumt/qyzIHKAIkTnu1Bta+LNgGb
         7UJcPv8bRmdW+jiwgv6UHcBk6Z3NpiBrODsC5Euz3IXuFE8Q/y4lVS+RFxZ2ceOOaHA0
         0jJewF1Kuvk35F4NtYMbKpuwxrj2mtlcWPLpq19ttdsRJL578LieRlBRViPBEoREczvT
         6fSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=T2NHDEm2F4UI5c9tNJ0H4l5GCrRH0MULN5O0CqevR2I=;
        b=muEMc266RlPG50wxaIxpeN4bgDtYd8BJy0KJ+ULs9ZQLRl+K3UJyIN0i2U48vP3unK
         rdySXFhO69cAjSksjFseylG8laOg2DMUNX3dV3Wy8IYjvDuQxhFUk3dwF14K8qGNoGFc
         lhngyCB1jI5Vfvf0LN96segl3hNCmopQ3nEriVwB/O2G4x2NcJebMKrDPZvr1hMcYDRS
         dpk1RvDlXWV1f3V4D5s7A6A1QY9NMqLeB3NhJ0HOoATxe5F4obK3RSEojFSwti4ryu7w
         +SFoOZSBGAH8c3qBhLARW8c7DcTWXMX4IehUZV7Cwx9+i6JznXGlVnPUvELU1P5sY4Ai
         hxNA==
X-Gm-Message-State: AGi0PuaX6x+0o5RrFzZ1onRu21Wd3rHqiOWBpGsOKVeTd2aKYEMR7jZf
        n4dQBNPfnw924ytKsxRCjAu+yGpWpFQ=
X-Google-Smtp-Source: APiQypLq3uyp8g2ny7/+axypRCygmQYieHD911ylQGAeacN9demPVMhp6BeRbIM3XOWKGCYbfVtQxw==
X-Received: by 2002:a17:90a:e983:: with SMTP id v3mr903670pjy.62.1585599137860;
        Mon, 30 Mar 2020 13:12:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x70sm5464053pfc.21.2020.03.30.13.12.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 13:12:16 -0700 (PDT)
Message-ID: <5e8252a0.1c69fb81.76f06.8832@mx.google.com>
Date:   Mon, 30 Mar 2020 13:12:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200330
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 278 boots: 5 failed, 265 passed with 2 offline,
 6 untried/unknown (next-20200330)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 278 boots: 5 failed, 265 passed with 2 offline, 6 untried=
/unknown (next-20200330)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200330/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200330/

Tree: next
Branch: master
Git Describe: next-20200330
Git Commit: 27a8b6c16291760cfb7d955c58d8e34dc27ec9dc
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 107 unique boards, 25 SoC families, 30 builds out of 227

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 10 days (last pass: next-2020031=
9 - first fail: next-20200320)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 41 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200303)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200327)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 3 days (last pass: next-2=
0200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

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
            exynos5800-peach-pi: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
