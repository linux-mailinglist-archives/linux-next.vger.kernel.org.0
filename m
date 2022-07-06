Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A12E568819
	for <lists+linux-next@lfdr.de>; Wed,  6 Jul 2022 14:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbiGFMPa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Jul 2022 08:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbiGFMP3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Jul 2022 08:15:29 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57740223
        for <linux-next@vger.kernel.org>; Wed,  6 Jul 2022 05:15:26 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id m14so13500410plg.5
        for <linux-next@vger.kernel.org>; Wed, 06 Jul 2022 05:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=63yjG3l7VdBV56PnufiA/ni8KWr8w/5z0y92WdyCGGU=;
        b=nHEYcP/MoQIOAqOu6UBNSlUGStnYXsJNkrDKApn1XzJ2RiyxyPsXLmlG2lqCZ9bIKK
         sb4kThVYuTTbo6cRGLRLX+sqPbSE6tmj3Q3LUX9a/6Pd+04xzRAkRiB+Gb20A8NBwHjM
         ZSE7KKKV3+Nbr6WOraV3zRzw5k8KVyJp8dHeT21JjcSmcoXanTfvAAjOvJuqSa9fRsxT
         GwV8mTu65AFNUxXKbuEhBqmpbcTmRJwmqBiTdWP3fLDDml+8XnCke7KO1hHiKMVzS4tW
         n1OPvn6E9Awp12jBqMF2Q7gMeNdQCjQfLvrkd1G8y07GucScgspwDYZevo+Ox9m/i9aV
         /Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=63yjG3l7VdBV56PnufiA/ni8KWr8w/5z0y92WdyCGGU=;
        b=4A1/WxePD1rvEhFx1P5cXlJjqCHAJRP3Rkxzx6ToI3gjYu+1YuJ1FY4c2sqVgEuYb+
         lNjogqjs/bUB3+ST5jA1fBJ0KWFxOQHQIQcz6uZwzz+ppsO3x+3gIRCsmYfarla2IKfR
         XBpRdyZnyeVI3CaUZ40bFDxBIK0JHWMK+WmV98+pdDGOwVTyV/HDAkJqKSBUp+yAIHSy
         uZKzFPUZ9ees0FIZSUWriaplxOgN8hBBH96zBFokjeoXK9vn8kX3B9wkxxK3YpNiRvUU
         Euq567P/GgxnRrqE7N4o4bafR5iJZt2HHAUcF3bGzPCj4YtxmvtLmVjvAqCxjgaMlVCb
         dNkQ==
X-Gm-Message-State: AJIora9cCjIU5xyWN2Zb0TqjrOxztnYP9GU69rgdi4hwHyrpkGIda1bX
        8/Md3m0sicol8PGwTIZa3kqChYMCrO4bxz6Q
X-Google-Smtp-Source: AGRyM1tVm18dAFD0fKnjMpa5eq9W7Uj6XA0IvT9McgHJoPoFn5W9frIk8cL3pDHy/n7cl+4lgsVCNA==
X-Received: by 2002:a17:902:f546:b0:16b:e4c7:671b with SMTP id h6-20020a170902f54600b0016be4c7671bmr16260937plf.129.1657109725196;
        Wed, 06 Jul 2022 05:15:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t9-20020a17090a0d0900b001e8520b211bsm16991182pja.53.2022.07.06.05.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 05:15:24 -0700 (PDT)
Message-ID: <62c57cdc.1c69fb81.8ab0e.928f@mx.google.com>
Date:   Wed, 06 Jul 2022 05:15:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc5-345-gd3298a6516a4
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 606 runs,
 34 regressions (v5.19-rc5-345-gd3298a6516a4)
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

next/pending-fixes baseline: 606 runs, 34 regressions (v5.19-rc5-345-gd3298=
a6516a4)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
da850-lcdk                 | arm   | lab-baylibre    | gcc-10   | davinci_a=
ll_defconfig        | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | tegra_def=
config              | 1          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+debug              | 1          =

odroid-xu3                 | arm   | lab-collabora   | gcc-10   | exynos_de=
fconfig             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 2          =

rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 2          =

rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 4          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+ima                | 2          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+crypto             | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc5-345-gd3298a6516a4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc5-345-gd3298a6516a4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d3298a6516a4e08766594bf69471fc6d81542801 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
da850-lcdk                 | arm   | lab-baylibre    | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62c545cb30414c5f38a39bd9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c545cb30414c5=
f38a39be1
        failing since 163 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-07-06T08:20:02.372755  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-07-06T08:20:02.374040  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-07-06T08:20:02.376239  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-07-06T08:20:02.421760  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62c5455d9254df5940a39bf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c5455d9254df5940a39=
