Return-Path: <linux-next+bounces-4538-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E69EF9B67E8
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 16:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BAB1F214CD
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 15:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2451F4711;
	Wed, 30 Oct 2024 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="mVi/bqeM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454EAB672
	for <linux-next@vger.kernel.org>; Wed, 30 Oct 2024 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730302298; cv=none; b=tXUBU7WgiOJIxX/brDhLZiDdSDsZ2uU982Ich/ZPpqV3ACYbrrFVED7tzQKTaHnCMqT/aR1iCcRsQGVk0oXX/46JuTCWztqDy2uAZZ3KKw7JSw1VMPIKebtJPeg6vlKeV7JyK4u2m/TUKddoYDuasDcR37q027f7Eglv6MAIZhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730302298; c=relaxed/simple;
	bh=p5/s0iZTdSM9Kp+sFwkq9aeFuJWSW1t5I/sErbjAL6w=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=jgMrGNgrfni+vn4npPKbjPQSPuImMIhw+Rvt1gtB5ALRBLeaR3PrXiOf+zSnT4CVfkaEbPUZNn8yb2KwsUt6BAu1sh25jYKdusGitMXODP0kYBi8B/aCs/iMuUXTPzQ7xLGhac/PqpJxb2/GN3sZsFyMnpjflBM5Ci+qLTifs98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=mVi/bqeM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20e6981ca77so72205265ad.2
        for <linux-next@vger.kernel.org>; Wed, 30 Oct 2024 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730302293; x=1730907093; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tnstiha+P+gfb8qmAN3RURDlEZkF8TOPV7O0zzi2mBI=;
        b=mVi/bqeMZ4/XoyJuRQP1gtgIAXwpCFCHyq5aMLNRLKgTv63WlshF+rep0H6LmlX5Ep
         0THWSfa2aP6vU6UITyEs4pjfD8iGJcqJH5cPyT2vLwNYDPE0G9zqqHDAxoPjkSdeucsK
         kO+v0T4PJOkbZXnKefx8rQyQtIWWoSotajXwjSxt86ms/yzI6ckY34mx56ZTIoVyT1UX
         3Fa4q6PxQBIAGp7MoEKq19xbpOFmIeH44Jjns5wNpdueFHqE04iFzjxYv5v7SkUcKDm1
         qfYmSDRkkpvVpSv7G61e6fcVMyoh3+9vVOflyjSIfVuocMZp9y1B4BheLvRZvHsmv6nW
         jRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730302293; x=1730907093;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tnstiha+P+gfb8qmAN3RURDlEZkF8TOPV7O0zzi2mBI=;
        b=H5ayXjgPeQbH2Me7/kDAW0xr1If0cIKHK61XPeZb9UhxAzrS9bBooEjBOrl3A+H+Px
         7UrkC+iKIdzzTBAAU5VMYWpvWlw9SkCGi9h6K7HecrZUoG4ubXP7u7MWlJ+TXK01XlK5
         Q8QPEvQ3wl5RaIF+wvfMkSmG/e5VFV1b/i6uOR//9ZD6gsLESuiEN/RPeWsVSyjRnlzb
         /IxP6lHzw4rf1P+vBss5h2jGlgp3FSbtFiXGcMLikTvZHnBzItgD2gx3MGMHF0v9fWpd
         dZT8Vhe19xzYPSd2io7Xrie2UOm9r489/q409U2KwCup9sSvgVVEJ/I85ebFb9J80Htd
         X6Qw==
X-Gm-Message-State: AOJu0Yw+Qq6HaY/WRBB3SX+4cXGkM0J//Lnc5cO+k0pP8fIMO0iLRRNi
	3Fz/UgmBbxhjbW6TFtTz5ZQ8KEr7hA1/Ko3ZQrc0uYcNT37UTmybm6INd6YeCA5/19QS/JlSlse
	f
X-Google-Smtp-Source: AGHT+IHszbg4C0GEF7aQULAzwo32t9sdAUMUfqjMi8T4lAM2gLIWT+lXP48+6QIMjamK47VZx+IVLA==
X-Received: by 2002:a17:902:cccf:b0:210:fce4:11ec with SMTP id d9443c01a7336-210fce4142fmr21413035ad.1.1730302292805;
        Wed, 30 Oct 2024 08:31:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf4346bsm82490935ad.6.2024.10.30.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 08:31:32 -0700 (PDT)
Message-ID: <67225154.170a0220.256310.3b09@mx.google.com>
Date: Wed, 30 Oct 2024 08:31:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241030
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 134 runs, 19 regressions (next-20241030)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 134 runs, 19 regressions (next-20241030)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efconfig           | 1          =

beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241030/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241030
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      86e3904dcdc7e70e3257fc1de294a1b75f3d8d04 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6722186221486bfe1fc868b1

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6722186221486bfe=
1fc868b6
        failing since 1 day (last pass: next-20241025, first fail: next-202=
41028)
        1 lines

    2024-10-30T11:28:29.993297  / # =

    2024-10-30T11:28:30.002135  =

    2024-10-30T11:28:30.106874  / # #
    2024-10-30T11:28:30.114111  #
    2024-10-30T11:28:30.216130  / # export SHELL=3D/bin/sh
    2024-10-30T11:28:30.226003  export SHELL=3D/bin/sh
    2024-10-30T11:28:30.327821  / # . /lava-1213805/environment
    2024-10-30T11:28:30.337910  . /lava-1213805/environment
    2024-10-30T11:28:30.439786  / # /lava-1213805/bin/lava-test-runner /lav=
a-1213805/0
    2024-10-30T11:28:30.449844  /lava-1213805/bin/lava-test-runner /lava-12=
13805/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67221c714038289631c86873

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/67221c7140382896=
31c86878
        new failure (last pass: next-20241029)
        1 lines

    2024-10-30T11:45:45.172755  / # =

    2024-10-30T11:45:45.181840  =

    2024-10-30T11:45:45.286995  / # #
    2024-10-30T11:45:45.293587  #
    2024-10-30T11:45:45.411200  / # export SHELL=3D/bin/sh
    2024-10-30T11:45:45.421493  export SHELL=3D/bin/sh
    2024-10-30T11:45:45.523173  / # . /lava-1213817/environment
    2024-10-30T11:45:45.533431  . /lava-1213817/environment
    2024-10-30T11:45:45.635312  / # /lava-1213817/bin/lava-test-runner /lav=
a-1213817/0
    2024-10-30T11:45:45.645166  /lava-1213817/bin/lava-test-runner /lava-12=
13817/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/67221d8a9415fd798cc8686d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/67221d8a9415fd79=
8cc86872
        failing since 1 day (last pass: next-20241028, first fail: next-202=
41029)
        1 lines

    2024-10-30T11:50:23.303572  / # =

    2024-10-30T11:50:23.312563  =

    2024-10-30T11:50:23.417406  / # #
    2024-10-30T11:50:23.424075  #
    2024-10-30T11:50:23.526116  / # export SHELL=3D/bin/sh
    2024-10-30T11:50:23.536217  export SHELL=3D/bin/sh
    2024-10-30T11:50:23.638030  / # . /lava-1213824/environment
    2024-10-30T11:50:23.648156  . /lava-1213824/environment
    2024-10-30T11:50:23.749933  / # /lava-1213824/bin/lava-test-runner /lav=
a-1213824/0
    2024-10-30T11:50:23.760173  /lava-1213824/bin/lava-test-runner /lava-12=
13824/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/67221692ef6ffac229c86888

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67221692ef6ffac229c86=
889
        failing since 19 days (last pass: next-20241008, first fail: next-2=
0241011) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672215d5e107457f90c86865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672215d5e107457f90c86=
866
        failing since 4 days (last pass: next-20241022, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6722173f8eb0219c93c86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6722173f8eb0219c93c86=
862
        failing since 1 day (last pass: next-20241021, first fail: next-202=
41028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/672218a548dd49a90dc86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672218a548dd49a90dc86=
863
        failing since 1 day (last pass: next-20241022, first fail: next-202=
41028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672215d6dfeba1463dc86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672215d6dfeba1463dc86=
85a
        failing since 4 days (last pass: next-20241022, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6722173d0c0089dcc7c86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6722173d0c0089dcc7c86=
863
        failing since 1 day (last pass: next-20241021, first fail: next-202=
41028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/672218a748dd49a90dc86865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672218a748dd49a90dc86=
866
        failing since 1 day (last pass: next-20241022, first fail: next-202=
41028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67220ee2c16d20a561c86871

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67220ee2c16d20a561c86=
872
        failing since 8 days (last pass: next-20241016, first fail: next-20=
241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67221929df87017fedc868ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67221929df87017fedc86=
8ee
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67220ee349abd05bf5c86873

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67220ee349abd05bf5c86=
874
        failing since 8 days (last pass: next-20241016, first fail: next-20=
241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672219dd8cd5bfc7d7c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672219dd8cd5bfc7d7c86=
856
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67220eb93eef9440abc86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67220eb93eef9440abc86=
86a
        failing since 8 days (last pass: next-20241016, first fail: next-20=
241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6722194662ab053f9fc86cb3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6722194662ab053f9fc86=
cb4
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67220eeb49abd05bf5c8687d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67220eeb49abd05bf5c86=
87e
        failing since 8 days (last pass: next-20241016, first fail: next-20=
241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67221948c5ea96bdf9c8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67221948c5ea96bdf9c86=
85f
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6722132b2c57fdb814c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241030/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241030/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6722132b2c57fdb814c86=
856
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =20

