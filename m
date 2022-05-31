Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25129538A4F
	for <lists+linux-next@lfdr.de>; Tue, 31 May 2022 06:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238235AbiEaEBM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 May 2022 00:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbiEaEBL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 May 2022 00:01:11 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A64D939B3
        for <linux-next@vger.kernel.org>; Mon, 30 May 2022 21:01:02 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id m14-20020a17090a414e00b001df77d29587so1245894pjg.2
        for <linux-next@vger.kernel.org>; Mon, 30 May 2022 21:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=snF6mU9BeuM1+YEwoHoYiD4ck9pzkccxxDQ7F0Dza5o=;
        b=RixJwFawQ/c0WyNNNDVZri8VAp1PSTmLN1mFyYBgBQYa2eSco3HEmDourcO5GOznwz
         cKgBQ5SKO/oqiANrouBIpSV1+eNqdpHb/KkqSVxbVNZMCV1YAstmA3+uKERpm+jj20fz
         UB/1q15fRW4zwH2qClTkaezvTihIqOtveQsW7TilAoz90yD5Ov3o/H4hQUy79GBY6hRb
         f/KgEcnF33CemxL1gJzOeuGajY3XqBm6QRZ5vyqgT/JplqerIv+5h9PvlU5b7THOyn0e
         5+MV5Uvtg+XFBpIvmz8dL0Mm/hRIoTynvieiQkONNQHPcRhDAYlXseRk7/dXVAR8BF7d
         0Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=snF6mU9BeuM1+YEwoHoYiD4ck9pzkccxxDQ7F0Dza5o=;
        b=BvHow7GgVEVhncFvEyo0PPxQQh+8XHM8uQFY6rCbXwJxTbE4RP1mAfgcDMyv6X+vL3
         GZ7qGUfpFMgp/ZIelZMIwitkGLTGksCFKtxg9pFQDzArfTaxMm2CBhLm4DutY1Oa0KYC
         5pQoHkJ3gUdEkJiqRIpPRUzqknW+Fgncj3lwy6MkHOFpkwYUzJrZkHISz9K/ZlbwrTFE
         3uOG0eBEi/majBzr6WaDVo5pkVy5eUuRiLW955r6CymEwtBtGRKQNIC1KIXQQg1/k7k4
         2EDb+sx2rLqmpqemWIMp/WfQY0jCE1aJbrgqaqOpEH0Iuzz3rEWADHYQ52q3+M2Pabcu
         ybYQ==
X-Gm-Message-State: AOAM531WTdQWfDCk4GczKg/r4Cwj7AXRKZJisr5WUC+0vvl770UsPAM5
        xH5zJtjKQ1onrFqRJFJ5PohvUkYlL/U7DRrsWBA=
X-Google-Smtp-Source: ABdhPJwDEJtM67EyCoY41/ux0hRYhghqtDGh5+qwWLpxYPycKnNDJj/s3wQEMt/9uH7w4p2uA1KrxQ==
X-Received: by 2002:a17:902:da8a:b0:162:50ea:5cb6 with SMTP id j10-20020a170902da8a00b0016250ea5cb6mr32819770plx.77.1653969660907;
        Mon, 30 May 2022 21:01:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a23-20020aa780d7000000b005184af1d72fsm9869591pfn.15.2022.05.30.21.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 21:01:00 -0700 (PDT)
Message-ID: <629592fc.1c69fb81.811df.71a1@mx.google.com>
Date:   Mon, 30 May 2022 21:01:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-11575-gceccc06b624ed
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 584 runs,
 47 regressions (v5.18-11575-gceccc06b624ed)
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

next/pending-fixes baseline: 584 runs, 47 regressions (v5.18-11575-gceccc06=
b624ed)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-11575-gceccc06b624ed/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-11575-gceccc06b624ed
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ceccc06b624edcb4c1ddb2427d482d9c1eb6fd5f =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62955b984ffc0bea3ba39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955b984ffc0bea3ba39=
be1
        failing since 3 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-9954-g9e21d180a100) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62955c43a7060174e6a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-at9=
