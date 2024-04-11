Return-Path: <linux-next+bounces-1881-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8612B8A17BC
	for <lists+linux-next@lfdr.de>; Thu, 11 Apr 2024 16:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 142361F22EFF
	for <lists+linux-next@lfdr.de>; Thu, 11 Apr 2024 14:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B784D524;
	Thu, 11 Apr 2024 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="pTQHg8bo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9EBD517
	for <linux-next@vger.kernel.org>; Thu, 11 Apr 2024 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712846652; cv=none; b=s8GHHuoIPiifzCWDfFs229HKfJfzIeGqgOlsMal4KPgqGrBAz5RRkUzKBmUAalLOXMVhShaxe1CQ5fhLIJ9ro5hrbMG5Uvhwa+s0bk+N+tmcmraKgo5371+nSZnSVVs2fqQS79bxmJ6Lt9CVBneioRr2IelX52XPSY8Pi+fLcbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712846652; c=relaxed/simple;
	bh=Mbc0O3l8eQuVp+n5a2GRIozrWq4EZ3uRSzjIWph6W20=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=LH9mbyJcMrQy4Vz4qsf3AvueW67JciW0ausaO2/Eih+pf5O9R+rJznOaocZ2sThdWUuGpEst4z4lf75QzQL/VdWTBhxgpyuhLRhk6/vaTnaRy3Zs8nJjGoCXYNRNH4V8bsBQgtIopniAJva6Er4826JDQzilu6GztMbZx11VtUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=pTQHg8bo; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ed32341906so3802153b3a.1
        for <linux-next@vger.kernel.org>; Thu, 11 Apr 2024 07:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712846649; x=1713451449; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Nd/X94wrGZXuXBCs7aCBEsQsG2pXY0ZNXqhhIGAj+s=;
        b=pTQHg8boNOW78PrcYPVk1ZKyZqz0repd7xObTTnXaLLQCb6f+rDg5qeNyi0UZ3CIq2
         7MbYZgjkwSxiGKs4pe/1Jj5W8T5e0gwEbUdk7zAIPcePL5EMcNLZHGPIo1DRVOKeZLeE
         2dTLWqjIB+2vLQbUlDKkakXzy4If2sZAFgmN6iIrQlhjtBqxQlPSP4WZjOBU17MDn0kM
         DsiWBLlCQdifHLeqQzO7IMgasW8qBR3/FXIAdvMJsW/GhSntaSr1hWUtnQkxQoP9iOVG
         gckQGGwjEW5PB2J3Q5d6SDfTmW8ps4y4vkSVaVNvhPzzHnWGbl/cUk+yZfwL8542FnLk
         FT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712846649; x=1713451449;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Nd/X94wrGZXuXBCs7aCBEsQsG2pXY0ZNXqhhIGAj+s=;
        b=coqAzDFTZ/kca7IQ/2uY7DmTrxhLMfCDinfMrpC3JqYGqI5DR6+leL1yvFocP3UzBi
         vTzFcNa3JCRgA6PG/5KLLaRFnErqz6F9jECq1ohr1KcfQXxleDCZ9lWgwcKRfrusR4c2
         aJ7GFYA/eROA7sqrBqqli5hopmYeEwMONDSA43fNSQz9ybKRznJi7xuy+ZZW3qcDkdDQ
         JOgLxdohnnBUI4UVZJ10Z+/0VKwFyqYAZyHOV3Xk1zYwbczVlnH9Fom5DM3yr6Wjt5Bj
         U2VTt8962eFnmS1HK3KTjuVQeVj9cRabPRD+GQ88NOD1OVxSieI2ddBrVdksNmDKTzVy
         NUTw==
X-Gm-Message-State: AOJu0YwS4HSNRPR74zusmGYeXYKWUqqR52lLL+Zdfyom0ooz4SzmTnS6
	A37ldxHFNa+Crn2hKzFuQPixLv+RL2AtLbl+IoKhJ4l7yRGUi/hNJwFRlsmBldWFN+9cQMr3Wx+
	UhzM=
