Return-Path: <linux-next+bounces-761-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC7C831681
	for <lists+linux-next@lfdr.de>; Thu, 18 Jan 2024 11:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30A321F23607
	for <lists+linux-next@lfdr.de>; Thu, 18 Jan 2024 10:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211DB2030E;
	Thu, 18 Jan 2024 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="k11p3Eaj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D00D200BC
	for <linux-next@vger.kernel.org>; Thu, 18 Jan 2024 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705572674; cv=none; b=mlTEDnXxSX1s/QaOXzT23CbAr0c71o7J7IPZ9eGTdjhai4gDQfVTftSjIN/Rj6pwaVel2JjtihSK1hkGkugrCdC3MfpKqBzfY1s3Dqfu9IOw1+i4gQ1/d3w/7g9YwgnIEiXDfQzzUjwdoW9OAT43uyVjMn3CKpOw+nWo+Yu4c3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705572674; c=relaxed/simple;
	bh=Z7nxHBbdejko8CmngJZVzKfbCZ0uE11Q8oNxIHYK/dM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-Kernelci-Branch:X-Kernelci-Tree:
	 X-Kernelci-Kernel:X-Kernelci-Report-Type:Subject:To:From; b=IMdjrS/UGAwcdQNuQwtxQS6UhGwSU3X4/j1/FK53Ig5jXE4ITfZrtENMdldkaLsQIxAKGok50/YPhQaFuF0Q1IfNNJUkI5OsHfdUdFWyWTAn6m6uX3WEkFa9iXDhkZI5vRwsowiKTa2cGTi9kC+IN7RVUzSAE0c76OL+3dttSeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=k11p3Eaj; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5ce74ea4bf2so431745a12.0
        for <linux-next@vger.kernel.org>; Thu, 18 Jan 2024 02:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705572669; x=1706177469; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yKVarRXkD/acLPm4Y7V/stBmqfOT06/pHL2qYcGcJaE=;
        b=k11p3EajSyrVDw0W4cO6nslc1ISkvDCb3AbxntBJn4o3zt+rzaxKcWtr50zWsiAfDH
         Qexg4NphxbVhhuQLl15ID4yMEWaQFce52N3DmctVW3ns199iT1xTi+P70nvFEbHMYZJx
         SB3Xyp8jhwVH5j3AOx2TwzTvkiqvWBgsst4IfZvk6wMFcUmcgv7DRTVWPSPGkcusZukY
         k/3jNbt/J+R8tRNm39+BVz3/89N1U5eVB6yFN/+SLRbcLCLENpK57L3b5RnBh9HiVfu9
         ZsJknYrUPVvB6MCl4Yzn/+v9+Ppoge8BqwU7TQY9ZaMdDLj73ne/F1ZEUdlF7FfWTKxu
         Bseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705572669; x=1706177469;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKVarRXkD/acLPm4Y7V/stBmqfOT06/pHL2qYcGcJaE=;
        b=YChRpdRH/11q1/BL0pFw2IMxPmRuDCWoaHr6+eoBYkOVq7T+mZu/bPrntCZPKyyoiH
         HQN0d23nfxamBXKJ5exv7dhjTFB9wzCYb7zLYUWVlBTOYlVxTivg2WcU8BXyhoHDfqRJ
         YGLdVjmiw0Jq4kDPOYk9FyxVjejs5JivBPX2dgFBycF6U7LSK5KVF8va+2iYSQotfdnM
         ynCCnq7nHWgqFIHbfFEtSaEk/Q8FTKs+KdZjS6txrnWHZgNLbOrDU/c8A62/KF/fHSqT
         BJmyktTdspgUTH+GbSExaK0vCxpHBfQCsyX4nLL8Oo+qo82qKbKjepqJO0i031/p2ZCp
         pPfA==
X-Gm-Message-State: AOJu0YzXe0+t9Kj4MRXBHha2J4b3hQgxP4/DdaA8sSh/YuRO0gamu2AH
	Hi364hWwKOn0XfLs9znFJeZ2xYvENgy23hg1wdOT2WPxMjRQMZXmS44viOwZz/2soymwHOrnJbf
	9SNA=
