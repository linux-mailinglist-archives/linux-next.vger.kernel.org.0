Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDC4661E9C
	for <lists+linux-next@lfdr.de>; Mon,  9 Jan 2023 07:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjAIGNk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Jan 2023 01:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjAIGNj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Jan 2023 01:13:39 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945B5A195
        for <linux-next@vger.kernel.org>; Sun,  8 Jan 2023 22:13:36 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id 17so8482385pll.0
        for <linux-next@vger.kernel.org>; Sun, 08 Jan 2023 22:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xODI+aH9fQmlIrj/Qc8SJDk/OjowGeRD32tkpHg15O0=;
        b=iKv2NFrXYV5JG08JnXPxSHdDzuXns1uirkP94rhK1s+dGc1SV1hyFIIevTFcz1eCmW
         Ni5MmCu6IRW5UAEGLsWUzXYHviRu8Rn+az+Acfz2QnrX5uHbpVsKtrZ26GAzkWOLMhBe
         9dDXSsamRFDMNguEs+vD//3RNOyLHoZEF5oV6c/dGrh68t4nEWvwbgL1pNTo1NsNmQXf
         epk8qgQzp7+0QN00gSqtqaXHA15/Ylx/NOAzqGDO7wLTtY9XbrjiiWXBeCe/dD+Pgf82
         X1P3qWkXRL/xw+Y8Me8iZ0gqAuBIJHi2bBwbixSEfpz8+/vuHBhv/F5qfguxVjXRdKMk
         C71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xODI+aH9fQmlIrj/Qc8SJDk/OjowGeRD32tkpHg15O0=;
        b=pIYqrOgWqUb/8kRQmr7TK2hx9UqNTKhg83bA5NezTdfMvzUpWWOK3/w7ffKM4qx0sz
         eJADAOnLyy0ex2madL2qc9oUC64sjpEDS5wjIhdwU6ASPxh+p7T476UNZqpmLCsJ9KVg
         y6KNEYvunPsp4KmdVUDXaC4sqZ4Wk0WlGZ5KdyIHJzCSjNRonoQ8S2NEocQRUEZjAonB
         XrdAcx16yG0FyaKeQjtu5LnPMMkqiQ/7ElyEoNiM08o0UrERlGgI0c6UpL//lICu57lI
         4P5HZJhudxZEdQCsic2Fz3KIx8HWUNl1L4VyM71ZdX7RanCOHAK3amks9ymMFnZvy5AU
         VGwQ==
X-Gm-Message-State: AFqh2koJCq0+rdC3/L6O6aniCv89Nkdnr5BRDkTwLgDEPUEJXx/xwdwe
        Lz8ovGHOl/1r4WdSevFVbU4nZaiBwPdKAgkSePoX3w==
X-Google-Smtp-Source: AMrXdXsHOJW8rHRdtSDBQ8LIe35NUNEVauWk/ZOtYeJqA6KjdaBtfVAsdyHLe3461rkN+3eMox5fug==
X-Received: by 2002:a17:902:a3c1:b0:193:2a8c:28cb with SMTP id q1-20020a170902a3c100b001932a8c28cbmr3890039plb.21.1673244815376;
        Sun, 08 Jan 2023 22:13:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c20d00b00189c4b8ca21sm5216386pll.18.2023.01.08.22.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 22:13:35 -0800 (PST)
Message-ID: <63bbb08f.170a0220.8667a.79c1@mx.google.com>
Date:   Sun, 08 Jan 2023 22:13:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230109
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 650 runs, 38 regressions (next-20230109)
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

next/master baseline: 650 runs, 38 regressions (next-20230109)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-16 | defconf=
ig                    | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+videodec           | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+ima                | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+crypto             | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | clang-16 | defconf=
ig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | clang-16 | multi_v=
7_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230109/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230109
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      543b9b2fe10b2e12b8d773af65314d322f91e479 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb84f065f4a7e4344eee92

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb84f065f4a7e4344ee=
e93
        failing since 113 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb76286a653fbe4d4eee19

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb76286a653fbe4d4eee1e
        failing since 3 days (last pass: next-20221017, first fail: next-20=
230105)

    2023-01-09T02:03:52.696050  + set +x
    2023-01-09T02:03:52.698603  <8>[   16.166178] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 74638_1.5.2.4.1>
    2023-01-09T02:03:52.810195  / # #
    2023-01-09T02:03:52.912238  export SHELL=3D/bin/sh
    2023-01-09T02:03:52.912826  #
    2023-01-09T02:03:53.014485  / # export SHELL=3D/bin/sh. /lava-74638/env=
