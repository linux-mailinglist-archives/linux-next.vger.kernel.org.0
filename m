Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C30737BF0D
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 15:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhELOAR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 10:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbhELOAR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 May 2021 10:00:17 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BADFC061574
        for <linux-next@vger.kernel.org>; Wed, 12 May 2021 06:59:09 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id s22so18240224pgk.6
        for <linux-next@vger.kernel.org>; Wed, 12 May 2021 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lMiYly+yWOth/Eon/8kTHVXxexT+WJZa4HpdjdpdvQs=;
        b=YTu+90S7pDJj4c8dQETpPPxjIo0s4itBYkcMWnxxnSv6OdQTDELbj6WAno4nubIGGp
         ZUnLLWQN+T9ptGBH1mEXvZsokO1deSWVREMCAyZ5kGGai/xm/tPB4HPwSmF1eQKkNQlJ
         3TWxQO27iHTDwYP2tqRJ/7KRlB0g3V4zzZYdFsP3UCIZPGyn1xaeJOO2p33+T9SyIPSG
         ru/aL/pArYwosbpMRxxtLL6/KXvwWgy1f2RcQs0kBpUF1n6OeIkj76kvEd4E/dzViULY
         zjXxrmiKctyz1K9sLeV7l3n+8K2W1lx6rmdjDEhynuDjz48wHe3KsezuSQU9CGkEQNSL
         t23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lMiYly+yWOth/Eon/8kTHVXxexT+WJZa4HpdjdpdvQs=;
        b=CjukanhV3IJBci9aVlFok3ZUrYfuroxz1GkEPBr5VHERl0Az/rN/ozBK/aBfkv+KL+
         VYVUlDk5M6+8zjdNWStVpgM39DSUDgqOeicVYNpwbZ4eccQaTRFPhfWbiv8xucsNe5OB
         xzxEjAKsKUYcavuw8aogHQVQEITnSKcJqrtiFn7NIXey4NEvilLDQGpxJB+wj+PhGnhi
         LgQP2FYJkAlXTEZCh1BFLvJoIJA7fwcPAzsV+htqQBtDDRYoZmv3q7xpyoTJEHI2aBmo
         GLmjv5GCKkx+trAY6uyPHPhFCH+T3oPB1y+8JMBYzGWMwgEmjq61uww/DJwwZimyl6la
         4zxg==
X-Gm-Message-State: AOAM5312KEI7jK3wx4LBEm0eK3rtvZ2BZGHjJ1kdLflMi9PEWzzPE9Or
        cdkXDkL0ABjQK0szHTXMCSfDJQf7zGoilisd
X-Google-Smtp-Source: ABdhPJy67LZP0/sAEWuLxVFrVkXH5r64Zsk4fKfGnIsHb0oq71TyHlqRtfJJhBqxqyOhqEyuKL+SgQ==
X-Received: by 2002:a62:31c4:0:b029:28d:1ad0:340c with SMTP id x187-20020a6231c40000b029028d1ad0340cmr34802633pfx.35.1620827948353;
        Wed, 12 May 2021 06:59:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y199sm22887pfc.191.2021.05.12.06.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:59:08 -0700 (PDT)
Message-ID: <609bdf2c.1c69fb81.4a980.0112@mx.google.com>
Date:   Wed, 12 May 2021 06:59:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.13-rc1-286-g369a8c32f8a4c
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 350 runs,
 11 regressions (v5.13-rc1-286-g369a8c32f8a4c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 350 runs, 11 regressions (v5.13-rc1-286-g369a8=
c32f8a4c)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-p241 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-rc1-286-g369a8c32f8a4c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc1-286-g369a8c32f8a4c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      369a8c32f8a4cd3b614b1cc1453b2f7f2036301a =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/609baa057a1c973ec9d08f27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora=
/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora=
/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609baa057a1c973ec9d08=
f28
        failing since 96 days (last pass: v5.11-rc6-256-gf889022827dc, firs=
t fail: v5.11-rc6-298-g490f4659faae) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/609ba6a94e9e4bb4e0d08fc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ba6a94e9e4bb4e0d08=
fca
        failing since 1 day (last pass: v5.12-14769-gf2b8e46e5bad, first fa=
il: v5.13-rc1-87-g1da19d8b4599) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609ba8a52d30543b5dd08f53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ba8a52d30543b5dd08=
f54
        failing since 1 day (last pass: v5.13-rc1-87-g1da19d8b4599, first f=
ail: v5.13-rc1-216-gaf09555f31c4b) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxl-s805x-p241 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609bb0f51b61a43addd08f5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609bb0f51b61a43addd08=
f5c
        new failure (last pass: v5.13-rc1-87-g1da19d8b4599) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/609ba6574e9e4bb4e0d08f22

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/609ba6574e9e4bb4e0d08f36
        failing since 15 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7)

    2021-05-12 09:56:31.904000+00:00  /lava-3787301/1/../bin/lava-test-case
    2021-05-12 09:56:31.913000+00:00  <8>[   56.156143] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/609=
ba6574e9e4bb4e0d08f3c
        failing since 15 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7)

    2021-05-12 09:56:33.028000+00:00  <8>[   57.271083] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609ba58ac37d63a7c9d08f75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ba58ac37d63a7c9d08=
f76
        failing since 177 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609ba52b7733603dfed08f39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ba52b7733603dfed08=
f3a
        failing since 177 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609bbed7a0e13abc68d08f26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609bbed7a0e13abc68d08=
f27
        failing since 177 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609ba48e72d86c3b96d08f2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609ba48e72d86c3b96d08=
f2c
        failing since 177 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609bbaafac9675d1a3d08f3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
86-g369a8c32f8a4c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609bbaafac9675d1a3d08=
f40
        failing since 177 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
