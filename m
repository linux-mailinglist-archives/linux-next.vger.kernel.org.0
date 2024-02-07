Return-Path: <linux-next+bounces-1064-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1784CF94
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 18:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E84DA1F2304B
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 17:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F3E80C00;
	Wed,  7 Feb 2024 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="W+b+FAr8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73A341C7C
	for <linux-next@vger.kernel.org>; Wed,  7 Feb 2024 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707326109; cv=none; b=kdWvEoQA+Xy30h/JBDNCDFjcYwatss8b60zwdUW9/u7cGnsx/lsCn7HAOqXO8xdyFTswV9Kf48IAjVeKm4yyAMQSFlHbyEkISknGaNerAykBqmGcI4boZCfmqcfIbh2KkvdM2sRhCgvXlGrWvO+G0kE9nwmkFj8dvf64XEuyEcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707326109; c=relaxed/simple;
	bh=UepajJfXPCYQ2pKPLE/cYbUTpz/8Clyj7NfW4PUmfaA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=S6497ZNay7QcaFa3wWGPcTIWSi10l3fBYjYbgvNDcxiHIZkot3bQQA+vEsFdaMBbnayuPOwYMKGwUM+bfLCEbA0BHBBwzjlRERsdEba/8dXz8pTnYgufEP9J/SON33AMB9X4pbYU15pl8OVHkZJg/u/USDTbpRk73sW4AngJ9/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=W+b+FAr8; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bb9d54575cso593730b6e.2
        for <linux-next@vger.kernel.org>; Wed, 07 Feb 2024 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707326104; x=1707930904; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WLFauxZQs/MsbSyadenPKBCdC/lJHM9tlLuE00yH27U=;
        b=W+b+FAr80R/Zrmblp78y+bi8NBPJ8wJ+YPvl9oaT6fIuIvvQ/4m1n+IALaMhUJsJIM
         k5Bmut/tiBP1Tndch780JDnGnzfzMby9nFTmeAA+hhQVyGoI+ap9wll+aE+R4lwyke7t
         N08XrPiEcIwJtGl0OWJhg5p7bkzcWFnD8bBGS1mNgrdLRFZ5gNDXiBxBUBwJ6DAiWdKy
         QxYj0uWSSvIfY0sR8FOn/mT/CXNpqnorjwtLxnN0QC7+bC3+mbd+jaeV+8dcosJM0CFb
         d05IkDewn+V+QCSKauTASo1dGPJMYskYLmWfrqRbWVp/9kfc7itblu2MW8694DqFNhI1
         qatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707326104; x=1707930904;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLFauxZQs/MsbSyadenPKBCdC/lJHM9tlLuE00yH27U=;
        b=VTpq+t5NctuwiFc3fV/2NC1C5JxPnvvukZWAA0Yta4SPawaGr9hcF/ABE7sXIwebo4
         DPXziyYqjrodPBwG03xAn1AkbwgJ2EMvYSauIWUKCTBJ4CwDiRIZr3Lqv2n/qJ5a+WHh
         /o27I5kQWoe83/sXuPoqS+7VXpZA0eWmsqE8APzLPMUcFiTq13ybqaGJkx+QwWmkWrRH
         mzzZpdE3u7rC3QSNXx67400I1Rv7Vmm8OWfyMW6CRp1WA6icRsAvifMrYSf0d8w4CwTh
         v2Cj9/kkdKO6afkxZb50L9gzRm5/LHRFZ85/Twkv4zWkocI5Wk3JwXKO0QttJxEA0cWC
         rpJA==
X-Gm-Message-State: AOJu0YzbRryc72SsLFxpMvrmUTZJ3Y8cMss1BhhyOxUx9lhKlyPX4pTA
	mvmIO6snTMaND9Y6VUvmIqjs8WR69eLY5ObWYIiWsFG08Goa74r3aWCbv9qLtwBwmgMn4PPo6pl
	ZfcY=
