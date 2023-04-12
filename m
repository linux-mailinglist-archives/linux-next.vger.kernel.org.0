Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2826DEADC
	for <lists+linux-next@lfdr.de>; Wed, 12 Apr 2023 07:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjDLFE1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Apr 2023 01:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjDLFE0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2023 01:04:26 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B7F4206
        for <linux-next@vger.kernel.org>; Tue, 11 Apr 2023 22:04:21 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-635a81be246so809869b3a.2
        for <linux-next@vger.kernel.org>; Tue, 11 Apr 2023 22:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1681275860; x=1683867860;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hrOvktiCfKeeNYe1TnmrZdmqr9G0ouifsuSsj4Yiq9U=;
        b=5m6e/C5WZ9t0YAB4FZdosPRwmsMaTeTYzvaep3r9I+kUcgDmVm0ICPMpf+wqhXuFXN
         mF6sUWr1lOhS6+1/LpID+2/ezGc6Uwyj0OxXU8hF3xNTLPTA7PVweGi+JRAvTYEqVCX4
         eaKgSadKoAsyPeiH2YAdZQB7j+I6+vL7VkkCfjNlWAoKeDhvoPxRG3axG6w5h1ybWKJi
         bi00/DEkUwM0jQpehdL9fJ66YCLgffvmLZTSl/18WWuZEhR79XcoKASJSkOjDownLxZv
         wb+iDBWEb9H3iqKMphQxlVtvE1PbmPsXmSiQ4WBU2gDfFFIbFKIpCE5YfX9QzuLP5FCn
         ZaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681275860; x=1683867860;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrOvktiCfKeeNYe1TnmrZdmqr9G0ouifsuSsj4Yiq9U=;
        b=Yxj1GPHiO9f9vX0fgxMuaLlxzuCReHJfjG2WifIAkEejxCqYKu4TMG0fGsvOr7d7RZ
         CZGnymGAIZUMsH9jz0/tI5/zeZG8LCRtNyWIjnb5BMYV2IwO6Z/7hbXa2jPM+Fg5inFZ
         15XILN6QGwc+yxsKDa+L9ier3KtvZpzgU2OIW1Jw6GO2XFkH5cTF1mlTY+0+3xzoQv0V
         0O6ZY8VFz/WHQrk3UloSHF2PfuwP8ED9zDBjdqtD/LikNzOFUJUgQK5eK5TPuDCUmrfX
         5WtFlck1Q0LweKpJLK+8aehGWXPC9RTJj85QfrPLsRYK/CFI3BwINav6xPqbJ7HmsgSQ
         hisg==
X-Gm-Message-State: AAQBX9e/7GNDecCdybeBpZZgQKCGzgfXX4qb5HHSANuO3Kie/9Ubt1LW
        jnWFE7SI+2XBh3ED+au1AjPwFHHfuOp4gr8ji8y/XA==
X-Google-Smtp-Source: AKy350bATdPW89O3dJZOirBUaWMv7F4gY0bsdSWbQdz54ckA7UGGo/jQ1WiAn/Ij2MyS6tU35ycnQA==
X-Received: by 2002:a62:2583:0:b0:638:63a3:2474 with SMTP id l125-20020a622583000000b0063863a32474mr4561364pfl.26.1681275859578;
        Tue, 11 Apr 2023 22:04:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n4-20020a62e504000000b0062ddefe02dfsm11009926pff.171.2023.04.11.22.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 22:04:19 -0700 (PDT)
Message-ID: <64363bd3.620a0220.168c1.6032@mx.google.com>
Date:   Tue, 11 Apr 2023 22:04:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-rc6-186-g99455a05abbd
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 522 runs,
 41 regressions (v6.3-rc6-186-g99455a05abbd)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 522 runs, 41 regressions (v6.3-rc6-186-g99455a=
05abbd)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 2          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jh7100-starfi...isionfive-v1 | riscv | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+kselftest          | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc6-186-g99455a05abbd/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc6-186-g99455a05abbd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      99455a05abbda682706286b04307f4fe04221b4a =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643607dcbb61a73eac2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643607dcbb61a73eac2e8=
5e8
        failing since 184 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643609404232827c5c2e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643609404232827c5c2e8=
62c
        failing since 181 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643606a0291d8635312e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643606a0291d8635312e8=
