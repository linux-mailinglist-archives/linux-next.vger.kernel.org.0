Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9480D7F11FC
	for <lists+linux-next@lfdr.de>; Mon, 20 Nov 2023 12:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbjKTLa3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Nov 2023 06:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbjKTLa2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Nov 2023 06:30:28 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A111B9D
        for <linux-next@vger.kernel.org>; Mon, 20 Nov 2023 03:30:21 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cf63ca9b1bso3868675ad.3
        for <linux-next@vger.kernel.org>; Mon, 20 Nov 2023 03:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700479820; x=1701084620; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zdgaTFIIJRqwUWASMBTxrzVddhtDRx9JCQc/tUBwDDQ=;
        b=GrAVscoYaj7tCB5aFoUv5oeRNGjt+jHFlMg2Rt0xzSX9gFQ9HEJ3g+SvVs4ugoMoyn
         3SiyihBPzcBN6UdPiJSNj3Y+Px54AM9QeX8Uj5G5OILzRtmq6vS9fSaqs6zekVcuPpwq
         IFVV11YKgbWIlwqLAPYPSekcBQJ0SWSKHgw7dvoV8qWWPJtKfqJfPMxk3gXF9wKjbQyp
         VxEn9zGW5WnqEEqgZSKClIVC9YyTKJqUUJHJvxCIbbjq3oFjBQyWPGb4tm6eSOZ+hL6m
         JdAOwTWAtosdKhKheD1tDqhSQSpXqFPiIkJAArkagBHoub5shvUFFs5WmoGZ3tog6zoq
         Vczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479820; x=1701084620;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdgaTFIIJRqwUWASMBTxrzVddhtDRx9JCQc/tUBwDDQ=;
        b=Q9u+EDUik6h/jQCdqZa4PHccEjie8Qn6cyDs4rXXONI8/k59wb+h/cvoD79N1tQnP1
         Y2k5e7vHiL4EGHp6lXurnho1/EA65iufmcpHrmxZ46kKDOZX8f1kaRAKVBWqEYsMPSJc
         5wXkiArxJvEm7HV9c4Oig+wGdt33dW6+ONbgwQA3CbwtK/hWUxTYuQ7zGQd4Qr0Hq/hP
         ZmDMMCotXAI+uyBQ4NDaY5/pS7h93cI+D8BtM5XAVLKGQvTrY/JaACXXVawm8RKQ38Q0
         cPWkYPiDODqoc+LZX9DCz19ahIW+C5HQTUX2+7veJJqAvFrGRjlF3DkoM4SaEdeEcC1d
         y2JA==
X-Gm-Message-State: AOJu0YwsPfAsDel2x9ttK0yJutRvQgfNcVHILWpGfCM8r23G5zWrAZvi
        Oz875KR8ZCpdNmD8Ge5z3nUhAmXmLLNZNyHDuXU=
X-Google-Smtp-Source: AGHT+IGG7EGJ9SO0wR+d1DC//mfvhPADrmvPtka4gK+hExAW5OEi4BAxw6d/uk9HPvBSTAkZC14Buw==
X-Received: by 2002:a17:902:9683:b0:1cc:345b:c7f5 with SMTP id n3-20020a170902968300b001cc345bc7f5mr5585878plp.23.1700479820114;
        Mon, 20 Nov 2023 03:30:20 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b001c9c8d761a3sm5857439plh.131.2023.11.20.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:30:19 -0800 (PST)
Message-ID: <655b434b.170a0220.36f21.e625@mx.google.com>
Date:   Mon, 20 Nov 2023 03:30:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20231120
Subject: next/master baseline: 488 runs, 28 regressions (next-20231120)
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

next/master baseline: 488 runs, 28 regressions (next-20231120)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =

at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | at91_dt_def=
config            | 1          =

at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | multi_v5_de=
fconfig           | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre    | gcc-10   | omap2plus_d=
efconfig          | 1          =

beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig           | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp         | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
                  | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+k=
