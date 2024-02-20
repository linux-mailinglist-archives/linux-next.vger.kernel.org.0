Return-Path: <linux-next+bounces-1247-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C3D85CB30
	for <lists+linux-next@lfdr.de>; Tue, 20 Feb 2024 23:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83DF7B21D4E
	for <lists+linux-next@lfdr.de>; Tue, 20 Feb 2024 22:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09EA1468E0;
	Tue, 20 Feb 2024 22:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="GMeVCh7t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0195154427
	for <linux-next@vger.kernel.org>; Tue, 20 Feb 2024 22:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708469687; cv=none; b=mm0X2/5UbhgzhsKxzFqGH97rGBu9oBTcgcGpRWa9wGPs52hwuqdwLayYLz+qf4Fd5W0negWbQM6ofJ4OgrLNoA9esEAWtrX4BmEa0L5ihPB1PSIxonGJwQ9I2MNCzRQoxUr9sHQsMRnTeZJwa47jMetNAd2LIfjMOYlvcXCICE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708469687; c=relaxed/simple;
	bh=JUgH693WwWcGxhZJ3j/DcD8OSm7pskQW9kuj69Ru6+E=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=c8tB2Bfdr5r/S+LHsO4YT+haGCZROViQyboN6kbKWCsgIigOcogGhzdxH0lgMFqU2fOITjCLy23dejQZAjoIKf7ahjM6REtMDhdODlkwJUYdaoKR3ChDj/KJwOG270FwrXkjnRY7FHyiIBceUOHf9pyr7FcWcOTsxy0qs0BrpeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=GMeVCh7t; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e46e07ff07so1613138b3a.3
        for <linux-next@vger.kernel.org>; Tue, 20 Feb 2024 14:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708469684; x=1709074484; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fk3mYi5sxL5byhFQ1+1+v7h0nyEXAZG8vcf5EMeLJew=;
        b=GMeVCh7tgDKtIVLgZTbGv1FfSAGagOmUyjCFOjtYxuuMCUvBa1daLOKeZumxJtQTMq
         FgofIpT/IJPchIVlgVxXbaYqKquLPBx8TkAs/rmfDS5fncVuEBnuGq1q1LGmL5Indfax
         NkEVaNkHUjkjELEMNBQ2PpAIOO2Ft4z7yFro6dXKP8xAO0s8yY0xTKPSGqBgsbprAsS3
         LKnjWDsQCvIc/JP9o/TMLd6CvnUKkZ0SWUfEtSw3o8pO404COsPDanOQXbHWxN1g6MVg
         G1T7GZ4qs6pw3TgSixhEyTHH6S/Ip07fk2VibSfLB87yQHbviPwZhJRqvMuGANwAeQ96
         DYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708469684; x=1709074484;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fk3mYi5sxL5byhFQ1+1+v7h0nyEXAZG8vcf5EMeLJew=;
        b=pBd7c8iuVI8DFE6We0jTkRXeWKytGYOoK5axTyUMcctblBVVzynRSAkZa8oWpcjF3h
         YmjJwkJxfs6EQukT3XTrNBRE+GNrt3syJqm681/HFWelIShPb/ypdiEMWogWbLJqKjYm
         9QXl38HUEk0aiFm4aNH3paqncho+0Bc9h1t7uw6EaKxK6FNAvcIinjl0lLKyhqFGYFfN
         t5cIo8CQLpilksTfEAS4rG7xsx9V1EgikE51/l5vG9kHAcXpCZmAIH/2Pf0UO8gRcf4b
         rKu1DVXkHxQWGQiwX0I5I7IzRWX+3oku+R7usGjJu5MCpGL2U7ohAGyxF0U0OdAnApAq
         hXlg==
X-Gm-Message-State: AOJu0YxKSJi1+rUkFdqJtizbOLBRGVUXQn67eKVUPz0O2zRdKALD+hUx
	kUNeNF2PjFmzF7LsoptE28iqchB+HkCGCRQtgE8tKVkput6uVjeSJOxO4OZjI2UmPbFu+nEcuVj
	1PW0=
