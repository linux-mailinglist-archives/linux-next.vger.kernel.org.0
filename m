Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCFD853B263
	for <lists+linux-next@lfdr.de>; Thu,  2 Jun 2022 06:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiFBEDH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jun 2022 00:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiFBEDG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jun 2022 00:03:06 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30A12A46C8
        for <linux-next@vger.kernel.org>; Wed,  1 Jun 2022 21:03:03 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n13-20020a17090a394d00b001e30a60f82dso8188602pjf.5
        for <linux-next@vger.kernel.org>; Wed, 01 Jun 2022 21:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=z/Jpv2JW10tjBGiO8mIwmmxmEjPcDvzZE76inLmv8xo=;
        b=5rVaYfpPeTP+PwzuyE2ZdZc/vYl9Hj3dttQRvDeKJo9hVldUtKuCWmZbXV8ho6Y897
         gD2PFq71DLbXvsNDeGwWY3S9MI1MAY5Uvb1w2NM3ADylWUt/lYBaanhNe7oeW0WI15JD
         11SAOwwgxtMr/nbMR3RcXMlUph8z+l06zdCjVhja2XR+5BFW/0FCHiBEjLx26udC5FQC
         7L4OUum8qH7EB1vWs+RD0CXUm+UIBWP4M5jftwP3eA1CRpkyKzvbl5KhQMa4vvLh6mYd
         QSkFQmFCFLuDHprdH7NFvJvDntcR7ej1ubXZ8HVlFdaTgDvpe8bWTwjl7H1CKNBaUOu5
         qwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=z/Jpv2JW10tjBGiO8mIwmmxmEjPcDvzZE76inLmv8xo=;
        b=KmLcfFmROxPUhUaQ3COahtZFCQifq+3UviNmEm35DGne+lX8OgrhA8o86ZB1mA9HAT
         G4kHMIXlmBupkyyPf23YpuXDyhaq0YHRK02f7HPpq9MPa5MZMSvRO4ze1hcGYt2AHk/I
         3ba0psazmlo2vIHV87Bq+W7GlPBOxgtAmQ/bVErPDg1BZ4kdTfoNeGry0nd5s65YuzYT
         qanJdumYsxbOsVvXOB6ticfKfDUB6glOz/89xvQux7HHfgYwBy1T4Mq0hTfOknHHhRrv
         HynpSRHrvTw0PrSDqmYq82dFyOCPFhlnGYmSNvA2kRV5gIyukWRPyKATc2OZCQ4EK87u
         PXeg==
X-Gm-Message-State: AOAM532CWozKGV7RcUpC3Weo1g/xt5kpu2TuWcavJKF3bUVjumj8PvkQ
        5ikcreq7lWWHDr1Eq8+wz8OtNCBVw/4rLl8t
X-Google-Smtp-Source: ABdhPJxbTExF6OAvnexTDEdkPABl4LUCiDryAC4oCRFm/4TdmoVSc90Kg9cHEU/cLhWbJcCooAXacw==
X-Received: by 2002:a17:90b:4acb:b0:1df:af66:1d2 with SMTP id mh11-20020a17090b4acb00b001dfaf6601d2mr37740165pjb.181.1654142582812;
        Wed, 01 Jun 2022 21:03:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t19-20020a63dd13000000b003c14af50617sm2131183pgg.47.2022.06.01.21.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 21:03:02 -0700 (PDT)
Message-ID: <62983676.1c69fb81.95e28.5dd6@mx.google.com>
Date:   Wed, 01 Jun 2022 21:03:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-12139-gb5db4eaa8649
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 326 runs,
 21 regressions (v5.18-12139-gb5db4eaa8649)
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

next/pending-fixes baseline: 326 runs, 21 regressions (v5.18-12139-gb5db4ea=
a8649)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-12139-gb5db4eaa8649/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-12139-gb5db4eaa8649
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b5db4eaa8649fb84a4129cd4798589246f324012 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6297ffe1b3d0ee7a86a39c1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6297ffe1b3d0ee7=
a86a39c24
        failing since 129 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-06-02T00:09:41.088902  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-06-02T00:09:41.089196  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-06-02T00:09:41.091788  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-06-02T00:09:41.135893  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/629830545903a243e4a39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629830545903a243e4a39=