ironment
    2023-01-09T02:03:53.014953  =

    2023-01-09T02:03:53.116716  / # . /lava-74638/environment/lava-74638/bi=
n/lava-test-runner /lava-74638/1
    2023-01-09T02:03:53.117696  =

    2023-01-09T02:03:53.124601  / # /lava-74638/bin/lava-test-runner /lava-=
74638/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7cb0158c38ca3f4eee89

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb7cb0158c38ca3f4eee8e
        failing since 2 days (last pass: next-20221125, first fail: next-20=
230106)

    2023-01-09T02:31:47.034358  [   13.513658] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1132953_1.5.2.4.1>
    2023-01-09T02:31:47.141435  / # #
    2023-01-09T02:31:47.243419  export SHELL=3D/bin/sh
    2023-01-09T02:31:47.244014  #
    2023-01-09T02:31:47.345290  / # export SHELL=3D/bin/sh. /lava-1132953/e=
nvironment
    2023-01-09T02:31:47.345745  =

    2023-01-09T02:31:47.447115  / # . /lava-1132953/environment/lava-113295=
3/bin/lava-test-runner /lava-1132953/1
    2023-01-09T02:31:47.447842  =

    2023-01-09T02:31:47.450277  / # /lava-1132953/bin/lava-test-runner /lav=
a-1132953/1
    2023-01-09T02:31:47.473023  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-16 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb8001ace6b064394eee2c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb8001ace6b064394eee31
        failing since 2 days (last pass: next-20221124, first fail: next-20=
230106)

    2023-01-09T02:46:17.199770  + set +x
    2023-01-09T02:46:17.205138  [   12.995304] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1132978_1.5.2.4.1>
    2023-01-09T02:46:17.309339  / # #
    2023-01-09T02:46:17.410685  export SHELL=3D/bin/sh
    2023-01-09T02:46:17.411034  #
    2023-01-09T02:46:17.512095  / # export SHELL=3D/bin/sh. /lava-1132978/e=
nvironment
    2023-01-09T02:46:17.512374  =

    2023-01-09T02:46:17.613447  / # . /lava-1132978/environment/lava-113297=
8/bin/lava-test-runner /lava-1132978/1
    2023-01-09T02:46:17.613968  =

    2023-01-09T02:46:17.615969  / # /lava-1132978/bin/lava-test-runner /lav=
a-1132978/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7afb68ae3bef124eee26

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb7afb68ae3bef124eee2b
        new failure (last pass: next-20230106)

    2023-01-09T02:24:39.892985  + set[   14.476380] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 875110_1.5.2.3.1>
    2023-01-09T02:24:39.893186   +x
    2023-01-09T02:24:39.998792  / # #
    2023-01-09T02:24:40.100777  export SHELL=3D/bin/sh
    2023-01-09T02:24:40.101324  #
    2023-01-09T02:24:40.202634  / # export SHELL=3D/bin/sh. /lava-875110/en=
vironment
    2023-01-09T02:24:40.203080  =

    2023-01-09T02:24:40.304468  / # . /lava-875110/environment/lava-875110/=
bin/lava-test-runner /lava-875110/1
    2023-01-09T02:24:40.305167  =

    2023-01-09T02:24:40.308193  / # /lava-875110/bin/lava-test-runner /lava=
-875110/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7ebb28e622eaf44eee1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7ebb28e622eaf44ee=
e1e
        failing since 151 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7a1d567906f9a04eee29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7a1d567906f9a04ee=
e2a
        failing since 212 days (last pass: next-20220607, first fail: next-=
20220610) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7ad344835ed7114eee3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7ad344835ed7114ee=
e3e
        failing since 123 days (last pass: next-20220831, first fail: next-=
20220907) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7d038e9e1b57244eee1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7d038e9e1b57244ee=
e1b
        failing since 139 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7ce2c60da0aba34eee2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7ce2c60da0aba34ee=
