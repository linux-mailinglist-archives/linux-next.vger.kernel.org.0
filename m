Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811BB5C0509
	for <lists+linux-next@lfdr.de>; Wed, 21 Sep 2022 19:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiIURCr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Sep 2022 13:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbiIURCT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2022 13:02:19 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80AB7C1B1
        for <linux-next@vger.kernel.org>; Wed, 21 Sep 2022 10:01:48 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id w20so6259236ply.12
        for <linux-next@vger.kernel.org>; Wed, 21 Sep 2022 10:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=QQQIuwVBBouL99o6Ua9E5AAkhOizmPHIHb3mVJR9L3Q=;
        b=g2xzqGMF9ypntQdKnYuMXfLEfAp6sA32R6jcu/bXJ9066/3CBcPA7hu5VHui0Ff6pV
         FBBtgQKyvda/ubAawNvscJxmXrGzk8P1cK+VH/raFmRzb/yns/eo7TVGZ0vV4bF2PHOI
         zlr+lBl6OVoinMF6xeNBne+wqnygs9l2xkNY2lneQ9M/h5FqmT43OeVumeKma6cQaSOC
         +w91Df4S3UdvCCy0TSZ7VHnWLUL5Sq0CWs8JFCmn0xB6bbyAJBU9k0JtuPaO4n0wV0XM
         tKK48RIA4rYvkVWt+TFnajy3KVoN6528BgxkNO8/YkiEgRkrIW5OJjpaolT7zZWez5Dz
         W9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=QQQIuwVBBouL99o6Ua9E5AAkhOizmPHIHb3mVJR9L3Q=;
        b=ZE0OgJrgpONjYHMesAtJFour2zk/LtzOh+CKd+0/WhJ9PR9aMpxV5DgZ6PGpDW1HHV
         9EDOpb7HXaS7hsVMFbHLP2VgyyCjxtwEgJblnJSJzkvC+rz+98HLSuAnZNqeiVFiAx8C
         IABe9HS3igvizqs2qrOCOg9E8zvIyvV3ufOtnRWPVBZLBz0NlAORTLP0U548jmhjcrbu
         7YWLHVxiDHRlh1UnvtCMiGlP47rNwIq6M1EpszLC9No1zOE93KMT+YX5tdg71su/UyP3
         I2eE8qi2ekD6Xb3R3pSCaVnWhsgPVLll/pzsbNTfum9MzshNYnOCJ9VpFOvFJ+ke2Ho+
         UrxQ==
X-Gm-Message-State: ACrzQf3STy2vIcvVzGDKgR6/QuDDfTc2GB4DGjhaejW9y0Ld/h8KLrTG
        3DUONI0ulNZ95auA4SKn5wtq6lRc8mlB6TS/EsM=
X-Google-Smtp-Source: AMsMyM7w2ZKFQh1XbYnZjGN7sLJBVWDkGPZbhMs57rOtXgBdobtLv16P1iHmZUnd5oPjyX7Oxf3nAw==
X-Received: by 2002:a17:903:1d0:b0:178:1d5b:faf8 with SMTP id e16-20020a17090301d000b001781d5bfaf8mr5658675plh.9.1663779707440;
        Wed, 21 Sep 2022 10:01:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902784700b001753cb9893csm2300594pln.187.2022.09.21.10.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 10:01:47 -0700 (PDT)
Message-ID: <632b437b.170a0220.8a03f.467a@mx.google.com>
Date:   Wed, 21 Sep 2022 10:01:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220921
Subject: next/master baseline: 565 runs, 13 regressions (next-20220921)
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

next/master baseline: 565 runs, 13 regressions (next-20220921)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig           | 1          =

qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220921/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220921
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      483fed3b5dc8ce3644c83d24240cf5756fb0993e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0c5922240eec18355645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0c5922240eec18355=
646
        failing since 103 days (last pass: next-20220607, first fail: next-=
20220610) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0c6d4ebfa82c4c35565e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0c6d4ebfa82c4c355=
65f
        failing since 13 days (last pass: next-20220831, first fail: next-2=
0220907) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0c6922240eec1835566b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0c6922240eec18355=
66c
        failing since 6 days (last pass: next-20220816, first fail: next-20=
220915) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0d1a3ba916852b355664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0d1a3ba916852b355=
665
        failing since 13 days (last pass: next-20220831, first fail: next-2=
0220907) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0c7e4a62e495a135565c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0c7e4a62e495a1355=
65d
        failing since 13 days (last pass: next-20220823, first fail: next-2=
0220907) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0cf34caf1725da35564c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0cf34caf1725da355=
64d
        failing since 103 days (last pass: next-20220601, first fail: next-=
20220610) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0f3b2ff8f37ef3355661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0f3b2ff8f37ef3355=
662
        failing since 2 days (last pass: next-20220915, first fail: next-20=
220919) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/632b1b7b54e6ab6936355662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b1b7b54e6ab6936355=
663
        failing since 132 days (last pass: next-20220506, first fail: next-=
20220512) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0dddf7d0233ae1355678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0dddf7d0233ae1355=
679
        failing since 97 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0875cd8078f46b355666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0875cd8078f46b355=
667
        failing since 29 days (last pass: next-20220822, first fail: next-2=
0220823) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0d1b3ba916852b355667

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/632b0d1b3ba9168=
52b35566b
        new failure (last pass: next-20220916)
        1 lines

    2022-09-21T13:09:39.548340  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 3f963cd8, epc =3D=3D 80201bd4, ra =3D=
=3D 802045b0
    2022-09-21T13:09:39.568629  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/632b0eca5031eba126355650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b0eca5031eba126355=
651
        failing since 5 days (last pass: next-20220915, first fail: next-20=
220916) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/632b1a77a8ef6efc0535566a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220921/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/632b1a77a8ef6efc05355=
66b
        failing since 5 days (last pass: next-20220915, first fail: next-20=
220916) =

 =20