bf6
        failing since 36 days (last pass: v5.16-rc4-241-g3e464b455df7, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54765114b33ed09a39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54765114b33ed09a39=
be9
        failing since 36 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54959bc722c0d08a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54959bc722c0d08a39=
bce
        failing since 10 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54b4da9b3745476a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54b4da9b3745476a39=
bdc
        failing since 36 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54d41bda7ecaf17a39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54d41bda7ecaf17a39=
be2
        failing since 36 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54f358e717f410aa39be7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54f358e717f410aa39=
be8
        failing since 36 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c547b088c9215a53a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c547b088c9215a53a39=
bd9
        new failure (last pass: v5.19-rc5-309-g0b54d9586dbf) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62c549c1255bf97461a39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c549c1255bf97461a39=
be4
        failing since 43 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.18-155-gb82692513a38) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54c56b9f3bd3534a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54c56b9f3bd3534a39=
bd9
        new failure (last pass: v5.19-rc5-309-g0b54d9586dbf) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54f749ca728d7f7a39bed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54f749ca728d7f7a39=
bee
        failing since 47 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | tegra_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54de5af1c01fb15a39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54de5af1c01fb15a39=
be1
        failing since 6 days (last pass: v5.19-rc4-255-ge85c7a5a90ae, first=
 fail: v5.19-rc4-310-gae0dd4695f93) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54c3f2bd3bc9057a39be3

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
c54c402bd3bc9057a39bf0
        failing since 36 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-06T08:47:22.420475  /lava-137091/1/../bin/lava-test-case
    2022-07-06T08:47:22.515214  <8>[   42.429230][  T315] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
odroid-xu3                 | arm   | lab-collabora   | gcc-10   | exynos_de=
fconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/62c545d02dce776cdaa39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-=
xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-=
xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c545d02dce776cdaa39=
bd9
        failing since 2 days (last pass: v5.19-rc4-362-g66af410b51f8, first=
 fail: v5.19-rc4-496-g0346159fcae8) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54d191aa9e99987a39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54d191aa9e99987a39=
beb
        failing since 56 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54cfbf4727402c4a39bfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54cfbf4727402c4a39=
bfb
        failing since 56 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54d1c9a6c2fbd7aa39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54d1c9a6c2fbd7aa39=
bdd
        failing since 56 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54d0f1aa9e99987a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54d0f1aa9e99987a39=
bdb
        failing since 56 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62c547c65d490ac64da39c39

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c547c65d490ac=
64da39c40
        failing since 15 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-07-06T08:28:32.944026  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-06T08:28:32.947740  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-06T08:28:32.952946  [   71.187561] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-06T08:28:32.953245  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c547c65d490ac=
64da39c41
        failing since 15 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-06T08:28:32.923039  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-06T08:28:32.923606  kern  :alert : Mem abort info:
    2022-07-06T08:28:32.923888  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-06T08:28:32.924193  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-06T08:28:32.924549  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-06T08:28:32.924709  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-06T08:28:32.925068  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-06T08:28:32.925482  kern  :alert : Data abort info:
    2022-07-06T08:28:32.925642  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-06T08:28:32.925976  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62c549562440784e5aa39c42

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c549562440784=
e5aa39c49
        failing since 15 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-07-06T08:35:14.360430  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-06T08:35:14.363993  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-06T08:35:14.370599  [   71.201322] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-06T08:35:14.370837  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c549562440784=
