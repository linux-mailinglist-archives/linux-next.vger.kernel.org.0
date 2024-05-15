Return-Path: <linux-next+bounces-2324-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B78CF8C6D24
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 22:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA84F1C2233E
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 20:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7DA4206F;
	Wed, 15 May 2024 20:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zh3FPuQX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C800315B0E1
	for <linux-next@vger.kernel.org>; Wed, 15 May 2024 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715804387; cv=none; b=NvT6a6qp9VD4bbkBuS0lL0zkrMzx7UIr6w1y0t9tGMteLzf8XAiM+sdELjoj3uOEGUWUc+hcF345vmJL5Yp940zmodaiZpJBFKS9wmE5ZuYr9YFCMBoWMU7af5MezwlCN/BwIz/kCBHuD5xfZpEsfXlGOsYm5Wj4h8LKD1AL6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715804387; c=relaxed/simple;
	bh=LhNul+nUNYPX3Cb7+Bk+xzwY4cggr1wBt9KZpq63S3E=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=qlax3HJLykVqhb6iusyldgPAO53+YpW/RQlZjqblloDAuV4RGkuKLDYwpvHfxrAzg/guGv9Cm9rDD6+lbdUhRn75SGRTiK0qRy3DuqAzhcANmOXQIu6Tx4tYYOBfg2MZmPiSmSmtOeXYy0uCN5YtycfaYfXuDX6z8LXjx9JO6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zh3FPuQX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ed835f3c3cso63460245ad.3
        for <linux-next@vger.kernel.org>; Wed, 15 May 2024 13:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715804384; x=1716409184; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iuc8ggrpE145BTi0ExJEoruSaBhFzZw4MpMORLLUDEQ=;
        b=zh3FPuQX8jL9YB5LEia4UiHxp/fnLmQpNmcwgZr1d0tfCK+vf2REU8O8Bf7TCR+Oir
         PUf/Qk943cmzCEE9sareSS+CLEYeIMzr7nNVY8LJHoIZwm0wsm8j8T/56FBJmLM6dcB1
         ouAaGR9yVh9YvykRbUOKpt7etsVYS2qDT7dBUWkpK04aJojyL8YDKKSQeTpyCduHkkmN
         gQbg2VclPI9HqsCpjSpiV/naSAVWj57/8V/mUtp+hBaTWlelG9AwszzVhTw2j+JMMAPP
         h+KixrYSCA3m+Raq+ptTc8j3T9e4MpOVruNJfZOFR7997ZlXTfjqLn5prnVsNMm3bC26
         43rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715804384; x=1716409184;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuc8ggrpE145BTi0ExJEoruSaBhFzZw4MpMORLLUDEQ=;
        b=FKcUkT+U6mZzNMfJ/HjBasGoLu10waroivZZoppopmLeJb3+g4v46Xs8ITL7hP90zc
         XITSkobr/Fqwc4Dw5UgtqY6PvovDw2CYFlQVv2QpW4spYdlqJYIQkwkUEYCSnfy5n0EW
         c60OnrTtWlih8UMMnYPZj/Kpn9SxynOyLcnqOZ6NA99jBcnaEl0/lQcycxOP7UxyQN8t
         kIND07halrXdcjeapl0OhCQ2EhNlay7T29tdybZEUytSawbYdRyKfaulQEfWoCjErA2W
         yKy2SqEtiFiMonRICwHyn3KLfIOfKLkLqxlYlGZB5o9nyObCIJT13wIh2wSqsgz6F5Oq
         038A==
X-Gm-Message-State: AOJu0YwyFzZZ/i6GvX/9ntKfa4/SsL+nbnAeqCtLA+l9RnBjG72OkzvH
	kpMCgoc3uYzdGur4/Bi6jb966ueo37GJ+xrw7YyPXf6ozv+8ex0FYMuy6XksetnGFtwX7zvwItU
	HusE=
X-Google-Smtp-Source: AGHT+IFCHRGdVNem4JlTPJzPv2dzFg0GKXooVMuSIWFx/tkGSIL4F2seEuT2FgeZ9Wk9sSVPOZIo5w==
X-Received: by 2002:a17:902:eb86:b0:1eb:4a40:c486 with SMTP id d9443c01a7336-1ef43d17f42mr228731005ad.14.1715804383635;
        Wed, 15 May 2024 13:19:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c0362d4sm122373665ad.210.2024.05.15.13.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 13:19:43 -0700 (PDT)
Message-ID: <664518df.170a0220.782de.fbeb@mx.google.com>
Date: Wed, 15 May 2024 13:19:43 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240515
X-Kernelci-Report-Type: test
Subject: next/master baseline: 210 runs, 13 regressions (next-20240515)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 210 runs, 13 regressions (next-20240515)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240515/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240515
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      82d92a9a1b9ea0ea52aff27cddd05009b4edad49 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6644e03cae8f32d98a4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644e03cae8f32d98a4c4=
2db
        new failure (last pass: next-20240507) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6644da60e42d8abaab4c42f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644da60e42d8abaab4c4=
2f7
        failing since 469 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6644de0906a0079eee4c42e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644de0906a0079eee4c4=
2e5
        failing since 345 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6644db886aa496a9c34c435e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644db886aa496a9c34c4=
35f
        failing since 20 days (last pass: next-20240415, first fail: next-2=
0240424) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6644dafb80504bc5144c42ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-verdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644dafb80504bc5144c4=
300
        failing since 21 days (last pass: next-20240415, first fail: next-2=
0240424) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6644e1dedce7a7f1fa4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644e1dedce7a7f1fa4c4=
2db
        failing since 56 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6644e479442ab0ca8f4c42f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644e479442ab0ca8f4c4=
2fa
        failing since 764 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6644ddb8f7f7c4a1114c4302

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644ddb8f7f7c4a1114c4=
303
        failing since 147 days (last pass: next-20231115, first fail: next-=
20231220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6644dbf2e57be405414c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644dbf2e57be405414c4=
2de
        new failure (last pass: next-20240410) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6644dbde5eec0585d94c4462

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644dbde5eec0585d94c4=
463
        new failure (last pass: next-20240410) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6644e12e26135b5bd74c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644e12e26135b5bd74c4=
2db
        new failure (last pass: next-20240513) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6644e575f55562a7234c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644e575f55562a7234c4=
2dc
        failing since 540 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6644e4868ee051f6e44c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240515/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6644e4868ee051f6e44c4=
2db
        failing since 540 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

