Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779971BC41D
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 17:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgD1Pwk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 11:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727920AbgD1Pwk (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 11:52:40 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3071EC03C1AB
        for <linux-next@vger.kernel.org>; Tue, 28 Apr 2020 08:52:40 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id h69so10507652pgc.8
        for <linux-next@vger.kernel.org>; Tue, 28 Apr 2020 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7XSF2iOV50CF7tjhJlo4K8ikRYzWZ/yOLvp5LP7/3K8=;
        b=GA7oXw/X8eYYy4d6+QCqmtq5uoNtce2xZQbTeMDA+woZUofwv05VeZ/aUALy+Uw4iJ
         AocZp9TQfoIFO0mQTWKDll/wVrN9rcrsTW3Rib4mMZZfwSerCDaArvacycyfcB5PR8eE
         /uBCmKYdiHc8vlnp4CKMUUkbDyIXuXqR7sGO6kZdZ/mlBI1TIeVW301PpHUwGzxhpid2
         nBH0fUlZFv7f8Wgz7x565sw/WL5AOYuCspS0l1kt4EQJ8nBZalMttorSfiKn4W1ZaQq3
         MBhPyjL1z2+M8833f6cNtC70rdPe7KltEea/NShqZLdpnxDH77ZXS4PmtOXzs4bFPML6
         90mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7XSF2iOV50CF7tjhJlo4K8ikRYzWZ/yOLvp5LP7/3K8=;
        b=PBjAy+UhhYLi+KgptBaukKBWzypgkHNVJmJ8PPaS/iM36MiM6NOUMHtOZwzxIW3U8O
         Ay82M2wOdrx+5Fe4RnPZU3hyBwO0KjskFd3/k2GVMQ9sqgnPfB+bjJ9fj1h0fz9tMEey
         JuG8SbeDDUYSkU+ZFDQBj18mH67tApTwVPGSpOHZUAIv8Ni55aIGUcVLbneJ64mxdLOi
         MKhWZfsiUhuwyjGIQKwyZVgnL6W4MGgqqcj4nbthm74GNgWRfqBbk1tjhBhKfWaNIGbB
         TIYiRSadUh9wN8rNAtgCuHv2qwxECJM1Y2VEmC40tQXJ8pyMYtqWTTrjwv8lqNd1lv94
         hj2A==
X-Gm-Message-State: AGi0PuYYGHauCB/q0pN49rQrdQSq+bUT1ViMBxm7WmqW0YOWGxETGGe2
        bauiyYwdndFiaJTFCgFeLRzNB6gRZvI=
X-Google-Smtp-Source: APiQypInvkunl/d7g9DnJkEa/4ukW3PfFNbAhTSC9RrVUXbO59L1ZFwBj34h0rZxwVjXACz2//FjeA==
X-Received: by 2002:a63:1a1e:: with SMTP id a30mr27940807pga.368.1588089158763;
        Tue, 28 Apr 2020 08:52:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 202sm13460507pgf.41.2020.04.28.08.52.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 08:52:37 -0700 (PDT)
Message-ID: <5ea85145.1c69fb81.437cc.1dfc@mx.google.com>
Date:   Tue, 28 Apr 2020 08:52:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200428
X-Kernelci-Report-Type: boot
Subject: next/master boot: 291 boots: 7 failed, 267 passed with 5 offline,
 8 untried/unknown, 4 conflicts (next-20200428)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 291 boots: 7 failed, 267 passed with 5 offline, 8 untried=
/unknown, 4 conflicts (next-20200428)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200428/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200428/

Tree: next
Branch: master
Git Describe: next-20200428
Git Commit: 0fd02a5d3eb7020a7e1801f8d7f01891071c85e4
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 110 unique boards, 25 SoC families, 31 builds out of 231

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20200424)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20200424)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 70 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200424)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200424)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200424)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200424)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200424)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200424)
          sun50i-a64-pine64-plus:
              lab-baylibre: failing since 3 days (last pass: next-20200417 =
- first fail: next-20200424)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200424)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200424)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200424)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: next-20200424)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 32 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            imx7s-warp: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    x86_64_defconfig:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    x86_64_defconfig+kvm_guest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
