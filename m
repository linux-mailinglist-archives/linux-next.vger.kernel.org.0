Return-Path: <linux-next+bounces-458-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8AC81861C
	for <lists+linux-next@lfdr.de>; Tue, 19 Dec 2023 12:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 944E72848F9
	for <lists+linux-next@lfdr.de>; Tue, 19 Dec 2023 11:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A9714F8D;
	Tue, 19 Dec 2023 11:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Q02rjMRM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F3B15484
	for <linux-next@vger.kernel.org>; Tue, 19 Dec 2023 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3b5f9860bso9720795ad.3
        for <linux-next@vger.kernel.org>; Tue, 19 Dec 2023 03:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702984497; x=1703589297; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MqqW7H2ab8UrIureDB478f/2A6NrIwg7NbPaevhzqiQ=;
        b=Q02rjMRMMH5/iy9cOxodbrtGGFDwDDUDJ6+bsx4qU7lwB1CPHe6Ote4LnItqHohGUi
         D6h8UGsVUnfW1WL97RDaQyZL+f9EGqI6zD2MW4mAeUmt5JZVP+6spZnKppQR5se/nZlG
         CeOzpcnqeHKy96isXuzq9TD3aDbiFnNl5c/ZOcF0u/r45eeM9mW16vSrl60rTstmm1wg
         JzOlO4T/0LBafcRwEUvbEvOTKCTIDpol6Lug/2PapbPr+Bjhr52hnqqyWpvFpqOSAjXf
         3Mx6MpZb5Ma0IMbfHPzKXfNHUOIFOswyJgzlTxClCDViHqZAqUmMdTR7QSiJfDw7GnIR
         W8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702984497; x=1703589297;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqqW7H2ab8UrIureDB478f/2A6NrIwg7NbPaevhzqiQ=;
        b=oLQDpVYr9yFzgSACO4QzAyPt0PqYj0Dz0ksC04eeYTD2lUcPGpLh6fUlZkeTgjk2yo
         4Mdvq/EWUbglhhnOTpytin5Y5amDB1c2IV/54G65ENd/+yOClakKNADS3tByE+zoCMW8
         gpzsaAfvdmjps9Acxj39sQMGrS68VmrBsjxkUQnbRIsX+7yzqL3kgMQdw1CFzBeFjuc1
         /nJGltMukoa0M+D8A4lxvofgPxxXNhfetQf+0QnSkvABlws5WT9Oet5tWkX5yDxQ1Xwc
         Jf7uXj+KU9JqlIvRM66qHM5CutGGk6k/l6xVxVa4hvuNh4umcEsrHLEeYmXYFcEKjrB3
         T3LA==
X-Gm-Message-State: AOJu0YwYKOvX1zzLXQL7dU4/B2jBHFUvGYV2oZyJN90NUwlVzcCyAIvw
	mgB1bliwclMfZ/ts51csYmWtUb0wIMJZDV9ovww=
X-Google-Smtp-Source: AGHT+IGHZ9VJZ0JcDBofSWqigxInuXKireiAJEfE2JkM+yoTEOgV1wnTN0GsNi3WtxT1kuy83jkxWA==
X-Received: by 2002:a17:902:f682:b0:1d3:bb5b:c38 with SMTP id l2-20020a170902f68200b001d3bb5b0c38mr1686854plg.46.1702984496034;
        Tue, 19 Dec 2023 03:14:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d14-20020a170902cece00b001d0cd48e08fsm20910742plg.179.2023.12.19.03.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 03:14:55 -0800 (PST)
Message-ID: <65817b2f.170a0220.201c7.c566@mx.google.com>
Date: Tue, 19 Dec 2023 03:14:55 -0800 (PST)
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
X-Kernelci-Kernel: next-20231219
Subject: next/master baseline: 411 runs, 38 regressions (next-20231219)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 411 runs, 38 regressions (next-20231219)

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

