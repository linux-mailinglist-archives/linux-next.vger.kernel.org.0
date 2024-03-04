Return-Path: <linux-next+bounces-1456-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A610E86FF22
	for <lists+linux-next@lfdr.de>; Mon,  4 Mar 2024 11:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5521A284CE4
	for <lists+linux-next@lfdr.de>; Mon,  4 Mar 2024 10:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C826282E3;
	Mon,  4 Mar 2024 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="UQhq4aua"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB182374B
	for <linux-next@vger.kernel.org>; Mon,  4 Mar 2024 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709548393; cv=none; b=Bk0pwpV7Pry56kf7QlyaPprK3/mcmFyuKWlDARQl4XSNHOAK6ATDFY4/Juoe9OslmXyWMpxSsyZF2gzLrAyUJAJwkT5aqWcdKB3SrHqu3m9F6KMOpkUi5FJz52911rh0/ZFaaOZAfv2p8eDu35H+3bQXa9huFsiHfSGvunJ5v3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709548393; c=relaxed/simple;
	bh=CqXSfIestk5fbQplUbn2PrmVMN+aXShzLwCZ0+cKX28=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hgMGHOcDjfQQE7NlmF0yn1GUKLYztXC6QAhL8fYI5d8rfabvlR5VQvENFcRMZPsmoh5Aip1unmZcszC4KG12sHoowFniR5ZUydrzp1N/JFwy+JN9hEQZpDmVrZRzIWWK9VGzwDdFqXMzcGOKuUAGkRLO8GhLpfN/nXryvSQfLiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=UQhq4aua; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e58d259601so2710859b3a.3
        for <linux-next@vger.kernel.org>; Mon, 04 Mar 2024 02:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709548389; x=1710153189; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=shgrqXNgaIMM/Rtt4BNvtCaIk83KbIU6OAGmevEDmOE=;
        b=UQhq4auaJvYaOIq6vD7wWbWl7wU+qmPNKm4IeCLWt5HR5VpO6FCXlupPi1/flFehAP
         Wk4v+HRz1o6uspS0f/+qGio6nQtF/kTPJn5Lr81D2tZIZwRI0CRm+o6LTTqm1aaKGAUj
         UWgy6prQqTKzHqLkRj1L+KZ95nGfMym5ZXR9mOkj0NMV4JuU2YOn7U+OeNoJYeXtcYRw
         ZCxK3FBqo8mzADaR7baeSrDF1FBvxSRXXRatFSsUS5MF9tqEl7BRmEYKhxu7mf0Gg2Zt
         2Qp1NZBxyiCK+0uW1L/nRtvY05LHJMgwxxKpDFOROu7RQdV5tAj44c7cHQ6ftk6rFhzn
         +ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709548389; x=1710153189;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shgrqXNgaIMM/Rtt4BNvtCaIk83KbIU6OAGmevEDmOE=;
        b=vlKraUf6rJRaJVjevjQLD6khYFzv1VJ6OiN3L6oh2HBgZ1IC4JPRjIuxHZRxHMrk5U
         tqvRZgtRav6A8LZOdpko/suc4fYwvrUYdqlEzzmiCT6LJzo0RVOUN5K1bTHMNA/OguON
         jKC+6Y2IjZjRw2+8pOg1fAOXjhHtlEo10vYxxMSLqHhBj/p4hXoJxN3PKmWApEPlk0SQ
         CriIdOz7zRFnvVZcZtCwNPOg9DFSsAmCv21Y9qqIY4zMDfvrZYF9uXa5ey6aKM32kZHC
         mgfgdw9sv2ZsGRuDqNjhRLPL7V+5Pgoa5mz0f0XpkXSqa6OXXAbHWQVpwlvun9qU/djq
         XhOQ==
X-Gm-Message-State: AOJu0YygeW/DBoqDEJjkGraHDSyMyEEdhAcYJ0WJE7cHScxV8ciTCETF
	p520OYC1wmOwOsTPGbVj/63k+uLM4US76yK4GvjsPUTJk8EuyTMkGRZ0EVlbDjVTYVwqGI/EjcY
	6Qpo=
