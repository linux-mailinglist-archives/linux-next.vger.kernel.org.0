Return-Path: <linux-next+bounces-523-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154781BC1E
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 17:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63FE281F50
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 16:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DED155E79;
	Thu, 21 Dec 2023 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cclzMsdX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC902AF0E
	for <linux-next@vger.kernel.org>; Thu, 21 Dec 2023 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6d775f9af42so892392b3a.3
        for <linux-next@vger.kernel.org>; Thu, 21 Dec 2023 08:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703176330; x=1703781130; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oj5GL8SVrq+B4mUVkTFE4jXcF9PCQ03YkEtzU2ES6os=;
        b=cclzMsdXAwE7ODeeaaDAMiOMdBLca5rNbWUwtUZkvmRNqTk5lStZPTjb8sbBUKrQyF
         UYQBYoPoTeFARYZPNImLUPMEV9li4nqJMlmiv0Oon8euV0EXWIs+hcghFPTJS0XMoCyx
         aaCpk8s6gY0vzckSiBZH+gsXwxd4LcNRphr4xz5BEzDSGgiySGk0xH+ncenXJpAjyR00
         wDAoe02mIRXtnmZ+OsXqMLea36+Mr3gLmECAQd/vhcJrvhxmKIl1tE5idd3oaP5Z7DQy
         PSuxzta6qHONaHoPwr3dykeNWXaWNV1Mb8wElluHa6z/MnAJp3ZJfRUelHiZVI6ibg8t
         Abtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703176330; x=1703781130;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oj5GL8SVrq+B4mUVkTFE4jXcF9PCQ03YkEtzU2ES6os=;
        b=WiA5Rf3uo77ofaApcyFmXQksKfRVXOxRpIt6K+FrFbNuXvscsGVNaXJ04mdM6ObD6T
         QrkhyB63pLxkQX8BoJWqqNzn7cbyFf/yFbA4UxftIQqId/1H2QdCAtsbelIeUAhoJWNu
         rM6PPQXcb4JpCIyRZ4X1On4RvxmYGMNUVZ8hz+5vBr2CdfcjGakLU/rb5XvApqMn7mRO
         smUGXJSehAO4PZBrEKaxihwhKByJk5wz82p0CGLAyhnYFJsry7urDUt5nh5MsE5B0kRn
         WNg6ge1/Bz60Mi9sU0nIV6xcupE0DOYqHKUe0wzFmJme/uMT6pVGN4EaidNXfZ+4vqNJ
         9y8A==
X-Gm-Message-State: AOJu0YwPdiLtIuPK1kk24eL+UvVAvk5wQLz3mThc7olTxumr7CL5fvN7
	pJb054mdUuNASmZrNX3GXbuhdGNmp//lNiqjXcs=
X-Google-Smtp-Source: AGHT+IHY8DcHOn8RsugTYeCXI/RZkQ4XmnDA2tY6zJIm5vdUxmDa/SqFuV6Sj+Z8LuzrTEnLR8oEvg==
X-Received: by 2002:a05:6a20:8884:b0:18f:f7ee:54e8 with SMTP id d4-20020a056a20888400b0018ff7ee54e8mr1309021pzf.26.1703176328804;
        Thu, 21 Dec 2023 08:32:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x12-20020aa784cc000000b006d922015d25sm1801798pfn.186.2023.12.21.08.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 08:32:08 -0800 (PST)
Message-ID: <65846888.a70a0220.b0adc.5776@mx.google.com>
Date: Thu, 21 Dec 2023 08:32:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20231221
Subject: next/master baseline: 498 runs, 57 regressions (next-20231221)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 498 runs, 57 regressions (next-20231221)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+videodec           | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231221/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231221
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      857647efa9be89a13cf8963c7e167fab062b28bb =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65842c93d5e12ed621e1347d

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65842c93d5e12ed621e13498
        failing since 199 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-21T12:14:43.384811  /lava-381919/1/../bin/lava-test-case
    2023-12-21T12:14:43.441201  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/658431750cdcb8a8aae1351e

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/658431750cdcb8a8aae13539
        failing since 199 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-21T12:36:45.144277  /lava-382091/1/../bin/lava-test-case
    2023-12-21T12:36:45.186359  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65842decb506876be6e134ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842decb506876be6e13=
