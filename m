Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280AB7EDBF2
	for <lists+linux-next@lfdr.de>; Thu, 16 Nov 2023 08:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjKPH2H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Nov 2023 02:28:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjKPH2G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Nov 2023 02:28:06 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB052DD
        for <linux-next@vger.kernel.org>; Wed, 15 Nov 2023 23:27:58 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc3216b2a1so4688175ad.2
        for <linux-next@vger.kernel.org>; Wed, 15 Nov 2023 23:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700119678; x=1700724478; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Uns/nTkYaLAUybsP/OpZuzwv0CoOCHffokYpCOu8F4=;
        b=2bNLEKsLhPwUIv/Zd1J3tjd4Eo4T2Y72Zomu//waPNC//VHc5PTCBfqY0k78oqKUMn
         gSZ8ql4c0kknfPY+JyEe2v80byufR0RjG5bzxIp02/31bDqUbEZgTBbbRe9pueJ33ush
         aSL1jNszF42oPTvR2fT7dXQs30GWzr4Ei/TLAo8MPCk1jX7vqdHQ5zJwX/xUP6iU0cZG
         8lELPAyCZlW5S/C0rXECPbM5hmrMTZOKusW3Jj5zWQGP8Cywmx38gmkA98dco0uI0eJm
         LYFSTxQTDtmoEugD/PiJ5SE2S0jxGM5TuQdM5bQxpDGTvqGy0JM1O0oqVs0g5xabx8Gn
         WtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700119678; x=1700724478;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Uns/nTkYaLAUybsP/OpZuzwv0CoOCHffokYpCOu8F4=;
        b=nPQ/I453dicYt93A/0F2cLyL+xpMims8biLYnC7HmWvfEYzMXwgQPwYo23cQjIX7c4
         1rN8JLDvBXtXJbLp2mmaw89y7NUdQvJFFh8oYMZI+Hs/ce9uG+VbuzYCgKqCRsaysp1P
         JKCxhXv9I7H5SOb8jJmyUHXCLqUU4AQrtc8m9XRdVi1MxNd/+gceRKDEy7QzMQSF8DU4
         xVVvg7PKqipxh414q2mo/vHmtyWPNnc8Z2Ljq3/23WcXtk0Lbc3l9QMIojlgRKwQLKgr
         MDLjsef/uXel4hOt6uZiBI5zvMTmJYg9YdFhvyRr6LO3sOK20+x7L6Sf77nsZpWVQ635
         Y6Qw==
X-Gm-Message-State: AOJu0YxrEZ5c6LZJIBdAn6TsH38R009LszlMHtE9dPAOVtNAxrFYjhbG
        yTJCWLUFWPRh+jWFJXmzsBgvFOr//aAl4ktFgqm0zQ==
X-Google-Smtp-Source: AGHT+IFo6iT/DrzSJhN8FnlJvplZh6ShnqfMMiQaB1KMVDPuDGUSZhf7YVGmHciGukeqP5+hoAbZ9g==
X-Received: by 2002:a17:902:e88a:b0:1cc:50ed:4931 with SMTP id w10-20020a170902e88a00b001cc50ed4931mr7843502plg.16.1700119677273;
        Wed, 15 Nov 2023 23:27:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jd12-20020a170903260c00b001ae0152d280sm8567312plb.193.2023.11.15.23.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:27:56 -0800 (PST)
Message-ID: <6555c47c.170a0220.886c6.7ce9@mx.google.com>
Date:   Wed, 15 Nov 2023 23:27:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20231116
Subject: next/master baseline: 432 runs, 28 regressions (next-20231116)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 432 runs, 28 regressions (next-20231116)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
at91-sama5d4_xplained      | arm   | lab-baylibre  | gcc-10   | sama5_defco=
nfig              | 1          =

at91sam9g20ek              | arm   | lab-broonie   | gcc-10   | at91_dt_def=
config            | 1          =

at91sam9g20ek              | arm   | lab-broonie   | gcc-10   | multi_v5_de=
fconfig           | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-10   | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm                  | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk           | arm   | lab-nxp       | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                | arm64 | lab-baylibre  | gcc-10   | defconfig+k=
selftest          | 1          =

k3-j721e-sk                | arm64 | lab-baylibre  | gcc-10   | defconfig+k=
selftest          | 1          =

odroid-xu3                 | arm   | lab-collabora | gcc-10   | exynos_defc=
onfig             | 1          =

odroid-xu3                 | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_mips-malta            | mips  | lab-collabora | gcc-10   | malta_defco=
nfig              | 1          =

rk3288-rock2-square        | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq          | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3399-rock-pi-4b          | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64         | arm64 | lab-clabbe    | gcc-10   | defconfig+k=
selftest          | 1          =

sun50i-h6-pine-h64         | arm64 | lab-collabora | gcc-10   | defconfig+k=
selftest          | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231116/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231116
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f31817cbcf48d191faee7cebfb59197d2048cd64 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
at91-sama5d4_xplained      | arm   | lab-baylibre  | gcc-10   | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/655584d0bc1cb3f2177e4a71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655584d0bc1cb3f2177e4=
a72
        failing since 288 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
