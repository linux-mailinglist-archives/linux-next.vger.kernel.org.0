Return-Path: <linux-next+bounces-4247-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8699A3D2
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 14:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4403E1F2566B
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 12:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E13D212F13;
	Fri, 11 Oct 2024 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Noi7Arhe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9961C802
	for <linux-next@vger.kernel.org>; Fri, 11 Oct 2024 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728649580; cv=none; b=RBs6aLS9ci/QzCbD9kx0xuLsas44nhNmifu3GDYvRdo62Hn1qDbL9B1+svsPkc5uK396pgp2yfNjuJqGUYct0CUTAFMo/GzCSMXcXP3rHauRNt4KzfFIPwX/lnbn3fEASquwJACm4odOhPremsTBgwpKhv59i8VuLpTobo9ddkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728649580; c=relaxed/simple;
	bh=U0gw8QbMZdsC9skWcVxw2H4+N3T3yd+ooIoTqF7DQYk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=srR4vm60ETVQc99GKc1NHAazQJ3ckCtVKvmyGBHwK0SQUxJeE79ECPjnoyBF7oiK1YGQF5WF63G++cn2pMGVpnipoABGERT1EDJjnMVTToR5l99EayDu8Y5r1AwCSha3RJ1PtjoOpqFJhkmgxac5960XKKBmA3+yELodQctUDBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Noi7Arhe; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c77459558so15860755ad.0
        for <linux-next@vger.kernel.org>; Fri, 11 Oct 2024 05:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1728649578; x=1729254378; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYqrr/UP29W1iSGXfHXa9n/g5WJ1oreuwN70qufF4Bw=;
        b=Noi7Arheg+UQ9PTBiuH+gsTyIeCVW9QFIAbLlkOb5cc9xPD80c/fZGLFP6mbhQFoMr
         KJtIsFveaSb0dypkgdcW1UOhDq/9i5PMockaRkFSB/dGpk4ALTiYW+GnU70disHZaNS4
         OsSGBoAAnj12/IA0SudHLWi+LePPpO8nyhSI4sngqA94iAnfIjBdKnx/uqiYp2Rcwso+
         OkJDNblNgpa1Z2BOFDzgfmIbpKbtojmTJeBxf5zPBUrh8k1GFL922jxFOa0FtD2jHJXK
         yRbZV8K4gIsLAWzul8qSRAebqDy2I8to5kqgDPHplE48lID+PUCPyoubgzXHeONVcwgY
         TJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649578; x=1729254378;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYqrr/UP29W1iSGXfHXa9n/g5WJ1oreuwN70qufF4Bw=;
        b=rINWOXsHWLtERqDdkUNY4W3fqPRQQzFHT6mm26Rn8HEGxwnZRkEH4LknFjz8GAGKSu
         ca9pClktUkdF3cdwX7OMeePegEcuSkqNT3w3B0v72XfS6vyplODsQy0jCCQOZ0qSFTsa
         8KCZ+y5yGEa5IJlrKVvrGKWkEj1xYqAAu5WdmONBGzZqRu4AYwwaHwIMW39eSws0gq+Z
         daLpK6yIJCKZ40fWB2HPVCe1xrq1w+8vYAc8u4KhM93ilh8ZKeMyP8tFhIszI5sv8yig
         oada1DcFhT0W1OSreO+l5Jj9k3n6AUx60BZm9K8cHO2iH+DWmSVuhWgQ8z0/yZG0hrdM
         Hohg==
X-Gm-Message-State: AOJu0YzMvWuj2ZLRiQAQlpFLHxdg+VE29XRbxrFNW5NrbyRnHkZ1FfzM
	JlMz7Y8WwwjLwE2Dg0LPvK8pB/jRsGbQ7f8tv77G5zev01E2jumQU51UhWkrLPsmmPNX0k+lpmZ
	T
X-Google-Smtp-Source: AGHT+IE8TmKF+YkA8o0z62xyo6fTmOy6Yz8jd8SIbOUyq2LZJMSL/OKTLXVE9cFwTmIR4J27ZUEwBQ==
X-Received: by 2002:a17:902:db12:b0:20b:c1e4:2d70 with SMTP id d9443c01a7336-20ca147e89bmr31960435ad.23.1728649577701;
        Fri, 11 Oct 2024 05:26:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c0e75f0sm22603555ad.180.2024.10.11.05.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:26:17 -0700 (PDT)
Message-ID: <67091969.170a0220.118c4d.7d89@mx.google.com>
Date: Fri, 11 Oct 2024 05:26:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241011
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 147 runs, 5 regressions (next-20241011)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 147 runs, 5 regressions (next-20241011)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241011/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241011
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d61a00525464bfc5fe92c6ad713350988e492b88 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6708dd77faf90c2d92c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6708dd77faf90c2d92c86=
859
        new failure (last pass: next-20241008) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6708dd31f1d2b40800c8686c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241011/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241011/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6708dd31f1d2b40800c86=
86d
        failing since 44 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6708dd302db3132d99c86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241011/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241011/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6708dd302db3132d99c86=
861
        failing since 44 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6708dfdd1358fd4fa4c86870

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241011/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241011/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6708dfdd1358fd4fa4c86=
871
        new failure (last pass: next-20241010) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6708dfc16b12cee7dcc8686b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241011/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241011/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6708dfc16b12cee7dcc86=
86c
        new failure (last pass: next-20241010) =

 =20

