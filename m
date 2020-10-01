Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBFEB2805AB
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 19:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732847AbgJARlm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 13:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732096AbgJARll (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 13:41:41 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FAE7C0613D0
        for <linux-next@vger.kernel.org>; Thu,  1 Oct 2020 10:41:41 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q4so2376058pjh.5
        for <linux-next@vger.kernel.org>; Thu, 01 Oct 2020 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=93E9wJvpAnh9TYpDagFxQ/1Phf1/Ki1H7Z+iHpAhI2E=;
        b=b9gjVEw50s6uoSFeE432iSaExwdEdDVYSKTxLZXzxomm/MQ+6Su/vnNGYrZTpbhh51
         kY7O3sd6chOydPGqJJsRRNDUdWwgeTnB2mNVd/KCQiDK/sT/l4olpTdfKR0dW/n5AfA3
         YJrPmVc+QLuGuaeKU6aTiAZ/DANipwU7W7bIRta9okjdnSXOYwqymqr/SIRfOUWkqmrH
         LHnVDomLOdAp2GlQI6e24WZsjyh/M0CdznD7m/YQO1TqCPPvMGqJ9pEY2EKIo+GPDkcA
         XPn6f6Hxv/lIowuCJQkpuxUN8T4LyiIjZR3BgUgOh9I1XPmkwzccMpQSTV7J4uHLh75d
         VNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=93E9wJvpAnh9TYpDagFxQ/1Phf1/Ki1H7Z+iHpAhI2E=;
        b=Gyc9mk77QfxRhoRhsyLIcdVmaH6910xTkATrpCBYfDI+v2X7eEUWcCJE5Ojz4alzIu
         mhJpDT5cCZT+RFxvpGQf8c7iWU0rRlG/3KxVyZbY73ICYb9La+anGzi9PpSSG39JwTFG
         X4jI6C3CVkPHFqJWE9k8l318c14pOZPSRsGcTk48vs/U8SZlxqQhiQWFpjei+wg0k+dY
         mmGevCy+tc6ppWuUPFtrWf6zKPYYiJDiLSuatY/5m5IcV06xGsq06gI8IWlqihhK2rHh
         xwjSpAajMYOaflmxi05bgg0ZjwfOt/knJ0bSzo6+lCuWdraHVUDTLwAe6b8LKZg5AoZ6
         icIQ==
X-Gm-Message-State: AOAM533nkiRIMaVIPP/MSti9rc/NtmKXrr4Cwp7hSpjkIGC2/r57gpoT
        C3G52V06Ua7qb++GwuOsbDoKUa5g5ZQLCw==
X-Google-Smtp-Source: ABdhPJxgjPOuJtoDevgSJ3ObZdjIMHLEJr2/aYmuve6gj+zRpj54l7FkiGBZFhLxMGMywCuhMWATjw==
X-Received: by 2002:a17:90a:71cb:: with SMTP id m11mr1022294pjs.14.1601574100597;
        Thu, 01 Oct 2020 10:41:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d20sm445214pjv.39.2020.10.01.10.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 10:41:39 -0700 (PDT)
Message-ID: <5f7614d3.1c69fb81.12aac.0f49@mx.google.com>
Date:   Thu, 01 Oct 2020 10:41:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201001
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 397 runs, 5 regressions (next-20201001)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 397 runs, 5 regressions (next-20201001)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201001/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201001
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d39294091fee6b89d9c4a683bb19441b25098330 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f75ddb1082d87701b877169

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201001/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201001/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f75ddb1082d87701b877=
16a
      failing since 156 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f75f3293a69cc23ba87716d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201001/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201001/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f75f3293a69cc23ba877=
16e
      failing since 0 day (last pass: next-20200929, first fail: next-20200=
930)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f75dcd8c4d10e185d87718d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201001/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201001/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f75dcd8c4d10e18=
5d877191
      new failure (last pass: next-20200930)
      2 lines

    2020-10-01 13:40:34.886000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-01 13:40:34.886000  (user:khilman) is already connected
    2020-10-01 13:40:50.092000  =00
    2020-10-01 13:40:50.092000  =

    2020-10-01 13:40:50.092000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-01 13:40:50.092000  =

    2020-10-01 13:40:50.092000  DRAM:  948 MiB
    2020-10-01 13:40:50.107000  RPI 3 Model B (0xa02082)
    2020-10-01 13:40:50.196000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-01 13:40:50.227000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (384 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f75dfad173b1792ca877173

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201001/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201001/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f75dfad173b1792=
ca877177
      new failure (last pass: next-20200930)
      4 lines

    2020-10-01 13:51:58.466000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-01 13:51:58.466000  (user:khilman) is already connected
    2020-10-01 13:52:14.338000  =00
    2020-10-01 13:52:14.338000  =

    2020-10-01 13:52:14.338000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-01 13:52:14.338000  =

    2020-10-01 13:52:14.339000  DRAM:  948 MiB
    2020-10-01 13:52:14.355000  RPI 3 Model B (0xa02082)
    2020-10-01 13:52:14.442000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-01 13:52:14.474000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (396 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f75e0491b233bf14387716f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201001/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201001/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f75e0491b233bf143877=
170
      failing since 71 days (last pass: next-20200706, first fail: next-202=
00721)  =20
