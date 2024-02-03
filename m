Return-Path: <linux-next+bounces-973-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952B847E19
	for <lists+linux-next@lfdr.de>; Sat,  3 Feb 2024 02:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE428284398
	for <lists+linux-next@lfdr.de>; Sat,  3 Feb 2024 01:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FF923A7;
	Sat,  3 Feb 2024 01:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="oFE22LU1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40523DE
	for <linux-next@vger.kernel.org>; Sat,  3 Feb 2024 01:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706923053; cv=none; b=KBQyTCkuVpi1KiK5O5DNrl/gwcgCnA50MhA7Gah+mryexIncaWmT2DgIx7ep2nObo7Nd4AM2MqfXOCZZHI4vh+OYZjbkcLXkvv2oZF70eC0gK9eahkG+82jRBiIa8mdmdO0rceXQLMDWm/3i2c0iwnaxX31p/600IBUECBe3Knk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706923053; c=relaxed/simple;
	bh=7bYifOlKM6BMq3WRk+U86/PBJju4rkwc1hCQzrg/xuY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=BUfaIVBwohXlKMJuIqZEhmZ0wpcv5meGoFAycb9Nuej9yimKye/2ExuYp2TlLxr4A0if2/FgGDR1F9PREH4kebPXeYKRLBni4z4DYiLFv2ptgrAOKgd99/DxRW4JmHqnS4TUQ1AkPb9OHBVJqfj00Vs7JAc1j4vGFNYTJKiHr70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=oFE22LU1; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso2423440a12.0
        for <linux-next@vger.kernel.org>; Fri, 02 Feb 2024 17:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706923048; x=1707527848; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xJfNG0cfHbmAEqmzdbNm7rPrrWdWqqupDGSZ6AriMEs=;
        b=oFE22LU16oQFHO3ryhyLesOTW5gNaQF4I68KlQGF0uGBgmA0FwITHV026zaE/XjsMD
         g/ZhUITF8FYQjiIejCx0QeJXiZCiVk2yql6DVrgvt27Gz4ShKj20DVpEW59WoCzcLUjs
         7G1olRQ+F/7/NWoAMrPAzO5k1LeWlr5PQX30wc9vKARx8d+qcbzZswgBGBruywYyK8P3
         yduFnubsZs+DULbfUdjpFlkf8vxnPfBwWZtug5/FuQQw7EHGfr2+ihM0ahLKahbHZSje
         ewrj8c5UEJM1RZbdIO4lOGpmbj0aJQ1w0HcMX2w65RxJGqDyWJ009CVDc7d6i16IplaC
         IM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706923048; x=1707527848;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJfNG0cfHbmAEqmzdbNm7rPrrWdWqqupDGSZ6AriMEs=;
        b=jALKIpa6ewEa2nXfMV/WzqHMqIJU58Lv8JsP/Ejk4/iStRbIs1sOVL/l106yiPiXNn
         Dos28WYVEVkc13efaewXXg+rOJKe5F17jFwsjrnK8s0BDACamU+FnCKMccxo9951LRpG
         /oD9yVTYPvFc92h3wGdWT8emWyZKz5gLFwbrYdcEXFVSALozpzlJ1W7A1UfyQunPlhqq
         rzSJb9gpUoaQy4GVGjigm7bw8+vuZkEkwHIkqtp655A/zqcXZb8G5zpl5GRTZgJKLvxH
         SrbNa+VmPRRUPukXzWVsf5IltBkXxO8nR9mT4W64SjGqHSTHSg9ctC5Ip91FSMEsvHJJ
         j6hA==
X-Gm-Message-State: AOJu0YwH0txmwmhpXpjB0sikFQGCpYHjrFz/TTdEizjPbGFLWqlFr4u5
	WIiOmkJcZ5iuReatlHAOu2troyDwwTm52YZWkUQI3lBqT+/lZ8cN023w+t3QLtWFg2WZ28JAuAW
	o2B48Tw==
