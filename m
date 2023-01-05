Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512A765E316
	for <lists+linux-next@lfdr.de>; Thu,  5 Jan 2023 03:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjAEC4s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Jan 2023 21:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjAEC4d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2023 21:56:33 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05E77659
        for <linux-next@vger.kernel.org>; Wed,  4 Jan 2023 18:56:29 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id k19so16678885pfg.11
        for <linux-next@vger.kernel.org>; Wed, 04 Jan 2023 18:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7dhnnJs1sS80MQRkdkZj8+b3bXaCJq6umZwQwOMIavs=;
        b=O2tDBooHZo2v0iPFTSChHQY+wc4Z6eElhniCZ/ZaNC0TTHDZB0rOP2WtyZc8lcomYu
         YIQhTrLRtj+Aj0lZHYOepNufjWGfVtLkwvKQnXmjGElSgr7fcLTsVi8W55E4OUKYoWRK
         3minkZN9Wvh7PNYzlolE/ElGO2qDTOIOG6DJvks4jXNc5wM7HkOLNMW05pkqURkCOVH3
         13EWRQFpbf79/whhuaFOuCRruK2U9MLa8DKssEy6MJT6l3YRBSgLUqJjtTyROOsLZIVK
         2Cdos9BUMccV884mght1es4Lm0nJBQXqN8t9LDdqsbUKXMocFlBCSKOc5Fl9+h9cnovI
         yfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dhnnJs1sS80MQRkdkZj8+b3bXaCJq6umZwQwOMIavs=;
        b=nXBLlUs+9fGX6fvdvbsTLYjBPnXlqYkW0ITQIBEgYvvJIbV3EtSbdU1KRj3SxovWup
         9qvatJdLpUDTSqFjENkzW07aQYfOtCvyHTrP0AU3nbknv1VwyG1UuH0HWdddCJSb01/4
         fasghsvaESilxsMNr3F1Re7JsY1jmbppJF0Rz6/zwALBFTM018s3rzxYsMG/ujco/VbW
         JN60Ley3Jvj2dgi8tK5wQ3BIhaWRBRa3ZtzndwEa/DKtFFwUf3hdlQRYbmJELktBg/uF
         9eA1pry7f30oUlirXiMqUYTQrvNt5KASmxRRIxCcum4eieI5eC3dhy+br2Z7LlFLs+MQ
         5tYw==
X-Gm-Message-State: AFqh2ko4wvnRkVL+uVd5nRqMw62f+pdzhK1C4c57VlG6WY4DNkBwfMTe
        MKFADBW9wK3L676vam8Hp4pFo+o1FPsvYk/vUk2GXQ==
X-Google-Smtp-Source: AMrXdXvUq8PGE0bP1Ikh4rcvs6lBX0fQaLZ3j00tQAykWzqTyb4CI8TUnYE2erxmSZE8vzEP1Tix9Q==
X-Received: by 2002:a62:32c3:0:b0:580:f1b0:2211 with SMTP id y186-20020a6232c3000000b00580f1b02211mr34954267pfy.18.1672887388402;
        Wed, 04 Jan 2023 18:56:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d8-20020a621d08000000b00580cc63dce8sm20821783pfd.77.2023.01.04.18.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 18:56:28 -0800 (PST)
Message-ID: <63b63c5c.620a0220.10858.07bd@mx.google.com>
Date:   Wed, 04 Jan 2023 18:56:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc2-332-g2d3ca5d07c8e
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 482 runs,
 33 regressions (v6.2-rc2-332-g2d3ca5d07c8e)
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