X-Google-Smtp-Source: AGHT+IGfF2uF8XBMVT9s2XMxqviV0yC1TxhxV4zPhcAL++VOqFWpGTOCd1SJ9CEoDNNW9P5J6oGnaQ==
X-Received: by 2002:a17:902:6805:b0:1e4:7cc5:2292 with SMTP id h5-20020a170902680500b001e47cc52292mr5164247plk.49.1712846649458;
        Thu, 11 Apr 2024 07:44:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s15-20020a170902ea0f00b001dc05535632sm1246091plg.170.2024.04.11.07.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 07:44:08 -0700 (PDT)
Message-ID: <6617f738.170a0220.30c97.354f@mx.google.com>
Date: Thu, 11 Apr 2024 07:44:08 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240411
X-Kernelci-Report-Type: test
Subject: next/master baseline: 192 runs, 8 regressions (next-20240411)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 192 runs, 8 regressions (next-20240411)

Regressions Summary
-------------------

platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board   | 1          =

bcm2836-rpi-2-b      | arm    | lab-collabora | gcc-10   | bcm2835_defconfi=
g            | 1          =

bcm2836-rpi-2-b      | arm    | lab-collabora | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =

beaglebone-black     | arm    | lab-cip       | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =

hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board   | 1          =

hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board   | 1          =

r8a7743-iwg20d-q7    | arm    | lab-cip       | gcc-10   | shmobile_defconf=
ig           | 1          =

rk3288-rock2-square  | arm    | lab-collabora | clang-17 | multi_v7_defconf=
ig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240411/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240411
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4118d9533ff3a5d16efb476a0d00afceecd92cf5 =



Test Regressions
---------------- =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/6617b4fe367339c2a14c42e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240411/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240411/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6617b4fe367339c2a14c4=
2e9
        failing since 42 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm    | lab-collabora | gcc-10   | bcm2835_defconfi=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/6617b8a513acb4a99c4c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240411/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240411/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6617b8a513acb4a99c4c4=
2ee
        failing since 311 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm    | lab-collabora | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6617b93236d31a4dfe4c42f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240411/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240411/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6617b93236d31a4dfe4c4=
2f7
        failing since 379 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
beaglebone-black     | arm    | lab-cip       | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6617bae022d64a10db4c42db

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240411/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240411/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6617bae022d64a10=
db4c42e0
        new failure (last pass: next-20240408)
        1 lines

    2024-04-11T10:26:21.841715  / # =

    2024-04-11T10:26:21.850600  =

    2024-04-11T10:26:21.955576  / # #
    2024-04-11T10:26:21.962545  #
    2024-04-11T10:26:22.064790  / # export SHELL=3D/bin/sh
    2024-04-11T10:26:22.074392  export SHELL=3D/bin/sh
    2024-04-11T10:26:22.176183  / # . /lava-1118902/environment
    2024-04-11T10:26:22.186327  . /lava-1118902/environment
    2024-04-11T10:26:22.288213  / # /lava-1118902/bin/lava-test-runner /lav=
a-1118902/0
    2024-04-11T10:26:22.298249  /lava-1118902/bin/lava-test-runner /lava-11=
18902/0 =

    ... (9 line(s) more)  =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/6617b62e0bbd9815514c4303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240411/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240411/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6617b62e0bbd9815514c4=
304
        failing since 42 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defconfig=
+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/6617b4ff92eb66a18d4c42de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240411/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240411/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6617b4ff92eb66a18d4c4=
2df
        failing since 42 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
r8a7743-iwg20d-q7    | arm    | lab-cip       | gcc-10   | shmobile_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6617b545b31ed988dc4c42fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240411/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240411/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6617b545b31ed988dc4c4=
2fd
        failing since 0 day (last pass: next-20240408, first fail: next-202=
40410) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
rk3288-rock2-square  | arm    | lab-collabora | clang-17 | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6617c513a6e12ac3f74c42f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240411/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240411/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6617c513a6e12ac3f74c4=
2f1
        failing since 21 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =20