e5aa39c4a
        failing since 15 days (last pass: v5.18-rc7-216-g98dca003a752b, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-06T08:35:14.336916  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-06T08:35:14.337434  kern  :alert : Mem abort info:
    2022-07-06T08:35:14.337769  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-06T08:35:14.338069  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-06T08:35:14.338389  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-06T08:35:14.338592  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-06T08:35:14.338948  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-06T08:35:14.339302  kern  :alert : Data abort info:
    2022-07-06T08:35:14.339464  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-06T08:35:14.339810  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3328-rock64              | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62c549e25adc4714cda39bed

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c549e25adc471=
4cda39bf4
        failing since 15 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-07-06T08:37:33.613497  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-06T08:37:33.617044  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-06T08:37:33.622510  [   71.200556] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-06T08:37:33.622771  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c549e25adc471=
4cda39bf5
        failing since 15 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-06T08:37:33.592285  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-07-06T08:37:33.592807  kern  :alert : Mem abort info:
    2022-07-06T08:37:33.593040  kern  :alert :   ESR =3D 0x0000000096000006
    2022-07-06T08:37:33.593336  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-07-06T08:37:33.593810  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-07-06T08:37:33.594011  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-07-06T08:37:33.594271  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-07-06T08:37:33.594691  kern  :alert : Data abort info:
    2022-07-06T08:37:33.594891  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-06T08:37:33.595295  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62c54aef4c25fb5fd2a39bdb

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62c54aef4c25fb5fd2a39bfd
        failing since 128 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-07-06T08:42:06.541500  /lava-6760113/1/../bin/lava-test-case
    2022-07-06T08:42:06.552210  <8>[   54.406855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62c54aef4c25fb5fd2a39c20
        failing since 36 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-06T08:42:04.517407  /lava-6760113/1/../bin/lava-test-case
    2022-07-06T08:42:04.528654  <8>[   52.382907] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62c54aef4c25fb5fd2a39c21
        failing since 36 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-06T08:42:03.489925  /lava-6760113/1/../bin/lava-test-case
    2022-07-06T08:42:03.501632  <8>[   51.355073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62c54aef4c25fb5fd2a39c22
        failing since 36 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-06T08:42:01.940684  <4>[   49.793562] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-07-06T08:42:02.462762  /lava-6760113/1/../bin/lava-test-case
    2022-07-06T08:42:02.473637  <8>[   50.327592] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c546cac4922f654ba39c42

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c546cac4922f6=
54ba39c4a
        failing since 15 days (last pass: v5.19-rc2-431-gba1eaf33689d0, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-06T08:24:33.061212  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-06T08:24:33.061766  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-07-06T08:24:33.062121  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079b5d000
    2022-07-06T08:24:33.062454  kern  :alert : [0000000000000005] pgd=3D080=
0000079b60003, p4d=3D0800000079b60003, pud=3D0800000079b61003, pmd=3D000000=
0000000000
    2022-07-06T08:24:33.062779  <8>[   57.706443] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-07-06T08:24:33.063127  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62c54821020e7f5e28a39be4

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c54821020e7f5=
e28a39beb
        failing since 15 days (last pass: v5.19-rc1-331-g13bdc020d5006, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-07-06T08:30:16.639313  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-07-06T08:30:16.639862  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-07-06T08:30:16.640216  <8>[   61.616583] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-07-06T08:30:16.640584  + set +x
    2022-07-06T08:30:16.640910  <8>[   61.618557] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6760050_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c54821020e7f5=
e28a39bec
        failing since 15 days (last pass: v5.19-rc1-331-g13bdc020d5006, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-06T08:30:16.609460  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-06T08:30:16.610007  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-07-06T08:30:16.610362  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000005774000
    2022-07-06T08:30:16.610694  kern  :alert : [0000000000000005] pgd=3D080=
0000005773003, p4d=3D0800000005773003, pud=3D0800000005772003, pmd=3D000000=
0000000000
    2022-07-06T08:30:16.611017  <8>[   61.591074] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54961bc722c0d08a39c18

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c54961bc722c0=
d08a39c20
        failing since 15 days (last pass: v5.19-rc2-431-gba1eaf33689d0, fir=
st fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-07-06T08:35:23.847649  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-07-06T08:35:23.847822  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-07-06T08:35:23.847905  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000798d2000
    2022-07-06T08:35:23.847982  kern  :alert : [0000000000000005] pgd=3D080=
00000798d3003, p4d=3D08000000798d3003, pud=3D0800000079913003, pmd=3D000000=
0000000000
    2022-07-06T08:35:23.848055  <8>[   61.777736] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-07-06T08:35:23.848129  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c547faf2544c387da39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c547faf2544c387da39=
bf5
        new failure (last pass: v5.19-rc5-309-g0b54d9586dbf) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c54d4ae117d2460ca39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc5-3=
45-gd3298a6516a4/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c54d4be117d2460ca39=
bf0
        failing since 20 days (last pass: v5.19-rc1-331-g13bdc020d5006, fir=
st fail: v5.19-rc2-392-gc16436fe44ee8) =

 =20
