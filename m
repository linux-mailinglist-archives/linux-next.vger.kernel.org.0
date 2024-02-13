Return-Path: <linux-next+bounces-1146-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F6853A99
	for <lists+linux-next@lfdr.de>; Tue, 13 Feb 2024 20:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC186286F8D
	for <lists+linux-next@lfdr.de>; Tue, 13 Feb 2024 19:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BD45FB8F;
	Tue, 13 Feb 2024 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="eJ+aoHON"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9661D69B
	for <linux-next@vger.kernel.org>; Tue, 13 Feb 2024 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707851637; cv=none; b=fIW6mCCOnV6s31+CbYP7Aiz4DraTVZBTBooi7mkUQDSoyjY/lgGGkJkq9PBzip+VzfwPVCxv5fdWucmOBtCGT7BQRMNs8M3BxbuIKOKMzHmp4TI4rH+yH9lm8Aq30ZaALWiMXvaBkf7kdmId3W4ni6IgigQfVadNi3emxSd84i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707851637; c=relaxed/simple;
	bh=xzex4qiFa/ziEVlULFP5Ujbl88FXag+PIFCr0OMrSZ0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=jv3lmPPm3wuHW1PIJxOfS3kOXzOOaDqAEI/a9tHNH2U4VmPJ0wgCWsOj4dnpbsfFapbzET2UZk6MQf2tkKEYHpap5WPG/OxWz9xMb+EOHzMAc2erO9YMLZkX3I+KtINg7Z9sd0LPgqF5ggR2NvDKfxLLr4k0P/iLCJ5PAgEU8Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=eJ+aoHON; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so3551148a12.1
        for <linux-next@vger.kernel.org>; Tue, 13 Feb 2024 11:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707851633; x=1708456433; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M+LBeTNY/OtqF5MjscUfOaDKlIT73uHHNuzebW6Ikzs=;
        b=eJ+aoHON1Cdy+5gGXVDm2DnnTbyzLe82dIjqnKhAdlmIu4fdCcpgHcc8trFu6FuII4
         FdKcbz4ZLXVQKk9xSnrvEPB6iy050cb26zWM7E1t1SKRHbRmwwueNeWebTaun6KQV5Ga
         4wY50cjdSw8bsOj77fm5PcGo4RJFaL/8SgSxEte5lmonod9roN3xsyY6I6Rb8I2YFRue
         XISAE3EQZ7qoodBPX+DYu/ZehoihmeuLgTXjviKG8vToST4eAk/AhTZ30twFckVMY6cK
         jKOKSGQcD3Bz68RLdC65hlGM05H0I3GyXeZlQUpi67rWprufMUAAMCa8A2fa9HJytZq1
         EUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707851633; x=1708456433;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+LBeTNY/OtqF5MjscUfOaDKlIT73uHHNuzebW6Ikzs=;
        b=G/ZzMI7PRndXHngEnozhFWaU8oiOCWf2ejIExqiw0orQ1UHlPUcfUGz/DZiz0t77n3
         twtQADnYZ08UKqvwJyhOiLqMWxxH1Kb041VipMpeiAFmY2Cy+pS3Z7e1GSTxwNIUqsjx
         oQgbCmGlZ5VM4C012/ErmYUta3hugHugYWrSTkDAU+J7ER/A8QSiscALDcJDFHgFNp55
         7RV/c54O/8OQaKxVjbR6snG3dkLPXCiUwpNWALVTvf3v8OTUd7n1GxEM4jfr1QC3Ubhl
         eMIks7nPQww4hHB/VoCAD6oXtCOn8FwjqLvotyRocHAPynywf0QpT+N+7J7qdicRD871
         D6Jg==
X-Gm-Message-State: AOJu0YxtWq0pj9tnkj09KvyFoI5uYRHYrzDKHZkgTJTLGCGuuv5d6FTf
	QS4a2A4bsnD4TpI/hMr1pKN0/LguPhdQiEQLm4mrI0S5eEGsloTWrBvYAWsdyRIKC+Zufcejj4x
	Vib4=
