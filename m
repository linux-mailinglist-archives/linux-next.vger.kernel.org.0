Return-Path: <linux-next+bounces-1186-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2A1856223
	for <lists+linux-next@lfdr.de>; Thu, 15 Feb 2024 12:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71EF71C21CAD
	for <lists+linux-next@lfdr.de>; Thu, 15 Feb 2024 11:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F412127B6E;
	Thu, 15 Feb 2024 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="TF5BDuKF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21CA69DFE
	for <linux-next@vger.kernel.org>; Thu, 15 Feb 2024 11:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707997813; cv=none; b=DxOCeXNt/8sWBpfGfyFPoV9D+5EvYvEnoAkwZBtQF8TzdLd4asPhHfC80pjS6sMZPMRFRl5XEdS/EtZAnVbcSs0I1+Xz9ElmCDUqwA/NjSsTloYAmax8ddU8QO+g/gHCrGa5vxZMOEdf6pOXlhR8phq9OavcxRgaHGH0ya0p410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707997813; c=relaxed/simple;
	bh=yJqaPgq/QsNbIdKXCYqztvxdQHG3Ggcc1rJuX3JQ1aY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Dntnl9VGktk7x+zv0cCgcwUmf4RUz8R/tEyz9fLU8mUveIJliECD5JRI/B/Gr3F1XILDJnLponFwx5GLz1pFIygCVNccFjYQNd07D3ALS5OvE0IuFx6nNeKIEfcdzbdHG0IAaW7eKNgo4uFY8I7wpMdi2X3eynlQ/qalguCn4Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=TF5BDuKF; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-296dc0cab6aso578993a91.1
        for <linux-next@vger.kernel.org>; Thu, 15 Feb 2024 03:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707997808; x=1708602608; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEJFCuSZD/z9aDQAkx8A7eg2PKPNtk5QuLKH5Jbb5SU=;
        b=TF5BDuKFwqKVw0NycNO2Ouhh3g9/tkmsagl9o87/rnF7Xagh3zTDUdqyCJMUXYwWZX
         OlotxseG8JA6kyYclnKfKkf+gXUUzhn6B5yaevsB/yMSjUVaNxnU8XgonQGsSPbb+mdr
         VOk2edpYpsQ6Q1zMzzwH7s5lJmX3jTc5sqDvX4/TH+MzhOvR/9wkcGFcwzsJzyZGqIPM
         hNSD06Qy9m0fj90rAvrh82GWFZVl0pgy0Gy+cVCjV7HckpIeQjnxqkVZJu/BpF7vSHed
         8M+qQymBGSMvBn4Vy2LO0XZOAklj8ziyKE/j+M1rleQAJhrjfwVOWV96PAgZQbPUotJt
         yxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707997808; x=1708602608;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEJFCuSZD/z9aDQAkx8A7eg2PKPNtk5QuLKH5Jbb5SU=;
        b=QapFjSBp4RKS5+mwCzC5TI0v95cWYNLv2Vxg4LFUelT5tNkr9LQhalEolgScqpKqIN
         UDoe4tSAEyFig080fMeq6u95GMjYPj0HRlNhERgOuvkUR121tYtOt7NTpweRJALQECga
         LQvoVXKQdxkwYN6LIgMRfQFgE8hZX9VMdU2JnOyJABKEANXjcCtOehNy9mWWgKy3vV8o
         3c3aZjU+KihM/jwFECJ6NAcmqzCMauD11Kr0csQkYxg+TP3pIkU1Y7TfakCfMuTw7sjD
         h1PxIKTUmYrvhWUxIPUmPJhYkV6chbazigV/bJDxzhV3eBaKuLO+aaq1XyTxvsqvcUTt
         /B4Q==
X-Gm-Message-State: AOJu0YwFBUBAJ6KJxBQaIIgW6A2qL9/VlWWKIp/fc0hHVlfYCASAG0yF
	3JL3jNvCQIIHUgFQnRUhhXyLzu7QH8pZLYEzMshbm3psJM3rrK8Qtsxbw00hvyHk3sLIOx6B7GF
	vbMs=
X-Google-Smtp-Source: AGHT+IGpgdFJK+IsoE4jujx4cjDGOh0vr+w3x2eFyXDlRfz2Td/j2StrQI3AcRxrflnouTmb1+VnOw==
X-Received: by 2002:a17:90a:898d:b0:296:a76a:9711 with SMTP id v13-20020a17090a898d00b00296a76a9711mr2260734pjn.12.1707997807643;
        Thu, 15 Feb 2024 03:50:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id qn4-20020a17090b3d4400b00298f88c3e48sm1502448pjb.11.2024.02.15.03.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 03:50:06 -0800 (PST)
