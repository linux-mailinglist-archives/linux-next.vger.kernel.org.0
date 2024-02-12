Return-Path: <linux-next+bounces-1122-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1986A8510E3
	for <lists+linux-next@lfdr.de>; Mon, 12 Feb 2024 11:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C7C1C20852
	for <lists+linux-next@lfdr.de>; Mon, 12 Feb 2024 10:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10B917752;
	Mon, 12 Feb 2024 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jo+T4oph"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A553A101D0
	for <linux-next@vger.kernel.org>; Mon, 12 Feb 2024 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733894; cv=none; b=a57RjoZBqz0I5aJp8rJwjalLSMqMQsJ8Ei8JJqU3ULgr3mrs7iOF6TUwPereOFJBqeKnF3T0rD2r+jTorykSJ0BKNc7RX82qqOcYF7Gpm9qWhqGLvyCdkfL//qJP9kcFOP7MeLqO2i6xpXkwfGCRBcO2tJXyuyiPmnxYZt17mpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733894; c=relaxed/simple;
	bh=6RP1AJ7DQHwPgCwsicB1TX1g5oqK3ReJd/F/BhPkuzE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=QR/jiYT1OjZr4JocVlxgoJORBE40mobDflJFfswnDXhKEpoaSQFDro8qvVTWBFfm88OMvD4y6FJgAqH3XrYIhv4eeqFwLkYLswj7/cZ6DbzgtsB3P8y++CLoEqpNZLZZ8T9WhkwMDygWzgZQLqnhHangez8Y0duOFplEYL/0McY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jo+T4oph; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e09a890341so1043418b3a.3
        for <linux-next@vger.kernel.org>; Mon, 12 Feb 2024 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707733890; x=1708338690; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/VHd1oPg+i3avUAs+kCJcp2AwksjU/EFmZHubiw75lg=;
        b=jo+T4oph9XL4pjLYdxxysQo7l7pNOLvSIMTLX/6nbZToQvo2dWzeClaBDxkKqc+O0w
         T8wovxoSBJobTjKqnblVzXZIFEKQz7bOxRBblHHJsy/k9GuO5DNyXQR7hvpFAHGWDWSp
         oL5BWbb/IB6kQINaSKcgWf2dRddrT1hOTow1E9EIC+B6hu4txvmlfxteUB4ser3h2KUu
         G9gqXRJwDL6QzE6QbzGIBRQ2q/Uwj2CirloTJ0eKvMn5GTgnx/MvfEg1I+wPP6klakAI
         7T0hwGbIj20xz9aduZSWuPC5rbjAZVKf2vsXRjrFr27VoaxnbmiGvuAWBtmztdgheA7O
         1e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733890; x=1708338690;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VHd1oPg+i3avUAs+kCJcp2AwksjU/EFmZHubiw75lg=;
        b=gZBbL+sENaY5VlkTBz5J+BxqczTv/Jv7thGr7USaQHQ/ASG/OdDwNfjMQpmjSFzqbj
         2UEZyc2M4dXxmwoWjqPlrtr46G9HQnhvMNVdr+N1dSvgVTxekfZ2v2zOfEoayO/80UDC
         WZm/ee7Z187rsS9gbLH2KGN4SLtPS7TIx24X/rLi1CdeRAwRZYRDaRH10tbXJuTHp4oY
         hiZ+BCBFDkjocLgdltveY9TI8Yrwpn1Ae5PjLaYyHC3g2KO9oMellFdVVv/ixOMEH8Eb
         Z7O/RPc7lq3B/Tqoke6CliFcx1EQX3NdYSyEpyl6nHzQGOTLhxGAm35KcmU29GTVtbYt
         4vWg==
X-Gm-Message-State: AOJu0YzRbs1QncOkm79RhnKBNOo57Lvo632BMIcfj19pn0uWv/A/RO84
	tM7yCbVCvXrq3iB3SDVe7E9okFYR5Vd8UM7feT7r1ekhku1yuJpJ3geYVxj1PUg1xHCp9Gq3bW3
	pMbw=