X-Google-Smtp-Source: AGHT+IF14bnS7JNxIQdt4Whl9CIiZuXXZldwFJWX3ay1Ne3j223pN62BFAGD2QvTMcABYy5bKmsSBg==
X-Received: by 2002:aa7:91d1:0:b0:6e0:4e7e:ef57 with SMTP id z17-20020aa791d1000000b006e04e7eef57mr14348806pfa.32.1708469683348;
        Tue, 20 Feb 2024 14:54:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u4-20020a62d444000000b006e2b23ea858sm7385298pfl.195.2024.02.20.14.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:54:42 -0800 (PST)
Message-ID: <65d52db2.620a0220.689fb.670c@mx.google.com>
Date: Tue, 20 Feb 2024 14:54:42 -0800 (PST)
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
X-Kernelci-Kernel: next-20240220
X-Kernelci-Report-Type: test
Subject: next/master baseline: 224 runs, 23 regressions (next-20240220)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 224 runs, 23 regressions (next-20240220)

Regressions Summary
-------------------

platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard            | arm   | lab-pengutronix | clang-17 | multi_v7=
_defconfig           | 1          =

jetson-tk1                  | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

meson-g12a-u200             | arm64 | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =

r8a7743-iwg20d-q7           | arm   | lab-cip         | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square         | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq           | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc               | arm64 | lab-broonie     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre    | clang-17 | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe      | clang-17 | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240220/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240220
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e =



Test Regressions
---------------- =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f731158287f31b637043

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d4f731158287f31b637=
044
        failing since 260 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f7be7ab8f03e88637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d4f7be7ab8f03e88637=
013
        failing since 329 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6dl-riotboard            | arm   | lab-pengutronix | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f25970f820fbbe637063

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4f25970f820fbbe63706c
        new failure (last pass: next-20240118)

    2024-02-20T18:41:08.914579  + set[   16.059272] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1026184_1.5.2.3.1>
    2024-02-20T18:41:08.914725   +x
    2024-02-20T18:41:09.020627  / # #
    2024-02-20T18:41:09.121704  export SHELL=3D/bin/sh
    2024-02-20T18:41:09.122134  #
    2024-02-20T18:41:09.222827  / # export SHELL=3D/bin/sh. /lava-1026184/e=
nvironment
    2024-02-20T18:41:09.223206  =

    2024-02-20T18:41:09.323955  / # . /lava-1026184/environment/lava-102618=
4/bin/lava-test-runner /lava-1026184/1
    2024-02-20T18:41:09.324531  =

    2024-02-20T18:41:09.327667  / # /lava-1026184/bin/lava-test-runner /lav=
a-1026184/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
jetson-tk1                  | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f58ac7b62e0ee2637034

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d4f58ac7b62e0ee2637=
035
        failing since 679 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65d4f8815bc558152463702b

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4f8815bc5581524637032
        failing since 69 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-20T19:07:23.938105  <8>[   20.282680] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 432812_1.5.2.4.1>
    2024-02-20T19:07:24.043128  / # #
    2024-02-20T19:07:24.145115  export SHELL=3D/bin/sh
    2024-02-20T19:07:24.145742  #
    2024-02-20T19:07:24.247183  / # export SHELL=3D/bin/sh. /lava-432812/en=
vironment
    2024-02-20T19:07:24.247927  =

    2024-02-20T19:07:24.349416  / # . /lava-432812/environment/lava-432812/=
bin/lava-test-runner /lava-432812/1
    2024-02-20T19:07:24.350646  =

    2024-02-20T19:07:24.369830  / # /lava-432812/bin/lava-test-runner /lava=