X-Google-Smtp-Source: AGHT+IEal2570sjMQVMKD9d8wqpS1nK6yBD8BIWz1jc68wRJIol3ZxRL2qiv8a523uwnzYN77hIc/g==
X-Received: by 2002:a05:6a21:3947:b0:1a1:44c9:2d8d with SMTP id ac7-20020a056a21394700b001a144c92d8dmr7612246pzc.37.1709548389048;
        Mon, 04 Mar 2024 02:33:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902e9c400b001d7252fef6bsm8127048plk.299.2024.03.04.02.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 02:33:08 -0800 (PST)
Message-ID: <65e5a364.170a0220.6fedf.e361@mx.google.com>
Date: Mon, 04 Mar 2024 02:33:08 -0800 (PST)
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
X-Kernelci-Kernel: next-20240304
X-Kernelci-Report-Type: test
Subject: next/master baseline: 304 runs, 34 regressions (next-20240304)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 304 runs, 34 regressions (next-20240304)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

meson-sm1-s90...libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-s90...libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 2          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240304/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240304
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      67908bf6954b7635d33760ff6dfc189fc26ccc89 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e569b1ac31a7bdfb63702f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e569b1ac31a7bdfb637=
030
        failing since 4 days (last pass: next-20240226, first fail: next-20=
240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65e56b0619916c590663706b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e56b0619916c5906637=
06c
        failing since 273 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e569a4ac31a7bdfb637025

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e569a4ac31a7bdfb637=
026
        failing since 4 days (last pass: next-20240226, first fail: next-20=
240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e569a2ac31a7bdfb637017

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e569a2ac31a7bdfb637=
018
        failing since 4 days (last pass: next-20240226, first fail: next-20=
240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65e563f26481603634637037

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e563f3648160363463703e
        failing since 82 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-04T06:02:01.148785  <8>[   20.441826] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438467_1.5.2.4.1>
    2024-03-04T06:02:01.253899  / # #
    2024-03-04T06:02:01.355896  export SHELL=3D/bin/sh
    2024-03-04T06:02:01.356681  #
    2024-03-04T06:02:01.458112  / # export SHELL=3D/bin/sh. /lava-438467/en=
vironment
    2024-03-04T06:02:01.458879  =

    2024-03-04T06:02:01.560310  / # . /lava-438467/environment/lava-438467/=
bin/lava-test-runner /lava-438467/1
    2024-03-04T06:02:01.561570  =

    2024-03-04T06:02:01.580875  / # /lava-438467/bin/lava-test-runner /lava=
-438467/1
    2024-03-04T06:02:01.624822  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65e563f36481603634637042
        failing since 82 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-04T06:02:03.731313  /lava-438467/1/../bin/lava-test-case
    2024-03-04T06:02:03.731791  <8>[   23.007237] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-04T06:02:03.732089  /lava-438467/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
e563f36481603634637044
        failing since 82 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-04T06:02:04.792011  /lava-438467/1/../bin/lava-test-case
    2024-03-04T06:02:04.792431  <8>[   24.045281] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-04T06:02:04.792740  /lava-438467/1/../bin/lava-test-case
    2024-03-04T06:02:04.793024  <8>[   24.062793] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e563f36481603634637049
        failing since 82 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-04T06:02:05.868012  /lava-438467/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65e563f3648160363463704a
        failing since 82 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-04T06:02:05.871180  <8>[   25.160665] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-04T06:02:06.925270  /lava-438467/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65e565bdf1db1e5f5f637016

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e565bdf1db1e5f5f63701d
        failing since 81 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-04T06:09:41.484918  / # #
    2024-03-04T06:09:41.585486  export SHELL=3D/bin/sh
    2024-03-04T06:09:41.585680  #
    2024-03-04T06:09:41.686129  / # export SHELL=3D/bin/sh. /lava-438485/en=
vironment
    2024-03-04T06:09:41.686367  =

    2024-03-04T06:09:41.786826  / # . /lava-438485/environment/lava-438485/=
bin/lava-test-runner /lava-438485/1
    2024-03-04T06:09:41.787106  =

    2024-03-04T06:09:41.799546  / # /lava-438485/bin/lava-test-runner /lava=
-438485/1
    2024-03-04T06:09:41.850067  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-04T06:09:41.850156  + <8>[   20.676037] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 438485_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65e565bdf1db1e5f5f637021
        failing since 81 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-04T06:09:43.958368  /lava-438485/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
e565bdf1db1e5f5f637023
        failing since 81 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-04T06:09:45.020475  /lava-438485/1/../bin/lava-test-case
    2024-03-04T06:09:45.020614  <8>[   23.824409] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-04T06:09:45.020715  /lava-438485/1/../bin/lava-test-case
    2024-03-04T06:09:45.020800  <8>[   23.843453] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-03-04T06:09:45.020883  /lava-438485/1/../bin/lava-test-case
    2024-03-04T06:09:45.020964  <8>[   23.862858] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2024-03-04T06:09:45.021043  /lava-438485/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e565bdf1db1e5f5f637028
        failing since 81 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-04T06:09:46.096588  /lava-438485/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65e565bdf1db1e5f5f637029
        failing since 81 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-04T06:09:46.099775  <8>[   24.940307] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-04T06:09:47.155851  /lava-438485/1/../bin/lava-test-case
    2024-03-04T06:09:47.156323  <8>[   25.962653] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-04T06:09:47.156689  /lava-438485/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65e563f10f10201c79637015

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e563f10f10201c7963701c
        failing since 82 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-04T06:02:14.128525  / # #
    2024-03-04T06:02:14.230489  export SHELL=3D/bin/sh
    2024-03-04T06:02:14.231298  #
    2024-03-04T06:02:14.332817  / # export SHELL=3D/bin/sh. /lava-438465/en=
vironment
    2024-03-04T06:02:14.333571  =

    2024-03-04T06:02:14.435108  / # . /lava-438465/environment/lava-438465/=
bin/lava-test-runner /lava-438465/1
    2024-03-04T06:02:14.436321  =

    2024-03-04T06:02:14.440254  / # /lava-438465/bin/lava-test-runner /lava=
-438465/1
    2024-03-04T06:02:14.509477  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-04T06:02:14.509960  + <8>[   20.975659] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 438465_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e563f10f10201c7963702f
        failing since 82 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-04T06:02:16.939312  /lava-438465/1/../bin/lava-test-case
    2024-03-04T06:02:16.939756  <8>[   23.395897] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-04T06:02:16.940052  /lava-438465/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65e565f9e04a516c8d637038

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e565fae04a516c8d63703f
        failing since 81 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-04T06:10:45.979189  / # #
    2024-03-04T06:10:46.080067  export SHELL=3D/bin/sh
    2024-03-04T06:10:46.080339  #
    2024-03-04T06:10:46.180906  / # export SHELL=3D/bin/sh. /lava-438483/en=
vironment
    2024-03-04T06:10:46.181330  =

    2024-03-04T06:10:46.281968  / # . /lava-438483/environment/lava-438483/=
bin/lava-test-runner /lava-438483/1
    2024-03-04T06:10:46.282381  =

    2024-03-04T06:10:46.292703  / # /lava-438483/bin/lava-test-runner /lava=
-438483/1
    2024-03-04T06:10:46.337949  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-04T06:10:46.353581  + <8>[   20.960023] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 438483_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e565fae04a516c8d637052
        failing since 81 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-04T06:10:48.795278  /lava-438483/1/../bin/lava-test-case
    2024-03-04T06:10:48.795607  <8>[   23.386139] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-04T06:10:48.795913  /lava-438483/1/../bin/lava-test-case
    2024-03-04T06:10:48.796150  <8>[   23.404112] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-03-04T06:10:48.796341  /lava-438483/1/../bin/lava-test-case
    2024-03-04T06:10:48.796526  <8>[   23.423736] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-03-04T06:10:48.796709  /lava-438483/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-s90...libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e565dea1992cf202637052

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-sm1=
-s905d3-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-sm1=
-s905d3-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e565dea1992cf202637=
053
        new failure (last pass: next-20240226) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-s90...libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e567330e830447d8637057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-meson-sm=
1-s905d3-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-meson-sm=
1-s905d3-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e567330e830447d8637=
058
        new failure (last pass: next-20240223) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/65e570455053a4cda963703d

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/65e570455053a4cda9637054
        failing since 17 days (last pass: next-20240213, first fail: next-2=
0240216)

    2024-03-04T06:54:42.681043  /lava-12931933/1/../bin/lava-test-case

    2024-03-04T06:54:42.689445  <8>[   31.088100] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/65e570455053a4cda9637055
        failing since 17 days (last pass: next-20240213, first fail: next-2=
0240216)

    2024-03-04T06:54:41.651272  /lava-12931933/1/../bin/lava-test-case

    2024-03-04T06:54:41.662491  <8>[   30.060615] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/65e57324d4f8b3d10263707d

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/65e57324d4f8b3d102637094
        failing since 17 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-04T07:06:56.674278  <8>[   30.538337] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>

    2024-03-04T07:06:57.693968  /lava-12932032/1/../bin/lava-test-case

    2024-03-04T07:06:57.702756  <8>[   31.566818] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/65e57324d4f8b3d102637095
        failing since 17 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-04T07:06:56.664203  /lava-12932032/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65e57135c1158e4020637018

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e57135c1158e4020637=
019
        new failure (last pass: next-20240216) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e57392c0baf172f8637132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e57392c0baf172f8637=
133
        new failure (last pass: next-20240215) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e572a2fde2abcf4e637059

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e572a2fde2abcf4e63705e
        failing since 17 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-04T07:04:48.165539  / # <6>[   17

    2024-03-04T07:04:48.165876  .031030] mtk-mdp3 14f25000.dma-controller: =
Adding to iommu group 2

    2024-03-04T07:04:48.165950  <6>[   17.038398] mediatek-disp-ethdr 1c114=
000.hdr-engine: Adding to iommu group 3

    2024-03-04T07:04:48.166014  <6>[   17.046107] mediatek-mdp-rdma 1c10400=
0.dma-controller: Adding to iommu group 3

    2024-03-04T07:04:48.166073  <6>[   17.053871] mediatek-mdp-rdma 1c10500=
0.dma-controller: Adding to iommu group 3

    2024-03-04T07:04:48.166129  <6>[   17.061616] mediatek-mdp-rdma 1c10600=
0.dma-controller: Adding to iommu group 3

    2024-03-04T07:04:48.166184  <6>[   17.069338] mediatek-mdp-rdma 1c10700=
0.dma-controller: Adding to iommu group 3

    2024-03-04T07:04:48.166466  <6>[   17.077055] mediatek-mdp-rdma 1c10800=
0.dma-controller: Adding to iommu group 3

    2024-03-04T07:04:48.208858  <6>[   17.084760] mediatek-mdp-rdma 1c10900=
0.dma-controller: Adding to iommu group 3

    2024-03-04T07:04:48.208949  <6>[   17.092470] mediatek-mdp-rdma 1c10a00=
0.dma-controller: Adding to iommu group 3
 =

    ... (81 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e5653f427569b358637046

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e5653f427569b358637=
047
        new failure (last pass: next-20240226) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e56509c8c8e0507b63704a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e56509c8c8e0507b637=
04b
        new failure (last pass: next-20240226) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e565146c03d24f3563702a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e565146c03d24f35637=
02b
        new failure (last pass: next-20240226) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e564e3c674c799b663703d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e564e3c674c799b6637=
03e
        new failure (last pass: next-20240226) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e565f9a1992cf202637092

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e565f9a1992cf202637=
093
        new failure (last pass: next-20240301) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e57133c1158e4020637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a779m=
1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a779m=
1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e57133c1158e4020637=
016
        new failure (last pass: next-20240221) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e57392799d5b10b5637014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240304/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e57392799d5b10b5637=
015
        new failure (last pass: next-20240215) =

 =20