X-Google-Smtp-Source: AGHT+IE97NfePErxxRuBLA+Y4lx5z8OBxMc4cEa/deZcPmm9ir25vvQhZf/vTDdwlU14de7EqWKLIQ==
X-Received: by 2002:a62:63c5:0:b0:6e0:3d8c:72bb with SMTP id x188-20020a6263c5000000b006e03d8c72bbmr5287616pfb.33.1707733889961;
        Mon, 12 Feb 2024 02:31:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPKBIK42XKTxj4uHmsWADvlEWnk+K6PBpA6eMyhDyVNGYneRWV8KxgIhGNhgnC1m3TNnzJUAU7RCphjGYSEqVzyUT4NcUAqN2vlr7h2CvGF+L7pcE4g0Ga07M7dkck7OoPbdRZClardrV+bkhx2RE4NA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x17-20020aa79a51000000b006e07f1829b0sm5144329pfj.219.2024.02.12.02.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 02:31:29 -0800 (PST)
Message-ID: <65c9f381.a70a0220.1538e.d195@mx.google.com>
Date: Mon, 12 Feb 2024 02:31:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240212
Subject: next/master baseline: 378 runs, 39 regressions (next-20240212)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 378 runs, 39 regressions (next-20240212)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_riscv64                 | riscv | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240212/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240212
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ae00c445390b349e070a64dc62f08aa878db7248 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9b4ccd528fad0b18e1e9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9b4ccd528fad0b18e1=
e9f
        failing since 376 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bc0d87c9fa0a818e1e7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9bc0d87c9fa0a818e1=
e7d
        failing since 252 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9b70e6bb8700c2e8e1f81

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9b70e6bb8700c2e8e1=
f82
        failing since 320 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9b8faece612f85e8e1e9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9b8faece612f85e8e1=
ea0
        failing since 318 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bdf8d1fafc48368e1eee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9bdf8d1fafc48368e1=
eef
        failing since 671 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9c40d2a511518968e1e79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9c40d2a511518968e1=