bd4
        failing since 2 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629832713a83251f88a39bd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629832713a83251f88a39=
bd6
        failing since 2 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6298182bf9019ba583a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6298182bf9019ba583a39=
bd3
        failing since 33 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62981b88ee46d45710a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62981b88ee46d45710a39=
bce
        failing since 12 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6298020e18276bf14ca39bfc

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
98020e18276bf14ca39c05
        failing since 2 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed)

    2022-06-02T00:19:02.866036  /lava-123501/1/../bin/lava-test-case
    2022-06-02T00:19:02.910424  <8>[   16.893298] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-06-02T00:19:02.910728  /lava-123501/1/../bin/lava-test-case
    2022-06-02T00:19:02.910875  <8>[   16.905976] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-06-02T00:19:02.911018  /lava-123501/1/../bin/lava-test-case
    2022-06-02T00:19:02.911155  <8>[   16.918494] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-06-02T00:19:02.911292  /lava-123501/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6297fd8d340a9b1d63a39c04

  Results:     50 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/629=
7fd8d340a9b1d63a39c1a
        new failure (last pass: v5.18-11575-gceccc06b624ed)

    2022-06-01T23:59:57.933173  /lava-123486/1/../bin/lava-test-case
    2022-06-01T23:59:57.934448  <8>[   20.610938] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-06-01T23:59:57.934926  /lava-123486/1/../bin/lava-test-case
    2022-06-01T23:59:57.935390  <8>[   20.626454] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-06-01T23:59:57.935802  /lava-123486/1/../bin/lava-test-case
    2022-06-01T23:59:57.936658  <8>[   20.643548] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-06-01T23:59:57.937170  /lava-123486/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629813113201c73fb2a39bee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629813113201c73fb2a39=
bef
        new failure (last pass: v5.18-11819-gfcd5217077654) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6297feda7ec78ef7a4a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-ba=
nanapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-ba=
nanapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6297feda7ec78ef7a4a39=
bdb
        failing since 6 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6298020fd79caca605a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6298020fd79caca605a39=
bdd
        failing since 6 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/629803757a1fb48b69a39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629803757a1fb48b69a39=
bd4
        failing since 7 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62980323aea0a8f6b9a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62980323aea0a8f6b9a39=
bce
        new failure (last pass: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/629800c05d17e85121a39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629800c05d17e85121a39=
be5
        failing since 2 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6298033f91a54ce71ca39c04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h5-nanopi-=
neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h5-nanopi-=
neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6298033f91a54ce71ca39=
c05
        new failure (last pass: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/629800be5d17e85121a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629800be5d17e85121a39=
bdf
        new failure (last pass: v5.18-11819-gfcd5217077654) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6297feb2260b893c9ca39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-pl=
us-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-pl=
us-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6297feb2260b893c9ca39=
bdc
        new failure (last pass: v5.18-11819-gfcd5217077654) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6298058f529fb10219a39c06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6298058f529fb10219a39=
c07
        new failure (last pass: v5.18-11819-gfcd5217077654) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62980a6950f26f7036a39bec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ban=
anapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ban=
anapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62980a6950f26f7036a39=
bed
        failing since 0 day (last pass: v5.18-9954-g9e21d180a100, first fai=
l: v5.18-11819-gfcd5217077654) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6298068b4535c78fdba39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6298068b4535c78fdba39=
bdf
        failing since 9 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-155-gb82692513a38) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6298095012fad9eab6a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6298095012fad9eab6a39=
bd0
        failing since 7 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-1222-g391cf5a1244f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6298075400aa762b62a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-n=
yan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-12139=
-gb5db4eaa8649/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-n=
yan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6298075400aa762b62a39=
bd9
        new failure (last pass: v5.18-11819-gfcd5217077654) =

 =20
