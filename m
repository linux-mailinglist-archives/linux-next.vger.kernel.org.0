Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B641E7AD7
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 12:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgE2Kou (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 06:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgE2Kot (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 06:44:49 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99113C03E969
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 03:44:49 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a4so42956pfo.4
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 03:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6IQb15prbtzlTugeDjCxZNoniKwiQbctam0rDgRVXlk=;
        b=STbOtRD0CTxOG5okAPwo6XL8s/NrdyS32OcUlEdaFkiXkeBeUOW6+u31POxehGnLve
         pkJzZbWMQwwBwJiqlIOhf2tf6NGwnsKiuhR/R0dERmb/SJb9UEJsWfXyIb37SSoeo61V
         HpboK2sEtwcnL6vLVJ0Nim0uMEc2yDkLjh3HKH1/B7dPDpUDoapel3hfYcqBB4CN10LQ
         U0zXxuVbdiuSmHpxiHermNfJVc4bz7LXDfqCN3QLEkp5YNk9g4XPHirzPPSaOtL5txl/
         6iDHA3ehkgrixkAm+YGVuwqQNSbzmRh5tmLB510oDX40wNR3qJ2QoMCTvoFL8jkn5ePm
         d6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6IQb15prbtzlTugeDjCxZNoniKwiQbctam0rDgRVXlk=;
        b=SX6K1SAKSs4ZtenxYjeuyyIa6DJ8BGoQ0Sk94qJad2wPbkeSFp4LJ+VaotBteGnAFY
         AmUMNPGI93hpSPWEdcAX1fmYbgwD/aSCh7vyjT7tGMBQcO3kM2dQh/vR8qNFJ5QwmQEt
         FSK6DsALWhPzWCFfhc6G6uXEj+uMvVUsGa8nfLAiog1Y03KZPEBbKpRAfQnCXVyQGxWY
         oCusOyO/HLJ7ur7vaC0k7GXy9KpmvLuQbRirAS+vHcjPom8bqmee/Yl8KlVbmlMbuxAN
         wk4zmpPV0wuVjnABc+s8oqxDQJ7vSXh54wgBzl4rTZtLjZvNfTQuzAG4RQm8kO5gBpQz
         uUvw==
X-Gm-Message-State: AOAM533hDcuK3l9By+GiCAfJUxOrBlhgVTXqLmAN+OWYDdPKk2Z8Ypv9
        9s57jVGneKMQ8l0UdHlfTuJ+7R/WKC0=
X-Google-Smtp-Source: ABdhPJxoGpYK8mi0M3ITNLD1rVPq1GhE4SlZrr2OeSGwPNUzxcJf6DBSlahj2deEIXho8fiDrIHlhw==
X-Received: by 2002:a62:8344:: with SMTP id h65mr7960395pfe.207.1590749088541;
        Fri, 29 May 2020 03:44:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z5sm7064524pfj.29.2020.05.29.03.44.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 03:44:47 -0700 (PDT)
Message-ID: <5ed0e79f.1c69fb81.e439a.6b65@mx.google.com>
Date:   Fri, 29 May 2020 03:44:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200528
Subject: next/master boot: 186 boots: 17 failed, 163 passed with 3 offline,
 3 untried/unknown (next-20200528)
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
https://kernelci.org/test/job/next/branch/master/kernel/next-20200528/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 186 boots: 17 failed, 163 passed with 3 offline, 3 untrie=
d/unknown (next-20200528)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200528/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200528/

Tree: next
Branch: master
Git Describe: next-20200528
Git Commit: ff387fc20c697cdc887b2abf7ef494e853795a2f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 22 SoC families, 24 builds out of 160

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: failing since 2 days (last pass: next-20200521 =
- first fail: next-20200526)

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 101 days (last pass: next-2020021=
4 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 6 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 6 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 6 days (last pass: next-20200515 =
- first fail: next-20200521)
          meson-sm1-sei610:
              lab-baylibre: failing since 6 days (last pass: next-20200519 =
- first fail: next-20200521)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 6 days (last pass: next-20200515 =
- first fail: next-20200521)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 6 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 6 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 6 days (last pass: next-20200515 =
- first fail: next-20200521)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 62 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
