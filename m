Return-Path: <linux-next+bounces-4289-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E799FDFC
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 03:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B614B1C242E8
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 01:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A0C1D1E65;
	Wed, 16 Oct 2024 01:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="XwlrqAEu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD82F1C2324
	for <linux-next@vger.kernel.org>; Wed, 16 Oct 2024 01:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729040664; cv=none; b=hbfRmnYZMwQqjOcVDfB/RuuxqjClUPQPdc5oK7vj/w0BA+fpUgy/im4jnPdbkDSuo1pMl+D/57vv7zRig3T7bs9dpJ2tgeHRwe7SxWryKXfos45uGznMicy5xSa6n5QTaD6Oj5C5PA7jVg1G3DnZDo1/QVdYPTXkkCczYHexEuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729040664; c=relaxed/simple;
	bh=xM9Y6ggYV80wh2O/N1ygNQEEkhOa4lv3gKIYq+rcN7w=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=s0gYHWtcoigjFea2Adzuw9Zkp/az3/Xt6ZlPYkrEh0wYkwz0zxvQsVd2xoOLZ71VO7ORwFSEmDsQ6wrwEvcig7ZhN0+geGnD4Rgc34p+3fgSbUflL1gq6jp1CjYkEju0tvLKO+lgb6sVKiHJZ3kzjVmfp4pNcscLAjyZoTqiP6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=XwlrqAEu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso3140973b3a.2
        for <linux-next@vger.kernel.org>; Tue, 15 Oct 2024 18:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1729040662; x=1729645462; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VXOpTSTjq0UA+Y3lleqjVRag0BsPSrG4VfV66hfD14I=;
        b=XwlrqAEusSf1/I/Rp1tmTnsfVOL+gvXhoLSA5CwKhjJNLWhXajeVtKs1YrdolfyFTj
         rydBISdxGCEE/9B7fL7uGPQgmil2tErilm/Tp4R39OV0c9gakKNQn+Dm0kk/D1QAU/HR
         CwDgtsSDuqlt1KK6J5EfnMovtZdC1T4n2qc5PpPISgTjitRF6Y5PV0qOgv5ecCVdC8Q8
         5ClXEeNpu233XIm6iSh4XJQimcrclkZqi6OxHdjvLV8emoFkvAz2UQzShQH9XqkxkNgP
         dKF1kynT1g83Hj2nWIqSfohLzzrP35sFqtCrSimdDXNaLlNZP7CZhLTViT9M7GPjNbSS
         o3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729040662; x=1729645462;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXOpTSTjq0UA+Y3lleqjVRag0BsPSrG4VfV66hfD14I=;
        b=BMISCoBOOlsa/FXA/DnuK4RMp5lv8vU8JeWg5QXIYG8GY7Ecf32zgGxzRXmsYbLt+Y
         k3BjyBEqtn7IVUclPn7bsVCQvS8swjK62hRCS5cDIYKAczLPWEiYai0chbN9L2EWcQjB
         eTNa7fv0Ci11492e1S0S6VH7Mi/oC0RdcKm07KxFejn3Y8eSS22zWcEBGrFv6dz4T877
         NffqVMog8Hz0ddpwN+AUwnHIZqPntYq992ZAb07HPlWXQDjmhmcJjZae177yb4T4QHvg
         YDMEZRjiumHiKJNQNxpl77lVSHlYsahI4opd1UOvRBEu5Zvg2FMG8LRm+klegUAT9lFc
         cgaQ==
X-Gm-Message-State: AOJu0Yy6ESjT3PBdJCuhDDTfOFYYrNu83Ydsp3Nle3rOjHPOq1YnV2KL
	RZ63FGxskv2YTBcGRpuvy/m0i5rmGqT6INjM1XEBaRoDqE7smSLCmz60IzyivOHXF3YRkk4ABTK
	WkKQ=
X-Google-Smtp-Source: AGHT+IHrruVOY4VVouI+KfZnRWB4bZ9X88gFG48Qru4V4FE/EhMWlEbkHmjGblmCiMjbNcsEK7MLSQ==
X-Received: by 2002:a05:6a00:234c:b0:71e:50ef:20f3 with SMTP id d2e1a72fcca58-71e50ef22a8mr17904839b3a.28.1729040661729;
        Tue, 15 Oct 2024 18:04:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77370dfdsm1970726b3a.42.2024.10.15.18.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 18:04:21 -0700 (PDT)
Message-ID: <670f1115.a70a0220.9a473.805d@mx.google.com>
Date: Tue, 15 Oct 2024 18:04:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241015
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 186 runs, 4 regressions (next-20241015)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 186 runs, 4 regressions (next-20241015)

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

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =

r8a7743-iwg20d-q7          | arm   | lab-cip      | gcc-12   | shmobile_def=
config           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241015/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241015
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-12   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/670ed908ee20ff213bc86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241015/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241015/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/670ed908ee20ff213bc86=
856
        failing since 4 days (last pass: next-20241008, first fail: next-20=
241011) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-g12a-u200            | arm64 | lab-baylibre | gcc-12   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/670ee09397d213942ec86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241015/arm6=
4/defconfig+debug/gcc-12/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241015/arm6=
4/defconfig+debug/gcc-12/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/670ee09397d213942ec86=
856
        failing since 47 days (last pass: next-20240828, first fail: next-2=
0240829) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/670ee0d66ef7c3c901c86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241015/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241015/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/670ee0d66ef7c3c901c86=
863
        failing since 22 days (last pass: next-20240829, first fail: next-2=
0240923) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a7743-iwg20d-q7          | arm   | lab-cip      | gcc-12   | shmobile_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/670ed399056c47ca88c8686c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241015/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241015/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/670ed399056c47ca88c86=
86d
        failing since 14 days (last pass: next-20240930, first fail: next-2=
0241001) =

 =20

