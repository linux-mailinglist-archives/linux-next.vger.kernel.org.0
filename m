Return-Path: <linux-next+bounces-712-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFB9829CFF
	for <lists+linux-next@lfdr.de>; Wed, 10 Jan 2024 15:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96A81C2136A
	for <lists+linux-next@lfdr.de>; Wed, 10 Jan 2024 14:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0304D102;
	Wed, 10 Jan 2024 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="f4X87iMV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBC04D100
	for <linux-next@vger.kernel.org>; Wed, 10 Jan 2024 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-598a5448ef5so86870eaf.0
        for <linux-next@vger.kernel.org>; Wed, 10 Jan 2024 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704898687; x=1705503487; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fthBH7ItBpPsIekx3vWZVMB4ntmehxaUcAyB2+lcAXM=;
        b=f4X87iMVh+WsR0YDE8Pw1xLl+4r0iGpe5u8y3egJDIpr/IBkaDglbj6oBoSD2y2abr
         TeNrPUKAQdzdwddBdv1LiwrfgzBpb9cOJ8ibDcF7BEwD5QY2CTqac+FTctZ02dXhoaJQ
         ZNRUVDJs46l7SsqaUnTqznUlRXFZ6xfcvQAaz/vTHYQIcRfNKpT8R1tkxCfXWey6cXvf
         1zJ0NyDpkWdnJTFLAWkYWdzVpfBFJMmcAW+9APs7/DQ8XVQegkcTwY+50f6DgG5gKCTP
         PL5f5A2C7V0+84jl+noEIiClAD6FIWjSYUlMsTLd6xm4OOI9xcMFyNcvTfIp1ObsIJo3
         +Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898687; x=1705503487;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fthBH7ItBpPsIekx3vWZVMB4ntmehxaUcAyB2+lcAXM=;
        b=Nj7kvM2BJafGmHZxiLS1WU2uuYBnGsLtjna1f/A5xSBI5hq0AEpkgAFwqOyRfZ4aa0
         j0/L9uxgwIaUu/pacaA3nSXeg/rDjvQsO4wqN5xbp+D/sedxqjE2igp0hSz4T8tR0o6x
         2luB7oi59VFlSAqnKvmlssctzBkWpkYtdFnd7TK3nANahE1wOWe4VsdksHHAxbDbGTu5
         5dFfOpQ1c0kghQOFbtdcoQKHC9tiFIDvKnJogtOEEsMeOPcFfMHRYrXb0Y+cYs7WrMTn
         nht+81J3iFjC94w8jcPHsWdEGsdV6UjCR3cF4dpsFid+g+CLfxDghBJwrmHifEdSd4pP
         01HQ==
X-Gm-Message-State: AOJu0YyWQ2GFsfkzG5xtbcxuuqWtkUTNsv4RbQmk6krnKr5juZWwBBEt
	2Z7KkqHBVX6xzLxitrabbligUy1twVgHRZlUEvu5uXWvsuUamg==
X-Google-Smtp-Source: AGHT+IGIeub2hhapfLQ1wd1d8zrBglsUFJT4zw79MgO5IIJ0HibD4WM3KqSJuxiG5VYCI7Y+T3ZXdA==
X-Received: by 2002:a05:6358:4907:b0:175:5d98:7a39 with SMTP id w7-20020a056358490700b001755d987a39mr1154528rwn.10.1704898687167;
        Wed, 10 Jan 2024 06:58:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x16-20020a62fb10000000b006dac91d55f7sm3587660pfm.136.2024.01.10.06.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:58:05 -0800 (PST)
Message-ID: <659eb07d.620a0220.55e1c.e990@mx.google.com>
Date: Wed, 10 Jan 2024 06:58:05 -0800 (PST)
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
X-Kernelci-Kernel: next-20240110
X-Kernelci-Report-Type: test
Subject: next/master baseline: 310 runs, 33 regressions (next-20240110)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 310 runs, 33 regressions (next-20240110)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
at91sam9g20ek               | arm   | lab-broonie   | gcc-10   | multi_v5_d=
efconfig           | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | bcm2835_de=
fconfig            | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

beagle-xm                   | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

beaglebone-black            | arm   | lab-cip       | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                  | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig =
                   | 5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig =
                   | 2          =

mt8192-asurada-spherion-r0  | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

mt8195-cherry-tomato-r2     | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

r8a7743-iwg20d-q7           | arm   | lab-cip       | gcc-10   | shmobile_d=
efconfig           | 1          =

