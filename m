Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28D71EB60D
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 08:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgFBG65 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 02:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgFBG64 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2020 02:58:56 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF77C061A0E
        for <linux-next@vger.kernel.org>; Mon,  1 Jun 2020 23:58:56 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n9so982948plk.1
        for <linux-next@vger.kernel.org>; Mon, 01 Jun 2020 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gZc0uJcdpZbwavMJJXGIg/MQUeCh9M6aPrhlKFlYTQ4=;
        b=tHy3T98KG2XL3M8+OuHiKGORwCrxXKfNCDr3H74BNusxQUmUy/s5OuQXyjOQtc/YCR
         GR6dc09XEHStd9zp99BZIpROBteO5IqIObOc1RZnKTLFXhi1VDlyM3+FjpmhKcqJX8Oi
         Dz9cUvl1b4lZFx3h5mboxiOvaQ6CFFe66dGO+H1Q+jO1qICTuNWQejVBurwYWtH4/3uS
         j5KcX90W+thRvvbRhh97M7Bklf0FOR5WnpJu6hezMvPjqQUsBGyGF+ua/S1XxSkWCoBU
         na15WhRy2t8bi3LOZHSGGV4whap1+8WlKD1Y/cz2yF1tVkzD/mS043QlzpQr91nvv72R
         ONAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gZc0uJcdpZbwavMJJXGIg/MQUeCh9M6aPrhlKFlYTQ4=;
        b=I8V7QHhZlWxHE343kj4nuQbYhOtMSHrtoMKQzfiUUoEoy0qiPKXwFK2vjh4tr2SRqm
         IxdXoLCZJleO67K5SSPdhE+kSwgV+e5IxyXNyiaxdGOpf38sUrvNzxVhEcXPS69g3KBw
         rETU1HbqecxC9YX8+rovr1FNfTzBhYgI/6OX2VduXJd9868eP/k1xD4uyX1qmfFKyzAv
         4Tny7DpTmmeiuVsafwGHtnaYdIchqipW0YUSGU5IpmUfAYAE/ZmDUdcZ8yJtjrbusUlU
         2jjb+a5CWmQHuMYKN3mPesxWmG+G+kTyyoPNP90IvQ4aoh1+5i+IeCL1XPutyffzohLm
         J2yg==
X-Gm-Message-State: AOAM532XjKcMQ69T0yntMyFBOnbd2GXeYsd88QL8laFl9I+9QY9n5ZmG
        RGGa/SSHueLVJuOMQ/A5sVpa32jgtBU=
X-Google-Smtp-Source: ABdhPJxaFC8NmiHfFaMsmxJe+UR/9fEksEDUlgRe0OW0+yI/z3r2Yt+jA3BWOpx0laFF0tfWcy830g==
X-Received: by 2002:a17:902:8546:: with SMTP id d6mr22292516plo.164.1591081135908;
        Mon, 01 Jun 2020 23:58:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c2sm1341362pfi.71.2020.06.01.23.58.54
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 23:58:54 -0700 (PDT)
Message-ID: <5ed5f8ae.1c69fb81.ca1f.5231@mx.google.com>
Date:   Mon, 01 Jun 2020 23:58:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-930-g3a1d4c3e458b
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 244 boots: 5 failed,
 229 passed with 4 offline, 6 untried/unknown (v5.7-930-g3a1d4c3e458b)
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
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-930-g3a=
1d4c3e458b/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 244 boots: 5 failed, 229 passed with 4 offline, 6 =
untried/unknown (v5.7-930-g3a1d4c3e458b)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-930-g3a1d4c3e458b/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-930-g3a1d4c3e458b/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-930-g3a1d4c3e458b
Git Commit: 3a1d4c3e458b0755adc3e3f97254bf8e565ce801
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 24 SoC families, 26 builds out of 162

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: v5.7-rc6-175-gcf2c23313=
0ca)

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 6 days (last pass: v5.7-rc6-275-=
gdbacbfd47d67 - first fail: v5.7-rc7-144-g6edb22d07477)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 108 days (last pass: v5.5-8839-g=
56c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: new failure (last pass: v5.7-rc7-238-g59fcbde6a=
b90)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.7-rc7-238-g59fcbde6a=
b90)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 52 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

---
For more info write to <info@kernelci.org>
