Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6929A7EBE1D
	for <lists+linux-next@lfdr.de>; Wed, 15 Nov 2023 08:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234630AbjKOHcC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Nov 2023 02:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjKOHcB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Nov 2023 02:32:01 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA2EC1
        for <linux-next@vger.kernel.org>; Tue, 14 Nov 2023 23:31:55 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6cd1918afb2so4143939a34.0
        for <linux-next@vger.kernel.org>; Tue, 14 Nov 2023 23:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700033514; x=1700638314; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B8FkiV2vJ1zekyaJUcw8JIWtAsu397PyeAZINrrTz3Y=;
        b=sNm7tPzXszCfgj+gqreuxqr7rk6zbRwBsW6FqFHomPsWUCHjYZ5JgNzUIg4uAfTQmw
         NWETM9C5obwLLS5KuTB8ksHs7QuFg5dLNFYARCUmbweOaexndC9TRWdSGwV1hSMmFtoR
         2/Fo61GSaOuYuMQfVMMaFgB4pq4FaFLIrkY2z/scwwl/4UwY0yd0FxdGtNDwYBbKBtU/
         aXArC/ndtkqXTY+VAq0eaTPZe79zu2Kc/7r2jBD3qPJ9gktyqz0fdmNM2GHRYjMbLlxx
         LoNneE8h4cmPsIoOgWPdkdCpsIQq5aGXQ9NPQAlL5poQXm/0E3W60adcmFLHXqMYE/TL
         am5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700033514; x=1700638314;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8FkiV2vJ1zekyaJUcw8JIWtAsu397PyeAZINrrTz3Y=;
        b=puHeojR3tdRS3ek2mjGKcAPiCWtjoIIhI3Aib85a1Q4k+tMFuge9XS4GypasTxPWyt
         zwgsqAIiRXp6Myu3TnsNEJEK84m+TVtvyHR3Ppp4blMD45tsx0J3LCWhYGkRmrPdlq4d
         Dmu2LJrIQfIb6CaUZ+W1fMC/xbXjTIfh2RBdO8ysb6rntqTztlq6RY5e/5+9wcCbooJa
         YqrS2OOA/kxaXJwNVGyzzZNY+roEXFmFVACqkOa/n84trVTC8Jy/55byJZzpwj+WOTz1
         VTDgsxgHfxuNBbBxO5XzCRgxhJ/lqTrdGc8Ap0gSioNz/eEwFHvU5WlDqA3Nq0L/DPRo
         JjoA==
X-Gm-Message-State: AOJu0Yy2F1YPfF23hd1u57i2Jp10hzGDDjqdx7HuFdaxYZV4ojvKDzJy
        k6S4MJ8rUR5rJTivQcjCbS0snhW6GVi16wttPenuGw==
X-Google-Smtp-Source: AGHT+IFRR8DwjWc+eEpK/pb0iwIoo57NwVP2bvNVUjJ8WJsLH2OgQqrOGTDOVHrMRiSN8sX0VtWJOg==
X-Received: by 2002:a9d:6553:0:b0:6d6:45f1:d7b4 with SMTP id q19-20020a9d6553000000b006d645f1d7b4mr4686586otl.35.1700033513224;
        Tue, 14 Nov 2023 23:31:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p8-20020a63c148000000b005b3cc663c8csm646825pgi.21.2023.11.14.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:31:52 -0800 (PST)
Message-ID: <655473e8.630a0220.cde45.182b@mx.google.com>
Date:   Tue, 14 Nov 2023 23:31:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20231115
Subject: next/master baseline: 372 runs, 29 regressions (next-20231115)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 372 runs, 29 regressions (next-20231115)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained      | arm   | lab-baylibre    | gcc-10   | sama5_def=
config              | 1          =

at91sam9g20ek              | arm   | lab-broonie     | gcc-10   | at91_dt_d=
efconfig            | 1          =

at91sam9g20ek              | arm   | lab-broonie     | gcc-10   | multi_v5_=
defconfig           | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                  | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                 | arm   | lab-baylibre    | gcc-10   | davinci_a=
ll_defconfig        | 1          =

imx6dl-riotboard           | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6dl-udoo                | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6q-udoo                 | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6ul-14x14-evk           | arm   | lab-nxp         | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
+videodec           | 1          =

imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

odroid-xu3                 | arm   | lab-collabora   | gcc-10   | exynos_de=
fconfig             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