X-Google-Smtp-Source: AGHT+IGbWbBu7PokuN6rTWglZOXItxMVKhbkBjM7CnSeAFtTUW6DU7gJq1ZOBrWSpOsAKkqldIDOlQ==
X-Received: by 2002:a17:90b:4a51:b0:298:b0a4:d5b3 with SMTP id lb17-20020a17090b4a5100b00298b0a4d5b3mr348506pjb.27.1707851632262;
        Tue, 13 Feb 2024 11:13:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0MNV7gO7lPn5RPgkkqp2mhKwmAy3O7arfmDby0UjY3MHBvjX0fGn7u520o12aMff8N/mxfZImpXNZTh5owYHWX3E0KICkPHx9rQgfhMRPqLVe0HM9JZeCFButYhL772WKenE1jnHxZ+4S6wgftsmrNg==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b00298c17e8135sm927421pjb.13.2024.02.13.11.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 11:13:51 -0800 (PST)
Message-ID: <65cbbf6f.170a0220.d18c6.3e27@mx.google.com>
Date: Tue, 13 Feb 2024 11:13:51 -0800 (PST)
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
X-Kernelci-Kernel: next-20240213
X-Kernelci-Report-Type: test
Subject: next/master baseline: 342 runs, 50 regressions (next-20240213)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 342 runs, 50 regressions (next-20240213)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 9          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 6          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240213/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240213
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      46d4e2eb58e14c8935fa0e27d16d4c62ef82849a =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb7f4772a3da6fbb637018

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb7f4772a3da6fbb637=
019
        failing since 377 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb836caa5fdf0d5763714b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb836caa5fdf0d57637=
14c
        failing since 253 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb89995e117649346370c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb89995e11764934637=
0c7
        failing since 321 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb8a547d4d78e76d63704b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb8a547d4d78e76d637=