next/pending-fixes baseline: 482 runs, 33 regressions (v6.2-rc2-332-g2d3ca5=
d07c8e)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc2-332-g2d3ca5d07c8e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc2-332-g2d3ca5d07c8e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2d3ca5d07c8e43c0bdb602fad9396b140f7b9857 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63b608004720eb6b854eee9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b608004720eb6b854ee=
e9f
        failing since 9 days (last pass: v6.1-rc6-391-gf445421fe4c7, first =
fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60b2873979a13e84eee24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b60b2873979a13e84ee=
e25
        failing since 58 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60791a67db47b904eee36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b60791a67db47b904ee=
e37
        failing since 119 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b608841294cb425d4eee8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b608841294cb425d4ee=
e8d
        failing since 120 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60b27b3890ba50f4eee27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b60b27b3890ba50f4ee=
e28
        failing since 111 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b607ca3f58a23ba64eee28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b607ca3f58a23ba64ee=
e29
        failing since 120 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b6063addc493ad534eeef1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b6063addc493ad534eeef6
        new failure (last pass: v6.1-rc4-405-g5cc6cef624e2)

    2023-01-04T23:04:44.129444  <8>[   30.700058] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1128908_1.5.2.4.1>
    2023-01-04T23:04:44.234308  / # #
    2023-01-04T23:04:45.394250  export SHELL=3D/bin/sh
    2023-01-04T23:04:45.399653  #
    2023-01-04T23:04:46.945607  / # export SHELL=3D/bin/sh. /lava-1128908/e=
nvironment
    2023-01-04T23:04:46.951280  =

    2023-01-04T23:04:49.773547  / # . /lava-1128908/environment/lava-112890=
8/bin/lava-test-runner /lava-1128908/1
    2023-01-04T23:04:49.779617  =

    2023-01-04T23:04:49.779885  / # /lava-1128908/bin/lava-test-<4>[   35.1=
48778] pwm-backlight backlight-display: supply power not found, using dummy=
 regulator
    2023-01-04T23:04:49.780134  r<4>[   35.168178] etnaviv-gpu 1800000.gpu:=
 deferred probe timeout, ignoring dependency =

    ... (33 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b607ae135e5d5b344eee26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x1=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x1=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b607ae135e5d5b344ee=
e27
        failing since 119 days (last pass: v6.0-rc3-304-gd62f6b276548, firs=
t fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b6062bf9abb8e2a14eef4f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b6062bf9abb8e2a14eef54
        new failure (last pass: v6.1-rc4-339-g185da88d03ed)

    2023-01-04T23:04:43.384148  + set +x
    2023-01-04T23:04:43.385200  <8>[   35.496083] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1128910_1.5.2.4.1>
    2023-01-04T23:04:43.493402  =

    2023-01-04T23:04:44.652953  / # #export SHELL=3D/bin/sh
    2023-01-04T23:04:44.658548  =

    2023-01-04T23:04:46.204468  / # export SHELL=3D/bin/sh. /lava-1128910/e=
nvironment
    2023-01-04T23:04:46.209923  =

    2023-01-04T23:04:49.031197  / # . /lava-1128910/environment/lava-112891=
0/bin/lava-test-runner /lava-1128910/1
    2023-01-04T23:04:49.037253  =

    2023-01-04T23:04:49.037568  / # /lava-1128910/bin/lava-<4>[   39.626397=
] pwm-backlight backlight-display: supply power not found, using dummy regu=
lator =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b6062ef9abb8e2a14eef5a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b6062ef9abb8e2a14eef5f
        new failure (last pass: v6.1-rc6-391-gf445421fe4c7)

    2023-01-04T23:04:04.229043  + set<8>[   19.410284] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1128911_1.5.2.4.1>
    2023-01-04T23:04:04.229241   +x
    2023-01-04T23:04:04.332930  / # #
    2023-01-04T23:04:05.491375  export SHELL=3D/bin/sh
    2023-01-04T23:04:05.496728  #
    2023-01-04T23:04:07.041671  / # export SHELL=3D/bin/sh. /lava-1128911/e=
nvironment
    2023-01-04T23:04:07.047066  =

    2023-01-04T23:04:09.865047  / # . /lava-1128911/environment/lava-112891=
1/bin/lava-test-runner /lava-1128911/1
    2023-01-04T23:04:09.870701  =

    2023-01-04T23:04:09.870861  / # /lava-1128911/bin/lava-t<4>[   23.61802=
7] usb_phy_generic usbphynop3: deferred probe timeout, ignoring dependency =

    ... (34 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b607ce46a2c356264eee2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b607ce46a2c356264ee=
e2b
        failing since 153 days (last pass: v5.19-1483-gffa33bbcf63ea, first=
 fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60627f9abb8e2a14eeecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b60627f9abb8e2a14eeed0
        new failure (last pass: v6.1-rc6-391-gf445421fe4c7)

    2023-01-04T23:04:18.553437  + set +x<8>[   33.632032] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1128909_1.5.2.4.1>
    2023-01-04T23:04:18.553753  =

    2023-01-04T23:04:18.662963  / # #
    2023-01-04T23:04:19.822804  export SHELL=3D/bin/sh
    2023-01-04T23:04:19.828509  #
    2023-01-04T23:04:19.828781  / # export SHELL=3D/bin/sh
    2023-01-04T23:04:21.375781  / # . /lava-1128909/environment
    2023-01-04T23:04:24.201989  /lava-1128909/bin/lava-test-runner /lava-11=
28909/1
    2023-01-04T23:04:24.207851  . /lava-1128909/environment
    2023-01-04T23:04:24.208114  / # /lava-1128909/bin/lava-test-runner /lav=
a-1128909/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63b60982cffcebd3d14eee22

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63b60982cffcebd=
3d14eee29
        new failure (last pass: v6.1-14044-gc28c7d2a33a8)
        2 lines

    2023-01-04T23:19:16.549450  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-01-04T23:19:16.550444  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-01-04T23:19:16.551505  kern  :alert :   FSC <8>[   48.393171] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D2>
    2023-01-04T23:19:16.552504  =3D 0x05: lev<8>[   48.400112] <LAVA_SIGNAL=
_ENDRUN 0_dmesg 3106763_1.5.2.4.1>
    2023-01-04T23:19:16.553504  el 1 translation fault
    2023-01-04T23:19:16.554491  kern  :alert : Data abort info:   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63b60982cffcebd=
3d14eee2a
        new failure (last pass: v6.1-14044-gc28c7d2a33a8)
        12 lines

    2023-01-04T23:19:16.542459  kern  <8>[   48.366939] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2023-01-04T23:19:16.543646  :alert :   ESR =3D 0x0000000096000045
    2023-01-04T23:19:16.544655  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63b6065ff579f49ccc4eee35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b6065ff579f49ccc4ee=
e36
        failing since 84 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60cb76f33bd9e7b4eee57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-linaro=
-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-linaro=
-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b60cb76f33bd9e7b4ee=
e58
        new failure (last pass: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60b3a323b2f32864eee34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b60b3a323b2f32864ee=
e35
        failing since 84 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60b4d9245a04bf14eee1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b60b4d9245a04bf14ee=
e1d
        failing since 84 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60b1c48427086d54eee1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b60b1c48427086d54ee=
e1f
        failing since 84 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60b38a5cdb5d9354eee75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b60b38a5cdb5d9354ee=
e76
        failing since 84 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60b3b1c095e0ada4eee41

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b60b3b1c095e0ada4ee=
e42
        failing since 84 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63b609d033c76c242d4eee5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b609d033c76c242d4ee=
e5c
        new failure (last pass: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63b609d2f3f30a54264eee45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b609d2f3f30a54264ee=
e46
        new failure (last pass: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63b604444f7d7699724eee6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b604444f7d7699724ee=
e6f
        failing since 21 days (last pass: v6.1-2435-g5c02e5d167d0, first fa=
il: v6.1-6378-g44d433ee7540) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b603f6b1624e0aa04eeedc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b603f6b1624e0aa04eeedf
        new failure (last pass: v6.1-2435-g5c02e5d167d0)

    2023-01-04T22:55:25.597163  / # #
    2023-01-04T22:55:25.699401  export SHELL=3D/bin/sh
    2023-01-04T22:55:25.699974  #
    2023-01-04T22:55:25.801628  / # export SHELL=3D/bin/sh. /lava-374052/en=
vironment
    2023-01-04T22:55:25.802341  =

    2023-01-04T22:55:25.903956  / # . /lava-374052/environment/lava-374052/=
bin/lava-test-runner /lava-374052/1
    2023-01-04T22:55:25.904915  =

    2023-01-04T22:55:25.921552  / # /lava-374052/bin/lava-test-runner /lava=
-374052/1
    2023-01-04T22:55:25.987507  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-04T22:55:25.987925  + cd /lava-374052/<8>[   19.808949] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 374052_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b604d7501085c3f94eee3c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b604d7501085c3f94eee3f
        new failure (last pass: v6.1-13341-g16cba743aec0)

    2023-01-04T22:59:14.306290  <8>[   19.245861] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 374055_1.5.2.4.1>
    2023-01-04T22:59:14.414055  / # #
    2023-01-04T22:59:14.516493  export SHELL=3D/bin/sh
    2023-01-04T22:59:14.517127  #
    2023-01-04T22:59:14.618690  / # export SHELL=3D/bin/sh. /lava-374055/en=
vironment
    2023-01-04T22:59:14.619298  =

    2023-01-04T22:59:14.720904  / # . /lava-374055/environment/lava-374055/=
bin/lava-test-runner /lava-374055/1
    2023-01-04T22:59:14.721942  =

    2023-01-04T22:59:14.736919  / # /lava-374055/bin/lava-test-runner /lava=
-374055/1
    2023-01-04T22:59:14.803955  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60537ef781f15994eee47

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b60537ef781f15994eee4a
        new failure (last pass: v6.1-13341-g16cba743aec0)

    2023-01-04T23:00:56.545353  <8>[   18.977970] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 374059_1.5.2.4.1>
    2023-01-04T23:00:56.652184  / # #
    2023-01-04T23:00:56.754673  export SHELL=3D/bin/sh
    2023-01-04T23:00:56.755412  #
    2023-01-04T23:00:56.857167  / # export SHELL=3D/bin/sh. /lava-374059/en=
vironment
    2023-01-04T23:00:56.857934  =

    2023-01-04T23:00:56.959521  / # . /lava-374059/environment/lava-374059/=
bin/lava-test-runner /lava-374059/1
    2023-01-04T23:00:56.960594  =

    2023-01-04T23:00:56.976078  / # /lava-374059/bin/lava-test-runner /lava=
-374059/1
    2023-01-04T23:00:57.042117  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b605a77998d8687d4eee19

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b605a77998d8687d4eee1c
        new failure (last pass: v6.0-rc5-224-g269f27f24a11)

    2023-01-04T23:02:53.704448  [   18.963902] <LAVA_SIGNAL_ENDRUN 0_dmesg =
374063_1.5.2.4.1>
    2023-01-04T23:02:53.811115  / # #
    2023-01-04T23:02:53.913417  export SHELL=3D/bin/sh
    2023-01-04T23:02:53.914003  #
    2023-01-04T23:02:54.015503  / # export SHELL=3D/bin/sh. /lava-374063/en=
vironment
    2023-01-04T23:02:54.016149  =

    2023-01-04T23:02:54.117815  / # . /lava-374063/environment/lava-374063/=
bin/lava-test-runner /lava-374063/1
    2023-01-04T23:02:54.118903  =

    2023-01-04T23:02:54.135278  / # /lava-374063/bin/lava-test-runner /lava=
-374063/1
    2023-01-04T23:02:54.251458  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63b6066fb5c0df4bb24eee1f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b6066fb5c0df4bb24eee22
        new failure (last pass: v6.0-rc5-224-g269f27f24a11)

    2023-01-04T23:06:03.431145  / # #
    2023-01-04T23:06:03.533478  export SHELL=3D/bin/sh
    2023-01-04T23:06:03.534112  #
    2023-01-04T23:06:03.534537  / # export SHELL=3D/bin/sh[   21.124059] us=
b-storage 2-1.1:1.0: USB Mass Storage device detected
    2023-01-04T23:06:03.534881  [   21.133985] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-04T23:06:03.636429  . /lava-374067/environment
    2023-01-04T23:06:03.637061  =

    2023-01-04T23:06:03.637500  / # [   21.183516] usbcore: registered new =
interface driver uas
    2023-01-04T23:06:03.739075  . /lava-374067/environment/lava-374067/bin/=
lava-test-runner /lava-374067/1
    2023-01-04T23:06:03.740147   =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63b60787f3772e89aa4eee26

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b60787f3772e89aa4eee29
        new failure (last pass: v6.0-rc5-224-g269f27f24a11)

    2023-01-04T23:10:56.248120  / # #
    2023-01-04T23:10:56.352742  export SHELL=3D/bin/sh
    2023-01-04T23:10:56.353415  [   18.077840] usb-storage 1-1.1:1.0: USB M=
ass Storage device detected
    2023-01-04T23:10:56.353714  [   18.086308] scsi host0: usb-storage 1-1.=
1:1.0
    2023-01-04T23:10:56.353944  [   18.101106] usbcore: registered new inte=
rface driver uas
    2023-01-04T23:10:56.354176  #
    2023-01-04T23:10:56.455485  / # export SHELL=3D/bin/sh. /lava-374082/en=
vironment
    2023-01-04T23:10:56.456164  =

    2023-01-04T23:10:56.558996  / # . /lava-374082/environment/lava-374082/=
bin/lava-test-runner /lava-374082/1
    2023-01-04T23:10:56.559991   =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b608bd555b5791004eee36

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b608bd555b5791004eee39
        new failure (last pass: v6.0-rc5-224-g269f27f24a11)

    2023-01-04T23:15:54.439552  + set +x[   18.085301] <LAVA_SIGNAL_ENDRUN =
0_dmesg 374091_1.5.2.4.1>
    2023-01-04T23:15:54.439807  =

    2023-01-04T23:15:54.545092  / # #
    2023-01-04T23:15:54.647457  export SHELL=3D/bin/sh
    2023-01-04T23:15:54.648230  #[   18.168441] usb-storage 2-1.1:1.0: USB =
Mass Storage device detected
    2023-01-04T23:15:54.648494  [   18.177005] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-04T23:15:54.648703  [   18.205620] usbcore: registered new inte=
rface driver uas
    2023-01-04T23:15:54.648903  =

    2023-01-04T23:15:54.753073  / # export SHELL=3D/bin/sh. /lava-374091/en=
vironment
    2023-01-04T23:15:54.753811   =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63b6091712f5e330754eee54

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b6091712f5e330754eee57
        new failure (last pass: v6.0-rc5-224-g269f27f24a11)

    2023-01-04T23:17:37.295051  [   18.262527] usbcore: registered new inte=
rface driver uas#
    2023-01-04T23:17:37.397114  export SHELL=3D/bin/sh
    2023-01-04T23:17:37.397738  =

    2023-01-04T23:17:37.397982  #
    2023-01-04T23:17:37.499456  / # export SHELL=3D/bin/sh. /lava-374096/en=
vironment
    2023-01-04T23:17:37.500098  =

    2023-01-04T23:17:37.601563  / # . /lava-374096/environment/lava-374096/=
bin/lava-test-runner /lava-374096/1
    2023-01-04T23:17:37.602311  =

    2023-01-04T23:17:37.605018  / # /lava-374096/bin/lava-test-runner /lava=
-374096/1
    2023-01-04T23:17:37.739368  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63b602fe8fcf51f0c14eee25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-33=
2-g2d3ca5d07c8e/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b602fe8fcf51f0c14eee28
        new failure (last pass: v6.0-rc5-224-g269f27f24a11)

    2023-01-04T22:51:24.896427  [   17.983927] <LAVA_SIGNAL_ENDRUN 0_dmesg =
374044_1.5.2.4.1>
    2023-01-04T22:51:25.003005  / # #
    2023-01-04T22:51:25.105102  export SHELL=3D/bin/sh
    2023-01-04T22:51:25.105672  #
    2023-01-04T22:51:25.207344  / # export SHELL=3D/bin/sh. /lava-374044/en=
vironment
    2023-01-04T22:51:25.207993  =

    2023-01-04T22:51:25.309602  / # . /lava-374044/environment/lava-374044/=
bin/lava-test-runner /lava-374044/1
    2023-01-04T22:51:25.310676  =

    2023-01-04T22:51:25.327307  / # /lava-374044/bin/lava-test-runner /lava=
-374044/1
    2023-01-04T22:51:25.391253  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
