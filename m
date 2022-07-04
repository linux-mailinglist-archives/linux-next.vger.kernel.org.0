Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27682564C64
	for <lists+linux-next@lfdr.de>; Mon,  4 Jul 2022 06:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiGDEWb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jul 2022 00:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiGDEWa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Jul 2022 00:22:30 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BC1262B
        for <linux-next@vger.kernel.org>; Sun,  3 Jul 2022 21:22:28 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso2030778pjc.1
        for <linux-next@vger.kernel.org>; Sun, 03 Jul 2022 21:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DA+8dYZ46z4JI4mMme0qXOgqIMA79T/GXBHLWv3zXPs=;
        b=LibJKSdG/IfWP5MiRqBMS8q8dntt10Cab2/WstrDwTyQMQDrd0pnufBZ1wTbZHu/b3
         r69+jCX+rMYVOXAUiHU28+OZSCY4ei15gkXxrdAtTqeTovdUAdXU2MFEdBr0qM9ty4RX
         d13IjFP2SDNHVn0iW9kCU+5YsxvfiO+VFVPcZgDoUVPWeS4ErfMJeu4SC5qF88LWf51y
         260I9LuNjv15NIdB7kt12CYkUltX+nnxjHdleXt9NKE+ZEvMIRF+YLvgd7p+WXeMy8WN
         C/Ai8AYS43mJdcpbvFEF2Ls1zZydpRQOj+OhL1hvQI9w8PlLapvHjJ+R8UvPgdwdw5Ik
         aEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DA+8dYZ46z4JI4mMme0qXOgqIMA79T/GXBHLWv3zXPs=;
        b=x3roFe+44coOKUHhMO9+qQi5UhDb0wcQit75lHG+HcEBPCby/eD3Il3XjaWH+Z8btV
         oD0f3B+ZUTD4Fm2tvxJwzW+1VpLkpQmNCaJTOvj1Qv9RbJy5COHS/qqLo7EobIAXnqnL
         FdVtGx7KHMlllJy//k89iNAyuyNjWC8+65sIYTj9NQM8GhDHNjvF1Hd5KpZrHrRI84Tb
         c66Rz6rnhFkqjRbpxvh18pLhH7XjoWbClBT0D4zFKduobUje00WWCK2W7wASZJOewD3i
         ffdhZRCs0Bk9/2cUSvUJok3MLXpXLXFDoANx6XIDBOWjKZe6OiQxgBXXy6CF2Ssp4nvC
         2+9w==
X-Gm-Message-State: AJIora//nvML4zAcS5ElTLIuwhzG3JGuCA+uFR4Fv5zsryD1TNxfmFel
        OLKn8tYJbpf1Mv+vXybI3MFKQpMhQ3WVbu+m
X-Google-Smtp-Source: AGRyM1t54k2M3zHs58HtPKmPAq2i/jUi6wIVKq/HC0/yHfAcfbMTV+I4VwkmyvZexfLb61ewo1PMDQ==
X-Received: by 2002:a17:902:b087:b0:16b:d6f9:6bc0 with SMTP id p7-20020a170902b08700b0016bd6f96bc0mr9103538plr.34.1656908547111;
        Sun, 03 Jul 2022 21:22:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090301c400b0016a11750b50sm20264111plh.16.2022.07.03.21.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 21:22:26 -0700 (PDT)
Message-ID: <62c26b02.1c69fb81.1ad18.cc1d@mx.google.com>
Date:   Sun, 03 Jul 2022 21:22:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc4-496-g0346159fcae8
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 466 runs,
 25 regressions (v5.19-rc4-496-g0346159fcae8)
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

next/pending-fixes baseline: 466 runs, 25 regressions (v5.19-rc4-496-g03461=
59fcae8)

Regressions Summary
-------------------

platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
da850-lcdk         | arm   | lab-baylibre    | gcc-10   | davinci_all_defco=
nfig        | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | tegra_defconfig  =
            | 1          =

odroid-xu3         | arm   | lab-collabora   | gcc-10   | exynos_defconfig =
            | 1          =

odroid-xu3         | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =

rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig        =
            | 2          =

rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig+ima    =
            | 2          =

rk3399-gru-kevin   | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-c=
hromebook   | 4          =

rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig        =
            | 1          =

rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig+ima    =
            | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc4-496-g0346159fcae8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc4-496-g0346159fcae8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0346159fcae82dd947f903cfb811c5926f498ff0 =



Test Regressions
---------------- =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
da850-lcdk         | arm   | lab-baylibre    | gcc-10   | davinci_all_defco=
nfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62c23142e19b5b0106a39c1a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c23143e19b5b0=
106a39c22
        failing since 161 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-07-04T00:15:52.756417  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-07-04T00:15:52.757381  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-07-04T00:15:52.759839  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-07-04T00:15:52.803781  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2361b6118b434a8a39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2361b6118b434a8a39=
