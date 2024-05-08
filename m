Return-Path: <linux-next+bounces-2232-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AB88BFFD4
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 16:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 112D01F229D4
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 14:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B0F84E0F;
	Wed,  8 May 2024 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KYrFYIuG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EFD54FA3
	for <linux-next@vger.kernel.org>; Wed,  8 May 2024 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715178104; cv=none; b=Zm1G7y6q/Zekl5vK3a/ZUBumgLO07OQtyX+gpfCkZ1KqEIABywXdqdW/1zLMVja0o1OuaYnm53M/6wcjMYIAhj+0IaTbk+9uIqQU9pDmGqCJYOI2RPiNlh58enRyxv5ywPBZBQ1XJAt2htgJopnbR3hiu8PJ2tK9jQrFu3C6JIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715178104; c=relaxed/simple;
	bh=r86khabKz9BNUwqKhkt0/kRRM1QeEaZGdY6X9JQGdtw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=VqdwnCEPxwmGaZoHV0zdQ52z/zAIdNRqQObKd/lfBdPOlJWtsPfW44s93/PuDI8WC1pM+O64pjTqcFryC9CDVp2qnIlkrg4DE4mQxt2UkKMOrzNkPb+TzcLKLV05hUgJqvzsC3R0vlcGWuWORYWVMzUPV1zAycWjuNeoBZffn8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KYrFYIuG; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5b25cee6b7bso196049eaf.3
        for <linux-next@vger.kernel.org>; Wed, 08 May 2024 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715178101; x=1715782901; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8fuXfmnjIhCNFhHONUUWtoQjyRxKZVutuOgYPPMaW3k=;
        b=KYrFYIuGiA5JZShv3Px3yJHa3IHCjbKOH4cSboibfYUHkp/hQA/aQoll7tQDBcfIUk
         UWD1H7KrW8FklFxGz2v/FHYwufOwXSFjeNqUVx3I6xs0zN0XBV6a9Sgy81iHYsO+aDJT
         tRFdB5Err7ieiHn2Rs0lvQH3tEw4UJszp3q6pWT+aNSfphLLH13czQanfXjFwMQKOH/U
         xr0I7VnkHo9lT6CjXpxo3bfEuDYIwR+KObTt0TtS9c3g/ejlXQuPi5bfC1ZC1FZ0XNrn
         94uqddRyBRnW3aV9u1cw/9i1jX8Angrffusa6cung5KFaj/pAqF1QkGweeCdoBZmNnDx
         qLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715178101; x=1715782901;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fuXfmnjIhCNFhHONUUWtoQjyRxKZVutuOgYPPMaW3k=;
        b=fV6f49zxcfpPWCjWtrjKhE469VNDxGKtPQpIdXHbuNtJhi6rTocx5Yf02yhAmYb9yY
         sTKl+c80qWBLVUjs6I6Qtg52mR3SrrbwqJSuOfQKHAo8ENR7qXJDOUXtYi+4YSSD76iN
         fZtuwzkyvBWW67QINCEUH6rFRg18uxFr4ewI41v2MDNSTQk2KM/8RMp/pZ4C0vVcO0er
         1/OYb3JdBYdW2nlhvq3HCQ/g10COm0WB21K9LLv9m1St8FjBgnk60pVlUkdKsLMQ+LcB
         7utUZo7h79E3IV5P4E792X9aYT16/Dhvz42I5YTZZ/D716cYvfVxVvRyu/Eu+xTu2KJd
         wkUA==
X-Gm-Message-State: AOJu0YzYEtRUcRbz87AryUxAp/ifQ/F8tbbFVnoGUXRI4sIRNGTNoEBi
	QEj/OmDVHQS0qH79Q0mx1/4iAaoRSkcvuovtPXabTCJYkOhpXeMd+7b42PxNIKQWLuhbg2kwaXl
	S
X-Google-Smtp-Source: AGHT+IG0x3MCPwVE/xbZNQDV2EIUhXnYuiFa87b9g9+eO1O99HHzkdWSbcWyT0wN4buDfZIxZIxGQQ==
X-Received: by 2002:a05:6358:b390:b0:186:40c3:e495 with SMTP id e5c5f4694b2df-192d377c836mr283439255d.23.1715178098368;
        Wed, 08 May 2024 07:21:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id bw12-20020a056a02048c00b006208bdabc96sm7046490pgb.76.2024.05.08.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 07:21:38 -0700 (PDT)
Message-ID: <663b8a72.050a0220.45d35.1008@mx.google.com>
Date: Wed, 08 May 2024 07:21:38 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240508
X-Kernelci-Report-Type: test
Subject: next/master baseline: 162 runs, 15 regressions (next-20240508)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 162 runs, 15 regressions (next-20240508)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-10   | sama5_defconfig =
             | 1          =

bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-10   | bcm2835_defconfi=
g            | 1          =