-432812/1
    2024-02-20T19:07:24.413688  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d4f8815bc5581524637036
        failing since 69 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-20T19:07:26.523151  /lava-432812/1/../bin/lava-test-case
    2024-02-20T19:07:26.523377  <8>[   22.849913] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-20T19:07:26.523618  /lava-432812/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d4f8815bc5581524637038
        failing since 69 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-20T19:07:27.586345  /lava-432812/1/../bin/lava-test-case
    2024-02-20T19:07:27.586809  <8>[   23.890203] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-20T19:07:27.587171  /lava-432812/1/../bin/lava-test-case
    2024-02-20T19:07:27.587455  <8>[   23.909317] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d4f8815bc558152463703d
        failing since 69 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-20T19:07:28.662789  /lava-432812/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d4f8815bc558152463703e
        failing since 69 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-20T19:07:28.665921  <8>[   25.006803] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-20T19:07:29.720172  /lava-432812/1/../bin/lava-test-case
    2024-02-20T19:07:29.720824  <8>[   26.028505] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-20T19:07:29.721105  /lava-432812/1/../bin/lava-test-case
    2024-02-20T19:07:29.721345  <8>[   26.046227] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-20T19:07:29.721579  /lava-432812/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65d4f8a8c0f585979263708b

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4f8a8c0f5859792637092
        failing since 69 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-20T19:07:58.957041  / # #
    2024-02-20T19:07:59.059292  export SHELL=3D/bin/sh
    2024-02-20T19:07:59.060000  #
    2024-02-20T19:07:59.161395  / # export SHELL=3D/bin/sh. /lava-432811/en=
vironment
    2024-02-20T19:07:59.162141  =

    2024-02-20T19:07:59.263379  / # . /lava-432811/environment/lava-432811/=
bin/lava-test-runner /lava-432811/1
    2024-02-20T19:07:59.264496  =

    2024-02-20T19:07:59.310167  / # /lava-432811/bin/lava-test-runner /lava=