X-Google-Smtp-Source: AGHT+IEPrgX9bq8sDyqEBnEnzTO8FrsJ8oTZhYQGKKYdGbNpC6gUmS2RdnnnTEgZ5kpNc5tit6eSbA==
X-Received: by 2002:a17:902:d34d:b0:1d9:5ed4:ec07 with SMTP id l13-20020a170902d34d00b001d95ed4ec07mr3957309plk.52.1706923047246;
        Fri, 02 Feb 2024 17:17:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVmfJKGOjii2/X7saUXCmNvJF6+fWix9IapC1861y0XgfYNAFazYDyAzXV0DA7d7G9mny6+IcejX+1mJ3UYf6UC4gaBEXhpCXYrhd/ZK4KTUdtkQ3vnJ48XPE6cQTF5npZlcAfzaT7VCIvQWqeimdE5RA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id kh3-20020a170903064300b001d8cbdb2a9asm2212318plb.298.2024.02.02.17.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 17:17:26 -0800 (PST)
Message-ID: <65bd9426.170a0220.90616.9a66@mx.google.com>
Date: Fri, 02 Feb 2024 17:17:26 -0800 (PST)
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
X-Kernelci-Kernel: next-20240202
X-Kernelci-Report-Type: test
Subject: next/master baseline: 468 runs, 59 regressions (next-20240202)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 468 runs, 59 regressions (next-20240202)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 6          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 6          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_riscv64                 | riscv | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_riscv64                 | riscv | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =

qemu_riscv64                 | riscv | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

rk3399-roc-pc                | arm64 | lab-broonie   | gcc-10   | defconfig=
+videodec           | 1          =

rk3399-roc-pc                | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240202/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240202
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      076d56d74f17e625b3d63cf4743b3d7d02180379 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5f2eb32be80d5500a07e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5f2eb32be80d5500a=
07f
        new failure (last pass: next-20240125) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd60868b7672318100a03b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd60868b7672318100a=
03c
        new failure (last pass: next-20240201) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5da3092ad6024800a054

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5da3092ad6024800a=
055
        failing since 366 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5bd5606a01d25100a081

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5bd5606a01d25100a=
082
        failing since 242 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5454229b427f1500a09d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5454229b427f1500a=
09e
        failing since 311 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5518ccbb92795c00a044

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5518ccbb92795c00a=
045
        failing since 308 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5824dd652a1ac000a054

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5824dd652a1ac000a=
055
        failing since 8 days (last pass: next-20240124, first fail: next-20=
240125) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65bd5458229b427f1500a0ab

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65bd54582=
29b427f1500a0b8
        new failure (last pass: next-20240201)

    2024-02-02T20:44:56.688163  /lava-536535/1/../bin/lava-test-case
    2024-02-02T20:44:56.712573  <8>[   24.035317] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
bd5458229b427f1500a0b9
        new failure (last pass: next-20240201)

    2024-02-02T20:44:55.639290  /lava-536535/1/../bin/lava-test-case
    2024-02-02T20:44:55.665285  <8>[   22.986443] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5d319d61a833e000a09f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5d319d61a833e000a=
0a0
        failing since 662 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5b4b79db39a15c00a0b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5b4b79db39a15c00a=
0b1
        new failure (last pass: next-20240201) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65bd5a0eadee95a85500a03a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5a0eadee95a85500a041
        failing since 52 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-02T21:09:20.505222  / # #
    2024-02-02T21:09:20.606088  export SHELL=3D/bin/sh
    2024-02-02T21:09:20.606424  #
    2024-02-02T21:09:20.707222  / # export SHELL=3D/bin/sh. /lava-425519/en=
vironment
    2024-02-02T21:09:20.708008  =

    2024-02-02T21:09:20.809253  / # . /lava-425519/environment/lava-425519/=
bin/lava-test-runner /lava-425519/1
    2024-02-02T21:09:20.810255  =

    2024-02-02T21:09:20.816737  / # /lava-425519/bin/lava-test-runner /lava=
-425519/1
    2024-02-02T21:09:20.872911  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-02T21:09:20.873357  + <8>[   20.543947] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 425519_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65bd5a0eadee95a85500a045
        failing since 52 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-02T21:09:22.946180  /lava-425519/1/../bin/lava-test-case
    2024-02-02T21:09:22.980771  <8>[   22.654130] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-02T21:09:22.980932  /lava-425519/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