r8a7743-iwg20d-q7          | arm   | lab-cip         | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square        | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231115/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231115
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bc962b35b139dd52319e6fc0f4bab00593bf38c9 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained      | arm   | lab-baylibre    | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/655433489844d110ca7e4a78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655433489844d110ca7e4=
a79
        failing since 287 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
at91sam9g20ek              | arm   | lab-broonie     | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65543b39d9eb4755807e4a75

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65543b39d9eb4755807e4a95
        failing since 162 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-15T03:29:34.194633  /lava-242307/1/../bin/lava-test-case
    2023-11-15T03:29:34.250147  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
at91sam9g20ek              | arm   | lab-broonie     | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6554396d116c7599507e4a8a

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6554396d116c7599507e4aa8
        failing since 162 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-15T03:21:57.197581  /lava-242300/1/../bin/lava-test-case
    2023-11-15T03:21:57.239730  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65543cebba2586282f7e4a93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65543cebba2586282f7e4=
a94
        failing since 162 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655437486d7fd847c47e4a6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655437486d7fd847c47e4=
a70
        failing since 231 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beagle-xm                  | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65543826335a1341bf7e4a7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65543826335a1341bf7e4=
a80
        failing since 228 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
da850-lcdk                 | arm   | lab-baylibre    | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/655437308e50aaa1787e4abb

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/655437308e50aaa=
1787e4abe
        failing since 274 days (last pass: next-20230208, first fail: next-=
20230213)
        32 lines

    2023-11-15T03:12:20.214644  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4c2c800 pointer offset 4 size 512
    2023-11-15T03:12:20.254194  kern  :alert : Register r9 information: 1-p=
age vmalloc region starting at 0xbf2eb000 allocated at load_module+0x6b0/0x=
1954
    2023-11-15T03:12:20.254481  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-11-15T03:12:20.254726  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2eb000 allocated at load_module+0x6b0/0=
x1954
    2023-11-15T03:12:20.257268  kern  :alert : Register r12 information: no=
n-paged memory
    2023-11-15T03:12:20.362345  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-11-15T03:12:20.363003  kern  :emerg : Process udevd (pid: 67, stac=
k limit =3D 0x4328b706)
    2023-11-15T03:12:20.363394  kern  :emerg : Stack: (0xc8909ca8 to 0xc890=
a000)
    2023-11-15T03:12:20.363736  kern  :emerg : 9ca0:                   c4c2=
c800 c078f7d8 00000000 c03c0620 c0d4fe60 250d1d7b
    2023-11-15T03:12:20.364041  kern  :emerg : 9cc0: 0000005d 250d1d7b c078=
