Return-Path: <linux-next+bounces-268-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788A80855B
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 11:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CBC01C21699
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 10:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFDF358AC;
	Thu,  7 Dec 2023 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CN/xmrru"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B6EB132
	for <linux-next@vger.kernel.org>; Thu,  7 Dec 2023 02:24:33 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d0c4d84bf6so5187735ad.1
        for <linux-next@vger.kernel.org>; Thu, 07 Dec 2023 02:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701944672; x=1702549472; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w361YbtVTifrxdJgPFVFCH7hpXUadPGruKAsQmOs11g=;
        b=CN/xmrruBRnWkO3/fW7NlKSUbPUB+wvcts6GgcEFaFZvk8VPJSkYIgbjveZXamRr13
         0pelqNrxkaoZPkGxBdLyW7l76thwIxafmiOkUXemtxlPbx3eElQAEU7Nc1luWQWPpeC4
         xeVwcgKKHlEjKoxSvxWYeBZVYX3dTHhlv1T4aTAA8jFIx5hvfykn6HL6jj+slOp+sOVi
         M2hHNYvWUzGQ8SkZrrBZo1lPW/L/HY1CPOfC7cykZRJYH/+1foOB67mTUBArk1sYdBmB
         V7hq+itUXOGkSB19S7il0mFfxoxQ6S7k+eUf0r5EhZeT6uU8YgSR/T10qP3JJiyHUY3M
         g5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701944672; x=1702549472;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w361YbtVTifrxdJgPFVFCH7hpXUadPGruKAsQmOs11g=;
        b=ixFGPb/mFSCg3m2Mb0cOX/fjFPll0mrrteK/wXjyoS2wiiUBUTK2DcUkhQoX+eky3z
         pOeH5MoQ/tOdF3Yxanl5Is9ibbn2WJHBpSOmotk7tvFyK2TmoDHiRxY1M7lsVcgCgzeA
         Nfu9avlCFGYFLAqRwZebW1yzc4gdEzofvOmmB4QUr8+JuODgc/lZQUOQp9npm4i/E7EK
         YUBGuWlF4kf0C9CQ2JASLfh6y2GPdu+T1BmsXP/+FoUn/EbYJF37d6I07fhuV11G03rF
         scfPi/R3Ok2NFGUq7a+Zxal1WHI9mClqqrOEWcpg6/aJqaSmLgQGBpQ/dixMR6wuNW7z
         nwbA==
X-Gm-Message-State: AOJu0Yw6WtMVISRGqmzJKURtlXyWRAo4ywoW6G+62K+ohEf6MLBrX52+
	X+VxSuQKaypw6tqA1NiQ9zVKj3w3R+jE1a39zIsUbw==
X-Google-Smtp-Source: AGHT+IF8mWb78C9t+NAl7n0Y0XEymGSqCJ4hB4SwmBWkXXS9HeLlth2tNiQ50oQwB2IQivgyNgnKzg==
X-Received: by 2002:a17:903:22cd:b0:1d0:af63:23f8 with SMTP id y13-20020a17090322cd00b001d0af6323f8mr2254197plg.11.1701944671022;
        Thu, 07 Dec 2023 02:24:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j9-20020a17090276c900b001cfc6838e30sm1017936plt.308.2023.12.07.02.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 02:24:30 -0800 (PST)
Message-ID: <65719d5e.170a0220.14ce0.218f@mx.google.com>
Date: Thu, 07 Dec 2023 02:24:30 -0800 (PST)
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
X-Kernelci-Kernel: next-20231207
Subject: next/master baseline: 448 runs, 80 regressions (next-20231207)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 448 runs, 80 regressions (next-20231207)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =

at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =

bcm2711-rpi-4-b              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

bcm2711-rpi-4-b              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+videodec           | 2          =

bcm2711-rpi-4-b              | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 2          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | clang-17 | multi_v=
7_defconfig           | 2          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 2          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

imx6dl-udoo                  | arm   | lab-broonie     | clang-17 | multi_v=
7_defconfig           | 2          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 2          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 4          =

imx6q-udoo                   | arm   | lab-broonie     | clang-17 | multi_v=
7_defconfig           | 2          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 2          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 3          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | clang-17 | multi_v=
7_defconfig           | 2          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 2          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 3          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =

k3-j721e-beagleboneai64      | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =

k3-j721e-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

k3-j721e-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 2          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 3          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231207/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231207
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8e00ce02066e8f6f1ad5eab49a2ede7bf7a5ef64 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/657165b7ac55cd1d67e13483

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657165b7ac55cd1d67e13=
484
        failing since 309 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65716856639e241460e134a1

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65716856639e241460e134bd
        failing since 185 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-07T06:38:06.299942  /lava-317587/1/../bin/lava-test-case
    2023-12-07T06:38:06.341349  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65716d5336b4d97a7be1352a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-bcm271=
1-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-bcm271=
1-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65716d5336b4d97=
a7be13531
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        2 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65716d5336b4d97=
a7be13532
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        13 lines

    2023-12-07T06:59:13.700748  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   44.821946] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>

    2023-12-07T06:59:13.701257  at virtual address 0000000000000020

    2023-12-07T06:59:13.701544  kern  :alert : Mem abort info:

    2023-12-07T06:59:13.701785  kern  :alert :   ESR =3D 0x0000000096000007

    2023-12-07T06:59:13.702015  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 b<8>[   44.846012] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Deme=
rg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-12-07T06:59:13.702250  its

    2023-12-07T06:59:13.702476  ker<8>[   44.855521] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 12205340_1.5.2.4.1>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65716dd306f07f8349e137b1

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65716dd306f07f8=
349e137b8
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        2 lines

    2023-12-07T07:05:49.487616  kern  :alert : Mem abort info:

    2023-12-07T07:05:49.488118  kern  :alert :   ESR =3D 0x0000000096000006

    2023-12-07T07:05:49.488412  kern  :alert :   EC =3D 0x25: DABT<8>[   44=
.853661] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dl=
ines MEASUREMENT=3D2>

    2023-12-07T07:05:49.488644   (current EL), I<8>[   44.863440] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 12205438_1.5.2.4.1>

    2023-12-07T07:05:49.488858  L =3D 32 bits

    2023-12-07T07:05:49.489064  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-12-07T07:05:49.489271  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-12-07T07:05:49.489477  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-12-07T07:05:49.489710  kern  :alert : Data abort info:
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65716dd306f07f8=
349e137b9
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        13 lines =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65716df3830f809ef9e134ab

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65716df3830f809=
ef9e134b2
        failing since 1 day (last pass: next-20231129, first fail: next-202=
31205)
        2 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65716df3830f809=
