Return-Path: <linux-next+bounces-2350-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607168C83D1
	for <lists+linux-next@lfdr.de>; Fri, 17 May 2024 11:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83C461C22BA5
	for <lists+linux-next@lfdr.de>; Fri, 17 May 2024 09:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE6D22EE8;
	Fri, 17 May 2024 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lDRXCUUf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A8225D9
	for <linux-next@vger.kernel.org>; Fri, 17 May 2024 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715938468; cv=none; b=WKtcHMJSSnqZAAMhqE3wr5jCSZZCgSCORopxP/X2TK+D0iNkLj28fXUYyBMDq1qkQQaJW/WpVvySBv0cE9bffuAB43V5lk0W4Hwo/+IMk8nlr2nx+/NQbNwMjXca3qT1cM93CekUAdaGHSGYAdsGA9AcVMJO1C9QRkNX8+AEZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715938468; c=relaxed/simple;
	bh=bVx61qORNZkoEYfDGsLwPT5eY4rBo3sAFK7Ree3p3a8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PRRFZ+c/ac+9qWrjKxTwzqwkZU9aCIH/jL1mElDy0gLH2hNgRA2VFX5FLfrGUAffp5liyKvK39srkThevHIZ0GucZ56F2G4bX3FflWbFJb85o3xvFMTGzufyH3QWpOXgQ3qnBeq0W5tOOtcg1ydo20/+Gz02yDHjEfBTR0W539s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=lDRXCUUf; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5f80aa2d4a3so1009876a12.0
        for <linux-next@vger.kernel.org>; Fri, 17 May 2024 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715938465; x=1716543265; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bUxFpZpvKHWCPWB4YpZUauiliZHaDt4VKo482wh88lQ=;
        b=lDRXCUUfg1ZG94PZLLmQwCMembdevLJrNWGsc53JuGxKMBHV7ujziumy65R4hBQ35W
         lMzfwbaHp0odL/n6H7fgWc5Zvv9Inpw+QioJwwFnWvMyUYxeKLw3OE2Y5UvlEkc5jUTu
         2Sb4LLvQu9LBN/06FPWINurO+iuxPjrfriOICpT64W1H9ROCkueZiqXJ37BqQYD4EE/o
         1dCrsB5H7poepBd4Exe4/56aU3GybyjGxNVfXrctNTXMehKdn9QLorFa22rlA8Ey+wBU
         RunC0pMyzrbQ/4CKCW3jyqQOwmOo26AlDZrM93u0LB6ejtdiu0SND9i2qZ0YjyZWs+lR
         cs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715938465; x=1716543265;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUxFpZpvKHWCPWB4YpZUauiliZHaDt4VKo482wh88lQ=;
        b=xDXEcwBaOTWToRC69+jV5P1FEOuszc3f2AraFlWTyT1nUgJDHw7ppMGYBU1wg6ZOpB
         73j6QKRmmRndTOSSlhDT9Ln8C4HzdH0iqn8bw1D0lSAp22Q4hrIDcelPiFJUIheMmypP
         AC8rvpsBCgStF566k8CkdSDOAoxP21IqOCOsw1SkfDLx/lvHzVBMA4PXl8dsuSsXPBuj
         w94sg/6Hw0SblEJW9wRQrV9V0KtzapofeTBE57m/pMZya/7SebAgZQt2x9TTTd0mEQGg
         kkaJ2sM2tKPXqSnKwG4dMQ9HaKr8N18T3FzHDCwe6lVgUi4SjThf8vF3ffeUJnu5tep9
         r0rQ==
X-Gm-Message-State: AOJu0YzCJZiPEde0AESCseLVLQPmznUJejfb4aTt0lbM6le64b9xO7OE
	QPxbbQUUN2KMsKPJm7PuUtULTkv13rWRLq+PpqG84kKV9NYbx1z0PtDIzLy/3uuAWaI7i+Htbm6
	llGJ/HA==
X-Google-Smtp-Source: AGHT+IH+0xphoW5bbrEYKM3PQloMG3tCbs0J0MG2l0PVo+/EjEIObsZ+thPO6cOHD+021xKxkoDOQQ==
X-Received: by 2002:a17:902:c407:b0:1eb:61a4:a2bc with SMTP id d9443c01a7336-1ef43f4d1e0mr238634725ad.43.1715938464797;
        Fri, 17 May 2024 02:34:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f2db5cf474sm22320905ad.176.2024.05.17.02.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:34:24 -0700 (PDT)
