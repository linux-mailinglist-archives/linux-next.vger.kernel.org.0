Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9C32845EF
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 08:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgJFGWC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 02:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgJFGWC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 02:22:02 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1809EC0613A7
        for <linux-next@vger.kernel.org>; Mon,  5 Oct 2020 23:22:02 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id ds1so1050318pjb.5
        for <linux-next@vger.kernel.org>; Mon, 05 Oct 2020 23:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pKnTIOFdURRVn8+34Roldvr+L4cgqCHf4ccxALacKRo=;
        b=kAMZ2aC8V5IHbnfg/HqhJU2WqSA1wUVbO5PYvp5TS2FUKJyBeHeXV4xvLiW1jozAyr
         FurOav5PqhK8L0lC7IQOz+WQFevxLCll85q68Dss1AuTwCaWSl/h/Pir+mF3pHKXsk1w
         nNqODwZnxdzu8B8AugoKti4qgGXDwP07NTN1Frl3RJvOlwvg3leoLs+CXG/RtsSMLsHC
         NPE6JpFWoSEEljV57bAFQnL3TL7d/+ay4vHJ2GIevng/lU9x1c0MvpzMEmYyTd1BT8bZ
         q52M48AHfvebOMmcvZziLWFa+E+znUaI5JAzOF+a29FovNoYIwN/bas5edoXhiu1TR54
         BP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pKnTIOFdURRVn8+34Roldvr+L4cgqCHf4ccxALacKRo=;
        b=GRSdbBUi+r8vojZC0qE/Qa8m6gOfUymRUyZZas6tYkjahlhjiidDIOElXcUi+Rx3/9
         3+sqbr0tsPfyCFWF+JNmlAU9qx9hSmQu7514MsqVsRmqpoWnGq2xrD8OGGT6WYCmigrQ
         Q+sCj4FNYu/mZN/ysCptaHh4RYmXUBU2U4OPi6qsP6M8ZJ2NSCDD4Tk/zO+3ufOP7YKJ
         iRVbN/xnCEd8ViMQiZnX+QUIShV5Q7ZTPPYh+aFMDRTh9zy148WyeD6rFtTcqNpeWKRz
         yCBxwol3ZpT9BAb6HuQaircAXaJCle0oP9ytk4a/fuSK8atrlzXSuMj9ypXAHdIzFSRq
         JytQ==
X-Gm-Message-State: AOAM533eb65KoAB1tonWUEhSoMV8BV+a3q7r61tlI3MBPxmCRpTStqa6
        wo1MYwp6vz56P3MhRpsc+9+APEaj4OwJfg==
X-Google-Smtp-Source: ABdhPJza6ENLPaNEyYqkl7hAor0BOdw3KCIFdEKzYpcZoQVYfbtEg0F2jLAnOmOPYvaqywL5KnFawQ==
X-Received: by 2002:a17:902:525:b029:d1:920c:c200 with SMTP id 34-20020a1709020525b02900d1920cc200mr1920989plf.25.1601965320973;
        Mon, 05 Oct 2020 23:22:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cs21sm4115014pjb.0.2020.10.05.23.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 23:21:59 -0700 (PDT)
Message-ID: <5f7c0d07.1c69fb81.f5db3.2c8a@mx.google.com>
Date:   Mon, 05 Oct 2020 23:21:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc8-292-g60941adad413
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 236 runs,
 3 regressions (v5.9-rc8-292-g60941adad413)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 236 runs, 3 regressions (v5.9-rc8-292-g60941ad=
ad413)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 3/4    =

panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =

panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc8-292-g60941adad413/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc8-292-g60941adad413
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      60941adad413d069e7f6eaac2ee2d27c589ba7be =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7bd274b6f35123334ff3e0

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-29=
2-g60941adad413/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-29=
2-g60941adad413/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7bd274b6f35123=
334ff3e4
      failing since 3 days (last pass: v5.9-rc7-297-gd069a655f589, first fa=
il: v5.9-rc7-326-g64809246f17a)
      2 lines

    2020-10-06 02:09:50.995000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-06 02:09:50.995000  (user:khilman) is already connected
    2020-10-06 02:10:05.824000  =00
    2020-10-06 02:10:05.824000  =

    2020-10-06 02:10:05.824000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-06 02:10:05.824000  =

    2020-10-06 02:10:05.825000  DRAM:  948 MiB
    2020-10-06 02:10:05.840000  RPI 3 Model B (0xa02082)
    2020-10-06 02:10:05.928000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-06 02:10:05.960000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f7bd568aacc3f9ba14ff3ff

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-29=
2-g60941adad413/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-29=
2-g60941adad413/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7bd568aacc3f9=
ba14ff405
      failing since 62 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-06 02:24:31.827000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-06 02:24:31.832000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-06 02:24:31.837000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-06 02:24:31.842000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-06 02:24:31.847000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-06 02:24:31.857000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-06 02:24:31.861000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-06 02:24:31.866000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-06 02:24:31.872000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-06 02:24:31.877000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7bd447eb666b030e4ff3e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-29=
2-g60941adad413/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-29=
2-g60941adad413/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7bd447eb666b030e4ff=
3e4
      failing since 61 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