4ee
        failing since 199 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65842928ca3ae7f5f0e134b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842928ca3ae7f5f0e13=
4b5
        failing since 267 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6584380a0a87c85ca3e13492

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6584380a0a87c85c=
a3e134c6
        new failure (last pass: next-20231220)
        1 lines

    2023-12-21T13:04:55.114264  / # =

    2023-12-21T13:04:55.124624  =

    2023-12-21T13:04:55.227550  / # #
    2023-12-21T13:04:55.236634  #
    2023-12-21T13:04:55.337490  / # export SHELL=3D/bin/sh
    2023-12-21T13:04:55.348536  export SHELL=3D/bin/sh
    2023-12-21T13:04:55.449397  / # . /lava-1063507/environment
    2023-12-21T13:04:55.460589  . /lava-1063507/environment
    2023-12-21T13:04:55.561491  / # /lava-1063507/bin/lava-test-runner /lav=
a-1063507/0
    2023-12-21T13:04:55.572372  /lava-1063507/bin/lava-test-runner /lava-10=
63507/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65842b1bfde4bbd56ce134ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842b1bfde4bbd56ce13=
4ef
        failing since 618 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65842d4350d61f73c9e1347a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65842d4350d61f73c9e1347d
        failing since 6 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-21T12:18:52.162214  <8>[   20.088306] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 408783_1.5.2.4.1>
    2023-12-21T12:18:52.267113  / # #
    2023-12-21T12:18:52.369275  export SHELL=3D/bin/sh
    2023-12-21T12:18:52.369983  #
    2023-12-21T12:18:52.471130  / # export SHELL=3D/bin/sh. /lava-408783/en=
vironment
    2023-12-21T12:18:52.471563  =

    2023-12-21T12:18:52.572549  / # . /lava-408783/environment/lava-408783/=
bin/lava-test-runner /lava-408783/1
    2023-12-21T12:18:52.573727  =

    2023-12-21T12:18:52.593779  / # /lava-408783/bin/lava-test-runner /lava=
-408783/1
    2023-12-21T12:18:52.637694  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65842d4350d61f73c9e13481
        failing since 6 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-21T12:18:54.744402  /lava-408783/1/../bin/lava-test-case
    2023-12-21T12:18:54.744866  <8>[   22.653627] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-21T12:18:54.745277  /lava-408783/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
842d4350d61f73c9e13483
        failing since 6 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-21T12:18:55.801483  /lava-408783/1/../bin/lava-test-case
    2023-12-21T12:18:55.801959  <8>[   23.690873] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-21T12:18:55.802314  /lava-408783/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65842d4350d61f73c9e13488
        failing since 6 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-21T12:18:56.875023  /lava-408783/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65842d4350d61f73c9e13489
        failing since 6 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-21T12:18:56.878285  <8>[   24.801043] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-21T12:18:57.930860  /lava-408783/1/../bin/lava-test-case
    2023-12-21T12:18:57.931063  <8>[   25.821982] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-21T12:18:57.931201  /lava-408783/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/658428662a8e4cf7cde13482

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658428672a8e4cf7cde13485
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T11:58:07.063860  / # #
    2023-12-21T11:58:07.165868  export SHELL=3D/bin/sh
    2023-12-21T11:58:07.166617  #
    2023-12-21T11:58:07.268052  / # export SHELL=3D/bin/sh. /lava-408749/en=
vironment
    2023-12-21T11:58:07.268868  =

    2023-12-21T11:58:07.370295  / # . /lava-408749/environment/lava-408749/=
bin/lava-test-runner /lava-408749/1
    2023-12-21T11:58:07.371499  =

    2023-12-21T11:58:07.391114  / # /lava-408749/bin/lava-test-runner /lava=