X-Google-Smtp-Source: AGHT+IGElLC65l/IeDbUNBs8Z/mFbCiJuUtM1Qup7MuHptC+OM5hqamhH0eHw0DkgGkKhykxPyAJoA==
X-Received: by 2002:a05:6358:d39e:b0:175:fc1a:c7df with SMTP id mp30-20020a056358d39e00b00175fc1ac7dfmr3543033rwb.15.1707326103403;
        Wed, 07 Feb 2024 09:15:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZk5ctCSlA3awCFBg43udsVNvdzyNEhumOHX4zQtB/slhFzMJMCw6dls5hKn7frqdY0jIzBrDBr9BUqcCN7xSUpp+ytkDRx2zP0s3PyOTxsDXpbRaN7cOcyevERmqDpz84C3Qj8bMUr5hKxbj4oH1nDg==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q29-20020a638c5d000000b005cfbf96c733sm1829127pgn.30.2024.02.07.09.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 09:15:02 -0800 (PST)
Message-ID: <65c3ba96.630a0220.a75d7.5ad7@mx.google.com>
Date: Wed, 07 Feb 2024 09:15:02 -0800 (PST)
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
X-Kernelci-Kernel: next-20240207
Subject: next/master baseline: 502 runs, 51 regressions (next-20240207)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 502 runs, 51 regressions (next-20240207)

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

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 2          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 6          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_riscv64                 | riscv | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-collabora   | gcc-10   | defconf=
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
ig                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =

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

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240207/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240207
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2ae0a045e6814c8c1d676d6153c605a65746aa29 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37c4bd0ed491a848e1ecd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c37c4bd0ed491a848e1=
ece
        failing since 371 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37b6a018b0394ed8e1e7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c37b6a018b0394ed8e1=
e7b
        failing since 247 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37e9f46ec0d42c88e1e97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c37e9f46ec0d42c88e1=
e98
        failing since 315 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37f84f6d195737f8e1ea8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c37f84f6d195737f8e1=
ea9
        failing since 313 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 2          =


  Details:     https://kernelci.org/test/plan/id/65c37ca0bcb761d85b8e1e79

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65c37ca0b=
cb761d85b8e1e82
        new failure (last pass: next-20240206)

    2024-02-07T12:50:24.641423  /lava-553122/1/../bin/lava-test-case
    2024-02-07T12:50:24.667253  <8>[   17.843989] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
c37ca0bcb761d85b8e1e83
        new failure (last pass: next-20240206)

    2024-02-07T12:50:23.593025  /lava-553122/1/../bin/lava-test-case
    2024-02-07T12:50:23.619471  <8>[   16.794604] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3887e072f1837ac8e1ed7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3887e072f1837ac8e1=
