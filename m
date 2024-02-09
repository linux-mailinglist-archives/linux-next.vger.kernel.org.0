Return-Path: <linux-next+bounces-1107-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D28484FA69
	for <lists+linux-next@lfdr.de>; Fri,  9 Feb 2024 18:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AD4C1F2434D
	for <lists+linux-next@lfdr.de>; Fri,  9 Feb 2024 17:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15E137163;
	Fri,  9 Feb 2024 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="04webzjY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CF17B3EE
	for <linux-next@vger.kernel.org>; Fri,  9 Feb 2024 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497890; cv=none; b=daIOxG5HQU28zzPZ+2rBoXoELgmBPwCRTkdhF5ptjBcSHlPlQ/gmtfG5xRuapvkuJ4jLqJYVQgoNTycdyIeBBxhA5++VEYMnQ3CgbACt1iIVR4dLBFs2SAabc49U7FQohJBVoy3fj1slCL9MpWR8rqBX39lpN03/ygrAiDm0Igk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497890; c=relaxed/simple;
	bh=2i3ULJv+lETcNmLRKkoeUOChRkq8H1sSMZDB+LIHaWE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Zh0GT0tyOu11x8eWs9E6+3d4XRHmIskPYygdtCVuhhQdUO69cj8ByK0U2b8agz3zimVfsqGNIQddNjkqs8ViHCFMHh6Ou9m7qgXkC4BaNg1Sykzq//1pDPTu0QAqP5be27GDTxJoXlwyShxAz/l2Vm/kXs+6O6Jp4sf8sk4wyJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=04webzjY; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bba50cd318so808776b6e.0
        for <linux-next@vger.kernel.org>; Fri, 09 Feb 2024 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707497886; x=1708102686; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1sETcI2QAc9Hu0C002eaBTe/XICdgnAIQI83kI76E/0=;
        b=04webzjYHZqlDspnLJMNsRKyBlTF4alJA69S9lRedDDVLoeJcb6H8j9bep+cIJ9Gsm
         Hgo3PiGkgrpJ4+dy1pp+W2iFcSgLS9onRCAo/fo+Y/+F6/1bPDqFXgSkBmt8wHd/az6j
         1NjsAVMQH4zU5zQQanLlnap3zd9AIIbupmJcIprR+Re6jz4MmtHXDwCBpUT0OmCQOCJS
         X7ET/MhISqQPYbaIT8kf7n8UotNDrTQviTGxzJurZyCbl3U433fR6rRgewXG94caNb15
         horcI/x6nXO6dWiV4DhlyFjtyjv5qR2LOfELDNQlKC6Ku15UtLyHj+e3jEDfmAMtETlD
         ckkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707497886; x=1708102686;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sETcI2QAc9Hu0C002eaBTe/XICdgnAIQI83kI76E/0=;
        b=U+OrgEv3tDJkGzur/iozgWhV1xZqVSfekLNuY0FcMuehcFrgTIHT725vfsSFWOao7N
         dC5db3/jdLDrc0XF3F4Cy5L6kAmFMadZX7AuCqRQRF4zuk8IDY1ND5TP3yRXQWND2Phf
         jibwM3tyh1ksnM3ji4tGPjq8YWEZaE7wc5k6DzTS+zG55A0mu+SI9A9bfyksR4ta/LKN
         ZxC2oUykMJUfR2U6sV+k0DGLAtHzg31+jgL9cE9BCmmoznOWchOX6ks1QKvYTzqWQ4b+
         ZDD5ogRsJO28ffCRsINklKiTCncyir80C80tUoFGwxxZkTL/3OvpVSP5IR4G1NAAqFPO
         CJiw==
X-Gm-Message-State: AOJu0Yy7RU7Jiv7wtPDuFTAHtXXlEGKY3w2Prnouh5rNzfbwILmTa0kj
	zd5neMUb/SPHUnnfjrVmNTqsOE49THV2vTS8UKCy7Ytxx2UMYxViwmL1zVnku24JkuzsH3GAumF
	8hOQ=
