Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD781EF0A4
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 06:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgFEEpA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 00:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgFEEpA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 00:45:00 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314DFC08C5C1
        for <linux-next@vger.kernel.org>; Thu,  4 Jun 2020 21:45:00 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f3so4329674pfd.11
        for <linux-next@vger.kernel.org>; Thu, 04 Jun 2020 21:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JG+i5puIWfM+TrlS4zgcL33g62t1D3IgauJ0dPSOLkM=;
        b=OZjoEUvKJlbY7mPIo514oDnyKudqtmRD36sSI7VxX6kRbZZyOqGijjPELYolT0ooBQ
         gqaGVuxTxWrcNBuuoUyVL/LckQ64WQ9MNTL/l2XQvi5IDdQXTUsI3t5ox7Wj8ReLoiqe
         wdg3/4Ji+LbNIu5xy5SYK52CEh/sYqbguvpBiWucYztqYEM7vZ6saD0Kshcku8HEFpkn
         iuvwF4pimafLuH8nEyUMQ9T6kmW+FmKg9lo9Y985sy3Cp3DohoZqzAxE5oGLiyOFjWJz
         UvdwQY7zU6lSBCw+AUX5Bvsn4FskcoF/HYDrEN4JzFCPqi7YjQVGJk8NIutmGtWOVtKN
         vvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JG+i5puIWfM+TrlS4zgcL33g62t1D3IgauJ0dPSOLkM=;
        b=X6gu9x8Kepw0Zhvz3bjjL/igBnVYLzhyh21Jsky7kIATCYibd9F5OSJKKXvQ/DyaYm
         ZzLhy7NjmYuBx0QCzLGqrCHmlE9NrE9aRsnIzgFg87kRlCzIfZE2fRMfH45bDMAtj5G5
         y2glrF7J5OEoonLQJfXDgdOC5jMg0lzo1di56aG0+QYtJ7jmTiePIG8vyTWlydltvp4u
         oJRW0inClPZK9drzUEhP0SD7WDHL42Lqhaf7E6vc9q4252bGQ9YIaR58dtzgZ1i57Chs
         SyQJrOZl+t0FKre56ihx59Bas1YCYdv2lQdOVgnP5LWMlz3JQg4pogYc6mA5roUBw1iR
         5YkQ==
X-Gm-Message-State: AOAM5317Ua6klYFfDwnOW0MIW2YPRMlhNAtdjHTRqT8FvWxzevjZx/eU
        sBeRWwzOREmlyudkvLkeggAWpEDgNAk=
X-Google-Smtp-Source: ABdhPJyTpveLSWTZB83CjW5HDv9xx6bdf7wKHNTHhqK7bd7EhliQTLoxiqLYe2cfxunACS9/2xhj2w==
X-Received: by 2002:aa7:96ef:: with SMTP id i15mr7637291pfq.312.1591332299115;
        Thu, 04 Jun 2020 21:44:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u1sm5183190pgf.28.2020.06.04.21.44.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 21:44:58 -0700 (PDT)
Message-ID: <5ed9cdca.1c69fb81.c187e.2fe1@mx.google.com>
Date:   Thu, 04 Jun 2020 21:44:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-8671-g086779e58c68
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 257 boots: 6 failed,
 240 passed with 6 offline, 5 untried/unknown (v5.7-8671-g086779e58c68)
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
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-8671-g0=
86779e58c68/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 257 boots: 6 failed, 240 passed with 6 offline, 5 =
untried/unknown (v5.7-8671-g086779e58c68)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-8671-g086779e58c68/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-8671-g086779e58c68/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-8671-g086779e58c68
Git Commit: 086779e58c6867c3f8488d6729e267094a0cd826
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 24 SoC families, 27 builds out of 162

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: v5.7-4607-g4ce9=
138f1bd4)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.7-4607-g4ce9=
138f1bd4)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 111 days (last pass: v5.5-8839-g=
56c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 2 days (last pass: v5.7-rc7-238-g=
59fcbde6ab90 - first fail: v5.7-930-g3a1d4c3e458b)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-4607-g4ce9138f1bd=
4)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.7-4607-g4ce9138f1bd4)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 55 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

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
            meson-gxbb-p200: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

---
For more info write to <info@kernelci.org>