bd5a0eadee95a85500a047
        failing since 52 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-02T21:09:24.040270  /lava-425519/1/../bin/lava-test-case
    2024-02-02T21:09:24.040785  <8>[   23.692765] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-02T21:09:24.041178  /lava-425519/1/../bin/lava-test-case
    2024-02-02T21:09:24.041483  <8>[   23.709997] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bd5a0eadee95a85500a04c
        failing since 52 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-02T21:09:24.097956  <8>[   23.783861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-02T21:09:25.117660  /lava-425519/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65bd5a0eadee95a85500a04d
        failing since 52 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-02T21:09:25.120793  <8>[   24.806962] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-02T21:09:26.179098  /lava-425519/1/../bin/lava-test-case
    2024-02-02T21:09:26.179229  <8>[   25.828700] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-02T21:09:26.179298  /lava-425519/1/../bin/lava-test-case
    2024-02-02T21:09:26.179357  <8>[   25.846406] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-02T21:09:26.179413  /lava-425519/1/../bin/lava-test-case
    2024-02-02T21:09:26.179467  <8>[   25.865652] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-02-02T21:09:26.179521  /lava-425519/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65bd5aaf200d9d56d400a0d2

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5aaf200d9d56d400a0d9
        failing since 51 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-02T21:11:44.401107  / # #
    2024-02-02T21:11:44.503259  export SHELL=3D/bin/sh
    2024-02-02T21:11:44.503975  #
    2024-02-02T21:11:44.605544  / # export SHELL=3D/bin/sh. /lava-425526/en=
vironment
    2024-02-02T21:11:44.606306  =

    2024-02-02T21:11:44.707697  / # . /lava-425526/environment/lava-425526/=
bin/lava-test-runner /lava-425526/1
    2024-02-02T21:11:44.708850  =

    2024-02-02T21:11:44.713223  / # /lava-425526/bin/lava-test-runner /lava=
-425526/1
    2024-02-02T21:11:44.771509  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-02T21:11:44.771935  + <8>[   20.561753] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 425526_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65bd5aaf200d9d56d400a0dd
        failing since 51 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-02T21:11:46.878940  /lava-425526/1/../bin/lava-test-case
    2024-02-02T21:11:46.879369  <8>[   22.669903] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-02T21:11:46.879804  /lava-425526/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
bd5aaf200d9d56d400a0df
        failing since 51 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-02T21:11:47.938352  /lava-425526/1/../bin/lava-test-case
    2024-02-02T21:11:47.938845  <8>[   23.708614] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-02T21:11:47.939150  /lava-425526/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bd5aaf200d9d56d400a0e4
        failing since 51 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-02T21:11:49.014650  /lava-425526/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65bd5aaf200d9d56d400a0e5
        failing since 51 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-02T21:11:49.018003  <8>[   24.822820] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-02T21:11:50.077681  /lava-425526/1/../bin/lava-test-case
    2024-02-02T21:11:50.078195  <8>[   25.844397] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-02T21:11:50.078496  /lava-425526/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65bd5a0c1a7584144d00a04c

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5a0c1a7584144d00a053
        failing since 52 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-02T21:09:14.382787  / # #
    2024-02-02T21:09:14.484742  export SHELL=3D/bin/sh
    2024-02-02T21:09:14.485385  #
    2024-02-02T21:09:14.586445  / # export SHELL=3D/bin/sh. /lava-425517/en=
vironment
    2024-02-02T21:09:14.587058  =

    2024-02-02T21:09:14.688300  / # . /lava-425517/environment/lava-425517/=
bin/lava-test-runner /lava-425517/1
    2024-02-02T21:09:14.689517  =

    2024-02-02T21:09:14.734021  / # /lava-425517/bin/lava-test-runner /lava=
-425517/1
    2024-02-02T21:09:14.761581  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-02T21:09:14.762001  + <8>[   20.909686] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 425517_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bd5a0c1a7584144d00a066
        failing since 52 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-02T21:09:17.196726  /lava-425517/1/../bin/lava-test-case
    2024-02-02T21:09:17.197183  <8>[   23.335797] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-02T21:09:17.197492  /lava-425517/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65bd5aac200d9d56d400a068

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5aac200d9d56d400a06f
        failing since 51 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-02T21:11:50.755662  / # #
    2024-02-02T21:11:50.857645  export SHELL=3D/bin/sh
    2024-02-02T21:11:50.858383  #
    2024-02-02T21:11:50.959786  / # export SHELL=3D/bin/sh. /lava-425524/en=
vironment
    2024-02-02T21:11:50.960498  =

    2024-02-02T21:11:51.062037  / # . /lava-425524/environment/lava-425524/=
bin/lava-test-runner /lava-425524/1
    2024-02-02T21:11:51.063235  =

    2024-02-02T21:11:51.082706  / # /lava-425524/bin/lava-test-runner /lava=
-425524/1
    2024-02-02T21:11:51.135420  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-02T21:11:51.135771  + <8>[   20.753340] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 425524_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bd5aac200d9d56d400a082
        failing since 51 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-02T21:11:53.570906  /lava-425524/1/../bin/lava-test-case
    2024-02-02T21:11:53.571358  <8>[   23.175554] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-02T21:11:53.571715  /lava-425524/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 6          =


  Details:     https://kernelci.org/test/plan/id/65bd5e688f6506b03e00a048

  Results:     45 PASS, 8 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65bd5e688f6506b=
03e00a04b
        new failure (last pass: next-20240125)
        2 lines

    2024-02-02T21:27:45.157635  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-02-02T21:27:45.196040  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-02-02T21:27:45.196447  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2024-02-02T21:27:45.197002  kern  :alert : Data abor<8>[   45.361453] <=
LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASU=
REMENT=3D2>
    2024-02-02T21:27:45.197327  t info:
    2024-02-02T21:27:45.197580  kern  :alert<8>[   45.370519] <LAVA_SIGNAL_=
ENDRUN 0_dmesg 3918857_1.5.2.4.1>
    2024-02-02T21:27:45.197816   :   ISV =3D 0, ISS =3D 0x00000006, ISS2 =
=3D 0x00000000
    2024-02-02T21:27:45.198093  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-02-02T21:27:45.198331  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65bd5e688f6506b=
03e00a04c
        new failure (last pass: next-20240125)
        13 lines =


  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65bd5e688=
f6506b03e00a04f
        new failure (last pass: next-20240125)

    2024-02-02T21:27:51.235391  <3>[   51.415928] mmc0: error -84 whilst in=
itialising SD card
    2024-02-02T21:27:51.839332  /lava-3918857/1/../bin/lava-test-case
    2024-02-02T21:27:51.840227  <8>[   52.007055] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2024-02-02T21:27:51.840616  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
bd5e688f6506b03e00a050
        new failure (last pass: next-20240125)

    2024-02-02T21:27:50.783179  /lava-3918857/1/../bin/lava-test-case
    2024-02-02T21:27:50.806070  <8>[   50.986149] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =


  * baseline.bootrr.dw-hdmi-i2s-audio-driver-present: https://kernelci.org/=
test/case/id/65bd5e688f6506b03e00a058
        new failure (last pass: next-20240125)

    2024-02-02T21:27:48.586256  /lava-3918857/1/../bin/lava-test-case
    2024-02-02T21:27:48.589511  <8>[   48.767906] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddw-hdmi-i2s-audio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5e688f6506b03e00a080
        new failure (last pass: next-20240125)

    2024-02-02T21:27:45.237550  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000000e390000
    2024-02-02T21:27:45.238153  kern  :alert : [00000000000000c8] pgd=3D080=
000000e391003, p4d=3D080000000e391003, pud=3D080000000e392003, pmd=3D000000=
0000000000
    2024-02-02T21:27:45.238458  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2024-02-02T21:27:45.239167  kern  :emerg : Code: d503233f a9bf7bfd 9100=
03fd f9403c00 (f9406400) =

    2024-02-02T21:27:45.239642  + set +x
    2024-02-02T21:27:45.345046  =

    2024-02-02T21:27:45.446502  / # #export SHELL=3D/bin/sh
    2024-02-02T21:27:45.447241  =

    2024-02-02T21:27:45.548486  / # export SHELL=3D/bin/sh. /lava-3918857/e=
nvironment
    2024-02-02T21:27:45.549195   =

    ... (15 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 6          =


  Details:     https://kernelci.org/test/plan/id/65bd637776367d290e00a051

  Results:     161 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-probed: https://kernelci.org/test/case/id/6=
5bd637776367d290e00a06e
        new failure (last pass: next-20240118)

    2024-02-02T21:49:23.240552  /lava-12692857/1/../bin/lava-test-case

    2024-02-02T21:49:23.250346  <8>[   30.604067] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.panel-edp-driver-present: https://kernelci.org/test/cas=
e/id/65bd637776367d290e00a0a5
        new failure (last pass: next-20240118)

    2024-02-02T21:49:17.964835  /lava-12692857/1/../bin/lava-test-case

    2024-02-02T21:49:17.974402  <8>[   25.328757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.anx7625-probed: https://kernelci.org/test/case/id/65bd6=
37776367d290e00a0aa
        new failure (last pass: next-20240118)

    2024-02-02T21:49:16.848487  /lava-12692857/1/../bin/lava-test-case

    2024-02-02T21:49:16.855598  <8>[   24.212053] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danx7625-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/65bd6=
37776367d290e00a0ac
        new failure (last pass: next-20240118)

    2024-02-02T21:49:15.799643  /lava-12692857/1/../bin/lava-test-case

    2024-02-02T21:49:15.809495  <8>[   23.163914] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mipi-tx-probed: https://kernelci.org/test/case=
/id/65bd637776367d290e00a0ae
        new failure (last pass: next-20240118)

    2024-02-02T21:49:13.733776  <8>[   21.086322] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mipi-tx-driver-present RESULT=3Dpass>

    2024-02-02T21:49:14.750215  /lava-12692857/1/../bin/lava-test-case

    2024-02-02T21:49:14.760457  <8>[   22.114658] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mipi-tx-probed RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd637776367d290e00a0fd
        new failure (last pass: next-20240118)

    2024-02-02T21:49:09.443636  + set +x

    2024-02-02T21:49:09.447085  <8>[   16.804535] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 12692857_1.5.2.3.1>

    2024-02-02T21:49:09.553121  / # #

    2024-02-02T21:49:09.653824  export SHELL=3D/bin/sh

    2024-02-02T21:49:09.654009  #

    2024-02-02T21:49:09.754525  / # export SHELL=3D/bin/sh. /lava-12692857/=
environment

    2024-02-02T21:49:09.754689  =


    2024-02-02T21:49:09.855233  / # . /lava-12692857/environment/lava-12692=
857/bin/lava-test-runner /lava-12692857/1

    2024-02-02T21:49:09.855556  =


    2024-02-02T21:49:09.861844  / # /lava-12692857/bin/lava-test-runner /la=
va-12692857/1
 =

    ... (16 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd63a61ce43f3de700a063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd63a61ce43f3de700a=
064
        new failure (last pass: next-20240118) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_riscv64                 | riscv | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd587eb13352162800a06a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd587eb13352162800a=
06b
        new failure (last pass: next-20240201) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_riscv64                 | riscv | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd58cbf67f64f22a00a049

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd58cbf67f64f22a00a=
04a
        new failure (last pass: next-20240201) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_riscv64                 | riscv | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5846b13352162800a039

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5846b13352162800a=
03a
        new failure (last pass: next-20240201) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_smp8_riscv64            | riscv | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd586bb13352162800a049

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd586bb13352162800a=
04a
        new failure (last pass: next-20240201) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd58b6f67f64f22a00a03b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd58b6f67f64f22a00a=
03c
        new failure (last pass: next-20240201) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_smp8_riscv64            | riscv | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd583f04499e8f1f00a07e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd583f04499e8f1f00a=
07f
        new failure (last pass: next-20240201) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5a019243ed4bf100a04c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5a019243ed4bf100a055
        failing since 178 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-02-02T21:08:55.886752  + set +x
    2024-02-02T21:08:55.889912  <8>[   28.456210] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1086879_1.5.2.4.1>
    2024-02-02T21:08:55.996009  / # #
    2024-02-02T21:08:57.453391  export SHELL=3D/bin/sh
    2024-02-02T21:08:57.474272  #
    2024-02-02T21:08:57.474683  / # export SHELL=3D/bin/sh
    2024-02-02T21:08:59.423819  / # . /lava-1086879/environment
    2024-02-02T21:09:03.009596  /lava-1086879/bin/lava-test-runner /lava-10=
86879/1
    2024-02-02T21:09:03.030636  . /lava-1086879/environment
    2024-02-02T21:09:03.030932  / # /lava-1086879/bin/lava-test-runner /lav=
a-1086879/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5e418f6506b03e00a039

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5e418f6506b03e00a=
03a
        failing since 437 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5d3d9d61a833e000a0a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5d3d9d61a833e000a=
0a4
        failing since 437 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5ef65863bee75500a03c

  Results:     65 PASS, 5 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
65bd5ef65863bee75500a07d
        new failure (last pass: next-20240201)

    2024-02-02T21:37:44.051572  /lava-12692794/1/../bin/lava-test-case

    2024-02-02T21:37:44.059534  <8>[   24.158750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie   | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd723f8452919d8e00a039

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd723f8452919d8e00a=
03a
        new failure (last pass: next-20240125) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd75bc4b1e80ac9600a03e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd75bc4b1e80ac9600a=
03f
        failing since 3 days (last pass: next-20240118, first fail: next-20=
240130) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5acaefeec52e1700a04a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bd5acaefeec52e1700a=
04b
        failing since 1 day (last pass: next-20240125, first fail: next-202=
40201) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5428c4959094f600a044

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5428c4959094f600a04d
        failing since 240 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-02T20:44:09.928247  <8>[   13.939420] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3918644_1.5.2.4.1>
    2024-02-02T20:44:10.036509  / # #
    2024-02-02T20:44:10.139728  export SHELL=3D/bin/sh
    2024-02-02T20:44:10.140876  #
    2024-02-02T20:44:10.242666  / # export SHELL=3D/bin/sh. /lava-3918644/e=
nvironment
    2024-02-02T20:44:10.243942  =

    2024-02-02T20:44:10.345943  / # . /lava-3918644/environment/lava-391864=
4/bin/lava-test-runner /lava-3918644/1
    2024-02-02T20:44:10.347851  =

    2024-02-02T20:44:10.359224  / # /lava-3918644/bin/lava-test-runner /lav=
a-3918644/1
    2024-02-02T20:44:10.481685  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5e1be47cc679d900a178

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5e1be47cc679d900a181
        failing since 240 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-02T21:26:27.689599  / # #
    2024-02-02T21:26:27.791365  export SHELL=3D/bin/sh
    2024-02-02T21:26:27.791736  #
    2024-02-02T21:26:27.892527  / # export SHELL=3D/bin/sh. /lava-3918914/e=
nvironment
    2024-02-02T21:26:27.893371  =

    2024-02-02T21:26:27.994724  / # . /lava-3918914/environment/lava-391891=
4/bin/lava-test-runner /lava-3918914/1
    2024-02-02T21:26:27.995302  =

    2024-02-02T21:26:28.012370  / # /lava-3918914/bin/lava-test-runner /lav=
a-3918914/1
    2024-02-02T21:26:28.132401  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-02T21:26:28.133467  + cd /lava-3918914/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5ee15d3a7868d800a049

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5ee15d3a7868d800a052
        failing since 240 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-02T21:29:55.444342  / # #
    2024-02-02T21:29:55.547184  export SHELL=3D/bin/sh
    2024-02-02T21:29:55.547781  #
    2024-02-02T21:29:55.648855  / # export SHELL=3D/bin/sh. /lava-3918924/e=
nvironment
    2024-02-02T21:29:55.649210  =

    2024-02-02T21:29:55.749955  / # . /lava-3918924/environment/lava-391892=
4/bin/lava-test-runner /lava-3918924/1
    2024-02-02T21:29:55.750711  =

    2024-02-02T21:29:55.769943  / # /lava-3918924/bin/lava-test-runner /lav=
a-3918924/1
    2024-02-02T21:29:55.881970  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-02T21:29:55.883138  + cd /lava-3918924/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd54395336cb8d4f00a03d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd54395336cb8d4f00a046
        failing since 240 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-02T20:44:23.050376  + set +x[   20.690224] <LAVA_SIGNAL_ENDRUN =
0_dmesg 456474_1.5.2.4.1>
    2024-02-02T20:44:23.050687  =

    2024-02-02T20:44:23.158386  / # #
    2024-02-02T20:44:23.259897  export SHELL=3D/bin/sh
    2024-02-02T20:44:23.260411  #
    2024-02-02T20:44:23.361384  / # export SHELL=3D/bin/sh. /lava-456474/en=
vironment
    2024-02-02T20:44:23.362024  =

    2024-02-02T20:44:23.463035  / # . /lava-456474/environment/lava-456474/=
bin/lava-test-runner /lava-456474/1
    2024-02-02T20:44:23.463895  =

    2024-02-02T20:44:23.466735  / # /lava-456474/bin/lava-test-runner /lava=
-456474/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5eda5d3a7868d800a039

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5eda5d3a7868d800a042
        failing since 240 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-02T21:29:42.671746  + set +x[   19.502975] <LAVA_SIGNAL_ENDRUN =
0_dmesg 456499_1.5.2.4.1>
    2024-02-02T21:29:42.672054  =

    2024-02-02T21:29:42.779409  / # #
    2024-02-02T21:29:42.880930  export SHELL=3D/bin/sh
    2024-02-02T21:29:42.881461  #
    2024-02-02T21:29:42.982437  / # export SHELL=3D/bin/sh. /lava-456499/en=
vironment
    2024-02-02T21:29:42.982960  =

    2024-02-02T21:29:43.083932  / # . /lava-456499/environment/lava-456499/=
bin/lava-test-runner /lava-456499/1
    2024-02-02T21:29:43.084796  =

    2024-02-02T21:29:43.089481  / # /lava-456499/bin/lava-test-runner /lava=
-456499/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd5f52ee6a08cd4500a03a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd5f52ee6a08cd4500a043
        failing since 240 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-02T21:31:26.248375  + set +x
    2024-02-02T21:31:26.250137  [   23.076432] <LAVA_SIGNAL_ENDRUN 0_dmesg =
456502_1.5.2.4.1>
    2024-02-02T21:31:26.358222  / # #
    2024-02-02T21:31:26.459825  export SHELL=3D/bin/sh
    2024-02-02T21:31:26.460410  #
    2024-02-02T21:31:26.561162  / # export SHELL=3D/bin/sh. /lava-456502/en=
vironment
    2024-02-02T21:31:26.561721  =

    2024-02-02T21:31:26.662556  / # . /lava-456502/environment/lava-456502/=
bin/lava-test-runner /lava-456502/1
    2024-02-02T21:31:26.663347  =

    2024-02-02T21:31:26.665811  / # /lava-456502/bin/lava-test-runner /lava=
-456502/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd534331d4e4cbd000a059

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd534331d4e4cbd000a062
        failing since 53 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-02T20:40:08.889301  + set +x<8>[    9.863423] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3918634_1.5.2.4.1>
    2024-02-02T20:40:08.889519  =

    2024-02-02T20:40:08.993670  / # #
    2024-02-02T20:40:09.094760  export SHELL=3D/bin/sh
    2024-02-02T20:40:09.095153  #
    2024-02-02T20:40:09.195950  / # export SHELL=3D/bin/sh. /lava-3918634/e=
nvironment
    2024-02-02T20:40:09.196362  =

    2024-02-02T20:40:09.297181  / # . /lava-3918634/environment/lava-391863=
4/bin/lava-test-runner /lava-3918634/1
    2024-02-02T20:40:09.297831  =

    2024-02-02T20:40:09.304107  / # /lava-3918634/bin/lava-test-runner /lav=
a-3918634/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65bd532e31d4e4cbd000a042

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240202/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240202/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bd532e31d4e4cbd000a04b
        failing since 50 days (last pass: next-20231213, first fail: next-2=
0231214)

    2024-02-02T20:40:00.611970  + set +x
    2024-02-02T20:40:00.614391  <8>[    9.726344] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3918631_1.5.2.4.1>
    2024-02-02T20:40:00.718815  / # #
    2024-02-02T20:40:00.819969  export SHELL=3D/bin/sh
    2024-02-02T20:40:00.820335  #
    2024-02-02T20:40:00.921125  / # export SHELL=3D/bin/sh. /lava-3918631/e=
nvironment
    2024-02-02T20:40:00.921482  =

    2024-02-02T20:40:01.022295  / # . /lava-3918631/environment/lava-391863=
1/bin/lava-test-runner /lava-3918631/1
    2024-02-02T20:40:01.022886  =

    2024-02-02T20:40:01.065177  / # /lava-3918631/bin/lava-test-runner /lav=
a-3918631/1 =

    ... (12 line(s) more)  =

 =20