-432811/1
    2024-02-20T19:07:59.337217  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-20T19:07:59.337725  + <8>[   20.904440] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 432811_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d4f8a8c0f58597926370a5
        failing since 69 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-20T19:08:01.768742  /lava-432811/1/../bin/lava-test-case
    2024-02-20T19:08:01.769194  <8>[   23.328003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-20T19:08:01.769556  /lava-432811/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
meson-g12a-u200             | arm64 | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f4c1325decd87e637028

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d4f4c1325decd87e637=
029
        failing since 62 days (last pass: next-20231115, first fail: next-2=
0231220) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7           | arm   | lab-cip         | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4ed140a88b70b2163702f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d4ed140a88b70b21637=
030
        failing since 7 days (last pass: next-20240212, first fail: next-20=
240213) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square         | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f6416ba81c506f63701b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d4f6416ba81c506f637=
01c
        failing since 455 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq           | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f53d8230e0b5fe63702a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d4f53d8230e0b5fe637=
02b
        failing since 455 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
rk3399-roc-pc               | arm64 | lab-broonie     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d50beb8f7bdf5e52637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d50beb8f7bdf5e52637=
013
        failing since 13 days (last pass: next-20240125, first fail: next-2=
0240207) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f9653ec355c90c63706b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d4f9653ec355c90c637=
06c
        failing since 1 day (last pass: next-20240216, first fail: next-202=
40219) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre    | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f27c45fc189055637110

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4f27c45fc189055637119
        failing since 264 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-20T18:41:43.918092  / # #
    2024-02-20T18:41:44.019433  export SHELL=3D/bin/sh
    2024-02-20T18:41:44.019794  #
    2024-02-20T18:41:44.120416  / # export SHELL=3D/bin/sh. /lava-3934759/e=
nvironment
    2024-02-20T18:41:44.120769  =

    2024-02-20T18:41:44.221418  / # . /lava-3934759/enviro/lava-3934759/bin=
/lava-test-runner /lava-3934759/1
    2024-02-20T18:41:44.221926  nment
    2024-02-20T18:41:44.242304  / # /lava-3934759/bin/lava-test-runner /lav=
a-3934759/1
    2024-02-20T18:41:44.371090  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-20T18:41:44.375620  + cd /lava-3934759/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe      | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f25d45fc18905563702a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4f25d45fc189055637033
        failing since 264 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-20T18:41:14.563820  + set +x
    2024-02-20T18:41:14.566456  [   19.691576] <LAVA_SIGNAL_ENDRUN 0_dmesg =
459573_1.5.2.4.1>
    2024-02-20T18:41:14.674137  / # #
    2024-02-20T18:41:14.775555  export SHELL=3D/bin/sh
    2024-02-20T18:41:14.776256  #
    2024-02-20T18:41:14.877225  / # export SHELL=3D/bin/sh. /lava-459573/en=
vironment
    2024-02-20T18:41:14.877783  =

    2024-02-20T18:41:14.978680  / # . /lava-459573/environment/lava-459573/=
bin/lava-test-runner /lava-459573/1
    2024-02-20T18:41:14.979492  =

    2024-02-20T18:41:14.982240  / # /lava-459573/bin/lava-test-runner /lava=
-459573/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4ef0d3b45e0a18c6370a6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4ef0d3b45e0a18c6370af
        failing since 258 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-20T18:27:08.322870  / # #
    2024-02-20T18:27:08.424516  export SHELL=3D/bin/sh
    2024-02-20T18:27:08.426163  #
    2024-02-20T18:27:08.528096  / # export SHELL=3D/bin/sh. /lava-3934749/e=
nvironment
    2024-02-20T18:27:08.528793  =

    2024-02-20T18:27:08.629990  / # . /lava-3934749/environment/lava-393474=
9/bin/lava-test-runner /lava-3934749/1
    2024-02-20T18:27:08.632227  =

    2024-02-20T18:27:08.647439  / # /lava-3934749/bin/lava-test-runner /lav=
a-3934749/1
    2024-02-20T18:27:08.727311  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-20T18:27:08.766162  + cd /lava-3934749/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f689c301f0048a63704c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4f689c301f0048a637055
        failing since 258 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-20T18:59:00.014554  / # #
    2024-02-20T18:59:00.117217  export SHELL=3D/bin/sh
    2024-02-20T18:59:00.117675  #
    2024-02-20T18:59:00.218649  / # export SHELL=3D/bin/sh. /lava-3934846/e=
nvironment
    2024-02-20T18:59:00.219172  =

    2024-02-20T18:59:00.320486  / # . /lava-3934846/environment/lava-393484=
6/bin/lava-test-runner /lava-3934846/1
    2024-02-20T18:59:00.322736  =

    2024-02-20T18:59:00.338159  / # /lava-3934846/bin/lava-test-runner /lav=
a-3934846/1
    2024-02-20T18:59:00.418035  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-20T18:59:00.457810  + cd /lava-3934846/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4ef153b45e0a18c6370d5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4ef153b45e0a18c6370de
        failing since 258 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-20T18:27:16.215068  + set +x
    2024-02-20T18:27:16.216863  [   23.685283] <LAVA_SIGNAL_ENDRUN 0_dmesg =
459567_1.5.2.4.1>
    2024-02-20T18:27:16.324435  / # #
    2024-02-20T18:27:16.426034  export SHELL=3D/bin/sh
    2024-02-20T18:27:16.426587  #
    2024-02-20T18:27:16.527581  / # export SHELL=3D/bin/sh. /lava-459567/en=
vironment
    2024-02-20T18:27:16.528197  =

    2024-02-20T18:27:16.629235  / # . /lava-459567/environment/lava-459567/=
bin/lava-test-runner /lava-459567/1
    2024-02-20T18:27:16.630094  =

    2024-02-20T18:27:16.632876  / # /lava-459567/bin/lava-test-runner /lava=
-459567/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4f66d6ba81c506f63709c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4f66d6ba81c506f6370a5
        failing since 258 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-20T18:58:35.043357  + set +x
    2024-02-20T18:58:35.045105  [   20.807322] <LAVA_SIGNAL_ENDRUN 0_dmesg =
459584_1.5.2.4.1>
    2024-02-20T18:58:35.153687  / # #
    2024-02-20T18:58:35.255122  export SHELL=3D/bin/sh
    2024-02-20T18:58:35.255754  #
    2024-02-20T18:58:35.356618  / # export SHELL=3D/bin/sh. /lava-459584/en=
vironment
    2024-02-20T18:58:35.357235  =

    2024-02-20T18:58:35.458154  / # . /lava-459584/environment/lava-459584/=
bin/lava-test-runner /lava-459584/1
    2024-02-20T18:58:35.459164  =

    2024-02-20T18:58:35.461857  / # /lava-459584/bin/lava-test-runner /lava=
-459584/1 =

    ... (12 line(s) more)  =

 =20

