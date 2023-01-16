Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0643866B93F
	for <lists+linux-next@lfdr.de>; Mon, 16 Jan 2023 09:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbjAPIqT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Jan 2023 03:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjAPIqQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Jan 2023 03:46:16 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0CB13D44
        for <linux-next@vger.kernel.org>; Mon, 16 Jan 2023 00:46:10 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id y5so20437107pfe.2
        for <linux-next@vger.kernel.org>; Mon, 16 Jan 2023 00:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fiSjWHwf1PQML7y3XUzaN73Ko2c/PakRp9x68nT78ys=;
        b=RW39ScMBcUTk0EbPq/a8R/AUgQcoONU3wtCO8Nx24OUWbC0tiDDkNVXgP7HZwErRuJ
         1WWx1UY0S3CszIK0AF+zXQfynDHomaFrvbyTqjV8InH6AmH5q5TeVPQHRpGvbQUKKPrd
         cAeBgK5PkaJFR76njsoglq6nytDilJYS5VtZ5enKItAyi+73d6nayw/mDvHdy76vyt+g
         MXR9iGGrMM1Bn3MkPG2ZIO5NatzqMefPk5X0YbytUh3FcyNgl6UVjS0uSn5OPI84Td0K
         kcAitWRp8q+4BfimBytihMUb6Zjee1p6tQra0fXwrEvm7++b7GJOvTLU5FwZ72lIEPxl
         /bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiSjWHwf1PQML7y3XUzaN73Ko2c/PakRp9x68nT78ys=;
        b=3EBsf5jzJKERWDIfi0x4Hrsz+MtZuxeAsdHhel/N0TDXdvE5nBCwc4vKCDmC4/7/Ow
         RIuj1W7AP49GmIr3PQRKK+HaOBxaJvKnHI9agWQf79htRJAvG7BjxtAmKmzTusQxaCf2
         As88xoNuMjPZnTdQK6HGUc7BVVeh3sJ0IzJjF6k6KTofZ3771IqisgAc+kRT1V87jw1A
         Gwybn+cCyq8sUog2q9tA2F4vXvwBHtdcorC2yA+e1o0CTkBqerk8j0Pjr0lHVyjGq7PB
         j/iEpSZKVdDQhZ/Qw4BjXIrP54FOLaoUO+h4AIUyGAXPeIMh9vZFvmkGB+3aB5BsOmtG
         sZdw==
X-Gm-Message-State: AFqh2krtzJj4Thyi4ztsWt79s1Or3OwCmuUjP56lpdCUcHnIy5ueRegb
        8i5vsnYraiHDh/shUlnJHh68AeTFxmzbYH7uZH8=
X-Google-Smtp-Source: AMrXdXvjMC3NH+ruRV7PUTDwIQOCzJRhSGg7BU10MUzskXuynHemCE2+BaDnBE4lSLN7cmB5kH8kZg==
X-Received: by 2002:a05:6a00:1d95:b0:58d:aac3:a8cb with SMTP id z21-20020a056a001d9500b0058daac3a8cbmr2755711pfw.0.1673858769200;
        Mon, 16 Jan 2023 00:46:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w23-20020a627b17000000b0058bc37f3d13sm3948057pfc.43.2023.01.16.00.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 00:46:08 -0800 (PST)
Message-ID: <63c50ed0.620a0220.7c7da.5e99@mx.google.com>
Date:   Mon, 16 Jan 2023 00:46:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230116
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 710 runs, 37 regressions (next-20230116)
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

next/master baseline: 710 runs, 37 regressions (next-20230116)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15          | arm   | lab-linaro-lkft | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp         | clang-16 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp         | clang-16 | defconfig=
                    | 1          =

imx6dl-riotboard           | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

imx6dl-udoo                | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6q-udoo                 | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6qp-wandboard-revd1     | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-16 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-16 | defconfig=
                    | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+ima                | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+crypto             | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
                    | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+videodec           | 1          =

juno-uboot                 | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m         | arm64 | lab-kontron     | clang-16 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | clang-13 | cros://ch=
rome...4-chromebook | 1          =

qemu_arm-virt-gicv2        | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2        | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3        | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3        | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3        | arm   | lab-collabora   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

rk3399-roc-pc              | arm64 | lab-clabbe      | gcc-10   | defconfig=
+debug              | 1          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | clang-16 | defconfig=
                    | 1          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+videodec           | 1          =

zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230116/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230116
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c12e2e5b76b2e739ccdf196bee960412b45d5f85 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15          | arm   | lab-linaro-lkft | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4f7dff209f252561d39e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4f7dff209f252561d3=
9e4
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp         | clang-16 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e4346c38b519871d39c2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230114071858+7985=
8d1908b5-1~exp1~20230114072010.530))
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c4e4346c38b519871d39c5
        failing since 10 days (last pass: next-20221125, first fail: next-2=
0230106)

    2023-01-16T05:43:53.879416  [   12.536976] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1137491_1.5.2.4.1>
    2023-01-16T05:43:53.985248  / # #
    2023-01-16T05:43:54.087146  export SHELL=3D/bin/sh
    2023-01-16T05:43:54.087778  #
    2023-01-16T05:43:54.189182  / # export SHELL=3D/bin/sh. /lava-1137491/e=
nvironment
    2023-01-16T05:43:54.189683  =

    2023-01-16T05:43:54.291074  / # . /lava-1137491/environment/lava-113749=
1/bin/lava-test-runner /lava-1137491/1
    2023-01-16T05:43:54.291866  =

    2023-01-16T05:43:54.293786  / # /lava-1137491/bin/lava-test-runner /lav=
a-1137491/1
    2023-01-16T05:43:54.316935  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp         | clang-16 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e4ed5e299d196b1d3a50

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230114071858+7985=
8d1908b5-1~exp1~20230114072010.530))
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c4e4ed5e299d196b1d3a53
        failing since 10 days (last pass: next-20221124, first fail: next-2=
0230106)

    2023-01-16T05:47:11.679205  + [   12.807540] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1137492_1.5.2.4.1>
    2023-01-16T05:47:11.679515  set +x
    2023-01-16T05:47:11.785165  / # #
    2023-01-16T05:47:11.887124  export SHELL=3D/bin/sh
    2023-01-16T05:47:11.887588  #
    2023-01-16T05:47:11.988942  / # export SHELL=3D/bin/sh. /lava-1137492/e=
nvironment
    2023-01-16T05:47:11.989389  =

    2023-01-16T05:47:12.090771  / # . /lava-1137492/environment/lava-113749=
2/bin/lava-test-runner /lava-1137492/1
    2023-01-16T05:47:12.091535  =

    2023-01-16T05:47:12.093584  / # /lava-1137492/bin/lava-test-runner /lav=
a-1137492/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6dl-riotboard           | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e1f8e87efb65f61d39cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e1f8e87efb65f61d3=
9ce
        failing since 159 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6dl-udoo                | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4debd2e308e754c1d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4debd2e308e754c1d3=
9cb
        failing since 219 days (last pass: next-20220607, first fail: next-=
20220610) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-udoo                 | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4df35157b2a75551d39f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4df35157b2a75551d3=
9f2
        failing since 130 days (last pass: next-20220831, first fail: next-=
20220907) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6qp-wandboard-revd1     | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4ded663006924811d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4ded663006924811d3=
9d6
        failing since 146 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-16 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e7c93d7dad48301d3a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230114071858+7985=
8d1908b5-1~exp1~20230114072010.530))
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e7c93d7dad48301d3=
a4e
        failing since 10 days (last pass: next-20221125, first fail: next-2=
0230106) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-16 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e962a25cebd5771d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230114071858+7985=
8d1908b5-1~exp1~20230114072010.530))
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e962a25cebd5771d3=
9c3
        failing since 11 days (last pass: next-20221124, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4dd1561f28209361d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4dd1561f28209361d3=
9d0
        failing since 10 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4de9db51f8b669d1d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4de9db51f8b669d1d3=
9d2
        failing since 10 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e088edf16778c71d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e088edf16778c71d3=
9d3
        failing since 11 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e5fcf2185fc1921d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e5fcf2185fc1921d3=
9c3
        failing since 11 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4eae5df66288cce1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4eae5df66288cce1d3=
9c3
        failing since 11 days (last pass: next-20221125, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4eb896924b834891d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4eb896924b834891d3=
9d3
        failing since 11 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
juno-uboot                 | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e419dd9a44497f1d3a3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-juno-ubo=
ot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-juno-ubo=
ot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e419dd9a44497f1d3=
a3b
        new failure (last pass: next-20230113) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron     | clang-16 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e8d7873b7902e81d3a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230114071858+7985=
8d1908b5-1~exp1~20230114072010.530))
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e8d7873b7902e81d3=
a43
        failing since 75 days (last pass: next-20221028, first fail: next-2=
0221101) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e7963d7dad48301d39d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e7963d7dad48301d3=
9d5
        failing since 67 days (last pass: next-20221107, first fail: next-2=
0221109) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4de3647789ca16e1d39fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4de3647789ca16e1d3=
9fd
        failing since 5 days (last pass: next-20230109, first fail: next-20=
230110) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4dd1e8c0aab57141d39de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4dd1e8c0aab57141d3=
9df
        failing since 2 days (last pass: next-20230112, first fail: next-20=
230113) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4deafcaed93b1681d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4deafcaed93b1681d3=
9c6
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2        | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e1b0e008d5ac5e1d3a28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e1b0e008d5ac5e1d3=
a29
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4dec0caed93b1681d39e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4dec0caed93b1681d3=
9e3
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e1b165b557729c1d39c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e1b165b557729c1d3=
9c5
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4deacb51f8b669d1d3a09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4deacb51f8b669d1d3=
a0a
        failing since 122 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e0d27d3c9e49f11d3a06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e0d27d3c9e49f11d3=