1-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-at9=
1-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955c43a7060174e6a39=
bdc
        new failure (last pass: v5.18-1222-g391cf5a1244f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62955ca7f084ef3140a39c14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955ca7f084ef3140a39=
c15
        failing since 4 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62955aaea83a1377b1a39c1b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62955aaea83a137=
7b1a39c23
        failing since 127 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-31T00:00:13.684266  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-05-31T00:00:13.792919  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-31T00:00:13.793239  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-31T00:00:13.796048  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62955a43dd14c2fda2a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955a43dd14c2fda2a39=
bdc
        new failure (last pass: v5.16-rc4-241-g3e464b455df7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62955c37e19f07f721a39be9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955c37e19f07f721a39=
bea
        new failure (last pass: v5.16-rc4-356-ga119cd39dcbf) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62955e2b66b09d0fa7a39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955e2b66b09d0fa7a39=
bd7
        new failure (last pass: v5.16-rc4-356-ga119cd39dcbf) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62956187bfc1db6c67a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62956187bfc1db6c67a39=
bd0
        new failure (last pass: v5.16-rc4-356-ga119cd39dcbf) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6295637b68516a2242a39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6295637b68516a2242a39=
bd2
        new failure (last pass: v5.16-rc4-241-g3e464b455df7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62956408e5489f152ba39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62956408e5489f152ba39=
bda
        new failure (last pass: v5.16-rc4-356-ga119cd39dcbf) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62955bc7d5bd2403e3a39bdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955bc7d5bd2403e3a39=
bde
        new failure (last pass: v5.18-1222-g391cf5a1244f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62955c9b0a6373c5b2a39c01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955c9b0a6373c5b2a39=
c02
        failing since 10 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62956187e688d63bdba39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62956187e688d63bdba39=
bdb
        failing since 10 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629564abe80a4339b9a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629564abe80a4339b9a39=
bd0
        failing since 10 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629567f3f75a688190a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629567f3f75a688190a39=
bd3
        failing since 7 days (last pass: v5.18-rc7-251-g195d7f7a62c6, first=
 fail: v5.18-155-gb82692513a38) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6295599676f1eb6452a39c61

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
95599676f1eb6452a39c6a
        new failure (last pass: v5.18-5613-ge079cf8f6817)

    2022-05-30T23:55:38.176900  /lava-122628/1/../bin/lava-test-case
    2022-05-30T23:55:38.256819  <8>[   41.368192][  T314] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62955a71cbd5bb0772a39bda

  Results:     93 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
955a71cbd5bb0772a39be3
        new failure (last pass: v5.18-5613-ge079cf8f6817)

    2022-05-30T23:59:36.305914  /lava-122633/1/../bin/lava-test-case
    2022-05-30T23:59:36.350400  <8>[   15.768773] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-05-30T23:59:36.350796  /lava-122633/1/../bin/lava-test-case
    2022-05-30T23:59:36.351030  <8>[   15.782134] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-05-30T23:59:36.351257  /lava-122633/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62955e6eb3d32004a1a39bf7

  Results:     93 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
955e6eb3d32004a1a39c00
        new failure (last pass: v5.18-5613-ge079cf8f6817)

    2022-05-31T00:16:36.124643  /lava-122648/1/../bin/lava-test-case
    2022-05-31T00:16:36.169300  <8>[   15.192611] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-05-31T00:16:36.169666  /lava-122648/1/../bin/lava-test-case
    2022-05-31T00:16:36.169863  <8>[   15.206062] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-05-31T00:16:36.170026  /lava-122648/1/../bin/lava-test-case
    2022-05-31T00:16:36.170169  <8>[   15.218686] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-05-31T00:16:36.170311  /lava-122648/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62955f8300fd19edf9a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955f8300fd19edf9a39=
bce
        failing since 21 days (last pass: v5.18-rc5-278-ge8576d28ffc9, firs=
t fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62955e0d326fe0d95ca39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955e0d326fe0d95ca39=
beb
        failing since 21 days (last pass: v5.18-rc5-278-ge8576d28ffc9, firs=
t fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629559889df8b4fd50a39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629559889df8b4fd50a39=
bd7
        failing since 19 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6295595732101e2cd7a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6295595732101e2cd7a39=
bd0
        failing since 19 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6295598976f1eb6452a39c1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6295598976f1eb6452a39=
c1c
        failing since 19 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6295596b32101e2cd7a39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6295596b32101e2cd7a39=
be2
        failing since 19 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62955d10db19223009a39be1

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62955d10db19223009a39c03
        failing since 91 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-05-31T00:10:48.355870  <8>[   52.871932] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-31T00:10:49.361246  /lava-6506193/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62955d10db19223009a39c26
        new failure (last pass: v5.18-5613-ge079cf8f6817)

    2022-05-31T00:10:46.721096  <8>[   51.234760] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-05-31T00:10:47.724069  /lava-6506193/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62955d10db19223009a39c27
        new failure (last pass: v5.18-5613-ge079cf8f6817)

    2022-05-31T00:10:45.701277  <8>[   50.216908] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-05-31T00:10:46.704775  /lava-6506193/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62955d10db19223009a39c28
        new failure (last pass: v5.18-5613-ge079cf8f6817)

    2022-05-31T00:10:44.668772  <8>[   49.184702] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-05-31T00:10:44.901594  <4>[   49.415119] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-05-31T00:10:45.687144  /lava-6506193/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62955b8ded8bda1f40a39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955b8ded8bda1f40a39=
be5
        new failure (last pass: v5.18-rc6-269-g2619e2a210cc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62955b884ffc0bea3ba39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h5=
-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h5=
-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955b884ffc0bea3ba39=
bce
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62955bee339c37d975a39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955bee339c37d975a39=
bf0
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62955f7272eb1ee4c1a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955f7272eb1ee4c1a39=
bdc
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62955a2b9a44318124a39be2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955a2b9a44318124a39=
be3
        failing since 4 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62955bdfd5bd2403e3a39c38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6=
-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6=
-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955bdfd5bd2403e3a39=
c39
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62955f65fedb80dd3fa39bf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955f65fedb80dd3fa39=
bf6
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62955beb339c37d975a39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955beb339c37d975a39=
bd8
        failing since 3 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-9954-g9e21d180a100) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62955de014d9dcf0a2a39bf6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955de014d9dcf0a2a39=
bf7
        new failure (last pass: v5.18-1222-g391cf5a1244f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62955fd4f28e1b0656a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955fd4f28e1b0656a39=
bd0
        failing since 3 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-9954-g9e21d180a100) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62955d9084da288831a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955d9084da288831a39=
bdc
        new failure (last pass: v5.18-9954-g9e21d180a100) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62955e339b7537906ca39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h=
2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h=
2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955e339b7537906ca39=
bdc
        new failure (last pass: v5.18-rc6-217-gd854612e01df) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62956190bfc1db6c67a39be6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62956190bfc1db6c67a39=
be7
        new failure (last pass: v5.18-1222-g391cf5a1244f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62955d31450f7e196ca39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h=
3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h=
3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955d31450f7e196ca39=
bf0
        new failure (last pass: v5.18-1222-g391cf5a1244f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62955e84c1c389357da39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62955e84c1c389357da39=
bdc
        new failure (last pass: v5.18-1222-g391cf5a1244f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6295618cbfc1db6c67a39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6295618cbfc1db6c67a39=
be4
        failing since 4 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629564998d155bded3a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40=
-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40=
-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629564998d155bded3a39=
bd3
        new failure (last pass: v5.18-9954-g9e21d180a100) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629566a1d4d73e5178a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629566a1d4d73e5178a39=
bd0
        failing since 3 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-9954-g9e21d180a100) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62956881661c8cd06aa39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-11575=
-gceccc06b624ed/arm/multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armeb/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62956881661c8cd06aa39=
bdc
        failing since 4 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-5613-ge079cf8f6817) =

 =20