X-Google-Smtp-Source: AGHT+IHrWeV1rrGJCU/gfp1OuEsAqCzjaZ0W/8U7HXlTenml/O6F2AYn4PH+4cQ6t16eYzZ9nXVYXA==
X-Received: by 2002:a17:90a:cf04:b0:290:1966:cc84 with SMTP id h4-20020a17090acf0400b002901966cc84mr1328471pju.1.1705572668680;
        Thu, 18 Jan 2024 02:11:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ky12-20020a170902f98c00b001d4c98c7439sm1055931plb.276.2024.01.18.02.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 02:11:08 -0800 (PST)
Message-ID: <65a8f93c.170a0220.32680.3541@mx.google.com>
Date: Thu, 18 Jan 2024 02:11:08 -0800 (PST)
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
X-Kernelci-Kernel: next-20240118
X-Kernelci-Report-Type: test
Subject: next/master baseline: 369 runs, 53 regressions (next-20240118)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 369 runs, 53 regressions (next-20240118)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip       | clang-17 | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

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
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240118/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240118
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2863b714f3ad0a9686f2de1b779228ad8c7a8052 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c15ce88d09097452a404

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65a8c15ce88d09097452a421
        failing since 227 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-18T06:12:16.860776  /lava-468519/1/../bin/lava-test-case
    2024-01-18T06:12:16.902336  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8bca95e2f1c366052a401

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8bca95e2f1c366052a=
402
        failing since 227 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c132994f1534eb52a428

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c132994f1534eb52a=
429
        failing since 295 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8cb2a340283816852a3f1

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65a8cb2a34028381=
6852a3f6
        new failure (last pass: next-20240111)
        1 lines

    2024-01-18T06:54:08.670071  / # =

    2024-01-18T06:54:08.676441  =

    2024-01-18T06:54:08.782548  / # #
    2024-01-18T06:54:08.788321  #
    2024-01-18T06:54:08.890452  / # export SHELL=3D/bin/sh
    2024-01-18T06:54:08.901198  export SHELL=3D/bin/sh
    2024-01-18T06:54:09.003058  / # . /lava-1077862/environment
    2024-01-18T06:54:09.011961  . /lava-1077862/environment
    2024-01-18T06:54:09.113470  / # /lava-1077862/bin/lava-test-runner /lav=
a-1077862/0
    2024-01-18T06:54:09.124064  /lava-1077862/bin/lava-test-runner /lava-10=
77862/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8bbf381c15ba86652a3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8bbf381c15ba86652a=
3f9
        failing since 646 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c181e51cc523b652a3fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c181e51cc523b652a=
