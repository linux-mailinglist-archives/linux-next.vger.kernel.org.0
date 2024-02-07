Return-Path: <linux-next+bounces-1053-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D15D784C670
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 09:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE78C1F23094
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 08:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7942221107;
	Wed,  7 Feb 2024 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Ar9OfnkH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47DE208D3
	for <linux-next@vger.kernel.org>; Wed,  7 Feb 2024 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707295362; cv=none; b=m0Q7xZoJUbSIjXzNq38WdDII1qyl53HRoA3goo8pSKBGdSRii2JFHqvknM1Gs39UTUt53AYwcquqXf9HWA5XV3DHbsl5fXkxEABtgjz7T19FEE3akqQjolNKZC0986Py7CE9IX4otu5C6QE8gKz92FKVtwVNvqF/PYUdC5GcNdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707295362; c=relaxed/simple;
	bh=CkSOjdx30K17N/Vb7FSssjnhOeUsE5iHLDYzZMdmVHs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=DcbWUSkrgvuTMvMxjE5QNe4euIJq3Q2pFf3BfrY154xH/ItbkrulBjCkC8MoHAsPw0dpVa0ipApxrmGxhIg2y9EFZUZUGTI8KqD2dzMoKhzyw0o6eORsSZ/32oah71kX/FtBQzdq64KPAyU9Az8wG9V4+F0BFH/abHPyrdmBbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Ar9OfnkH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d93edfa76dso3483315ad.1
        for <linux-next@vger.kernel.org>; Wed, 07 Feb 2024 00:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707295357; x=1707900157; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wjslPPLVYjl2F8gPBmABKx5hxKbD3gjqg+WT1AJHM6Y=;
        b=Ar9OfnkHm8peEY9VWx4O0LPPZXnwVPaFnlVOYEBr2QcjpBSppMw146vEUTiz0Cj2hs
         vTtq2AkF+P5Ugw4Sp0BXqm+81PSxvgHrTQmgrlKr0M+B2z7CoSko68LC8JLmaCTi9lT2
         Pj/kg5stkCFyTIJiIdncVahmaw2YvHYJ8SBaUffmkWTdxgF2eJEAuv/kFpMbZjsiowmb
         FmpVJjwxQdwE9fDHYXHI92DF0l5Owk3o2APd7lqq2eMPCjNoXIGsO+2J3C06jgdtiDau
         rVjJ9TRqjdcRmXvX3g/txHBVTHys8Jcvz+5pNfgrKWDqxtqQlaY+4tyApkWq3dShKPmn
         VHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707295357; x=1707900157;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjslPPLVYjl2F8gPBmABKx5hxKbD3gjqg+WT1AJHM6Y=;
        b=QY50nynZgKSIbFVW7mB41t11zG84trMAcs8XE7dNUVdSNzTl8ZCxRWuiFCPxQBKXse
         p+yBDkvm00r6Kv87SjzAhkpJUADNq3rV3jXeUVlLwtWTX2MTVTRmhrspt+qTRxxcwhTm
         E+jYA5t3ErFz1wpSqub7k4EBk2OgjLCT5lEXcKpJAklOi43DfxMI0XKHdz9+YAd5PhvK
         UWY2OkTgDNvskMaD8Jl/t0Zi/iqSXwOa+6LvYWVSetVrLgK6M5L16PaJal2TQdd7JE3x
         QpW4/7Cu4XwYOIwmJqPGT0+g0RlTb7hwRin0oCN9dkNuctWeLAb3HeSG6jgcnxs5dZJk
         HYqQ==
X-Gm-Message-State: AOJu0YzNdxFu8l/pPYSzaLfMKDqni83IBG9sR8muwRHySScht/I1sIBM
	MYU8ZNRyl252leZrW0KWmbfFBt+YAdlP76egLYtdZposuE1/NEbu5/WkAbb8XWMP9LyTVtgFitN
	p
