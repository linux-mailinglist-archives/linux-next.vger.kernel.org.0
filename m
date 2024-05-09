Return-Path: <linux-next+bounces-2244-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B20218C0FAE
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 14:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDD671C20EBC
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 12:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37B9131729;
	Thu,  9 May 2024 12:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Ou2O4m8a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69110E4
	for <linux-next@vger.kernel.org>; Thu,  9 May 2024 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715258231; cv=none; b=afvfpHtvIyP341QHCK+cPaiY+3m1m9b+6GTnRwuJkRDh2A8CvxNJnqMxbhOI6TLPoxCAedHaGk1Jffv/ph9AKPp2ptVHI9Z1RPuCOCOlIutqPSvyGFrDWFJytko/wjO3N1Afr6Ooy/eRC2WPeR+iXjD/cjamBieY7kJtQO7mrHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715258231; c=relaxed/simple;
	bh=uBanNUZRY+Ir53n7bIR1bVGWhrjo6N8Bf/utgqymMqc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Yv0CsBBZH3ui+yGMFi2+V5+3oSboOBqa5l7lzYg1f9bj42IbNevGco1jhjQoQitJLdoSienfaK2HIyByo/H64xR0A1CT4nnfuWejAIx3fNyUFzux0M8jqcyLhYejwoNn48R+tED7FlIwzto+8oZvywtaifNwXeq50hsxzFq1PHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Ou2O4m8a; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2b3c711dfd3so691210a91.2
        for <linux-next@vger.kernel.org>; Thu, 09 May 2024 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715258229; x=1715863029; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz1LOzfdPfWzunBrJtKWCL4n/LRhIwaYz/6lDuG0zUQ=;
        b=Ou2O4m8ae2qFX52nQZgjMJ/aVDiaARvMDjqPU2Wf97vaJGTad7db0uwK9N0voyGtni
         sVzjiti+hyTGP6hD9Y7JTcrXPHRewOmF+P9m7q7SKQ6qcRIrPISpVSKN+TVgfBreHJpR
         Oxhlf0gWH0V0Kto1u/eSKH5JIy6UNliGEIVZbwNmAANaD5Zhz4rs9zkaEXKCLXVHyQzP
         580SxZ3IPR/R+2l02qh4YqyyqR4f7OkEA/d+VmTziAws28V8OCnT/1EPZH6/X7Bgnl8L
         rL7C4pg7c9WU/3nC4Bgld7qUeZ/fJdgQELpGf+XeDv7Ti9Pav8wxRaipblD/olFPwOat
         RMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715258229; x=1715863029;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hz1LOzfdPfWzunBrJtKWCL4n/LRhIwaYz/6lDuG0zUQ=;
        b=dW7irF6Ie/0QLhOdXJNiOi1xoaQu6ALKKrfWAufmXDcYarURWnKvD2cs1zJDz9CUHh
         z0sX4N9Wqiz4cvVLIn2nykFvdVKoUfsaUeS7S9V/GNNFiv+5FBd9tkxV+aoiC8qC2Nzn
         Xzn9qGSqCvE1B9ckeA9ivEZJon0AsxJOqNHBIqd8reGj+gSlqA+9t3I6eSTagly/0FED
         ldLXbU7MSigldpL4//2PdVbhVFkUc+wTwK4WabsUm7PL9TTrljnJCcHe0d1/4os1pBf9
         SBNMruZQLTPE2kWeoo/iwXOZa4uNfZuTNg702dT7mttkDrz9XpMtSNHMGGYYN+n3NuX9
         S8vQ==
X-Gm-Message-State: AOJu0YwcxbF/LfWgSC0zyKywSLdgcv2Va5fk0ogrvCYpM8s+5JrQ23Or
	wqhlfN0p8XcVc3fOBlBBQqOGoWd6+h82jTPVUpu901sOHqFKTZjKx2XPNsr6N5HIeI18LBuln0J
	Y
X-Google-Smtp-Source: AGHT+IHku8a96RR+Nrlglb4j8UX2HNNmNTL6A3kRGJ3gN9a+Ci5NNEMSWE30Y3WaIClANBm1tJbZ/g==
X-Received: by 2002:a17:90b:4b11:b0:2b1:8210:56bb with SMTP id 98e67ed59e1d1-2b6163a2665mr5133155a91.3.1715258228529;
        Thu, 09 May 2024 05:37:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b5d4c8cc5asm3468465a91.0.2024.05.09.05.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:37:08 -0700 (PDT)
Message-ID: <663cc374.170a0220.3efcf.88a7@mx.google.com>
Date: Thu, 09 May 2024 05:37:08 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240509
X-Kernelci-Report-Type: test
Subject: next/master baseline: 155 runs, 8 regressions (next-20240509)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 155 runs, 8 regressions (next-20240509)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
at91-sama5d4_xplained | arm   | lab-baylibre  | clang-17 | multi_v7_defconf=
ig | 1          =

at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =

at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-10   | sama5_defconfig =
   | 1          =

bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-10   | bcm2835_defconfi=
g  | 1          =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-10   | defconfig       =
   | 1          =

jetson-tk1            | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =

r8a7743-iwg20d-q7     | arm   | lab-cip       | gcc-10   | shmobile_defconf=
ig | 1          =

rk3288-rock2-square   | arm   | lab-collabora | clang-17 | multi_v7_defconf=
ig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240509/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240509
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      704ba27ac55579704ba1289392448b0c66b56258 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
at91-sama5d4_xplained | arm   | lab-baylibre  | clang-17 | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/663c8b0ae33c2311624c42e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240509/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240509/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663c8b0ae33c2311624c4=
2e5
        new failure (last pass: next-20240506) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/663c882296332391224c432e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240509/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240509/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663c882296332391224c4=
32f
        new failure (last pass: next-20240507) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-10   | sama5_defconfig =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/663c8c5f3f09c4b5294c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240509/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240509/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663c8c5f3f09c4b5294c4=
2e0
        failing since 463 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-10   | bcm2835_defconfi=
g  | 1          =


  Details:     https://kernelci.org/test/plan/id/663c88590ef4b47c954c4314

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240509/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240509/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663c88590ef4b47c954c4=
315
        failing since 339 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-10   | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/663c8d39eb8e513a9c4c42e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240509/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240509/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663c8d3aeb8e513a9c4c4=
2e1
        failing since 3 days (last pass: next-20240503, first fail: next-20=
240506) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
jetson-tk1            | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/663c8736a7ba7a37b24c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240509/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240509/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663c8736a7ba7a37b24c4=
2e3
        failing since 49 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
r8a7743-iwg20d-q7     | arm   | lab-cip       | gcc-10   | shmobile_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/663c8261685bac203d4c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240509/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240509/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663c8261685bac203d4c4=
2dc
        failing since 5 days (last pass: next-20240502, first fail: next-20=
240503) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
rk3288-rock2-square   | arm   | lab-collabora | clang-17 | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/663c8af4c86027d2ff4c42fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240509/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240509/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663c8af4c86027d2ff4c4=
2fc
        failing since 49 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =20