04c
        failing since 319 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb8393aa5fdf0d57637219

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb8393aa5fdf0d57637=
21a
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb86ed22e5a4bb93637020

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb86ed22e5a4bb93637=
021
        failing since 6 days (last pass: next-20240206, first fail: next-20=
240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cba1bdb92c1bd04f63704e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ve=
rdin-nonwifi-dahlia.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ve=
rdin-nonwifi-dahlia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cba1bdb92c1bd04f637=
04f
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-verdin-nonwifi-dahlia | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cba3c5eac666c2ad637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-verdin-nonwifi-dahl=
ia.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-verdin-nonwifi-dahl=
ia.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cba3c5eac666c2ad637=
013
        new failure (last pass: next-20240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb7f97eb0e50a2496370bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb7f97eb0e50a249637=
0c0
        failing since 672 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 9          =


  Details:     https://kernelci.org/test/plan/id/65cb861d5623c57f8b63701b

  Results:     86 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cb861d5623c57f8b637022
        failing since 62 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-13T15:08:54.021605  / # #
    2024-02-13T15:08:54.124022  export SHELL=3D/bin/sh
    2024-02-13T15:08:54.124785  #
    2024-02-13T15:08:54.226210  / # export SHELL=3D/bin/sh. /lava-428977/en=
vironment
    2024-02-13T15:08:54.226935  =

    2024-02-13T15:08:54.328448  / # . /lava-428977/environment/lava-428977/=
bin/lava-test-runner /lava-428977/1
    2024-02-13T15:08:54.329596  =

    2024-02-13T15:08:54.348895  / # /lava-428977/bin/lava-test-runner /lava=
-428977/1
    2024-02-13T15:08:54.392581  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-13T15:08:54.393014  + <8>[   21.996182] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 428977_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65cb861d5623c57f8b637026
        failing since 62 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-13T15:08:56.499328  /lava-428977/1/../bin/lava-test-case
    2024-02-13T15:08:56.499766  <8>[   24.103488] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-13T15:08:56.500089  /lava-428977/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
cb861d5623c57f8b637028
        failing since 62 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-13T15:08:57.538112  /lava-428977/1/../bin/lava-test-case
    2024-02-13T15:08:57.538540  <8>[   25.142268] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.leds-gpio-probed: https://kernelci.org/test/case/id/65c=
b861d5623c57f8b63702a
        new failure (last pass: next-20240212)

    2024-02-13T15:08:58.608983  /lava-428977/1/../bin/lava-test-case
    2024-02-13T15:08:58.609445  <8>[   26.180176] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dfail>
    2024-02-13T15:08:58.609750  /lava-428977/1/../bin/lava-test-case
    2024-02-13T15:08:58.610014  <8>[   26.197107] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cb861d5623c57f8b63702d
        failing since 62 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-13T15:08:59.634738  /lava-428977/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65cb861d5623c57f8b63702e
        failing since 62 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-13T15:08:59.637917  <8>[   27.256407] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-13T15:09:00.691406  /lava-428977/1/../bin/lava-test-case
    2024-02-13T15:09:00.691845  <8>[   28.277063] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-13T15:09:00.692147  /lava-428977/1/../bin/lava-test-case   =


  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
65cb861d5623c57f8b637066
        new failure (last pass: next-20240212)

    2024-02-13T15:09:02.736357  /lava-428977/1/../bin/lava-test-case
    2024-02-13T15:09:02.736802  <8>[   30.321519] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio1-probed: https://kernelci.org/test/case/i=
d/65cb861d5623c57f8b63706e
        new failure (last pass: next-20240212)

    2024-02-13T15:09:03.890008  /lava-428977/1/../bin/lava-test-case
    2024-02-13T15:09:03.890413  <8>[   31.469639] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-gpio1-probed RESULT=3Dfail>
    2024-02-13T15:09:03.890722  /lava-428977/1/../bin/lava-test-case   =


  * baseline.bootrr.at24-eeprom1-probed: https://kernelci.org/test/case/id/=
65cb861d5623c57f8b637076
        new failure (last pass: next-20240212)

    2024-02-13T15:09:05.055783  /lava-428977/1/../bin/lava-test-case
    2024-02-13T15:09:05.056123  <8>[   32.637351] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dfail>
    2024-02-13T15:09:05.056391  /lava-428977/1/../bin/lava-test-case
    2024-02-13T15:09:05.056625  <8>[   32.656668] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65cb8a7c806033f4ba63705e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cb8a7c806033f4ba637065
        failing since 63 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-13T15:27:40.065792  / # #
    2024-02-13T15:27:40.167966  export SHELL=3D/bin/sh
    2024-02-13T15:27:40.168680  #
    2024-02-13T15:27:40.270207  / # export SHELL=3D/bin/sh. /lava-428997/en=
vironment
    2024-02-13T15:27:40.270937  =

    2024-02-13T15:27:40.372476  / # . /lava-428997/environment/lava-428997/=
bin/lava-test-runner /lava-428997/1
    2024-02-13T15:27:40.373625  =

    2024-02-13T15:27:40.393698  / # /lava-428997/bin/lava-test-runner /lava=
-428997/1
    2024-02-13T15:27:40.436461  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-13T15:27:40.436892  + <8>[   20.758413] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 428997_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65cb8a7c806033f4ba637069
        failing since 63 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-13T15:27:42.542447  /lava-428997/1/../bin/lava-test-case
    2024-02-13T15:27:42.542878  <8>[   22.864937] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-13T15:27:42.543307  /lava-428997/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
cb8a7c806033f4ba63706b
        failing since 63 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-13T15:27:43.599932  /lava-428997/1/../bin/lava-test-case
    2024-02-13T15:27:43.600369  <8>[   23.903713] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-13T15:27:43.600625  /lava-428997/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cb8a7c806033f4ba637070
        failing since 63 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-13T15:27:44.675647  /lava-428997/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65cb8a7c806033f4ba637071
        failing since 63 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-13T15:27:44.678825  <8>[   25.016028] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-13T15:27:45.734033  /lava-428997/1/../bin/lava-test-case
    2024-02-13T15:27:45.734437  <8>[   26.037734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-13T15:27:45.734758  /lava-428997/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65cb85e0461744213d637020

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cb85e0461744213d637027
        failing since 62 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-13T15:07:56.912050  / # #
    2024-02-13T15:07:57.014040  export SHELL=3D/bin/sh
    2024-02-13T15:07:57.014740  #
    2024-02-13T15:07:57.116276  / # export SHELL=3D/bin/sh. /lava-428979/en=
vironment
    2024-02-13T15:07:57.116975  =

    2024-02-13T15:07:57.218250  / # . /lava-428979/environment/lava-428979/=
bin/lava-test-runner /lava-428979/1
    2024-02-13T15:07:57.219394  =

    2024-02-13T15:07:57.238887  / # /lava-428979/bin/lava-test-runner /lava=
-428979/1
    2024-02-13T15:07:57.291993  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-13T15:07:57.292421  + <8>[   21.214232] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 428979_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cb85e0461744213d63703a
        failing since 62 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-13T15:07:59.728203  /lava-428979/1/../bin/lava-test-case
    2024-02-13T15:07:59.728369  <8>[   23.638390] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-13T15:07:59.728517  /lava-428979/1/../bin/lava-test-case
    2024-02-13T15:07:59.728648  <8>[   23.656173] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-13T15:07:59.728775  /lava-428979/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65cb8a7f806033f4ba6370ca

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cb8a7f806033f4ba6370d1
        failing since 63 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-13T15:27:31.366974  / # #
    2024-02-13T15:27:31.468171  export SHELL=3D/bin/sh
    2024-02-13T15:27:31.468783  #
    2024-02-13T15:27:31.569901  / # export SHELL=3D/bin/sh. /lava-429001/en=
vironment
    2024-02-13T15:27:31.570634  =

    2024-02-13T15:27:31.672083  / # . /lava-429001/environment/lava-429001/=
bin/lava-test-runner /lava-429001/1
    2024-02-13T15:27:31.673260  =

    2024-02-13T15:27:31.679047  / # /lava-429001/bin/lava-test-runner /lava=
-429001/1
    2024-02-13T15:27:31.746176  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-13T15:27:31.746733  + <8>[   21.045762] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 429001_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cb8a7f806033f4ba6370e4
        failing since 63 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-13T15:27:34.178996  /lava-429001/1/../bin/lava-test-case
    2024-02-13T15:27:34.179397  <8>[   23.465956] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-13T15:27:34.179714  /lava-429001/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb86641ffb75206c63705a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb86641ffb75206c637=
05b
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb875e9a7a7f7e86637029

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb875e9a7a7f7e86637=
02a
        new failure (last pass: next-20240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb8afd50508542516370a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb8afd5050854251637=
0a9
        new failure (last pass: next-20240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb86e37cc6408c4863705f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb86e37cc6408c48637=
060
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 6          =


  Details:     https://kernelci.org/test/plan/id/65cb7fce70e484c8936370b3

  Results:     161 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-probed: https://kernelci.org/test/case/id/6=
5cb7fce70e484c8936370d0
        failing since 6 days (last pass: next-20240125, first fail: next-20=
240207)

    2024-02-13T14:44:55.179364  /lava-12756385/1/../bin/lava-test-case

    2024-02-13T14:44:55.185121  <8>[   30.688704] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.panel-edp-driver-present: https://kernelci.org/test/cas=
e/id/65cb7fce70e484c893637107
        failing since 6 days (last pass: next-20240125, first fail: next-20=
240207)

    2024-02-13T14:44:49.880008  /lava-12756385/1/../bin/lava-test-case

    2024-02-13T14:44:49.890459  <8>[   25.391308] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.anx7625-probed: https://kernelci.org/test/case/id/65cb7=
fce70e484c89363710c
        failing since 6 days (last pass: next-20240125, first fail: next-20=
240207)

    2024-02-13T14:44:48.761742  /lava-12756385/1/../bin/lava-test-case

    2024-02-13T14:44:48.772517  <8>[   24.273326] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danx7625-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/65cb7=
fce70e484c89363710e
        failing since 6 days (last pass: next-20240125, first fail: next-20=
240207)

    2024-02-13T14:44:47.713429  /lava-12756385/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-mipi-tx-probed: https://kernelci.org/test/case=
/id/65cb7fce70e484c893637110
        failing since 6 days (last pass: next-20240125, first fail: next-20=
240207)

    2024-02-13T14:44:45.641823  <8>[   21.141371] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mipi-tx-driver-present RESULT=3Dpass>

    2024-02-13T14:44:46.660261  /lava-12756385/1/../bin/lava-test-case

    2024-02-13T14:44:46.669947  <8>[   22.171589] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mipi-tx-probed RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cb7fce70e484c89363715f
        failing since 6 days (last pass: next-20240125, first fail: next-20=
240207)

    2024-02-13T14:44:41.344846  + set +x

    2024-02-13T14:44:41.351044  <8>[   16.853248] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 12756385_1.5.2.3.1>

    2024-02-13T14:44:41.455427  / # #

    2024-02-13T14:44:41.556185  export SHELL=3D/bin/sh

    2024-02-13T14:44:41.556425  #

    2024-02-13T14:44:41.656994  / # export SHELL=3D/bin/sh. /lava-12756385/=
environment

    2024-02-13T14:44:41.657191  =


    2024-02-13T14:44:41.757874  / # . /lava-12756385/environment/lava-12756=
385/bin/lava-test-runner /lava-12756385/1

    2024-02-13T14:44:41.758546  =


    2024-02-13T14:44:41.763951  / # /lava-12756385/bin/lava-test-runner /la=
va-12756385/1
 =

    ... (16 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb80d8a318d93b02637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb80d8a318d93b02637=
016
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb84c7ff8e0b54916371eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb84c7ff8e0b5491637=
1ec
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb8604461744213d6370cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb8604461744213d637=
0cc
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb8785b65545d4bc6370ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb8785b65545d4bc637=
0cb
        new failure (last pass: next-20240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb807355dc0d5823637047

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb807355dc0d5823637=
048
        failing since 448 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb7f70b60e7a1c81637054

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb7f70b60e7a1c81637=
055
        failing since 448 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb88308c0011a93163707d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb88308c0011a931637=
07e
        failing since 6 days (last pass: next-20240125, first fail: next-20=
240206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb8b915e4588bea9637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb8b915e4588bea9637=
013
        failing since 10 days (last pass: next-20240125, first fail: next-2=
0240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb86e17cc6408c48637059

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cb86e17cc6408c48637=
05a
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb809bf25c6e37b7637079

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cb809bf25c6e37b7637082
        failing since 257 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-13T14:45:27.525032  =

    2024-02-13T14:45:27.627224  / # #export SHELL=3D/bin/sh
    2024-02-13T14:45:27.628508  =

    2024-02-13T14:45:27.730352  / # export SHELL=3D/bin/sh. /lava-3926772/e=
nvironment
    2024-02-13T14:45:27.731629  =

    2024-02-13T14:45:27.833555  / # . /lava-3926772/environment/lava-392677=
2/bin/lava-test-runner /lava-3926772/1
    2024-02-13T14:45:27.835069  =

    2024-02-13T14:45:27.846495  / # /lava-3926772/bin/lava-test-runner /lav=
a-3926772/1
    2024-02-13T14:45:27.942580  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-13T14:45:27.977436  + cd /lava-3926772/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb896f05b2e0dc4363702a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cb896f05b2e0dc43637033
        failing since 251 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-13T15:23:02.873129  / # #
    2024-02-13T15:23:02.976121  export SHELL=3D/bin/sh
    2024-02-13T15:23:02.976954  #
    2024-02-13T15:23:03.078412  / # export SHELL=3D/bin/sh. /lava-3926907/e=
nvironment
    2024-02-13T15:23:03.079436  =

    2024-02-13T15:23:03.181212  / # . /lava-3926907/environment/lava-392690=
7/bin/lava-test-runner /lava-3926907/1
    2024-02-13T15:23:03.182469  =

    2024-02-13T15:23:03.228297  / # /lava-3926907/bin/lava-test-runner /lav=
a-3926907/1
    2024-02-13T15:23:03.314782  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-13T15:23:03.315710  + cd /lava-3926907/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb8075a7d1e1ae186371ba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cb8075a7d1e1ae186371c3
        failing since 257 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-13T14:44:53.600795  + set +x[   19.773231] <LAVA_SIGNAL_ENDRUN =
0_dmesg 458078_1.5.2.4.1>
    2024-02-13T14:44:53.601133  =

    2024-02-13T14:44:53.709985  / # #
    2024-02-13T14:44:53.811657  export SHELL=3D/bin/sh
    2024-02-13T14:44:53.812289  #
    2024-02-13T14:44:53.913287  / # export SHELL=3D/bin/sh. /lava-458078/en=
vironment
    2024-02-13T14:44:53.913934  =

    2024-02-13T14:44:54.014939  / # . /lava-458078/environment/lava-458078/=
bin/lava-test-runner /lava-458078/1
    2024-02-13T14:44:54.015837  =

    2024-02-13T14:44:54.020361  / # /lava-458078/bin/lava-test-runner /lava=
-458078/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cb897286fda0e9e963702b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cb897286fda0e9e9637034
        failing since 251 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-13T15:23:03.795261  + set +x
    2024-02-13T15:23:03.796902  [   20.233120] <LAVA_SIGNAL_ENDRUN 0_dmesg =
458089_1.5.2.4.1>
    2024-02-13T15:23:03.905090  / # #
    2024-02-13T15:23:04.006785  export SHELL=3D/bin/sh
    2024-02-13T15:23:04.007335  #
    2024-02-13T15:23:04.108275  / # export SHELL=3D/bin/sh. /lava-458089/en=
vironment
    2024-02-13T15:23:04.108811  =

    2024-02-13T15:23:04.209805  / # . /lava-458089/environment/lava-458089/=
bin/lava-test-runner /lava-458089/1
    2024-02-13T15:23:04.210642  =

    2024-02-13T15:23:04.217315  / # /lava-458089/bin/lava-test-runner /lava=
-458089/1 =

    ... (12 line(s) more)  =

 =20