-408749/1
    2023-12-21T11:58:07.434863  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T11:58:07.435295  + <8>[   20.706017] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408749_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/658428672a8e4cf7cde13489
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T11:58:09.539618  /lava-408749/1/../bin/lava-test-case
    2023-12-21T11:58:09.540041  <8>[   22.813072] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-21T11:58:09.540336  /lava-408749/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
8428672a8e4cf7cde1348b
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T11:58:10.597131  /lava-408749/1/../bin/lava-test-case
    2023-12-21T11:58:10.597590  <8>[   23.850425] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-21T11:58:10.597869  /lava-408749/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/658428672a8e4cf7cde13490
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T11:58:11.671443  /lava-408749/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/658428672a8e4cf7cde13491
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T11:58:11.674803  <8>[   24.961169] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-21T11:58:12.732454  /lava-408749/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/65842befca37ada121e134f7

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65842befca37ada121e134fa
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T12:13:06.691627  <8>[   20.388129] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 408773_1.5.2.4.1>
    2023-12-21T12:13:06.796915  / # #
    2023-12-21T12:13:06.899105  export SHELL=3D/bin/sh
    2023-12-21T12:13:06.899826  #
    2023-12-21T12:13:07.001345  / # export SHELL=3D/bin/sh. /lava-408773/en=
vironment
    2023-12-21T12:13:07.002104  =

    2023-12-21T12:13:07.103472  / # . /lava-408773/environment/lava-408773/=
bin/lava-test-runner /lava-408773/1
    2023-12-21T12:13:07.104641  =

    2023-12-21T12:13:07.122117  / # /lava-408773/bin/lava-test-runner /lava=
-408773/1
    2023-12-21T12:13:07.167509  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65842befca37ada121e134fe
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T12:13:09.274381  /lava-408773/1/../bin/lava-test-case
    2023-12-21T12:13:09.274537  <8>[   22.953568] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-21T12:13:09.274657  /lava-408773/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
842befca37ada121e13500
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T12:13:10.337169  /lava-408773/1/../bin/lava-test-case
    2023-12-21T12:13:10.337641  <8>[   23.993020] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-21T12:13:10.337901  /lava-408773/1/../bin/lava-test-case
    2023-12-21T12:13:10.338119  <8>[   24.011550] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65842befca37ada121e13505
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T12:13:11.412105  /lava-408773/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65842befca37ada121e13506
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T12:13:11.415332  <8>[   25.108654] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-21T12:13:12.470576  /lava-408773/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65842e94c6379415aee1350d

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65842e94c6379415aee13510
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-21T12:24:24.309653  / # #
    2023-12-21T12:24:24.410341  export SHELL=3D/bin/sh
    2023-12-21T12:24:24.410595  #
    2023-12-21T12:24:24.511083  / # export SHELL=3D/bin/sh. /lava-408786/en=
vironment
    2023-12-21T12:24:24.511396  =

    2023-12-21T12:24:24.611950  / # . /lava-408786/environment/lava-408786/=
bin/lava-test-runner /lava-408786/1
    2023-12-21T12:24:24.612289  =

    2023-12-21T12:24:24.624225  / # /lava-408786/bin/lava-test-runner /lava=
-408786/1
    2023-12-21T12:24:24.674822  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T12:24:24.674959  + <8>[   20.757230] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408786_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65842e94c6379415aee13514
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-21T12:24:26.781842  /lava-408786/1/../bin/lava-test-case
    2023-12-21T12:24:26.782268  <8>[   22.864619] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-21T12:24:26.782547  /lava-408786/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
