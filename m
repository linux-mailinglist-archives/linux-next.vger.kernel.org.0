Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8461E2A34
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 20:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgEZSil (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 14:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgEZSil (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 14:38:41 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048B2C03E96D
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 11:38:41 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t7so9021049plr.0
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/65MkUZmbKMnGyB6EwCqbdu21WodJRSjt9Jm3dCk1CE=;
        b=mglnmb/Iw/1jaJGqSmIAX137pyWHRJ4fjP5oVvlrLNK0VjAy9T9iBkKICrsiO76Off
         Yz/VIcKqhGplG/DjhqTaIkyjk0FGxsVCcNPQ2QUcgiLFfBH8npJkhTwToL2UrT9w5Q7m
         NCdUOIqG86DPulUTn/rOvm8X6Gu4a6elFJMdEgazev7UDEXWjUGyntI8w389h5UIjzSV
         Fo2AbDloTTvjDV287ZIZg4dlCbYKmN+Xu/j61wNJBCWCf/IGLaIlMlUzPx/+VVOCyKgD
         1+YS1/rDBPEKiYgnqDLWCH74tSJktgW4fbmEWwBAy0gA1VFMum2FAkZn3YeFIhqcaJQs
         McMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/65MkUZmbKMnGyB6EwCqbdu21WodJRSjt9Jm3dCk1CE=;
        b=KAiZr6JD54Og8wKcLd2R/fhqzBspWYV5bKfan2IujLmf1qcCjRz3V64+HaCnvnJcSI
         OPQda0NscBTI6YqYhNFhbhPtHGBndPMv/eBsK20ncO9juh668MpYSNCdFUkQ6WCepVdp
         dM05RaqHrZC+5RDSwXJ3KmdUxyzGF+1vPkSqepxnRYRkGjQDNfzpgir7ereIL8XscKTR
         3qVMsig+XDSkbFQrcn6OdnUB2Bap89xgaZf+x5728f+niAbG4WRGYd9FI9/GBUe1FZ44
         BXDF1pBqcbQ5mQ7QsyJed+qg1WxrU3sTKLumMMmpht3jl8NhcM/7Mf/lltK9pwVZX/+u
         6Cqg==
X-Gm-Message-State: AOAM531JCwuIpWP2NjxoQz2m3H63HTddOYv8QlPZj8rkxJWTFQxSCQKO
        a2wr4XLhmY9lOuLDk82m39D6pRF7UwQ=
X-Google-Smtp-Source: ABdhPJwuR7gQHxz1n9Ox72cPMBHA0MJ5/DL5U0bUeRVrIdQ4MsW5nTfTNx0cbSmzVXZ9A9if15lD1A==
X-Received: by 2002:a17:902:7083:: with SMTP id z3mr2161072plk.143.1590518320000;
        Tue, 26 May 2020 11:38:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c14sm221217pfp.122.2020.05.26.11.38.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 11:38:39 -0700 (PDT)
Message-ID: <5ecd622f.1c69fb81.c6cde.0d60@mx.google.com>
Date:   Tue, 26 May 2020 11:38:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200526
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 263 boots: 17 failed, 235 passed with 4 offline,
 7 untried/unknown (next-20200526)
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
https://kernelci.org/test/job/next/branch/master/kernel/next-20200526/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 263 boots: 17 failed, 235 passed with 4 offline, 7 untrie=
d/unknown (next-20200526)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200526/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200526/

Tree: next
Branch: master
Git Describe: next-20200526
Git Commit: b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 26 SoC families, 30 builds out of 226

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20200521)

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 98 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200525)

arm64:

    defconfig:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 4 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 4 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-sm1-sei610:
              lab-baylibre: failing since 4 days (last pass: next-20200519 =
- first fail: next-20200521)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200525)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200525)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 4 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 4 days (last pass: next-20200519 =
- first fail: next-20200521)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 60 days (last pass: next-=
20200326 - first fail: next-20200327)

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

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab
            sm8150-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

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