X-Google-Smtp-Source: AGHT+IEWmlIEL8ezeK08PmGEpiIL3bFTxwwrUm1KAqIQOg4ut9Y6B7yFM7bKkdlg9Xze6cwT7AGy3w==
X-Received: by 2002:a05:6870:3325:b0:219:7ce9:6086 with SMTP id x37-20020a056870332500b002197ce96086mr2536970oae.57.1707497885569;
        Fri, 09 Feb 2024 08:58:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWburg/nJUYiTQjl5QNcAPiFYhqqdCTRQh38ktibqThM5mOqHE4D67kJdg0T/SXL3Y3+plj5lk7GMPQy5nGNmhlv1FgwoottPDp7B4Z3YQl0Tf7UByA9HbfED7lzn6yacjXcVlzVMsfT5X3elyhjwjdWg==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x9-20020a654149000000b005dc4ed5949asm1789980pgp.59.2024.02.09.08.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 08:58:04 -0800 (PST)
Message-ID: <65c6599c.650a0220.ce1ba.5db8@mx.google.com>
Date: Fri, 09 Feb 2024 08:58:04 -0800 (PST)
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
X-Kernelci-Kernel: next-20240209
Subject: next/master baseline: 293 runs, 37 regressions (next-20240209)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 293 runs, 37 regressions (next-20240209)

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

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig                    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 6          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 6          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 2          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240209/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240209
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      445a555e0623387fa9b94e68e61681717e70200a =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61707465b1f8b6c8e1eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c61707465b1f8b6c8e1=
ebb
        failing since 373 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61cf84670360ce78e1e86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c61cf84670360ce78e1=
e87
        failing since 249 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65c623613323e633558e1ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c623613323e633558e1=
