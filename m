Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C96D2856E0
	for <lists+linux-next@lfdr.de>; Wed,  7 Oct 2020 05:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgJGDIg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 23:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgJGDIg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 23:08:36 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18C6C061755
        for <linux-next@vger.kernel.org>; Tue,  6 Oct 2020 20:08:34 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 7so461337pgm.11
        for <linux-next@vger.kernel.org>; Tue, 06 Oct 2020 20:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=12VIAo2OluXNgQSfhv8Dc3TQKV6darL5WQWRnlf0Ekw=;
        b=DcTwhQOBQlxkpj23pQ1SGWRXprd93KoYv09hfB4/FIRYqQ2H4/3f0Ye0f2689T55/8
         nc3C/jrZdhQS+5EKSUd4UkBI+LhSgyS9ZGT+5H43sd9To2c0NAHyqW6HnTFXfaKuoCLF
         xtibiUUzS/PrPhVIMpy3kKKj/BXcgj0lZ+8jlH//JC3pHjRqjydPmUxhq+iJ0Pz3LmyF
         Vgdzz4nP9C+q1P6xj7FV1iQK/2CbwSnBTi7gE1uRPiw8eyphcq4f7ClpQHLVXPEEJ0mS
         +LQoFPZYzcwhkO709UA+6bqkyILM648vMTL6z2vO4mC8AImtl3nmjhMnsp869fglDlbD
         9jUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=12VIAo2OluXNgQSfhv8Dc3TQKV6darL5WQWRnlf0Ekw=;
        b=BPMbOGeLfE9nu3zzGZGlSfFRcx7EzpX1SWx/QBPqqOihTsyk0GsF+tlfP3xcB6o6ZU
         /ZL2ufGlXnMnP0LR7hhVhPJfACjpvpE7NL2H0IagQAjkstr3PEdLRfQxLBSN6JcpN2ol
         zfEur1HCSysySY/dfVDOydkQIVsK68vXRojj+CgIYbxxCtCaIog+1E91HqGSUiO50oD6
         SSzigRSQ/oE0L03nuM0FFW/T03+zZ7Rl7MxvonjF6ymRiIK1mSeZGax1jw+h+RG9dkf0
         pymr9zDFUq5qP/dlans34RnF0KG3Xl4XFrligQNDzPATcju8xtAeVDJbV0YIR3H3y8D4
         D8Jg==
X-Gm-Message-State: AOAM5335N0uhKP/gUi5ColNvNlePI9OBqUfGSASl8v1ax/T2zlxjMsQ/
        xMtKB9GTyX5lGpCW8Fl7Xit8RK1VW9Bh6A==
X-Google-Smtp-Source: ABdhPJyOQCQv4nWtk0YXKvsYZsy1tWBnl3NLR+JSVZwtojBiTh+G649YTy5btjNcfDg+8lbWakqP+A==
X-Received: by 2002:a62:1951:0:b029:152:6669:ac74 with SMTP id 78-20020a6219510000b02901526669ac74mr1021831pfz.36.1602040113721;
        Tue, 06 Oct 2020 20:08:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h9sm681662pfc.28.2020.10.06.20.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 20:08:32 -0700 (PDT)
Message-ID: <5f7d3130.1c69fb81.b74dc.22e4@mx.google.com>
Date:   Tue, 06 Oct 2020 20:08:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc8-317-gdb4f38eb0553
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 233 runs,
 5 regressions (v5.9-rc8-317-gdb4f38eb0553)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 233 runs, 5 regressions (v5.9-rc8-317-gdb4f38e=
b0553)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =

panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc8-317-gdb4f38eb0553/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc8-317-gdb4f38eb0553
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      db4f38eb055325bca89e7558abe615d4ec372fa4 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7cf9ae69220c4f554ff40f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7cf9ae69220c4f554ff=
410
      failing since 154 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7cf57bb4db4078084ff412

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7cf57bb4db4078=
084ff416
      failing since 4 days (last pass: v5.9-rc7-297-gd069a655f589, first fa=
il: v5.9-rc7-326-g64809246f17a)
      2 lines

    2020-10-06 22:50:07.347000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-06 22:50:07.347000  (user:khilman) is already connected
    2020-10-06 22:50:23.671000  =00
    2020-10-06 22:50:23.671000  =

    2020-10-06 22:50:23.687000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-06 22:50:23.687000  =

    2020-10-06 22:50:23.687000  DRAM:  948 MiB
    2020-10-06 22:50:23.702000  RPI 3 Model B (0xa02082)
    2020-10-06 22:50:23.792000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-06 22:50:23.825000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (386 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7cf737b3b5b340914ff3e1

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7cf737b3b5b340=
914ff3e5
      new failure (last pass: v5.9-rc8-292-g60941adad413)
      2 lines

    2020-10-06 22:58:53.390000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-06 22:58:53.390000  (user:khilman) is already connected
    2020-10-06 22:59:09.847000  =00
    2020-10-06 22:59:09.848000  =

    2020-10-06 22:59:09.863000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-06 22:59:09.864000  =

    2020-10-06 22:59:09.864000  DRAM:  948 MiB
    2020-10-06 22:59:09.879000  RPI 3 Model B (0xa02082)
    2020-10-06 22:59:09.969000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-06 22:59:10.002000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (382 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f7cfc50eb314d963f4ff3e4

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7cfc50eb314d9=
63f4ff3ea
      failing since 62 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-06 23:22:49.982000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-06 23:22:49.986000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-06 23:22:49.991000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-06 23:22:49.996000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-06 23:22:50.005000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-06 23:22:50.011000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-06 23:22:50.016000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-06 23:22:50.021000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-06 23:22:50.026000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-06 23:22:50.035000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7cfaf1fde5b84cab4ff3eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-31=
7-gdb4f38eb0553/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7cfaf1fde5b84cab4ff=
3ec
      failing since 62 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
