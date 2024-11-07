Return-Path: <linux-next+bounces-4688-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36879C0CFE
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 18:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1F2F284F4D
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 17:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE16118FDAF;
	Thu,  7 Nov 2024 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RkTmkpmt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E6B21315C
	for <linux-next@vger.kernel.org>; Thu,  7 Nov 2024 17:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731000944; cv=none; b=X3Iv59LwqGo+x5DU2kE1u9rf2kLircLA8foQJshlYluTD1NdajwPrUDqN9ewhk7mc4Bu/CoIRcIGaWfHPkxNcfdk818kpd5FGhApfKIpwcZ/QMGtS64e32EXgIoEAumKNilJEPhxZ7wqCowV8dFvudbtK3Ru9wyHIdZUC8Jxdmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731000944; c=relaxed/simple;
	bh=Es3xdb3+fGVc/P3IHs9p2GC1wgz3ny25FcAJqTgbHsM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=FiGsOevgGYzvjjlxeSJeWVLJLOxUHdPSLuskFCUyzXp/XpUlQLZ/oQHfSzQGICJCJ/CQWL6e1fMcCSAFanYOA2AE6BwdXW/2sG/PI5urKCwaVIOhqYH6ZabB4u29wefkuCXDVtN+9XsKioyNzep9BwrINOhf2Tp7A/ZAo58z4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=RkTmkpmt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e2ed2230d8so1032248a91.0
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2024 09:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731000940; x=1731605740; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ezf6lX1oDpLyuU9EkbaNJ+YVfb4X2yKg0DUBvIbVbA4=;
        b=RkTmkpmt98tob2PEM4rpeX0Zz6jZoVCDYYNqM3ajrxQZiZvHpb9QyesWX2Ldto2nXK
         g+CoufE5sxRx9RgzhJGGvrCUXI5mS2tH2r8cfUpi0Cu16/3vet/mOr041UkvM4JyV1zw
         nZ+i48UxYHHj1vtOV7QNsFmzrvIPDy2DLPdkI4zuNZwD3DR6DSBeNU2Bs+XGP72uwXmp
         y+W3scGBX2txj/LBgO9tFRyih4jItNOqEdxleWx8rxjR5jWW/m7gfcd9cwcKVtLBG9Ue
         sbSdq3Mck/8+c3S1S+qUVCkBPY+DIu39ptQMFFwrQ3oAwe8n63FoANxerQgyuducQiSZ
         TcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731000940; x=1731605740;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezf6lX1oDpLyuU9EkbaNJ+YVfb4X2yKg0DUBvIbVbA4=;
        b=NETQ4qyciKGWpdBqPo7NN2VqOgaDGfPbUPwGpeptJsADWfBKer5cTBYaaio47GiXe1
         F/FZ6Uwyv3VtiOLY2ekcopESwhIjXN+nzcRiz9n3yoLWskPCYUsF9hOR6ZcnZi1GHlFF
         zAzhrapSwHvptoMVWBzHPttW4WGzIPiML1ZC03kehZV98eG80huhew4IFYBgGcgP+ylZ
         jGudSaSGRP32UokYjQw1sqhuKkUYsnQLbuwKbkRyvB2o5D34G9BT+DLBSRiugXrcXNr5
         Cf8e5TM15po7jwwzkms+0yosKXCwfyNExXF/Ea3mBrJRyuLlPDQA6220PRQXUADXFIwe
         XQHw==
X-Gm-Message-State: AOJu0YzMBjLetAo0OoT4C6sIixT6ucIie6PuQ8lGf2rn138INLJTiDfT
	OVLO7lHqJ8YaK09R8UYfmkvCn65aDYIMwoAQTFQLW6472rH4ii6YkmIKetNSDfBgAKrXJUTRw07
	H
X-Google-Smtp-Source: AGHT+IFKxwgPHQ3qAAT1HwI7xR8Xn9d8hPYc42bZ91sOIHCuGlZvHI3l88c9ndY51LPahsK1DZ7U+A==
X-Received: by 2002:a17:90b:2685:b0:2e2:a667:1a18 with SMTP id 98e67ed59e1d1-2e9b13d3e5emr112247a91.5.1731000940432;
        Thu, 07 Nov 2024 09:35:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e98ca37ae8sm2901878a91.1.2024.11.07.09.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 09:35:40 -0800 (PST)
Message-ID: <672cfa6c.170a0220.331c6e.3607@mx.google.com>
Date: Thu, 07 Nov 2024 09:35:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241107
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 132 runs, 15 regressions (next-20241107)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 132 runs, 15 regressions (next-20241107)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig           | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241107/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241107
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      74741a050b79d31d8d2eeee12c77736596d0a6b2 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc05f46ea6f566ec8686c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc05f46ea6f566ec86=
86d
        failing since 12 days (last pass: next-20241022, first fail: next-2=
0241025) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc05d46ea6f566ec86866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc05d46ea6f566ec86=
867
        failing since 12 days (last pass: next-20241022, first fail: next-2=
0241025) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc39536a67bc2aec8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc39536a67bc2aec86=
85c
        failing since 21 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc3d1c85d837045c8687c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc3d1c85d837045c86=
87d
        failing since 21 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc90ed7a5c4c0d6c8688e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc90ed7a5c4c0d6c86=
88f
        failing since 16 days (last pass: next-20241016, first fail: next-2=
0241022) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672cbebf768f6da47dc86877

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cbebf768f6da47dc86=
878
        failing since 21 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc3d3c85d837045c86882

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc3d3c85d837045c86=
883
        failing since 21 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc8327f6fbdac69c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc8327f6fbdac69c86=
857
        failing since 16 days (last pass: next-20241016, first fail: next-2=
0241022) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672cbee52555a1abcac86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cbee52555a1abcac86=
856
        failing since 21 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc3d336a67bc2aec8686d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc3d336a67bc2aec86=
86e
        failing since 21 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc8fcc32d4c8b23c86867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc8fcc32d4c8b23c86=
868
        failing since 16 days (last pass: next-20241016, first fail: next-2=
0241022) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672cbed0629b4606b9c868ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cbed0629b4606b9c86=
8ef
        failing since 21 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc449337fde1ea4c8687e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc449337fde1ea4c86=
87f
        failing since 21 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie | gcc-12   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/672cc8489c90c753c3c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cc8489c90c753c3c86=
860
        failing since 16 days (last pass: next-20241016, first fail: next-2=
0241022) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672cbaaf079c4ab7d0c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241107/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241107/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672cbaaf079c4ab7d0c86=
85e
        failing since 21 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =20