3fc
        failing since 69 days (last pass: next-20231103, first fail: next-2=
0231110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c1a70b38ff637952a44b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c1a70b38ff637952a=
44c
        failing since 76 days (last pass: next-20231025, first fail: next-2=
0231103) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c8f0d3192c613652a5bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c8f0d3192c613652a=
5be
        new failure (last pass: next-20240117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c13f08eeacdf3052a452

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c13f08eeacdf3052a=
453
        failing since 34 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65a8c22f1578e04a9952a449

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c22f1578e04a9952a450
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-18T06:15:55.612127  / # #
    2024-01-18T06:15:55.712802  export SHELL=3D/bin/sh
    2024-01-18T06:15:55.713048  #
    2024-01-18T06:15:55.813561  / # export SHELL=3D/bin/sh. /lava-418072/en=
vironment
    2024-01-18T06:15:55.813799  =

    2024-01-18T06:15:55.914354  / # . /lava-418072/environment/lava-418072/=
bin/lava-test-runner /lava-418072/1
    2024-01-18T06:15:55.914763  =

    2024-01-18T06:15:55.926582  / # /lava-418072/bin/lava-test-runner /lava=
-418072/1
    2024-01-18T06:15:56.019541  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T06:15:56.019655  + cd /lava-418072/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65a8c22f1578e04a9952a454
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-18T06:15:58.235942  /lava-418072/1/../bin/lava-test-case
    2024-01-18T06:15:58.263912  <8>[   26.005888] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
a8c22f1578e04a9952a456
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-18T06:15:59.325755  /lava-418072/1/../bin/lava-test-case
    2024-01-18T06:15:59.352291  <8>[   27.094289] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a8c22f1578e04a9952a45b
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-18T06:16:00.584771  /lava-418072/1/../bin/lava-test-case
    2024-01-18T06:16:00.611752  <8>[   28.354084] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65a8c22f1578e04a9952a45c
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-18T06:16:01.635389  /lava-418072/1/../bin/lava-test-case
    2024-01-18T06:16:01.661146  <8>[   29.404029] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65a8c32009dbc215ed52a40b

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c32009dbc215ed52a412
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:19:55.089682  / # #
    2024-01-18T06:19:55.191894  export SHELL=3D/bin/sh
    2024-01-18T06:19:55.192590  #
    2024-01-18T06:19:55.294068  / # export SHELL=3D/bin/sh. /lava-418085/en=
vironment
    2024-01-18T06:19:55.294779  =

    2024-01-18T06:19:55.396276  / # . /lava-418085/environment/lava-418085/=
bin/lava-test-runner /lava-418085/1
    2024-01-18T06:19:55.397412  =

    2024-01-18T06:19:55.442341  / # /lava-418085/bin/lava-test-runner /lava=
-418085/1
    2024-01-18T06:19:55.497598  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T06:19:55.498080  + cd /lava-418085/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65a8c32009dbc215ed52a416
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:19:57.680096  /lava-418085/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
a8c32009dbc215ed52a418
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:19:58.745353  /lava-418085/1/../bin/lava-test-case
    2024-01-18T06:19:58.748658  <8>[   26.961055] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a8c32009dbc215ed52a41d
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:19:59.946869  /lava-418085/1/../bin/lava-test-case
    2024-01-18T06:19:59.968012  <8>[   28.174498] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65a8c32009dbc215ed52a41e
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:20:01.006116  /lava-418085/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/65a8c7d16dc5d535ae52a42c

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c7d16dc5d535ae52a433
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:40:01.634086  / # #
    2024-01-18T06:40:01.736120  export SHELL=3D/bin/sh
    2024-01-18T06:40:01.736383  #
    2024-01-18T06:40:01.837234  / # export SHELL=3D/bin/sh. /lava-418102/en=
vironment
    2024-01-18T06:40:01.837666  =

    2024-01-18T06:40:01.939139  / # . /lava-418102/environment/lava-418102/=
bin/lava-test-runner /lava-418102/1
    2024-01-18T06:40:01.940275  =

    2024-01-18T06:40:01.945968  / # /lava-418102/bin/lava-test-runner /lava=
-418102/1
    2024-01-18T06:40:02.009209  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T06:40:02.043967  + cd /lava-418102/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65a8c7d16dc5d535ae52a437
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:40:04.259746  /lava-418102/1/../bin/lava-test-case
    2024-01-18T06:40:04.288813  <8>[   26.090221] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
a8c7d16dc5d535ae52a439
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:40:05.348495  /lava-418102/1/../bin/lava-test-case
    2024-01-18T06:40:05.376651  <8>[   27.178202] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a8c7d16dc5d535ae52a43e
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:40:06.607959  /lava-418102/1/../bin/lava-test-case
    2024-01-18T06:40:06.636073  <8>[   28.437577] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65a8c7d16dc5d535ae52a43f
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:40:07.657967  /lava-418102/1/../bin/lava-test-case
    2024-01-18T06:40:07.686085  <8>[   29.487735] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c141673b1c86a552a3fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c141673b1c86a552a=
3fb
        failing since 34 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65a8c1b94ea1bc566052a459

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c1b94ea1bc566052a460
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-18T06:13:57.828773  / # #
    2024-01-18T06:13:57.929432  export SHELL=3D/bin/sh
    2024-01-18T06:13:57.929773  #
    2024-01-18T06:13:58.030459  / # export SHELL=3D/bin/sh. /lava-418070/en=
vironment
    2024-01-18T06:13:58.030778  =

    2024-01-18T06:13:58.131533  / # . /lava-418070/environment/lava-418070/=
bin/lava-test-runner /lava-418070/1
    2024-01-18T06:13:58.132443  =

    2024-01-18T06:13:58.140699  / # /lava-418070/bin/lava-test-runner /lava=
-418070/1
    2024-01-18T06:13:58.236408  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T06:13:58.236865  + cd /lava-418070/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a8c1b94ea1bc566052a473
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-18T06:14:01.173501  /lava-418070/1/../bin/lava-test-case
    2024-01-18T06:14:01.201516  <8>[   27.096073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65a8c21b1002cda74352a3ff

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c21b1002cda74352a406
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:15:43.969311  / # #
    2024-01-18T06:15:44.071187  export SHELL=3D/bin/sh
    2024-01-18T06:15:44.071918  #
    2024-01-18T06:15:44.173101  / # export SHELL=3D/bin/sh. /lava-418088/en=
vironment
    2024-01-18T06:15:44.173836  =

    2024-01-18T06:15:44.275177  / # . /lava-418088/environment/lava-418088/=
bin/lava-test-runner /lava-418088/1
    2024-01-18T06:15:44.276082  =

    2024-01-18T06:15:44.281127  / # /lava-418088/bin/lava-test-runner /lava=
-418088/1
    2024-01-18T06:15:44.380152  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T06:15:44.380592  + cd /lava-418088/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a8c21c1002cda74352a419
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:15:47.139013  /lava-418088/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65a8c7a927c63ed6c352a82d

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c7a927c63ed6c352a834
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:39:18.167607  / # #
    2024-01-18T06:39:18.268289  export SHELL=3D/bin/sh
    2024-01-18T06:39:18.268523  #
    2024-01-18T06:39:18.369033  / # export SHELL=3D/bin/sh. /lava-418099/en=
vironment
    2024-01-18T06:39:18.369266  =

    2024-01-18T06:39:18.469789  / # . /lava-418099/environment/lava-418099/=
bin/lava-test-runner /lava-418099/1
    2024-01-18T06:39:18.470149  =

    2024-01-18T06:39:18.481517  / # /lava-418099/bin/lava-test-runner /lava=
-418099/1
    2024-01-18T06:39:18.576351  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T06:39:18.576482  + cd /lava-418099/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a8c7a927c63ed6c352a847
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-18T06:39:21.511324  /lava-418099/1/../bin/lava-test-case
    2024-01-18T06:39:21.540411  <8>[   27.065855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/65a8c147673b1c86a552a3ff

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65a8c147673b1c8=
6a552a402
        failing since 43 days (last pass: next-20231120, first fail: next-2=
0231205)
        2 lines

    2024-01-18T06:12:07.230448  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-01-18T06:12:07.230668  kern  :alert : Data abort info:
    2024-01-18T06:12:07.270188  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-01-18T06:12:07.270408  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-01-18T06:12:07.270592  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-01-18T06:12:07.270804  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-01-18T06:12:07.270953  kern  <8>[   19.790636] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65a8c147673b1c8=
6a552a403
        failing since 43 days (last pass: next-20231120, first fail: next-2=
0231205)
        12 lines

    2024-01-18T06:12:07.227307  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-01-18T06:12:07.227588  kern  :alert : Mem abort info:
    2024-01-18T06:12:07.227784  kern  :alert :   ESR =3D 0x0000000096000004
    2024-01-18T06:12:07.227914  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits<8>[   19.743999] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3D=
alert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2024-01-18T06:12:07.228040  =

    2024-01-18T06:12:07.228207  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-01-18T06:12:07.228368  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8bd46c730ab474952a3fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8bd46c730ab474952a=
3fb
        new failure (last pass: next-20240111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c24a666431cdbc52a408

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c24a666431cdbc52a=
409
        failing since 344 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c12b904fb3a88c52a454

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c12b904fb3a88c52a=
455
        failing since 344 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c120994f1534eb52a41e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c120994f1534eb52a=
41f
        failing since 344 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c7bf32b0b8f71d52a405

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c7bf32b0b8f71d52a=
406
        new failure (last pass: next-20240112) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c7ad32b0b8f71d52a3f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c7ad32b0b8f71d52a=
3f4
        failing since 6 days (last pass: next-20240110, first fail: next-20=
240112) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8b7620a3c77668552a406

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8b7620a3c77668552a=
407
        new failure (last pass: next-20240117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c30a09dbc215ed52a3fd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c30a09dbc215ed52a406
        failing since 163 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-01-18T06:19:43.116887  + set +x
    2024-01-18T06:19:43.120454  <8>[   28.330116] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1077828_1.5.2.4.1>
    2024-01-18T06:19:43.229194  / # #
    2024-01-18T06:19:44.693969  export SHELL=3D/bin/sh
    2024-01-18T06:19:44.714868  #
    2024-01-18T06:19:44.715090  / # export SHELL=3D/bin/sh
    2024-01-18T06:19:46.673636  / # . /lava-1077828/environment
    2024-01-18T06:19:50.276854  /lava-1077828/bin/lava-test-runner /lava-10=
77828/1
    2024-01-18T06:19:50.298367  . /lava-1077828/environment
    2024-01-18T06:19:50.298734  / # /lava-1077828/bin/lava-test-runner /lav=
a-1077828/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c3be31d23f998a52a417

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c3be31d23f998a52a420
        failing since 170 days (last pass: next-20230712, first fail: next-=
20230801)

    2024-01-18T06:22:24.673681  + set +x
    2024-01-18T06:22:24.677021  <8>[   28.396382] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1077839_1.5.2.4.1>
    2024-01-18T06:22:24.785129  / # #
    2024-01-18T06:22:26.250072  export SHELL=3D/bin/sh
    2024-01-18T06:22:26.271028  #
    2024-01-18T06:22:26.271254  / # export SHELL=3D/bin/sh
    2024-01-18T06:22:28.228908  / # . /lava-1077839/environment
    2024-01-18T06:22:31.832478  /lava-1077839/bin/lava-test-runner /lava-10=
77839/1
    2024-01-18T06:22:31.853501  . /lava-1077839/environment
    2024-01-18T06:22:31.853678  / # /lava-1077839/bin/lava-test-runner /lav=
a-1077839/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8bcf9d35c8016cd52a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8bcf9d35c8016cd52a=
3f2
        failing since 421 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8bbf513857d5c5952a403

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8bbf513857d5c5952a=
404
        failing since 421 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c1345512159eae52a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c1345512159eae52a=
3f2
        failing since 96 days (last pass: next-20230125, first fail: next-2=
0231013) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c1355512159eae52a3f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c1355512159eae52a=
3f5
        failing since 342 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c147e88d09097452a3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a8c147e88d09097452a=
3f9
        failing since 342 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c3f37c45107c6b52a3f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c3f37c45107c6b52a3fb
        failing since 231 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-18T06:23:34.414902  / # #
    2024-01-18T06:23:34.517558  export SHELL=3D/bin/sh
    2024-01-18T06:23:34.518530  #
    2024-01-18T06:23:34.620215  / # export SHELL=3D/bin/sh. /lava-3910354/e=
nvironment
    2024-01-18T06:23:34.621096  =

    2024-01-18T06:23:34.722553  / # . /lava-3910354/environment/lava-391035=
4/bin/lava-test-runner /lava-3910354/1
    2024-01-18T06:23:34.724188  =

    2024-01-18T06:23:34.739005  / # /lava-3910354/bin/lava-test-runner /lav=
a-3910354/1
    2024-01-18T06:23:34.865476  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T06:23:34.866368  + cd /lava-3910354/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c3c8282c71af6152a402

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c3c8282c71af6152a40b
        failing since 231 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-18T06:22:49.867754  + set +x
    2024-01-18T06:22:49.869491  [   18.919545] <LAVA_SIGNAL_ENDRUN 0_dmesg =
453310_1.5.2.4.1>
    2024-01-18T06:22:49.978227  / # #
    2024-01-18T06:22:50.079758  export SHELL=3D/bin/sh
    2024-01-18T06:22:50.080274  #
    2024-01-18T06:22:50.181231  / # export SHELL=3D/bin/sh. /lava-453310/en=
vironment
    2024-01-18T06:22:50.181761  =

    2024-01-18T06:22:50.282740  / # . /lava-453310/environment/lava-453310/=
bin/lava-test-runner /lava-453310/1
    2024-01-18T06:22:50.283542  =

    2024-01-18T06:22:50.286203  / # /lava-453310/bin/lava-test-runner /lava=
-453310/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c10c27fa263a4e52a44c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c10c27fa263a4e52a455
        failing since 225 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-18T06:11:08.013729  + set +x<8>[   13.670724] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3910303_1.5.2.4.1>
    2024-01-18T06:11:08.013897  =

    2024-01-18T06:11:08.118055  / # #
    2024-01-18T06:11:08.219083  export SHELL=3D/bin/sh
    2024-01-18T06:11:08.219504  #
    2024-01-18T06:11:08.320315  / # export SHELL=3D/bin/sh. /lava-3910303/e=
nvironment
    2024-01-18T06:11:08.320688  =

    2024-01-18T06:11:08.421397  / # . /lava-3910303/environment/lava-391030=
3/bin/lava-test-runner /lava-3910303/1
    2024-01-18T06:11:08.421996  =

    2024-01-18T06:11:08.463878  / # /lava-3910303/bin/lava-test-runner /lav=
a-3910303/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c194e51cc523b652a417

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c194e51cc523b652a420
        failing since 225 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-18T06:13:33.075047  / # #
    2024-01-18T06:13:33.178000  export SHELL=3D/bin/sh
    2024-01-18T06:13:33.178874  #
    2024-01-18T06:13:33.280346  / # export SHELL=3D/bin/sh. /lava-3910328/e=
nvironment
    2024-01-18T06:13:33.281165  =

    2024-01-18T06:13:33.382720  / # . /lava-3910328/environment/lava-391032=
8/bin/lava-test-runner /lava-3910328/1
    2024-01-18T06:13:33.384347  =

    2024-01-18T06:13:33.396855  / # /lava-3910328/bin/lava-test-runner /lav=
a-3910328/1
    2024-01-18T06:13:33.477219  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-18T06:13:33.510847  + cd /lava-3910328/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c29c39902c2b4d52a43e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c29c39902c2b4d52a447
        failing since 225 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-18T06:17:46.046960  + set +x
    2024-01-18T06:17:46.048703  [   19.942717] <LAVA_SIGNAL_ENDRUN 0_dmesg =
453293_1.5.2.4.1>
    2024-01-18T06:17:46.157003  / # #
    2024-01-18T06:17:46.258702  export SHELL=3D/bin/sh
    2024-01-18T06:17:46.259339  #
    2024-01-18T06:17:46.360303  / # export SHELL=3D/bin/sh. /lava-453293/en=
vironment
    2024-01-18T06:17:46.360944  =

    2024-01-18T06:17:46.461948  / # . /lava-453293/environment/lava-453293/=
bin/lava-test-runner /lava-453293/1
    2024-01-18T06:17:46.462914  =

    2024-01-18T06:17:46.465638  / # /lava-453293/bin/lava-test-runner /lava=
-453293/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65a8c300f3086d63c452a3f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a8c300f3086d63c452a3fd
        failing since 225 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-18T06:19:31.487149  + set +x
    2024-01-18T06:19:31.488867  [   24.136247] <LAVA_SIGNAL_ENDRUN 0_dmesg =
453300_1.5.2.4.1>
    2024-01-18T06:19:31.596909  / # #
    2024-01-18T06:19:31.698470  export SHELL=3D/bin/sh
    2024-01-18T06:19:31.699014  #
    2024-01-18T06:19:31.799970  / # export SHELL=3D/bin/sh. /lava-453300/en=
vironment
    2024-01-18T06:19:31.800480  =

    2024-01-18T06:19:31.901531  / # . /lava-453300/environment/lava-453300/=
bin/lava-test-runner /lava-453300/1
    2024-01-18T06:19:31.902468  =

    2024-01-18T06:19:31.905054  / # /lava-453300/bin/lava-test-runner /lava=
-453300/1 =

    ... (12 line(s) more)  =

 =20