ed8
        new failure (last pass: next-20240206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3812c31d219dbe18e1f20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3812c31d219dbe18e1=
f21
        failing since 666 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65c37f10385ce73f838e1eab

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37f10385ce73f838e1eae
        failing since 57 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T13:00:46.458034  / # #
    2024-02-07T13:00:46.559385  export SHELL=3D/bin/sh
    2024-02-07T13:00:46.559768  #
    2024-02-07T13:00:46.660463  / # export SHELL=3D/bin/sh. /lava-426891/en=
vironment
    2024-02-07T13:00:46.660868  =

    2024-02-07T13:00:46.761807  / # . /lava-426891/environment/lava-426891/=
bin/lava-test-runner /lava-426891/1
    2024-02-07T13:00:46.762613  =

    2024-02-07T13:00:46.771966  / # /lava-426891/bin/lava-test-runner /lava=
-426891/1
    2024-02-07T13:00:46.813972  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T13:00:46.828464  + <8>[   20.635527] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 426891_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c37f10385ce73f838e1eb2
        failing since 57 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T13:00:47.895833  <8>[   21.720949] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-07T13:00:48.933170  /lava-426891/1/../bin/lava-test-case
    2024-02-07T13:00:48.933503  <8>[   22.744033] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-07T13:00:48.933943  /lava-426891/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c37f10385ce73f838e1eb4
        failing since 57 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T13:00:49.992402  /lava-426891/1/../bin/lava-test-case
    2024-02-07T13:00:49.992622  <8>[   23.782786] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-07T13:00:49.992758  /lava-426891/1/../bin/lava-test-case
    2024-02-07T13:00:49.992880  <8>[   23.801723] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c37f10385ce73f838e1eb9
        failing since 57 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T13:00:51.068488  /lava-426891/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c37f10385ce73f838e1eba
        failing since 57 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T13:00:51.071838  <8>[   24.896207] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-07T13:00:52.123701  /lava-426891/1/../bin/lava-test-case
    2024-02-07T13:00:52.124301  <8>[   25.917952] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-07T13:00:52.124629  /lava-426891/1/../bin/lava-test-case
    2024-02-07T13:00:52.124896  <8>[   25.934649] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-07T13:00:52.125152  /lava-426891/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65c383fc40ddf66dcc8e20b4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c383fc40ddf66dcc8e20b7
        failing since 56 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-07T13:21:50.069942  / # #
    2024-02-07T13:21:50.170562  export SHELL=3D/bin/sh
    2024-02-07T13:21:50.170769  #
    2024-02-07T13:21:50.271251  / # export SHELL=3D/bin/sh. /lava-426916/en=
vironment
    2024-02-07T13:21:50.271462  =

    2024-02-07T13:21:50.371987  / # . /lava-426916/environment/lava-426916/=
bin/lava-test-runner /lava-426916/1
    2024-02-07T13:21:50.372291  =

    2024-02-07T13:21:50.383955  / # /lava-426916/bin/lava-test-runner /lava=
-426916/1
    2024-02-07T13:21:50.434722  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T13:21:50.434823  + <8>[   20.545047] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 426916_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c383fc40ddf66dcc8e20bb
        failing since 56 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-07T13:21:52.543325  /lava-426916/1/../bin/lava-test-case
    2024-02-07T13:21:52.543748  <8>[   22.654008] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-07T13:21:52.544057  /lava-426916/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c383fc40ddf66dcc8e20bd
        failing since 56 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-07T13:21:53.602731  /lava-426916/1/../bin/lava-test-case
    2024-02-07T13:21:53.603163  <8>[   23.694287] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-07T13:21:53.603498  /lava-426916/1/../bin/lava-test-case
    2024-02-07T13:21:53.603726  <8>[   23.711417] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-02-07T13:21:53.603941  /lava-426916/1/../bin/lava-test-case
    2024-02-07T13:21:53.604144  <8>[   23.730428] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2024-02-07T13:21:53.604349  /lava-426916/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c383fc40ddf66dcc8e20c2
        failing since 56 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-07T13:21:53.663736  <8>[   23.788066] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-07T13:21:54.682073  /lava-426916/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c383fc40ddf66dcc8e20c3
        failing since 56 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-07T13:21:54.685415  <8>[   24.810320] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-07T13:21:55.741666  /lava-426916/1/../bin/lava-test-case
    2024-02-07T13:21:55.742210  <8>[   25.832022] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-07T13:21:55.742507  /lava-426916/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65c37ec0724ad452f68e1e87

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37ec0724ad452f68e1e8a
        failing since 57 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T12:59:22.932949  / # #
    2024-02-07T12:59:23.035205  export SHELL=3D/bin/sh
    2024-02-07T12:59:23.035929  #
    2024-02-07T12:59:23.137199  / # export SHELL=3D/bin/sh. /lava-426894/en=
vironment
    2024-02-07T12:59:23.137932  =

    2024-02-07T12:59:23.239537  / # . /lava-426894/environment/lava-426894/=
bin/lava-test-runner /lava-426894/1
    2024-02-07T12:59:23.240680  =

    2024-02-07T12:59:23.246736  / # /lava-426894/bin/lava-test-runner /lava=
-426894/1
    2024-02-07T12:59:23.313637  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T12:59:23.314113  + <8>[   20.973320] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 426894_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c37ec0724ad452f68e1e9d
        failing since 57 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-07T12:59:25.749414  /lava-426894/1/../bin/lava-test-case
    2024-02-07T12:59:25.749895  <8>[   23.395797] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-07T12:59:25.750167  /lava-426894/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65c383e840ddf66dcc8e2003

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c383e840ddf66dcc8e2006
        failing since 56 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-07T13:21:31.091673  / # #
    2024-02-07T13:21:31.193995  export SHELL=3D/bin/sh
    2024-02-07T13:21:31.194745  #
    2024-02-07T13:21:31.296151  / # export SHELL=3D/bin/sh. /lava-426915/en=
vironment
    2024-02-07T13:21:31.296900  =

    2024-02-07T13:21:31.398161  / # . /lava-426915/environment/lava-426915/=
bin/lava-test-runner /lava-426915/1
    2024-02-07T13:21:31.399160  =

    2024-02-07T13:21:31.403497  / # /lava-426915/bin/lava-test-runner /lava=
-426915/1
    2024-02-07T13:21:31.472579  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T13:21:31.473015  + <8>[   20.980636] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 426915_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c383e840ddf66dcc8e2019
        failing since 56 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-07T13:21:33.905059  /lava-426915/1/../bin/lava-test-case
    2024-02-07T13:21:33.905523  <8>[   23.399972] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-07T13:21:33.905817  /lava-426915/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37fb88484cdfcc18e1e96

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c37fb88484cdfcc18e1=
e97
        new failure (last pass: next-20240206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 6          =


  Details:     https://kernelci.org/test/plan/id/65c3814cc595fb856e8e1e82

  Results:     161 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-probed: https://kernelci.org/test/case/id/6=
5c3814cc595fb856e8e1e9b
        new failure (last pass: next-20240125)

    2024-02-07T13:11:04.497197  /lava-12712930/1/../bin/lava-test-case

    2024-02-07T13:11:04.507938  <8>[   30.538709] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.panel-edp-driver-present: https://kernelci.org/test/cas=
e/id/65c3814cc595fb856e8e1ed2
        new failure (last pass: next-20240125)

    2024-02-07T13:10:58.182367  <8>[   24.212008] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpwm-backlight-probed RESULT=3Dpass>

    2024-02-07T13:10:59.195707  /lava-12712930/1/../bin/lava-test-case

    2024-02-07T13:10:59.206923  <8>[   25.238408] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.anx7625-probed: https://kernelci.org/test/case/id/65c38=
14cc595fb856e8e1ed7
        new failure (last pass: next-20240125)

    2024-02-07T13:10:58.081543  /lava-12712930/1/../bin/lava-test-case

    2024-02-07T13:10:58.091734  <8>[   24.122526] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danx7625-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/65c38=
14cc595fb856e8e1ed9
        new failure (last pass: next-20240125)

    2024-02-07T13:10:56.013559  <8>[   22.043592] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-driver-present RESULT=3Dpass>

    2024-02-07T13:10:57.029486  /lava-12712930/1/../bin/lava-test-case

    2024-02-07T13:10:57.040149  <8>[   23.071594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mipi-tx-probed: https://kernelci.org/test/case=
/id/65c3814cc595fb856e8e1edb
        new failure (last pass: next-20240125)

    2024-02-07T13:10:55.982021  /lava-12712930/1/../bin/lava-test-case

    2024-02-07T13:10:55.992085  <8>[   22.022769] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mipi-tx-probed RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c3814cc595fb856e8e1f2a
        new failure (last pass: next-20240125)

    2024-02-07T13:10:50.672618  + set +x

    2024-02-07T13:10:50.676109  <8>[   16.710447] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 12712930_1.5.2.3.1>

    2024-02-07T13:10:50.782280  / # #

    2024-02-07T13:10:50.882938  export SHELL=3D/bin/sh

    2024-02-07T13:10:50.883140  #

    2024-02-07T13:10:50.983674  / # export SHELL=3D/bin/sh. /lava-12712930/=
environment

    2024-02-07T13:10:50.983890  =


    2024-02-07T13:10:51.084435  / # . /lava-12712930/environment/lava-12712=
930/bin/lava-test-runner /lava-12712930/1

    2024-02-07T13:10:51.084743  =


    2024-02-07T13:10:51.090245  / # /lava-12712930/bin/lava-test-runner /la=
va-12712930/1
 =

    ... (16 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65c381af9308281eb08e1f3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c381af9308281eb08e1=
f3e
        new failure (last pass: next-20240125) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37edb4ef9b5d57e8e1ed8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c37edb4ef9b5d57e8e1=
ed9
        new failure (last pass: next-20240206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c383dc40ddf66dcc8e1ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c383dc40ddf66dcc8e1=
ed0
        new failure (last pass: next-20240202) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_riscv64                 | riscv | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c384e0ee22b5df0c8e1e82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/risc=
v/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c384e0ee22b5df0c8e1=
e83
        new failure (last pass: next-20240206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_smp8_riscv64            | riscv | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c384a2990d03acf28e1e79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c384a2990d03acf28e1=
e7a
        new failure (last pass: next-20240206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37d317c73d609ed8e1e89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c37d317c73d609ed8e1=
e8a
        failing since 0 day (last pass: next-20240202, first fail: next-202=
40206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37f05075725f7ce8e1ea6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37f05075725f7ce8e1eab
        failing since 183 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-02-07T13:00:22.314550  + set +x
    2024-02-07T13:00:22.317753  <8>[   28.472383] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1090070_1.5.2.4.1>
    2024-02-07T13:00:22.424739  / # #
    2024-02-07T13:00:23.881695  export SHELL=3D/bin/sh
    2024-02-07T13:00:23.902503  #
    2024-02-07T13:00:23.902837  / # export SHELL=3D/bin/sh
    2024-02-07T13:00:25.849945  / # . /lava-1090070/environment
    2024-02-07T13:00:29.432770  /lava-1090070/bin/lava-test-runner /lava-10=
90070/1
    2024-02-07T13:00:29.453593  . /lava-1090070/environment
    2024-02-07T13:00:29.453815  / # /lava-1090070/bin/lava-test-runner /lav=
a-1090070/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3822435b3171c688e1f17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3822435b3171c688e1=
f18
        failing since 442 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c3810b31d219dbe18e1ea9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3810b31d219dbe18e1=
eaa
        failing since 442 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c384aea2297594888e1e7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c384aea2297594888e1=
e7c
        new failure (last pass: next-20240125) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65c386179610b72d2d8e1f38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c386179610b72d2d8e1=
f39
        failing since 8 days (last pass: next-20240118, first fail: next-20=
240130) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65c38464009f456a9f8e1eb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c38464009f456a9f8e1=
eb2
        new failure (last pass: next-20240206) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37faa990d90d2ce8e1e9b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37faa990d90d2ce8e1ea0
        failing since 251 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-07T13:03:00.717388  / # #
    2024-02-07T13:03:00.819683  export SHELL=3D/bin/sh
    2024-02-07T13:03:00.820642  #
    2024-02-07T13:03:00.922119  / # export SHELL=3D/bin/sh. /lava-3921612/e=
nvironment
    2024-02-07T13:03:00.923010  =

    2024-02-07T13:03:01.024922  / # . /lava-3921612/environment/lava-392161=
2/bin/lava-test-runner /lava-3921612/1
    2024-02-07T13:03:01.026256  =

    2024-02-07T13:03:01.042409  / # /lava-3921612/bin/lava-test-runner /lav=
a-3921612/1
    2024-02-07T13:03:01.173230  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T13:03:01.174345  + cd /lava-3921612/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37f788a607ae13c8e1e7b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37f788a607ae13c8e1e80
        failing since 251 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-07T13:02:32.338048  + set +x[   21.782589] <LAVA_SIGNAL_ENDRUN =
0_dmesg 457081_1.5.2.4.1>
    2024-02-07T13:02:32.338361  =

    2024-02-07T13:02:32.446290  / # #
    2024-02-07T13:02:32.547889  export SHELL=3D/bin/sh
    2024-02-07T13:02:32.548432  #
    2024-02-07T13:02:32.649405  / # export SHELL=3D/bin/sh. /lava-457081/en=
vironment
    2024-02-07T13:02:32.650022  =

    2024-02-07T13:02:32.751070  / # . /lava-457081/environment/lava-457081/=
bin/lava-test-runner /lava-457081/1
    2024-02-07T13:02:32.751936  =

    2024-02-07T13:02:32.754854  / # /lava-457081/bin/lava-test-runner /lava=
-457081/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37b5b0d9c8bf9378e1ef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37b5b0d9c8bf9378e1efa
        failing since 251 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-07T12:45:03.457355  + set +x
    2024-02-07T12:45:03.457574  <8>[   12.433825] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3921529_1.5.2.4.1>
    2024-02-07T12:45:03.562299  / # #
    2024-02-07T12:45:03.663905  export SHELL=3D/bin/sh
    2024-02-07T12:45:03.664495  #
    2024-02-07T12:45:03.765375  / # export SHELL=3D/bin/sh. /lava-3921529/e=
nvironment
    2024-02-07T12:45:03.765961  =

    2024-02-07T12:45:03.866831  / # . /lava-3921529/environment/lava-392152=
9/bin/lava-test-runner /lava-3921529/1
    2024-02-07T12:45:03.867862  =

    2024-02-07T12:45:03.912060  / # /lava-3921529/bin/lava-test-runner /lav=
a-3921529/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37e95470a8f80b68e1e7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37e95470a8f80b68e1e7f
        failing since 245 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-07T12:58:33.342242  + set +x
    2024-02-07T12:58:33.344022  <8>[   13.625497] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3921542_1.5.2.4.1>
    2024-02-07T12:58:33.449231  / # #
    2024-02-07T12:58:33.551416  export SHELL=3D/bin/sh
    2024-02-07T12:58:33.552155  #
    2024-02-07T12:58:33.653458  / # export SHELL=3D/bin/sh. /lava-3921542/e=
nvironment
    2024-02-07T12:58:33.654421  =

    2024-02-07T12:58:33.756220  / # . /lava-3921542/environment/lava-392154=
2/bin/lava-test-runner /lava-3921542/1
    2024-02-07T12:58:33.756788  =

    2024-02-07T12:58:33.775408  / # /lava-3921542/bin/lava-test-runner /lav=
a-3921542/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65c38019c7d7ddfadf8e1e93

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c38019c7d7ddfadf8e1e98
        failing since 251 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-07T13:05:03.769444  / # #
    2024-02-07T13:05:03.871843  export SHELL=3D/bin/sh
    2024-02-07T13:05:03.872901  #
    2024-02-07T13:05:03.974411  / # export SHELL=3D/bin/sh. /lava-3921615/e=
nvironment
    2024-02-07T13:05:03.975251  =

    2024-02-07T13:05:04.076873  / # . /lava-3921615/environment/lava-392161=
5/bin/lava-test-runner /lava-3921615/1
    2024-02-07T13:05:04.078137  =

    2024-02-07T13:05:04.094241  / # /lava-3921615/bin/lava-test-runner /lav=
a-3921615/1
    2024-02-07T13:05:04.212891  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T13:05:04.213489  + cd /lava-3921615/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37b53cd7ab0a4168e1e79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37b53cd7ab0a4168e1e7e
        failing since 251 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-07T12:44:47.155413  + set +x
    2024-02-07T12:44:47.157381  [   19.623461] <LAVA_SIGNAL_ENDRUN 0_dmesg =
457070_1.5.2.4.1>
    2024-02-07T12:44:47.265772  / # #
    2024-02-07T12:44:47.367519  export SHELL=3D/bin/sh
    2024-02-07T12:44:47.368131  #
    2024-02-07T12:44:47.469123  / # export SHELL=3D/bin/sh. /lava-457070/en=
vironment
    2024-02-07T12:44:47.469650  =

    2024-02-07T12:44:47.570676  / # . /lava-457070/environment/lava-457070/=
bin/lava-test-runner /lava-457070/1
    2024-02-07T12:44:47.571531  =

    2024-02-07T12:44:47.574588  / # /lava-457070/bin/lava-test-runner /lava=
-457070/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37e8c25a97c40028e1e9d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37e8c25a97c40028e1ea2
        failing since 245 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-07T12:58:21.509201  + set +x[   19.578605] <LAVA_SIGNAL_ENDRUN =
0_dmesg 457071_1.5.2.4.1>
    2024-02-07T12:58:21.509479  =

    2024-02-07T12:58:21.617105  / # #
    2024-02-07T12:58:21.718538  export SHELL=3D/bin/sh
    2024-02-07T12:58:21.719036  #
    2024-02-07T12:58:21.819927  / # export SHELL=3D/bin/sh. /lava-457071/en=
vironment
    2024-02-07T12:58:21.820404  =

    2024-02-07T12:58:21.921354  / # . /lava-457071/environment/lava-457071/=
bin/lava-test-runner /lava-457071/1
    2024-02-07T12:58:21.922116  =

    2024-02-07T12:58:21.924841  / # /lava-457071/bin/lava-test-runner /lava=
-457071/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37fdd99122aae1e8e1ea5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37fdd99122aae1e8e1eaa
        failing since 251 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-07T13:04:14.365382  + set +x
    2024-02-07T13:04:14.367455  [   23.936423] <LAVA_SIGNAL_ENDRUN 0_dmesg =
457083_1.5.2.4.1>
    2024-02-07T13:04:14.475926  / # #
    2024-02-07T13:04:14.577626  export SHELL=3D/bin/sh
    2024-02-07T13:04:14.578239  #
    2024-02-07T13:04:14.679219  / # export SHELL=3D/bin/sh. /lava-457083/en=
vironment
    2024-02-07T13:04:14.679768  =

    2024-02-07T13:04:14.780761  / # . /lava-457083/environment/lava-457083/=
bin/lava-test-runner /lava-457083/1
    2024-02-07T13:04:14.781559  =

    2024-02-07T13:04:14.784197  / # /lava-457083/bin/lava-test-runner /lava=
-457083/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c37a00a5a7b4b53e8e1e9a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c37a00a5a7b4b53e8e1e9f
        failing since 58 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-07T12:39:02.696975  / # #
    2024-02-07T12:39:02.798308  export SHELL=3D/bin/sh
    2024-02-07T12:39:02.798799  #
    2024-02-07T12:39:02.899662  / # export SHELL=3D/bin/sh. /lava-3921510/e=
nvironment
    2024-02-07T12:39:02.900229  =

    2024-02-07T12:39:03.001092  / # . /lava-3921510/environment/lava-392151=
0/bin/lava-test-runner /lava-3921510/1
    2024-02-07T12:39:03.001799  =

    2024-02-07T12:39:03.025809  / # /lava-3921510/bin/lava-test-runner /lav=
a-3921510/1
    2024-02-07T12:39:03.104899  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T12:39:03.143669  + cd /lava-3921510/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c379eca5a7b4b53e8e1e7f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240207/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240207/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c379eca5a7b4b53e8e1e84
        failing since 54 days (last pass: next-20231213, first fail: next-2=
0231214)

    2024-02-07T12:38:53.868233  <8>[    9.987860] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3921511_1.5.2.4.1>
    2024-02-07T12:38:53.973212  / # #
    2024-02-07T12:38:54.074624  export SHELL=3D/bin/sh
    2024-02-07T12:38:54.075081  #
    2024-02-07T12:38:54.175928  / # export SHELL=3D/bin/sh. /lava-3921511/e=
nvironment
    2024-02-07T12:38:54.176463  =

    2024-02-07T12:38:54.277342  / # . /lava-3921511/environment/lava-392151=
1/bin/lava-test-runner /lava-3921511/1
    2024-02-07T12:38:54.278122  =

    2024-02-07T12:38:54.320892  / # /lava-3921511/bin/lava-test-runner /lav=
a-3921511/1
    2024-02-07T12:38:54.434027  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20