a07
        failing since 122 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-collabora   | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e06eedf16778c71d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e06eedf16778c71d3=
9cb
        failing since 122 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4deaeb51f8b669d1d3a12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4deaeb51f8b669d1d3=
a13
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e1af86b27e06021d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e1af86b27e06021d3=
9d6
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e0a56f090cadd61d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e0a56f090cadd61d3=
9cc
        failing since 10 days (last pass: next-20221207, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e37b7019baee141d39c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e37b7019baee141d3=
9c5
        failing since 10 days (last pass: next-20221207, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e0a26f090cadd61d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e0a26f090cadd61d3=
9c7
        failing since 10 days (last pass: next-20221207, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e367602a22d2d21d39de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e367602a22d2d21d3=
9df
        failing since 10 days (last pass: next-20221207, first fail: next-2=
0230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-roc-pc              | arm64 | lab-clabbe      | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e0eb4ddb0894e31d39da

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c4e0eb4ddb0894e31d39dd
        failing since 10 days (last pass: next-20221130, first fail: next-2=
0230105)

    2023-01-16T05:29:53.628379  + set +x
    2023-01-16T05:29:53.629613  <8>[   66.429366][  T194] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 379842_1.5.2.4.1>
    2023-01-16T05:29:53.766769  #
    2023-01-16T05:29:53.869292  / # #export SHELL=3D/bin/sh
    2023-01-16T05:29:53.869897  =

    2023-01-16T05:29:53.971488  / # export SHELL=3D/bin/sh. /lava-379842/en=
vironment
    2023-01-16T05:29:53.972070  =

    2023-01-16T05:29:54.073633  / # . /lava-379842/environment/lava-379842/=
bin/lava-test-runner /lava-379842/1
    2023-01-16T05:29:54.074570  =

    2023-01-16T05:29:54.083339  / # /lava-379842/bin/lava-test-runner /lava=
-379842/1 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | clang-16 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e32a4ac159aa041d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230114071858+7985=
8d1908b5-1~exp1~20230114072010.530))
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig/clang-16/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig/clang-16/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e32a4ac159aa041d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e4a6cf55d7f6441d3a41

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c4e4a6cf55d7f6441d3=
a42
        failing since 2 days (last pass: next-20230112, first fail: next-20=
230113) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c4e137e3d2fdfd211d39cb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230116/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c4e137e3d2fdfd211d39ce
        failing since 10 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-01-16T05:31:08.822309  + set +x
    2023-01-16T05:31:08.823468  <8>[   44.237225][  T172] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 826074_1.5.2.4.1>
    2023-01-16T05:31:08.953219  #
    2023-01-16T05:31:09.055478  / # #export SHELL=3D/bin/sh
    2023-01-16T05:31:09.055932  =

    2023-01-16T05:31:09.157347  / # export SHELL=3D/bin/sh. /lava-826074/en=
vironment
    2023-01-16T05:31:09.157802  =

    2023-01-16T05:31:09.258998  / # . /lava-826074/environment/lava-826074/=
bin/lava-test-runner /lava-826074/1
    2023-01-16T05:31:09.259933  =

    2023-01-16T05:31:09.264100  / # /lava-826074/bin/lava-test-runner /lava=
-826074/1 =

    ... (18 line(s) more)  =

 =20