at91sam9g20ek              | arm   | lab-broonie   | gcc-10   | at91_dt_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/65558cd13a593261607e4a86

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65558cd13a593261607e4aa6
        failing since 163 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-16T03:30:15.915862  /lava-246166/1/../bin/lava-test-case
    2023-11-16T03:30:15.957762  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
at91sam9g20ek              | arm   | lab-broonie   | gcc-10   | multi_v5_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65558a153931dd47507e4a91

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65558a153931dd47507e4aae
        failing since 163 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-16T03:18:18.703258  /lava-246135/1/../bin/lava-test-case
    2023-11-16T03:18:18.745520  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/65558502aa271d719f7e4a74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558502aa271d719f7e4=
a75
        failing since 163 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65558af37bc76cd6677e4ab4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558af37bc76cd6677e4=
ab5
        failing since 232 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
beagle-xm                  | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65558a043931dd47507e4a87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558a043931dd47507e4=
a88
        failing since 229 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6ul-14x14-evk           | arm   | lab-nxp       | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/655589669abdc98c3d7e4a6f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/655589669abdc98c3d7e4a78
        failing since 1 day (last pass: next-20230428, first fail: next-202=
31114)

    2023-11-16T03:15:19.898263  + set +x
    2023-11-16T03:15:19.901398  <8>[   19.030383] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1258862_1.5.2.4.1>
    2023-11-16T03:15:20.009748  =

    2023-11-16T03:15:21.164996  / # #export SHELL=3D/bin/sh
    2023-11-16T03:15:21.170592  =

    2023-11-16T03:15:22.712553  / # export SHELL=3D/bin/sh. /lava-1258862/e=
nvironment
    2023-11-16T03:15:22.718186  =

    2023-11-16T03:15:25.530023  / # . /lava-1258862/environment/lava-125886=
2/bin/lava-test-runner /lava-1258862/1
    2023-11-16T03:15:25.535979  =

    2023-11-16T03:15:25.538501  / # /lava-1258862/bin/lava-test-runner /lav=
a-1258862/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
jetson-tk1                 | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65558741e3dfc7b5597e4a74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558741e3dfc7b5597e4=
a75
        failing since 583 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
k3-am625-sk                | arm64 | lab-baylibre  | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65558ac21154d9cf767e4afc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558ac21154d9cf767e4=
afd
        failing since 6 days (last pass: next-20231103, first fail: next-20=
231110) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
k3-j721e-sk                | arm64 | lab-baylibre  | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65558a6e1154d9cf767e4a6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558a6e1154d9cf767e4=
a6f
        failing since 12 days (last pass: next-20231025, first fail: next-2=
0231103) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
odroid-xu3                 | arm   | lab-collabora | gcc-10   | exynos_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65558c3388c7aa84497e4a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558c3388c7aa84497e4=
a76
        failing since 1 day (last pass: next-20230621, first fail: next-202=
31114) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
odroid-xu3                 | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65558a693a6ef010077e4ab7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558a693a6ef010077e4=
ab8
        new failure (last pass: next-20231115) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6555904808107fdb847e4af2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6555904808107fdb847e4=
af3
        failing since 10 days (last pass: next-20231101, first fail: next-2=
0231106) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/655590ccddae2bf44b7e4a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655590ccddae2bf44b7e4=
a7b
        failing since 10 days (last pass: next-20231101, first fail: next-2=
0231106) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6555904708107fdb847e4aef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6555904708107fdb847e4=
af0
        failing since 1 day (last pass: next-20231110, first fail: next-202=
31115) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/655590caf6c01e77437e4adb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655590caf6c01e77437e4=
adc
        failing since 1 day (last pass: next-20231110, first fail: next-202=
31115) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_mips-malta            | mips  | lab-collabora | gcc-10   | malta_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6555871741c21cd54a7e4a83

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6555871741c21cd=
54a7e4a87
        new failure (last pass: next-20231115)
        1 lines

    2023-11-16T03:05:35.777222  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 07f588a8, epc =3D=3D 802057ec, ra =3D=
=3D 802080f4
    2023-11-16T03:05:35.777381  =


    2023-11-16T03:05:35.795878  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-11-16T03:05:35.796034  =

   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3288-rock2-square        | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6555884a3a0f734fd57e4a9c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6555884a3a0f734fd57e4=
a9d
        failing since 358 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3288-veyron-jaq          | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65558746e3dfc7b5597e4a77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558746e3dfc7b5597e4=
a78
        failing since 358 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65558ec7f24cb0fcf67e4a6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558ec7f24cb0fcf67e4=
a6f
        new failure (last pass: next-20231115) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64         | arm64 | lab-clabbe    | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/655589b1cd20118a5b7e4ab4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/655589b1cd20118a5b7e4=
