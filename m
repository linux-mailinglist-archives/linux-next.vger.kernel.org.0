Return-Path: <linux-next+bounces-59-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 160AD7F6F50
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 10:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF72A2815D7
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 09:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D71A63A5;
	Fri, 24 Nov 2023 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="l8fFmiF6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F983D71
	for <linux-next@vger.kernel.org>; Fri, 24 Nov 2023 01:20:28 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cf98ffc257so8580085ad.3
        for <linux-next@vger.kernel.org>; Fri, 24 Nov 2023 01:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700817627; x=1701422427; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZsJATZOkY5lMLaGHezb1HT/nVatT1/xmZLGmVMxytE=;
        b=l8fFmiF6w9t5PGSd9eW5Q7VcJtmL4IKRbkBb6j0HaYxmFvQmU9qxobvxRsaodrVm96
         bk1Qornr+4Dh2Ko97TTp9VzfRB+yVN21kG9srcSiMtlrmGE4wzeWhYaJ8puAawa95VgI
         hf471cpQpB50gZCGN4RMWfTIAZsigBzwGGdoX04conaVfnJvA5nTcKeFxzaV57zmgh1k
         /5SyU2CydbG5kroR686/LaoKQfMU1r1xEnMlsKdtp8ag4V7D/wU6s8ZMR4TS4rPstUXW
         dhe/x0t4A+E1eeN8swCUUCXvkQsQRFSnIVpOl4WkbVp7XvNWf0Xfogi5IKWa/6jHijho
         A+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700817627; x=1701422427;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZsJATZOkY5lMLaGHezb1HT/nVatT1/xmZLGmVMxytE=;
        b=LAYWV6QSb+X0yCWXrEMfuXtMq4RJgXXA7Nvblr7HgwW0N4aT+KHoLWnUWm4m9Futz/
         n7CQEe/3bFk+GIyCf50D34CKBUhYErFM6CsG8NaNjsTHY4ZDLoh3pvSezPZ7IJMMnQOX
         b1XjXjQ0WY/6gz7yMQwuD58uLPJWSaqMwWqR/YQy1pW0CTZ2Ttyngv2l2TOTuBPQIf+Y
         2awbqwJA6e4A0C7A+VI2UMtHbUfKnQW8eh3uiYjybqRFA/xvPOMFZbeJHjdFKe3dZVvI
         EWKurIjE02MedP3N2DeVa2nnBeltJlB5KqJthPijipl+a25gjPMo+GwhGrhtJ5afSvf+
         X3lA==
X-Gm-Message-State: AOJu0YxAuGBrE+8VHX0+qboZZ5YJPNSt1vZ1GUZqXDi9m2MEOWWLChqb
	A+HTBlxgQD9Ll5BjTfy/Ky5Dpeb18BzbJNg+EQU=
X-Google-Smtp-Source: AGHT+IE3n3hG5Jp3cu9k3JUiX4IN8yz4q4KmsnV/j9h2rcvpSiBKxEFeQDgHb6jdeQQKYW3X0QGJNQ==
X-Received: by 2002:a17:902:ab1d:b0:1cc:49e7:ee16 with SMTP id ik29-20020a170902ab1d00b001cc49e7ee16mr2117599plb.12.1700817627275;
        Fri, 24 Nov 2023 01:20:27 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jj14-20020a170903048e00b001cc307bcdbdsm2727429plb.211.2023.11.24.01.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:20:26 -0800 (PST)
Message-ID: <65606ada.170a0220.1086f.65b9@mx.google.com>
Date: Fri, 24 Nov 2023 01:20:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20231124
Subject: next/master baseline: 301 runs, 26 regressions (next-20231124)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 301 runs, 26 regressions (next-20231124)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
at91sam9g20ek            | arm    | lab-broonie     | gcc-10   | at91_dt_de=
fconfig            | 1          =

at91sam9g20ek            | arm    | lab-broonie     | gcc-10   | multi_v5_d=
efconfig           | 1          =

bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | bcm2835_de=
fconfig            | 1          =

bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard         | arm    | lab-pengutronix | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =

imx6ul-14x14-evk         | arm    | lab-nxp         | gcc-10   | imx_v6_v7_=
defconfig          | 1          =

meson-gxm-khadas-vim2    | arm64  | lab-baylibre    | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

