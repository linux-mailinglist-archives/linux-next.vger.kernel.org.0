Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078D91D28AD
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 09:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgENHZD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 03:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgENHZC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 May 2020 03:25:02 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9631AC061A0C
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 00:25:02 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f6so910906pgm.1
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Z4kAadl6n75GQ6LIut0gOWc+eQIVbj3qrl9OJYFn3Pk=;
        b=n53KW8+URBb8jbHgKgltnmkfZ0xVgEa2VmgXhjHiBGEV4vp91xg8EJsG8JIdd7LZ4W
         QF7iBwV8/nlwNhsINccbXQCnJH2AWZL8J3hkfKK9eIYbaAZqDZ7h9Z3vQh0aAZHE8Ql/
         WWT3xQK6ZXewnXGoyuE95a1JTOgxRU2u5OS3Km3JU3pOMc6i2zFIAr5LoWIyA8Q08tCs
         LzRwSkltNwfQsngsbc+wixKY8Sr47dFadF8oP2wQ7CciuqiizSw4kYHVsjcdXAIQQRBO
         ni00kKgsil06hBr2T33bOyGmaFxUG38ZPssVZJ9e9OT8abVTDMnrw+OPIgrPwMF1Gxet
         g8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Z4kAadl6n75GQ6LIut0gOWc+eQIVbj3qrl9OJYFn3Pk=;
        b=igwr5R3mSdQOeC0VYiDgRX1kooL7nttiTk+Fi/mzLNsmUiCc78wUTKlz/pBikH4GG5
         389r9nqG/ioJ2ajmEAAYQVmyc2WTUCyw+9SPSzkO0ZAb1oR/HzSPlMoEjfo0H0q5KVOw
         OzCixsTn1PAATp6/zOgm2C94O2uJRDZWUoeSdpW/SlRJMbC1SsXz5Bbrs/NW677m5bt9
         /mYdm+bLQ1cXPOh2oWnt0KABx+TS1l68rnJtWnA8tqUGGyE9HqnrvcewJOeqA6LZ5p0w
         dcMJqQElDk5iEkGJfjvAk1vd/NlpDZDFORPyWlXZYb2SBlrK+D4HaM/Yj9IGU2oiP2Bz
         lcOg==
X-Gm-Message-State: AOAM533uwRA8IUIe61bVRpNHm1P20Xa5Qs/TV01GBTjX7aWIdBEc/u21
        ndN1M0hFZFttSzdz5QWuqueHCT1vPeM=
X-Google-Smtp-Source: ABdhPJwsWXccebPImrUFbcRWdDJ+lmGL83x+6BNgsriN70QTMeJl5yORiXOKxvH0MAPOrOyovH+sfA==
X-Received: by 2002:a62:164d:: with SMTP id 74mr3025734pfw.52.1589441101832;
        Thu, 14 May 2020 00:25:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p9sm1447510pgb.19.2020.05.14.00.25.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 00:25:00 -0700 (PDT)
Message-ID: <5ebcf24c.1c69fb81.ff797.4c74@mx.google.com>
Date:   Thu, 14 May 2020 00:25:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc5-310-g752f10c4a54e
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 285 boots: 9 failed,
 265 passed with 5 offline, 6 untried/unknown (v5.7-rc5-310-g752f10c4a54e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 285 boots: 9 failed, 265 passed with 5 offline, 6 =
untried/unknown (v5.7-rc5-310-g752f10c4a54e)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc5-310-g752f10c4a54e/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc5-310-g752f10c4a54e/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc5-310-g752f10c4a54e
Git Commit: 752f10c4a54ecf549503fe5a44ad6737b42341ef
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 110 unique boards, 26 SoC families, 32 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 2 days (last pass: v5.7-rc4-407-=
g604da24420e3 - first fail: v5.7-rc4-552-g1e823790a7f1)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 89 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 8 days (last pass: v5.7-rc3-277-g=
a37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-rc5-221-gd375d7ac=
b750)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 5 days (last pass: v5.7-rc4-364-ga26=
7cf4704df - first fail: v5.7-rc4-407-g604da24420e3)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.7-rc5-221-gd375d7acb=
750)
          sm8150-mtp:
              lab-bjorn: failing since 13 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.7-rc5-221-gd375d7acb75=
0)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 33 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxm-q200: 1 failed lab
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

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

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

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

---
For more info write to <info@kernelci.org>
