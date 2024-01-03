Return-Path: <linux-next+bounces-593-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A32822C20
	for <lists+linux-next@lfdr.de>; Wed,  3 Jan 2024 12:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B528B235CC
	for <lists+linux-next@lfdr.de>; Wed,  3 Jan 2024 11:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C291418EB9;
	Wed,  3 Jan 2024 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="QMtnTI7V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BFA18E23
	for <linux-next@vger.kernel.org>; Wed,  3 Jan 2024 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5ce0efd60ddso2403210a12.0
        for <linux-next@vger.kernel.org>; Wed, 03 Jan 2024 03:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704281383; x=1704886183; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pvfWniO8YiMoALvhvTOblyQDiD2phsKfU+imtd/nMq4=;
        b=QMtnTI7Vj9iyzqF2iIV4IWlRsNSRsilSlpbBp5gqCtcxRSc/DVPLBhbKTC90WB0Ot/
         /sCEe704KpwVUTfqN1RhhAH5AWOYaiLqAXXdGcAQzHJQ7cgO8RkJ5XwTMP6CyoGMkVCs
         MoMSSDilpKy9Ns2SZdR7Izt8LQZE3FNP5r1VZARj8skXFqqDpE6WjdlPS5wNYQYBSWBs
         rpamXtE4AxgxFSSfbdXeLduGwlZuC6IRwrXP8ShDdGVi8eSMsOsoEaI+D3pDpWJD+4w9
         952hri/Fnh0kuOJJ+ztEPRpay2BMxSRDdODTEByFcuxXW2r569Csa+q0flSxAKtyxX2F
         B/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704281383; x=1704886183;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvfWniO8YiMoALvhvTOblyQDiD2phsKfU+imtd/nMq4=;
        b=eO0uNGeyyoK+BIPYrUm3OwaPQFOoGJ3HhE3tq3YePk/+5ki5Q+lersFu2n+nTF6lbY
         nFrd0WFzxu760seapuqdk3Fxi6qcHA51lVRZpWBVD+g4ischOhgwAu3SC8D7TQFJq164
         jLVLYdNV1NBD9Vz0heZDNXHiLEs2FgM3qXY3t8yPDBjL/8gxV1XZ2p2sPgkZLlGnrr4+
         CSfjG4Fz4JF7GfSwH57+ZmNv/zxtMJCsjDZoL3CAQdrSb8QLxlyhfvqkerDfCh+n36qg
         ScpRvDAK1GaTxoDIpJZRf7kLaafjBizxK8Nos1hVksRB5r9KqNSz18lgY3jv3pPQkZ39
         uf3A==
X-Gm-Message-State: AOJu0Yw2tUMQwUsK/v13YxXKoZoWxVOMHO7TKgOr+5xkMxVT3oHj3jKK
	SYZCpcHXF1DiyTe6VZG58U9JOofhDFT8wrvlilgb9o5vZpw=
X-Google-Smtp-Source: AGHT+IEsrXQTuLSKcU6HYCpgqNCG6xVEEIEXJRVGVnoNRLPKX42MP7giPxBEkrE9Et5So4P0e11Evg==
X-Received: by 2002:a05:6a20:6d98:b0:195:fa5c:f918 with SMTP id gl24-20020a056a206d9800b00195fa5cf918mr5270217pzb.4.1704281382051;
        Wed, 03 Jan 2024 03:29:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id si13-20020a17090b528d00b0028cbfdbd804sm1418615pjb.45.2024.01.03.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 03:29:41 -0800 (PST)
Message-ID: <65954525.170a0220.edfcd.2d4d@mx.google.com>
Date: Wed, 03 Jan 2024 03:29:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240103
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 435 runs, 58 regressions (next-20240103)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 435 runs, 58 regressions (next-20240103)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | clang-17 | defconfig=
                    | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | clang-17 | defconfig=
                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240103/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240103
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0fef202ac2f8e6d9ad21aead648278f1226b9053 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65950bd44fe991e9de77b5ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950bd44fe991e9de77b=
5ee
        failing since 336 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65950ba270bb93260477b5eb

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65950ba270bb93260477b60b
        failing since 212 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-03T07:23:51.316707  /lava-411431/1/../bin/lava-test-case
    2024-01-03T07:23:51.359081  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6595067b2b3d101e1c77b587

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6595067b2b3d101e1c77b5bf
        failing since 212 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-03T07:01:49.753178  /lava-411252/1/../bin/lava-test-case
    2024-01-03T07:01:49.795669  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65950b6a9e17c0292f77b59a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950b6a9e17c0292f77b=