X-Google-Smtp-Source: AGHT+IG8Vc7OFWsT1E9hDMefwt+1+qk9fn5OPMAmzSzCy5GBv0OLST413po5f5mqogXmgIHJoF24/w==
X-Received: by 2002:a17:90b:4d92:b0:293:ed23:c2da with SMTP id oj18-20020a17090b4d9200b00293ed23c2damr2094630pjb.31.1707295357153;
        Wed, 07 Feb 2024 00:42:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUaIqcA/WwziDrUEL96rd0JQCW4T04D2XGVDoNEhGmGMASQGTF/2taq8WFXpkGo1PVmeaZy9P39gwYRXHMz0Ga5goGFjbY4zwEdFpWt80jPvcgwISIKFVZSnEbXHyOYlQitUeNmNoaCVHATfu5UAG3OA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902d08300b001d76f1e8a18sm871659plv.181.2024.02.07.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 00:42:36 -0800 (PST)
Message-ID: <65c3427c.170a0220.f746a.1ff7@mx.google.com>
Date: Wed, 07 Feb 2024 00:42:36 -0800 (PST)
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
X-Kernelci-Kernel: next-20240206
Subject: next/master baseline: 420 runs, 41 regressions (next-20240206)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 420 runs, 41 regressions (next-20240206)

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

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+videodec           | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig                    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 6          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240206/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240206
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ac139fc7db67968e5061715508b5fc4aa7c40c56 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30357ea9b2a16ca8e1e95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c30357ea9b2a16ca8e1=
e96
        failing since 371 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30b3f859d19c2a58e1e85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c30b3f859d19c2a58e1=
e86
        failing since 246 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30e9851b19250d88e1ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c30e9851b19250d88e1=
ec9
        failing since 315 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30f68ddf0feb13f8e1ef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c30f68ddf0feb13f8e1=
ef4
        failing since 312 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c307f0327d3874ab8e1e7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c307f0327d3874ab8e1=
e7d
        failing since 12 days (last pass: next-20240124, first fail: next-2=
0240125) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3121398259783038e1f1a

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65c3121398259783=
038e1f4e
        new failure (last pass: next-20240202)
        1 lines

    2024-02-07T05:15:30.705306  / # =

    2024-02-07T05:15:30.711569  =

    2024-02-07T05:15:30.814878  / # #
    2024-02-07T05:15:30.820801  #
    2024-02-07T05:15:30.921995  / # export SHELL=3D/bin/sh
    2024-02-07T05:15:30.927896  export SHELL=3D/bin/sh
    2024-02-07T05:15:31.028854  / # . /lava-1089817/environment
    2024-02-07T05:15:31.034908  . /lava-1089817/environment
    2024-02-07T05:15:31.135942  / # /lava-1089817/bin/lava-test-runner /lav=
a-1089817/0
    2024-02-07T05:15:31.140846  /lava-1089817/bin/lava-test-runner /lava-10=
