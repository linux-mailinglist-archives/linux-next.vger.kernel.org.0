Return-Path: <linux-next+bounces-3910-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1025297BFF6
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 20:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42CC71C20C68
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 18:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31671C985A;
	Wed, 18 Sep 2024 18:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="abWeFOyf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693971898E0
	for <linux-next@vger.kernel.org>; Wed, 18 Sep 2024 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726682605; cv=none; b=hee+vnXAV6yolr27RwqQcELr1JWPMuf9ewCN1j8PTvJo4fIoKG6OqqWuWIxjHjMMBpbgbTD1Gkkc3Nl3jPuYF2wwgJ5SGL/k4PE5lZps7UEeErhUvQgJrqVFziE8t53Bz8FthBChqIT/H1xW+XgAzbOUxZC9PsAM9CSDh6ONA+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726682605; c=relaxed/simple;
	bh=O7R4Ng4a+zqijozdjUICxtBm50M4sdUZ4xUW28fc/Ys=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=tGjVxVm7pWugvJn6l6/rDpSZLyeovJArSg1kjQ3j73KPaXsjyIwLFyYhntTYQqaHSf8VAY/TifOPdr5g/nPNXPz3WdsSCgY8DtjF3dTVTv4gVxozsnxQNGHztxSUEz8FTbtQiXLoHOt2iiQXDKxEvaY0VDrE0JJ827lrFL9dsUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=abWeFOyf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7198cb6bb02so343983b3a.3
        for <linux-next@vger.kernel.org>; Wed, 18 Sep 2024 11:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1726682602; x=1727287402; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gaD/tdbicWiBRsiwDekhZuSMKQ4wMZiyZjA0WVnful8=;
        b=abWeFOyfGv8Vx2rmGAhy9rE02Z7Mzfmon7u+WEYt9Clbok0cQRNDkEh0Srak3ZQVnN
         VT5YyTikiJGsfNOJQ524Elwzao2zyWgZW3VAuY7Bt6Aywyk1H7C1gLMEwKX57/RwpzXi
         2zdMfqsqoByXS2W4cpk6xD9uyvLRO3hfeSC2n4IOs8Y/3SSz9W5f/3zST710GBh2pvz/
         jumNnkGcGvXS0QHnfkUVd2cHY/9g3Bjz2jZky47yH43oGw8EHuKnpjzZSPxfAy1ca0RL
         2odrdljoej4JO8f4kJm4kApkL9BFfK4Co91k9R3EhOwLH6lQXbqLnBDT/yzubsTJ2rpC
         WfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726682602; x=1727287402;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaD/tdbicWiBRsiwDekhZuSMKQ4wMZiyZjA0WVnful8=;
        b=i5J5W++f/7OmHtZkxcedRWPfycV2DGcsjR7FvEMm5f9RbWRPHD/nki2dO8WBdRQZGv
         XfFG3JD1P48P94SpopRQxFlQJCTCHKxyIgRUJzWkYSDJ+CGOwZeGRg+jeH4wdBsS/MbL
         9XmHZE84vuzBu5Hx8rSQ85SZi0fyDr4BULlB0E3kxmoIn89OY2x61pkyp+SsnVL757cS
         BNkQ6zNaaZ7pu4L4jORQYYPEVhDVvjCLGGRvuk47+G8SAC3Fmnoweb8uTGbibAO3RyAh
         WMZOOvj4qGhKG9wavICkOoSjB46zexmpw8HAD7u5PQyn7Tqv1+ZLn2/bdmAV5IVYstA0
         aK1g==
X-Gm-Message-State: AOJu0YzJDQeeJiZNKPt0YwXrwCZgjqVOziyYgrYadCTXeReIUkUkCQ/g
	kaRoFpSORwK2MUVjRERHoOfmZiXQIPZLxe1Sbyv6W6F2z5T7C1YUJ5vMvHADcghNiEH0ESoIIGN
	q
X-Google-Smtp-Source: AGHT+IFCN6rIJlnO/3BJ6tbqDOE/GwTw41MysQB8CD6UoCWQH8hOBcOv6sA9Sx/fGQELVPv9QwiFuA==
X-Received: by 2002:aa7:888e:0:b0:710:5825:5ba0 with SMTP id d2e1a72fcca58-71926056292mr34371657b3a.3.1726682602154;
        Wed, 18 Sep 2024 11:03:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a980a9sm6974272b3a.3.2024.09.18.11.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 11:03:21 -0700 (PDT)
Message-ID: <66eb15e9.a70a0220.1e91c4.c93f@mx.google.com>
Date: Wed, 18 Sep 2024 11:03:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240918
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 131 runs, 5 regressions (next-20240918)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 131 runs, 5 regressions (next-20240918)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

qemu_riscv64                 | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240918/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240918
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      55bcd2e0d04c1171d382badef1def1fd04ef66c5 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66eae3e7416b7864d1c8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240918/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240918/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66eae3e7416b7864d1c86=
85d
        failing since 21 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66eae3e8416b7864d1c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240918/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240918/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66eae3e8416b7864d1c86=
860
        failing since 21 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_riscv64                 | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ead8b57d5db0b414c86865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240918/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240918/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ead8b57d5db0b414c86=
866
        new failure (last pass: next-20240906) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ead8f01e9fa8ddd2c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240918/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240918/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ead8f01e9fa8ddd2c86=
859
        new failure (last pass: next-20240906) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66ead5f9dad13019d1c8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240918/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240918/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ead5f9dad13019d1c86=
85f
        failing since 28 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =20