ab5
        failing since 278 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64         | arm64 | lab-collabora | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65558963cee9f9ada37e4a70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558963cee9f9ada37e4=
a71
        failing since 278 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6555886a1304b422047e4a8f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6555886a1304b422047e4a98
        failing since 167 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-16T03:11:28.367977  <8>[   13.939495] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3835933_1.5.2.4.1>
    2023-11-16T03:11:28.476550  / # #
    2023-11-16T03:11:28.579184  export SHELL=3D/bin/sh
    2023-11-16T03:11:28.580048  #
    2023-11-16T03:11:28.681383  / # export SHELL=3D/bin/sh. /lava-3835933/e=
nvironment
    2023-11-16T03:11:28.682347  =

    2023-11-16T03:11:28.783884  / # . /lava-3835933/environment/lava-383593=
3/bin/lava-test-runner /lava-3835933/1
    2023-11-16T03:11:28.784834  =

    2023-11-16T03:11:28.800060  / # /lava-3835933/bin/lava-test-runner /lav=
a-3835933/1
    2023-11-16T03:11:28.924732  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65558a01e60ea97f767e4a7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65558a01e60ea97f767e4a82
        failing since 161 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-11-16T03:17:48.473509  / # #
    2023-11-16T03:17:48.575954  export SHELL=3D/bin/sh
    2023-11-16T03:17:48.576797  #
    2023-11-16T03:17:48.678200  / # export SHELL=3D/bin/sh. /lava-3835992/e=
nvironment
    2023-11-16T03:17:48.679096  =

    2023-11-16T03:17:48.780516  / # . /lava-3835992/environment/lava-383599=
2/bin/lava-test-runner /lava-3835992/1
    2023-11-16T03:17:48.781497  =

    2023-11-16T03:17:48.797105  / # /lava-3835992/bin/lava-test-runner /lav=
a-3835992/1
    2023-11-16T03:17:48.908108  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-16T03:17:48.909161  + cd /lava-3835992/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65558bb775e2710fa47e4a92

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65558bb775e2710fa47e4a9b
        failing since 167 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-16T03:25:10.363016  / # #
    2023-11-16T03:25:10.463990  export SHELL=3D/bin/sh
    2023-11-16T03:25:10.464338  #
    2023-11-16T03:25:10.564969  / # export SHELL=3D/bin/sh. /lava-3836008/e=
nvironment
    2023-11-16T03:25:10.565322  =

    2023-11-16T03:25:10.665998  / # . /lava-3836008/environment/lava-383600=
8/bin/lava-test-runner /lava-3836008/1
    2023-11-16T03:25:10.666526  =

    2023-11-16T03:25:10.677414  / # /lava-3836008/bin/lava-test-runner /lav=
a-3836008/1
    2023-11-16T03:25:10.800242  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-16T03:25:10.800667  + cd /lava-3836008/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6555884a29462ee6c87e4a96

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6555884a29462ee6c87e4a9f
        failing since 167 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-16T03:10:44.584312  + set +x
    2023-11-16T03:10:44.586776  [   20.382220] <LAVA_SIGNAL_ENDRUN 0_dmesg =
444192_1.5.2.4.1>
    2023-11-16T03:10:44.695496  / # #
    2023-11-16T03:10:44.797344  export SHELL=3D/bin/sh
    2023-11-16T03:10:44.798018  #
    2023-11-16T03:10:44.899073  / # export SHELL=3D/bin/sh. /lava-444192/en=
vironment
    2023-11-16T03:10:44.899731  =

    2023-11-16T03:10:45.000852  / # . /lava-444192/environment/lava-444192/=
bin/lava-test-runner /lava-444192/1
    2023-11-16T03:10:45.001849  =

    2023-11-16T03:10:45.005214  / # /lava-444192/bin/lava-test-runner /lava=
-444192/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65558acad3f6a93c267e4a71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65558acad3f6a93c267e4=
a72
        new failure (last pass: next-20231115) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65558b7e8ddad453b67e4ac8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231116/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65558b7e8ddad453b67e4ad1
        failing since 167 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-16T03:24:30.086103  + set +x
    2023-11-16T03:24:30.087852  [   23.127654] <LAVA_SIGNAL_ENDRUN 0_dmesg =
444200_1.5.2.4.1>
    2023-11-16T03:24:30.195438  / # #
    2023-11-16T03:24:30.296983  export SHELL=3D/bin/sh
    2023-11-16T03:24:30.297528  #
    2023-11-16T03:24:30.398489  / # export SHELL=3D/bin/sh. /lava-444200/en=
vironment
    2023-11-16T03:24:30.399008  =

    2023-11-16T03:24:30.499997  / # . /lava-444200/environment/lava-444200/=
bin/lava-test-runner /lava-444200/1
    2023-11-16T03:24:30.500815  =

    2023-11-16T03:24:30.503580  / # /lava-444200/bin/lava-test-runner /lava=
-444200/1 =

    ... (12 line(s) more)  =

 =20
