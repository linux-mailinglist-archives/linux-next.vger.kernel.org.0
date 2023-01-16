Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4C966B5E7
	for <lists+linux-next@lfdr.de>; Mon, 16 Jan 2023 04:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjAPDNX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Jan 2023 22:13:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbjAPDNW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Jan 2023 22:13:22 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296054C17
        for <linux-next@vger.kernel.org>; Sun, 15 Jan 2023 19:13:20 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id s67so18761228pgs.3
        for <linux-next@vger.kernel.org>; Sun, 15 Jan 2023 19:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7BPMquE82sK23WMl7nVCKgGOljD1XZnQ+CR5nQZ0/7I=;
        b=llYi7kFMY5oUyDLl2hD8AHYMm5CsmZMHZezIi97hw9dw8N58PCZFakvQPVHoIMoe/a
         O66uRqCEhmdELgmCJwm6XnGdV6T27vLDVLzD2NsEtWi20Ul6ELxRYes8qpP4hv5FLTx0
         k+GuCYgS0yNTBtDcl5Pq+XWwD22cWAn6yy1SBr2I0IVuM7mi+PU1BgIydxu/28hLfRhE
         TUZde0X4xrTVI56ndj9R1uragbY9q1OsTARF/ECmSDKjwuRyxSqHqF+XPxGiULyLIRtt
         YySximbPTAUzSmgyTzDorcRN7VtXgNLJfejQC3a9mu9+bxCfEimgchqFSCtOIDsyxrbm
         7fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BPMquE82sK23WMl7nVCKgGOljD1XZnQ+CR5nQZ0/7I=;
        b=SzJQF1iFhS+wPnbe8MTNpnmWb7GjPA4GdI64JIJVRv0JItmuJT2XApcGs/XjqNMmA8
         B9LGse9IqxHeyNdv9e93XMO76//CRo2F4032Aatabt2riJhxZzhtxbOHq9hoRGX9SUBu
         URVA1zWJooM1b9UB0XwOj2eRweRXlaO+xeJ7AKobcQCDA+Mjnyfo5INdJdW+GSsE5duO
         Af5r7xUmUNX+eCw5tNP3GnMWYkN6G/3pOjh3xF/avueuPMzvjRwX9hsRszdhNhu6w0HB
         3PijTlFCjeTHDFBv7NxXWe+71BXxv6Wte+2MXFZhH3lEs0EgZay/6tRLhE4ycW7owhWB
         ZSbw==
X-Gm-Message-State: AFqh2kqXLUe4/3gBh08Yrf8dBRDzomBrx0XxvFIZR/1psD472w6n4B44
        A/8XRr6gq0z5UbU57Jdk29K11M+VafLkpw/PnXE=
X-Google-Smtp-Source: AMrXdXt2NmzpqbpqGmNZLal503tKVKf1+sHLMGqcPHfbg+tXfeuEBwFSbz+TqVZI7Xg4Ju5Tql4aKg==
X-Received: by 2002:aa7:9703:0:b0:589:d850:7ea5 with SMTP id a3-20020aa79703000000b00589d8507ea5mr24632646pfg.6.1673838799261;
        Sun, 15 Jan 2023 19:13:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 1-20020a620601000000b005814aafa224sm16998552pfg.196.2023.01.15.19.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 19:13:18 -0800 (PST)
Message-ID: <63c4c0ce.620a0220.92744.bb88@mx.google.com>
Date:   Sun, 15 Jan 2023 19:13:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc4-269-g1ab337b63ead
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 429 runs,
 12 regressions (v6.2-rc4-269-g1ab337b63ead)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 429 runs, 12 regressions (v6.2-rc4-269-g1ab337=
b63ead)

Regressions Summary
-------------------

platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b        | arm  | lab-collabora | gcc-10   | bcm2835_defconfi=
g            | 1          =

imx6dl-udoo            | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx6q-udoo             | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx6sx-sdb             | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx6sx-sdb             | arm  | lab-nxp       | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

imx7d-sdb              | arm  | lab-nxp       | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

odroid-xu3             | arm  | lab-collabora | gcc-10   | multi_v7_defconf=
ig           | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig           | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+ima       | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | sunxi_defconfig =
             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc4-269-g1ab337b63ead/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc4-269-g1ab337b63ead
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1ab337b63ead788901ed1fadb16f15cc28ea810a =