Message-ID: <664724a0.170a0220.53a1.5b79@mx.google.com>
Date: Fri, 17 May 2024 02:34:24 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240517
X-Kernelci-Report-Type: test
Subject: next/master baseline: 386 runs, 19 regressions (next-20240517)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 386 runs, 19 regressions (next-20240517)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | clang-17 | multi_v7_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240517/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240517
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c75962170e49f24399141276ae119e6a879f36dc =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6646ece66db8ee7fe54c42e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646ece66db8ee7fe54c4=
2ea
        failing since 471 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6646e8c8f167b1cf9e4c4468

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646e8c8f167b1cf9e4c4=
469
        failing since 347 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6646e71114fd3f21d94c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646e71114fd3f21d94c4=
2de
        new failure (last pass: next-20240516) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6646eb9eecce3a71204c42ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646eb9eecce3a71204c4=
2ef
        failing since 0 day (last pass: next-20240403, first fail: next-202=
40516) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6646ee6e22d515ed274c42ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646ee6e22d515ed274c4=
2ed
        failing since 22 days (last pass: next-20240408, first fail: next-2=
0240424) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6646f424fbba4d0dba4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646f424fbba4d0dba4c4=
2db
        failing since 22 days (last pass: next-20240415, first fail: next-2=
0240424) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6646edb721b7ad59814c42eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646edb721b7ad59814c4=
2ec
        failing since 0 day (last pass: next-20240403, first fail: next-202=
40516) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6646f04dc542c662774c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ve=
rdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ve=
rdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646f04dc542c662774c4=
2dd
        failing since 22 days (last pass: next-20240408, first fail: next-2=
0240424) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6646f53821ccfcaccc4c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646f53821ccfcaccc4c4=
2dc
        failing since 22 days (last pass: next-20240415, first fail: next-2=
0240424) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6646eab40892d131744c430c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646eab40892d131744c4=
30d
        failing since 766 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6646eecfb703eb0be24c4709

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646eecfb703eb0be24c4=
70a
        failing since 57 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/6646ed55aade66f9ea4c42f2

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6646ed55aade66f=
9ea4c42f5
        new failure (last pass: next-20240403)
        2 lines

    2024-05-17T05:37:50.878657  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-05-17T05:37:50.878916  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-05-17T05:37:50.879082  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-05-17T05:37:50.879235  kern  :alert : [ccccccccccccccd4] ad<8>[   =
20.217193] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6646ed55aade66f=
9ea4c42f6
        new failure (last pass: next-20240403)
        12 lines

    2024-05-17T05:37:50.836363  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address ccccccccccccccd4
    2024-05-17T05:37:50.837089  kern  :alert : Mem abort info:
    2024-05-17T05:37:50.837906  kern  :alert :   ESR =3D 0x0000000096000004
    2024-05-17T05:37:50.838605  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits<8>[   20.175610] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3D=
alert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2024-05-17T05:37:50.839710  =

    2024-05-17T05:37:50.840316  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-05-17T05:37:50.840874  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-05-17T05:37:50.841443  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-05-17T05:37:50.842017  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6646e9ed8a478c2cea4c42e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646e9ed8a478c2cea4c4=
2ea
        failing since 1 day (last pass: next-20240513, first fail: next-202=
40515) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6646ecece8739e09494c437d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646ecece8739e09494c4=
37e
        failing since 56 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6646eb70fec9022b814c4328

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646eb70fec9022b814c4=
329
        failing since 541 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6646ea6c8ad38ebb674c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646ea6c8ad38ebb674c4=
2ee
        failing since 541 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6646e5cf6a59e05ba64c42f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-k=
ingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-k=
ingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646e5cf6a59e05ba64c4=
2f3
        failing since 3 days (last pass: next-20240506, first fail: next-20=
240513) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6646e59833966316ee4c464c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240517/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6646e59833966316ee4c4=
64d
        failing since 3 days (last pass: next-20240506, first fail: next-20=
240513) =

 =20