5f4
        failing since 1 day (last pass: v6.3-rc5-284-g1beddc8728ad, first f=
ail: v6.3-rc6-158-g254ff7648cb9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643605e01b5a3097402e869d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643605e01b5a3097402e86a2
        failing since 84 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-12T01:13:52.364379  <8>[   16.731379] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3487239_1.5.2.4.1>
    2023-04-12T01:13:52.471179  / # #
    2023-04-12T01:13:52.572562  export SHELL=3D/bin/sh
    2023-04-12T01:13:52.572957  #
    2023-04-12T01:13:52.674250  / # export SHELL=3D/bin/sh. /lava-3487239/e=
nvironment
    2023-04-12T01:13:52.674657  =

    2023-04-12T01:13:52.775892  / # . /lava-3487239/environment/lava-348723=
9/bin/lava-test-runner /lava-3487239/1
    2023-04-12T01:13:52.776909  =

    2023-04-12T01:13:52.781925  / # /lava-3487239/bin/lava-test-runner /lav=
a-3487239/1
    2023-04-12T01:13:52.855522  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6436065e1fc9aa78bb2e8695

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6436065e1fc9aa78bb2e869a
        failing since 84 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-12T01:16:05.351042  <8>[   14.776634] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3487250_1.5.2.4.1>
    2023-04-12T01:16:05.460169  / # #
    2023-04-12T01:16:05.562006  export SHELL=3D/bin/sh
    2023-04-12T01:16:05.562383  #
    2023-04-12T01:16:05.663620  / # export SHELL=3D/bin/sh. /lava-3487250/e=
nvironment
    2023-04-12T01:16:05.664165  =

    2023-04-12T01:16:05.765381  / # . /lava-3487250/environment/lava-348725=
0/bin/lava-test-runner /lava-3487250/1
    2023-04-12T01:16:05.765996  =

    2023-04-12T01:16:05.771005  / # /lava-3487250/bin/lava-test-runner /lav=
a-3487250/1
    2023-04-12T01:16:05.865382  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6436086fa21f6b04e32e862a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6436086fa21f6b04e32e862f
        failing since 84 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-12T01:24:22.040383  <8>[   14.637509] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3487322_1.5.2.4.1>
    2023-04-12T01:24:22.150293  / # #
    2023-04-12T01:24:22.252200  export SHELL=3D/bin/sh
    2023-04-12T01:24:22.252693  #
    2023-04-12T01:24:22.354090  / # export SHELL=3D/bin/sh. /lava-3487322/e=
nvironment
    2023-04-12T01:24:22.354501  =

    2023-04-12T01:24:22.455791  / # . /lava-3487322/environment/lava-348732=
2/bin/lava-test-runner /lava-3487322/1
    2023-04-12T01:24:22.456709  =

    2023-04-12T01:24:22.461266  / # /lava-3487322/bin/lava-test-runner /lav=
a-3487322/1
    2023-04-12T01:24:22.547601  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64360918495e9d82312e860f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64360918495e9d82312e8614
        failing since 84 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-12T01:27:24.998841  <8>[   24.468537] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3487346_1.5.2.4.1>
    2023-04-12T01:27:25.108746  / # #
    2023-04-12T01:27:25.214354  export SHELL=3D/bin/sh
    2023-04-12T01:27:25.215557  #
    2023-04-12T01:27:25.323970  / # export SHELL=3D/bin/sh. /lava-3487346/e=
nvironment
    2023-04-12T01:27:25.325267  =

    2023-04-12T01:27:25.427904  / # . /lava-3487346/environment/lava-348734=
6/bin/lava-test-runner /lava-3487346/1
    2023-04-12T01:27:25.429396  =

    2023-04-12T01:27:25.435155  / # /lava-3487346/bin/lava-test-runner /lav=
a-3487346/1
    2023-04-12T01:27:25.521308  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/643603f9585a64a42c2e8603

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643603f9585a64a=
42c2e860a
        failing since 40 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-04-12T01:05:45.748204  kern  :alert : Register r6 information: NUL=
L pointer
    2023-04-12T01:05:45.793165  kern  :alert : Register r7 information: non=
-paged memory
    2023-04-12T01:05:45.793651  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4ba5400 pointer offset 4 size 512
    2023-04-12T01:05:45.793823  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-12T01:05:45.793976  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-12T01:05:45.794125  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e2000 allocated at load_module+0x898/0=
x1b10
    2023-04-12T01:05:45.796366  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-12T01:05:45.887060  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-12T01:05:45.887778  kern  :emerg : Process udevd (pid: 74, stac=
k limit =3D 0x770c8722)
    2023-04-12T01:05:45.888066  kern  :emerg : Stack: (0xc8991cf8 to 0xc899=
2000) =

    ... (7 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643603f9585a64a=
42c2e860b
        failing since 443 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-04-12T01:05:45.701923  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-04-12T01:05:45.702824  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-04-12T01:05:45.703479  kern  :alert : 8<--- cut here ---
    2023-04-12T01:05:45.704586  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-04-12T01:05:45.705181  kern  :alert : [00000060] *pgd=3Dc4ab1831, =
*pte=3D00000000, *ppte=3D00000000
    2023-04-12T01:05:45.705789  kern  :alert : Register r0 information: non=
-paged memory
    2023-04-12T01:05:45.744966  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8990000 allocated at kernel_clone+0x98/0x=
3a0
    2023-04-12T01:05:45.745230  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-12T01:05:45.745418  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-12T01:05:45.745593  kern  :alert : R<8><LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64360a2644b28fd31b2e8661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360a2644b28fd31b2e8=
662
        failing since 106 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64360724cb5efbd6f42e863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360724cb5efbd6f42e8=
63e
        failing since 208 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643609c2240c50de492e8693

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643609c2240c50de492e8698
        failing since 97 days (last pass: v6.1-rc4-339-g185da88d03ed, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-12T01:30:21.904707  + set +x
    2023-04-12T01:30:21.905805  <8>[   57.382714] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1197726_1.5.2.4.1>
    2023-04-12T01:30:22.015877  =

    2023-04-12T01:30:23.175275  / # #export SHELL=3D/bin/sh
    2023-04-12T01:30:23.180917  =

    2023-04-12T01:30:24.728107  / # export SHELL=3D/bin/sh. /lava-1197726/e=
nvironment
    2023-04-12T01:30:24.733953  =

    2023-04-12T01:30:27.555247  / # . /lava-1197726/environment/lava-119772=
6/bin/lava-test-runner /lava-1197726/1
    2023-04-12T01:30:27.561302  =

    2023-04-12T01:30:27.561848  / # /lava-1197726/bin/lava-test-runner /lav=
a-1197726/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643607a74f521cb7cc2e8604

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643607a74f521cb7cc2e8609
        failing since 97 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-12T01:21:17.533455  + set<8>[   38.302818] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1197729_1.5.2.4.1>
    2023-04-12T01:21:17.533563   +x
    2023-04-12T01:21:17.636784  / # #
    2023-04-12T01:21:18.795364  export SHELL=3D/bin/sh
    2023-04-12T01:21:18.801047  #
    2023-04-12T01:21:20.348369  / # export SHELL=3D/bin/sh. /lava-1197729/e=
nvironment
    2023-04-12T01:21:20.354067  =

    2023-04-12T01:21:23.174874  / # . /lava-1197729/environment/lava-119772=
9/bin/lava-test-runner /lava-1197729/1
    2023-04-12T01:21:23.181151  =

    2023-04-12T01:21:23.181502  / # /lava-1197729/bin/lava-test-runner /lav=
a-1197729/1 =

    ... (23 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64360a79bada2b27622e866d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64360a79bada2b27622e8672
        failing since 97 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-12T01:33:09.109702  + set +x
    2023-04-12T01:33:09.110821  <8>[   66.839574] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1197727_1.5.2.4.1>
    2023-04-12T01:33:09.220713  / # #
    2023-04-12T01:33:10.381102  export SHELL=3D/bin/sh
    2023-04-12T01:33:10.386825  #
    2023-04-12T01:33:10.387185  / # export SHELL=3D/bin/sh
    2023-04-12T01:33:11.934650  / # . /lava-1197727/environment
    2023-04-12T01:33:14.761024  /lava-1197727/bin/lava-test-runner /lava-11=
97727/1
    2023-04-12T01:33:14.766782  . /lava-1197727/environment
    2023-04-12T01:33:14.767041  / # /lava-1197727/bin/lava-test-runner /lav=
a-1197727/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jh7100-starfi...isionfive-v1 | riscv | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6436072ccb5efbd6f42e8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436072ccb5efbd6f42e8=
647
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643609a5e58663c4d02e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643609a5e58663c4d02e8=
5eb
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6436097d1c041645632e8678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436097d1c041645632e8=
679
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64360a1981e42867dc2e8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360a1981e42867dc2e8=
653
        failing since 51 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643609781c041645632e8674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643609781c041645632e8=
675
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64360afbc68d3942442e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360afbc68d3942442e8=
5fe
        failing since 63 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643609761c041645632e8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643609761c041645632e8=
672
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64360a0f81e42867dc2e8629

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360a0f81e42867dc2e8=
62a
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643607fde97b9b8ca52e85f6

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-brooni=
e/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-brooni=
e/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/643607fde=
97b9b8ca52e85f9
        new failure (last pass: v6.3-rc6-158-g254ff7648cb9)

    2023-04-12T01:23:01.171743  <3>[   21.743759] mmc0: error -84 whilst in=
itialising SD card
    2023-04-12T01:23:01.418007  /lava-315250/1/../bin/lava-test-case
    2023-04-12T01:23:01.428876  <8>[   22.000155] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
3607fde97b9b8ca52e85fa
        new failure (last pass: v6.3-rc6-158-g254ff7648cb9)

    2023-04-12T01:23:00.385377  /lava-315250/1/../bin/lava-test-case
    2023-04-12T01:23:00.397173  <8>[   20.967587] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64360930495e9d82312e8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360930495e9d82312e8=
641
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64360aacb12e634aff2e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360aacb12e634aff2e8=
5f4
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64360a261620d375cc2e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360a261620d375cc2e8=
5ea
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64360ee1c06b88a3612e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360ee1c06b88a3612e8=
5f5
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64360718cb5efbd6f42e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360718cb5efbd6f42e8=
5e7
        failing since 181 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64360805e97b9b8ca52e8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360805e97b9b8ca52e8=
639
        failing since 181 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6436072dcb5efbd6f42e8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436072dcb5efbd6f42e8=
64a
        failing since 181 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643607dc2130fc33c22e862a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643607dc2130fc33c22e8=
62b
        failing since 181 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6436072ccb5efbd6f42e8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6436072ccb5efbd6f42e8=
644
        failing since 181 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643607b6f95750b3352e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643607b6f95750b3352e8=
5ea
        failing since 181 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64360716dbc7cd188b2e865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360716dbc7cd188b2e8=
65d
        failing since 181 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643607b55e6a367fb62e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643607b55e6a367fb62e8=
611
        failing since 181 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64360a74bada2b27622e866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360a74bada2b27622e8=
66b
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64360a0d81e42867dc2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64360a0d81e42867dc2e8=
5f5
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643609a8e58663c4d02e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643609a8e58663c4d02e8=
5ee
        failing since 63 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6436055921ada06d4d2e8644

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6436055921ada06d4d2e8649
        failing since 97 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-12T01:11:29.952169  [   22.047826] <LAVA_SIGNAL_ENDRUN 0_dmesg =
423358_1.5.2.4.1>
    2023-04-12T01:11:30.058870  / # [ #
    2023-04-12T01:11:30.161323  export SHELL=3D/bin/sh
    2023-04-12T01:11:30.161914    22.073274] usb 2-1.1: new high-speed USB =
device number 3 using ehci-platform
    2023-04-12T01:11:30.162273  #
    2023-04-12T01:11:30.263815  / # export SHELL=3D/bin/sh. /lava-423358/en=
vironment
    2023-04-12T01:11:30.264531  =

    2023-04-12T01:11:30.264878  / # [   22.329122] usb-storage 2-1.1:1.0: U=
SB Mass Storage device detected
    2023-04-12T01:11:30.265197  [   22.338950] scsi host0: usb-storage 2-1.=
1:1.0
    2023-04-12T01:11:30.265522  . /lava-423358/environment[   22.359044] us=
bcore: registered new interface driver uas =

    ... (23 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/643605a9b53daabed22e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-18=
6-g99455a05abbd/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643605a9b53daabed22e85ec
        failing since 97 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-12T01:13:07.157727  / # #
    2023-04-12T01:13:07.260023  export SHELL=3D/bin/sh
    2023-04-12T01:13:07.260783  [   20.031603] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-04-12T01:13:07.261078  [   20.040509] scsi host0: usb-storage 2-1.=
1:1.0
    2023-04-12T01:13:07.261308  [   20.055543] usbcore: registered new inte=
rface driver uas
    2023-04-12T01:13:07.261516  #
    2023-04-12T01:13:07.363010  / # export SHELL=3D/bin/sh. /lava-423361/en=
vironment
    2023-04-12T01:13:07.363750  =

    2023-04-12T01:13:07.465406  / # . /lava-423361/environment/lava-423361/=
bin/lava-test-runner /lava-423361/1
    2023-04-12T01:13:07.466472   =

    ... (21 line(s) more)  =

 =20