842e94c6379415aee13516
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-21T12:24:27.840384  /lava-408786/1/../bin/lava-test-case
    2023-12-21T12:24:27.840526  <8>[   23.903066] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-21T12:24:27.840591  /lava-408786/1/../bin/lava-test-case
    2023-12-21T12:24:27.840648  <8>[   23.920255] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65842e94c6379415aee1351b
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-21T12:24:28.920167  /lava-408786/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65842e94c6379415aee1351c
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-21T12:24:28.923292  <8>[   25.020429] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-21T12:24:29.976743  /lava-408786/1/../bin/lava-test-case
    2023-12-21T12:24:29.976880  <8>[   26.041836] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-21T12:24:29.976966  /lava-408786/1/../bin/lava-test-case
    2023-12-21T12:24:29.977040  <8>[   26.059443] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-12-21T12:24:29.977111  /lava-408786/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/658432cdbb08778e29e13475

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658432cdbb08778e29e13478
        failing since 8 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-21T12:42:32.679503  <8>[   20.384865] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 408814_1.5.2.4.1>
    2023-12-21T12:42:32.784923  / # #
    2023-12-21T12:42:32.887071  export SHELL=3D/bin/sh
    2023-12-21T12:42:32.887770  #
    2023-12-21T12:42:32.989363  / # export SHELL=3D/bin/sh. /lava-408814/en=
vironment
    2023-12-21T12:42:32.990060  =

    2023-12-21T12:42:33.091325  / # . /lava-408814/environment/lava-408814/=
bin/lava-test-runner /lava-408814/1
    2023-12-21T12:42:33.092468  =

    2023-12-21T12:42:33.110764  / # /lava-408814/bin/lava-test-runner /lava=
-408814/1
    2023-12-21T12:42:33.155241  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/658432cdbb08778e29e1347c
        failing since 8 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-21T12:42:35.261324  /lava-408814/1/../bin/lava-test-case
    2023-12-21T12:42:35.261752  <8>[   22.948543] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-21T12:42:35.262049  /lava-408814/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
8432cdbb08778e29e1347e
        failing since 8 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-21T12:42:36.319296  /lava-408814/1/../bin/lava-test-case
    2023-12-21T12:42:36.319805  <8>[   23.987047] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-21T12:42:36.320089  /lava-408814/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/658432cdbb08778e29e13483
        failing since 8 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-21T12:42:37.395115  /lava-408814/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/658432cdbb08778e29e13484
        failing since 8 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-21T12:42:37.398333  <8>[   25.100046] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-21T12:42:38.457700  /lava-408814/1/../bin/lava-test-case
    2023-12-21T12:42:38.458201  <8>[   26.121644] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-21T12:42:38.458486  /lava-408814/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65842d40b693ba009be13517

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65842d40b693ba009be1351a
        failing since 6 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-21T12:18:52.406760  / # #
    2023-12-21T12:18:52.508791  export SHELL=3D/bin/sh
    2023-12-21T12:18:52.509186  #
    2023-12-21T12:18:52.610146  / # export SHELL=3D/bin/sh. /lava-408781/en=
vironment
    2023-12-21T12:18:52.610907  =

    2023-12-21T12:18:52.712478  / # . /lava-408781/environment/lava-408781/=
bin/lava-test-runner /lava-408781/1
    2023-12-21T12:18:52.713738  =

    2023-12-21T12:18:52.718784  / # /lava-408781/bin/lava-test-runner /lava=
-408781/1
    2023-12-21T12:18:52.788497  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T12:18:52.788967  + <8>[   20.947629] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408781_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65842d40b693ba009be1352d
        failing since 6 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-21T12:18:55.210353  /lava-408781/1/../bin/lava-test-case
    2023-12-21T12:18:55.210817  <8>[   23.359098] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-21T12:18:55.211110  /lava-408781/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6584287b624fac2884e13485

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6584287b624fac2884e13488
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T11:58:23.700029  =

    2023-12-21T11:58:23.801728  / # #export SHELL=3D/bin/sh
    2023-12-21T11:58:23.802438  =

    2023-12-21T11:58:23.903941  / # export SHELL=3D/bin/sh. /lava-408751/en=
vironment
    2023-12-21T11:58:23.904678  =

    2023-12-21T11:58:24.006139  / # . /lava-408751/environment/lava-408751/=
bin/lava-test-runner /lava-408751/1
    2023-12-21T11:58:24.007290  =

    2023-12-21T11:58:24.026913  / # /lava-408751/bin/lava-test-runner /lava=
