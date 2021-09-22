Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2548E4143AF
	for <lists+linux-next@lfdr.de>; Wed, 22 Sep 2021 10:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233814AbhIVIZH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Sep 2021 04:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233349AbhIVIZH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Sep 2021 04:25:07 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6C6C061574
        for <linux-next@vger.kernel.org>; Wed, 22 Sep 2021 01:23:37 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id e16so2080412pfc.6
        for <linux-next@vger.kernel.org>; Wed, 22 Sep 2021 01:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zY97ChhSimvBsue6Ugc5nVm/sEUBb7rQ7WJmW3porLs=;
        b=TyFAeEgh4sbUyvJFkKcMgK45cxY5giqVaSnXjuvt00boqidNPI++Lz+H2Q52rQHnhH
         XxWXnFH1D3dfjb+D4P+2NMC8sVHxa18c8HIcM6hsHCKQlvNMAGFsDOfCEV9gbcA3K3Cx
         3ajbMRsnF6h4U8EBZQXfnJqirJmS35l7tCpFRkPyLWFLnNIOgQC2/0/26l1ZFzGU3ngD
         iW0eCmeEH+HL4jMNOpSQTTe8v6r8EGSwMSmupka2zpCUldAFJcb6udvtnNcTEeys9UMg
         ykCFC8dHqgHZ2nSqet2GQOMGjICjXRLJfUTBN6SpyBeHIRkDz3IJo4jMlCasyA2rxq6y
         kjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zY97ChhSimvBsue6Ugc5nVm/sEUBb7rQ7WJmW3porLs=;
        b=SlQyz/VS8KCIKQXgaStQLroibRIFRiMIL+Gko7kRZSexFHpbkEz8vOi0pvza0r1/EJ
         UYNwoi94M0wAdQlPN4g8uBiIu+jFRwF2i37G/+AAcz1qDiUMNCwDK8oqffm+bGzKlnio
         vVQRuod4dAOJOPyKlcaF2tF0dVD62qmnlM93OMSOFV/Ch4b5tpK7H+UEo2JJj7il9ZPd
         SHR027ILhGspdFxBx1cFNRjMLGR5OZv8BNGpq+zqw6wlnQNo5QzbO+v+OVN0JsMwtans
         MQG3yUqNPqqKJ7e3JsEeGrVIteW+IY7B0QlbZ4pE8SwAFUMRsRarZ0KOPus/DdDpNYbx
         niyg==
X-Gm-Message-State: AOAM531Z9Hjs/4ORPSnBgnAbIhbaPxcud87+Z0HNFXVn7Nr9zLwC9HDV
        G3yRdDrjDFwrcnO8agz4UpMsxubMhJHaDWz3
X-Google-Smtp-Source: ABdhPJwRoPYPeOcKqA1A0E0tVmWHzI861Sk8FRzGcXv7qfAtv8jsfcD/eM1Cjh1hdPxaL1QZCjF+SA==
X-Received: by 2002:a65:52cd:: with SMTP id z13mr31826151pgp.405.1632299016931;
        Wed, 22 Sep 2021 01:23:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o85sm1570881pfd.151.2021.09.22.01.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 01:23:36 -0700 (PDT)
Message-ID: <614ae808.1c69fb81.f38c3.4b7f@mx.google.com>
Date:   Wed, 22 Sep 2021 01:23:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc2-342-g118f3980b4fd
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 344 runs,
 8 regressions (v5.15-rc2-342-g118f3980b4fd)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 344 runs, 8 regressions (v5.15-rc2-342-g118f39=
80b4fd)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =

beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =

beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig   =
        | 1          =

beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig+im=
a       | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc2-342-g118f3980b4fd/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc2-342-g118f3980b4fd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      118f3980b4fd607dfcd03eb82c1ce1abf72013b6 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614ab2e32f3e0764db99a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614ab2e32f3e0764db99a=
3f2
        failing since 229 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614ab2708487f4567c99a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614ab2708487f4567c99a=
2ec
        new failure (last pass: v5.15-rc2-264-g01b5f226d2c8) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig   =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/614ab3c54daed1570099a34a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614ab3c54daed1570099a=
34b
        failing since 12 days (last pass: v5.14-10568-g1006eb19726f, first =
fail: v5.14-10891-g7e703ab62392) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
beagle-xm        | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig+im=
a       | 1          =


  Details:     https://kernelci.org/test/plan/id/614ab519c86b44cb9399a2de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614ab519c86b44cb9399a=
2df
        failing since 13 days (last pass: v5.14-10251-gfd7f1d781c08, first =
fail: v5.14-10568-g1006eb19726f) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig            =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/614ab16e3e7aff964d99a2ee

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/614ab16e3e7aff964d99a2f4
        failing since 71 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-22T04:30:30.937796  /lava-4558829/1/../bin/lava-test-case
    2021-09-22T04:30:30.950027  <8>[   25.444107] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/614ab16e3e7aff964d99a2f5
        failing since 71 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-22T04:30:28.881743  <8>[   23.375019] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-09-22T04:30:29.904294  /lava-4558829/1/../bin/lava-test-case
    2021-09-22T04:30:29.916349  <8>[   24.410744] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/614ab444cd1976f4c699a2da

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc2-3=
42-g118f3980b4fd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/614ab444cd1976f4c699a2e0
        failing since 71 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-22T04:42:25.110107  /lava-4558891/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/614ab444cd1976f4c699a2e1
        failing since 71 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-22T04:42:24.075441  /lava-4558891/1/../bin/lava-test-case
    2021-09-22T04:42:24.087353  <8>[   24.324001] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
