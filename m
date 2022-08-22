Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCE8B59CBDB
	for <lists+linux-next@lfdr.de>; Tue, 23 Aug 2022 01:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbiHVXCn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Aug 2022 19:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbiHVXCm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Aug 2022 19:02:42 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F574F1A0
        for <linux-next@vger.kernel.org>; Mon, 22 Aug 2022 16:02:40 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id c16-20020a17090aa61000b001fb3286d9f7so34516pjq.1
        for <linux-next@vger.kernel.org>; Mon, 22 Aug 2022 16:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=7pg1V6s1E4TswHtos5CZutAgNvg6txMupVpF31U0w8I=;
        b=hWF/cz9FOg8+J586mLO5oKRFJYkniLOU6J9nxArWl+zLx0bLli2AUdeSRM/4tsN8D5
         BhUnJEZoK3Tfwnt+bSyHYILykWsHscVx7Jpl66Br8UPWUpz5rJW/aa1cmCFwxMlPt1ej
         b0pMkoLGJK0esL+3tFu2TB2iz3r5UHFmwWNT+Bz3nrizaVf8bdBIADY9WeQlahqAvBne
         JgCNvYiwQIQcNBFU+L2guW3+0upq2UupGgcFH9JHf7KpV4uzZIudqmSVsKdGBhSmmT0+
         dyO0hE0eBW9a50qzeg5VaB/zQKLUaBaAq1VisxxO33lXLvkuwAcQrgREAYKqCKO4gXLU
         AgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=7pg1V6s1E4TswHtos5CZutAgNvg6txMupVpF31U0w8I=;
        b=sdA226OahfYonybw7jNaIa/NPG4gxMWH9VuHpV9zEJ/ItKwKa3UxqIg3N2evL0LXD9
         dcwvuiRLromHUoloqs7e41nEIF7mLyFEX33yl3NpYbMFbnGd2yiXXdAQcx4Fd9MIY3DV
         0VY4xesbzjlcMKOe6iRUpiHdjBbqvF4gKwypA0J/Y6aeTrknkfGOoqZLJSkapuADJ9M4
         8RtqHuW9U/crj2a8O6TOI7xvBqJu2TP/50jv9Z+Zk7Lmct0UBaJCmw3DagyPjhFzOdNf
         lew8VhwBXJd/RdCV8LfeXGqF+7I5Cn18wwD+MeEfpX/jCgVJYT9LzmSEfjyIg6SWikA3
         Jxfg==
X-Gm-Message-State: ACgBeo1uJUMFZiNCxehGOOvtwLIBX1jiSpjknjEoIVfjLoexesAWW3L3
        PxRS2c+tIDdN8Zm5awxLcpA42VeoScs3FYzI
X-Google-Smtp-Source: AA6agR70j26qa+EgXlKXHQdblca6wsnS0nWugeC4kafdnLwMIthX1Nn/I4O36vqMxs+1jZ0xGvQ8fg==
X-Received: by 2002:a17:902:8603:b0:172:ede7:6076 with SMTP id f3-20020a170902860300b00172ede76076mr6422054plo.72.1661209358893;
        Mon, 22 Aug 2022 16:02:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e8-20020a656788000000b0040c52ff0ba9sm7917503pgr.37.2022.08.22.16.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 16:02:38 -0700 (PDT)