ed3
        failing since 15 days (last pass: next-20240124, first fail: next-2=
0240125) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65c620e924d212f5188e1ec3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c620e924d212f5188e1=
ec4
        new failure (last pass: next-20240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c623d7fab27e1c358e1e87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c623d7fab27e1c358e1=
e88
        failing since 668 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65c61aeda87a9c49d18e1ee4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c61aeda87a9c49d18e1ee7
        failing since 58 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-09T12:30:24.348126  / # #
    2024-02-09T12:30:24.450270  export SHELL=3D/bin/sh
    2024-02-09T12:30:24.451015  #
    2024-02-09T12:30:24.552356  / # export SHELL=3D/bin/sh. /lava-427766/en=
vironment
    2024-02-09T12:30:24.553099  =

    2024-02-09T12:30:24.654577  / # . /lava-427766/environment/lava-427766/=
bin/lava-test-runner /lava-427766/1
    2024-02-09T12:30:24.655813  =

    2024-02-09T12:30:24.674908  / # /lava-427766/bin/lava-test-runner /lava=
-427766/1
    2024-02-09T12:30:24.718396  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-09T12:30:24.718821  + <8>[   20.808618] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 427766_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c61aeda87a9c49d18e1eeb
        failing since 58 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-09T12:30:26.827030  /lava-427766/1/../bin/lava-test-case
    2024-02-09T12:30:26.827452  <8>[   22.918376] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-09T12:30:26.827759  /lava-427766/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c61aeda87a9c49d18e1eed
        failing since 58 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-09T12:30:27.886303  /lava-427766/1/../bin/lava-test-case
    2024-02-09T12:30:27.886775  <8>[   23.956883] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-09T12:30:27.887078  /lava-427766/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c61aeda87a9c49d18e1ef2
        failing since 58 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-09T12:30:28.961807  /lava-427766/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c61aeda87a9c49d18e1ef3
        failing since 58 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-09T12:30:28.965111  <8>[   25.070377] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-09T12:30:30.019624  /lava-427766/1/../bin/lava-test-case
    2024-02-09T12:30:30.020051  <8>[   26.091886] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-09T12:30:30.020351  /lava-427766/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65c619fd764903219c8e1eb5

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c619fd764903219c8e1eb8
        failing since 58 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-09T12:26:27.558959  / # #
    2024-02-09T12:26:27.660450  export SHELL=3D/bin/sh
    2024-02-09T12:26:27.661212  #
    2024-02-09T12:26:27.762197  / # export SHELL=3D/bin/sh. /lava-427761/en=
vironment
    2024-02-09T12:26:27.762896  =

    2024-02-09T12:26:27.864754  / # . /lava-427761/environment/lava-427761/=
bin/lava-test-runner /lava-427761/1
    2024-02-09T12:26:27.865765  =

    2024-02-09T12:26:27.910201  / # /lava-427761/bin/lava-test-runner /lava=
-427761/1
    2024-02-09T12:26:27.937815  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-09T12:26:27.938273  + <8>[   20.987363] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 427761_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c619fd764903219c8e1ecb
        failing since 58 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-09T12:26:30.369415  /lava-427761/1/../bin/lava-test-case
    2024-02-09T12:26:30.369559  <8>[   23.410642] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-09T12:26:30.369628  /lava-427761/1/../bin/lava-test-case
    2024-02-09T12:26:30.369689  <8>[   23.428329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-09T12:26:30.369750  /lava-427761/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 6          =


  Details:     https://kernelci.org/test/plan/id/65c61ea50f2c9261658e1edb

  Results:     161 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-probed: https://kernelci.org/test/case/id/6=
5c61ea50f2c9261658e1ef4
        failing since 6 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-09T12:46:12.475789  /lava-12726121/1/../bin/lava-test-case

    2024-02-09T12:46:12.482579  <8>[   30.718047] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.panel-edp-driver-present: https://kernelci.org/test/cas=
e/id/65c61ea50f2c9261658e1f2b
        failing since 6 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-09T12:46:07.199465  /lava-12726121/1/../bin/lava-test-case

    2024-02-09T12:46:07.209282  <8>[   25.442296] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.anx7625-probed: https://kernelci.org/test/case/id/65c61=
ea50f2c9261658e1f30
        failing since 6 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-09T12:46:06.088537  /lava-12726121/1/../bin/lava-test-case

    2024-02-09T12:46:06.094957  <8>[   24.330899] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danx7625-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/65c61=
ea50f2c9261658e1f32
        failing since 6 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-09T12:46:05.041708  /lava-12726121/1/../bin/lava-test-case

    2024-02-09T12:46:05.048322  <8>[   23.283865] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mipi-tx-probed: https://kernelci.org/test/case=
/id/65c61ea50f2c9261658e1f34
        failing since 6 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-09T12:46:02.972125  <8>[   21.203956] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mipi-tx-driver-present RESULT=3Dpass>

    2024-02-09T12:46:03.989798  /lava-12726121/1/../bin/lava-test-case

    2024-02-09T12:46:03.999947  <8>[   22.233529] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mipi-tx-probed RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c61ea50f2c9261658e1f83
        failing since 6 days (last pass: next-20240118, first fail: next-20=
240202)

    2024-02-09T12:45:58.661991  + <8>[   16.898464] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 12726121_1.5.2.3.1>

    2024-02-09T12:45:58.662452  set +x

    2024-02-09T12:45:58.770120  / # #

    2024-02-09T12:45:58.872491  export SHELL=3D/bin/sh

    2024-02-09T12:45:58.873291  #

    2024-02-09T12:45:58.974859  / # export SHELL=3D/bin/sh. /lava-12726121/=
environment

    2024-02-09T12:45:58.975655  =


    2024-02-09T12:45:59.077185  / # . /lava-12726121/environment/lava-12726=
121/bin/lava-test-runner /lava-12726121/1

    2024-02-09T12:45:59.078322  =


    2024-02-09T12:45:59.084382  / # /lava-12726121/bin/lava-test-runner /la=
va-12726121/1
 =

    ... (16 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 6          =


  Details:     https://kernelci.org/test/plan/id/65c61f49a055050a448e1ea1

  Results:     161 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-probed: https://kernelci.org/test/case/id/6=
5c61f49a055050a448e1eba
        failing since 1 day (last pass: next-20240125, first fail: next-202=
40207)

    2024-02-09T12:48:52.947151  /lava-12726179/1/../bin/lava-test-case

    2024-02-09T12:48:52.957588  <8>[   30.671283] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.panel-edp-driver-present: https://kernelci.org/test/cas=
e/id/65c61f49a055050a448e1ef1
        failing since 1 day (last pass: next-20240125, first fail: next-202=
40207)

    2024-02-09T12:48:46.623573  <8>[   24.336134] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpwm-backlight-probed RESULT=3Dpass>

    2024-02-09T12:48:47.637061  /lava-12726179/1/../bin/lava-test-case

    2024-02-09T12:48:47.648239  <8>[   25.361831] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.anx7625-probed: https://kernelci.org/test/case/id/65c61=
f49a055050a448e1ef6
        failing since 1 day (last pass: next-20240125, first fail: next-202=
40207)

    2024-02-09T12:48:46.523735  /lava-12726179/1/../bin/lava-test-case

    2024-02-09T12:48:46.530666  <8>[   24.246724] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danx7625-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/65c61=
f49a055050a448e1ef8
        failing since 1 day (last pass: next-20240125, first fail: next-202=
40207)

    2024-02-09T12:48:45.476332  /lava-12726179/1/../bin/lava-test-case

    2024-02-09T12:48:45.482948  <8>[   23.198858] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mipi-tx-probed: https://kernelci.org/test/case=
/id/65c61f49a055050a448e1efa
        failing since 1 day (last pass: next-20240125, first fail: next-202=
40207)

    2024-02-09T12:48:44.428163  /lava-12726179/1/../bin/lava-test-case

    2024-02-09T12:48:44.434729  <8>[   22.150458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mipi-tx-probed RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c61f49a055050a448e1f49
        failing since 1 day (last pass: next-20240125, first fail: next-202=
40207)

    2024-02-09T12:48:39.135600  + set +x

    2024-02-09T12:48:39.142002  <8>[   16.856372] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 12726179_1.5.2.3.1>

    2024-02-09T12:48:39.246709  / # #

    2024-02-09T12:48:39.347360  export SHELL=3D/bin/sh

    2024-02-09T12:48:39.347599  #

    2024-02-09T12:48:39.448208  / # export SHELL=3D/bin/sh. /lava-12726179/=
environment

    2024-02-09T12:48:39.448523  =


    2024-02-09T12:48:39.549259  / # . /lava-12726179/environment/lava-12726=
179/bin/lava-test-runner /lava-12726179/1

    2024-02-09T12:48:39.549534  =


    2024-02-09T12:48:39.555015  / # /lava-12726179/bin/lava-test-runner /la=
va-12726179/1
 =

    ... (18 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61f8e13a686d84d8e1e92

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c61f8e13a686d84d8e1=
e93
        new failure (last pass: next-20240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61f3169d9333a8f8e204f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c61f3169d9333a8f8e2=
050
        failing since 1 day (last pass: next-20240125, first fail: next-202=
40207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c624de21717f99b18e1eb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c624de21717f99b18e1=
eb8
        failing since 444 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c623dae78fadb7a58e1e79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c623dae78fadb7a58e1=
e7a
        failing since 444 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61b5fcc5195a6488e1f4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c61b5fcc5195a6488e1=
f4c
        failing since 1 day (last pass: next-20240125, first fail: next-202=
40207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65c6236a3323e633558e1ed5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c6236a3323e633558e1=
ed6
        failing since 10 days (last pass: next-20240118, first fail: next-2=
0240130) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65c6229e5a7d101a418e1fb4

  Results:     42 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65c6229e5a7d101=
a418e1fe5
        new failure (last pass: next-20240207)
        2 lines

    2024-02-09T13:03:04.998073  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2024-02-09T13:03:05.009514  kern  :emerg : Code: a94153f3 a8c57bfd d503=
23bf d6<8>[   17.955350] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-02-09T13:03:05.009863  5f03c0 (d4210000)    =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65c6229e5a7d101a=
418e1fe7
        new failure (last pass: next-20240207)
        1 lines

    2024-02-09T13:03:04.391841  / # =

    2024-02-09T13:03:04.397188  =

    2024-02-09T13:03:04.500745  / # #
    2024-02-09T13:03:04.506099  #
    2024-02-09T13:03:04.607759  / # export SHELL=3D/bin/sh
    2024-02-09T13:03:04.613178  export SHELL=3D/bin/sh
    2024-02-09T13:03:04.714867  / # . /lava-562416/environment
    2024-02-09T13:03:04.720565  . /lava-562416/environment
    2024-02-09T13:03:04.821873  / # /lava-562416/bin/lava-test-runner /lava=
-562416/0
    2024-02-09T13:03:04.826774  /lava-562416/bin/lava-test-runner /lava-562=
416/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61b0a9bad9e932d8e1e90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c61b0a9bad9e932d8e1=
e91
        new failure (last pass: next-20240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61b04629235490a8e1e7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c61b04629235490a8e1=
e7d
        new failure (last pass: next-20240207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61d7509f358d6f58e1f01

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c61d7509f358d6f58e1f06
        failing since 253 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-09T12:41:05.226097  / # #
    2024-02-09T12:41:05.328796  export SHELL=3D/bin/sh
    2024-02-09T12:41:05.329726  #
    2024-02-09T12:41:05.431301  / # export SHELL=3D/bin/sh. /lava-3923861/e=
nvironment
    2024-02-09T12:41:05.432208  =

    2024-02-09T12:41:05.533758  / # . /lava-3923861/environment/lava-392386=
1/bin/lava-test-runner /lava-3923861/1
    2024-02-09T12:41:05.535246  =

    2024-02-09T12:41:05.551047  / # /lava-3923861/bin/lava-test-runner /lav=
a-3923861/1
    2024-02-09T12:41:05.660400  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-09T12:41:05.660847  + cd /lava-3923861/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61d6234aefdf05e8e1ec8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c61d6234aefdf05e8e1ecd
        failing since 253 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-09T12:40:52.212536  + set +x
    2024-02-09T12:40:52.214283  [   23.516846] <LAVA_SIGNAL_ENDRUN 0_dmesg =
457390_1.5.2.4.1>
    2024-02-09T12:40:52.322652  / # #
    2024-02-09T12:40:52.424252  export SHELL=3D/bin/sh
    2024-02-09T12:40:52.424822  #
    2024-02-09T12:40:52.525812  / # export SHELL=3D/bin/sh. /lava-457390/en=
vironment
    2024-02-09T12:40:52.526388  =

    2024-02-09T12:40:52.627376  / # . /lava-457390/environment/lava-457390/=
bin/lava-test-runner /lava-457390/1
    2024-02-09T12:40:52.628228  =

    2024-02-09T12:40:52.630697  / # /lava-457390/bin/lava-test-runner /lava=
-457390/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65c61c9378de9172868e1e8c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240209/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240209/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c61c9378de9172868e1e91
        failing since 60 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-09T12:37:21.904953  / # #
    2024-02-09T12:37:22.006163  export SHELL=3D/bin/sh
    2024-02-09T12:37:22.006538  #
    2024-02-09T12:37:22.107362  / # export SHELL=3D/bin/sh. /lava-3923857/e=
nvironment
    2024-02-09T12:37:22.107734  =

    2024-02-09T12:37:22.208568  / # . /lava-3923857/environment/lava-392385=
7/bin/lava-test-runner /lava-3923857/1
    2024-02-09T12:37:22.209158  =

    2024-02-09T12:37:22.217582  / # /lava-3923857/bin/lava-test-runner /lav=
a-3923857/1
    2024-02-09T12:37:22.353584  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-09T12:37:22.354028  + cd /lava-3923857/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