f7d8 bf2eb220 00000000 00000000 00000001 bf2eb220 =

    ... (7 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6dl-riotboard           | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/655439030a92f832707e4a87

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655439030a92f832707e4a90
        new failure (last pass: next-20231114)

    2023-11-15T03:20:17.646459  + set[   15.139075] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1008899_1.5.2.3.1>
    2023-11-15T03:20:17.646633   +x
    2023-11-15T03:20:17.752906  / # #
    2023-11-15T03:20:17.854649  export SHELL=3D/bin/sh
    2023-11-15T03:20:17.855131  #
    2023-11-15T03:20:17.956156  / # export SHELL=3D/bin/sh. /lava-1008899/e=
nvironment
    2023-11-15T03:20:17.956628  =

    2023-11-15T03:20:18.057816  / # . /lava-1008899/environment/lava-100889=
9/bin/lava-test-runner /lava-1008899/1
    2023-11-15T03:20:18.058409  =

    2023-11-15T03:20:18.061867  / # /lava-1008899/bin/lava-test-runner /lav=
a-1008899/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6dl-udoo                | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/655437c32e0a14de727e4ab6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655437c32e0a14de727e4=
ab7
        new failure (last pass: next-20231114) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-udoo                 | arm   | lab-broonie     | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65543942ec936928527e4acb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65543942ec936928527e4=
acc
        new failure (last pass: next-20231114) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-14x14-evk           | arm   | lab-nxp         | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/655436f1acd4468e8c7e4a82

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655436f1acd4468e8c7e4a89
        failing since 0 day (last pass: next-20230428, first fail: next-202=
31114)

    2023-11-15T03:11:22.363450  + set +x
    2023-11-15T03:11:22.366622  <8>[   19.278390] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1258572_1.5.2.4.1>
    2023-11-15T03:11:22.478079  / # #
    2023-11-15T03:11:23.634125  export SHELL=3D/bin/sh
    2023-11-15T03:11:23.639798  #
    2023-11-15T03:11:25.181842  / # export SHELL=3D/bin/sh. /lava-1258572/e=
nvironment
    2023-11-15T03:11:25.187512  =

    2023-11-15T03:11:27.999781  / # . /lava-1258572/environment/lava-125857=
2/bin/lava-test-runner /lava-1258572/1
    2023-11-15T03:11:28.005757  =

    2023-11-15T03:11:28.008249  / # /lava-1258572/bin/lava-test-runner /lav=
a-1258572/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6554387544cf6dd9157e4aa9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6554387544cf6dd9157e4=
aaa
        new failure (last pass: next-20231114) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65543b81ef5f407b187e4a6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65543b81ef5f407b187e4=
a6f
        failing since 0 day (last pass: next-20231113, first fail: next-202=
31114) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6554368bb7ac73ac6d7e4e90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6554368bb7ac73ac6d7e4=
e91
        failing since 582 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
odroid-xu3                 | arm   | lab-collabora   | gcc-10   | exynos_de=
fconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6554334b2dbf1223407e4a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6554334b2dbf1223407e4=
a76
        failing since 0 day (last pass: next-20230621, first fail: next-202=
31114) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65543a159edd75547c7e4a9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65543a159edd75547c7e4=
a9f
        failing since 9 days (last pass: next-20231101, first fail: next-20=
231106) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/655439fb4dc070e1627e4a9d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655439fb4dc070e1627e4=
a9e
        failing since 9 days (last pass: next-20231101, first fail: next-20=
231106) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65543a014dc070e1627e4aa3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65543a014dc070e1627e4=
aa4
        new failure (last pass: next-20231110) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65543a0f4dc070e1627e4b0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65543a0f4dc070e1627e4=
b0c
        new failure (last pass: next-20231110) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7          | arm   | lab-cip         | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65543609d5c4cdebfd7e4acb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65543609d5c4cdebfd7e4=
acc
        new failure (last pass: next-20231114) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65543d88e4460ef95f7e4add

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65543d88e4460ef95f7e4ae6
        failing since 105 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-11-15T03:39:39.866288  + set +x
    2023-11-15T03:39:39.869569  <8>[   27.441371] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1038778_1.5.2.4.1>
    2023-11-15T03:39:39.975748  / # #
    2023-11-15T03:39:41.434033  export SHELL=3D/bin/sh
    2023-11-15T03:39:41.454761  #
    2023-11-15T03:39:41.455180  / # export SHELL=3D/bin/sh
    2023-11-15T03:39:43.404153  / # . /lava-1038778/environment
    2023-11-15T03:39:46.989122  /lava-1038778/bin/lava-test-runner /lava-10=
38778/1
    2023-11-15T03:39:47.010403  . /lava-1038778/environment
    2023-11-15T03:39:47.010786  / # /lava-1038778/bin/lava-test-runner /lav=
a-1038778/1 =

    ... (27 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-rock2-square        | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65543733a14b4a44a47e4adb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65543733a14b4a44a47e4=
adc
        failing since 357 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655436335fb582fe8a7e4a80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655436335fb582fe8a7e4=
a81
        failing since 357 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65543716b01cb470807e4b04

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65543716b01cb470807e4b0d
        failing since 166 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-15T03:11:59.432350  / # #
    2023-11-15T03:11:59.534032  export SHELL=3D/bin/sh
    2023-11-15T03:11:59.534639  #
    2023-11-15T03:11:59.636018  / # export SHELL=3D/bin/sh. /lava-3834074/e=
nvironment
    2023-11-15T03:11:59.636396  =

    2023-11-15T03:11:59.737118  / # . /lava-3834074/environment/lava-383407=
4/bin/lava-test-runner /lava-3834074/1
    2023-11-15T03:11:59.738757  =

    2023-11-15T03:11:59.779425  / # /lava-3834074/bin/lava-test-runner /lav=
a-3834074/1
    2023-11-15T03:11:59.870824  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-15T03:11:59.871350  + cd /lava-3834074/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65543978d8845ec6187e4a87

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65543978d8845ec6187e4a90
        failing since 166 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-15T03:21:44.547910  / # #
    2023-11-15T03:21:44.648959  export SHELL=3D/bin/sh
    2023-11-15T03:21:44.649340  #
    2023-11-15T03:21:44.750010  / # export SHELL=3D/bin/sh. /lava-3834177/e=
nvironment
    2023-11-15T03:21:44.750425  =

    2023-11-15T03:21:44.851260  / # . /lava-3834177/environment/lava-383417=
7/bin/lava-test-runner /lava-3834177/1
    2023-11-15T03:21:44.851834  =

    2023-11-15T03:21:44.894972  / # /lava-3834177/bin/lava-test-runner /lav=
a-3834177/1
    2023-11-15T03:21:44.987668  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-15T03:21:44.988096  + cd /lava-3834177/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65543c4b7705ad63b37e4abc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65543c4c7705ad63b37e4ac5
        failing since 166 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-15T03:33:42.816971  / # #
    2023-11-15T03:33:42.918051  export SHELL=3D/bin/sh
    2023-11-15T03:33:42.918497  #
    2023-11-15T03:33:43.019347  / # export SHELL=3D/bin/sh. /lava-3834246/e=
nvironment
    2023-11-15T03:33:43.020155  =

    2023-11-15T03:33:43.121707  / # . /lava-3834246/environment/lava-383424=
6/bin/lava-test-runner /lava-3834246/1
    2023-11-15T03:33:43.123086  =

    2023-11-15T03:33:43.163139  / # /lava-3834246/bin/lava-test-runner /lav=
a-3834246/1
    2023-11-15T03:33:43.253368  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-15T03:33:43.254279  + cd /lava-3834246/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655436fdacd4468e8c7e4abc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655436fdacd4468e8c7e4ac5
        failing since 166 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-15T03:11:37.834188  + set +x[   19.403349] <LAVA_SIGNAL_ENDRUN =
0_dmesg 444035_1.5.2.4.1>
    2023-11-15T03:11:37.834581  =

    2023-11-15T03:11:37.942438  / # #
    2023-11-15T03:11:38.044161  export SHELL=3D/bin/sh
    2023-11-15T03:11:38.044770  #
    2023-11-15T03:11:38.145773  / # export SHELL=3D/bin/sh. /lava-444035/en=
vironment
    2023-11-15T03:11:38.146313  =

    2023-11-15T03:11:38.247346  / # . /lava-444035/environment/lava-444035/=
bin/lava-test-runner /lava-444035/1
    2023-11-15T03:11:38.248201  =

    2023-11-15T03:11:38.251204  / # /lava-444035/bin/lava-test-runner /lava=
-444035/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6554392e3a7dd580027e4ae7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6554392e3a7dd580027e4af0
        failing since 166 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-15T03:20:51.465063  + set +x[   20.684642] <LAVA_SIGNAL_ENDRUN =
0_dmesg 444041_1.5.2.4.1>
    2023-11-15T03:20:51.465375  =

    2023-11-15T03:20:51.573670  / # #
    2023-11-15T03:20:51.675208  export SHELL=3D/bin/sh
    2023-11-15T03:20:51.675756  #
    2023-11-15T03:20:51.776723  / # export SHELL=3D/bin/sh. /lava-444041/en=
vironment
    2023-11-15T03:20:51.777255  =

    2023-11-15T03:20:51.878247  / # . /lava-444041/environment/lava-444041/=
bin/lava-test-runner /lava-444041/1
    2023-11-15T03:20:51.879074  =

    2023-11-15T03:20:51.882005  / # /lava-444041/bin/lava-test-runner /lava=
-444041/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65543b9970bddd17ec7e4a92

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65543b9970bddd17ec7e4a9b
        failing since 166 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-15T03:31:21.924489  + set +x
    2023-11-15T03:31:21.926332  [   22.565292] <LAVA_SIGNAL_ENDRUN 0_dmesg =
444052_1.5.2.4.1>
    2023-11-15T03:31:22.034418  / # #
    2023-11-15T03:31:22.135963  export SHELL=3D/bin/sh
    2023-11-15T03:31:22.136503  #
    2023-11-15T03:31:22.237469  / # export SHELL=3D/bin/sh. /lava-444052/en=
vironment
    2023-11-15T03:31:22.237982  =

    2023-11-15T03:31:22.338970  / # . /lava-444052/environment/lava-444052/=
bin/lava-test-runner /lava-444052/1
    2023-11-15T03:31:22.339797  =

    2023-11-15T03:31:22.342611  / # /lava-444052/bin/lava-test-runner /lava=
-444052/1 =

    ... (12 line(s) more)  =

 =20
