Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6CF1AC1CF
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 14:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636036AbgDPMw0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 08:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2636287AbgDPMwV (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 08:52:21 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA3EC061A0C
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 05:52:20 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id nu11so1334241pjb.1
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 05:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kQRaYFPe4g5wDSsedYWlO3CCokR4+ViiRMNDjTt0Yrc=;
        b=rj6gu+664gjPr/KgpjW72b4p8PCgKu0rKuEv2ND5/8jpwe3AJwVE9zCd5yDBjDphDu
         UQNHdZqRsco0CcHpnRtehGJ6noIwtvDgR1LyOzHXKkXESyGt3glIp8+T7UTs/zAPIn4P
         9UBA7pKao0204+IBK374FErsrC3n277ESqsn11JPDnHwXxQPAircDicRXQo0B81F8hcg
         Go55gltE/qmdT9aNVrsKlYiLE1kMoLFpe15ejUQunJxc77+8B41xctVDucOlHxtPjmBW
         HsL9BL5f4EUYFuZPLWJFRwob3n0k4CCZQNrI7D1HCQjaHcMD5qosyxxkhd1spq6vNi5E
         GdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kQRaYFPe4g5wDSsedYWlO3CCokR4+ViiRMNDjTt0Yrc=;
        b=psi5GSyz0WHXXcaKfiL14xcOdY2fRqfsoZaeWx9l1f6xGtBWr7hNfr+lCr6t/2Zz6g
         CA5a7GOCHUzHcLnBx0RCAt5+yyjnhJeWO1dO0C2NcEet7jO17TNf9nZIqdAuo+R4D1NU
         zFjA/ZWnK0jl+YBBDldjl3MnkzgmEkJIrq5HAyWlewCeoqTTGFW1pg/usaiHJkwON6OK
         5k34fcy4yAnWhz/+a3/1rKfp8nntt1bwn4Y6WCN5ZoFuonXbLrfsMpIF5XwB2gF9+Sz5
         +H4cvc41RRx1oIZGIYltbCbJhG8n85hds82rsoMgFfbJIaAOgO5YYNAuqY/IZnvd1gti
         0KPw==
X-Gm-Message-State: AGi0PuaJa3vF6LwREK3TFnADblyS9VHlUVCu9WPu94s/RJihhT8ck93M
        wIqGtzXKc7C6mxrVkHmCiLnKhJc5SQ4=
X-Google-Smtp-Source: APiQypJL5YlLYl8IdxLJHYb+na89U9+/ZZD+6EcN0zas23IixsaAfEuTMQlWYgJCUVbtwNd44ke67g==
X-Received: by 2002:a17:90b:3014:: with SMTP id hg20mr5101963pjb.56.1587041539480;
        Thu, 16 Apr 2020 05:52:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kb18sm2800355pjb.14.2020.04.16.05.52.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 05:52:18 -0700 (PDT)
Message-ID: <5e985502.1c69fb81.d4452.9399@mx.google.com>
Date:   Thu, 16 Apr 2020 05:52:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200416
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 280 boots: 6 failed, 266 passed with 3 offline,
 5 untried/unknown (next-20200416)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 280 boots: 6 failed, 266 passed with 3 offline, 5 untried=
/unknown (next-20200416)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200416/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200416/

Tree: next
Branch: master
Git Describe: next-20200416
Git Commit: a3ca59b9af21e68069555ffff1ad89bd2a7c40fc
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 108 unique boards, 25 SoC families, 30 builds out of 228

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 58 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200415)

arm64:

    defconfig:
        clang-9:
          apq8096-db820c:
              lab-bjorn: failing since 2 days (last pass: next-20200412 - f=
irst fail: next-20200414)
        gcc-8:
          meson-g12b-odroid-n2:
              lab-baylibre: new failure (last pass: next-20200415)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200415)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200414)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200415)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200415)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 19 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab

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

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