Message-ID: <65cdfa6e.170a0220.c370e.4392@mx.google.com>
Date: Thu, 15 Feb 2024 03:50:06 -0800 (PST)
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
X-Kernelci-Kernel: next-20240215
X-Kernelci-Report-Type: test
Subject: next/master baseline: 433 runs, 41 regressions (next-20240215)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 433 runs, 41 regressions (next-20240215)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

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
ig+CON...OMIZE_BASE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 2          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

qemu_riscv64                 | riscv | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240215/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240215
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      26d7d52b6253574d5b6fec16a93e1110d1489cef =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc87e769605346f637020

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdc87e769605346f637=
021
        new failure (last pass: next-20240214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdb9462e94b1635a637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdb9472e94b1635a637=
013
        failing since 379 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc40efb9ecf991c63702e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdc40efb9ecf991c637=
02f
        failing since 255 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc06205b447ec31637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdc06205b447ec31637=
013
        failing since 323 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc1b7b61fa7f457637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdc1b7b61fa7f457637=
013
        failing since 321 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc31d2ff27d76ce63702f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdc31d2ff27d76ce637=
030
        failing since 1 day (last pass: next-20240212, first fail: next-202=
40213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbe4f8d415067c7637014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdbe4f8d415067c7637=
015
        new failure (last pass: next-20240214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbb9f31b904c5f263702c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdbb9f31b904c5f2637=
02d
        failing since 674 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65cdbe36451e070298637039

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdbe36451e070298637040
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-15T07:32:49.551872  <8>[   20.287065] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 430209_1.5.2.4.1>
    2024-02-15T07:32:49.657642  / # #
    2024-02-15T07:32:49.759748  export SHELL=3D/bin/sh
    2024-02-15T07:32:49.760045  #
    2024-02-15T07:32:49.861025  / # export SHELL=3D/bin/sh. /lava-430209/en=
vironment
    2024-02-15T07:32:49.861707  =

    2024-02-15T07:32:49.962982  / # . /lava-430209/environment/lava-430209/=
bin/lava-test-runner /lava-430209/1
    2024-02-15T07:32:49.963996  =

    2024-02-15T07:32:49.983417  / # /lava-430209/bin/lava-test-runner /lava=
-430209/1
    2024-02-15T07:32:50.026511  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65cdbe36451e070298637044
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-15T07:32:52.134226  /lava-430209/1/../bin/lava-test-case
    2024-02-15T07:32:52.134642  <8>[   22.851614] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-15T07:32:52.134940  /lava-430209/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
cdbe36451e070298637046
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-15T07:32:53.191976  /lava-430209/1/../bin/lava-test-case
    2024-02-15T07:32:53.192393  <8>[   23.890401] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-15T07:32:53.192669  /lava-430209/1/../bin/lava-test-case
    2024-02-15T07:32:53.192887  <8>[   23.907636] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-02-15T07:32:53.193096  /lava-430209/1/../bin/lava-test-case
    2024-02-15T07:32:53.193292  <8>[   23.926506] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cdbe36451e07029863704b
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-15T07:32:54.269829  /lava-430209/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65cdbe36451e07029863704c
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-15T07:32:54.273196  <8>[   25.004947] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-15T07:32:55.334332  /lava-430209/1/../bin/lava-test-case
    2024-02-15T07:32:55.334797  <8>[   26.026446] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-15T07:32:55.335108  /lava-430209/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65cdc02a1b1a8de11563706d

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdc02a1b1a8de115637074
        failing since 64 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-15T07:41:09.007113  <8>[   20.263370] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 430221_1.5.2.4.1>
    2024-02-15T07:41:09.110802  / # #
    2024-02-15T07:41:09.212365  export SHELL=3D/bin/sh
    2024-02-15T07:41:09.213059  #
    2024-02-15T07:41:09.314299  / # export SHELL=3D/bin/sh. /lava-430221/en=
vironment
    2024-02-15T07:41:09.314907  =

    2024-02-15T07:41:09.416225  / # . /lava-430221/environment/lava-430221/=
bin/lava-test-runner /lava-430221/1
    2024-02-15T07:41:09.417442  =

    2024-02-15T07:41:09.458065  / # /lava-430221/bin/lava-test-runner /lava=
-430221/1
    2024-02-15T07:41:09.480137  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65cdc02a1b1a8de115637078
        failing since 64 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-15T07:41:11.585810  /lava-430221/1/../bin/lava-test-case
    2024-02-15T07:41:11.586378  <8>[   22.824289] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-15T07:41:11.586753  /lava-430221/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
cdc02a1b1a8de11563707a
        failing since 64 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-15T07:41:12.643991  /lava-430221/1/../bin/lava-test-case
    2024-02-15T07:41:12.644445  <8>[   23.863039] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-15T07:41:12.644759  /lava-430221/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cdc02a1b1a8de11563707f
        failing since 64 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-15T07:41:13.718749  /lava-430221/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65cdc02a1b1a8de115637080
        failing since 64 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-15T07:41:13.721922  <8>[   24.974359] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-15T07:41:14.780856  /lava-430221/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65cdbe38451e0702986370a5

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdbe38451e0702986370ac
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-15T07:33:00.872005  / # #
    2024-02-15T07:33:00.974184  export SHELL=3D/bin/sh
    2024-02-15T07:33:00.974929  #
    2024-02-15T07:33:01.076446  / # export SHELL=3D/bin/sh. /lava-430210/en=
vironment
    2024-02-15T07:33:01.077202  =

    2024-02-15T07:33:01.178716  / # . /lava-430210/environment/lava-430210/=
bin/lava-test-runner /lava-430210/1
    2024-02-15T07:33:01.180091  =

    2024-02-15T07:33:01.198303  / # /lava-430210/bin/lava-test-runner /lava=
-430210/1
    2024-02-15T07:33:01.252367  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-15T07:33:01.252807  + <8>[   21.176510] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430210_1.5.2.4.5> =

    ... (12 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cdbe38451e0702986370bf
        failing since 64 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-15T07:33:03.686154  /lava-430210/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65cdbfc62847cfab33637017

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdbfc62847cfab3363701e
        failing since 64 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-15T07:39:26.385608  / # #
    2024-02-15T07:39:26.487826  export SHELL=3D/bin/sh
    2024-02-15T07:39:26.488575  #
    2024-02-15T07:39:26.590128  / # export SHELL=3D/bin/sh. /lava-430220/en=
vironment
    2024-02-15T07:39:26.590925  =

    2024-02-15T07:39:26.692381  / # . /lava-430220/environment/lava-430220/=
bin/lava-test-runner /lava-430220/1
    2024-02-15T07:39:26.693681  =

    2024-02-15T07:39:26.712310  / # /lava-430220/bin/lava-test-runner /lava=
-430220/1
    2024-02-15T07:39:26.765977  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-15T07:39:26.766143  + <8>[   21.029755] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430220_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cdbfc62847cfab33637031
        failing since 64 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-15T07:39:29.201887  /lava-430220/1/../bin/lava-test-case
    2024-02-15T07:39:29.202350  <8>[   23.450604] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-15T07:39:29.202640  /lava-430220/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc0cade094db5a163708c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdc0cade094db5a1637=
08d
        new failure (last pass: next-20240213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/65cdc8024afad206ee637331

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/65cdc8024afad206ee63734c
        new failure (last pass: next-20240214)

    2024-02-15T08:14:40.054235  /lava-12768388/1/../bin/lava-test-case
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/65cdc8024afad206ee63734d
        new failure (last pass: next-20240214)

    2024-02-15T08:14:39.022621  /lava-12768388/1/../bin/lava-test-case

    2024-02-15T08:14:39.034284  <8>[   30.388420] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc770081b221fc3637054

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdc770081b221fc3637059
        new failure (last pass: next-20240214)

    2024-02-15T08:12:26.877965  / # =


    2024-02-15T08:12:26.878290  <6>[   17.256727] mediatek-drm mediatek-drm=
.17.auto: bound 1c015000.dp-intf (ops mtk_dpi_component_ops [mediatek_drm])

    2024-02-15T08:12:26.878357  <6>[   17.268041] mediatek-disp-ethdr 1c114=
000.hdr-engine: Adding to iommu group 3

    2024-02-15T08:12:26.878418  <6>[   17.275813] mediatek-mdp-rdma 1c10400=
0.dma-controller: Adding to iommu group 3

    2024-02-15T08:12:26.878476  <6>[   17.283586] mediatek-mdp-rdma 1c10500=
0.dma-controller: Adding to iommu group 3

    2024-02-15T08:12:26.878532  <6>[   17.291319] mediatek-mdp-rdma 1c10600=
0.dma-controller: Adding to iommu group 3

    2024-02-15T08:12:26.880501  <6>[   17.299022] mediatek-mdp-rdma 1c10700=
0.dma-controller: Adding to iommu group 3

    2024-02-15T08:12:26.920817  <6>[   17.306752] mediatek-mdp-rdma 1c10800=
0.dma-controller: Adding to iommu group 3

    2024-02-15T08:12:26.920919  <6>[   17.314465] mediatek-mdp-rdma 1c10900=
0.dma-controller: Adding to iommu group 3

    2024-02-15T08:12:26.921008  =

 =

    ... (81 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_riscv64                 | riscv | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc3a079144b054f637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdc3a079144b054f637=
013
        failing since 7 days (last pass: next-20240206, first fail: next-20=
240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbb7f31b904c5f2637014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdbb7f31b904c5f2637=
015
        failing since 1 day (last pass: next-20240212, first fail: next-202=
40213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbfe663fddc9f78637012

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdbfe663fddc9f7863701b
        failing since 191 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-02-15T07:40:04.778895  + set +x
    2024-02-15T07:40:04.782275  <8>[   28.468381] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1093601_1.5.2.4.1>
    2024-02-15T07:40:04.890002  / # #
    2024-02-15T07:40:06.354850  export SHELL=3D/bin/sh
    2024-02-15T07:40:06.375875  #
    2024-02-15T07:40:06.376383  / # export SHELL=3D/bin/sh
    2024-02-15T07:40:08.334696  / # . /lava-1093601/environment
    2024-02-15T07:40:11.938511  /lava-1093601/bin/lava-test-runner /lava-10=
93601/1
    2024-02-15T07:40:11.960030  . /lava-1093601/environment
    2024-02-15T07:40:11.960469  / # /lava-1093601/bin/lava-test-runner /lav=
a-1093601/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbcb5481ec6e247637016

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdbcb5481ec6e247637=
017
        failing since 449 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbbb131b904c5f2637058

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdbbb131b904c5f2637=
059
        failing since 449 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbfb11352caadce63707a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdbfb11352caadce637=
07b
        failing since 7 days (last pass: next-20240125, first fail: next-20=
240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc11a47e345ccb96370f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdc11a47e345ccb9637=
0f3
        failing since 12 days (last pass: next-20240125, first fail: next-2=
0240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc20bbbe0b59bad6370aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cdc20bbbe0b59bad637=
0ab
        failing since 15 days (last pass: next-20240118, first fail: next-2=
0240130) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbeed33eee1aaf0637050

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdbeed33eee1aaf0637059
        failing since 259 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-15T07:35:38.952027  / # #
    2024-02-15T07:35:39.054288  export SHELL=3D/bin/sh
    2024-02-15T07:35:39.055097  #
    2024-02-15T07:35:39.156369  / # export SHELL=3D/bin/sh. /lava-3928553/e=
nvironment
    2024-02-15T07:35:39.156932  =

    2024-02-15T07:35:39.258012  / # . /lava-3928553/environment/lava-392855=
3/bin/lava-test-runner /lava-3928553/1
    2024-02-15T07:35:39.259757  =

    2024-02-15T07:35:39.277123  / # /lava-3928553/bin/lava-test-runner /lav=
a-3928553/1
    2024-02-15T07:35:39.407639  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-15T07:35:39.408664  + cd /lava-3928553/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc0993451d6cdfa63702e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdc0993451d6cdfa637037
        failing since 253 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-15T07:43:09.809261  / # #
    2024-02-15T07:43:09.910204  export SHELL=3D/bin/sh
    2024-02-15T07:43:09.910561  #
    2024-02-15T07:43:10.011279  / # export SHELL=3D/bin/sh. /lava-3928617/e=
nvironment
    2024-02-15T07:43:10.011617  =

    2024-02-15T07:43:10.112274  / # . /lava-3928617/environment/lava-392861=
7/bin/lava-test-runner /lava-3928617/1
    2024-02-15T07:43:10.112844  =

    2024-02-15T07:43:10.159836  / # /lava-3928617/bin/lava-test-runner /lav=
a-3928617/1
    2024-02-15T07:43:10.244475  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-15T07:43:10.244971  + cd /lava-3928617/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc79e4f7dba5a436370e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdc79e4f7dba5a436370ef
        failing since 259 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-15T08:13:04.194214  / # #
    2024-02-15T08:13:04.297115  export SHELL=3D/bin/sh
    2024-02-15T08:13:04.298100  #
    2024-02-15T08:13:04.399818  / # export SHELL=3D/bin/sh. /lava-3928765/e=
nvironment
    2024-02-15T08:13:04.400863  =

    2024-02-15T08:13:04.502737  / # . /lava-3928765/environment/lava-392876=
5/bin/lava-test-runner /lava-3928765/1
    2024-02-15T08:13:04.504311  =

    2024-02-15T08:13:04.518026  / # /lava-3928765/bin/lava-test-runner /lav=
a-3928765/1
    2024-02-15T08:13:04.646855  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-15T08:13:04.648066  + cd /lava-3928765/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbea2fef6c22a36637014

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdbea2fef6c22a3663701d
        failing since 259 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-15T07:34:35.150276  + set +x
    2024-02-15T07:34:35.152037  [   19.649708] <LAVA_SIGNAL_ENDRUN 0_dmesg =
458457_1.5.2.4.1>
    2024-02-15T07:34:35.260777  / # #
    2024-02-15T07:34:35.362188  export SHELL=3D/bin/sh
    2024-02-15T07:34:35.362640  #
    2024-02-15T07:34:35.463488  / # export SHELL=3D/bin/sh. /lava-458457/en=
vironment
    2024-02-15T07:34:35.463965  =

    2024-02-15T07:34:35.564729  / # . /lava-458457/environment/lava-458457/=
bin/lava-test-runner /lava-458457/1
    2024-02-15T07:34:35.565340  =

    2024-02-15T07:34:35.567941  / # /lava-458457/bin/lava-test-runner /lava=
-458457/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc239a34aaaf633637012

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdc239a34aaaf63363701b
        failing since 253 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-15T07:49:53.595398  + set +x
    2024-02-15T07:49:53.597203  [   21.162069] <LAVA_SIGNAL_ENDRUN 0_dmesg =
458464_1.5.2.4.1>
    2024-02-15T07:49:53.705265  / # #
    2024-02-15T07:49:53.806893  export SHELL=3D/bin/sh
    2024-02-15T07:49:53.807535  #
    2024-02-15T07:49:53.908548  / # export SHELL=3D/bin/sh. /lava-458464/en=
vironment
    2024-02-15T07:49:53.909177  =

    2024-02-15T07:49:54.010181  / # . /lava-458464/environment/lava-458464/=
bin/lava-test-runner /lava-458464/1
    2024-02-15T07:49:54.011063  =

    2024-02-15T07:49:54.013923  / # /lava-458464/bin/lava-test-runner /lava=
-458464/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdc79da51f79ff90637029

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdc79da51f79ff90637032
        failing since 259 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-15T08:13:02.670710  + set +x
    2024-02-15T08:13:02.672438  [   23.774752] <LAVA_SIGNAL_ENDRUN 0_dmesg =
458480_1.5.2.4.1>
    2024-02-15T08:13:02.780004  / # #
    2024-02-15T08:13:02.881526  export SHELL=3D/bin/sh
    2024-02-15T08:13:02.882061  #
    2024-02-15T08:13:02.983021  / # export SHELL=3D/bin/sh. /lava-458480/en=
vironment
    2024-02-15T08:13:02.983541  =

    2024-02-15T08:13:03.084541  / # . /lava-458480/environment/lava-458480/=
bin/lava-test-runner /lava-458480/1
    2024-02-15T08:13:03.085385  =

    2024-02-15T08:13:03.088008  / # /lava-458480/bin/lava-test-runner /lava=
-458480/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65cdbd0a1496554aea63705d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240215/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240215/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cdbd0a1496554aea637066
        failing since 66 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-15T07:27:44.370860  <8>[   10.316861] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3928495_1.5.2.4.1>
    2024-02-15T07:27:44.488462  / # #
    2024-02-15T07:27:44.589755  export SHELL=3D/bin/sh
    2024-02-15T07:27:44.590155  #
    2024-02-15T07:27:44.691007  / # export SHELL=3D/bin/sh. /lava-3928495/e=
nvironment
    2024-02-15T07:27:44.691449  =

    2024-02-15T07:27:44.792254  / # . /lava-3928495/environment/lava-392849=
5/bin/lava-test-runner /lava-3928495/1
    2024-02-15T07:27:44.792831  =

    2024-02-15T07:27:44.801495  / # /lava-3928495/bin/lava-test-runner /lav=
a-3928495/1
    2024-02-15T07:27:44.974341  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20