e7a
        failing since 94 days (last pass: next-20231103, first fail: next-2=
0231110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9c39701dce8bac68e1ee0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9c39701dce8bac68e1=
ee1
        failing since 101 days (last pass: next-20231025, first fail: next-=
20231103) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65c9bcebc46e8872128e1e94

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9bcebc46e8872128e1e97
        failing since 60 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-12T06:38:17.198767  / #
    2024-02-12T06:38:17.300897  # #export SHELL=3D/bin/sh
    2024-02-12T06:38:17.301667  =

    2024-02-12T06:38:17.403082  / # export SHELL=3D/bin/sh. /lava-428606/en=
vironment
    2024-02-12T06:38:17.403811  =

    2024-02-12T06:38:17.505094  / # . /lava-428606/environment/lava-428606/=
bin/lava-test-runner /lava-428606/1
    2024-02-12T06:38:17.506572  =

    2024-02-12T06:38:17.509816  / # /lava-428606/bin/lava-test-runner /lava=
-428606/1
    2024-02-12T06:38:17.569326  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-12T06:38:17.569764  + <8>[   21.066682] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 428606_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c9bcebc46e8872128e1e9b
        failing since 60 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-12T06:38:19.675238  /lava-428606/1/../bin/lava-test-case
    2024-02-12T06:38:19.675669  <8>[   23.173682] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-12T06:38:19.675975  /lava-428606/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c9bcebc46e8872128e1e9d
        failing since 60 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-12T06:38:20.737182  /lava-428606/1/../bin/lava-test-case
    2024-02-12T06:38:20.737647  <8>[   24.212479] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-12T06:38:20.738083  /lava-428606/1/../bin/lava-test-case
    2024-02-12T06:38:20.738372  <8>[   24.230370] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-02-12T06:38:20.738648  /lava-428606/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c9bcebc46e8872128e1ea2
        failing since 60 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-12T06:38:21.815313  /lava-428606/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c9bcebc46e8872128e1ea3
        failing since 60 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-12T06:38:21.818516  <8>[   25.331341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-12T06:38:22.879400  /lava-428606/1/../bin/lava-test-case
    2024-02-12T06:38:22.879875  <8>[   26.353017] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-12T06:38:22.880151  /lava-428606/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9c3cc412738c0ba8e1e9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9c3cc412738c0ba8e1=
e9f
        failing since 59 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65c9bcedc46e8872128e1ef5

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9bcedc46e8872128e1ef8
        failing since 60 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-12T06:38:16.954786  / # #
    2024-02-12T06:38:17.056830  export SHELL=3D/bin/sh
    2024-02-12T06:38:17.057571  #
    2024-02-12T06:38:17.158867  / # export SHELL=3D/bin/sh. /lava-428608/en=
vironment
    2024-02-12T06:38:17.159454  =

    2024-02-12T06:38:17.260759  / # . /lava-428608/environment/lava-428608/=
bin/lava-test-runner /lava-428608/1
    2024-02-12T06:38:17.261965  =

    2024-02-12T06:38:17.302109  / # /lava-428608/bin/lava-test-runner /lava=
-428608/1
    2024-02-12T06:38:17.335104  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-12T06:38:17.335558  + <8>[   20.966182] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 428608_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c9bcedc46e8872128e1f0b
        failing since 60 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-12T06:38:19.769448  /lava-428608/1/../bin/lava-test-case
    2024-02-12T06:38:19.769940  <8>[   23.389730] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-12T06:38:19.770254  /lava-428608/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9c2f055500007258e1e7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9c2f055500007258e1=
e7f
        failing since 59 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/65c9c358d4497a1dc18e1e7e

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65c9c358d4497a1=
dc18e1e85
        failing since 68 days (last pass: next-20231120, first fail: next-2=
0231205)
        2 lines

    2024-02-12T07:05:36.886002  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-02-12T07:05:36.886396  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-02-12T07:05:36.886747  kern  :alert : Data abort info:
    2024-02-12T07:05:36.924517  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-02-12T07:05:36.925171  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-02-12T07:05:36.925577  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-02-12T07:05:36.925944  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-02-12T07:05:36.926631  kern  :emerg : Internal error: Oops: 000000=
009<8>[   19.787498] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfa=
il UNITS=3Dlines MEASUREMENT=3D2>
    2024-02-12T07:05:36.927036  6000004 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65c9c358d4497a1=
dc18e1e86
        failing since 68 days (last pass: next-20231120, first fail: next-2=
0231205)
        12 lines

    2024-02-12T07:05:36.881570  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-02-12T07:05:36.882204  kern  :alert : Mem abort info:
    2024-02-12T07:05:36.882600  kern  :alert :   ESR =3D 0x0000000096000004
    2024-02-12T07:05:36.882961  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits<8>[   19.739976] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3D=
alert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2024-02-12T07:05:36.883319  =

    2024-02-12T07:05:36.883745  kern  :alert :   SET =3D 0, FnV =3D 0   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9c34cd4497a1dc18e1e79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9c34cd4497a1dc18e1=
e7a
        failing since 369 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9c3406128c808268e1ea1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9c3406128c808268e1=
ea2
        failing since 369 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bf67fe2656def88e1e8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9bf67fe2656def88e1=
e90
        failing since 25 days (last pass: next-20240109, first fail: next-2=
0240117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bf79606b3046c58e1e9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9bf79606b3046c58e1=
e9f
        failing since 25 days (last pass: next-20240109, first fail: next-2=
0240117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bf6671fde6a5268e1eac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9bf6671fde6a5268e1=
ead
        failing since 25 days (last pass: next-20240109, first fail: next-2=
0240117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bf77fe2656def88e1e94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9bf77fe2656def88e1=
e95
        failing since 25 days (last pass: next-20240109, first fail: next-2=
0240117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_riscv64                 | riscv | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9b8e71a66fbb9a38e1e9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9b8e71a66fbb9a38e1=
e9b
        failing since 4 days (last pass: next-20240206, first fail: next-20=
240207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9be8e0236c422788e1ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9be8e0236c422788e1=
ec5
        failing since 446 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bd8aacf6e717498e1eae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9bd8aacf6e717498e1=
eaf
        failing since 446 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bde8d1fafc48368e1ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9bde8d1fafc48368e1=
ee9
        failing since 4 days (last pass: next-20240125, first fail: next-20=
240207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9c3f46ea31641bd8e1eb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9c3f56ea31641bd8e1=
eb6
        failing since 121 days (last pass: next-20230125, first fail: next-=
20231013) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9c30432db50cd958e1e82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9c30432db50cd958e1=
e83
        failing since 367 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9c2ee599c6e41058e1e8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c9c2ee599c6e41058e1=
e8b
        failing since 367 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9b6c80ad55dccea8e1eb4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9b6c80ad55dccea8e1eb9
        failing since 250 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-12T06:12:13.477391  <8>[   13.938639] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3926049_1.5.2.4.1>
    2024-02-12T06:12:13.585048  / # #
    2024-02-12T06:12:13.687772  export SHELL=3D/bin/sh
    2024-02-12T06:12:13.688847  #
    2024-02-12T06:12:13.790302  / # export SHELL=3D/bin/sh. /lava-3926049/e=
nvironment
    2024-02-12T06:12:13.791218  =

    2024-02-12T06:12:13.892983  / # . /lava-3926049/environment/lava-392604=
9/bin/lava-test-runner /lava-3926049/1
    2024-02-12T06:12:13.894328  =

    2024-02-12T06:12:13.908243  / # /lava-3926049/bin/lava-test-runner /lav=
a-3926049/1
    2024-02-12T06:12:14.029160  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bd08b483cfb3c88e1e7e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9bd08b483cfb3c88e1e83
        failing since 250 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-12T06:38:47.204675  / # #
    2024-02-12T06:38:47.307161  export SHELL=3D/bin/sh
    2024-02-12T06:38:47.308025  #
    2024-02-12T06:38:47.409351  / # export SHELL=3D/bin/sh. /lava-3926103/e=
nvironment
    2024-02-12T06:38:47.410156  =

    2024-02-12T06:38:47.511531  / # . /lava-3926103/environment/lava-392610=
3/bin/lava-test-runner /lava-3926103/1
    2024-02-12T06:38:47.512809  =

    2024-02-12T06:38:47.528395  / # /lava-3926103/bin/lava-test-runner /lav=
a-3926103/1
    2024-02-12T06:38:47.637479  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-12T06:38:47.638373  + cd /lava-3926103/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bda6f52ceccf978e1e7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9bda6f52ceccf978e1e7f
        failing since 250 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-12T06:41:29.011971  + set +x<8>[   14.389606] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3926110_1.5.2.4.1>
    2024-02-12T06:41:29.012440  =

    2024-02-12T06:41:29.120962  / # #
    2024-02-12T06:41:29.223608  export SHELL=3D/bin/sh
    2024-02-12T06:41:29.224524  #
    2024-02-12T06:41:29.326052  / # export SHELL=3D/bin/sh. /lava-3926110/e=
nvironment
    2024-02-12T06:41:29.326966  =

    2024-02-12T06:41:29.428626  / # . /lava-3926110/environment/lava-392611=
0/bin/lava-test-runner /lava-3926110/1
    2024-02-12T06:41:29.430245  =

    2024-02-12T06:41:29.443101  / # /lava-3926110/bin/lava-test-runner /lav=
a-3926110/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9b7d846d824c24e8e1e7b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9b7d846d824c24e8e1e80
        failing since 250 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-12T06:16:37.991397  + set +x
    2024-02-12T06:16:37.993141  [   19.979933] <LAVA_SIGNAL_ENDRUN 0_dmesg =
457802_1.5.2.4.1>
    2024-02-12T06:16:38.102865  / # #
    2024-02-12T06:16:38.204421  export SHELL=3D/bin/sh
    2024-02-12T06:16:38.204931  #
    2024-02-12T06:16:38.305896  / # export SHELL=3D/bin/sh. /lava-457802/en=
vironment
    2024-02-12T06:16:38.306481  =

    2024-02-12T06:16:38.407480  / # . /lava-457802/environment/lava-457802/=
bin/lava-test-runner /lava-457802/1
    2024-02-12T06:16:38.408317  =

    2024-02-12T06:16:38.411297  / # /lava-457802/bin/lava-test-runner /lava=
-457802/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bd78a9919e8f958e1e79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9bd78a9919e8f958e1e7e
        failing since 250 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-12T06:40:41.793843  + set +x
    2024-02-12T06:40:41.795685  [   24.237022] <LAVA_SIGNAL_ENDRUN 0_dmesg =
457809_1.5.2.4.1>
    2024-02-12T06:40:41.903877  / # #
    2024-02-12T06:40:42.005627  export SHELL=3D/bin/sh
    2024-02-12T06:40:42.006367  #
    2024-02-12T06:40:42.107500  / # export SHELL=3D/bin/sh. /lava-457809/en=
vironment
    2024-02-12T06:40:42.108129  =

    2024-02-12T06:40:42.209131  / # . /lava-457809/environment/lava-457809/=
bin/lava-test-runner /lava-457809/1
    2024-02-12T06:40:42.209978  =

    2024-02-12T06:40:42.212529  / # /lava-457809/bin/lava-test-runner /lava=
-457809/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9be0497f5ccbecb8e1e8a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9be0497f5ccbecb8e1e8f
        failing since 250 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-12T06:42:44.423312  + set +x
    2024-02-12T06:42:44.425063  [   20.604597] <LAVA_SIGNAL_ENDRUN 0_dmesg =
457810_1.5.2.4.1>
    2024-02-12T06:42:44.534432  / # #
    2024-02-12T06:42:44.636396  export SHELL=3D/bin/sh
    2024-02-12T06:42:44.637026  #
    2024-02-12T06:42:44.738172  / # export SHELL=3D/bin/sh. /lava-457810/en=
vironment
    2024-02-12T06:42:44.738813  =

    2024-02-12T06:42:44.839911  / # . /lava-457810/environment/lava-457810/=
bin/lava-test-runner /lava-457810/1
    2024-02-12T06:42:44.840931  =

    2024-02-12T06:42:44.843626  / # /lava-457810/bin/lava-test-runner /lava=
-457810/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9b9ff84460172e88e1e8e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c9b9ff84460172e88e1e93
        failing since 62 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-12T06:25:51.741509  / # #
    2024-02-12T06:25:51.842654  export SHELL=3D/bin/sh
    2024-02-12T06:25:51.843150  #
    2024-02-12T06:25:51.944191  / # export SHELL=3D/bin/sh. /lava-3926100/e=
nvironment
    2024-02-12T06:25:51.944693  =

    2024-02-12T06:25:52.045749  / # . /lava-3926100/environment/lava-392610=
0/bin/lava-test-runner /lava-3926100/1
    2024-02-12T06:25:52.046383  =

    2024-02-12T06:25:52.054753  / # /lava-3926100/bin/lava-test-runner /lav=
a-3926100/1
    2024-02-12T06:25:52.134804  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-12T06:25:52.150807  + cd /lava-3926100/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c9bf29da5e058d718e1e7a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240212/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65c9bf29da5e058=
d718e1e81
        failing since 25 days (last pass: next-20240109, first fail: next-2=
0240117)
        1 lines

    2024-02-12T06:47:50.583778  kern  :emerg : watchdog: BUG: soft lockup -=
 CPU#1 stuck for 53s! [kworker/u16:2:57]
    2024-02-12T06:47:50.800736  <8>[  116.298947][  T195] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =20