beagle-xm             | arm   | lab-baylibre  | gcc-10   | omap2plus_defcon=
fig          | 1          =

beaglebone-black      | arm   | lab-cip       | gcc-10   | multi_v7_defconf=
ig           | 1          =

hifive-unleashed-a00  | riscv | lab-baylibre  | clang-17 | defconfig       =
             | 1          =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-10   | defconfig       =
             | 1          =

jetson-tk1            | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig           | 1          =

jetson-tk1            | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =

odroid-xu3            | arm   | lab-collabora | gcc-10   | exynos_defconfig=
             | 1          =

odroid-xu3            | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

odroid-xu3            | arm   | lab-collabora | gcc-10   | multi_v7_defconf=
ig           | 1          =

odroid-xu3            | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =

r8a7743-iwg20d-q7     | arm   | lab-cip       | gcc-10   | shmobile_defconf=
ig           | 1          =

rk3288-rock2-square   | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq     | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240508/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240508
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e7b4ef8fffaca247809337bb78daceb406659f2d =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-10   | sama5_defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/663b50e62ac834ea624c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b50e62ac834ea624c4=
2e2
        failing since 462 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-10   | bcm2835_defconfi=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4c5bd0b47cb6674c42f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b4c5bd0b47cb6674c4=
2fa
        failing since 338 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beagle-xm             | arm   | lab-baylibre  | gcc-10   | omap2plus_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4fafab950953894c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b4fafab950953894c4=
2db
        failing since 9 days (last pass: next-20240426, first fail: next-20=
240429) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
beaglebone-black      | arm   | lab-cip       | gcc-10   | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4c3d8b2fe3f50f4c42fe

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/663b4c3d8b2fe3f5=
0f4c4303
        new failure (last pass: next-20240507)
        1 lines

    2024-05-08T09:56:02.651797  / # =

    2024-05-08T09:56:02.657954  =

    2024-05-08T09:56:02.761322  / # #
    2024-05-08T09:56:02.767339  #
    2024-05-08T09:56:02.868558  / # export SHELL=3D/bin/sh
    2024-05-08T09:56:02.874588  export SHELL=3D/bin/sh
    2024-05-08T09:56:02.975548  / # . /lava-1129869/environment
    2024-05-08T09:56:02.981651  . /lava-1129869/environment
    2024-05-08T09:56:03.082648  / # /lava-1129869/bin/lava-test-runner /lav=
a-1129869/0
    2024-05-08T09:56:03.087403  /lava-1129869/bin/lava-test-runner /lava-11=
29869/0 =

    ... (9 line(s) more)  =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
hifive-unleashed-a00  | riscv | lab-baylibre  | clang-17 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4af160b3bd95c84c4372

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b4af160b3bd95c84c4=
373
        failing since 2 days (last pass: next-20240503, first fail: next-20=
240506) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-10   | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/663b505914cd20c8144c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b505914cd20c8144c4=
2db
        failing since 2 days (last pass: next-20240503, first fail: next-20=
240506) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
jetson-tk1            | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4ba359ebb5221d4c42f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b4ba359ebb5221d4c4=
2f8
        failing since 48 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
jetson-tk1            | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4bfa8d689c5f464c431a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b4bfa8d689c5f464c4=
31b
        failing since 757 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
odroid-xu3            | arm   | lab-collabora | gcc-10   | exynos_defconfig=
             | 1          =


  Details:     https://kernelci.org/test/plan/id/663b478383c625fc204c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b478383c625fc204c4=
2e2
        failing since 2 days (last pass: next-20240503, first fail: next-20=
240506) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
odroid-xu3            | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/663b470a8c2ef34c644c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-odroid-xu3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-odroid-xu3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b470a8c2ef34c644c4=
2e3
        failing since 2 days (last pass: next-20240503, first fail: next-20=
240506) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
odroid-xu3            | arm   | lab-collabora | gcc-10   | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4bbbbd433d6c724c4309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b4bbbbd433d6c724c4=
30a
        failing since 2 days (last pass: next-20240501, first fail: next-20=
240506) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
odroid-xu3            | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4c4f3533ce4c5d4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b4c4f3533ce4c5d4c4=
2db
        failing since 2 days (last pass: next-20240503, first fail: next-20=
240506) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
r8a7743-iwg20d-q7     | arm   | lab-cip       | gcc-10   | shmobile_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/663b494f3b4e0473034c42ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b494f3b4e0473034c4=
2f0
        failing since 5 days (last pass: next-20240502, first fail: next-20=
240503) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3288-rock2-square   | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4ce8533a69dae04c42fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b4ce8533a69dae04c4=
2fd
        failing since 533 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3288-veyron-jaq     | arm   | lab-collabora | gcc-10   | multi_v7_defc...=
G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/663b4be37da7bea4534c42ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663b4be37da7bea4534c4=
2eb
        failing since 533 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

