Return-Path: <linux-next+bounces-2464-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90788FB0A3
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 12:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D6FCB211BB
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 10:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA9B1420D7;
	Tue,  4 Jun 2024 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0EiAAN3n"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9511713D286
	for <linux-next@vger.kernel.org>; Tue,  4 Jun 2024 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498676; cv=none; b=IUVyJ7l8LVe9nc9PBhAcMBmrsoH5H5FHMxXe6PLk9FDeTvF9UD3GqdADGs2OchNyMyGFIQooGlmw2C4JOh7dkrcFWXG+TQNQhSaZl/uzhruUAi7UScz8fHUAWm0T4+CZDPSnRuCI3T2D15OzkXh6GRRVh/umLKwJbvNXVdjHUAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498676; c=relaxed/simple;
	bh=zSJVagT+qHjSW/WCfhdA0C8bfJ85vKtLXsGFfg0l61g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=DBAXPKHgyL9wkXzvgwW5DqkoYLxkdAVhYlEjIH2eMd88xPK31rgyEk+v7y3zDvouUuBWXK7jefQ7XtyexSBVocHQG+fW+25HF3rP63H4dYVw5V9OrDYG2srO6tM7A4Ysz0rnU9EwwwEYx13iK5+iI5xFn2eWycCI1n23C6OiDAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0EiAAN3n; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f47f07acd3so8037495ad.0
        for <linux-next@vger.kernel.org>; Tue, 04 Jun 2024 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717498673; x=1718103473; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DsW6bVSSif454eyxDivJWZKWwc6WOEDejHiq42LGo2k=;
        b=0EiAAN3nOHT7I+JWbsvYc1Q9Z0It+pZ9XI1WCEuuPuIp6bB8A6lkYNZCl0ZDhEMeON
         klpEi4yG13URUtGeda2ciEu3qQz0SV9ZAB4aOO+TcZEvfV1HNi7eWOTvvQfoNUAo36n7
         yycmo7K6CPs6YEjojH+TWqtmF6inFJ1WgX+J87x0Xt1ZbBZveazJcCgsXv7W3NRBxzq6
         4s/ykk6i/Snf8lRZJSKLj52L6GTRsxOW8egxJpohwGC576KOVEGfJqXn4APTEf6gKzC3
         WfoQxcPp4A4dgKtpIdWibGaOxNdEMXKAhdzu9oV2tbh//8gWXrgukpqZEgL2ORIYTYcg
         RFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717498673; x=1718103473;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsW6bVSSif454eyxDivJWZKWwc6WOEDejHiq42LGo2k=;
        b=CId1y0aML9gRBRpb02rMwFTDW7raGr+lw4PciXJazZNBvpmuY/Ainn9gEwvWZ5WnB7
         nqFv4HDZSTWbbYKSLxuGxskFEn51XuPqT7LG5RPRvi8/Twl1PwNbWz+GzizD2olQT7V6
         nlyMw1srGoK+iaZCmKAoSY6qc0O920zr9Jm+l3b1/EU5awb0e8pGajVjxCZZNHl8dJC5
         sqEfgSRjNgmClxfShSOfhjZO5MxbgfoyD8E5N0+iDDKJwMpwc1ID+5RHxr0pPy/Ibri1
         T8RGvXyZpBvKmcdcp5G2n7xLsCvheLykXgLkXyWhwuPbIQopwVgi5jfpIYCwzPA+p6WU
         XH1Q==
X-Gm-Message-State: AOJu0YzUkPr8nSDN2RV788Rd5W6Ex5zVEidr3rFy1O3dbraxbfXE+DcN
	cfRtYI0lcNlU3JcdDxtCBifHM/hb5iRixxYt7x+tfJlrfNfOIfJP6vGE2Vv76NxuhcBSI50PEUn
	X
X-Google-Smtp-Source: AGHT+IF5XOF664hZGmQN0PxdQeaWoBWozgzf4R8C+LE18ioz4vNiNM2QvCHgRnNXDBEqI9opRltIxw==
X-Received: by 2002:a17:903:2452:b0:1f3:b9d:87e6 with SMTP id d9443c01a7336-1f636ffe8e2mr147783585ad.8.1717498673246;
        Tue, 04 Jun 2024 03:57:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63233909esm81398715ad.2.2024.06.04.03.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 03:57:52 -0700 (PDT)
Message-ID: <665ef330.170a0220.20393.50ab@mx.google.com>
Date: Tue, 04 Jun 2024 03:57:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240604
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 348 runs, 11 regressions (next-20240604)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 348 runs, 11 regressions (next-20240604)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black           | arm   | lab-cip         | gcc-10   | multi_v7_=
defconfig           | 1          =

imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
                    | 1          =

mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

r8a7743-iwg20d-q7          | arm   | lab-cip         | gcc-10   | shmobile_=
defconfig           | 1          =

rk3288-rock2-square        | arm   | lab-collabora   | clang-17 | multi_v7_=
defconfig           | 1          =

rk3288-rock2-square        | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240604/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240604
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d97496ca23a2d4ee80b7302849404859d9058bcd =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/665eb5338c7aa448b47e7080

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665eb5338c7aa448b47e7=
081
        failing since 365 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/665ebc7902843c92d47e7077

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665ebc7902843c92d47e7=
078
        failing since 433 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beaglebone-black           | arm   | lab-cip         | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/665ed17533a2ca0e727e7076

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/665ed17533a2ca0e=
727e707b
        new failure (last pass: next-20240603)
        1 lines

    2024-06-04T08:33:37.036666  / # =

    2024-06-04T08:33:37.045426  =

    2024-06-04T08:33:37.150605  / # #
    2024-06-04T08:33:37.157317  #
    2024-06-04T08:33:37.275115  / # export SHELL=3D/bin/sh
    2024-06-04T08:33:37.285307  export SHELL=3D/bin/sh
    2024-06-04T08:33:37.387201  / # . /lava-1142923/environment
    2024-06-04T08:33:37.397153  . /lava-1142923/environment
    2024-06-04T08:33:37.499073  / # /lava-1142923/bin/lava-test-runner /lav=
a-1142923/0
    2024-06-04T08:33:37.509085  /lava-1142923/bin/lava-test-runner /lava-11=
42923/0 =

    ... (9 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/665ebdc4a0c2c2e0377e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665ebdc4a0c2c2e0377e7=
06e
        new failure (last pass: next-20240603) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/665eb77b02e364e48d7e70ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665eb77b02e364e48d7e7=
0ae
        failing since 6 days (last pass: next-20240528, first fail: next-20=
240529) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/665eb95633660732247e7090

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665eb95633660732247e7=
091
        new failure (last pass: next-20240531) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/665eb92ebcef03281d7e7077

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665eb92ebcef03281d7e7=
078
        new failure (last pass: next-20240531) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7          | arm   | lab-cip         | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/665eb48c87e5d6abd57e7088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665eb48c87e5d6abd57e7=
089
        failing since 1 day (last pass: next-20240531, first fail: next-202=
40603) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-rock2-square        | arm   | lab-collabora   | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/665eb9d0517fc1f8107e708d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665eb9d0517fc1f8107e7=
08e
        failing since 74 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-rock2-square        | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/665eb69c1a4eb1b5cf7e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665eb69c1a4eb1b5cf7e7=
073
        failing since 559 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/665eb577309cf226987e707e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240604/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/665eb577309cf226987e7=
07f
        failing since 559 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