odroid-xu3               | arm    | lab-collabora   | gcc-10   | exynos_def=
config             | 1          =

odroid-xu3               | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

qemu_arm-virt-gicv2      | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+debug       | 1          =

r8a7743-iwg20d-q7        | arm    | lab-cip         | gcc-10   | shmobile_d=
efconfig           | 1          =

r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip         | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square      | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

rk3399-rock-pi-4b        | arm64  | lab-collabora   | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231124/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231124
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8c9660f6515396aba78d1168d2e17951d653ebf2 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
at91sam9g20ek            | arm    | lab-broonie     | gcc-10   | at91_dt_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65602e2215d751bf0b7e4a73

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65602e2215d751bf0b7e4a93
        failing since 172 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-24T05:00:54.992604  /lava-268237/1/../bin/lava-test-case
    2023-11-24T05:00:55.049445  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
at91sam9g20ek            | arm    | lab-broonie     | gcc-10   | multi_v5_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6560330e86cbb941ee7e4a7f

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6560330e86cbb941ee7e4a9e
        failing since 172 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-24T05:21:57.017558  /lava-268307/1/../bin/lava-test-case
    2023-11-24T05:21:57.059506  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | bcm2835_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65602dc7ad7fd967247e4a83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65602dc7ad7fd967247e4=
a84
        failing since 171 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656035e8acbc5028d37e4a73

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656035e8acbc5028d37e4=
a74
        failing since 240 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6dl-riotboard         | arm    | lab-pengutronix | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/656039f572a63ab22c7e4a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656039f572a63ab22c7e4=
a76
        failing since 471 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6ul-14x14-evk         | arm    | lab-nxp         | gcc-10   | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6560330cff7afd10e97e4a94

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6560330cff7afd10e97e4a9b
        failing since 10 days (last pass: next-20230428, first fail: next-2=
0231114)

    2023-11-24T05:21:55.109033  + set +x
    2023-11-24T05:21:55.112250  <8>[   16.795009] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1260147_1.5.2.4.1>
    2023-11-24T05:21:55.223378  / # #
    2023-11-24T05:21:56.379387  export SHELL=3D/bin/sh
    2023-11-24T05:21:56.385038  #
    2023-11-24T05:21:57.927221  / # export SHELL=3D/bin/sh. /lava-1260147/e=
nvironment
    2023-11-24T05:21:57.932863  =

    2023-11-24T05:22:00.745239  / # . /lava-1260147/environment/lava-126014=
7/bin/lava-test-runner /lava-1260147/1
    2023-11-24T05:22:00.751243  =

    2023-11-24T05:22:00.753679  / # /lava-1260147/bin/lava-test-runner /lav=
