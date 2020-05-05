Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2658B1C60D9
	for <lists+linux-next@lfdr.de>; Tue,  5 May 2020 21:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgEETLh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 May 2020 15:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgEETLh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2020 15:11:37 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65012C061A0F
        for <linux-next@vger.kernel.org>; Tue,  5 May 2020 12:11:37 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id q124so1424913pgq.13
        for <linux-next@vger.kernel.org>; Tue, 05 May 2020 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Rdd8fZNcNXUZCK0sb032pUF3lqRB/ryA8COlXpgttwY=;
        b=qe0KtnVfDNPcoKYZfUHdmy1d8M8Y9HJ4OXqFvcussctIAOALo1sD63rnJnLJvhck9X
         ARaKzCFkn2UT4I6yLuXsl9VwxBBRaPZnjRT9Q1f0pzEiF2bzDbmqtbRpZqdUN2PNPhPL
         jCkiNFAFrgCyzSZg8T3IlsAxRkm77lwJh7xoq6/iGfKK5mArJ7fKzkyC9QmTRQL21SoG
         Ir33xE/9z+a7lsfWHdDdb4B84xLafCEIyOXtJXSdpHUT9nU8kqt6kwgojFa2TnKhenUz
         WMcv1gQfrTWM2nNa3iUuxeqDsTV4iKLlQsxRTK4enOMSoUxxLmsnhTCtupY4BVY1Q5je
         V14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Rdd8fZNcNXUZCK0sb032pUF3lqRB/ryA8COlXpgttwY=;
        b=ZvnSKLknuZd0q6zLR3maV5S+g2TziXNt02+zxYIAEL7lbh3Cv+ggsJoMi0oTINkWj8
         YA8eq2rfyRq4GVLVSwfRD/V51vrzmGKOgHgDgMfvbFYonk3HqPsvD1OEVrrnevToVOU9
         +gvKablXGvLT766tUkP0lZI/oZHT03l2l4m6IAH1Su08TlbdGWKDhYHTCKpBc9MdLh1i
         NTfqYtIgr1E4tQm5i44VC4VCRLj4kjVe04quufacOKIx/8N1vfxf0gRdOW1aOi3JpSIc
         /YXB2ed4t/1tF9OvOzmTOmzjU1B2jOPR9VMQzhl2Ru6uKzW96+pM1lRrns9DB6MnetSz
         +3fQ==
X-Gm-Message-State: AGi0PuYKDpHiaBQ7t5EoOPqHFHB139yzfQVttPXqV8ElAF/8FKs7+ZFh
        9apGILIxMBiqJNoK7rk28wDIwIMz2Bo=
X-Google-Smtp-Source: APiQypLnO1FgP4QXp/UP8C8JRhj70wF7fy6xEKBm+uV7xugmke7rjKOkVjcSN82UzeopnOD4E0CaPA==
X-Received: by 2002:a62:6d03:: with SMTP id i3mr4388902pfc.249.1588705896352;
        Tue, 05 May 2020 12:11:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o9sm2725438pje.47.2020.05.05.12.11.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 12:11:35 -0700 (PDT)
Message-ID: <5eb1ba67.1c69fb81.6f314.97cc@mx.google.com>
Date:   Tue, 05 May 2020 12:11:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200505
X-Kernelci-Report-Type: boot
Subject: next/master boot: 267 boots: 9 failed, 243 passed with 5 offline,
 7 untried/unknown, 3 conflicts (next-20200505)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 267 boots: 9 failed, 243 passed with 5 offline, 7 untried=
/unknown, 3 conflicts (next-20200505)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200505/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200505/

Tree: next
Branch: master
Git Describe: next-20200505
Git Commit: 7def1ef0f72c3ebe3e42467d2f73c4e56153fa49
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 25 SoC families, 31 builds out of 231

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 77 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        clang-9:
          sm8150-mtp:
              lab-bjorn: new failure (last pass: next-20200430)
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200504)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: failing since 1 day (last pass: next-20200501 -=
 first fail: next-20200504)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200504)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200504)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: next-20200504)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 39 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200504)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

x86_64:
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