Test Regressions
---------------- =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b        | arm  | lab-collabora | gcc-10   | bcm2835_defconfi=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/63c489ca8042a673c51d39e0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c489ca8042a673c51d39e5
        failing since 4 days (last pass: v6.2-rc3-243-g3145d9dfed32, first =
fail: v6.2-rc3-296-g79fa898551af)

    2023-01-15T23:18:12.989015  / # #
    2023-01-15T23:18:13.091973  export SHELL=3D/bin/sh
    2023-01-15T23:18:13.092879  #
    2023-01-15T23:18:13.195061  / # export SHELL=3D/bin/sh. /lava-8729680/e=
nvironment
    2023-01-15T23:18:13.195925  =

    2023-01-15T23:18:13.298403  / # . /lava-8729680/environment/lava-872968=
0/bin/lava-test-runner /lava-8729680/1
    2023-01-15T23:18:13.299486  =

    2023-01-15T23:18:13.307136  / # /lava-8729680/bin/lava-test-runner /lav=
a-8729680/1
    2023-01-15T23:18:13.424620  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-15T23:18:13.425204  + cd /lava-8729680/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6dl-udoo            | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48ada3ab88c30811d3a28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c48ada3ab88c30811d3=
a29
        failing since 130 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6q-udoo             | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48a167634649c2d1d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c48a167634649c2d1d3=
9d2
        failing since 131 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6sx-sdb             | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c488d969c0f184bf1d3a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c488d969c0f184bf1d3=
a43
        failing since 131 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6sx-sdb             | arm  | lab-nxp       | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48be8f62eba1eca1d3a61

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c48be8f62eba1eca1d3a64
        failing since 11 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-15T23:26:44.628381  / # #
    2023-01-15T23:26:45.788650  export SHELL=3D/bin/sh
    2023-01-15T23:26:45.794309  #
    2023-01-15T23:26:47.342132  / # export SHELL=3D/bin/sh. /lava-1137345/e=
nvironment
    2023-01-15T23:26:47.347816  =

    2023-01-15T23:26:47.348109  / # . /lava-1137345/environment
    2023-01-15T23:26:50.170592  / # /lava-1137345/bin/lava-test-runner /lav=
a-1137345/1
    2023-01-15T23:26:50.176656  /lava-1137345/bin/lava-te<4>[   30.668710] =
pwm-backlight backlight-display: supply power not found, using dummy regula=
tor
    2023-01-15T23:26:50.176914  <4>[   30.684350] etnaviv-gpu 1800000.gpu: =
deferred probe timeout, ignoring dependency
    2023-01-15T23:26:50.177156  <4>[   30.692093] etnaviv-gpu: probe of 180=
