Return-Path: <linux-next+bounces-3476-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BCC96280D
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 14:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B77441C23F75
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 12:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6F917BEA2;
	Wed, 28 Aug 2024 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0RkH4yWf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B0178CF6
	for <linux-next@vger.kernel.org>; Wed, 28 Aug 2024 12:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849984; cv=none; b=L/6k0nFC/9NhHlohRS5eTfiLsW2K1Y6x8d7av4rWi4y9ZrdvCRawVolXVc5gyPn+dGsAOKdgPf3wn1gLbDxASxExD2Jx/qydO7bYafwhqMipcqmWn/GVaizlHI3IliV+j1WZm7udi/HQy3x98nNQ6x/xqz4M8MHCMfbITaZTagc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849984; c=relaxed/simple;
	bh=WY/fORPdkPoKH4qJq2eDOs4+PS1zPKwHBEugTREQjYM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=gUNk7KOIPMyr2l/65NDD+ckPX1WihyLtGn2Y/DC0MSe/sQxlARm62jFjamMbKZwdiFm9OTRh6FrboCDdGwT6SeWfTmiW8BkN1vQOlqMgiTpZLt28DL4X8dRvq18AJXEvXMBfR9fdCxgqZNrWUCspXr2SStXiAC9woiU+eOZe+GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0RkH4yWf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-202318c4f45so69093765ad.0
        for <linux-next@vger.kernel.org>; Wed, 28 Aug 2024 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724849981; x=1725454781; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NXba/GZQLFOpGw2lLU0qQeqrBt35x2WNVDfxYfnu1lA=;
        b=0RkH4yWf87KAFmuLZAtMl02QhiM+FKj/HplY52yFUdmsfmOhoHKjnjKWwTKr2pAed0
         z9VQarQocebHUlPKnnKYd46BOp+Nb5f/jLVRSDv2spqriPntjtBNSXDfp15Te2ZUOLjF
         k8EZQhFsH5kKkMGAlPVMEopXtRiqSVeyRJFy6BvtgoV8TYz9g2/nXCVtxmcJgvkC1o15
         mDcxhtXuvpercxx9iKN/VjoPHy5deFuTJwfflH5PqdG+659jIgl3PK4bLXCNTUIwtbLS
         XL8mk6aGz9iay5j/Yjd2xII/o5AK1aY1VDyMNas8dnF9FToNHqIV+LCQKHQWgE0g745K
         qMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724849981; x=1725454781;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXba/GZQLFOpGw2lLU0qQeqrBt35x2WNVDfxYfnu1lA=;
        b=ikUIxoFx1rNtHIKo/j6xqu5Cl4hN4VO1WSUiy+5H38bCRvl0qrI71v0ZAT60nzPCD2
         PwpY0GRIZf+xTwxjshuXr8G+wht5QWXZrHZX+/mQ4y6FlX9If9RdCb+WxLZZwpZ63ejF
         0xXI3nKlT+RAiNxdgkuUQWjJnUv30UuWNVthsoikJpjp6ewEuYCrQlDjcQfmiicwA9MH
         bcFyUZTtxvfEHZvS+Oe+J3gMcABmw+eQatEiv8lLVi6YqFZeARq0c8PoEKKnPNEeHVpL
         M/Jg7gM449Y23Aka3BauyfiBVTgTpwtGT8VmMPOr+VKvDiUIh4x6H3mD4mtEwKt6UT7X
         ifTA==
X-Gm-Message-State: AOJu0Ywl6/3QkVKIY2oa87+t1u6shzKLPvJ04uUN9Lf7h64f6GWS+dxA
	Mg1Qh3fAKqvh4mm6YTlFvlIT3dAjKKaDh/aVtuBrpUkGe/fXJcBDJ0JG6Y/bxXjDbx7LQOzwM0z
	nAic=
X-Google-Smtp-Source: AGHT+IHxDXSi1BcUa+Q4MxFRG5w392g9X56faOvMG8LH7XGtzKhPGYtrJCxThftqnpEPzkXlAknz8g==
X-Received: by 2002:a17:902:e882:b0:202:1972:daf7 with SMTP id d9443c01a7336-204f9c29935mr19416435ad.50.1724849980420;
        Wed, 28 Aug 2024 05:59:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385ae5045sm98561275ad.239.2024.08.28.05.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:59:40 -0700 (PDT)
Message-ID: <66cf1f3c.170a0220.106760.562c@mx.google.com>
Date: Wed, 28 Aug 2024 05:59:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240828
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 250 runs, 6 regressions (next-20240828)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 250 runs, 6 regressions (next-20240828)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beagle-xm                    | arm   | lab-baylibre | gcc-12   | omap2plus_=
defconfig          | 1          =

qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240828/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240828
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      195a402a75791e6e0d96d9da27ca77671bc656a8 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beagle-xm                    | arm   | lab-baylibre | gcc-12   | omap2plus_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/66cee3dd48197d0366c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240828/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240828/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cee3dd48197d0366c86=
856
        new failure (last pass: next-20240821) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ceeb8a3a7702140fc86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240828/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240828/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ceeb8a3a7702140fc86=
856
        failing since 42 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ceeb757f4de52abdc86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240828/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240828/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ceeb757f4de52abdc86=
856
        failing since 42 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66cee6793014d47744c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240828/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240828/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cee6793014d47744c86=
860
        failing since 7 days (last pass: next-20240820, first fail: next-20=
240821) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66cee652c3ada88399c86892

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240828/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240828/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cee652c3ada88399c86=
893
        new failure (last pass: next-20240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66ceedc1d060eeb9f7c86868

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240828/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ceedc1d060eeb9f7c86=
869
        new failure (last pass: next-20240821) =

 =20

