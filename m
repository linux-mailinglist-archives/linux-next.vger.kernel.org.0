Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C841DDCAB
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 03:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgEVBbK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 21:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgEVBbJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2020 21:31:09 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0CDC061A0E
        for <linux-next@vger.kernel.org>; Thu, 21 May 2020 18:31:08 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n15so4279176pjt.4
        for <linux-next@vger.kernel.org>; Thu, 21 May 2020 18:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AoCEB/XhWyAYIL8pIPDnfWFrF3Jmha7WYt/Zzkq9oTY=;
        b=m49eE4sI4TmcKbuaUTgukhQcDaUd6guzjRrQ/6joi1gkb7Q+Ma5MsgzM/1HWykbFUs
         NbFjyN2cg0wO4/O7Tddp+gAsymZMHMG1YA4TTKC4gfBWekS9cFaY6YMBIIrdhqx42r3Y
         ZPq237f2M8YHwIRqQOW4X5C1ifA0wI6/mCfryOK/Zp+0cajPcj6VkRsuB2gDwjesU5zM
         Qv41oCW+iT4MFlsGeECr1FMyp9f0abOdD31uqANncUMPGbCEjnD0VAc1+2jRU+cwFsCS
         L4a9zps9mbdJH6qSMDtbJym5llciBKBdaHV9nar80r0jq+8AukIGNRGs4PYgR8iUy1XH
         Y/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AoCEB/XhWyAYIL8pIPDnfWFrF3Jmha7WYt/Zzkq9oTY=;
        b=k0aHFf/ef0BHlQfrLOfSWw8CyLzrmfi79YzxjIB34aVMnAtyu9z8v/Pi9kFOu+rnLg
         c7E4uxdnWUa+HQKZg7w+TvAN7SNLcndgPSZugkeodMwDofscTMP9CwTj1Q+LFkt9QoSg
         IjUiJ4LPnS6NfNEfFon42qS0fLUIra5VELqsB9zlotD5lwqsPQn7/FIiyj7zaMX9DucE
         1nAOu/K6S5Z3KsIrxOyB9CDgNBltLc0ZPoi8U50Cpi+5zbCN8ISd2mwD2xSpivKEsW08
         /CTMBAGiAHqsdQJgGnSVaHrfKFFc+iVPnJ/H+iEMLmE6OSmxZiiS1mZbKUhX02O6usP1
         6naQ==
X-Gm-Message-State: AOAM532Z1L3IGh6XI6P92TyfF+MxQ3TspzK91u/f3jezKgfcxRnjjdeh
        orYphAP+8W/InbaWYDFKNp4UsFzzgD4=
X-Google-Smtp-Source: ABdhPJzL9LmqO7vHPZY6NVDR0JTBpOFoLvQALoGK736NpakLJdmMcqAgeoNN2QiREiL7oblykFKy5g==
X-Received: by 2002:a17:90a:7b8b:: with SMTP id z11mr1663548pjc.234.1590111067534;
        Thu, 21 May 2020 18:31:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a16sm5303610pjs.23.2020.05.21.18.31.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 18:31:06 -0700 (PDT)
Message-ID: <5ec72b5a.1c69fb81.4dfec.9515@mx.google.com>
Date:   Thu, 21 May 2020 18:31:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc6-239-gc0a2bce73a89
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 246 boots: 10 failed,
 228 passed with 4 offline, 4 untried/unknown (v5.7-rc6-239-gc0a2bce73a89)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-rc6-239=
-gc0a2bce73a89/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 246 boots: 10 failed, 228 passed with 4 offline, 4=
 untried/unknown (v5.7-rc6-239-gc0a2bce73a89)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc6-239-gc0a2bce73a89/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc6-239-gc0a2bce73a89/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc6-239-gc0a2bce73a89
Git Commit: c0a2bce73a890bc0d4d9e12f3293b120a36ae62c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 25 SoC families, 30 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 10 days (last pass: v5.7-rc4-407=
-g604da24420e3 - first fail: v5.7-rc4-552-g1e823790a7f1)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 97 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          imx6ul-pico-hobbit:
              lab-pengutronix: new failure (last pass: v5.7-rc6-175-gcf2c23=
3130ca)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: v5.7-rc6-175-gcf2c2331=
30ca)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 16 days (last pass: v5.7-rc3-277-=
ga37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-rc6-175-gcf2c2331=
30ca)

arm64:

    defconfig:
        gcc-8:
          sm8150-mtp:
              lab-bjorn: failing since 20 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.7-rc6-175-gcf2c233130c=
a)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: v5.7-rc6-175-gcf2c2331=
30ca)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 41 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

i386:
    i386_defconfig:
        gcc-8:
            qemu_i386: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            imx6ul-pico-hobbit: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