selftest          | 1          =

k3-j721e-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+k=
selftest          | 1          =

odroid-xu3               | arm   | lab-collabora   | gcc-10   | exynos_defc=
onfig             | 1          =

odroid-xu3               | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

qemu_mips-malta          | mips  | lab-collabora   | gcc-10   | malta_defco=
nfig              | 1          =

r8a7743-iwg20d-q7        | arm   | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-pine-h64       | arm64 | lab-clabbe      | gcc-10   | defconfig+k=
selftest          | 1          =

sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig+k=
selftest          | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231120/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231120
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5a82d69d48c82e89aef44483d2a129f869f3506a =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/655b03861fd46e64817e4a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b03861fd46e64817e4=
a76
        failing since 292 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | at91_dt_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/655b044b9ed0fd44ee7e4ac7

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/655b044b9ed0fd44ee7e4ae7
        failing since 168 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-20T07:01:05.010430  /lava-254767/1/../bin/lava-test-case
    2023-11-20T07:01:05.052982  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | multi_v5_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/655b02f7efe8a27f2d7e4a94

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/655b02f7efe8a27f2d7e4ab2
        failing since 168 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-20T06:55:26.177348  /lava-254753/1/../bin/lava-test-case
    2023-11-20T06:55:26.219302  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/655b07e74b07f4d49e7e4aff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b07e74b07f4d49e7e4=
b00
        failing since 168 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0873caf40286a57e4ae8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b0873caf40286a57e4=
ae9
        failing since 236 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beagle-xm                | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0859d8e531a1807e4b08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b085ad8e531a1807e4=
b09
        failing since 234 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beagle-xm                | arm   | lab-baylibre    | gcc-10   | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0565fae18c64bc7e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b0565fae18c64bc7e4=
