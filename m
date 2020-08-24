Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3EB24F1B0
	for <lists+linux-next@lfdr.de>; Mon, 24 Aug 2020 05:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgHXDuV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 23 Aug 2020 23:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbgHXDuU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 23 Aug 2020 23:50:20 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C16C061573
        for <linux-next@vger.kernel.org>; Sun, 23 Aug 2020 20:50:20 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id o5so3921960pgb.2
        for <linux-next@vger.kernel.org>; Sun, 23 Aug 2020 20:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tCM85IuDlNlGGw4rYvRRzmMkzZp2m6pgI08OmnuyhGk=;
        b=QPCMGdQGicPCYatxq8brxh4pyzj0UhFbq0rnPnmP5fjPbnuk8mD9+3yitzVnaNnZnN
         pBZ/BlybyUG/N6k6V4+AYFCg/U6ejed8GaJMUyGpx3+Be62v2FXw+uLboyMSRbCigCXu
         4BNcoNuueFKtQTRH0oQZ58hCv3OKYzgURjUas4HVgkCUW5RsjF3hAbZ1Z9gNM9D0Nqli
         sSfCJ+pBlYqTIsk+3atpjk7TPBbzrmulUw540+PASuiWjccYAldSv0g4v0XkT+ePCe/W
         VKqqvzIwUDskdj6of7o0WMjgyBkkO9p2mENld+nerE9efvyXApmKOfTAPZWDzA1lbDcu
         rX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tCM85IuDlNlGGw4rYvRRzmMkzZp2m6pgI08OmnuyhGk=;
        b=IpGT50rMjWtTRSg6W/jT+u4EMUcUdO+15T/v8uMWjuJhSyRyDLAsLGjqzLSyU5X2yJ
         1bCQI64lJ/fAVC6Ep3jASrfLn1bAs9HXCWGHfbqGfQch5mvjXO5+6YyWoDJaB0T0Hue7
         LMnK0tCWJEylxYwqC6Db7TFV8nEGFD7HbC2B+WMNOEuPMoRW81Q+B4/9waRXWQ+xUkqz
         9YNS+drwaXR/WF7i7E8jpL2lq3ZoHWcYJuDwrPglcUS0xvIPssz8aSbjtLKJmWoXxUFY
         OVVu0gKfME0hEdYLfu03McLXXAB+dgjLkrBunWkNOk2bs39QjBqcIxDhEAkDTkbpkGr6
         s8vQ==
X-Gm-Message-State: AOAM531n9B/6NZAf6Lm1NKbm0SFW860rPjdnBAdptl3ckGobF0BLMG1i
        xd1d8WmfyBxYyPq5VrvWalq9E0EBmfcCKQ==
X-Google-Smtp-Source: ABdhPJzfA+2L9hA/fbrCS/UcYfvdO6VuCSs+fpXUc2P21aRvZH4mscL44NYjPu4D5vUFYE7Dv8URyg==
X-Received: by 2002:a62:7c87:: with SMTP id x129mr2817417pfc.165.1598241018324;
        Sun, 23 Aug 2020 20:50:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p9sm8539932pjm.1.2020.08.23.20.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 20:50:17 -0700 (PDT)
Message-ID: <5f4338f9.1c69fb81.f5e52.9044@mx.google.com>
Date:   Sun, 23 Aug 2020 20:50:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-193-g42693eb57618
Subject: next/pending-fixes baseline: 288 runs,
 21 regressions (v5.9-rc2-193-g42693eb57618)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 288 runs, 21 regressions (v5.9-rc2-193-g42693e=
b57618)

Regressions Summary
-------------------

platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre  | gcc-8    | sama5_defcon=
fig              | 0/1    =

bcm2837-rpi-3-b           | arm   | lab-baylibre  | gcc-8    | bcm2835_defc=
onfig            | 2/4    =

bcm2837-rpi-3-b           | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 3/4    =

exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | exynos_defco=
nfig             | 0/1    =

exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
config           | 0/1    =

exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 0/1    =

imx6q-var-dt6customboard  | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 0/1    =

mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =

omap4-panda               | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 4/5    =

omap4-panda               | arm   | lab-collabora | gcc-8    | omap2plus_de=
fconfig          | 0/1    =

rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc2-193-g42693eb57618/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc2-193-g42693eb57618
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      42693eb576189ee8ef0b522d781dbcb184d5b235 =



Test Regressions
---------------- =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre  | gcc-8    | sama5_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4302d007231b02699fb434

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4302d007231b02699fb=
435
      failing since 110 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
bcm2837-rpi-3-b           | arm   | lab-baylibre  | gcc-8    | bcm2835_defc=
onfig            | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f4300b5857b6fca649fb442

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f4300b5857b6fc=
a649fb447
      new failure (last pass: v5.9-rc1-419-gdb8c0d8e5d3c)
      4 lines

    2020-08-23 23:50:00.706000  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c122ebe0
    2020-08-23 23:50:00.707000  kern  :alert : pgd =3D 999957b5
    2020-08-23 23:50:00.708000  kern  :alert : [c122ebe0] *pgd=3D0120041e(b=
ad)
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f4300b5857b=
6fca649fb448
      new failure (last pass: v5.9-rc1-419-gdb8c0d8e5d3c)
      40 lines

    2020-08-23 23:50:00.710000  kern  :emerg : Process udevd (pid: 101, sta=
ck limit =3D 0x277e57f1)
    2020-08-23 23:50:00.711000  kern  :emerg : Stack: (0xc420bdf8 to 0xc420=
c000)
    2020-08-23 23:50:00.748000  kern  :emerg : bde0:                       =
                                c420be68 ea500010
    2020-08-23 23:50:00.750000  kern  :emerg : be00: c420be44 c420be10 c025=