beaglebone-black             | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | clang-17 | multi_v7_=
defconfig           | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231219/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231219
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aa4db8324c4d0e67aa4670356df4e9fae14b4d37 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65814314ae0dea72e8e1348e

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65814314ae0dea72e8e134aa
        failing since 197 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-19T07:15:05.912828  /lava-372700/1/../bin/lava-test-case
    2023-12-19T07:15:05.955231  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65813e8b8d7eb950e1e134d9

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65813e8b8d7eb950e1e134f3
        failing since 197 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-19T06:55:43.883816  /lava-372533/1/../bin/lava-test-case
    2023-12-19T06:55:43.925400  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/658144fe4e775fd656e13479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/658144fe4e775fd656e13=
47a
        failing since 197 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/658140c6816f143aefe13502

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/658140c6816f143aefe13=
503
        failing since 265 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/658147e6ce2a18017de1347a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/658147e6ce2a18017de13=
47b
        new failure (last pass: next-20231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6581518067adaba485e13476

  Results:     51 PASS, 4 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6581518067adaba4=
85e134b0
        new failure (last pass: next-20231215)
        1 lines

    2023-12-19T08:16:44.250462  / # =

    2023-12-19T08:16:44.262094  =

    2023-12-19T08:16:44.364417  / # #
    2023-12-19T08:16:44.373921  #
    2023-12-19T08:16:44.474667  / # export SHELL=3D/bin/sh
    2023-12-19T08:16:44.485914  export SHELL=3D/bin/sh
    2023-12-19T08:16:44.586863  / # . /lava-1062102/environment
    2023-12-19T08:16:44.597768  . /lava-1062102/environment
    2023-12-19T08:16:44.698545  / # /lava-1062102/bin/lava-test-runner /lav=
a-1062102/0
    2023-12-19T08:16:44.709694  /lava-1062102/bin/lava-test-runner /lava-10=
62102/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/658147158b648ffcf6e1347c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/658147158b648ffcf6e13=
47d
        failing since 616 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6581421ef2a6d479fee1347d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6581421ef2a6d479fee13=
47e
        new failure (last pass: next-20231213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65813bb30598c334b5e13484

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65813bb30598c334b5e13487
        failing since 6 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-19T06:43:46.637484  + <8>[   20.219604] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 407814_1.5.2.4.1>
    2023-12-19T06:43:46.637763  set +x
    2023-12-19T06:43:46.743282  / # #
    2023-12-19T06:43:46.845429  export SHELL=3D/bin/sh
    2023-12-19T06:43:46.846082  #
    2023-12-19T06:43:46.947452  / # export SHELL=3D/bin/sh. /lava-407814/en=
vironment
    2023-12-19T06:43:46.948206  =

    2023-12-19T06:43:47.049546  / # . /lava-407814/environment/lava-407814/=
bin/lava-test-runner /lava-407814/1
    2023-12-19T06:43:47.050490  =

    2023-12-19T06:43:47.069444  / # /lava-407814/bin/lava-test-runner /lava=
-407814/1 =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65813bb30598c334b5e1348b
        failing since 6 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-19T06:43:49.222044  /lava-407814/1/../bin/lava-test-case
    2023-12-19T06:43:49.222474  <8>[   22.792183] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-19T06:43:49.222886  /lava-407814/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
813bb30598c334b5e1348d
        failing since 6 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-19T06:43:50.281785  /lava-407814/1/../bin/lava-test-case
    2023-12-19T06:43:50.282302  <8>[   23.832072] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-19T06:43:50.282646  /lava-407814/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65813bb30598c334b5e13492
        failing since 6 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-19T06:43:51.357872  /lava-407814/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65813bb30598c334b5e13493
        failing since 6 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-19T06:43:51.361144  <8>[   24.944482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-19T06:43:52.419042  /lava-407814/1/../bin/lava-test-case
    2023-12-19T06:43:52.419499  <8>[   25.966120] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-19T06:43:52.419780  /lava-407814/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/658140637b14cc118ee1347d

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658140637b14cc118ee13480
        failing since 7 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-19T07:03:35.517106  <8>[   20.261937] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 407821_1.5.2.4.1>
    2023-12-19T07:03:35.622265  / # #
    2023-12-19T07:03:35.724533  export SHELL=3D/bin/sh
    2023-12-19T07:03:35.725298  #
    2023-12-19T07:03:35.826468  / # export SHELL=3D/bin/sh. /lava-407821/en=
vironment
    2023-12-19T07:03:35.827175  =

    2023-12-19T07:03:35.928560  / # . /lava-407821/environment/lava-407821/=
bin/lava-test-runner /lava-407821/1
    2023-12-19T07:03:35.929847  =

    2023-12-19T07:03:35.948470  / # /lava-407821/bin/lava-test-runner /lava=
-407821/1
    2023-12-19T07:03:35.992567  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/658140637b14cc118ee13484
        failing since 7 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-19T07:03:38.100135  /lava-407821/1/../bin/lava-test-case
    2023-12-19T07:03:38.100564  <8>[   22.827202] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-19T07:03:38.101052  /lava-407821/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
8140637b14cc118ee13486
        failing since 7 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-19T07:03:39.159952  /lava-407821/1/../bin/lava-test-case
    2023-12-19T07:03:39.160536  <8>[   23.867575] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-19T07:03:39.160773  /lava-407821/1/../bin/lava-test-case
    2023-12-19T07:03:39.160986  <8>[   23.884842] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-12-19T07:03:39.161156  /lava-407821/1/../bin/lava-test-case
    2023-12-19T07:03:39.161353  <8>[   23.904621] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-12-19T07:03:39.161564  /lava-407821/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/658140637b14cc118ee1348b
        failing since 7 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-19T07:03:40.235547  /lava-407821/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/658140637b14cc118ee1348c
        failing since 7 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-19T07:03:40.238586  <8>[   24.980461] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-19T07:03:41.297238  /lava-407821/1/../bin/lava-test-case
    2023-12-19T07:03:41.297424  <8>[   26.002286] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-19T07:03:41.297527  /lava-407821/1/../bin/lava-test-case
    2023-12-19T07:03:41.297613  <8>[   26.020002] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-12-19T07:03:41.297697  /lava-407821/1/../bin/lava-test-case
    2023-12-19T07:03:41.297778  <8>[   26.039187] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-12-19T07:03:41.297862  /lava-407821/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65813b9f55160039c6e134a7

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65813b9f55160039c6e134aa
        failing since 6 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-19T06:43:18.220292  <8>[   20.666754] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 407812_1.5.2.4.1>
    2023-12-19T06:43:18.326334  / # #
    2023-12-19T06:43:18.428107  export SHELL=3D/bin/sh
    2023-12-19T06:43:18.428783  #
    2023-12-19T06:43:18.529822  / # export SHELL=3D/bin/sh. /lava-407812/en=
vironment
    2023-12-19T06:43:18.530467  =

    2023-12-19T06:43:18.631960  / # . /lava-407812/environment/lava-407812/=
bin/lava-test-runner /lava-407812/1
    2023-12-19T06:43:18.633097  =

    2023-12-19T06:43:18.672859  / # /lava-407812/bin/lava-test-runner /lava=
-407812/1
    2023-12-19T06:43:18.705317  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65813b9f55160039c6e134bd
        failing since 6 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-19T06:43:21.150471  /lava-407812/1/../bin/lava-test-case
    2023-12-19T06:43:21.150610  <8>[   23.559217] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-19T06:43:21.150683  /lava-407812/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6581404f1105888708e13490

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6581404f1105888708e13493
        failing since 7 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-19T07:03:27.456308  / # #
    2023-12-19T07:03:27.558439  export SHELL=3D/bin/sh
    2023-12-19T07:03:27.559054  #
    2023-12-19T07:03:27.660179  / # export SHELL=3D/bin/sh. /lava-407818/en=
vironment
    2023-12-19T07:03:27.660994  =

    2023-12-19T07:03:27.762240  / # . /lava-407818/environment/lava-407818/=
bin/lava-test-runner /lava-407818/1
    2023-12-19T07:03:27.763393  =

    2023-12-19T07:03:27.768132  / # /lava-407818/bin/lava-test-runner /lava=
-407818/1
    2023-12-19T07:03:27.836203  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T07:03:27.836626  + <8>[   21.130365] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 407818_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6581404f1105888708e134a6
        failing since 7 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-19T07:03:30.250029  /lava-407818/1/../bin/lava-test-case
    2023-12-19T07:03:30.250452  <8>[   23.555003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-19T07:03:30.250754  /lava-407818/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65813e1aaf6f502075e134a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65813e1aaf6f502075e13=
4a3
        failing since 4 days (last pass: next-20231213, first fail: next-20=
231214) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/658146f3b7c3c32938e13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/658146f3b7c3c32938e13=
476
        failing since 391 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6581465333099c511fe13475

  Results:     65 PASS, 5 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
6581465333099c511fe134b2
        new failure (last pass: next-20231214)

    2023-12-19T07:36:44.460565  <8>[   37.372114] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-driver-present RESULT=3Dpass>

    2023-12-19T07:36:45.479883  /lava-12311434/1/../bin/lava-test-case

    2023-12-19T07:36:45.501928  <8>[   38.414483] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/658145efb9eb8013ece135eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/658145efb9eb8013ece13=
5ec
        failing since 391 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65813ba063b7327715e13483

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65813ba063b7327715e13488
        failing since 328 days (last pass: next-20221219, first fail: next-=
20230125)

    2023-12-19T06:43:23.710320  / # #
    2023-12-19T06:43:23.812027  export SHELL=3D/bin/sh
    2023-12-19T06:43:23.812689  #
    2023-12-19T06:43:23.913766  / # export SHELL=3D/bin/sh. /lava-448875/en=
vironment
    2023-12-19T06:43:23.914385  =

    2023-12-19T06:43:24.015491  / # . /lava-448875/environment/lava-448875/=
bin/lava-test-runner /lava-448875/1
    2023-12-19T06:43:24.016460  =

    2023-12-19T06:43:24.020549  / # /lava-448875/bin/lava-test-runner /lava=
-448875/1
    2023-12-19T06:43:24.099709  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T06:43:24.100191  + cd /lava-448875/<8>[   19.585015] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 448875_1.5.2.4.5> =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/658140536144eeb2dce1347a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658140546144eeb2dce1347f
        failing since 328 days (last pass: next-20221219, first fail: next-=
20230125)

    2023-12-19T07:03:34.379747  / # #
    2023-12-19T07:03:34.481364  export SHELL=3D/bin/sh
    2023-12-19T07:03:34.481966  #
    2023-12-19T07:03:34.582946  / # export SHELL=3D/bin/sh. /lava-448882/en=
vironment
    2023-12-19T07:03:34.583602  =

    2023-12-19T07:03:34.684852  / # . /lava-448882/environment/lava-448882/=
bin/lava-test-runner /lava-448882/1
    2023-12-19T07:03:34.685833  =

    2023-12-19T07:03:34.689895  / # /lava-448882/bin/lava-test-runner /lava=
-448882/1
    2023-12-19T07:03:34.768990  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T07:03:34.769621  + cd /lava-448882/<8>[   19.506095] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 448882_1.5.2.4.5> =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6581465954fbd047cfe134be

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6581465954fbd047cfe134c3
        failing since 201 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-19T07:28:57.389432  / # #
    2023-12-19T07:28:57.492067  export SHELL=3D/bin/sh
    2023-12-19T07:28:57.492946  #
    2023-12-19T07:28:57.594336  / # export SHELL=3D/bin/sh. /lava-3888496/e=
nvironment
    2023-12-19T07:28:57.595233  =

    2023-12-19T07:28:57.696838  / # . /lava-3888496/environment/lava-388849=
6/bin/lava-test-runner /lava-3888496/1
    2023-12-19T07:28:57.698129  =

    2023-12-19T07:28:57.712605  / # /lava-3888496/bin/lava-test-runner /lav=
a-3888496/1
    2023-12-19T07:28:57.808155  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T07:28:57.842798  + cd /lava-3888496/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6581462dfccfae6fa5e134a6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6581462dfccfae6fa5e134ab
        failing since 201 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-19T07:28:28.984506  + set +x
    2023-12-19T07:28:28.986285  [   20.291302] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448899_1.5.2.4.1>
    2023-12-19T07:28:29.095477  / # #
    2023-12-19T07:28:29.197064  export SHELL=3D/bin/sh
    2023-12-19T07:28:29.197627  #
    2023-12-19T07:28:29.298605  / # export SHELL=3D/bin/sh. /lava-448899/en=
vironment
    2023-12-19T07:28:29.299153  =

    2023-12-19T07:28:29.400147  / # . /lava-448899/environment/lava-448899/=
bin/lava-test-runner /lava-448899/1
    2023-12-19T07:28:29.400998  =

    2023-12-19T07:28:29.404203  / # /lava-448899/bin/lava-test-runner /lava=
-448899/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/658140fd842716d8c8e134bf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658140fd842716d8c8e134c4
        failing since 195 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-19T07:06:21.358944  <8>[   12.167102] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3888392_1.5.2.4.1>
    2023-12-19T07:06:21.463177  / # #
    2023-12-19T07:06:21.564911  export SHELL=3D/bin/sh
    2023-12-19T07:06:21.565403  #
    2023-12-19T07:06:21.666212  / # export SHELL=3D/bin/sh. /lava-3888392/e=
nvironment
    2023-12-19T07:06:21.666723  =

    2023-12-19T07:06:21.767703  / # . /lava-3888392/environment/lava-388839=
2/bin/lava-test-runner /lava-3888392/1
    2023-12-19T07:06:21.768579  =

    2023-12-19T07:06:21.812089  / # /lava-3888392/bin/lava-test-runner /lav=
a-3888392/1
    2023-12-19T07:06:21.900579  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/658141df3668d9f8d2e134ba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658141df3668d9f8d2e134bf
        failing since 201 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-19T07:09:53.939300  / # #
    2023-12-19T07:09:54.043029  export SHELL=3D/bin/sh
    2023-12-19T07:09:54.043399  #
    2023-12-19T07:09:54.144060  / # export SHELL=3D/bin/sh. /lava-3888404/e=
nvironment
    2023-12-19T07:09:54.144413  =

    2023-12-19T07:09:54.245078  / # . /lava-3888404/environment/lava-388840=
4/bin/lava-test-runner /lava-3888404/1
    2023-12-19T07:09:54.245605  =

    2023-12-19T07:09:54.288116  / # /lava-3888404/bin/lava-test-runner /lav=
a-3888404/1
    2023-12-19T07:09:54.377699  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T07:09:54.377973  + cd /lava-3888404/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65814718c67d4c447ce134c4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65814718c67d4c447ce134c9
        failing since 201 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-19T07:32:12.982091  / # #
    2023-12-19T07:32:13.083361  export SHELL=3D/bin/sh
    2023-12-19T07:32:13.083886  #
    2023-12-19T07:32:13.184642  / # export SHELL=3D/bin/sh. /lava-3888506/e=
nvironment
    2023-12-19T07:32:13.185119  =

    2023-12-19T07:32:13.285890  / # . /lava-3888506/environment/lava-388850=
6/bin/lava-test-runner /lava-3888506/1
    2023-12-19T07:32:13.286492  =

    2023-12-19T07:32:13.328113  / # /lava-3888506/bin/lava-test-runner /lav=
a-3888506/1
    2023-12-19T07:32:13.429159  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T07:32:13.429671  + cd /lava-3888506/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6581408e72c72d9409e134d2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6581408e72c72d9409e134d7
        failing since 195 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-19T07:04:32.600898  + set +x
    2023-12-19T07:04:32.602644  [   21.673598] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448884_1.5.2.4.1>
    2023-12-19T07:04:32.711540  / # #
    2023-12-19T07:04:32.813089  export SHELL=3D/bin/sh
    2023-12-19T07:04:32.813568  #
    2023-12-19T07:04:32.914524  / # export SHELL=3D/bin/sh. /lava-448884/en=
vironment
    2023-12-19T07:04:32.915041  =

    2023-12-19T07:04:33.016043  / # . /lava-448884/environment/lava-448884/=
bin/lava-test-runner /lava-448884/1
    2023-12-19T07:04:33.017022  =

    2023-12-19T07:04:33.019865  / # /lava-448884/bin/lava-test-runner /lava=
-448884/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/658141b98f848e9631e134ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658141b98f848e9631e134f1
        failing since 201 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-19T07:09:27.596554  + set +x
    2023-12-19T07:09:27.598389  [   19.218562] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448888_1.5.2.4.1>
    2023-12-19T07:09:27.708948  / # #
    2023-12-19T07:09:27.810499  export SHELL=3D/bin/sh
    2023-12-19T07:09:27.811048  #
    2023-12-19T07:09:27.911973  / # export SHELL=3D/bin/sh. /lava-448888/en=
vironment
    2023-12-19T07:09:27.912533  =

    2023-12-19T07:09:28.013562  / # . /lava-448888/environment/lava-448888/=
bin/lava-test-runner /lava-448888/1
    2023-12-19T07:09:28.014454  =

    2023-12-19T07:09:28.017988  / # /lava-448888/bin/lava-test-runner /lava=
-448888/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/658146f5a1716c3344e1347c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658146f5a1716c3344e13481
        failing since 201 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-19T07:31:47.630572  [   23.107317] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448903_1.5.2.4.1>
    2023-12-19T07:31:47.738331  / # #
    2023-12-19T07:31:47.839946  export SHELL=3D/bin/sh
    2023-12-19T07:31:47.840513  #
    2023-12-19T07:31:47.941517  / # export SHELL=3D/bin/sh. /lava-448903/en=
vironment
    2023-12-19T07:31:47.942061  =

    2023-12-19T07:31:48.043025  / # . /lava-448903/environment/lava-448903/=
bin/lava-test-runner /lava-448903/1
    2023-12-19T07:31:48.043892  =

    2023-12-19T07:31:48.046699  / # /lava-448903/bin/lava-test-runner /lava=
-448903/1
    2023-12-19T07:31:48.137057  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65813f9967d6894287e13498

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65813f9967d6894287e1349d
        failing since 7 days (last pass: next-20231208, first fail: next-20=
231211)

    2023-12-19T07:00:23.155318  / # #
    2023-12-19T07:00:23.256392  export SHELL=3D/bin/sh
    2023-12-19T07:00:23.256737  #
    2023-12-19T07:00:23.357493  / # export SHELL=3D/bin/sh. /lava-3888323/e=
nvironment
    2023-12-19T07:00:23.357824  =

    2023-12-19T07:00:23.458582  / # . /lava-3888323/environment/lava-388832=
3/bin/lava-test-runner /lava-3888323/1
    2023-12-19T07:00:23.459125  =

    2023-12-19T07:00:23.468597  / # /lava-3888323/bin/lava-test-runner /lav=
a-3888323/1
    2023-12-19T07:00:23.603480  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T07:00:23.603682  + cd /lava-3888323/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65813f9ba73edbe0c3e1347e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231219/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231219/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65813f9ba73edbe0c3e13483
        failing since 4 days (last pass: next-20231213, first fail: next-20=
231214)

    2023-12-19T07:00:14.703863  / # #
    2023-12-19T07:00:14.805013  export SHELL=3D/bin/sh
    2023-12-19T07:00:14.805363  #
    2023-12-19T07:00:14.906132  / # export SHELL=3D/bin/sh. /lava-3888325/e=
nvironment
    2023-12-19T07:00:14.906477  =

    2023-12-19T07:00:15.007254  / # . /lava-3888325/environment/lava-388832=
5/bin/lava-test-runner /lava-3888325/1
    2023-12-19T07:00:15.007825  =

    2023-12-19T07:00:15.016534  / # /lava-3888325/bin/lava-test-runner /lav=
a-3888325/1
    2023-12-19T07:00:15.182506  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T07:00:15.182736  + cd /lava-3888325/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