89817/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3067bc01e4a41cb8e1efa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3067bc01e4a41cb8e1=
efb
        new failure (last pass: next-20240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3077fb2078787d78e1ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3077fb2078787d78e1=
ebe
        new failure (last pass: next-20240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30ba3b16141026b8e1ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c30ba3b16141026b8e1=
ed3
        failing since 666 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65c306ab996c5494a58e1e7a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c306ab996c5494a58e1e7d
        failing since 56 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T04:27:03.268186  / # #
    2024-02-07T04:27:03.368842  export SHELL=3D/bin/sh
    2024-02-07T04:27:03.369111  #
    2024-02-07T04:27:03.469633  / # export SHELL=3D/bin/sh. /lava-426671/en=
vironment
    2024-02-07T04:27:03.469906  =

    2024-02-07T04:27:03.570396  / # . /lava-426671/environment/lava-426671/=
bin/lava-test-runner /lava-426671/1
    2024-02-07T04:27:03.570747  =

    2024-02-07T04:27:03.582012  / # /lava-426671/bin/lava-test-runner /lava=
-426671/1
    2024-02-07T04:27:03.625996  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T04:27:03.638485  + <8>[   20.723146] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 426671_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c306ab996c5494a58e1e81
        failing since 56 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T04:27:05.738437  /lava-426671/1/../bin/lava-test-case
    2024-02-07T04:27:05.738574  <8>[   22.829609] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-07T04:27:05.738641  /lava-426671/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c306ab996c5494a58e1e83
        failing since 56 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T04:27:06.796763  /lava-426671/1/../bin/lava-test-case
    2024-02-07T04:27:06.796905  <8>[   23.868160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c306ab996c5494a58e1e88
        failing since 56 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T04:27:07.871980  /lava-426671/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c306ab996c5494a58e1e89
        failing since 56 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T04:27:07.875063  <8>[   24.979469] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-07T04:27:08.933869  /lava-426671/1/../bin/lava-test-case
    2024-02-07T04:27:08.934033  <8>[   26.001139] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-07T04:27:08.934164  /lava-426671/1/../bin/lava-test-case
    2024-02-07T04:27:08.934290  <8>[   26.018969] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-07T04:27:08.934413  /lava-426671/1/../bin/lava-test-case
    2024-02-07T04:27:08.934525  <8>[   26.038272] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-02-07T04:27:08.934634  /lava-426671/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65c3067003546f8d168e1e79

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c3067003546f8d168e1e7c
        failing since 56 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T04:26:01.828834  / # #
    2024-02-07T04:26:01.930219  export SHELL=3D/bin/sh
    2024-02-07T04:26:01.930987  #
    2024-02-07T04:26:02.032231  / # export SHELL=3D/bin/sh. /lava-426667/en=
vironment
    2024-02-07T04:26:02.032933  =

    2024-02-07T04:26:02.134179  / # . /lava-426667/environment/lava-426667/=
bin/lava-test-runner /lava-426667/1
    2024-02-07T04:26:02.135331  =

    2024-02-07T04:26:02.141593  / # /lava-426667/bin/lava-test-runner /lava=
-426667/1
    2024-02-07T04:26:02.208620  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T04:26:02.209046  + <8>[   20.875995] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 426667_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c3067003546f8d168e1e8f
        failing since 56 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T04:26:04.644834  /lava-426667/1/../bin/lava-test-case
    2024-02-07T04:26:04.645291  <8>[   23.301081] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-07T04:26:04.645648  /lava-426667/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c306b3e613a0546a8e1e8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c306b3e613a0546a8e1=
e8d
        new failure (last pass: next-20231222) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30bd53bf1eb30258e1f51

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c30bd53bf1eb30258e1f56
        new failure (last pass: next-20240202)

    2024-02-07T04:49:03.276273  / # #
    2024-02-07T04:49:03.379143  export SHELL=3D/bin/sh
    2024-02-07T04:49:03.379571  #
    2024-02-07T04:49:03.480316  / # export SHELL=3D/bin/sh. /lava-3921272/e=
nvironment
    2024-02-07T04:49:03.480735  =

    2024-02-07T04:49:03.581689  / # . /lava-3921272/environment/lava-392127=
2/bin/lava-test-runner /lava-3921272/1
    2024-02-07T04:49:03.582251  =

    2024-02-07T04:49:03.589624  / # /lava-3921272/bin/lava-test-runner /lav=
a-3921272/1
    2024-02-07T04:49:03.657726  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T04:49:03.657999  + cd /lava-3921272/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 6          =


  Details:     https://kernelci.org/test/plan/id/65c30a336b5c02fa888e1e8b

  Results:     161 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-probed: https://kernelci.org/test/case/id/6=
5c30a336b5c02fa888e1ea4
        failing since 4 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-07T04:42:02.426638  /lava-12711413/1/../bin/lava-test-case

    2024-02-07T04:42:02.433053  <8>[   30.639857] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.panel-edp-driver-present: https://kernelci.org/test/cas=
e/id/65c30a336b5c02fa888e1edb
        failing since 4 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-07T04:41:57.125441  /lava-12711413/1/../bin/lava-test-case

    2024-02-07T04:41:57.135873  <8>[   25.341135] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.anx7625-probed: https://kernelci.org/test/case/id/65c30=
a336b5c02fa888e1ee0
        failing since 4 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-07T04:41:54.990854  <8>[   23.195103] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danx7625-driver-present RESULT=3Dpass>

    2024-02-07T04:41:56.008880  /lava-12711413/1/../bin/lava-test-case

    2024-02-07T04:41:56.018541  <8>[   24.223358] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danx7625-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/65c30=
a336b5c02fa888e1ee2
        failing since 4 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-07T04:41:54.957740  /lava-12711413/1/../bin/lava-test-case

    2024-02-07T04:41:54.968979  <8>[   23.173923] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mipi-tx-probed: https://kernelci.org/test/case=
/id/65c30a336b5c02fa888e1ee4
        failing since 4 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-07T04:41:53.905390  /lava-12711413/1/../bin/lava-test-case

    2024-02-07T04:41:53.915343  <8>[   22.120231] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mipi-tx-probed RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c30a346b5c02fa888e1f33
        failing since 4 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-07T04:41:48.560221  + set +x

    2024-02-07T04:41:48.566810  <8>[   16.772228] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 12711413_1.5.2.3.1>

    2024-02-07T04:41:48.671267  / # #

    2024-02-07T04:41:48.771934  export SHELL=3D/bin/sh

    2024-02-07T04:41:48.772132  #

    2024-02-07T04:41:48.872608  / # export SHELL=3D/bin/sh. /lava-12711413/=
environment

    2024-02-07T04:41:48.872789  =


    2024-02-07T04:41:48.973274  / # . /lava-12711413/environment/lava-12711=
413/bin/lava-test-runner /lava-12711413/1

    2024-02-07T04:41:48.973539  =


    2024-02-07T04:41:48.978920  / # /lava-12711413/bin/lava-test-runner /la=
va-12711413/1
 =

    ... (16 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30a67f9cca6118b8e1fbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c30a67f9cca6118b8e1=
fbc
        new failure (last pass: next-20240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3083cb87a2efcee8e1e79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3083cb87a2efcee8e1=
e7a
        new failure (last pass: next-20240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c307a5e02ece1d6a8e1f12

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c307a5e02ece1d6a8e1f17
        failing since 182 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-02-07T04:30:59.762200  + set +x
    2024-02-07T04:30:59.765382  <8>[   28.487760] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1089746_1.5.2.4.1>
    2024-02-07T04:30:59.872411  / # #
    2024-02-07T04:31:01.329525  export SHELL=3D/bin/sh
    2024-02-07T04:31:01.350537  #
    2024-02-07T04:31:01.350923  / # export SHELL=3D/bin/sh
    2024-02-07T04:31:03.298092  / # . /lava-1089746/environment
    2024-02-07T04:31:06.881573  /lava-1089746/bin/lava-test-runner /lava-10=
89746/1
    2024-02-07T04:31:06.902906  . /lava-1089746/environment
    2024-02-07T04:31:06.903334  / # /lava-1089746/bin/lava-test-runner /lav=
a-1089746/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30cb806f6c183808e1e82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c30cb806f6c183808e1=
e83
        failing since 441 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c31155846152860e8e1e86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c31155846152860e8e1=
e87
        failing since 441 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30693923b0a1c1f8e1e94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c30693923b0a1c1f8e1=
e95
        new failure (last pass: next-20240125) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30783f832b700078e1e87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c30783f832b700078e1=
e88
        failing since 4 days (last pass: next-20240125, first fail: next-20=
240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3086a75584f41438e1f58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3086a75584f41438e1=
f59
        new failure (last pass: next-20240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c307a6987bfbec858e1eb4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c307a6987bfbec858e1=
eb5
        failing since 5 days (last pass: next-20240125, first fail: next-20=
240201) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3063e57e79e71b38e1ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c3063e57e79e71b38e1ec6
        failing since 250 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-07T04:25:15.607932  <8>[   16.429931] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3921137_1.5.2.4.1>
    2024-02-07T04:25:15.719982  / # #
    2024-02-07T04:25:15.821243  export SHELL=3D/bin/sh
    2024-02-07T04:25:15.821662  #
    2024-02-07T04:25:15.922779  / # export SHELL=3D/bin/sh. /lava-3921137/e=
nvironment
    2024-02-07T04:25:15.923230  =

    2024-02-07T04:25:16.024112  / # . /lava-39211/lava-3921137/bin/lava-tes=
t-runner /lava-3921137/1
    2024-02-07T04:25:16.024743  37/environment
    2024-02-07T04:25:16.041228  / # /lava-3921137/bin/lava-test-runner /lav=
a-3921137/1
    2024-02-07T04:25:16.144950  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30e6fe1ed9913c18e1fb7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c30e6fe1ed9913c18e1fbc
        failing since 244 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-07T05:00:10.787130  / # #
    2024-02-07T05:00:10.889732  export SHELL=3D/bin/sh
    2024-02-07T05:00:10.890614  #
    2024-02-07T05:00:10.992194  / # export SHELL=3D/bin/sh. /lava-3921347/e=
nvironment
    2024-02-07T05:00:10.993259  =

    2024-02-07T05:00:11.094939  / # . /lava-3921347/environment/lava-392134=
7/bin/lava-test-runner /lava-3921347/1
    2024-02-07T05:00:11.096384  =

    2024-02-07T05:00:11.110326  / # /lava-3921347/bin/lava-test-runner /lav=
a-3921347/1
    2024-02-07T05:00:11.231062  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T05:00:11.231948  + cd /lava-3921347/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3111d967ca606fa8e1ede

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c3111d967ca606fa8e1ee3
        failing since 245 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-07T05:11:47.859720  / # #
    2024-02-07T05:11:47.962076  export SHELL=3D/bin/sh
    2024-02-07T05:11:47.962442  #
    2024-02-07T05:11:48.063308  / # export SHELL=3D/bin/sh. /lava-3921377/e=
nvironment
    2024-02-07T05:11:48.064551  =

    2024-02-07T05:11:48.166296  / # . /lava-3921377/environment/lava-392137=
7/bin/lava-test-runner /lava-3921377/1
    2024-02-07T05:11:48.167960  =

    2024-02-07T05:11:48.181030  / # /lava-3921377/bin/lava-test-runner /lav=
a-3921377/1
    2024-02-07T05:11:48.306883  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T05:11:48.308070  + cd /lava-3921377/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3062abf708ff0608e1e8c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c3062abf708ff0608e1e91
        failing since 250 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-07T04:24:55.411107  + set +x
    2024-02-07T04:24:55.412911  [   24.209313] <LAVA_SIGNAL_ENDRUN 0_dmesg =
457018_1.5.2.4.1>
    2024-02-07T04:24:55.520543  / # #
    2024-02-07T04:24:55.622037  export SHELL=3D/bin/sh
    2024-02-07T04:24:55.622688  #
    2024-02-07T04:24:55.723699  / # export SHELL=3D/bin/sh. /lava-457018/en=
vironment
    2024-02-07T04:24:55.724503  =

    2024-02-07T04:24:55.825905  / # . /lava-457018/environment/lava-457018/=
bin/lava-test-runner /lava-457018/1
    2024-02-07T04:24:55.827076  =

    2024-02-07T04:24:55.829590  / # /lava-457018/bin/lava-test-runner /lava=
-457018/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c30e5ef8384b645e8e1e96

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c30e5ef8384b645e8e1e9b
        failing since 244 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-07T04:59:51.699231  + set +x
    2024-02-07T04:59:51.701003  [   21.749643] <LAVA_SIGNAL_ENDRUN 0_dmesg =
457041_1.5.2.4.1>
    2024-02-07T04:59:51.809477  / # #
    2024-02-07T04:59:51.911181  export SHELL=3D/bin/sh
    2024-02-07T04:59:51.911702  #
    2024-02-07T04:59:52.012691  / # export SHELL=3D/bin/sh. /lava-457041/en=
vironment
    2024-02-07T04:59:52.013230  =

    2024-02-07T04:59:52.114230  / # . /lava-457041/environment/lava-457041/=
bin/lava-test-runner /lava-457041/1
    2024-02-07T04:59:52.115072  =

    2024-02-07T04:59:52.117958  / # /lava-457041/bin/lava-test-runner /lava=
-457041/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3112e0abe64daa08e1e8c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c3112e0abe64daa08e1e91
        failing since 245 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-07T05:11:56.240780  + set +x
    2024-02-07T05:11:56.242611  [   21.361834] <LAVA_SIGNAL_ENDRUN 0_dmesg =
457047_1.5.2.4.1>
    2024-02-07T05:11:56.351318  / # #
    2024-02-07T05:11:56.453199  export SHELL=3D/bin/sh
    2024-02-07T05:11:56.453843  #
    2024-02-07T05:11:56.554920  / # export SHELL=3D/bin/sh. /lava-457047/en=
vironment
    2024-02-07T05:11:56.556155  =

    2024-02-07T05:11:56.657334  / # . /lava-457047/environment/lava-457047/=
bin/lava-test-runner /lava-457047/1
    2024-02-07T05:11:56.658176  =

    2024-02-07T05:11:56.661715  / # /lava-457047/bin/lava-test-runner /lava=
-457047/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c307c1d1d6ae2ca68e1e8d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c307c1d1d6ae2ca68e1e92
        failing since 57 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-07T04:31:35.450438  / # #
    2024-02-07T04:31:35.551562  export SHELL=3D/bin/sh
    2024-02-07T04:31:35.551922  #
    2024-02-07T04:31:35.652720  / # export SHELL=3D/bin/sh. /lava-3921240/e=
nvironment
    2024-02-07T04:31:35.653075  =

    2024-02-07T04:31:35.753863  / # . /lava-3921240/environment/lava-392124=
0/bin/lava-test-runner /lava-3921240/1
    2024-02-07T04:31:35.754426  =

    2024-02-07T04:31:35.762519  / # /lava-3921240/bin/lava-test-runner /lav=
a-3921240/1
    2024-02-07T04:31:35.916501  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T04:31:35.916934  + cd /lava-3921240/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c307c2651e40df568e1e89

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240206/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240206/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c307c2651e40df568e1e8e
        failing since 54 days (last pass: next-20231213, first fail: next-2=
0231214)

    2024-02-07T04:31:29.822652  <8>[    9.891297] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3921242_1.5.2.4.1>
    2024-02-07T04:31:29.927406  / # #
    2024-02-07T04:31:30.028504  export SHELL=3D/bin/sh
    2024-02-07T04:31:30.028839  #
    2024-02-07T04:31:30.129587  / # export SHELL=3D/bin/sh. /lava-3921242/e=
nvironment
    2024-02-07T04:31:30.129924  =

    2024-02-07T04:31:30.230681  / # . /lava-3921242/environment/lava-392124=
2/bin/lava-test-runner /lava-3921242/1
    2024-02-07T04:31:30.231222  =

    2024-02-07T04:31:30.272800  / # /lava-3921242/bin/lava-test-runner /lav=
a-3921242/1
    2024-02-07T04:31:30.374578  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20