Message-ID: <63040b0e.650a0220.15e40.e41b@mx.google.com>
Date:   Mon, 22 Aug 2022 16:02:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220822
Subject: next/master baseline: 512 runs, 31 regressions (next-20220822)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 512 runs, 31 regressions (next-20220822)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig           | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | omap2pl=
us_defconfig          | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig                    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | clang-16 | multi_v=
7_defconfig           | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220822/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220822
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cc2986f4dc67df7e6209e0cd74145fffbd30d693 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d2032dc387e1b4355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d2032dc387e1b4355=
645
        failing since 62 days (last pass: next-20220610, first fail: next-2=
0220621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d3e2315b477c1135566d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d3e2315b477c11355=
66e
        failing since 67 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d0cfff5f1865bf355651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d0cfff5f1865bf355=
652
        failing since 66 days (last pass: next-20220610, first fail: next-2=
0220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303e546d56c015c85355676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303e546d56c015c85355=
677
        failing since 67 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6303dd8954b0078506355658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303dd8954b0078506355=
659
        failing since 66 days (last pass: next-20220610, first fail: next-2=
0220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d2a53625e1066e35565b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d2a53625e1066e355=
65c
        failing since 299 days (last pass: next-20211026, first fail: next-=
20211027) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d3a98937d3bbeb355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d3a98937d3bbeb355=
645
        failing since 12 days (last pass: next-20220808, first fail: next-2=
0220810) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d2e280d09f9222355643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d2e280d09f9222355=
644
        new failure (last pass: next-20220810) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6303e7319900b3cdd1355665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303e7319900b3cdd1355=
666
        failing since 105 days (last pass: v5.16-rc4-6579-gea922272cbe5, fi=
rst fail: next-20220509) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303dde59a41d54570355666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303dde59a41d54570355=
667
        failing since 105 days (last pass: v5.16-rc4-6579-gea922272cbe5, fi=
rst fail: next-20220509) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d7a546c92d27393556c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d7a546c92d2739355=
6c8
        failing since 34 days (last pass: next-20220707, first fail: next-2=
0220718) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6303dac1ae49c8aaa1355643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303dac1ae49c8aaa1355=
644
        failing since 5 days (last pass: next-20220816, first fail: next-20=
220817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d2ba5ffee11b3b355662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d2ba5ffee11b3b355=
663
        failing since 5 days (last pass: next-20220816, first fail: next-20=
220817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6303de931cebb17ed5355688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303de931cebb17ed5355=
689
        failing since 133 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6303e9a804b90846f4355664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303e9a804b90846f4355=
665
        new failure (last pass: next-20220817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d23ad4d3f213d5355664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d23ad4d3f213d5355=
665
        failing since 67 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303e84002963df8cd355654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303e84002963df8cd355=
655
        failing since 62 days (last pass: next-20220602, first fail: next-2=
0220621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6303e33f4043c60af4355683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303e33f4043c60af4355=
684
        failing since 65 days (last pass: next-20220602, first fail: next-2=
0220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d203e5f8e1450035568a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d203e5f8e14500355=
68b
        failing since 19 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d6236caf7255b9355656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d6236caf7255b9355=
657
        failing since 19 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d202e5f8e14500355685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d202e5f8e14500355=
686
        failing since 19 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d6226caf7255b9355653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d6226caf7255b9355=
654
        failing since 19 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d8de7431f37aff35565d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d8de7431f37aff355=
65e
        failing since 250 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fi=
rst fail: next-20211214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6303d2ff80d09f9222355670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6303d2ff80d09f9222355=
671
        failing since 250 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fi=
rst fail: next-20211214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | clang-16 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303fd11f3598b26c3355653

  Results:     69 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0-++20220815071801+8719f=
aafdb3f-1~exp1~20220815071906.353)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/6303fd11f3598b26c335566b
        new failure (last pass: next-20220812)

    2022-08-22T22:02:36.836999  /lava-7088341/1/../bin/lava-test-case
    2022-08-22T22:02:36.864552  <8>[   23.624826] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-grf-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6303e271d29e458c7f35566a

  Results:     69 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/6303e271d29e458c7f355682
        new failure (last pass: next-20220816)

    2022-08-22T20:08:58.732867  /lava-7087829/1/../bin/lava-test-case
    2022-08-22T20:08:58.757328  <8>[   22.755314] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-grf-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6303e88bb7d4a3248b355654

  Results:     69 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/6303e88bb7d4a3248b35566c
        new failure (last pass: next-20220810)

    2022-08-22T20:35:00.477960  /lava-7088020/1/../bin/lava-test-case
    2022-08-22T20:35:00.497206  <8>[   23.546844] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-grf-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/6303d2d16a01884700355656

  Results:     84 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220822/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/6303d2d16a01884700355679
        new failure (last pass: next-20220812)

    2022-08-22T19:02:29.546429  /lava-7087888/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/6303d2d16a0188470035569f
        failing since 117 days (last pass: next-20220421, first fail: next-=
20220426)

    2022-08-22T19:02:26.178735  /lava-7087888/1/../bin/lava-test-case
    2022-08-22T19:02:26.191096  <8>[   34.742779] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/6303d2d16a018847003556a0
        failing since 117 days (last pass: next-20220421, first fail: next-=
20220426)

    2022-08-22T19:02:25.133343  /lava-7087888/1/../bin/lava-test-case
    2022-08-22T19:02:25.145430  <8>[   33.697106] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/6303d2d16a018847003556a1
        failing since 117 days (last pass: next-20220421, first fail: next-=
20220426)

    2022-08-22T19:02:24.097991  /lava-7087888/1/../bin/lava-test-case
    2022-08-22T19:02:24.107880  <8>[   32.659632] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
