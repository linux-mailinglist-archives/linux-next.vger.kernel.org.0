Return-Path: <linux-next+bounces-2354-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE058C983F
	for <lists+linux-next@lfdr.de>; Mon, 20 May 2024 05:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CA551F21E5D
	for <lists+linux-next@lfdr.de>; Mon, 20 May 2024 03:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6A5E576;
	Mon, 20 May 2024 03:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="oyVpYjHy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D11E542
	for <linux-next@vger.kernel.org>; Mon, 20 May 2024 03:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716175630; cv=none; b=IJM5TKm5Xqu/Ydh/7G2mR0959lphSDSRIKT8v/dIfKJJgPkBbTShgJ0ywOenVUoLMaEAGrUhzYvHmZEbdSH+9KxbrjKyyvzZP5jBrUTJmuCtim3WOC+c5JPswV6R+Pw6bfh+0pAhw2RCGTz48MxGm9xkus3PE7INiDAaeB7jHBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716175630; c=relaxed/simple;
	bh=6p4ndKTJOwxZsKgTkZ1y661RPc/rHaQ85ZFMSgvD2Gk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=HlWblQev9qh4UZZ+YjS03v/BezWEXBd5czAGHsnZIapX86eYcl2gfaRwrK2osWPd1VUFmoS1ZB2e8Aq8tqErVPziE8JPGuW+/5k2hs/8tqPnBieKE3MhUMNcK1kN0cRndsIRW6AHbUlCipOIr0l9mvtstvrcd4xeGLj8CAKQYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=oyVpYjHy; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6f0fbd2d9ebso1854790a34.2
        for <linux-next@vger.kernel.org>; Sun, 19 May 2024 20:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716175627; x=1716780427; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DVYg4XEN3Zo+AHQBc44rD2A36QfVGnPXiffWNZmCWh0=;
        b=oyVpYjHymZx3b+CiIoYDNUxdI2FbnauXcyrJGHndix/y2YP4IB5XknGNzU5sI0Zq9k
         a/nLlPGsICOx6B7TBbTy7oIUmX/THLOQaNpZIKeSTwMIv8O46Rq/xMVeXyz+yXuGYjKU
         cTMbTl/+r2rGr8DCrRfPlfUG0qcSxHxaVm+oAUKmpGhA5AvaQKqi+feD8LzKMW1BhAtC
         r4Dq/BkZ1UuszUD8idzYJxCZY3HdWrpRD2hCc0pNBunblZlhtr7qRDOtYehY61Y840Mk
         wWfKo6s9G2nAn3cGMcYhsp03BlaLB8HXnE7O0eOwI8KTwvqzUOO/r4zUPbHA2BFfKLcW
         GyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716175627; x=1716780427;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVYg4XEN3Zo+AHQBc44rD2A36QfVGnPXiffWNZmCWh0=;
        b=pj0ij2O/abNJlseThDnwQegqHGVmZVqidujl/5U9y4RkxqPGXH9/t08vX5uy1xcwIO
         MGMvnOPw1nCzRUVId+Uepd4jVxdc54HPd4KZklx24gbpMOvcUUxudBfr1365QlSUEpOs
         4md8r3949AOoPPErA7vXJwrz9cYNDCsUaAps54hxsNmRazRCE1ql6plwX1FRSV4bffxD
         nzMD8mSVJVLCMgfn7oeDzvPsLDpm2wp8U0zUtL5n1QgQRkTkZJPAq39u9ChiL2kvHZLe
         XGc/iEAHq8VBl6AUxOs/EA2w6AgAryF+pZG9vDXmA182dkECwxqBzQ6wM/iMaDQiRo5b
         Vpgg==
X-Gm-Message-State: AOJu0YwRW1pyh4M8eziRVTaTblpKZiYX69CBrzvZ5Y8mB+yvP/h3Fvyx
	sbORj2CDfhIMDsa7lHZSbCJsGBZtvPzRdtNTtHoInYeiqTXNXPujiOGQY4g6dwSZEyzQpNEL+N9
	AnzY=
X-Google-Smtp-Source: AGHT+IF10VsjWueChZEL5AsB6KHyEA8wIVDTwFGgBIMDnGufUz5pl+NRakWd0Mb/eaZseiGrJCjVRw==
X-Received: by 2002:a05:6830:1e57:b0:6f0:537d:fc98 with SMTP id 46e09a7af769-6f0e92c0cf3mr39775213a34.37.1716175626619;
        Sun, 19 May 2024 20:27:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-65dac8e6b9fsm5127754a12.6.2024.05.19.20.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 20:27:06 -0700 (PDT)
Message-ID: <664ac30a.630a0220.9d59d.d9ca@mx.google.com>
Date: Sun, 19 May 2024 20:27:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.9-9758-gebddc92261ee1
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 79 runs,
 5 regressions (v6.9-9758-gebddc92261ee1)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 79 runs, 5 regressions (v6.9-9758-gebddc92261e=
e1)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
beaglebone-black             | arm   | lab-cip      | gcc-10   | multi_v7_d=
efconfig | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-10   | defconfig =
         | 1          =

imx8mp-evk                   | arm64 | lab-broonie  | gcc-10   | defconfig =
         | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie  | gcc-10   | defconfig =
         | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-9758-gebddc92261ee1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-9758-gebddc92261ee1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ebddc92261ee1afeaa80c6e814571de209b06913 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
beaglebone-black             | arm   | lab-cip      | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/664a9f5260809318384c4316

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bla=
ck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bla=
ck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/664a9f5260809318=
384c431b
        failing since 3 days (last pass: v6.9-7443-gb449e3dad2d62, first fa=
il: v6.9-8349-g458b2d56b05c)
        1 lines

    2024-05-20T00:54:34.216769  / # =

    2024-05-20T00:54:34.225513  =

    2024-05-20T00:54:34.330580  / # #
    2024-05-20T00:54:34.337413  #
    2024-05-20T00:54:34.481472  / # export SHELL=3D/bin/sh
    2024-05-20T00:54:34.497347  export SHELL=3D/bin/sh
    2024-05-20T00:54:34.599074  / # . /lava-1134934/environment
    2024-05-20T00:54:34.609206  . /lava-1134934/environment
    2024-05-20T00:54:34.711073  / # /lava-1134934/bin/lava-test-runner /lav=
a-1134934/0
    2024-05-20T00:54:34.721114  /lava-1134934/bin/lava-test-runner /lava-11=
34934/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/664a9130a81605a2504c4346

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed=
-a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed=
-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664a9130a81605a2504c4=
347
        new failure (last pass: v6.9-8349-g458b2d56b05c) =

 =



platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
imx8mp-evk                   | arm64 | lab-broonie  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/664ab4cc795815fc844c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664ab4cc795815fc844c4=
2dc
        new failure (last pass: v6.9-8349-g458b2d56b05c) =

 =



platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/664abf9995400c87c34c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-non=
wifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-non=
wifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664abf9995400c87c34c4=
2db
        new failure (last pass: v6.9-8349-g458b2d56b05c) =

 =



platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/664a9091dbe9e637064c4300

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-9758-g=
ebddc92261ee1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/664a9091dbe9e637064c4=
301
        failing since 55 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