-408751/1
    2023-12-21T11:58:24.080761  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T11:58:24.081187  + <8>[   20.951057] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408751_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6584287b624fac2884e1349b
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T11:58:26.504048  /lava-408751/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65842becca37ada121e13484

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65842becca37ada121e13487
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T12:13:09.047028  / # #
    2023-12-21T12:13:09.147874  export SHELL=3D/bin/sh
    2023-12-21T12:13:09.148132  #
    2023-12-21T12:13:09.248710  / # export SHELL=3D/bin/sh. /lava-408770/en=
vironment
    2023-12-21T12:13:09.248985  =

    2023-12-21T12:13:09.349687  / # . /lava-408770/environment/lava-408770/=
bin/lava-test-runner /lava-408770/1
    2023-12-21T12:13:09.350163  =

    2023-12-21T12:13:09.361498  / # /lava-408770/bin/lava-test-runner /lava=
-408770/1
    2023-12-21T12:13:09.405130  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T12:13:09.422688  + <8>[   21.077474] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408770_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65842becca37ada121e1349a
        failing since 10 days (last pass: next-20231207, first fail: next-2=
0231211)

    2023-12-21T12:13:11.851861  /lava-408770/1/../bin/lava-test-case
    2023-12-21T12:13:11.852274  <8>[   23.492615] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-21T12:13:11.852529  /lava-408770/1/../bin/lava-test-case
    2023-12-21T12:13:11.852798  <8>[   23.510266] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-12-21T12:13:11.853025  /lava-408770/1/../bin/lava-test-case
    2023-12-21T12:13:11.853230  <8>[   23.531056] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-12-21T12:13:11.853436  /lava-408770/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65842e9685cfbc09bde13475

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65842e9685cfbc09bde13478
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-21T12:24:37.016965  / # #
    2023-12-21T12:24:37.117511  export SHELL=3D/bin/sh
    2023-12-21T12:24:37.117694  #
    2023-12-21T12:24:37.218127  / # export SHELL=3D/bin/sh. /lava-408788/en=
vironment
    2023-12-21T12:24:37.218312  =

    2023-12-21T12:24:37.318733  / # . /lava-408788/environment/lava-408788/=
bin/lava-test-runner /lava-408788/1
    2023-12-21T12:24:37.319001  =

    2023-12-21T12:24:37.328818  / # /lava-408788/bin/lava-test-runner /lava=
-408788/1
    2023-12-21T12:24:37.372692  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T12:24:37.390514  + <8>[   21.048316] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408788_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65842e9685cfbc09bde1348b
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-21T12:24:39.828498  /lava-408788/1/../bin/lava-test-case
    2023-12-21T12:24:39.828978  <8>[   23.470978] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-21T12:24:39.829262  /lava-408788/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6584318c3eacc952dae13487

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6584318c3eacc952dae1348a
        failing since 8 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-21T12:37:08.486308  / # #
    2023-12-21T12:37:08.588409  export SHELL=3D/bin/sh
    2023-12-21T12:37:08.589165  #
    2023-12-21T12:37:08.690646  / # export SHELL=3D/bin/sh. /lava-408815/en=
vironment
    2023-12-21T12:37:08.691363  =

    2023-12-21T12:37:08.792919  / # . /lava-408815/environment/lava-408815/=
bin/lava-test-runner /lava-408815/1
    2023-12-21T12:37:08.794053  =

    2023-12-21T12:37:08.798046  / # /lava-408815/bin/lava-test-runner /lava=
-408815/1
    2023-12-21T12:37:08.865926  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T12:37:08.866137  + <8>[   21.020821] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408815_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6584318c3eacc952dae1349d
        failing since 8 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-21T12:37:11.296167  /lava-408815/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65842fa0d7bd0b80c3e1347c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842fa0d7bd0b80c3e13=