a-1260147/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
meson-gxm-khadas-vim2    | arm64  | lab-baylibre    | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65603699b808a94d297e4a9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65603699b808a94d297e4=
a9b
        new failure (last pass: next-20231123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
odroid-xu3               | arm    | lab-collabora   | gcc-10   | exynos_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/65602e67cf3178d4677e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65602e67cf3178d4677e4=
a6e
        failing since 10 days (last pass: next-20230621, first fail: next-2=
0231114) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
odroid-xu3               | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656035d5545f9ef8637e4b01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656035d5545f9ef8637e4=
b02
        failing since 1 day (last pass: next-20231122, first fail: next-202=
31123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65603671fe78ed5edf7e4af3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65603671fe78ed5edf7e4=
af4
        new failure (last pass: next-20231123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6560342ce5bf3467dc7e4a94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6560342ce5bf3467dc7e4=
a95
        failing since 1 day (last pass: next-20231120, first fail: next-202=
31122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6560344be5bf3467dc7e4ab7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6560344be5bf3467dc7e4=
ab8
        failing since 1 day (last pass: next-20231120, first fail: next-202=
31122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65605298fba90cffa87e4a74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65605298fba90cffa87e4=
a75
        failing since 1 day (last pass: next-20231120, first fail: next-202=
31122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6560342ee5bf3467dc7e4a9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6560342ee5bf3467dc7e4=
a9b
        failing since 1 day (last pass: next-20231120, first fail: next-202=
31122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6560344c828a8316c97e4a80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6560344c828a8316c97e4=
a81
        failing since 1 day (last pass: next-20231120, first fail: next-202=
31122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/656052ac2980c713277e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656052ac2980c713277e4=
a6e
        failing since 1 day (last pass: next-20231120, first fail: next-202=
31122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6560342d8ac23f68a57e4a7d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6560342d8ac23f68a57e4=
a7e
        failing since 1 day (last pass: next-20231120, first fail: next-202=
31122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65603445828a8316c97e4a77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65603445828a8316c97e4=
a78
        failing since 1 day (last pass: next-20231120, first fail: next-202=
31122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65605299bd058a94b57e4a72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65605299bd058a94b57e4=
a73
        failing since 1 day (last pass: next-20231120, first fail: next-202=
31122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7        | arm    | lab-cip         | gcc-10   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65602dcc64f6b86d0a7e4a84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65602dcc64f6b86d0a7e4=
a85
        new failure (last pass: next-20231123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip         | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656035acf34ba85cb57e4ab6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656035acf34ba85cb57e4abf
        failing since 114 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-11-24T05:33:12.975107  + set +x
    2023-11-24T05:33:12.978184  <8>[   27.135817] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1044537_1.5.2.4.1>
    2023-11-24T05:33:13.084338  / # #
    2023-11-24T05:33:14.539261  export SHELL=3D/bin/sh
    2023-11-24T05:33:14.559663  #
    2023-11-24T05:33:14.559845  / # export SHELL=3D/bin/sh
    2023-11-24T05:33:16.506129  / # . /lava-1044537/environment
    2023-11-24T05:33:20.088009  /lava-1044537/bin/lava-test-runner /lava-10=
44537/1
    2023-11-24T05:33:20.108684  . /lava-1044537/environment
    2023-11-24T05:33:20.108814  / # /lava-1044537/bin/lava-test-runner /lav=
a-1044537/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3288-rock2-square      | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656035d45ff717fede7e4a93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656035d45ff717fede7e4=
a94
        failing since 366 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3288-veyron-jaq        | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656034d0c44a1bed277e4a73

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656034d0c44a1bed277e4=
a74
        failing since 366 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3399-rock-pi-4b        | arm64  | lab-collabora   | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656036956bfa7d32d47e4aa6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656036956bfa7d32d47e4=
aa7
        new failure (last pass: next-20231123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65602ff7596eb2bba37e4a84

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65602ff7596eb2bba37e4a8d
        failing since 175 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-24T05:08:51.092404  + set +x
    2023-11-24T05:08:51.094119  [   20.855160] <LAVA_SIGNAL_ENDRUN 0_dmesg =
445114_1.5.2.4.1>
    2023-11-24T05:08:51.201969  / # #
    2023-11-24T05:08:51.303262  export SHELL=3D/bin/sh
    2023-11-24T05:08:51.303789  #
    2023-11-24T05:08:51.404659  / # export SHELL=3D/bin/sh. /lava-445114/en=
vironment
    2023-11-24T05:08:51.405279  =

    2023-11-24T05:08:51.506302  / # . /lava-445114/environment/lava-445114/=
bin/lava-test-runner /lava-445114/1
    2023-11-24T05:08:51.507167  =

    2023-11-24T05:08:51.509969  / # /lava-445114/bin/lava-test-runner /lava=
-445114/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/656034e454d620b0cd7e4ae3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656034e454d620b0cd7e4aec
        failing since 175 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-24T05:29:57.554057  + set +x
    2023-11-24T05:29:57.555759  [   22.113604] <LAVA_SIGNAL_ENDRUN 0_dmesg =
445122_1.5.2.4.1>
    2023-11-24T05:29:57.663966  / # #
    2023-11-24T05:29:57.765630  export SHELL=3D/bin/sh
    2023-11-24T05:29:57.766245  #
    2023-11-24T05:29:57.867245  / # export SHELL=3D/bin/sh. /lava-445122/en=
vironment
    2023-11-24T05:29:57.867886  =

    2023-11-24T05:29:57.968902  / # . /lava-445122/environment/lava-445122/=
bin/lava-test-runner /lava-445122/1
    2023-11-24T05:29:57.969838  =

    2023-11-24T05:29:57.972568  / # /lava-445122/bin/lava-test-runner /lava=
-445122/1 =

    ... (12 line(s) more)  =

 =20