0000.gpu failed with error -110 =

    ... (32 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx7d-sdb              | arm  | lab-nxp       | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48b5cfacb9e35dc1d3a09

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c48b5cfacb9e35dc1d3a0c
        failing since 11 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-15T23:25:03.034107  + set<8>[   18.772138] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1137343_1.5.2.4.1>
    2023-01-15T23:25:03.034363   +x
    2023-01-15T23:25:03.140015  / # #
    2023-01-15T23:25:04.300248  export SHELL=3D/bin/sh
    2023-01-15T23:25:04.305966  #
    2023-01-15T23:25:05.853652  / # export SHELL=3D/bin/sh. /lava-1137343/e=
nvironment
    2023-01-15T23:25:05.859338  =

    2023-01-15T23:25:08.681202  / # . /lava-1137343/environment/lava-113734=
3/bin/lava-test-runner /lava-1137343/1
    2023-01-15T23:25:08.687353  =

    2023-01-15T23:25:08.687778  / # /lava-1137343/bin/lava-t<4>[   22.97866=
5] usb_phy_generic usbphynop3: deferred probe timeout, ignoring dependency =

    ... (34 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
odroid-xu3             | arm  | lab-collabora | gcc-10   | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48abb35d5d18ff91d39cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid=
-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid=
-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c48abb35d5d18ff91d3=
9ce
        new failure (last pass: v6.2-rc3-489-gb8bb47ae576b) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48894f1897f58bc1d3ae7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c48894f1897f58bc1d3aea
        failing since 10 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-15T23:13:07.363443  [   18.890010] <LAVA_SIGNAL_ENDRUN 0_dmesg =
379669_1.5.2.4.1>
    2023-01-15T23:13:07.470136  / # #
    2023-01-15T23:13:07.572444  export SHELL=3D/bin/sh
    2023-01-15T23:13:07.573088  #[   19.016613] usb-storage 2-1.1:1.0: USB =
Mass Storage device detected
    2023-01-15T23:13:07.573468  [   19.024806] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-15T23:13:07.573769  =

    2023-01-15T23:13:07.574075  / # [   19.037911] usbcore: registered new =
interface driver uas
    2023-01-15T23:13:07.675483  export SHELL=3D/bin/sh. /lava-379669/enviro=
nment
    2023-01-15T23:13:07.676121  =

    2023-01-15T23:13:07.777802  / # . /lava-379669/environment/lava-379669/=
bin/lava-test-runner /lava-379669/1 =

    ... (26 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48a25ee67e8d9d91d3a13

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c48a25ee67e8d9d91d3a16
        failing since 11 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-15T23:20:00.251451  / # #
    2023-01-15T23:20:00.353866  export SHELL=3D/bin/sh
    2023-01-15T23:20:00.354523  #
    2023-01-15T23:20:00.456139  / # export SHELL=3D/bin/sh. /lava-379679/en=
vironment
    2023-01-15T23:20:00.456813  =

    2023-01-15T23:20:00.558512  / # . /lava-379679/environment/lava-379679/=
bin/lava-test-runner /lava-379679/1
    2023-01-15T23:20:00.559654  =

    2023-01-15T23:20:00.575334  / # /lava-379679/bin/lava-test-runner /lava=
-379679/1
    2023-01-15T23:20:00.655547  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-15T23:20:00.693777  + cd /lava-379679/1/tests/1_bootrr =

    ... (17 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48ac535d5d18ff91d39ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c48ac535d5d18ff91d39ed
        failing since 11 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-15T23:22:37.424835  [   18.117242] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-15T23:22:37.425177  + set +x[   18.124073] <LAVA_SIGNAL_ENDRUN =
0_dmesg 379688_1.5.2.4.1>
    2023-01-15T23:22:37.425482  =

    2023-01-15T23:22:37.425771  [   18.130518] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-15T23:22:37.426365  / # [   18.144423] usbcore: registered new =
interface driver uas
    2023-01-15T23:22:37.532533  #
    2023-01-15T23:22:37.634876  export SHELL=3D/bin/sh
    2023-01-15T23:22:37.635585  #
    2023-01-15T23:22:37.737114  / # export SHELL=3D/bin/sh. /lava-379688/en=
vironment
    2023-01-15T23:22:37.737816   =

    ... (27 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48b299595e342841d3a80

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c48b299595e342841d3a83
        failing since 11 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-15T23:24:00.716517  [   20.406039] <LAVA_SIGNAL_ENDRUN 0_dmesg =
379692_1.5.2.4.1>
    2023-01-15T23:24:00.823115  / # #
    2023-01-15T23:24:00.925466  export SHELL=3D/bin/sh
    2023-01-15T23:24:00.926212  #[   20.519356] usb-storage 2-1.1:1.0: USB =
Mass Storage device detected
    2023-01-15T23:24:00.926563  [   20.528860] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-15T23:24:00.926863  =

    2023-01-15T23:24:00.927172  [   20.542612] usbcore: registered new inte=
rface driver uas
    2023-01-15T23:24:01.028459  / # export SHELL=3D/bin/sh. /lava-379692/en=
vironment
    2023-01-15T23:24:01.029061  =

    2023-01-15T23:24:01.130495  / # . /lava-379692/environment/lava-379692/=
bin/lava-test-runner /lava-379692/1 =

    ... (22 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | sunxi_defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c48a75827747bdd71d3a29

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-26=
9-g1ab337b63ead/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c48a75827747bdd71d3a2c
        failing since 11 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-15T23:21:06.554635  [   15.493367] <LAVA_SIGNAL_ENDRUN 0_dmesg =
379684_1.5.2.4.1>
    2023-01-15T23:21:06.661186  / # #
    2023-01-15T23:21:06.763463  export SHELL=3D/bin/sh
    2023-01-15T23:21:06.764111  #
    2023-01-15T23:21:06.865737  / # export SHELL=3D/bin/sh. /lava-379684/en=
vironment
    2023-01-15T23:21:06.866340  =

    2023-01-15T23:21:06.968008  / # . /lava-379684/environment/lava-379684/=
bin/lava-test-runner /lava-379684/1
    2023-01-15T23:21:06.969045  =

    2023-01-15T23:21:06.985464  / # /lava-379684/bin/lava-test-runner /lava=
-379684/1
    2023-01-15T23:21:07.095475  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