bd2
        failing since 34 days (last pass: v5.16-rc4-241-g3e464b455df7, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2321f96a983d44ca39bf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2321f96a983d44ca39=
bf9
        failing since 8 days (last pass: v5.19-rc3-373-gd317111b3b1ae, firs=
t fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2358f11ce5e23f4a39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2358f11ce5e23f4a39=
bf5
        failing since 34 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c239773241d50f0ba39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c239773241d50f0ba39=
beb
        failing since 34 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62c23a03d84811552ea39c20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c23a03d84811552ea39=
c21
        failing since 34 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62c23c0b09bf0f577ba39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c23c0b09bf0f577ba39=
bd0
        failing since 34 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62c236596118b434a8a39c1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c236596118b434a8a39=
c1b
        failing since 3 days (last pass: v5.19-rc4-221-g426ccb4c911a, first=
 fail: v5.19-rc4-310-gae0dd4695f93) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c236f6369860b1c0a39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c236f6369860b1c0a39=
bf5
        failing since 44 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c23912d239c55577a39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c23912d239c55577a39=
be9
        failing since 65 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfi=
g+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62c23a8d59ae5b8d15a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c23a8d59ae5b8d15a39=
bce
        failing since 41 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.18-155-gb82692513a38) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | tegra_defconfig  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62c23141e19b5b0106a39c17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c23141e19b5b0106a39=
c18
        failing since 3 days (last pass: v5.19-rc4-255-ge85c7a5a90ae, first=
 fail: v5.19-rc4-310-gae0dd4695f93) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
odroid-xu3         | arm   | lab-collabora   | gcc-10   | exynos_defconfig =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62c238b2208335e573a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-=
xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-=
xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c238b2208335e573a39=
bd0
        new failure (last pass: v5.19-rc4-362-g66af410b51f8) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
odroid-xu3         | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2452a32b2e98234a39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2452a32b2e98234a39=
bd2
        new failure (last pass: v5.19-rc4-362-g66af410b51f8) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62c2331e6b29b8429da39bda

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c2331e6b29b84=
29da39be1
        failing since 12 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-07-04T00:23:48.337901  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-04T00:23:48.340793  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-04T00:23:48.346071  [   71.100063] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-04T00:23:48.346369  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c2331e6b29b84=
29da39be2
        failing since 12 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-04T00:23:48.316793  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-04T00:23:48.317397  kern  :alert : Mem abort info:
    2022-07-04T00:23:48.317642  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-04T00:23:48.318084  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-04T00:23:48.318310  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-04T00:23:48.318477  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-04T00:23:48.318864  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-04T00:23:48.319326  kern  :alert : Data abort info:
    2022-07-04T00:23:48.319506  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-04T00:23:48.319725  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3328-rock64      | arm64 | lab-baylibre    | gcc-10   | defconfig+ima    =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62c235b2e124868197a39be9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c235b2e124868=
197a39bf0
        failing since 12 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-07-04T00:34:36.206749  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-04T00:34:36.210301  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-04T00:34:36.216403  [   71.217206] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-04T00:34:36.216713  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c235b2e124868=
197a39bf1
        failing since 12 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-04T00:34:36.183738  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-04T00:34:36.184317  kern  :alert : Mem abort info:
    2022-07-04T00:34:36.184554  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-04T00:34:36.184876  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-04T00:34:36.185206  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-04T00:34:36.185424  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-04T00:34:36.185732  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-04T00:34:36.186154  kern  :alert : Data abort info:
    2022-07-04T00:34:36.186317  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-04T00:34:36.186707  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-gru-kevin   | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-c=
hromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62c232aa37884c1d39a39be0

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62c232aa37884c1d39a39c02
        failing since 125 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-07-04T00:21:52.045733  /lava-6741343/1/../bin/lava-test-case
    2022-07-04T00:21:52.056620  <8>[   54.873480] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62c232aa37884c1d39a39c25
        failing since 34 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-04T00:21:49.837150  /lava-6741343/1/../bin/lava-test-case
    2022-07-04T00:21:49.848848  <8>[   52.664837] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62c232aa37884c1d39a39c26
        failing since 34 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-04T00:21:48.794814  /lava-6741343/1/../bin/lava-test-case
    2022-07-04T00:21:48.806694  <8>[   51.622686] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62c232aa37884c1d39a39c27
        failing since 34 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-04T00:21:46.986272  <4>[   49.802336] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-07-04T00:21:47.750946  /lava-6741343/1/../bin/lava-test-case
    2022-07-04T00:21:47.763014  <8>[   50.579354] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62c23336f6544f6e33a39c0f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c23336f6544f6=
e33a39c17
        failing since 12 days (last pass: v5.19-rc2-431-gba1eaf33689d0, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-04T00:24:08.759086  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-04T00:24:08.759172  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-07-04T00:24:08.759243  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007997a000
    2022-07-04T00:24:08.759309  kern  :alert : [0000000000000005] pgd=3D080=
000007997b003, p4d=3D080000007997b003, pud=3D080000007997c003, pmd=3D000000=
0000000000
    2022-07-04T00:24:08.759372  <8>[   61.470047] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-07-04T00:24:08.759433  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-rock-pi-4b  | arm64 | lab-collabora   | gcc-10   | defconfig+ima    =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62c2338f9aa0327e6da39bd3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-4=
96-g0346159fcae8/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c2338f9aa0327=
e6da39bda
        failing since 12 days (last pass: v5.19-rc1-331-g13bdc020d5006, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-07-04T00:25:31.244574  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-04T00:25:31.244741  <8>[   61.787508] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-04T00:25:31.244819  + set +x
    2022-07-04T00:25:31.244890  <8>[   61.789609] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6741457_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c2338f9aa0327=
e6da39bdb
        failing since 12 days (last pass: v5.19-rc1-331-g13bdc020d5006, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-04T00:25:31.200595  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-04T00:25:31.200685  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-07-04T00:25:31.200801  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000000581a000
    2022-07-04T00:25:31.200882  kern  :alert : [0000000000000005] pgd=3D080=
0000079877003, p4d=3D0800000079877003, pud=3D080000007987a003, pmd=3D000000=
0000000000
    2022-07-04T00:25:31.200976  <8>[   61.767050] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-07-04T00:25:31.201069  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =20