190c c024eb5c c420be54 c420be20 c03cf038 c420be68
    2020-08-23 23:50:00.750000  kern  :emerg : be20: c0e04248 c420bf48 c420=
bf50 c420bf48 c420bf40 00000000 c420be64 c420be48
    2020-08-23 23:50:00.752000  kern  :emerg : be40: c0251bc4 c0251820 0113=
0560 c0e04248 ea500000 c420bf50 c420bf2c c420be68
    2020-08-23 23:50:00.753000  kern  :emerg : be60: c0252114 c0251bb0 0000=
0000 00000000 ea50001a c0260568 ea46e0d0 ea002088
    2020-08-23 23:50:00.792000  kern  :emerg : be80: ea46e0d0 ea002088 c420=
bebc 00001040 c0236fb4 0000004a 00000020 c0e04248
    2020-08-23 23:50:00.793000  kern  :emerg : bea0: 00000000 00000000 c420=
beac bec46028 c420befc c420bec0 c023a9fc c02455dc
    2020-08-23 23:50:00.794000  kern  :emerg : bec0: c420bf04 c420bed0 c024=
55dc c0161764 00000000 278cbe3d ea500000 ea500000
    ... (29 line(s) more)
      =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
bcm2837-rpi-3-b           | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f4300d18aced17a719fb442

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f4300d18aced17a=
719fb446
      new failure (last pass: v5.9-rc1-381-g159f8cd76711)
      2 lines

    2020-08-23 23:48:15.721000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-08-23 23:48:15.722000  (user:khilman) is already connected
    2020-08-23 23:48:30.950000  =00
    2020-08-23 23:48:30.951000  =

    2020-08-23 23:48:30.951000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-08-23 23:48:30.951000  =

    2020-08-23 23:48:30.952000  DRAM:  948 MiB
    2020-08-23 23:48:30.965000  RPI 3 Model B (0xa02082)
    2020-08-23 23:48:31.053000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-08-23 23:48:31.085000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (382 line(s) more)
      =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | exynos_defco=
nfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f430c03ce468bff019fb433

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f430c03ce468bff019fb=
434
      new failure (last pass: v5.9-rc1-419-gdb8c0d8e5d3c)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4305a4a101a776a69fb42d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4305a4a101a776a69fb=
42e
      failing since 5 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fa=
il: v5.9-rc1-207-gddf860520297)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f430971d3bfcc37429fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f430971d3bfcc37429fb=
42c
      failing since 18 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f430d41c32d490a7e9fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f430d41c32d490a7e9fb=
42c
      failing since 18 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
imx6q-var-dt6customboard  | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f43044b0020ced2d29fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f43044b0020ced2d29fb=
42c
      failing since 5 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fa=
il: v5.9-rc1-207-gddf860520297)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4301705137978f6a9fb438

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4301705137978f6a9fb=
439
      failing since 13 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f43017d160626bb0b9fb43e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f43017d160626bb0b9fb=
43f
      failing since 13 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
omap4-panda               | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f43043bff2bc997a49fb42b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f43043bff2bc99=
7a49fb431
      failing since 18 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-24 00:05:09.859000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-24 00:05:09.865000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-24 00:05:09.871000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-24 00:05:09.877000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-24 00:05:09.882000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-24 00:05:09.888000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-24 00:05:09.894000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-24 00:05:09.900000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-24 00:05:09.906000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-24 00:05:09.911000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
omap4-panda               | arm   | lab-collabora | gcc-8    | omap2plus_de=
fconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4303b5279b79a53c9fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4303b5279b79a53c9fb=
42c
      failing since 18 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f430203763c9d37a89fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f430203763c9d37a89fb=
42c
      failing since 2 days (last pass: v5.9-rc1-381-g159f8cd76711, first fa=
il: v5.9-rc1-419-gdb8c0d8e5d3c)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4301807ac8de93959fb43a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4301807ac8de93959fb=
43b
      failing since 6 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f430231763c9d37a89fb48f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f430231763c9d37a89fb=
490
      failing since 6 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4303ea67bb6f367b9fb43e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4303ea67bb6f367b9fb=
43f
      failing since 6 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4301d23c2ab97ad79fb433

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4301d23c2ab97ad79fb=
434
      failing since 6 days (last pass: v5.8-13251-g8d2ac1ce7b76, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f430672ee88ae39639fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f430672ee88ae39639fb=
42c
      failing since 6 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4309fd4ff9fae60c9fb42c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4309fd4ff9fae60c9fb=
42d
      failing since 6 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4302e43d4bc61bfc9fb43e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-o=
linuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-19=
3-g42693eb57618/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-o=
linuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4302e43d4bc61bfc9fb=
43f
      failing since 3 days (last pass: v5.9-rc1-207-gddf860520297, first fa=
il: v5.9-rc1-381-g159f8cd76711)  =20
