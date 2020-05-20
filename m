Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983B71DA8EC
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 06:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgETEBz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 00:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgETEBz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 00:01:55 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3118DC061A0E
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 21:01:55 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s10so844621pgm.0
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 21:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1pmPVn8WRJkTJE/ODKGZB7bnwR2r7BWzFPF+8I5VS4k=;
        b=J15yzQSoEzKpl94+GcYihv2pNUM6j85L9GNIkj6i5bBMEn74OQLq/e+KV5Rc5Mal1c
         iYqNRNVW9VJ1kkTJBHb5adq4BC4eCMY3l6GG8J0sQInJUrcU5AGty9uxJw3EEuqkiOQi
         e7ZtGnU/h/rVjy8GWgiPmrYbGpUrKwqEnm0XcDDBR9bqqNqGfa//yNvNjN03eazKNQLl
         0yk5ro+VMA7GeIECwIVxFleZ8U2Uj+lL8mTDC48gha7FBlegzo/zv7LdQ7FI84mXuI3l
         Z8QHt+DIzK4WMcyXNiqer4tBOFo3mKcpqoRV8zovD+eGYeMpYLcaUqNDH2XaT3m93vqr
         IbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1pmPVn8WRJkTJE/ODKGZB7bnwR2r7BWzFPF+8I5VS4k=;
        b=c2hr+/6YV/6pFJDyYRJ8ZKB5dm8Z7LFnSUma+rPQG9L6n1zvjt881hc8/7lcHmgBJW
         DQnZ9V0H6OK3JLGKk30WB8ZMOYZs7BoQ8Uw0wcb5GJh6Mz+j8dDhYet1U+isZB8CCXAa
         r1vxcZgeWM1MxAIuO3mcpxCUu3+rtG16bfeIuU74iPGCnXhgApylx59BLcbltdQcMLKg
         Z1lHBbs+YWUAEkMbW05SF6SfDSw6FEyPsddNrHT3il6PAjSKjbxfM1JsfboEIO1RExTK
         RtTdirs0pDuUpWFDDO3vEdgAzb6wA72ueXymKzMqw+sXr2lGFvfpv2ANDH6qo8z1lBdG
         cdvQ==
X-Gm-Message-State: AOAM532FQwPMTaif5DMYWjMp6SqZL39qGsaEElY+tOkItlQje/70q+lo
        ekxr4vgteyD9vuqetcLEb3mGEU+nfpI=
X-Google-Smtp-Source: ABdhPJw86KtykIVRvjRcCDOhvBlbgydT0D/zCOdzi2OZoGMrXY6BQWkOiHgXSsv2271QhVpnCz4Leg==
X-Received: by 2002:a63:4c49:: with SMTP id m9mr2389861pgl.308.1589947314331;
        Tue, 19 May 2020 21:01:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cv21sm777523pjb.23.2020.05.19.21.01.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 21:01:53 -0700 (PDT)
Message-ID: <5ec4abb1.1c69fb81.71007.3cb6@mx.google.com>
Date:   Tue, 19 May 2020 21:01:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200519
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 256 boots: 11 failed, 236 passed with 4 offline,
 5 untried/unknown (next-20200519)
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
https://kernelci.org/test/job/next/branch/master/kernel/next-20200519/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 256 boots: 11 failed, 236 passed with 4 offline, 5 untrie=
d/unknown (next-20200519)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200519/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200519/

Tree: next
Branch: master
Git Describe: next-20200519
Git Commit: fb57b1fabcb28f358901b2df90abd2b48abc1ca8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 106 unique boards, 26 SoC families, 30 builds out of 221

Boot Regressions Detected:

arm:

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0200501 - first fail: next-20200514)
          omap3-beagle-xm:
              lab-baylibre: failing since 5 days (last pass: next-20200501 =
- first fail: next-20200514)
          omap4-panda:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0200501 - first fail: next-20200514)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 92 days (last pass: next-20200214=
 - first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20200515)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: failing since 1 day (last pass: next-20200515 =
- first fail: next-20200518)

arm64:

    defconfig:
        gcc-8:
          hip07-d05:
              lab-collabora: new failure (last pass: next-20200518)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 53 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle: 1 failed lab
            omap3-beagle-xm: 1 failed lab
            omap4-panda: 3 failed labs

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            sm8150-mtp: 1 failed lab

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