rk3288-rock2-square         | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq           | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq           | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240110/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240110
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8cb47d7cd090a690c1785385b2f3d407d4a53ad0 =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
at91sam9g20ek               | arm   | lab-broonie   | gcc-10   | multi_v5_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659e6df711a26102df52a450

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/659e6df711a26102df52a46f
        failing since 219 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-10T10:13:50.608790  /lava-442782/1/../bin/lava-test-case
    2024-01-10T10:13:50.650790  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | bcm2835_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/659e6e3664151fd45352a3f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e6e3664151fd45352a=
3f3
        failing since 219 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7c21a5c4f9cac052a4f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e7c21a5c4f9cac052a=
4f1
        failing since 287 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
beagle-xm                   | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7c5c34251339cd52a428

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e7c5c34251339cd52a=
429
        failing since 285 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
beaglebone-black            | arm   | lab-cip       | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659e8489a1765846fe52a4b3

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/659e8489a1765846=
fe52a4b8
        failing since 1 day (last pass: next-20240108, first fail: next-202=
40109)
        1 lines

    2024-01-10T11:49:57.406223  / # =

    2024-01-10T11:49:57.418292  =

    2024-01-10T11:49:57.520069  / # #
    2024-01-10T11:49:57.530237  #
    2024-01-10T11:49:57.631225  / # export SHELL=3D/bin/sh
    2024-01-10T11:49:57.642205  export SHELL=3D/bin/sh
    2024-01-10T11:49:57.743133  / # . /lava-1073144/environment
    2024-01-10T11:49:57.754099  . /lava-1073144/environment
    2024-01-10T11:49:57.854908  / # /lava-1073144/bin/lava-test-runner /lav=
a-1073144/0
    2024-01-10T11:49:57.866079  /lava-1073144/bin/lava-test-runner /lava-10=
