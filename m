Return-Path: <linux-next+bounces-4331-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCA79A3D49
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2024 13:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48014281810
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2024 11:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7692022CE;
	Fri, 18 Oct 2024 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uiXkpqwc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B99418CBF1
	for <linux-next@vger.kernel.org>; Fri, 18 Oct 2024 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729250942; cv=none; b=Rf20x+52sfmySJd8gqOZmJol8fzAjHAr1ZIS3ZAL8NxTLFqm2nmUw/VNrzLtcbQ24dF51ydcW0z+CKEoWXDZalub0LJFLtREcJ2VPZbueSJJ+6yQqql+552TWT2bxQxkYVlM9K5iU2Q2fhu0CR/CLzcaLO25/Ga4hfkeeGRnHcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729250942; c=relaxed/simple;
	bh=kT9mcKhzCmJYyuC63UFFtiQa1FCLWnCALtCDdNwtsLc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=LuRR7OHXKF3EbdDZ8gaXLBhUtGLcISLQSTXsSO7esTXxIwYKWfHjpuDIdO8JfuN6RoATrL7lC2Kwuztmgeq6DBVWNSNIRhMcLn3hKfy4nYGD9bXglFuq1qEN3dqOECLj/S/mm4EXcs+vCW5O1JyUTqJKWZizzao0xqrbCiWDqWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uiXkpqwc; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea7e2ff5ceso1635735a12.2
        for <linux-next@vger.kernel.org>; Fri, 18 Oct 2024 04:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1729250939; x=1729855739; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oAH7iQwrrRYaXcjGIYSr+dtWd71hfRHa2n9eSul/bLM=;
        b=uiXkpqwcXz7/OD9++aWifGh+1enKl0WARPyIvmhqPzrx/SEKY33tNnbOR9byVuDjPf
         tTGczmzJ/xlVblAJVPPHl1pXJY2XEPzWp6rPcRo3Eukvf23NifwAgvIhwZbAyPpU7yIM
         hJ9w2pohr+RuGflk7luYrh5u2lG4WphlJdPZbbf3unV2hNbbzIFhBQtrkRY4FZXhFJZO
         kOLvRA7ha/0bcPWGOZiwXhqxBLMZZWOOg4WR0kKhodJaDaQ0CjtglgyfIeTqTiRvzzzG
         N82O7CWN+cC5N5DXAtcy4p+hUPOXwsAaZIobmu1Y1k5y6blvpy37GxuEEVkWH8l27l6N
         vX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729250939; x=1729855739;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAH7iQwrrRYaXcjGIYSr+dtWd71hfRHa2n9eSul/bLM=;
        b=VtZJXIBTj6IX0LGmw+IPsS8W6u0auDClT1fsJWlQ4u4y477h72KvYt6nwt032TRFh8
         0guTY1CAUGjL1eT3V9TlpTjAJTRe3P5JnJuqpSd3RecKCFIJaj1agF60V+8JUqCeZHLX
         L3blTsvCvP6ECMpvsADrC+9GcbqY9WustMpIKfoYEI15Hw6YeeK8eKJgnHXhPUyVrGrt
         +ktEN5xmcxApqcHfUBCDbcYJ0NohRX5yKF3mCq8LtYAUXFPA53LjA2OYCNtK6bQTTKI7
         nZEylhAkZR9APRHWTFRt4TjK6//6eKa+f+L9yK5/Z8cMGIHGf5p8dTDNjKPMogrKX8i2
         otMg==
X-Gm-Message-State: AOJu0YzyfQXRngxZPT90HKMXL0J3hVqnbWNuHDGyrvUgOv+ebnZjMZMT
	Q2A+1vQ14T/xqPgaDy/PEsYQZ+zEkysVqmC4fhW62Xz8x+UhXfj/GATCuEeq3BTCHU3uBpO8E30
	9GR0=
X-Google-Smtp-Source: AGHT+IH5srCROJavvTzep0W1swv9uA44rrVoSgXYuE6Bmo7VtupG7ZkMpf9iNg9lgkYqnkuSbbqReA==
X-Received: by 2002:a05:6a21:1304:b0:1d9:18b7:48c with SMTP id adf61e73a8af0-1d92c4bac3bmr2944805637.6.1729250938937;
        Fri, 18 Oct 2024 04:28:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea345b2e2sm1256686b3a.173.2024.10.18.04.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 04:28:58 -0700 (PDT)
Message-ID: <6712467a.050a0220.3392c5.3042@mx.google.com>
Date: Fri, 18 Oct 2024 04:28:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241018
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 118 runs, 14 regressions (next-20241018)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 118 runs, 14 regressions (next-20241018)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-12   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

meson-g12a-u200            | arm64 | lab-baylibre | gcc-12   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a7743-iwg20d-q7          | arm   | lab-cip      | gcc-12   | shmobile_def=
config           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241018/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241018
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f2493655d2d3d5c6958ed996b043c821c23ae8d3 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-12   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/67120bd1f7e8299903c86866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67120bd1f7e8299903c86=
867
        failing since 6 days (last pass: next-20241008, first fail: next-20=
241011) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-g12a-u200            | arm64 | lab-baylibre | gcc-12   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/671210a975616aacc5c86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+debug/gcc-12/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+debug/gcc-12/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671210a975616aacc5c86=
862
        failing since 49 days (last pass: next-20240828, first fail: next-2=
0240829) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671225ef62ca00eeddc86865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671225ef62ca00eeddc86=
866
        new failure (last pass: next-20241016) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6712280ef1a027b625c8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6712280ef1a027b625c86=
85c
        new failure (last pass: next-20241015) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67122897b424dc70eac8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67122897b424dc70eac86=
85f
        failing since 0 day (last pass: next-20241016, first fail: next-202=
41017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671225c962ca00eeddc86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671225c962ca00eeddc86=
861
        new failure (last pass: next-20241016) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6712281ff1a027b625c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6712281ff1a027b625c86=
860
        failing since 25 days (last pass: next-20240829, first fail: next-2=
0240923) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671228d3c403305ac3c86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671228d3c403305ac3c86=
858
        failing since 0 day (last pass: next-20241016, first fail: next-202=
41017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6712260362ca00eeddc86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6712260362ca00eeddc86=
86a
        new failure (last pass: next-20241016) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/671227e316a824249dc86880

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671227e316a824249dc86=
881
        new failure (last pass: next-20241015) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671228d7d96edf05d0c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671228d7d96edf05d0c86=
856
        failing since 0 day (last pass: next-20241016, first fail: next-202=
41017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67122604b8d32871c1c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67122604b8d32871c1c86=
859
        new failure (last pass: next-20241016) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671228bfd2aa4c8da1c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671228bfd2aa4c8da1c86=
860
        failing since 0 day (last pass: next-20241016, first fail: next-202=
41017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a7743-iwg20d-q7          | arm   | lab-cip      | gcc-12   | shmobile_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/67120bf0d739d48e66c8687e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241018/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241018/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67120bf0d739d48e66c86=
87f
        failing since 0 day (last pass: next-20241016, first fail: next-202=
41017) =

 =20