ef9e134b3
        failing since 1 day (last pass: next-20231129, first fail: next-202=
31205)
        13 lines

    2023-12-07T07:01:53.706937  kern  :alert : Unable to handle kernel NULL=
 pointer dere<8>[   44.841258] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>

    2023-12-07T07:01:53.707431  ference at virtual address 0000000000000020

    2023-12-07T07:01:53.707715  kern  :alert : Mem abort info:

    2023-12-07T07:01:53.707992  kern  :alert :   ESR =3D 0x0000000096000006

    2023-12-07T07:01:53.708231  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), I<8>[   44.864730] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-12-07T07:01:53.708464  L =3D 32 bits
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6571615fb402e03037e1347d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6571615fb402e03037e13=
47e
        failing since 185 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657163561fb91f89eee134b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657163561fb91f89eee13=
4b2
        failing since 253 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6571636639593bfc22e13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6571636639593bfc22e13=
477
        failing since 251 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6571637a39593bfc22e13492

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6571637a39593bfc22e13=
493
        new failure (last pass: next-20231206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | clang-17 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6571665e2e4b58c23ce13475

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6571665e2e4b58c=
23ce1347c
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        75 lines

    2023-12-07T06:29:29.015789  kern  :alert : Register r0 information: NUL=
L pointer
    2023-12-07T06:29:29.015937  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-07T06:29:29.024659  kern  :alert : Register r2 information: NUL=
L pointer
    2023-12-07T06:29:29.024790  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:29:29.033699  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3073e40 pointer offset 64 size 192
    2023-12-07T06:29:29.042704  kern  :alert : Register r5 information: sla=
b dentry start c2e4c880 pointer offset 0 size 136
    2023-12-07T06:29:29.051750  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c30ea400 pointer offset 0 size 64
    2023-12-07T06:29:29.060896  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf025000 allocated at load_module+0xe78/0x=
1a24
    2023-12-07T06:29:29.070059  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c30ea400 pointer offset 0 size 64
    2023-12-07T06:29:29.078841  kern  :alert : Register r9 information: sla=
b kmalloc-128 start c275d200 pointer offset 80 size 128 =

    ... (41 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6571665e2e4b58c=
23ce1347d
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:29:28.988608  kern  :alert : 8<--- cut here ---
    2023-12-07T06:29:28.997546  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-07T06:29:29.006653  kern  :alert : [000[   16.537029] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-07T06:29:29.006807  00010] *pgd=3D4b276831   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/657161afa1b0dfb32ae1349b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657161afa1b0dfb=
32ae134a2
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-07T06:09:30.274981  kern  :alert : Register r0 information: sla=
b dentry start c2e45d48 pointer offset 0 size 136
    2023-12-07T06:09:30.283754  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-07T06:09:30.283935  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-12-07T06:09:30.293029  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:09:30.302088  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3073c00 pointer offset 64 size 192
    2023-12-07T06:09:30.310827  kern  :alert : Register r5 information: sla=
b dentry start c2e19f68 pointer offset 0 size 136
    2023-12-07T06:09:30.320057  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c30f5380 pointer offset 0 size 64
    2023-12-07T06:09:30.329092  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6d4/0x=
1adc
    2023-12-07T06:09:30.338148  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c30f5380 pointer offset 0 size 64
    2023-12-07T06:09:30.338512  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (41 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657161afa1b0dfb=
32ae134a3
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:09:30.248073  kern  :alert : 8<--- cut here ---
    2023-12-07T06:09:30.256695  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-07T06:09:30.265919  kern  :alert : [000[   16.055368] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-07T06:09:30.266147  00010] *pgd=3D4b26b831   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6571628a8c82be193ae134f2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6571628a8c82be1=
93ae134f9
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        56 lines

    2023-12-07T06:13:07.533454  kern  :alert : Register r0 information: sla=
b dentry start c2e46198 pointer offset 0 size 136
    2023-12-07T06:13:07.542377  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-07T06:13:07.542664  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-12-07T06:13:07.551422  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:13:07.560488  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3076c00 pointer offset 64 size 192
    2023-12-07T06:13:07.569535  kern  :alert : Register r5 information: sla=
b dentry start c2df0198 pointer offset 0 size 136
    2023-12-07T06:13:07.578351  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c311eb80 pointer offset 0 size 64
    2023-12-07T06:13:07.587433  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf81f000 allocated at load_module+0x4e1/0x=
1434
    2023-12-07T06:13:07.587605  kern  :alert : Register r8 information: NUL=
L pointer
    2023-12-07T06:13:07.596778  kern  :alert : Register r9 information: sla=
b kmalloc-128 start c3191d80 pointer offset 64 size 128 =

    ... (40 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6571628a8c82be1=
93ae134fa
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:13:07.506417  kern  :alert : 8<--- cut here ---
    2023-12-07T06:13:07.515505  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-07T06:13:07.524407  kern  :alert : [000[   16.039931] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-07T06:13:07.524660  00010] *pgd=3D4b272831   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6571660e95ea8e9e1ae13489

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6571660e95ea8e9=
e1ae13490
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-07T06:28:16.259428  kern  :alert : Register r0 information: sla=
b dentry start c287b088 pointer offset 0 size 136
    2023-12-07T06:28:16.268442  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-07T06:28:16.268597  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-07T06:28:16.277395  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:28:16.286392  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c305ed80 pointer offset 64 size 192
    2023-12-07T06:28:16.295382  kern  :alert : Register r5 information: sla=
b dentry start c287b110 pointer offset 0 size 136
    2023-12-07T06:28:16.295537  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c3086c40 pointer offset 0 size 64
    2023-12-07T06:28:16.313672  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-07T06:28:16.322384  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c3086c40 pointer offset 0 size 64
    2023-12-07T06:28:16.322556  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (40 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6571660e95ea8e9=
e1ae13491
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:28:16.232276  kern  :alert : 8<--- cut here ---
    2023-12-07T06:28:16.250148  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010[   15.621652] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-07T06:28:16.250343   when read
    2023-12-07T06:28:16.250457  kern  :alert : [00000010] *pgd=3D4b24e831   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | clang-17 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/657167f86903cae26fe13478

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657167f86903cae=
26fe1349a
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        75 lines

    2023-12-07T06:36:20.198660  kern  :alert : [000<8>[   21.766241] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-07T06:36:20.198821  00010] *pgd=3D48fd1831
    2023-12-07T06:36:20.199113  kern  :alert : Register r0 information: NUL=
L pointer
    2023-12-07T06:36:20.199184  kern  :alert : Register r1 information: vma=
lloc memory
    2023-12-07T06:36:20.199248  kern  :alert : Register r2 information: NUL=
L pointer
    2023-12-07T06:36:20.199317  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:36:20.220776  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4ac5cc0 pointer offset 64 size 192
    2023-12-07T06:36:20.221335  kern  :alert : Register r5 information: sla=
b dentry start c2ecd3b8 pointer offset 0 size 136
    2023-12-07T06:36:20.242739  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c40e2680 pointer offset 0 size 64
    2023-12-07T06:36:20.243051  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf042000 allocated at load_module+0xe78/0x=
1a24 =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657167f86903cae=
26fe1349b
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:36:20.176594  kern  :alert : 8<--- cut here ---
    2023-12-07T06:36:20.176972  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/657161bba1b0dfb32ae134a9

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657161bba1b0dfb=
32ae134cb
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-07T06:09:41.878600  kern  :emerg :  drm_debugfs_encoder_add fro=
m drm_encoder_register_all+0x20/0x60
    2023-12-07T06:09:41.878829  kern  :emerg :  drm_encoder_register_all fr=
om drm_modeset_register_all+0x34/0x70
    2023-12-07T06:09:41.878972  kern  :emerg :  drm_modeset_register_all fr=
om drm_dev_register+0x24c/0x28c
    2023-12-07T06:09:41.879163  kern  :emerg :  drm_dev_register from imx_d=
rm_bind+0xd4/0x128 [imxdrm]
    2023-12-07T06:09:41.879347  kern  :emerg :  imx_drm_bind [imxdrm] from =
try_to_bring_up_aggregate_device+0x160/0x1bc
    2023-12-07T06:09:41.879516  kern  :emerg :  try_to_bring_up_aggregate_d=
evice from __component_add+0x98/0x13c
    2023-12-07T06:09:41.879684  kern  :emerg :  __component_add from dw_hdm=
i_imx_probe+0x9c/0x100 [dw_hdmi_imx]
    2023-12-07T06:09:41.879852  kern  :emerg :  dw_hdmi_imx_probe [dw_hdmi_=
imx] from platform_probe+0x5c/0xb8
    2023-12-07T06:09:41.880018  kern  :emerg :  platform_probe from really<=
8>[   23.193824] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D55>
    2023-12-07T06:09:41.880184  _probe+0xc8/0x2d8   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657161bba1b0dfb=
32ae134cc
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:09:41.869865  kern  :alert : 8<--- cut here ---
    2023-12-07T06:09:41.870096  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-07T06:09:41.870275  kern  :alert : [000<8>[   22.795767] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-07T06:09:41.870413  00010] *pgd=3D48c4a831
    2023-12-07T06:09:41.870599  kern  :alert : Register r0 information: sla=
b dentry start c2b03990 pointer offset 0 size 136
    2023-12-07T06:09:41.870732  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-07T06:09:41.870881  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-07T06:09:41.871061  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:09:41.871191  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4df7780 pointer offset 64 size 192
    2023-12-07T06:09:41.871377  kern  :alert : Register r5 information: sla=
b dentry start c2b03660 pointer offset 0 size 136 =

    ... (37 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6571633a8854c1a2cfe1349b

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6571633a8854c1a=
2cfe134bd
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        56 lines

    2023-12-07T06:15:55.317074  kern  :alert : [000<8>[   18.201198] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-07T06:15:55.317428  00010] *pgd=3D48b0f831
    2023-12-07T06:15:55.317941  kern  :alert : Register r0 information: sla=
b dentry start c2cb7330 pointer offset 0 size 136
    2023-12-07T06:15:55.318186  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-07T06:15:55.318407  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-07T06:15:55.340098  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:15:55.340422  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4b0e6c0 pointer offset 64 size 192
    2023-12-07T06:15:55.340901  kern  :alert : Register r5 information: sla=
b dentry start c2cb7198 pointer offset 0 size 136
    2023-12-07T06:15:55.362542  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4b57880 pointer offset 0 size 64
    2023-12-07T06:15:55.362894  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf833000 allocated at load_module+0x4e1/0x=
1434 =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6571633a8854c1a=
2cfe134be
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:15:55.295455  kern  :alert : 8<--- cut here ---
    2023-12-07T06:15:55.295880  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 4          =


  Details:     https://kernelci.org/test/plan/id/65716794ce7e49418ee13492

  Results:     27 PASS, 6 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6dl-udoo.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6dl-udoo.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65716794c=
e7e49418ee1349b
        new failure (last pass: next-20231206)

    2023-12-07T06:34:47.565946  /lava-317510/1/../bin/lava-test-case
    2023-12-07T06:34:47.589841  <8>[   29.434808] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
716794ce7e49418ee1349c
        new failure (last pass: next-20231206)

    2023-12-07T06:34:46.522925  /lava-317510/1/../bin/lava-test-case
    2023-12-07T06:34:46.548272  <8>[   28.392712] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65716794ce7e494=
18ee134b4
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-07T06:34:43.856009  kern  :alert : [00000010] *pgd=3D48d9d831
    2023-12-07T06:34:43.856441  kern  :alert : Register r0 information: sla=
b dentry start c2870330 pointer offset 0 size 136
    2023-12-07T06:34:43.856627  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-07T06:34:43.856793  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-12-07T06:34:43.877990  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:34:43.878458  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4b3dc00 pointer offset 64 size 192
    2023-12-07T06:34:43.878647  kern  :alert : Register r5 information: sla=
b dentry start c28703b8 pointer offset 0 size 136
    2023-12-07T06:34:43.900096  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4b7dcc0 pointer offset 0 size 64
    2023-12-07T06:34:43.900482  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-07T06:34:43.922007  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c4b7dcc0 pointer offset 0 size 64 =

    ... (41 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65716794ce7e494=
18ee134b5
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:34:43.833062  kern  :alert : 8<--- cut here ---
    2023-12-07T06:34:43.833526  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010<8>[   25.674894] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-07T06:34:43.833723   when read   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | clang-17 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6571671ccd339c87d2e134c0

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6571671ccd339c8=
7d2e134e2
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        75 lines

    2023-12-07T06:32:36.789823  kern  :alert : Register r1 information: vma=
lloc memory
    2023-12-07T06:32:36.790081  kern  :alert : Register r2 information: NUL=
L pointer
    2023-12-07T06:32:36.790296  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:32:36.810235  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4c7dd80 pointer offset 64 size 192
    2023-12-07T06:32:36.810873  kern  :alert : Register r5 information: sla=
b dentry start c2d00220 pointer offset 0 size 136
    2023-12-07T06:32:36.832159  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4bb7480 pointer offset 0 size 64
    2023-12-07T06:32:36.832561  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf039000 allocated at load_module+0xe78/0x=
1a24
    2023-12-07T06:32:36.832760  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c4bb7480 pointer offset 0 size 64
    2023-12-07T06:32:36.854056  kern  :alert : Register r9 information: sla=
b kmalloc-192 start c4975d80 pointer offset 176 size 192
    2023-12-07T06:32:36.854684  kern  :alert : Register r10 information: sl=
ab kmalloc-192 start c4975d80 pointer offset 172 size 192 =

    ... (40 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6571671ccd339c8=
7d2e134e3
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:32:36.765380  kern  :alert : 8<--- cut here ---
    2023-12-07T06:32:36.765824  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-07T06:32:36.766025  kern  :alert : [00000010] *pgd=3D48220831
    2023-12-07T06:32:36.788121  kern  :al<8>[   25.139345] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-07T06:32:36.788535  ert : Register r0 information: NULL pointer=
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/657161b995f4b57fa8e13482

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657161b995f4b57=
fa8e134a4
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-07T06:09:41.879733  kern  :emerg :  drm_debugfs_encoder_add fro=
m drm_encoder_register_all+0x20/0x60
    2023-12-07T06:09:41.879971  kern  :emerg :  drm_encoder_register_all fr=
om drm_modeset_register_all+0x34/0x70
    2023-12-07T06:09:41.880153  kern  :emerg :  drm_modeset_register_all fr=
om drm_dev_register+0x24c/0x28c
    2023-12-07T06:09:41.880337  kern  :emerg :  drm_dev_register from imx_d=
rm_bind+0xd4/0x128 [imxdrm]
    2023-12-07T06:09:41.880498  kern  :emerg :  imx_drm_bind [imxdrm] from =
try_to_bring_up_aggregate_device+0x160/0x1bc
    2023-12-07T06:09:41.880686  kern  :emerg :  try_to_bring_up_aggregate_d=
evice from __component_add+0x98/0x13c
    2023-12-07T06:09:41.880857  kern  :emerg :  __component_add from dw_hdm=
i_imx_probe+0x9c/0x100 [dw_hdmi_imx]
    2023-12-07T06:09:41.881037  kern  :emerg :  dw_hdmi_imx_probe [dw_hdmi_=
imx] from platform_probe+0x5c/0xb8
    2023-12-07T06:09:41.881217  kern  :eme<8>[   20.310051] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D55>
    2023-12-07T06:09:41.881397  rg :  platform_probe from really_<8>[   20.=
322706] <LAVA_SIGNAL_ENDRUN 0_dmesg 317408_1.5.2.4.1> =

    ... (18 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657161b995f4b57=
fa8e134a5
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:09:41.869941  kern  :alert : 8<--- cut here ---
    2023-12-07T06:09:41.870213  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-07T06:09:41.870402  kern  :alert : [000<8>[   19.918508] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-07T06:09:41.870596  00010] *pgd=3D48e02831
    2023-12-07T06:09:41.870766  kern  :alert : Register r0 information: sla=
b dentry start c2cc3088 pointer offset 0 size 136
    2023-12-07T06:09:41.870958  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-07T06:09:41.871134  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-07T06:09:41.871320  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:09:41.871496  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c24b3a80 pointer offset 64 size 192
    2023-12-07T06:09:41.871677  kern  :alert : Register r5 information: sla=
b dentry start c2cc3110 pointer offset 0 size 136 =

    ... (37 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/657163bccec081ba22e13479

  Results:     28 PASS, 5 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.gpu1-probed: https://kernelci.org/test/case/id/657163bc=
cec081ba22e1347c
        new failure (last pass: next-20231206)

    2023-12-07T06:18:14.747649  /lava-317436/1/../bin/lava-test-case
    2023-12-07T06:18:14.774194  <8>[   52.822750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dgpu1-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657163bccec081b=
a22e1349b
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        56 lines

    2023-12-07T06:18:10.535614  kern  :alert : [000<8>[   48.562184] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-07T06:18:10.535979  00010] *pgd=3D4898f831
    2023-12-07T06:18:10.536180  kern  :alert : Register r0 information: sla=
b dentry start c2976550
    2023-12-07T06:18:10.536595  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-07T06:18:10.536768  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-07T06:18:10.557652  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:18:10.558002  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c31a4540 pointer offset 64 size 192
    2023-12-07T06:18:10.558443  kern  :alert : Register r5 information: sla=
b dentry start c29764c8 pointer offset 0 size 136
    2023-12-07T06:18:10.579634  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4efc440 pointer offset 0 size 64
    2023-12-07T06:18:10.580351  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf833000 allocated at load_module+0x4e1/0x=
1434 =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657163bccec081b=
a22e1349c
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:18:10.513825  kern  :alert : 8<--- cut here ---
    2023-12-07T06:18:10.514217  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/657166a2b1d99f8c42e13476

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6q-udoo.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657166a2b1d99f8=
c42e13498
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-07T06:30:28.000083  kern  :alert : [00000010] *pgd=3D48d88831
    2023-12-07T06:30:28.000407  kern  :alert : Register r0 information: sla=
b dentry start c2e5c550 pointer offset 0 size 136
    2023-12-07T06:30:28.000784  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-07T06:30:28.000924  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-12-07T06:30:28.022256  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:30:28.022728  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c2480540 pointer offset 64 size 192
    2023-12-07T06:30:28.023172  kern  :alert : Register r5 information: sla=
b dentry start c2e5c4c8 pointer offset 0 size 136
    2023-12-07T06:30:28.044491  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4c80000 pointer offset 0 size 64
    2023-12-07T06:30:28.044831  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-07T06:30:28.066179  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c4c80000 pointer offset 0 size 64 =

    ... (40 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657166a2b1d99f8=
c42e13499
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:30:27.977171  kern  :alert : 8<--- cut here ---
    2023-12-07T06:30:27.977736  kern  :alert : Unable to handle kernel NULL=
 pointer derefere<8>[   25.070999] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-07T06:30:27.977933  nce at virtual address 00000010 when read   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | clang-17 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6571665f2e4b58c23ce13480

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6571665f2e4b58c=
23ce13487
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        75 lines

    2023-12-07T06:29:44.630411  ert : Register r0 information: NULL pointer
    2023-12-07T06:29:44.630561  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-07T06:29:44.639250  kern  :alert : Register r2 information: NUL=
L pointer
    2023-12-07T06:29:44.639397  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:29:44.648423  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3405180 pointer offset 64 size 192
    2023-12-07T06:29:44.657348  kern  :alert : Register r5 information: sla=
b dentry start c2808550 pointer offset 0 size 136
    2023-12-07T06:29:44.666513  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c242ea40 pointer offset 0 size 64
    2023-12-07T06:29:44.675413  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf040000 allocated at load_module+0xe78/0x=
1a24
    2023-12-07T06:29:44.684381  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c242ea40 pointer offset 0 size 64
    2023-12-07T06:29:44.693414  kern  :alert : Register r9 information: sla=
b kmalloc-192 start c317af00 pointer offset 176 size 192 =

    ... (42 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6571665f2e4b58c=
23ce13488
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:29:44.603360  kern  :alert : 8<--- cut here ---
    2023-12-07T06:29:44.612331  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-07T06:29:44.612477  kern  :alert : [00000010] *pgd=3D87a80831
    2023-12-07T06:29:44.621350  kern  :al[    8.045720] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/657161c2a1b0dfb32ae134d2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657161c2a1b0dfb=
32ae134d9
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-07T06:09:55.659081  ert : Register r0 information: slab dentry =
start c2c2fbb0 pointer offset 0 size 136
    2023-12-07T06:09:55.668110  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-07T06:09:55.668243  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-07T06:09:55.677133  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:09:55.686508  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c32ace40 pointer offset 64 size 192
    2023-12-07T06:09:55.695289  kern  :alert : Register r5 information: sla=
b dentry start c2c2fb28 pointer offset 0 size 136
    2023-12-07T06:09:55.695452  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c81f8780 pointer offset 0 size 64
    2023-12-07T06:09:55.713232  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf0be000 allocated at load_module+0x6d4/0x=
1adc
    2023-12-07T06:09:55.722237  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c81f8780 pointer offset 0 size 64
    2023-12-07T06:09:55.722425  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657161c2a1b0dfb=
32ae134da
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:09:55.632155  kern  :alert : 8<--- cut here ---
    2023-12-07T06:09:55.640964  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-07T06:09:55.641111  kern  :alert : [00000010] *pgd=3D8865f831
    2023-12-07T06:09:55.650077  kern  :al[   36.167975] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/6571626377bd7008aae1349e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6571626477bd7008aae134a3
        new failure (last pass: next-20231206)

    2023-12-07T06:12:35.064135  kern  :emerg [   39.132503] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 1015236_1.5.2.3.1>
    2023-12-07T06:12:35.064318  :  platform_probe from really_probe+0x81/0x=
1d0
    2023-12-07T06:12:35.073186  kern  :emerg :  really_probe from __driver_=
probe_device+0x59/0x12c
    2023-12-07T06:12:35.082179  kern  :emerg :  __driver_probe_device from =
driver_probe_device+0x2d/0xc8
    2023-12-07T06:12:35.091628  kern  :emerg :  driver_probe_device from __=
driver_attach+0x4d/0xf0
    2023-12-07T06:12:35.091829  kern  :emerg :  __driver_attach from bus_fo=
r_each_dev+0x3f/0x74
    2023-12-07T06:12:35.100268  kern  :emerg :  bus_for_each_dev from bus_a=
dd_driver+0x91/0x13c
    2023-12-07T06:12:35.100439  kern  :emerg :  bus_add_driver from driver_=
register+0x37/0xa4
    2023-12-07T06:12:35.109257  kern  :emerg :  driver_register from do_one=
_initcall+0x31/0x14c
    2023-12-07T06:12:35.118364  kern  :emerg :  do_one_initcall from do_ini=
t_module+0x3f/0x15c =

    ... (29 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6571626477bd700=
8aae134a5
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        56 lines

    2023-12-07T06:12:34.667074  ert : Register r0 information: slab dentry =
start c2da46e8 pointer offset 0 size 136
    2023-12-07T06:12:34.676170  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-07T06:12:34.676314  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-07T06:12:34.685133  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:12:34.694193  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c33ee9c0 pointer offset 64 size 192
    2023-12-07T06:12:34.703197  kern  :alert : Register r5 information: sla=
b dentry start c2da4880 pointer offset 0 size 136
    2023-12-07T06:12:34.703339  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c89bfd00 pointer offset 0 size 64
    2023-12-07T06:12:34.721402  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf861000 allocated at load_module+0x4e1/0x=
1434
    2023-12-07T06:12:34.721664  kern  :alert : Register r8 information: NUL=
L pointer
    2023-12-07T06:12:34.730142  kern  :alert : Register r9 information: sla=
b kmalloc-128 start c32b6500 pointer offset 64 size 128 =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6571626477bd700=
8aae134a6
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:12:34.640038  kern  :alert : 8<--- cut here ---
    2023-12-07T06:12:34.649023  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-07T06:12:34.649164  kern  :alert : [00000010] *pgd=3D8b1db831
    2023-12-07T06:12:34.658022  kern  :al[   38.723719] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/657166225818719025e13475

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657166225818719=
025e1347c
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-07T06:28:37.713346  kern  :alert : Register r0 information: sla=
b dentry start c2870440 pointer offset 0 size 136
    2023-12-07T06:28:37.722088  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-07T06:28:37.722237  kern  :alert : Register r2 information: vma=
lloc memory
    2023-12-07T06:28:37.731346  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-07T06:28:37.740348  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c30953c0 pointer offset 64 size 192
    2023-12-07T06:28:37.740499  kern  :alert : Register r5 information: sla=
b dentry start c28703b8 pointer offset 0 size 136
    2023-12-07T06:28:37.749341  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c3614400 pointer offset 0 size 64
    2023-12-07T06:28:37.767388  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-07T06:28:37.776371  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c3614400 pointer offset 0 size 64
    2023-12-07T06:28:37.776517  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (39 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657166225818719=
025e1347d
        failing since 1 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-07T06:28:37.686047  kern  :alert : 8<--- cut here ---
    2023-12-07T06:28:37.704427  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010[   41.335007] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-07T06:28:37.704692   when read
    2023-12-07T06:28:37.704799  kern  :alert : [00000010] *pgd=3D8b237831   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657161831245801e94e13481

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657161831245801e94e13=
482
        failing since 604 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/657162e7e43411e111e13494

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657162e7e43411e=
111e1349b
        failing since 0 day (last pass: next-20231120, first fail: next-202=
31206)
        13 lines

    2023-12-07T06:14:29.474305  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000020
    2023-12-07T06:14:29.487571  kern  :alert : Mem abort in<8>[    9.087585=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D13>
    2023-12-07T06:14:29.488004  fo:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657162e7e43411e=
111e1349d
        failing since 0 day (last pass: next-20231120, first fail: next-202=
31206)
        2 lines

    2023-12-07T06:14:29.490686  kern  :alert :   ESR =3D 0x0000000096000007
    2023-12-07T06:14:29.503001  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-12-07T06:14:29.503770  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-12-07T06:14:29.504140  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-12-07T06:14:29.506397  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-12-07T06:14:29.518812  kern  :alert : Data abort info:
    2023-12-07T06:14:29.519695  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007, ISS2 =3D 0x00000000
    2023-12-07T06:14:29.534830  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess<8>[    9.129325] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demer=
g RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-12-07T06:14:29.535411   =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6571692b81a9126040e134aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6571692b81a9126040e13=
4ab
        failing since 0 day (last pass: next-20231120, first fail: next-202=
31206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65716a10f1cfc54301e134f3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65716a10f1cfc54=
301e134fa
        new failure (last pass: next-20231120)
        2 lines

    2023-12-07T06:45:15.647137  kern  :alert :   ESR =3D 0x0000000096000006
    2023-12-07T06:45:15.659981  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-12-07T06:45:15.660479  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-12-07T06:45:15.661091  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-12-07T06:45:15.663264  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-12-07T06:45:15.663660  kern  :alert : Data abort info:
    2023-12-07T06:45:15.679421  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006, ISS2 =3D <8>[    9.344781] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg =
RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-12-07T06:45:15.679920  0x00000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65716a10f1cfc54=
301e134fb
        new failure (last pass: next-20231120)
        13 lines

    2023-12-07T06:45:15.628235  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000020
    2023-12-07T06:45:15.644174  kern  :alert : Mem abort in<8>[    9.309734=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D13>
    2023-12-07T06:45:15.644628  fo:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-j721e-beagleboneai64      | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65716a4ae94ea89836e1349c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65716a4ae94ea89=
836e134a3
        new failure (last pass: next-20231120)
        2 lines

    2023-12-07T06:46:20.081131  at virtual address 0000000000000020
    2023-12-07T06:46:20.120315  kern  :alert : Mem abort info:
    2023-12-07T06:46:20.120569  kern  :alert :   ESR =3D 0x0000000096000006
    2023-12-07T06:46:20.120973  kern  :alert :  <8>[   11.148211] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D2>
    2023-12-07T06:46:20.121174   EC =3D 0x25: DABT (current EL), IL =3D 32 =
bits
    2023-12-07T06:46:20.121335  kern  :alert :   SE<8>[   11.158215] <LAVA_=
SIGNAL_ENDRUN 0_dmesg 3864336_1.5.2.4.1>
    2023-12-07T06:46:20.121487  T =3D 0, FnV =3D 0
    2023-12-07T06:46:20.121635  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-12-07T06:46:20.121782  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-12-07T06:46:20.121932  kern  :alert : Data abort info:   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65716a4ae94ea89=
836e134a4
        new failure (last pass: next-20231120)
        13 lines =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/657163026756a3a91be134aa

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657163026756a3a=
91be134b1
        new failure (last pass: next-20231206)
        2 lines

    2023-12-07T06:15:05.993432  kern  :alert :   ESR =3D 0x0000000096000007
    2023-12-07T06:15:05.994220  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-12-07T06:15:05.994652  kern  :alert :   SE<8>[   10.218356] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2023-12-07T06:15:05.995087  T =3D 0, FnV =3D 0
    2023-12-07T06:15:05.995456  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657163026756a3a=
91be134b2
        new failure (last pass: next-20231206)
        13 lines

    2023-12-07T06:15:05.971605  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   10.196143] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>
    2023-12-07T06:15:05.973394  at virtual address 0000000000000020
    2023-12-07T06:15:05.973962  kern  :alert : Mem abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6571686d639e241460e135b5

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6571686d639e241=
460e135b8
        failing since 0 day (last pass: next-20231120, first fail: next-202=
31206)
        2 lines

    2023-12-07T06:37:11.091095  <8>[   21.492872] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6571686d639e241=
460e135b9
        failing since 0 day (last pass: next-20231120, first fail: next-202=
31206)
        13 lines

    2023-12-07T06:37:11.069145  <8>[   21.473933] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 3          =


  Details:     https://kernelci.org/test/plan/id/657167eb45dd1347f4e134b1

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657167eb45dd1347f4e134b6
        new failure (last pass: next-20231130)

    2023-12-07T06:36:07.660849  kern  :alert : [00000000000000c8] pgd=3D080=
000000af03003, p4d=3D080000000af03003, pud=3D080000000af04003, pmd=3D000000=
0000000000
    2023-12-07T06:36:07.661285  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-12-07T06:36:07.661531  kern  :emerg : Code: d503233f a9bf7bfd 9100=
03fd f9403c00 (f9406400) =

    2023-12-07T06:36:07.664006  + set +x
    2023-12-07T06:36:07.766710  / # #
    2023-12-07T06:36:07.867859  export SHELL=3D/bin/sh
    2023-12-07T06:36:07.868222  #
    2023-12-07T06:36:07.969028  / # export SHELL=3D/bin/sh. /lava-3864283/e=
nvironment
    2023-12-07T06:36:07.969387  =

    2023-12-07T06:36:08.070218  / # . /lava-3864283/environment/lava-386428=
3/bin/lava-test-runner /lava-3864283/1 =

    ... (14 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657167eb45dd134=
7f4e134b8
        new failure (last pass: next-20231130)
        2 lines

    2023-12-07T06:36:07.589922  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-12-07T06:36:07.629523  kern  :alert : Data abort info:
    2023-12-07T06:36:07.629736  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006, ISS2 =3D 0x00000000
    2023-12-07T06:36:07.630146  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2023-12-07T06:36:07.630365  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyB<8>[   16.467016] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-12-07T06:36:07.630556  it =3D 0, Xs =3D 0
    2023-12-07T06:36:07.630740  kern  :alert : use<8>[   16.478466] <LAVA_S=
IGNAL_ENDRUN 0_dmesg 3864283_1.5.2.4.1>
    2023-12-07T06:36:07.630920  r pgtable: 4k pages, 48-bit VAs, pgdp=3D000=
000000af02000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657167eb45dd134=
7f4e134b9
        new failure (last pass: next-20231130)
        13 lines

    2023-12-07T06:36:07.587086  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000000000c8
    2023-12-07T06:36:07.587310  kern  :alert : Mem abort info:
    2023-12-07T06:36:07.587509  kern  :alert :   ESR =3D 0x000<8>[   16.423=
454] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D13>
    2023-12-07T06:36:07.587715  0000096000006
    2023-12-07T06:36:07.587985  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-12-07T06:36:07.588241  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-12-07T06:36:07.588428  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657161bbfeecfb9ba8e1348e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657161bbfeecfb9ba8e13493
        new failure (last pass: next-20221014)

    2023-12-07T06:09:53.333962  <8>[   13.635040] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3864120_1.5.2.4.1>
    2023-12-07T06:09:53.440835  / # #
    2023-12-07T06:09:53.542024  export SHELL=3D/bin/sh
    2023-12-07T06:09:53.542390  #
    2023-12-07T06:09:53.643205  / # export SHELL=3D/bin/sh. /lava-3864120/e=
nvironment
    2023-12-07T06:09:53.643571  =

    2023-12-07T06:09:53.744409  / # . /lava-3864120/environment/lava-386412=
0/bin/lava-test-runner /lava-3864120/1
    2023-12-07T06:09:53.745012  =

    2023-12-07T06:09:53.750091  / # /lava-3864120/bin/lava-test-runner /lav=
a-3864120/1
    2023-12-07T06:09:53.807710  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6571626502d58b9f2de13475

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6571626502d58b9f2de1347a
        new failure (last pass: next-20221014)

    2023-12-07T06:12:30.666226  + <8>[   14.061767] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 3864137_1.5.2.4.1>
    2023-12-07T06:12:30.666449  set +x
    2023-12-07T06:12:30.770836  / # #
    2023-12-07T06:12:30.872012  export SHELL=3D/bin/sh
    2023-12-07T06:12:30.872383  #
    2023-12-07T06:12:30.973162  / # export SHELL=3D/bin/sh. /lava-3864137/e=
nvironment
    2023-12-07T06:12:30.973586  =

    2023-12-07T06:12:31.074435  / # . /lava-3864137/environment/lava-386413=
7/bin/lava-test-runner /lava-3864137/1
    2023-12-07T06:12:31.075116  =

    2023-12-07T06:12:31.079691  / # /lava-3864137/bin/lava-test-runner /lav=
a-3864137/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657166345818719025e134e2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657166345818719025e134e7
        new failure (last pass: next-20221017)

    2023-12-07T06:28:56.645329  <8>[   19.639892] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3864255_1.5.2.4.1>
    2023-12-07T06:28:56.749794  / # #
    2023-12-07T06:28:56.850907  export SHELL=3D/bin/sh
    2023-12-07T06:28:56.851251  #
    2023-12-07T06:28:56.952021  / # export SHELL=3D/bin/sh. /lava-3864255/e=
nvironment
    2023-12-07T06:28:56.952412  =

    2023-12-07T06:28:57.053203  / # . /lava-3864255/environment/lava-386425=
5/bin/lava-test-runner /lava-3864255/1
    2023-12-07T06:28:57.053805  =

    2023-12-07T06:28:57.057430  / # /lava-3864255/bin/lava-test-runner /lav=
a-3864255/1
    2023-12-07T06:28:57.110929  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657165ff7079de46cde13495

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657165ff7079de46cde13=
496
        failing since 0 day (last pass: next-20231205, first fail: next-202=
31206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657162f4d3b3a8ad9ce13482

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657162f4d3b3a8ad9ce13487
        failing since 128 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-12-07T06:14:49.362681  + set +x
    2023-12-07T06:14:49.365897  <8>[   28.298168] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1053093_1.5.2.4.1>
    2023-12-07T06:14:49.472083  / # #
    2023-12-07T06:14:50.929449  export SHELL=3D/bin/sh
    2023-12-07T06:14:50.950175  #
    2023-12-07T06:14:50.950572  / # export SHELL=3D/bin/sh
    2023-12-07T06:14:52.898909  / # . /lava-1053093/environment
    2023-12-07T06:14:56.486510  /lava-1053093/bin/lava-test-runner /lava-10=
53093/1
    2023-12-07T06:14:56.507756  . /lava-1053093/environment
    2023-12-07T06:14:56.508122  / # /lava-1053093/bin/lava-test-runner /lav=
a-1053093/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6571628c6a7899cf52e1348f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6571628c6a7899cf52e13=
490
        failing since 379 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65716188f39893e1fbe13481

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65716188f39893e1fbe13=
482
        failing since 379 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6571697c918bdc13fee13497

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6571697c918bdc13fee13=
498
        failing since 302 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65716987fea65097ffe1348e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65716987fea65097ffe13=
48f
        failing since 302 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657166df885b496ccae13476

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657166df885b496ccae1347b
        failing since 183 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-07T06:31:17.656851  / # #
    2023-12-07T06:31:17.759640  export SHELL=3D/bin/sh
    2023-12-07T06:31:17.760665  #
    2023-12-07T06:31:17.862355  / # export SHELL=3D/bin/sh. /lava-3864272/e=
nvironment
    2023-12-07T06:31:17.863387  =

    2023-12-07T06:31:17.965236  / # . /lava-3864272/environment/lava-386427=
2/bin/lava-test-runner /lava-3864272/1
    2023-12-07T06:31:17.966746  =

    2023-12-07T06:31:17.985550  / # /lava-3864272/bin/lava-test-runner /lav=
a-3864272/1
    2023-12-07T06:31:18.124954  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-07T06:31:18.125501  + cd /lava-3864272/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6571673ba4795580bfe13475

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6571673ba4795580bfe1347a
        failing since 183 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-07T06:33:12.884608  + set +x
    2023-12-07T06:33:12.886393  [   21.803856] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446874_1.5.2.4.1>
    2023-12-07T06:33:12.995005  / # #
    2023-12-07T06:33:13.096306  export SHELL=3D/bin/sh
    2023-12-07T06:33:13.096865  #
    2023-12-07T06:33:13.197860  / # export SHELL=3D/bin/sh. /lava-446874/en=
vironment
    2023-12-07T06:33:13.198432  =

    2023-12-07T06:33:13.299463  / # . /lava-446874/environment/lava-446874/=
bin/lava-test-runner /lava-446874/1
    2023-12-07T06:33:13.300305  =

    2023-12-07T06:33:13.306034  / # /lava-446874/bin/lava-test-runner /lava=
-446874/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657161bef39893e1fbe134b6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657161bef39893e1fbe134bb
        failing since 183 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-07T06:09:47.200896  / # #
    2023-12-07T06:09:47.301949  export SHELL=3D/bin/sh
    2023-12-07T06:09:47.302751  #
    2023-12-07T06:09:47.404165  / # export SHELL=3D/bin/sh. /lava-3864118/e=
nvironment
    2023-12-07T06:09:47.404963  =

    2023-12-07T06:09:47.506554  / # . /lava-3864118/environment/lava-386411=
8/bin/lava-test-runner /lava-3864118/1
    2023-12-07T06:09:47.508003  =

    2023-12-07T06:09:47.524852  / # /lava-3864118/bin/lava-test-runner /lav=
a-3864118/1
    2023-12-07T06:09:47.645595  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-07T06:09:47.646587  + cd /lava-3864118/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657162609ff1246130e134a3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657162609ff1246130e134a8
        failing since 183 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-07T06:12:08.728747  / # #
    2023-12-07T06:12:08.831612  export SHELL=3D/bin/sh
    2023-12-07T06:12:08.832440  #
    2023-12-07T06:12:08.933941  / # export SHELL=3D/bin/sh. /lava-3864143/e=
nvironment
    2023-12-07T06:12:08.934699  =

    2023-12-07T06:12:09.036120  / # . /lava-3864143/environment/lava-386414=
3/bin/lava-test-runner /lava-3864143/1
    2023-12-07T06:12:09.037292  =

    2023-12-07T06:12:09.051266  / # /lava-3864143/bin/lava-test-runner /lav=
a-3864143/1
    2023-12-07T06:12:09.156883  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-07T06:12:09.157693  + cd /lava-3864143/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6571665ca0fdcfd986e134a4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6571665ca0fdcfd986e134a9
        failing since 183 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-07T06:29:26.789009  <8>[   16.034246] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3864253_1.5.2.4.1>
    2023-12-07T06:29:26.892891  / # #
    2023-12-07T06:29:26.994795  export SHELL=3D/bin/sh
    2023-12-07T06:29:26.995765  #
    2023-12-07T06:29:27.097264  / # export SHELL=3D/bin/sh. /lava-3864253/e=
nvironment
    2023-12-07T06:29:27.098229  =

    2023-12-07T06:29:27.200243  / # . /lava-3864253/environment/lava-386425=
3/bin/lava-test-runner /lava-3864253/1
    2023-12-07T06:29:27.201399  =

    2023-12-07T06:29:27.206945  / # /lava-3864253/bin/lava-test-runner /lav=
a-3864253/1
    2023-12-07T06:29:27.303560  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657161c2feecfb9ba8e1349e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657161c2feecfb9ba8e134a3
        failing since 183 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-07T06:09:53.594105  + set +x
    2023-12-07T06:09:53.595881  [   19.920262] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446852_1.5.2.4.1>
    2023-12-07T06:09:53.704293  / # #
    2023-12-07T06:09:53.805898  export SHELL=3D/bin/sh
    2023-12-07T06:09:53.806464  #
    2023-12-07T06:09:53.907432  / # export SHELL=3D/bin/sh. /lava-446852/en=
vironment
    2023-12-07T06:09:53.907986  =

    2023-12-07T06:09:54.008998  / # . /lava-446852/environment/lava-446852/=
bin/lava-test-runner /lava-446852/1
    2023-12-07T06:09:54.009844  =

    2023-12-07T06:09:54.016329  / # /lava-446852/bin/lava-test-runner /lava=
-446852/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6571629f518b720edee13475

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6571629f518b720edee1347a
        failing since 183 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-07T06:13:29.160046  + set +x[   19.588568] <LAVA_SIGNAL_ENDRUN =
0_dmesg 446858_1.5.2.4.1>
    2023-12-07T06:13:29.160361  =

    2023-12-07T06:13:29.268260  / # #
    2023-12-07T06:13:29.370006  export SHELL=3D/bin/sh
    2023-12-07T06:13:29.370580  #
    2023-12-07T06:13:29.471634  / # export SHELL=3D/bin/sh. /lava-446858/en=
vironment
    2023-12-07T06:13:29.472258  =

    2023-12-07T06:13:29.573284  / # . /lava-446858/environment/lava-446858/=
bin/lava-test-runner /lava-446858/1
    2023-12-07T06:13:29.574170  =

    2023-12-07T06:13:29.576889  / # /lava-446858/bin/lava-test-runner /lava=
-446858/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657166d7a4f0309785e134e9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657166d7a4f0309785e134ee
        failing since 183 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-07T06:31:34.939963  + set +x
    2023-12-07T06:31:34.941690  [   22.196465] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446867_1.5.2.4.1>
    2023-12-07T06:31:35.050705  / # #
    2023-12-07T06:31:35.152562  export SHELL=3D/bin/sh
    2023-12-07T06:31:35.153200  #
    2023-12-07T06:31:35.254258  / # export SHELL=3D/bin/sh. /lava-446867/en=
vironment
    2023-12-07T06:31:35.254901  =

    2023-12-07T06:31:35.356056  / # . /lava-446867/environment/lava-446867/=
bin/lava-test-runner /lava-446867/1
    2023-12-07T06:31:35.357006  =

    2023-12-07T06:31:35.359396  / # /lava-446867/bin/lava-test-runner /lava=
-446867/1 =

    ... (12 line(s) more)  =

 =20

