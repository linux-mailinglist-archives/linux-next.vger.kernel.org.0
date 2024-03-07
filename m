Return-Path: <linux-next+bounces-1528-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DAF874F3D
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 13:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881341F222E7
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 12:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F7A12A143;
	Thu,  7 Mar 2024 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Vn711JJ7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A49812B15F
	for <linux-next@vger.kernel.org>; Thu,  7 Mar 2024 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709815090; cv=none; b=qNFrhnpE7iP5CMQFimE34qpQl+AttiPl5gHATubSN9IWltKKjbM6bFciwDsrmiyTYsSkK8ylhNoKDIHD+vfXvPoTe2htqQmxTouHnWIJOgUJe+j2TLc3dN75jBXgaNgNQb1B0AeGlM6wRSaz5CZgLAdrfIapiCDCHNaRm8O/syA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709815090; c=relaxed/simple;
	bh=rBcTt2jTY8GO0Lv8BXaY6aboyuDmhxLo6Qcuk771h0Q=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=RMUFvvsSV5PAXcoZ4A9a6V2A0YWakted4P50bxNnBfNOWye+qygd3zcuxytPoeTiAVkF4kqNN5gKnNqJ7+VgeTCRzfYnhqVwV1MDsFO1YN/rNFCwu0XqomMHhGVxpCKBrcZKyXj8ZeVg5QO0OkoPePtxwdmCJGEumbXJCB6EMSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Vn711JJ7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dcafff3c50so6017335ad.0
        for <linux-next@vger.kernel.org>; Thu, 07 Mar 2024 04:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709815087; x=1710419887; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0vwD1REpYUARiuPRyTHKRVaC17q8ZfgwEvGWAtJeM94=;
        b=Vn711JJ7K+SrUKkgdD0Hf5GUDXttmx4ahrFihSpZ+tU4ae9nQ7igb5wg5Ztmz1tgQD
         rZVWR1HCpzhgkKUY7/djYeQyIJSciUbhryBEQIv8841VIIko2wEpOlRZj4Bv9Og/Zgtu
         ArOoRkwWchviQhj14W1xqcwHaTqdXNrskkxx3g7jUhdEtuPT92nCll7y2Ay7B94LEPY0
         nfM+x13H/0QQ+HQ3gUeEs1a9C1bw21syzInWA7Wq0ZLxx0f3omiTOUYWzslBvUXglFBj
         ORfYyYrm6qYtQvPFsROQzXn3mt1WIjQ0M0YaWibJXMDpqi9wuOwEpy1Y2lEfcA8UJmsA
         lXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709815087; x=1710419887;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vwD1REpYUARiuPRyTHKRVaC17q8ZfgwEvGWAtJeM94=;
        b=wN0SQgPCRwMDRW5CzE4TNu0j4tguUbCdRM7QevDi7x9g9YmrEE0DV6FcDsfQG/TFpG
         4KGp15aKqp+r2ABIEVHEd5Kn1523+bxKysvL3r3pes3B48fNSYVExC51YIZYy16QdBbE
         sNjMzMiTo8C1n6WwLkcHlo4NVzLIb8upA8pi72FOKdpT1nCGXt5ZjB2BM5WpuQh1uDKP
         6xvnCXYZCoCbGfJ92LaWvxgqEtGDMqpOpCPBsGT9DpqpqfNNaXj0wpi9iMdVaaH5pO4k
         qYko6siIQZosShNkzJ1xV0dqxTz44g3h6VGMIFcxbXVoovEMDEugGJfEZn+azR2dFday
         Pdng==
X-Gm-Message-State: AOJu0YxwHWPJf/A+b8a/2QWPhN3BSUupBja4UVCSoBbH/cZ4q1EYRGXe
	opC2EOSyMXNYfnrwP64qdEwfVouIG5hKIZ1Cz/ZfkXichCalk7FQA83jdvu8F9bZoqcjCHDwPPz
	aaTg=
X-Google-Smtp-Source: AGHT+IGqEGEK/IGghHdOu35BkdMY/+2UC6lPaJXn29Mo7pANbg/LeychBIbXKvZbuCg4B0kqR6lILw==
X-Received: by 2002:a17:902:b587:b0:1db:7181:c5ba with SMTP id a7-20020a170902b58700b001db7181c5bamr7276415pls.62.1709815087223;
        Thu, 07 Mar 2024 04:38:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902e54f00b001dcfc88ccf6sm10346214plf.263.2024.03.07.04.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:38:06 -0800 (PST)
Message-ID: <65e9b52e.170a0220.4e3fa.2188@mx.google.com>
Date: Thu, 07 Mar 2024 04:38:06 -0800 (PST)
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
X-Kernelci-Kernel: next-20240307
X-Kernelci-Report-Type: test
Subject: next/master baseline: 127 runs, 7 regressions (next-20240307)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 127 runs, 7 regressions (next-20240307)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-10   | bcm2835_def=
config            | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb              | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

rk3399-rock-pi-4b          | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240307/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240307
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1843e16d2df9d98427ef8045589571749d627cf7 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/65e97737c031e015444c42f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240307/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240307/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e97737c031e015444c4=
2f4
        failing since 276 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e97bc46d48c9924c4c4303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e97bc46d48c9924c4c4=
304
        failing since 3 days (last pass: next-20240226, first fail: next-20=
240304) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e97b4f6032bdbbfe4c430a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e97b4f6032bdbbfe4c4=
30b
        failing since 3 days (last pass: next-20240226, first fail: next-20=
240304) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e97bb76d48c9924c4c42f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e97bb76d48c9924c4c4=
2f6
        failing since 3 days (last pass: next-20240226, first fail: next-20=
240304) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e97b4e0d9a61a3674c432a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e97b4e0d9a61a3674c4=
32b
        failing since 3 days (last pass: next-20240226, first fail: next-20=
240304) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
r8a77960-ulcb              | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e97d3c50833e81c64c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
60-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
60-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e97d3c50833e81c64c4=
2db
        new failure (last pass: next-20240305) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e97ca1a3aac405cd4c42ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240307/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e97ca1a3aac405cd4c4=
2f0
        new failure (last pass: next-20240305) =

 =20