e2b
        failing since 2 days (last pass: next-20221125, first fail: next-20=
230106) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb833155663bd4754eee24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb833155663bd4754ee=
e25
        failing since 3 days (last pass: next-20221124, first fail: next-20=
230105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7725bfe3ef8c224eee24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7725bfe3ef8c224ee=
e25
        failing since 3 days (last pass: next-20221226, first fail: next-20=
230105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb782fc6fa7168274eee44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb782fc6fa7168274ee=
e45
        failing since 3 days (last pass: next-20221226, first fail: next-20=
230105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7aca44835ed7114eee24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7aca44835ed7114ee=
e25
        failing since 3 days (last pass: next-20221226, first fail: next-20=
230105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7b5f28aaf9290f4eee38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7b5f28aaf9290f4ee=
e39
        failing since 3 days (last pass: next-20221125, first fail: next-20=
230105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7fedace6b064394eee19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7fedace6b064394ee=
e1a
        failing since 3 days (last pass: next-20221226, first fail: next-20=
230105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb818c4f0d05c6c54eee1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb818c4f0d05c6c54ee=
e1e
        failing since 3 days (last pass: next-20221226, first fail: next-20=
230105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7c3f87c6bf371d4eee27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7c3f87c6bf371d4ee=
e28
        failing since 68 days (last pass: next-20221028, first fail: next-2=
0221101) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb77f1ebe81442044eee47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb77f1ebe81442044ee=
e48
        failing since 60 days (last pass: next-20221107, first fail: next-2=
0221109) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63bb7b6128aaf9290f4eee3e

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb7b6128aaf9290f4eee41
        new failure (last pass: next-20230106)

    2023-01-09T02:26:19.241267  / # #
    2023-01-09T02:26:19.343266  export SHELL=3D/bin/sh
    2023-01-09T02:26:19.343938  #
    2023-01-09T02:26:19.445285  / # export SHELL=3D/bin/sh. /lava-242217/en=
vironment
    2023-01-09T02:26:19.445996  =

    2023-01-09T02:26:19.547364  / # . /lava-242217/environment/lava-242217/=
bin/lava-test-runner /lava-242217/1
    2023-01-09T02:26:19.548082  =

    2023-01-09T02:26:19.553658  / # /lava-242217/bin/lava-test-runner /lava=
-242217/1
    2023-01-09T02:26:19.616641  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-09T02:26:19.616965  + cd /l<8>[   15.805620] <LAVA_SIGNAL_START=
RUN 1_bootrr 242217_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63b=
b7b6228aaf9290f4eee51
        new failure (last pass: next-20230106)

    2023-01-09T02:26:23.659004  /lava-242217/1/../bin/lava-test-case
    2023-01-09T02:26:23.659292  <8>[   20.011821] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-01-09T02:26:23.659441  /lava-242217/1/../bin/lava-test-case
    2023-01-09T02:26:23.659578  <8>[   20.032547] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | clang-16 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7f0bf785c2822c4eee2f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/clang-16/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/clang-16/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb7f0bf785c2822c4eee34
        failing since 2 days (last pass: next-20230105, first fail: next-20=
230106)

    2023-01-09T02:41:55.511179  <8>[   18.783095] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 75091_1.5.2.4.1>
    2023-01-09T02:41:55.619822  / # #
    2023-01-09T02:41:55.722778  export SHELL=3D/bin/sh
    2023-01-09T02:41:55.723284  #
    2023-01-09T02:41:55.824508  / # export SHELL=3D/bin/sh. /lava-75091/env=
ironment
    2023-01-09T02:41:55.825245  =

    2023-01-09T02:41:55.927431  / # . /lava-75091/environment/lava-75091/bi=
n/lava-test-runner /lava-75091/1
    2023-01-09T02:41:55.928287  =

    2023-01-09T02:41:55.932682  / # /lava-75091/bin/lava-test-runner /lava-=
75091/1
    2023-01-09T02:41:55.970760  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63bb7bc2801b270b594eee19

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63bb7bc2801b270=
b594eee20
        new failure (last pass: next-20230106)
        2 lines

    2023-01-09T02:28:01.036689  :alert :   ESR =3D 0x0000000096000004
    2023-01-09T02:28:01.041719  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-01-09T02:28:01.047612  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-01-09T02:28:01.047928  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-01-09T02:28:01.053061  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2023-01-09T02:28:01.064074  kern  <8>[   18.726376] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63bb7bc2801b270=
b594eee21
        new failure (last pass: next-20230106)
        12 lines

    2023-01-09T02:28:01.021842  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address fffffffffffffff8
    2023-01-09T02:28:01.022161  kern  :alert : Mem abort info:
    2023-01-09T02:28:01.030806  kern  <8>[   18.697859] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/63bb7db6936e4554c84eee1f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63bb7db6936e455=
4c84eee26
        failing since 2 days (last pass: next-20230105, first fail: next-20=
230106)
        2 lines

    2023-01-09T02:36:16.503470  :alert :   ESR =3D 0x0000000096000004
    2023-01-09T02:36:16.508877  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-01-09T02:36:16.509474  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-01-09T02:36:16.514400  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-01-09T02:36:16.519949  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2023-01-09T02:36:16.520547  kern  :alert : Data abort info:
    2023-01-09T02:36:16.531098  kern  :alert :   ISV =3D 0, ISS =3D 0x00<8>=
[   18.857270] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNI=
TS=3Dlines MEASUREMENT=3D2>
    2023-01-09T02:36:16.531712  000004   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63bb7db6936e455=
4c84eee27
        failing since 2 days (last pass: next-20230105, first fail: next-20=
230106)
        12 lines

    2023-01-09T02:36:16.486817  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address fffffffffffffff8
    2023-01-09T02:36:16.487421  kern  :alert : Mem abort info:
    2023-01-09T02:36:16.497853  kern  <8>[   18.822519] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7e6d54d5bca4494eee40

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb7e6d54d5bca4494eee45
        new failure (last pass: next-20230105)

    2023-01-09T02:39:26.122246  <8>[   18.723790] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 75060_1.5.2.4.1>
    2023-01-09T02:39:26.230424  / # #
    2023-01-09T02:39:26.332660  export SHELL=3D/bin/sh
    2023-01-09T02:39:26.333252  #
    2023-01-09T02:39:26.434895  / # export SHELL=3D/bin/sh. /lava-75060/env=
ironment
    2023-01-09T02:39:26.435632  =

    2023-01-09T02:39:26.537405  / # . /lava-75060/environment/lava-75060/bi=
n/lava-test-runner /lava-75060/1
    2023-01-09T02:39:26.538305  =

    2023-01-09T02:39:26.542479  / # /lava-75060/bin/lava-test-runner /lava-=
75060/1
    2023-01-09T02:39:26.580480  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb8a4c75700326534eef20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb8a4c75700326534ee=
f21
        new failure (last pass: next-20230106) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb74d44cf1911b0f4eee19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb74d44cf1911b0f4ee=
e1a
        failing since 138 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7d5fd0e34d91864eee32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7d5fd0e34d91864ee=
e33
        failing since 117 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7cf860b41cbd644eee36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7cf860b41cbd644ee=
e37
        failing since 117 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7d6046a566acca4eee26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7d6046a566acca4ee=
e27
        failing since 115 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7cf9c60da0aba34eee99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7cf9c60da0aba34ee=
e9a
        failing since 115 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7d9bbb32ac2b974eee39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7d9bbb32ac2b974ee=
e3a
        failing since 115 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7d056efef175ca4eee27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7d056efef175ca4ee=
e28
        failing since 115 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7d8764be612ce74eee39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb7d8764be612ce74ee=
e3a
        failing since 117 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb790d51c79ff6024eee8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb790d51c79ff6024ee=
e90
        failing since 2 days (last pass: next-20230105, first fail: next-20=
230106) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | clang-16 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb7a11196e755add4eee3a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230109/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb7a11196e755add4eee3d
        failing since 3 days (last pass: next-20220919, first fail: next-20=
230105)

    2023-01-09T02:20:55.105116  #
    2023-01-09T02:20:55.209702  export SHELL=3D/bin/sh
    2023-01-09T02:20:55.210216  #
    2023-01-09T02:20:55.315108  / # export SHELL=3D/bin/sh. /lava-376208/en=
vironment
    2023-01-09T02:20:55.315607  =

    2023-01-09T02:20:55.420350  / # . /lava-376208/environment/lava-376208/=
bin/lava-test-runner /lava-376208/1
    2023-01-09T02:20:55.421694  =

    2023-01-09T02:20:55.432149  / # /lava-376208/bin/lava-test-runner /lava=
-376208/1
    2023-01-09T02:20:55.560418  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-09T02:20:55.560773  + cd /lava-376208/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =20
