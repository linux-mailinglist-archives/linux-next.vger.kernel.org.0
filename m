Return-Path: <linux-next+bounces-2211-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9B8BEE24
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 22:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54163281077
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 20:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51EF3C097;
	Tue,  7 May 2024 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="DOKliCOw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8990BB652
	for <linux-next@vger.kernel.org>; Tue,  7 May 2024 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715113861; cv=none; b=tfdX3upuoqotW437SWlDTQdcHKPJHuka7WHdzvjRn4TY2c7adyBppSVzI/fJmCFfSeTJqmr1rdVjwnTG2dJBURiH5Zti3s36UuLm4Cv0LfEK2/K/1XmrTxkdfdsBIMcHr39pG8fQc30GuaICEzQLk28ivZaTIddzcRRSU9saZx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715113861; c=relaxed/simple;
	bh=qAZaNwS7ki3QMWpROzImYjm5UdhDHTTsCyPrFR1L7kE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=iYywfNxmebAgsUg+1l+6RjRbnCHzlokn1YFHXZJTvrHzg2uRCSiLh4//fWZzTiTdL1b2hv+qxp/LACklMfw0sGdC7miCTHuL3YcFNBI8dG0LEh+Y75TGr+6FPOMO54sHB+n/TO0r6hM8QRaYyZIbFUTXib6oSKhTzqAuKA7aK2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=DOKliCOw; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so112253a12.0
        for <linux-next@vger.kernel.org>; Tue, 07 May 2024 13:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715113858; x=1715718658; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PDrEA0c8IOiCCPoq04GRVYK5EnHnXl+pDKkjsVRyiQU=;
        b=DOKliCOwzfQUys5SLMjPYgG16+5O+uv8uBJ7kxMBP5aq2/M3Z/OiBoDSr//ijWmk6w
         EhhWQh/0ajDNB/XUhOGIsRJorEfaI81q1UfDpx8oTGfpFFyUgO2NtGUeVA2eHAm483u8
         L7kzztv9M0Qgth/X3is9/eWG4PVRwUydOFj4h2kJa+IjQnNSct5j7cTHY71E1+NuzK+9
         RYKjKQSOnJTLCpGYfPiaeG0kQK9RtEBP+d7wXLhcV3J5QWUvmKWNbZoDsntQtvsrmwrK
         upyAxgnYGwFKeWm83TigNPNfCuVdDBiH+4Lnzrr+9k8DeHQFUeiCgft/xJ7W+5Yo9cDd
         3/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715113858; x=1715718658;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDrEA0c8IOiCCPoq04GRVYK5EnHnXl+pDKkjsVRyiQU=;
        b=CSnFE84SibihUHQujhbuL3kQYWJqVIuk0XlVx7cP+qu2ZwvB6SbFmjikbYoaP8ukcn
         bi/HcNfsajPfs/WviU0l9mShOKoLp3/jv3OkOhYUUMI5ChAKpIwapyPc9TXUd/58f//M
         aFTHv1xR+fdQrrHemf2x8f6qQTCcErQ2N3Csn3S+rJlU2ifjLLGF0a+NoE8CrWelfCYq
         AVCD97Z7qxhV6OhibA2IId9cVeR7QZRh9MGvrt12SOIjeYDbNUdkGLJPJGh0B24JebKA
         +z2wxw3A1ivw34s+aguaTp8owjRuaPNOrK8F6HiDgCPWQ+AQsXG6FKUyDPdX3eWhJKCY
         Cx1Q==
X-Gm-Message-State: AOJu0YxgqYHWhtyKXBCATU28NSV6Zg35VYUvmfULuB2xNxm9l4a1dDsJ
	9OAJnle3qyMSdQnaLG3jPajfkVy2jOm5SeBqmf6CgClSCezeRf2uxCTqoqlu/0C3vHWjjPS/HYu
	7
X-Google-Smtp-Source: AGHT+IHaXxr1TfMIgo2aHri6CuzRdYUTfNuJZ4L+kAI4LGbShX4EAYriyZoSuLegTJ1b9ANOcy/CPg==
X-Received: by 2002:a17:90a:a10f:b0:2b6:215b:e236 with SMTP id 98e67ed59e1d1-2b6215bf22fmr147251a91.23.1715113858408;
        Tue, 07 May 2024 13:30:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id pt7-20020a17090b3d0700b002b284a01223sm12424161pjb.5.2024.05.07.13.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 13:30:58 -0700 (PDT)
