Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133DC58ADD6
	for <lists+linux-next@lfdr.de>; Fri,  5 Aug 2022 18:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240982AbiHEQFO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Aug 2022 12:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbiHEQFM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Aug 2022 12:05:12 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1015E1C128
        for <linux-next@vger.kernel.org>; Fri,  5 Aug 2022 09:05:08 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id gj1so3207738pjb.0
        for <linux-next@vger.kernel.org>; Fri, 05 Aug 2022 09:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=aUFWqR/fDapDNV/sMGDXilP1pmzg2mcbIs4wciPA4Cg=;
        b=aJq6VbhPlSw1LCxlVI2K2jtdDBIh1VZZjdhNZ0e8Gg+/r9Se71jY1mWm23TaEB2tNH
         HJmKYLuC7uyZMtTA1COVsd0+Be6M+nbfwbF0TjueBdZJrME8WZLtUxvtS9SQs8LeOyYM
         dicaVQg/PdlPILelBOl2R6DG8slUMYj1ESEvA3bT73g1ekNW+itsK9CaLpQt5wwnBd6h
         isZbF05FotTaD/ZdFT+ZWjbZz7MIcd26DhOSaEs8UJvhJqLu5e+UcevMJb5EeN81GRZh
         HjYMUEiZ/3wHi6IVj0a8xOoO5P1S2zGt6TJYCUOG0fDBKZ8G7E73nm9JECaCO/PvHp9n
         GgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=aUFWqR/fDapDNV/sMGDXilP1pmzg2mcbIs4wciPA4Cg=;
        b=ZJ7rzKN+9v11f+cpC0CEMs8Lhs5iBtC8Xxeta6joVVHFP85iRRk1sZtTWtnxRX9NAz
         P9yHI82T3QSFGnS2Nf5EXfrYtlGrQY7mdgsnJuis9gnMLh8lYD4/xkuW8iRHCEv/9ASl
         jDgAj/4WfFD/9330fZSetDpUc6FvlDvr3AF3WaEx27b7Y8A6GHRVOPO7y4bRfhQLCGdQ
         Hr97xK+9pS1dw1rZYSVaA+04FwYeYOEaAjUdmDzB4U8C8qFWufusd42lWLjJlCqB4tzt
         x/W+rK6U7Wiam+/4NWHH83QjymlRXwnh4+oQG7o5LMxmdVGMe3j5CA03Ya7FFgN4BmEA
         tDiQ==
X-Gm-Message-State: ACgBeo39/Vep4oAGfqyERVzsT3vUCXrzT3+FLZ/U9EW0vY8JS9FaYRdI
        hiAzH3AqZ+Oj6wE2b+T59SC3lq0jgeZHbVK6FtM=
X-Google-Smtp-Source: AA6agR5nKM5zaeZ/td1o4cWNOqM1C1z5rYq/F/dz5+N5FDnYKHGBuIv2ClVChX18IgQ43vvQYQ5ddw==
X-Received: by 2002:a17:903:248:b0:168:cf03:eefe with SMTP id j8-20020a170903024800b00168cf03eefemr7466630plh.124.1659715506219;
        Fri, 05 Aug 2022 09:05:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y14-20020a17090322ce00b0016d9a17c8e0sm3237059plg.68.2022.08.05.09.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 09:05:05 -0700 (PDT)
Message-ID: <62ed3fb1.170a0220.eea5f.57b7@mx.google.com>
Date:   Fri, 05 Aug 2022 09:05:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-11387-gd91170a44a94
Subject: next/pending-fixes baseline: 599 runs,
 61 regressions (v5.19-11387-gd91170a44a94)
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

