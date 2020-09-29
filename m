Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0E927D3BF
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 18:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgI2Qju (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 12:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbgI2Qjt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Sep 2020 12:39:49 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC93C061755
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2020 09:39:49 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id u3so2942837pjr.3
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2020 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oyQky7+3AraExufa/6K/0VKmQF608wXNFuq3D1TYN78=;
        b=MJvywrPYzoI8mjWXFsuoZ040N3u74zsXAjP78/qh+xowHQWTDDrpJUXEHdf0vCufu/
         6BNIhKojMRci8c5F2M4IaFJt2GLEU4f4OxCb3ftmBY2rKZpdQeiS8deLT+kU44EvmSbb
         bq8wwFYeK1xwqUYoO30su+OZhiD4XmkLZfwJoyej1rQ1dwBTM8n2qTq00A2O2FqkZ9V4
         2LFiD8nBFSb6mfJ1VJRd5dm9zUiO9QpvrQSQAOiDWhvvK3Nawf3I7OXYaLfhdRnJd1xQ
         fZvKUCFMu90PtKo06I5XCXsc4vgSm851ZbEogrVecaAFeCnCeuRMauZJqO7+tumqE1QR
         82lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oyQky7+3AraExufa/6K/0VKmQF608wXNFuq3D1TYN78=;
        b=Q9PiwduiCeQZ/bynAT6fZNOWDzL8OU6rMf9nbN4wDorY6ewcPiHaAZy1EfzKoQ4685
         +dj79gt+WOYfIRUrjMEm6Xwgy+RIjQ3OZmaHF4MXqmhoFAC1FPnmm2qqOknW1FVL1o10
         eGd4z4mRgLTYseUQ+TYLE5jo9O9eGwu4YsKYJf7lHjt8ulYPA/QLsD35UGl4rO7xiG7+
         GnPFwYpkLrzoi/1Tqfk/AhPHXkBCtyMSGaQU23A4oiexVRS9FPlpB5DQJyGJhGnY24qv
         KTasrfOkOTPpsPdf2cFiFNjvCWFxBfjoY53YtYAFCC/r/tndE7sjzVB389A9XH8JGIEU
         QIuA==
X-Gm-Message-State: AOAM530iPMGJN2gyl/XZfUveQ4mWapLl2wQS7b7VXhbNvkYUiXKH4BiP
        EJ0Dy5sQR2lj1iejsfSf9KMITFFr1tEJoA==
X-Google-Smtp-Source: ABdhPJx6yOeoMlVSBeNKYDfb1QcDV4Qj2VZz0VyNkefHDKgVmhGN03nOjN6VCVhw9X7JEkzw+3EK9A==
X-Received: by 2002:a17:90a:ec05:: with SMTP id l5mr4928962pjy.172.1601397588559;
        Tue, 29 Sep 2020 09:39:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r16sm5067107pjo.19.2020.09.29.09.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 09:39:47 -0700 (PDT)
Message-ID: <5f736353.1c69fb81.1d5c0.9d90@mx.google.com>
Date:   Tue, 29 Sep 2020 09:39:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc7-231-g4deb97cf4129
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 267 runs,
 6 regressions (v5.9-rc7-231-g4deb97cf4129)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 267 runs, 6 regressions (v5.9-rc7-231-g4deb97c=
f4129)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =

bcm2837-rpi-3-b-32    | arm  | lab-baylibre  | gcc-8    | bcm2835_defconfig=
            | 3/4    =

odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =

panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =

rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc7-231-g4deb97cf4129/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc7-231-g4deb97cf4129
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4deb97cf41297771f12cf0f879d948fe1a2ac8f0 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f732eff8dcb1c441abf9df9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f732eff8dcb1c441abf9=
dfa
      failing since 147 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b-32    | arm  | lab-baylibre  | gcc-8    | bcm2835_defconfig=
            | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7330ae15bc8fe2a9bf9dbd

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f7330ae15bc8fe=
2a9bf9dc3
      new failure (last pass: v5.9-rc6-434-gee3b543117db)
      92 lines

    2020-09-29 13:03:30.562000  kern  :emerg : Stack: (0xc421bb10 to 0xc421=
c000)
    2020-09-29 13:03:30.563000  kern  :emerg : bb00:                       =
              00000000 00000008 c421bb5c c4238800
    2020-09-29 13:03:30.564000  kern  :emerg : bb20: c4238800 c0e04248 c0e0=
4248 c027d384 00000001 00000002 c421bb9c c421bb48
    2020-09-29 13:03:30.565000  kern  :emerg : bb40: c03ac02c c03aba68 0000=
0000 00000009 c421bc24 c421bb60 c0282380 c03a5894
    2020-09-29 13:03:30.604000  kern  :emerg : bb60: 00000001 00112cc0 c013=
2d70 0dc0c364 00000000 00000008 c4238800 c0e04248
    2020-09-29 13:03:30.605000  kern  :emerg : bb80: eaa9ecc0 c027d384 0000=
0001 00000002 c421bc0c c421bba0 c03ac350 c03ac00c
    2020-09-29 13:03:30.606000  kern  :emerg : bba0: 00001000 00000000 0000=
0018 00000000 00000010 00000000 00000011 00000000
    2020-09-29 13:03:30.607000  kern  :emerg : bbc0: 00000012 00000000 0000=
0013 00000000 00000014 00000000 00000015 0dc0c364
    2020-09-29 13:03:30.608000  kern  :emerg : bbe0: c421bc0c c4238800 c0e0=
4248 00000001 eaa9ecc0 c027d384 00000001 00000002
    2020-09-29 13:03:30.647000  kern  :emerg : bc00: c421bc24 c421bc10 c028=
131c c03ac240 c421bd20 c0e04248 c421bcac c421bc28
    ... (80 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f735cc15ca59997cc87717d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f735cc15ca59997cc877=
17e
      failing since 55 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f732f3648b82d8615bf9dde

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f732f3648b82d8=
615bf9de4
      failing since 55 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-29 12:57:20.143000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-29 12:57:20.148000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-29 12:57:20.154000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-29 12:57:20.159000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-29 12:57:20.165000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-29 12:57:20.171000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-29 12:57:20.177000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-29 12:57:20.183000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-29 12:57:20.188000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-29 12:57:20.194000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f732efe8dcb1c441abf9dea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f732efe8dcb1c441abf9=
deb
      failing since 55 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f73475c87892e1a65bf9db7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-23=
1-g4deb97cf4129/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f73475c87892e1a65bf9=
db8
      new failure (last pass: v5.9-rc6-434-gee3b543117db)  =20
