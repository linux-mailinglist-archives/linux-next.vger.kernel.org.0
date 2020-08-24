Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08C524FB05
	for <lists+linux-next@lfdr.de>; Mon, 24 Aug 2020 12:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgHXKGR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 06:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbgHXKGQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Aug 2020 06:06:16 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA2AC061573
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2020 03:06:16 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id h12so4317169pgm.7
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2020 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WRBIsn1fz8190+KU272xKvmGWWMq5myf/ANX+NRYEa8=;
        b=Oxxkhd/D/e4xAzSCBOzuhY8cCdVJ+oRg+AuOoYTWtuRbVgLrzPHEGeSgENHGJDsgzl
         Gk6Xb3VgKDpKoIjT4NmTOJaJt/C6flsZRQKLcO0EVPiCpc5yR88kQjnGdOyOaGSiEZZy
         dP6lCt49Dg+YvC8bZomxnQd4xG5Thf41p23xhF/Ol8y0wcGOBRPlC1w0ipvM6cC2HZuS
         nGyxpVwVnkCaVkNrdTeMwX0BB4BetjGBLWOxWIb/v7gbl/io1aqfNOBcBFx2a77mXKqG
         00ZDY4mi+NyN0rY9qwODfJOAmmvBknmsY2ocbezXnrTU1QBl9/yP6oUkyUDCi9kMLyPf
         2d3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WRBIsn1fz8190+KU272xKvmGWWMq5myf/ANX+NRYEa8=;
        b=qUnxOK0MkQqkD6pfhu6FIeIqsUbuRyYT7SM/wJw2sU835oJJTLJjgy7hhRflry1YvJ
         wpIGhFwxfLDi01pctecvyyvw2i4pPgXzJmQmW5s7SKkAUK/IwtAu8CkMnwdAlxm4PyaA
         22I036icuYwKEdnQ4WCrBHnVKcOplqQkkBbl8QmNuesuQbCG1muxq3DwURS46bZWsR+2
         yTM95WJCRignCHF6xfFMniRsaRdpKWZA6bMPw03Wbv1QNpWDIEDHtjDFEwFPinwFHdaB
         mytIhsBRpJU+U+0YnZiFOrYAylTN4LBOTmFzmKMrcdtnidXsoan7BbemG+PtUe5Pt8Nw
         GwJA==
X-Gm-Message-State: AOAM531AprSascvpBBc44nfFBpXMwKVFD7kLZHMoiA6Mwzwl8h1/L71p
        JFg7RMfaVy7xlzYzCpZfg1+rRu1k+LQnzw==
X-Google-Smtp-Source: ABdhPJzToRliILUUs4/TBSv2eKDLUnUjqP4CFr8lJva5YzAN/nq6xZ3jzpOsqgM9C3K3a2j2eWXpOg==
X-Received: by 2002:a63:1a51:: with SMTP id a17mr2875859pgm.309.1598263572582;
        Mon, 24 Aug 2020 03:06:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id js19sm9298215pjb.33.2020.08.24.03.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 03:06:11 -0700 (PDT)
Message-ID: <5f439113.1c69fb81.35b51.b435@mx.google.com>
Date:   Mon, 24 Aug 2020 03:06:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200824
Subject: next/master baseline: 305 runs, 14 regressions (next-20200824)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 305 runs, 14 regressions (next-20200824)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 3/4    =

exynos5422-odroidxu3 | arm   | lab-collabora | gcc-8    | exynos_defconfig =
            | 0/1    =

exynos5422-odroidxu3 | arm   | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3 | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3 | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =

omap4-panda          | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

omap4-panda          | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =

omap4-panda          | arm   | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =

rk3399-gru-kevin     | arm64 | lab-collabora | clang-10 | defconfig        =
            | 83/88  =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 82/88  =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200824/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200824
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d8be0e12a522d53a45f85fb241ffd06108d40b03 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f43557e5b26a2f6539fb43d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f43557e5b26a2f6=
539fb441
      new failure (last pass: next-20200821)
      2 lines

    2020-08-24 05:49:08.398000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-08-24 05:49:08.398000  (user:khilman) is already connected
    2020-08-24 05:49:24.622000  =00
    2020-08-24 05:49:24.622000  =

    2020-08-24 05:49:24.638000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-08-24 05:49:24.639000  =

    2020-08-24 05:49:24.639000  DRAM:  948 MiB
    2020-08-24 05:49:24.654000  RPI 3 Model B (0xa02082)
    2020-08-24 05:49:24.745000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-08-24 05:49:24.777000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (387 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3 | arm   | lab-collabora | gcc-8    | exynos_defconfig =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f435dd9a4969c48519fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f435dd9a4969c48519fb=
42c
      new failure (last pass: next-20200821)  =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3 | arm   | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4359f91bc9804de59fb4de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4359f91bc9804de59fb=
4df
      failing since 30 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3 | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f435b336f92ad023b9fb430

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f435b336f92ad023b9fb=
431
      failing since 30 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3 | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4361ce054fbebdef9fb42f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4361ce054fbebdef9fb=
430
      new failure (last pass: next-20200821)  =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
omap4-panda          | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f435c0447e90efda39fb42c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f435c0447e90ef=
da39fb432
      failing since 39 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-24 06:19:42.608000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-24 06:19:42.613000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-24 06:19:42.619000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-24 06:19:42.625000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-24 06:19:42.631000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-24 06:19:42.636000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-24 06:19:42.642000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-24 06:19:42.648000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-24 06:19:42.654000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-24 06:19:42.659000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
omap4-panda          | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f435d7307e85bc1cf9fb430

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f435d7307e85bc=
1cf9fb436
      failing since 39 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-24 06:25:50.138000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-24 06:25:50.144000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-24 06:25:50.149000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-24 06:25:50.156000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-24 06:25:50.161000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-24 06:25:50.167000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-24 06:25:50.173000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-24 06:25:50.179000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-24 06:25:50.185000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-08-24 06:25:50.191000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
omap4-panda          | arm   | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f435a32dcc649f61a9fb43c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f435a32dcc649f61a9fb=
43d
      failing since 33 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
rk3399-gru-kevin     | arm64 | lab-collabora | clang-10 | defconfig        =
            | 83/88  =


  Details:     https://kernelci.org/test/plan/id/5f435863d1a2e7c3b69fb435

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f435864d1a2e7c=
3b69fb48e
      failing since 3 days (last pass: next-20200819, first fail: next-2020=
0820)
      11 lines

    2020-08-24 06:04:10.057000  kern  :alert : Mem abort info:
    2020-08-24 06:04:10.060000  kern  :alert :   ESR =3D 0x96000006
    2020-08-24 06:04:10.066000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-08-24 06:04:10.070000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-08-24 06:04:10.073000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-08-24 06:04:10.076000  kern  :alert : Data abort info:
    2020-08-24 06:04:10.081000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-08-24 06:04:10.084000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-08-24 06:04:10.091000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000ebe4f000
    2020-08-24 06:04:10.103000  kern  :alert : [0000000000000010] pgd=3D000=
00000ebe49003, p4d=3D00000000ebe49003, pud=3D00000000efe32003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f435864d1a2=
e7c3b69fb48f
      failing since 3 days (last pass: next-20200819, first fail: next-2020=
0820)
      2 lines

    2020-08-24 06:04:10.124000  kern  :emerg : Code: 2a0303f4 721d102a 5400=
0040 b4000089 (f9400928) =

      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 82/88  =


  Details:     https://kernelci.org/test/plan/id/5f435534e090759b7b9fb460

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/5=
f435534e090759b7b9fb48f
      new failure (last pass: next-20200821)

    2020-08-24 05:50:40.072000  /lava-2566266/1/../bin/lava-test-case
     * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f435534e090=
759b7b9fb4b9
      failing since 3 days (last pass: next-20200819, first fail: next-2020=
0820)
      11 lines

    2020-08-24 05:50:33.589000  kern  :alert : Mem abort info:
    2020-08-24 05:50:33.593000  kern  :alert :   ESR =3D 0x96000006
    2020-08-24 05:50:33.598000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-08-24 05:50:33.602000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-08-24 05:50:33.606000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-08-24 05:50:33.609000  kern  :alert : Data abort info:
    2020-08-24 05:50:33.613000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-08-24 05:50:33.616000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-08-24 05:50:33.623000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000eb7b2000
    2020-08-24 05:50:33.635000  kern  :alert : [0000000000000010] pgd=3D000=
00000eb7b3003, p4d=3D00000000eb7b3003, pud=3D00000000eb7b4003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f435534e090=
759b7b9fb4ba
      failing since 3 days (last pass: next-20200819, first fail: next-2020=
0820)
      2 lines

    2020-08-24 05:50:33.656000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f43563491b39f4f499fb453

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200824/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200824/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f43563491b39f4f499fb=
454
      new failure (last pass: next-20200821)  =20