next/pending-fixes baseline: 599 runs, 61 regressions (v5.19-11387-gd91170a=
44a94)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-11387-gd91170a44a94/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-11387-gd91170a44a94
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d91170a44a94c82c52a3ae5243dc5e6c659f70cb =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed07ddcfd6da8d06daf235

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-linaro-lkft/baseline-a=
m57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-linaro-lkft/baseline-a=
m57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed07ddcfd6da8d06daf=
236
        new failure (last pass: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0862bbbe04c7badaf060

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0862bbbe04c7badaf=
061
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed092af7570eae2cdaf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft=
/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft=
/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed092af7570eae2cdaf=
058
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0bf9e8b9a4beefdaf05b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-l=
inaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-l=
inaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0bf9e8b9a4beefdaf=
05c
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0d9ebe80180bf8daf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0d9ebe80180bf8daf=
05d
        new failure (last pass: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed081ec07121821fdaf05f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed081ec07121821fdaf=
060
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed08b740bf8233fedaf076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-be=
aglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-be=
aglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed08b740bf8233fedaf=
077
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed09878796c22dd0daf0b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/bas=
eline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/bas=
eline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed09878796c22dd0daf=
0b4
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0b9b6adc7921aedaf062

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0b9b6adc7921aedaf=
063
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0f2800a9f73331daf066

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
roonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
roonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0f2800a9f73331daf=
067
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed07f7e2c5f993c7daf062

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed07f7e2c5f993c7daf=
063
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed095e40257be008daf070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed095e40257be008daf=
071
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0ac606b8bdba45daf06d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baselin=
e-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baselin=
e-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0ac606b8bdba45daf=
06e
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed10a2f72ead47f0daf08d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed10a2f72ead47f0daf=
08e
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed144e4482585d56daf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed144e4482585d56daf=
05d
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0eac73e3fee7dfdaf064

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ed0eac73e3fee=
7dfdaf06c
        new failure (last pass: v5.19-8283-ga8bc7f656e322)
        47 lines

    2022-08-05T12:35:37.622062  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:3  pfn:397c4
    2022-08-05T12:35:37.631035  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:1  pfn:397ba
    2022-08-05T12:35:37.640145  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:1  pfn:397b9
    2022-08-05T12:35:37.640480  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:1  pfn:397b0
    2022-08-05T12:35:37.649090  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:1  pfn:397af
    2022-08-05T12:35:37.658116  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:1  pfn:39767
    2022-08-05T12:35:37.658340  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:1  pfn:39766
    2022-08-05T12:35:37.667089  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:1  pfn:39765
    2022-08-05T12:35:37.676144  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:1  pfn:3974a
    2022-08-05T12:35:37.676300  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:1  pfn:39749 =

    ... (19 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0cf54c01045d42daf06f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ed0cf54c01045=
d42daf077
        new failure (last pass: v5.19-8283-ga8bc7f656e322)
        46 lines

    2022-08-05T12:28:16.826456  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fa8
    2022-08-05T12:28:16.835421  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fa7
    2022-08-05T12:28:16.844339  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fa6
    2022-08-05T12:28:16.844507  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fa5
    2022-08-05T12:28:16.853826  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fb7
    2022-08-05T12:28:16.862499  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fb6
    2022-08-05T12:28:16.862861  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fb5
    2022-08-05T12:28:16.871411  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fb4
    2022-08-05T12:28:16.881679  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fb3
    2022-08-05T12:28:16.882032  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:38fb2 =

    ... (19 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0e6f57bd505340daf069

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0e6f57bd505340daf=
06a
        failing since 17 days (last pass: v5.19-rc6-500-g27ca1dbc37a0, firs=
t fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed072b78959b1069daf085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed072b78959b1069daf=
086
        failing since 66 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed091fc494697467daf089

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed091fc494697467daf=
08a
        failing since 66 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0b13c368a4c0a3daf07d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0b13c368a4c0a3daf=
07e
        failing since 66 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0efbd4395f9514daf05e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0efbd4395f9514daf=
05f
        failing since 41 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed10ef0c304afc17daf08b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed10ef0c304afc17daf=
08c
        failing since 66 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0b6fb333057defdaf09a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0b6fb333057defdaf=
09b
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0b75201d8fb9e1daf061

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0b75201d8fb9e1daf=
062
        failing since 1 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0f4f4b1078fd98daf063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jets=
on-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jets=
on-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0f4f4b1078fd98daf=
064
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed1373751338f66ddaf064

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-j=
etson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-j=
etson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed1373751338f66ddaf=
065
        failing since 0 day (last pass: v5.19-rc7-260-gaab2277715b66, first=
 fail: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed14c718a57bb3b5daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/ba=
seline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/ba=
seline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed14c718a57bb3b5daf=
057
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed178313d37a12c2daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed178313d37a12c2daf=
057
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed1a3fb3f23c9ba5daf061

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed1a3fb3f23c9ba5daf=
062
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0dfbcf3c185f74daf05f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0dfbcf3c185f74daf=
060
        failing since 0 day (last pass: v5.19-1483-gffa33bbcf63ea, first fa=
il: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62ed0511b1782a6693daf057

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron=
/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron=
/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62ed0511b1782a6693daf065
        new failure (last pass: v5.19-8283-ga8bc7f656e322)

    2022-08-05T11:54:48.675300  /lava-150611/1/../bin/lava-test-case
    2022-08-05T11:54:48.675862  <8>[   19.413026] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-05T11:54:48.676048  /lava-150611/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62e=
d0511b1782a6693daf067
        new failure (last pass: v5.19-8283-ga8bc7f656e322)

    2022-08-05T11:54:49.712358  /lava-150611/1/../bin/lava-test-case
    2022-08-05T11:54:49.712743  <8>[   20.456904] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-05T11:54:49.712994  /lava-150611/1/../bin/lava-test-case
    2022-08-05T11:54:49.713229  <8>[   20.476712] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-05T11:54:49.713462  /lava-150611/1/../bin/lava-test-case
    2022-08-05T11:54:49.713689  <8>[   20.496967] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-05T11:54:49.713916  /lava-150611/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62ed0628da9dc5a9b6daf126

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62ed0628da9dc5a9b6daf134
        new failure (last pass: v5.19-8283-ga8bc7f656e322)

    2022-08-05T11:59:12.467901  /lava-150619/1/../bin/lava-test-case
    2022-08-05T11:59:12.468343  <8>[   19.231458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-05T11:59:12.468592  /lava-150619/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62e=
d0628da9dc5a9b6daf136
        new failure (last pass: v5.19-8283-ga8bc7f656e322)

    2022-08-05T11:59:13.505187  /lava-150619/1/../bin/lava-test-case
    2022-08-05T11:59:13.505586  <8>[   20.275237] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-05T11:59:13.505830  /lava-150619/1/../bin/lava-test-case
    2022-08-05T11:59:13.506058  <8>[   20.295035] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-05T11:59:13.506286  /lava-150619/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62ed0b2ad390ad9793daf061

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62ed0b2ad390ad9793daf06f
        new failure (last pass: v5.19-8283-ga8bc7f656e322)

    2022-08-05T12:20:32.435779  /lava-150639/1/../bin/lava-test-case
    2022-08-05T12:20:32.436155  <8>[   19.324236] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62e=
d0b2ad390ad9793daf071
        new failure (last pass: v5.19-8283-ga8bc7f656e322)

    2022-08-05T12:20:33.472682  /lava-150639/1/../bin/lava-test-case
    2022-08-05T12:20:33.473065  <8>[   20.367977] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed071478959b1069daf063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie=
/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie=
/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed071478959b1069daf=
064
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed072378959b1069daf080

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed072378959b1069daf=
081
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed085dbbbe04c7badaf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pand=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pand=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed085dbbbe04c7badaf=
05d
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0a29dcfd619991daf08b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0a29dcfd619991daf=
08c
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0c825d3fe60405daf06e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/ba=
seline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/ba=
seline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0c825d3fe60405daf=
06f
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0e26a7108b410fdaf066

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0e26a7108b410fdaf=
067
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0fde38eb2defa1daf06a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0fde38eb2defa1daf=
06b
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed040c81c2fa2219daf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm=
-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm=
-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed040c81c2fa2219daf=
05d
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed042d1d2cbec084daf087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-=
vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-=
vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed042d1d2cbec084daf=
088
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0416944415613adaf086

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_ar=
m-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_ar=
m-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0416944415613adaf=
087
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed040d944415613adaf069

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm=
-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm=
-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed040d944415613adaf=
06a
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed042f1d2cbec084daf08a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-=
vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-=
vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed042f1d2cbec084daf=
08b
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0417944415613adaf08f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_ar=
m-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_ar=
m-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0417944415613adaf=
090
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0d17eb44668566daf075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0d17eb44668566daf=
076
        new failure (last pass: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0d26eb44668566daf091

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0d26eb44668566daf=
092
        new failure (last pass: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62ed06c2f2f069d517daf087

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62ed06c3f2f069d517daf0a9
        failing since 158 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-08-05T12:02:01.485340  /lava-6978459/1/../bin/lava-test-case
    2022-08-05T12:02:01.496535  <8>[   40.839593] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62ed06c3f2f069d517daf0cc
        failing since 66 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-05T12:01:59.417481  /lava-6978459/1/../bin/lava-test-case
    2022-08-05T12:01:59.426541  <8>[   38.769113] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62ed06c3f2f069d517daf0cd
        failing since 66 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-05T12:01:58.388713  /lava-6978459/1/../bin/lava-test-case
    2022-08-05T12:01:58.401017  <8>[   37.742499] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62ed06c3f2f069d517daf0ce
        failing since 66 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-05T12:01:56.328101  <8>[   35.670016] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-08-05T12:01:56.922343  <4>[   36.263635] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-08-05T12:01:57.356928  /lava-6978459/1/../bin/lava-test-case
    2022-08-05T12:01:57.367246  <8>[   36.709025] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62ed0574fe569be36ddaf074

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/=
baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/=
baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ed0574fe569be=
36ddaf07c
        new failure (last pass: v5.19-8283-ga8bc7f656e322)
        11 lines

    2022-08-05T11:56:29.964283  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000078
    2022-08-05T11:56:29.964833  kern  :alert : Mem abort info:
    2022-08-05T11:56:29.965147  kern  :alert :   ESR =3D 0x0000000096000004
    2022-08-05T11:56:29.965462  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-08-05T11:56:29.965764  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-08-05T11:56:29.966102  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-08-05T11:56:29.966388  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-08-05T11:56:29.966924  kern  :alert : Data abort info:
    2022-08-05T11:56:29.987355  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-08-05T11:56:29.989327  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (2 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62ed0574fe569be=
36ddaf07d
        new failure (last pass: v5.19-8283-ga8bc7f656e322)
        2 lines

    2022-08-05T11:56:29.995920  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-08-05T11:56:29.999321  kern  :emerg : Code: f940a6c0 f9402023 9103=
7015 295be001 (f9403c77) =

    2022-08-05T11:56:30.001403  <8>[   15.916431] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-08-05T11:56:30.001796  + set +x   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62ed0664e0515240aedaf065

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ed0664e0515240aedaf=
066
        new failure (last pass: v5.19-8283-ga8bc7f656e322) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62ed0af17408c71a88daf06e

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-11387=
-gd91170a44a94/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ed0af17408c71=
a88daf076
        new failure (last pass: v5.19-8283-ga8bc7f656e322)
        11 lines

    2022-08-05T12:19:43.778898  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000000c
    2022-08-05T12:19:43.779128  kern  :alert : Mem abort info:
    2022-08-05T12:19:43.779322  kern  :alert :   ESR =3D 0x0000000096000004
    2022-08-05T12:19:43.779511  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-08-05T12:19:43.779698  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-08-05T12:19:43.780598  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-08-05T12:19:43.780917  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2022-08-05T12:19:43.781113  kern  :alert : Data abort info:
    2022-08-05T12:19:43.801917  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2022-08-05T12:19:43.804960  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (2 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62ed0af17408c71=
a88daf077
        new failure (last pass: v5.19-8283-ga8bc7f656e322)
        2 lines

    2022-08-05T12:19:43.809631  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2022-08-05T12:19:43.812952  kern  :emerg : Code: f9403c14 f9403c35 f940=
0aa0 b40004e0 (39403281) =

    2022-08-05T12:19:43.815874  <8>[   24.348947] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-08-05T12:19:43.816184  + set +x   =

 =20