Message-ID: <663a8f82.170a0220.3dcae.8f16@mx.google.com>
Date: Tue, 07 May 2024 13:30:58 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240507
X-Kernelci-Report-Type: test
Subject: next/master baseline: 186 runs, 13 regressions (next-20240507)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 186 runs, 13 regressions (next-20240507)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | bcm2835_defconfig=
            | 1          =

bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

beagle-xm            | arm   | lab-baylibre  | gcc-10   | omap2plus_defconf=
ig          | 1          =

beaglebone-black     | arm   | lab-cip       | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre  | clang-17 | defconfig        =
            | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-10   | defconfig        =
            | 1          =

jetson-tk1           | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfi=
g           | 1          =

odroid-xu3           | arm   | lab-collabora | gcc-10   | exynos_defconfig =
            | 1          =

odroid-xu3           | arm   | lab-collabora | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

odroid-xu3           | arm   | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 1          =

odroid-xu3           | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

r8a7743-iwg20d-q7    | arm   | lab-cip       | gcc-10   | shmobile_defconfi=
g           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240507/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240507
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      93a39e4766083050ca0ecd6a3548093a3b9eb60c =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | bcm2835_defconfig=
            | 1          =


  Details:     https://kernelci.org/test/plan/id/663a4f8214337591534c448a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a4f8214337591534c4=
48b
        failing since 337 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/663a564f40cb4fc6434c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a564f40cb4fc6434c4=
2ee
        failing since 406 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/663a571c81a99797c74c4367

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a571c81a99797c74c4=
368
        failing since 403 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beagle-xm            | arm   | lab-baylibre  | gcc-10   | omap2plus_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/663a5870ff420125a64c42f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a5870ff420125a64c4=
2f7
        failing since 8 days (last pass: next-20240426, first fail: next-20=
240429) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
beaglebone-black     | arm   | lab-cip       | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/663a532e2a484c4caa4c42f2

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/663a532e2a484c4c=
aa4c42f7
        new failure (last pass: next-20240506)
        1 lines

    2024-05-07T16:13:19.693377  / # =

    2024-05-07T16:13:19.702318  =

    2024-05-07T16:13:19.808288  / # #
    2024-05-07T16:13:19.813936  #
    2024-05-07T16:13:19.957538  / # export SHELL=3D/bin/sh
    2024-05-07T16:13:19.974144  export SHELL=3D/bin/sh
    2024-05-07T16:13:20.075931  / # . /lava-1129552/environment
    2024-05-07T16:13:20.086027  . /lava-1129552/environment
    2024-05-07T16:13:20.187970  / # /lava-1129552/bin/lava-test-runner /lav=
a-1129552/0
    2024-05-07T16:13:20.197989  /lava-1129552/bin/lava-test-runner /lava-11=
29552/0 =

    ... (9 line(s) more)  =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre  | clang-17 | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/663a5ccdab888b17da4c4307

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a5ccdab888b17da4c4=
308
        failing since 1 day (last pass: next-20240503, first fail: next-202=
40506) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-10   | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/663a4fa6309e2b82da4c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a4fa6309e2b82da4c4=
2dc
        failing since 1 day (last pass: next-20240503, first fail: next-202=
40506) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
jetson-tk1           | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/663a5372dc7d15063d4c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a5372dc7d15063d4c4=
2e0
        failing since 48 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
odroid-xu3           | arm   | lab-collabora | gcc-10   | exynos_defconfig =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/663a4ea6fe33cf08e24c431d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a4ea6fe33cf08e24c4=
31e
        failing since 1 day (last pass: next-20240503, first fail: next-202=
40506) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
odroid-xu3           | arm   | lab-collabora | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/663a5114c01b42a5154c42fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-odroid-xu3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-odroid-xu3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a5114c01b42a5154c4=
2fd
        failing since 1 day (last pass: next-20240503, first fail: next-202=
40506) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
odroid-xu3           | arm   | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/663a52f2f572adf15d4c4308

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a52f2f572adf15d4c4=
309
        failing since 1 day (last pass: next-20240501, first fail: next-202=
40506) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
odroid-xu3           | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/663a563df9a401179c4c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a563df9a401179c4c4=
2e2
        failing since 1 day (last pass: next-20240503, first fail: next-202=
40506) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
r8a7743-iwg20d-q7    | arm   | lab-cip       | gcc-10   | shmobile_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/663a4e15641d3e35694c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240507/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240507/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a4e15641d3e35694c4=
2ee
        failing since 4 days (last pass: next-20240502, first fail: next-20=
240503) =

 =20