59b
        failing since 212 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65950f1b484aca3f1c77b648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950f1b484aca3f1c77b=
649
        failing since 280 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65950ffd3b0677559077b580

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950ffd3b0677559077b=
581
        failing since 278 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65950a05c5ec8b704377b60d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950a05c5ec8b704377b=
60e
        failing since 21 days (last pass: next-20231212, first fail: next-2=
0231213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65950e1e2ab432c25277b59a

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65950e1e2ab432c2=
5277b59f
        new failure (last pass: next-20231222)
        1 lines

    2024-01-03T07:34:16.768142  / # =

    2024-01-03T07:34:16.780371  =

    2024-01-03T07:34:16.882578  / # #
    2024-01-03T07:34:16.891263  #
    2024-01-03T07:34:16.992075  / # export SHELL=3D/bin/sh
    2024-01-03T07:34:17.004078  export SHELL=3D/bin/sh
    2024-01-03T07:34:17.104809  / # . /lava-1068260/environment
    2024-01-03T07:34:17.116079  . /lava-1068260/environment
    2024-01-03T07:34:17.217077  / # /lava-1068260/bin/lava-test-runner /lav=
a-1068260/0
    2024-01-03T07:34:17.227842  /lava-1068260/bin/lava-test-runner /lava-10=
68260/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6595126af036c4aa2277b5db

  Results:     51 PASS, 4 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6595126af036c4aa=
2277b5e0
        new failure (last pass: next-20231222)
        1 lines

    2024-01-03T07:52:59.719509  / # =

    2024-01-03T07:52:59.731323  =

    2024-01-03T07:52:59.833602  / # #
    2024-01-03T07:52:59.843165  #
    2024-01-03T07:52:59.943961  / # export SHELL=3D/bin/sh
    2024-01-03T07:52:59.955040  export SHELL=3D/bin/sh
    2024-01-03T07:53:00.055923  / # . /lava-1068273/environment
    2024-01-03T07:53:00.066892  . /lava-1068273/environment
    2024-01-03T07:53:00.167889  / # /lava-1068273/bin/lava-test-runner /lav=
a-1068273/0
    2024-01-03T07:53:00.178755  /lava-1068273/bin/lava-test-runner /lava-10=
68273/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65950ff5a1d81a162e77b586

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950ff5a1d81a162e77b=
587
        failing since 631 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6595157b7d98fc175e77b693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6595157b7d98fc175e77b=
694
        new failure (last pass: next-20231211) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65950f5daa5fc452d377b5cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950f5daa5fc452d377b=
5d0
        new failure (last pass: next-20231222) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65951103d7f3a2dfbb77b5bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65951103d7f3a2dfbb77b=
5bd
        new failure (last pass: next-20231221) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659512843e59e398f877b5b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659512843e59e398f877b=
5b6
        failing since 54 days (last pass: next-20231103, first fail: next-2=
0231110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65950fc29e3e64b78077b59a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950fc29e3e64b78077b=
59b
        new failure (last pass: next-20231221) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659511a330c55583e277b57d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659511a330c55583e277b=
57e
        failing since 61 days (last pass: next-20231025, first fail: next-2=
0231103) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/65950d3dcd7e5bb10177b6f4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65950d3dcd7e5bb10177b6fb
        failing since 22 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-03T07:30:47.859919  / # #
    2024-01-03T07:30:47.962206  export SHELL=3D/bin/sh
    2024-01-03T07:30:47.962922  #
    2024-01-03T07:30:48.064099  / # export SHELL=3D/bin/sh. /lava-411487/en=
vironment
    2024-01-03T07:30:48.064727  =

    2024-01-03T07:30:48.165880  / # . /lava-411487/environment/lava-411487/=
bin/lava-test-runner /lava-411487/1
    2024-01-03T07:30:48.167006  =

    2024-01-03T07:30:48.171502  / # /lava-411487/bin/lava-test-runner /lava=
-411487/1
    2024-01-03T07:30:48.234687  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-03T07:30:48.269414  + cd /lava-411487/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65950d3dcd7e5bb10177b6ff
        failing since 22 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-03T07:30:50.485045  /lava-411487/1/../bin/lava-test-case
    2024-01-03T07:30:50.512054  <8>[   26.000280] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
950d3dcd7e5bb10177b701
        failing since 22 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-03T07:30:51.572445  /lava-411487/1/../bin/lava-test-case
    2024-01-03T07:30:51.599391  <8>[   27.088259] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65950d3dcd7e5bb10177b706
        failing since 22 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-03T07:30:52.831976  /lava-411487/1/../bin/lava-test-case
    2024-01-03T07:30:52.857887  <8>[   28.346763] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65950d3dcd7e5bb10177b707
        failing since 22 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-03T07:30:53.881372  /lava-411487/1/../bin/lava-test-case
    2024-01-03T07:30:53.907390  <8>[   29.396450] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65950d9f371b08365777b5b3

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65950d9f371b08365777b5ba
        failing since 21 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-03T07:32:28.071169  =

    2024-01-03T07:32:28.172715  / # #export SHELL=3D/bin/sh
    2024-01-03T07:32:28.173425  =

    2024-01-03T07:32:28.274684  / # export SHELL=3D/bin/sh. /lava-411491/en=
vironment
    2024-01-03T07:32:28.275388  =

    2024-01-03T07:32:28.376847  / # . /lava-411491/environment/lava-411491/=
bin/lava-test-runner /lava-411491/1
    2024-01-03T07:32:28.378043  =

    2024-01-03T07:32:28.382065  / # /lava-411491/bin/lava-test-runner /lava=
-411491/1
    2024-01-03T07:32:28.446287  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-03T07:32:28.480222  + cd /lava-411491/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65950d9f371b08365777b5be
        failing since 21 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-03T07:32:30.695728  /lava-411491/1/../bin/lava-test-case
    2024-01-03T07:32:30.723019  <8>[   26.033233] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
950d9f371b08365777b5c0
        failing since 21 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-03T07:32:31.783253  /lava-411491/1/../bin/lava-test-case
    2024-01-03T07:32:31.809802  <8>[   27.120894] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65950d9f371b08365777b5c5
        failing since 21 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-03T07:32:33.042618  /lava-411491/1/../bin/lava-test-case
    2024-01-03T07:32:33.069540  <8>[   28.379834] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65950d9f371b08365777b5c6
        failing since 21 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-03T07:32:34.092998  /lava-411491/1/../bin/lava-test-case
    2024-01-03T07:32:34.118677  <8>[   29.429619] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6595100bcbaa6b999e77b594

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6595100bcbaa6b999e77b=
595
        failing since 19 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | clang-17 | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65951431b09fc6de0e77b58b

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65951431b09fc6de0e77b592
        failing since 23 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-01-03T08:00:36.093632  / # #
    2024-01-03T08:00:36.195560  export SHELL=3D/bin/sh
    2024-01-03T08:00:36.196216  #
    2024-01-03T08:00:36.297464  / # export SHELL=3D/bin/sh. /lava-411518/en=
vironment
    2024-01-03T08:00:36.298118  =

    2024-01-03T08:00:36.399663  / # . /lava-411518/environment/lava-411518/=
bin/lava-test-runner /lava-411518/1
    2024-01-03T08:00:36.400963  =

    2024-01-03T08:00:36.405599  / # /lava-411518/bin/lava-test-runner /lava=
-411518/1
    2024-01-03T08:00:36.469637  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-03T08:00:36.503478  + cd /lava-411518/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65951431b09fc6de0e77b5a5
        failing since 23 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-01-03T08:00:39.431434  /lava-411518/1/../bin/lava-test-case
    2024-01-03T08:00:39.458533  <8>[   27.055619] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65950d50077013ddda77b599

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65950d50077013ddda77b5a0
        failing since 22 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-03T07:31:11.511435  / # #
    2024-01-03T07:31:11.613435  export SHELL=3D/bin/sh
    2024-01-03T07:31:11.614142  #
    2024-01-03T07:31:11.715450  / # export SHELL=3D/bin/sh. /lava-411485/en=
vironment
    2024-01-03T07:31:11.715873  =

    2024-01-03T07:31:11.817400  / # . /lava-411485/environment/lava-411485/=
bin/lava-test-runner /lava-411485/1
    2024-01-03T07:31:11.818548  =

    2024-01-03T07:31:11.822695  / # /lava-411485/bin/lava-test-runner /lava=
-411485/1
    2024-01-03T07:31:11.886745  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-03T07:31:11.926677  + cd /lava-411485/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65950d50077013ddda77b5b3
        failing since 22 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-03T07:31:14.846691  /lava-411485/1/../bin/lava-test-case
    2024-01-03T07:31:14.874742  <8>[   27.029793] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65950dba874ee6e52e77b595

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65950dba874ee6e52e77b59c
        failing since 21 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-03T07:32:46.039658  / ##
    2024-01-03T07:32:46.140495  export SHELL=3D/bin/sh
    2024-01-03T07:32:46.140781   #
    2024-01-03T07:32:46.241293  / # export SHELL=3D/bin/sh. /lava-411492/en=
vironment
    2024-01-03T07:32:46.241576  =

    2024-01-03T07:32:46.342188  / # . /lava-411492/environment/lava-411492/=
bin/lava-test-runner /lava-411492/1
    2024-01-03T07:32:46.342592  =

    2024-01-03T07:32:46.355229  / # /lava-411492/bin/lava-test-runner /lava=
-411492/1
    2024-01-03T07:32:46.448075  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-03T07:32:46.448295  + cd /lava-411492/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65950dba874ee6e52e77b5af
        failing since 21 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-03T07:32:49.371998  /lava-411492/1/../bin/lava-test-case
    2024-01-03T07:32:49.402042  <8>[   27.035163] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65950fbb9e3e64b78077b589

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950fbb9e3e64b78077b=
58a
        failing since 19 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65950bd91e1f47b7c477b57d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950bd91e1f47b7c477b=
57e
        failing since 13 days (last pass: next-20231115, first fail: next-2=
0231220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/65950f29616700103077b5e8

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65950f296167001=
03077b5eb
        failing since 28 days (last pass: next-20231120, first fail: next-2=
0231205)
        2 lines

    2024-01-03T07:38:54.718180  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-01-03T07:38:54.718381  kern  :alert : Data abort info:
    2024-01-03T07:38:54.758305  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-01-03T07:38:54.758510  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-01-03T07:38:54.758670  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-01-03T07:38:54.758801  kern  :ale<8>[   19.609950] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-01-03T07:38:54.758927  rt : [cccccccccccccccc<8>[   19.618471] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 3900772_1.5.2.4.1>
    2024-01-03T07:38:54.759047  ] address between user and kernel address r=
anges   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65950f296167001=
03077b5ec
        failing since 28 days (last pass: next-20231120, first fail: next-2=
0231205)
        12 lines

    2024-01-03T07:38:54.715242  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-01-03T07:38:54.715502  kern  :alert : Mem abort info:
    2024-01-03T07:38:54.715671  kern  :alert :   ESR =3D 0x0000000096000004
    2024-01-03T07:38:54.715809  kern  :alert :   EC =3D 0x25: <8>[   19.567=
580] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2024-01-03T07:38:54.715935  DABT (current EL), IL =3D 32 bits
    2024-01-03T07:38:54.716033  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-01-03T07:38:54.716123  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65950dd76410e2f4eb77b57d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950dd76410e2f4eb77b=
57e
        new failure (last pass: next-20231106) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/659510385f562ffb3c77b5e1

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/659510385f562ff=
b3c77b5e4
        new failure (last pass: next-20231221)
        4 lines

    2024-01-03T07:43:29.010144  kern  :alert : Mem abort info:
    2024-01-03T07:43:29.049505  kern  :alert :   ESR =3D 0x0000000096000005
    2024-01-03T07:43:29.049721  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-01-03T07:43:29.049891  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-01-03T07:43:29.050029  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-01-03T07:43:29.050155  kern  :alert :   FSC =3D 0x05: level 1 tran=
slation fault
    2024-01-03T07:43:29.050276  kern  :alert : Data abort info:
    2024-01-03T07:43:29.050396  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
005, ISS2 =3D 0x00000000
    2024-01-03T07:43:29.050513  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-01-03T07:43:29.050630  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0 =

    ... (9 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/659510385f562ff=
b3c77b5e5
        new failure (last pass: next-20231221)
        27 lines

    2024-01-03T07:43:28.966036  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address ffff00400f8748b8
    2024-01-03T07:43:28.966568  kern  :alert : Mem abort info:
    2024-01-03T07:43:28.967078  kern  :alert :   ESR =3D 0x0000000096000005
    2024-01-03T07:43:28.967484  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-01-03T07:43:28.967971  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-01-03T07:43:28.968446  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-01-03T07:43:28.968939  kern  :alert :   FSC =3D 0x05: level 1 tran=
slation fault
    2024-01-03T07:43:28.969471  kern  :alert : Data abort info:
    2024-01-03T07:43:28.970163  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
005, ISS2 =3D 0x00000000
    2024-01-03T07:43:29.006750  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0 =

    ... (5 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/659508c52116c80e2877b5dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659508c52116c80e2877b=
5dd
        failing since 13 days (last pass: next-20231215, first fail: next-2=
0231220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65950bcc8dade52fec77b57d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950bcc8dade52fec77b=
57e
        failing since 12 days (last pass: next-20231220, first fail: next-2=
0231221) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/659516f2e3c584f38377b680

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659516f2e3c584f38377b689
        failing since 128 days (last pass: next-20230710, first fail: next-=
20230828)

    2024-01-03T08:12:14.377861  + set +x
    2024-01-03T08:12:14.380941  <8>[   28.704391] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1068433_1.5.2.4.1>
    2024-01-03T08:12:14.487098  / # #
    2024-01-03T08:12:15.941689  export SHELL=3D/bin/sh
    2024-01-03T08:12:15.962064  #
    2024-01-03T08:12:15.962240  / # export SHELL=3D/bin/sh
    2024-01-03T08:12:17.907925  / # . /lava-1068433/environment
    2024-01-03T08:12:21.487912  /lava-1068433/bin/lava-test-runner /lava-10=
68433/1
    2024-01-03T08:12:21.508709  . /lava-1068433/environment
    2024-01-03T08:12:21.508931  / # /lava-1068433/bin/lava-test-runner /lav=
a-1068433/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/659512063d7e72797277b593

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659512063d7e72797277b59c
        failing since 148 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-01-03T07:51:15.599213  + set +x
    2024-01-03T07:51:15.602361  <8>[   28.367389] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1068329_1.5.2.4.1>
    2024-01-03T07:51:15.707912  / # #
    2024-01-03T07:51:17.163327  export SHELL=3D/bin/sh
    2024-01-03T07:51:17.184951  #
    2024-01-03T07:51:17.185203  / # export SHELL=3D/bin/sh
    2024-01-03T07:51:19.131806  / # . /lava-1068329/environment
    2024-01-03T07:51:22.712962  /lava-1068329/bin/lava-test-runner /lava-10=
68329/1
    2024-01-03T07:51:22.733627  . /lava-1068329/environment
    2024-01-03T07:51:22.733741  / # /lava-1068329/bin/lava-test-runner /lav=
a-1068329/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659510a736b8ed29fc77b613

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659510a736b8ed29fc77b=
614
        failing since 406 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65950fa6b37f64407877b5af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950fa6b37f64407877b=
5b0
        failing since 406 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65950e904973cfad2277b57d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950e904973cfad2277b=
57e
        new failure (last pass: next-20231221) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659510700a4752ee0877b585

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659510700a4752ee0877b=
586
        failing since 81 days (last pass: next-20230125, first fail: next-2=
0231013) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65950f59aa5fc452d377b580

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65950f59aa5fc452d377b=
581
        failing since 327 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6595104524694ee8ea77b589

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6595104524694ee8ea77b=
58a
        failing since 327 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65950f9775ae3fa3a477b5b1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65950f9775ae3fa3a477b5ba
        failing since 210 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-03T07:40:52.594492  / # #
    2024-01-03T07:40:52.698305  export SHELL=3D/bin/sh
    2024-01-03T07:40:52.698649  #
    2024-01-03T07:40:52.799388  / # export SHELL=3D/bin/sh. /lava-3900789/e=
nvironment
    2024-01-03T07:40:52.799745  =

    2024-01-03T07:40:52.900584  / # . /lava-3900789/environment/lava-390078=
9/bin/lava-test-runner /lava-3900789/1
    2024-01-03T07:40:52.901672  =

    2024-01-03T07:40:52.917137  / # /lava-3900789/bin/lava-test-runner /lav=
a-3900789/1
    2024-01-03T07:40:53.045176  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-03T07:40:53.045887  + cd /lava-3900789/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659510ac0714a119a377b59e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659510ac0714a119a377b5a7
        failing since 210 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-03T07:45:30.077486  + set +x
    2024-01-03T07:45:30.079258  [   20.879464] <LAVA_SIGNAL_ENDRUN 0_dmesg =
450691_1.5.2.4.1>
    2024-01-03T07:45:30.187797  / # #
    2024-01-03T07:45:30.289346  export SHELL=3D/bin/sh
    2024-01-03T07:45:30.289943  #
    2024-01-03T07:45:30.390922  / # export SHELL=3D/bin/sh. /lava-450691/en=
vironment
    2024-01-03T07:45:30.391518  =

    2024-01-03T07:45:30.492505  / # . /lava-450691/environment/lava-450691/=
bin/lava-test-runner /lava-450691/1
    2024-01-03T07:45:30.493441  =

    2024-01-03T07:45:30.498791  / # /lava-450691/bin/lava-test-runner /lava=
-450691/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659508a9228782830a77b5ac

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659508a9228782830a77b5b5
        failing since 216 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-03T07:11:11.434001  + set +x<8>[   14.171389] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3900599_1.5.2.4.1>
    2024-01-03T07:11:11.434520  =

    2024-01-03T07:11:11.542671  / # #
    2024-01-03T07:11:11.645983  export SHELL=3D/bin/sh
    2024-01-03T07:11:11.647019  #
    2024-01-03T07:11:11.749093  / # export SHELL=3D/bin/sh. /lava-3900599/e=
nvironment
    2024-01-03T07:11:11.750275  =

    2024-01-03T07:11:11.852392  / # . /lava-3900599/environment/lava-390059=
9/bin/lava-test-runner /lava-3900599/1
    2024-01-03T07:11:11.854197  =

    2024-01-03T07:11:11.867369  / # /lava-3900599/bin/lava-test-runner /lav=
a-3900599/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65950f013eb3b0456977b5a2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65950f013eb3b0456977b5ab
        failing since 210 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-03T07:38:20.387613  <8>[   13.705947] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3900780_1.5.2.4.1>
    2024-01-03T07:38:20.490741  / # #
    2024-01-03T07:38:20.591822  export SHELL=3D/bin/sh
    2024-01-03T07:38:20.592196  #
    2024-01-03T07:38:20.693000  / # export SHELL=3D/bin/sh. /lava-3900780/e=
nvironment
    2024-01-03T07:38:20.693316  =

    2024-01-03T07:38:20.793935  / # . /lava-3900780/environment/lava-390078=
0/bin/lava-test-runner /lava-3900780/1
    2024-01-03T07:38:20.794573  =

    2024-01-03T07:38:20.835899  / # /lava-3900780/bin/lava-test-runner /lav=
a-3900780/1
    2024-01-03T07:38:20.929396  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6595106436b8ed29fc77b57d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6595106436b8ed29fc77b586
        failing since 210 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-03T07:44:10.101326  / # #
    2024-01-03T07:44:10.203428  export SHELL=3D/bin/sh
    2024-01-03T07:44:10.204191  #
    2024-01-03T07:44:10.305379  / # export SHELL=3D/bin/sh. /lava-3900800/e=
nvironment
    2024-01-03T07:44:10.306114  =

    2024-01-03T07:44:10.407352  / # . /lava-3900800/environment/lava-390080=
0/bin/lava-test-runner /lava-3900800/1
    2024-01-03T07:44:10.408474  =

    2024-01-03T07:44:10.427169  / # /lava-3900800/bin/lava-test-runner /lav=
a-3900800/1
    2024-01-03T07:44:10.535726  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-03T07:44:10.536875  + cd /lava-3900800/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6595088c0aee4d51ae77b59c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6595088c0aee4d51ae77b5a5
        failing since 216 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-03T07:10:47.305920  + set +x
    2024-01-03T07:10:47.307658  [   20.079848] <LAVA_SIGNAL_ENDRUN 0_dmesg =
450661_1.5.2.4.1>
    2024-01-03T07:10:47.416283  / # #
    2024-01-03T07:10:47.517923  export SHELL=3D/bin/sh
    2024-01-03T07:10:47.518465  #
    2024-01-03T07:10:47.619480  / # export SHELL=3D/bin/sh. /lava-450661/en=
vironment
    2024-01-03T07:10:47.620308  =

    2024-01-03T07:10:47.721665  / # . /lava-450661/environment/lava-450661/=
bin/lava-test-runner /lava-450661/1
    2024-01-03T07:10:47.722561  =

    2024-01-03T07:10:47.725309  / # /lava-450661/bin/lava-test-runner /lava=
-450661/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659510355f562ffb3c77b5c7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659510355f562ffb3c77b5d0
        failing since 210 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-03T07:43:28.865499  + set +x
    2024-01-03T07:43:28.867248  [   20.177168] <LAVA_SIGNAL_ENDRUN 0_dmesg =
450685_1.5.2.4.1>
    2024-01-03T07:43:28.976196  / # #
    2024-01-03T07:43:29.077850  export SHELL=3D/bin/sh
    2024-01-03T07:43:29.078384  #
    2024-01-03T07:43:29.179365  / # export SHELL=3D/bin/sh. /lava-450685/en=
vironment
    2024-01-03T07:43:29.179892  =

    2024-01-03T07:43:29.280889  / # . /lava-450685/environment/lava-450685/=
bin/lava-test-runner /lava-450685/1
    2024-01-03T07:43:29.281760  =

    2024-01-03T07:43:29.284273  / # /lava-450685/bin/lava-test-runner /lava=
-450685/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65951110685af397f777b599

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240103/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65951110685af397f777b5a2
        failing since 210 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-03T07:47:11.357425  + set +x
    2024-01-03T07:47:11.359165  [   21.338643] <LAVA_SIGNAL_ENDRUN 0_dmesg =
450693_1.5.2.4.1>
    2024-01-03T07:47:11.466766  / # #
    2024-01-03T07:47:11.568307  export SHELL=3D/bin/sh
    2024-01-03T07:47:11.568849  #
    2024-01-03T07:47:11.669811  / # export SHELL=3D/bin/sh. /lava-450693/en=
vironment
    2024-01-03T07:47:11.670314  =

    2024-01-03T07:47:11.771305  / # . /lava-450693/environment/lava-450693/=
bin/lava-test-runner /lava-450693/1
    2024-01-03T07:47:11.772127  =

    2024-01-03T07:47:11.774800  / # /lava-450693/bin/lava-test-runner /lava=
-450693/1 =

    ... (12 line(s) more)  =

 =20