73144/0 =

    ... (9 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
jetson-tk1                  | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7680464df217f452a42e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e7680464df217f452a=
42f
        failing since 638 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/659e7358e13ef5ea1052a478

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e7358e13ef5ea1052a47f
        failing since 28 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-10T10:36:54.626121  / # #
    2024-01-10T10:36:54.728235  export SHELL=3D/bin/sh
    2024-01-10T10:36:54.728548  #
    2024-01-10T10:36:54.829473  / # export SHELL=3D/bin/sh. /lava-415477/en=
vironment
    2024-01-10T10:36:54.830252  =

    2024-01-10T10:36:54.931670  / # . /lava-415477/environment/lava-415477/=
bin/lava-test-runner /lava-415477/1
    2024-01-10T10:36:54.932814  =

    2024-01-10T10:36:54.940694  / # /lava-415477/bin/lava-test-runner /lava=
-415477/1
    2024-01-10T10:36:55.038531  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-10T10:36:55.038922  + cd /lava-415477/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659e7358e13ef5ea1052a483
        failing since 28 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-10T10:36:57.253722  /lava-415477/1/../bin/lava-test-case
    2024-01-10T10:36:57.280750  <8>[   26.082069] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9e7358e13ef5ea1052a485
        failing since 28 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-10T10:36:58.342261  /lava-415477/1/../bin/lava-test-case
    2024-01-10T10:36:58.368811  <8>[   27.170478] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659e7358e13ef5ea1052a48a
        failing since 28 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-10T10:36:59.602631  /lava-415477/1/../bin/lava-test-case
    2024-01-10T10:36:59.629686  <8>[   28.430828] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659e7358e13ef5ea1052a48b
        failing since 28 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-10T10:37:00.653140  /lava-415477/1/../bin/lava-test-case
    2024-01-10T10:37:00.679136  <8>[   29.480760] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig =
                   | 5          =


  Details:     https://kernelci.org/test/plan/id/659e795d1be3ea035652a3f6

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e795d1be3ea035652a3fd
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-10T11:02:30.535325  / # #
    2024-01-10T11:02:30.636182  export SHELL=3D/bin/sh
    2024-01-10T11:02:30.636450  #
    2024-01-10T11:02:30.737019  / # export SHELL=3D/bin/sh. /lava-415492/en=
vironment
    2024-01-10T11:02:30.737240  =

    2024-01-10T11:02:30.837791  / # . /lava-415492/environment/lava-415492/=
bin/lava-test-runner /lava-415492/1
    2024-01-10T11:02:30.838151  =

    2024-01-10T11:02:30.846611  / # /lava-415492/bin/lava-test-runner /lava=
-415492/1
    2024-01-10T11:02:30.943437  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-10T11:02:30.943808  + cd /lava-415492/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659e795d1be3ea035652a401
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-10T11:02:33.157118  /lava-415492/1/../bin/lava-test-case
    2024-01-10T11:02:33.185183  <8>[   26.153748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9e795d1be3ea035652a403
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-10T11:02:34.245479  /lava-415492/1/../bin/lava-test-case
    2024-01-10T11:02:34.272272  <8>[   27.241680] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659e795d1be3ea035652a408
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-10T11:02:35.504755  /lava-415492/1/../bin/lava-test-case
    2024-01-10T11:02:35.532749  <8>[   28.501972] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659e795d1be3ea035652a409
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-10T11:02:36.554517  /lava-415492/1/../bin/lava-test-case
    2024-01-10T11:02:36.584512  <8>[   29.553254] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/659e7356e13ef5ea1052a407

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e7356e13ef5ea1052a40e
        failing since 28 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-10T10:36:48.762813  / # #
    2024-01-10T10:36:48.863570  export SHELL=3D/bin/sh
    2024-01-10T10:36:48.863822  #
    2024-01-10T10:36:48.964597  / # export SHELL=3D/bin/sh. /lava-415474/en=
vironment
    2024-01-10T10:36:48.965329  =

    2024-01-10T10:36:49.066736  / # . /lava-415474/environment/lava-415474/=
bin/lava-test-runner /lava-415474/1
    2024-01-10T10:36:49.067712  =

    2024-01-10T10:36:49.074657  / # /lava-415474/bin/lava-test-runner /lava=
-415474/1
    2024-01-10T10:36:49.138608  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-10T10:36:49.172598  + cd /lava-415474/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659e7356e13ef5ea1052a421
        failing since 28 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-10T10:36:52.105728  /lava-415474/1/../bin/lava-test-case
    2024-01-10T10:36:52.133655  <8>[   27.126739] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/659e795bac0ce8fb1952a420

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e795bac0ce8fb1952a427
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-10T11:02:26.893958  / # #
    2024-01-10T11:02:26.995955  export SHELL=3D/bin/sh
    2024-01-10T11:02:26.996710  #
    2024-01-10T11:02:27.098297  / # export SHELL=3D/bin/sh. /lava-415491/en=
vironment
    2024-01-10T11:02:27.099016  =

    2024-01-10T11:02:27.200274  / # . /lava-415491/environment/lava-415491/=
bin/lava-test-runner /lava-415491/1
    2024-01-10T11:02:27.201446  =

    2024-01-10T11:02:27.205644  / # /lava-415491/bin/lava-test-runner /lava=
-415491/1
    2024-01-10T11:02:27.309536  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-10T11:02:27.310012  + cd /lava-415491/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659e795bac0ce8fb1952a43a
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-10T11:02:30.239129  /lava-415491/1/../bin/lava-test-case
    2024-01-10T11:02:30.267277  <8>[   27.177576] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
mt8192-asurada-spherion-r0  | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7271393ca0fd5152a3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e7271393ca0fd5152a=
3f9
        failing since 20 days (last pass: next-20231215, first fail: next-2=
0231220) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
mt8195-cherry-tomato-r2     | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7282393ca0fd5152a415

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e7282393ca0fd5152a=
416
        new failure (last pass: next-20240109) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7           | arm   | lab-cip       | gcc-10   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659e76b1cd62fe025e52a3f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e76b1cd62fe025e52a=
3f5
        failing since 19 days (last pass: next-20231220, first fail: next-2=
0231221) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
rk3288-rock2-square         | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7783cf511e380d52a3fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e7783cf511e380d52a=
3fd
        failing since 414 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
rk3288-veyron-jaq           | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7680c210340a4c52a405

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e7680c210340a4c52a=
406
        failing since 414 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
rk3288-veyron-jaq           | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7bbea2aa48588052a3fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e7bbea2aa48588052a=
3fd
        new failure (last pass: next-20240109) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659e743826aef7bea652a541

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659e743826aef7bea652a=
542
        new failure (last pass: next-20240109) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7a622fce943b2552a3fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e7a622fce943b2552a403
        failing since 217 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-10T11:07:01.893827  =

    2024-01-10T11:07:01.994682  / # #export SHELL=3D/bin/sh
    2024-01-10T11:07:01.995185  =

    2024-01-10T11:07:02.096032  / # expor. /lava-3905642/environment
    2024-01-10T11:07:02.097076  t SHELL=3D/bin/sh
    2024-01-10T11:07:02.197839  / # . /lava-3905642/environment/lava-390564=
2/bin/lava-test-runner /lava-3905642/1
    2024-01-10T11:07:02.198448  =

    2024-01-10T11:07:02.239969  / # /lava-3905642/bin/lava-test-runner /lav=
a-3905642/1
    2024-01-10T11:07:02.334439  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-10T11:07:02.334884  + cd /lava-3905642/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7bab2b983b4e1552a415

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e7bab2b983b4e1552a41e
        failing since 217 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-10T11:12:23.597839  <8>[   13.048831] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2024-01-10T11:12:23.598452  + set +x
    2024-01-10T11:12:23.599117  <8>[   13.059604] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3905648_1.5.2.4.1>
    2024-01-10T11:12:23.710605  / # #
    2024-01-10T11:12:23.822625  export SHELL=3D/bin/sh
    2024-01-10T11:12:23.823493  #
    2024-01-10T11:12:23.924778  / # export SHELL=3D/bin/sh. /lava-3905648/e=
nvironment
    2024-01-10T11:12:23.925596  =

    2024-01-10T11:12:24.027088  / # . /lava-3905648/environment/lava-390564=
8/bin/lava-test-runner /lava-3905648/1
    2024-01-10T11:12:24.027595   =

    ... (13 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7e4f7c6198631852a75f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e7e4f7c6198631852a768
        failing since 223 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-10T11:23:36.153370  <8>[   15.638894] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2024-01-10T11:23:36.153632  + set +x
    2024-01-10T11:23:36.153873  <8>[   15.649291] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3905682_1.5.2.4.1>
    2024-01-10T11:23:36.258375  / # #
    2024-01-10T11:23:36.359625  export SHELL=3D/bin/sh
    2024-01-10T11:23:36.360040  #
    2024-01-10T11:23:36.460854  / # export SHELL=3D/bin/sh. /lava-3905682/e=
nvironment
    2024-01-10T11:23:36.461702  =

    2024-01-10T11:23:36.563115  / # . /lava-3905682/environment/lava-390568=
2/bin/lava-test-runner /lava-3905682/1
    2024-01-10T11:23:36.564799   =

    ... (13 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7a65ebf5c5680552a4a8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e7a65ebf5c5680552a4b1
        failing since 217 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-10T11:06:59.180381  + set +x
    2024-01-10T11:06:59.182107  [   21.057089] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451728_1.5.2.4.1>
    2024-01-10T11:06:59.291461  / # #
    2024-01-10T11:06:59.393344  export SHELL=3D/bin/sh
    2024-01-10T11:06:59.393987  #
    2024-01-10T11:06:59.494993  / # export SHELL=3D/bin/sh. /lava-451728/en=
vironment
    2024-01-10T11:06:59.495566  =

    2024-01-10T11:06:59.596588  / # . /lava-451728/environment/lava-451728/=
bin/lava-test-runner /lava-451728/1
    2024-01-10T11:06:59.597493  =

    2024-01-10T11:06:59.599899  / # /lava-451728/bin/lava-test-runner /lava=
-451728/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7ba5d16659b8ca52a40f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e7ba5d16659b8ca52a418
        failing since 217 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-10T11:12:23.427342  + set +x
    2024-01-10T11:12:23.429113  [   19.226454] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451731_1.5.2.4.1>
    2024-01-10T11:12:23.537811  / # #
    2024-01-10T11:12:23.639460  export SHELL=3D/bin/sh
    2024-01-10T11:12:23.640081  #
    2024-01-10T11:12:23.741149  / # export SHELL=3D/bin/sh. /lava-451731/en=
vironment
    2024-01-10T11:12:23.741808  =

    2024-01-10T11:12:23.842903  / # . /lava-451731/environment/lava-451731/=
bin/lava-test-runner /lava-451731/1
    2024-01-10T11:12:23.843887  =

    2024-01-10T11:12:23.849020  / # /lava-451731/bin/lava-test-runner /lava=
-451731/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659e7e4d7c6198631852a754

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240110/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659e7e4d7c6198631852a75d
        failing since 223 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-10T11:23:26.781736  + set +x
    2024-01-10T11:23:26.783530  [   22.768205] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451736_1.5.2.4.1>
    2024-01-10T11:23:26.891359  / # #
    2024-01-10T11:23:26.993088  export SHELL=3D/bin/sh
    2024-01-10T11:23:26.993654  #
    2024-01-10T11:23:27.094692  / # export SHELL=3D/bin/sh. /lava-451736/en=
vironment
    2024-01-10T11:23:27.095305  =

    2024-01-10T11:23:27.196365  / # . /lava-451736/environment/lava-451736/=
bin/lava-test-runner /lava-451736/1
    2024-01-10T11:23:27.197260  =

    2024-01-10T11:23:27.199592  / # /lava-451736/bin/lava-test-runner /lava=
-451736/1 =

    ... (12 line(s) more)  =

 =20