47d
        new failure (last pass: next-20231220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65842b6ec08211ad17e134a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842b6ec08211ad17e13=
4a8
        failing since 1 day (last pass: next-20231215, first fail: next-202=
31220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65842cadcb39b84233e1354e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842cadcb39b84233e13=
54f
        new failure (last pass: next-20231219) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/658427098d06186e32e134b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/658427098d06186e32e13=
4b2
        new failure (last pass: next-20231220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65842c20f6d1ddaa8be134b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842c20f6d1ddaa8be13=
4b3
        failing since 394 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65842b1c7aeeb8791ee13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842b1c7aeeb8791ee13=
476
        failing since 394 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65842f925e4a0f927ae1348b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842f925e4a0f927ae13=
48c
        new failure (last pass: next-20231220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65842e323067f2cb52e1351f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65842e323067f2cb52e13=
520
        failing since 1 day (last pass: next-20231010, first fail: next-202=
31220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65842d2fcb3c8b4cb9e134d9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65842d2fcb3c8b4cb9e134de
        failing since 72 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-12-21T12:18:31.285921  <8>[   18.745056] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 449304_1.5.2.4.1>
    2023-12-21T12:18:31.390928  / # #
    2023-12-21T12:18:31.492632  export SHELL=3D/bin/sh
    2023-12-21T12:18:31.493200  #
    2023-12-21T12:18:31.594237  / # export SHELL=3D/bin/sh. /lava-449304/en=
vironment
    2023-12-21T12:18:31.594907  =

    2023-12-21T12:18:31.695958  / # . /lava-449304/environment/lava-449304/=
bin/lava-test-runner /lava-449304/1
    2023-12-21T12:18:31.696934  =

    2023-12-21T12:18:31.701167  / # /lava-449304/bin/lava-test-runner /lava=
-449304/1
    2023-12-21T12:18:31.786178  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65842d38303966dacee1349b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65842d38303966dacee134a0
        failing since 72 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-12-21T12:26:32.979141  / # #

    2023-12-21T12:26:33.081335  export SHELL=3D/bin/sh

    2023-12-21T12:26:33.082036  #

    2023-12-21T12:26:33.183443  / # export SHELL=3D/bin/sh. /lava-12339904/=
environment

    2023-12-21T12:26:33.184156  =


    2023-12-21T12:26:33.285647  / # . /lava-12339904/environment/lava-12339=
904/bin/lava-test-runner /lava-12339904/1

    2023-12-21T12:26:33.286722  =


    2023-12-21T12:26:33.302968  / # /lava-12339904/bin/lava-test-runner /la=
va-12339904/1

    2023-12-21T12:26:33.375053  + export 'TESTRUN_ID=3D1_bootrr'

    2023-12-21T12:26:33.375550  + cd /lava-1233990<8>[   19.645661] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 12339904_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/658429176ef63f9d95e134b1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658429176ef63f9d95e134b6
        failing since 197 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-21T12:01:14.558404  / # #
    2023-12-21T12:01:14.660826  export SHELL=3D/bin/sh
    2023-12-21T12:01:14.661902  #
    2023-12-21T12:01:14.763230  / # export SHELL=3D/bin/sh. /lava-3891606/e=
nvironment
    2023-12-21T12:01:14.764205  =

    2023-12-21T12:01:14.865630  / # . /lava-3891606/environment/lava-389160=
6/bin/lava-test-runner /lava-3891606/1
    2023-12-21T12:01:14.866852  =

    2023-12-21T12:01:14.880670  / # /lava-3891606/bin/lava-test-runner /lav=
a-3891606/1
    2023-12-21T12:01:14.990074  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T12:01:14.990972  + cd /lava-3891606/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6584313f5dd9f95c22e1348d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6584313f5dd9f95c22e13492
        failing since 197 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-21T12:36:05.037314  / # #
    2023-12-21T12:36:05.140094  export SHELL=3D/bin/sh
    2023-12-21T12:36:05.141113  #
    2023-12-21T12:36:05.242704  / # export SHELL=3D/bin/sh. /lava-3891874/e=
nvironment
    2023-12-21T12:36:05.243606  =

    2023-12-21T12:36:05.345062  / # . /lava-3891874/environment/lava-389187=
4/bin/lava-test-runner /lava-3891874/1
    2023-12-21T12:36:05.346635  =

    2023-12-21T12:36:05.366659  / # /lava-3891874/bin/lava-test-runner /lav=
a-3891874/1
    2023-12-21T12:36:05.489458  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T12:36:05.490517  + cd /lava-3891874/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/658428f5b87e4d9bb2e134f8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658428f5b87e4d9bb2e134fd
        failing since 197 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-21T12:00:35.058080  + set +x[   21.233572] <LAVA_SIGNAL_ENDRUN =
0_dmesg 449300_1.5.2.4.1>
    2023-12-21T12:00:35.058407  =

    2023-12-21T12:00:35.166027  / # #
    2023-12-21T12:00:35.267701  export SHELL=3D/bin/sh
    2023-12-21T12:00:35.268316  #
    2023-12-21T12:00:35.369418  / # export SHELL=3D/bin/sh. /lava-449300/en=
vironment
    2023-12-21T12:00:35.370055  =

    2023-12-21T12:00:35.471098  / # . /lava-449300/environment/lava-449300/=
bin/lava-test-runner /lava-449300/1
    2023-12-21T12:00:35.472056  =

    2023-12-21T12:00:35.474812  / # /lava-449300/bin/lava-test-runner /lava=
-449300/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65843207751a724987e135f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65843207751a724987e135f9
        failing since 197 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-21T12:39:18.476788  + set +x
    2023-12-21T12:39:18.478543  [   20.285768] <LAVA_SIGNAL_ENDRUN 0_dmesg =
449316_1.5.2.4.1>
    2023-12-21T12:39:18.587402  / # #
    2023-12-21T12:39:18.688939  export SHELL=3D/bin/sh
    2023-12-21T12:39:18.689462  #
    2023-12-21T12:39:18.790417  / # export SHELL=3D/bin/sh. /lava-449316/en=
vironment
    2023-12-21T12:39:18.790928  =

    2023-12-21T12:39:18.891930  / # . /lava-449316/environment/lava-449316/=
bin/lava-test-runner /lava-449316/1
    2023-12-21T12:39:18.892759  =

    2023-12-21T12:39:18.895591  / # /lava-449316/bin/lava-test-runner /lava=
-449316/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65842652459e3e805ae134a8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65842652459e3e805ae134ad
        failing since 10 days (last pass: next-20231208, first fail: next-2=
0231211)

    2023-12-21T11:49:12.484019  / # #
    2023-12-21T11:49:12.585207  export SHELL=3D/bin/sh
    2023-12-21T11:49:12.585572  #
    2023-12-21T11:49:12.686393  / # export SHELL=3D/bin/sh. /lava-3891564/e=
nvironment
    2023-12-21T11:49:12.686759  =

    2023-12-21T11:49:12.787585  / # . /lava-3891564/environment/lava-389156=
4/bin/lava-test-runner /lava-3891564/1
    2023-12-21T11:49:12.788203  =

    2023-12-21T11:49:12.795898  / # /lava-3891564/bin/lava-test-runner /lav=
a-3891564/1
    2023-12-21T11:49:12.935816  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T11:49:12.936261  + cd /lava-3891564/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6584263f459e3e805ae13481

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231221/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231221/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6584263f459e3e805ae13486
        failing since 6 days (last pass: next-20231213, first fail: next-20=
231214)

    2023-12-21T11:49:03.269618  / # #
    2023-12-21T11:49:03.370844  export SHELL=3D/bin/sh
    2023-12-21T11:49:03.371223  #
    2023-12-21T11:49:03.472062  / # export SHELL=3D/bin/sh. /lava-3891565/e=
nvironment
    2023-12-21T11:49:03.472456  =

    2023-12-21T11:49:03.573301  / # . /lava-3891565/environment/lava-389156=
5/bin/lava-test-runner /lava-3891565/1
    2023-12-21T11:49:03.573927  =

    2023-12-21T11:49:03.617083  / # /lava-3891565/bin/lava-test-runner /lav=
a-3891565/1
    2023-12-21T11:49:03.730026  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-21T11:49:03.730802  + cd /lava-3891565/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