a6e
        new failure (last pass: next-20231117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/655b1aa1550609ee617e4a6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b1aa1550609ee617e4=
a70
        new failure (last pass: next-20231117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp         | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0dedda2a768ff67e4a8a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655b0dedda2a768ff67e4a91
        failing since 6 days (last pass: next-20230428, first fail: next-20=
231114)

    2023-11-20T07:42:14.694257  + set +x
    2023-11-20T07:42:14.697403  <8>[   19.691666] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1259408_1.5.2.4.1>
    2023-11-20T07:42:14.806252  / # #
    2023-11-20T07:42:15.961869  export SHELL=3D/bin/sh
    2023-11-20T07:42:15.967688  #
    2023-11-20T07:42:17.510144  / # export SHELL=3D/bin/sh. /lava-1259408/e=
nvironment
    2023-11-20T07:42:17.515804  =

    2023-11-20T07:42:20.327878  / # . /lava-1259408/environment/lava-125940=
8/bin/lava-test-runner /lava-1259408/1
    2023-11-20T07:42:20.333838  =

    2023-11-20T07:42:20.334081  / # /lava-1259408/bin/lava-test-runner /lav=
a-1259408/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0b8aa0ccb833267e4aa3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b0b8aa0ccb833267e4=
aa4
        new failure (last pass: next-20231117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655b03aea3c48f75697e4a7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b03aea3c48f75697e4=
a80
        failing since 587 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0bfe32d2110dd77e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b0bfe32d2110dd77e4=
a6e
        failing since 10 days (last pass: next-20231103, first fail: next-2=
0231110) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-j721e-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0c711117dc1e267e4aa1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b0c711117dc1e267e4=
aa2
        failing since 17 days (last pass: next-20231025, first fail: next-2=
0231103) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
odroid-xu3               | arm   | lab-collabora   | gcc-10   | exynos_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/655b089b2f0b5f281d7e4a7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b089b2f0b5f281d7e4=
a7c
        failing since 6 days (last pass: next-20230621, first fail: next-20=
231114) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
odroid-xu3               | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655b04c6b1a67a11c27e4a8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b04c6b1a67a11c27e4=
a8b
        new failure (last pass: next-20231117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_mips-malta          | mips  | lab-collabora   | gcc-10   | malta_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/655b02dcefe8a27f2d7e4a72

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/655b02dcefe8a27=
f2d7e4a76
        new failure (last pass: next-20231117)
        1 lines

    2023-11-20T06:55:04.633493  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 5377e100, epc =3D=3D 802057bc, ra =3D=
=3D 802080c4
    2023-11-20T06:55:04.633712  =


    2023-11-20T06:55:04.684872  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-11-20T06:55:04.685048  =

   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7        | arm   | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/655b08961d84cc26db7e4aac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b08961d84cc26db7e4=
aad
        failing since 3 days (last pass: next-20231116, first fail: next-20=
231117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0a3e8dc191336d7e4a98

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655b0a3e8dc191336d7e4aa1
        failing since 111 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-11-20T07:26:35.392523  + set +x
    2023-11-20T07:26:35.395685  <8>[   28.101941] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1041702_1.5.2.4.1>
    2023-11-20T07:26:35.500880  / # #
    2023-11-20T07:26:36.956004  export SHELL=3D/bin/sh
    2023-11-20T07:26:36.976507  #
    2023-11-20T07:26:36.976690  / # export SHELL=3D/bin/sh
    2023-11-20T07:26:38.923044  / # . /lava-1041702/environment
    2023-11-20T07:26:42.504316  /lava-1041702/bin/lava-test-runner /lava-10=
41702/1
    2023-11-20T07:26:42.525017  . /lava-1041702/environment
    2023-11-20T07:26:42.525262  / # /lava-1041702/bin/lava-test-runner /lav=
a-1041702/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655b04b2b1a67a11c27e4a7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b04b2b1a67a11c27e4=
a7c
        failing since 362 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655b03aea3c48f75697e4a7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b03aea3c48f75697e4=
a7d
        failing since 362 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64       | arm64 | lab-clabbe      | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/655b094a7b9559c33f7e4a80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b094a7b9559c33f7e4=
a81
        failing since 283 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/655b08ec01b1bd88b47e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655b08ec01b1bd88b47e4=
a6e
        failing since 283 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655b07897226ea45da7e4b21

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655b07897226ea45da7e4b2a
        failing since 166 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-11-20T07:14:31.703360  <8>[   14.144883] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3840552_1.5.2.4.1>
    2023-11-20T07:14:31.807707  / # #
    2023-11-20T07:14:31.909254  export SHELL=3D/bin/sh
    2023-11-20T07:14:31.909774  #
    2023-11-20T07:14:32.010653  / # export SHELL=3D/bin/sh. /lava-3840552/e=
nvironment
    2023-11-20T07:14:32.011094  =

    2023-11-20T07:14:32.111902  / # . /lava-3840552/environment/lava-384055=
2/bin/lava-test-runner /lava-3840552/1
    2023-11-20T07:14:32.112520  =

    2023-11-20T07:14:32.154994  / # /lava-3840552/bin/lava-test-runner /lav=
a-3840552/1
    2023-11-20T07:14:32.241674  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0a84cbe82d319b7e4a89

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655b0a84cbe82d319b7e4a92
        failing since 172 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-20T07:27:39.720092  / # #
    2023-11-20T07:27:39.821093  export SHELL=3D/bin/sh
    2023-11-20T07:27:39.821886  #
    2023-11-20T07:27:39.923352  / # export SHELL=3D/bin/sh. /lava-3840703/e=
nvironment
    2023-11-20T07:27:39.924360  =

    2023-11-20T07:27:40.026020  / # . /lava-3840703/environment/lava-384070=
3/bin/lava-test-runner /lava-3840703/1
    2023-11-20T07:27:40.027011  =

    2023-11-20T07:27:40.045445  / # /lava-3840703/bin/lava-test-runner /lav=
a-3840703/1
    2023-11-20T07:27:40.125605  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-20T07:27:40.159321  + cd /lava-3840703/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0b0a6947af2f687e4a95

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655b0b0a6947af2f687e4a9e
        failing since 172 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-20T07:29:49.557671  <8>[   14.105507] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3840736_1.5.2.4.1>
    2023-11-20T07:29:49.661350  / # #
    2023-11-20T07:29:49.762736  export SHELL=3D/bin/sh
    2023-11-20T07:29:49.763395  #
    2023-11-20T07:29:49.864468  / # export SHELL=3D/bin/sh. /lava-3840736/e=
nvironment
    2023-11-20T07:29:49.865031  =

    2023-11-20T07:29:49.965891  / # . /lava-3840736/environment/lava-384073=
6/bin/lava-test-runner /lava-3840736/1
    2023-11-20T07:29:49.966817  =

    2023-11-20T07:29:50.007216  / # /lava-3840736/bin/lava-test-runner /lav=
a-3840736/1
    2023-11-20T07:29:50.108549  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/655b072f221f1d8dae7e4abe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655b072f221f1d8dae7e4ac7
        failing since 166 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-11-20T07:13:25.751880  + set +x[   21.214393] <LAVA_SIGNAL_ENDRUN =
0_dmesg 444641_1.5.2.4.1>
    2023-11-20T07:13:25.752192  =

    2023-11-20T07:13:25.859739  / # #
    2023-11-20T07:13:25.961312  export SHELL=3D/bin/sh
    2023-11-20T07:13:25.962059  #
    2023-11-20T07:13:26.063077  / # export SHELL=3D/bin/sh. /lava-444641/en=
vironment
    2023-11-20T07:13:26.063731  =

    2023-11-20T07:13:26.164786  / # . /lava-444641/environment/lava-444641/=
bin/lava-test-runner /lava-444641/1
    2023-11-20T07:13:26.165643  =

    2023-11-20T07:13:26.168548  / # /lava-444641/bin/lava-test-runner /lava=
-444641/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/655b09c389d1d1b9057e4ab2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655b09c389d1d1b9057e4abb
        failing since 172 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-20T07:24:33.558946  + set +x
    2023-11-20T07:24:33.560656  [   22.025443] <LAVA_SIGNAL_ENDRUN 0_dmesg =
444650_1.5.2.4.1>
    2023-11-20T07:24:33.668829  / # #
    2023-11-20T07:24:33.770513  export SHELL=3D/bin/sh
    2023-11-20T07:24:33.771275  #
    2023-11-20T07:24:33.872258  / # export SHELL=3D/bin/sh. /lava-444650/en=
vironment
    2023-11-20T07:24:33.872877  =

    2023-11-20T07:24:33.973887  / # . /lava-444650/environment/lava-444650/=
bin/lava-test-runner /lava-444650/1
    2023-11-20T07:24:33.974814  =

    2023-11-20T07:24:33.977466  / # /lava-444650/bin/lava-test-runner /lava=
-444650/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/655b0ab514f66f847b7e4a7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231120/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655b0ab514f66f847b7e4a83
        failing since 172 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-20T07:28:28.105899  + set +x
    2023-11-20T07:28:28.107580  [   20.407696] <LAVA_SIGNAL_ENDRUN 0_dmesg =
444656_1.5.2.4.1>
    2023-11-20T07:28:28.216184  / # #
    2023-11-20T07:28:28.317783  export SHELL=3D/bin/sh
    2023-11-20T07:28:28.318306  #
    2023-11-20T07:28:28.419275  / # export SHELL=3D/bin/sh. /lava-444656/en=
vironment
    2023-11-20T07:28:28.419800  =

    2023-11-20T07:28:28.520771  / # . /lava-444656/environment/lava-444656/=
bin/lava-test-runner /lava-444656/1
    2023-11-20T07:28:28.521573  =

    2023-11-20T07:28:28.524309  / # /lava-444656/bin/lava-test-runner /lava=
-444656/1 =

    ... (12 line(s) more)  =

 =20
