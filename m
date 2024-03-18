Return-Path: <linux-next+bounces-1662-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1598987E41A
	for <lists+linux-next@lfdr.de>; Mon, 18 Mar 2024 08:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3217280D03
	for <lists+linux-next@lfdr.de>; Mon, 18 Mar 2024 07:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A29222626;
	Mon, 18 Mar 2024 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="28cKO9RJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4725F22616
	for <linux-next@vger.kernel.org>; Mon, 18 Mar 2024 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710747125; cv=none; b=MTlbrVKCjUhli/ujXCQfhmEiMzFpQsTG3KZ0O3gsAj9EI1ibEl5cxCQ5Kfen5XWWQHQkVbTMCN0Ozd7xzDQQ1WQiULVK/DwrRvzRpKIGQW09Eey10tLC5qyqWNVLEWCqc+z2ctehebU7w1NTcE6pDYJ6s5Rar1owc01/xDfCguo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710747125; c=relaxed/simple;
	bh=RMXPrq5p1I5cyTCzmgHNnnmliFOglp7nV9frU8xqRWE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=O/SBlxQuteEA4WbdcfUyZPjRpojq830DgH8A+/geevCjFamzjF3RhkTbl+vOJYKQcv5arZD+O9mjPcXl5aC4Ez8plBdfB1Z66BPGJCNUfqwEAytG9NDQN8hcn1qt1WQ6BCBNg0oV60alrHyB7NxZuYw4NYSIgYys1+kOxlwlaKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=28cKO9RJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dd955753edso31892995ad.1
        for <linux-next@vger.kernel.org>; Mon, 18 Mar 2024 00:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710747120; x=1711351920; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3XuW4HdeED+IXyNwTQlmqNHo1E/LMkoLlFztrrKPies=;
        b=28cKO9RJ7aCXn/3Jori2kBatbn8n4J6EdAP2JdwJdizMF6FIOoDm55NjrSOcEEP3/K
         6LyZ4mm+rbAHPLLahQGUnscyVW7D+N9I/SfsLGg4ZldV4VBmvmdIX3pIuw4XyaqAzcxa
         8fn9Mj8Ty0d8THJE5rMoUIxMij9wnilPT3s3mEh7KDVQe2GxGOod5ufG/9gH+TsUB+LB
         zrK9NOqxaGCPRg5KQ/ix/OjnTw6SHq26QD9uoifAanwfvoSPhgpcz+RNwREFWrbbXU++
         3KhAVLLGFec9ZyPw4eoHtztxNudaMsS8vaEP0wfpej03QJ3m1TvTFDh4yTTVFH18upvi
         b8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710747120; x=1711351920;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XuW4HdeED+IXyNwTQlmqNHo1E/LMkoLlFztrrKPies=;
        b=RiEXr5mafh7YfBQvISxw2tk9RKLnLSvfHhnRWrmsabZxCSUHahtjp5FvRiKzsAi1/g
         wb+Lp6hEk51Pmn1V5bR0hMnNhxIZWvDr1EuiV7W/0Yf5sLOrdqXM/PTEwbRZ4id7j9p3
         CRCKLmffG74nN8kbFFdujBbhjbq5jfSNN14sbwncWywzC98lJRoS3wKiriT9lI7nPcr2
         PQjTnC9N/80Qtx5kYaamojawzzIIejBgqBKHnDA5jdvxPWDs3TxgfPhkmw2YZW8sCTCz
         Q8DptPtOxX/vMuKzDCF0FYd5D68undyn4o9Tm9oonzK10HrpEph0cZtxOC180KhD8WIZ
         NDoQ==
X-Gm-Message-State: AOJu0Yzrpta4YH4hP11pYD0SWVZevmEC1uoQEUN3R/zBU0JLxSoIntlg
	ees+GlaDbCvHqAXr0qu/3U/A3qiLdSfV8ANVfbpFJUH80mx/DMj2mdqsxl2XjlVWL7aURbAahM7
	n
X-Google-Smtp-Source: AGHT+IFORehxMlLFy2HYQnWPtHiXvPPJz7AzLMFXPeDL1MuhRyogeu/ln5comf8x64CMxOpoI0tAag==
X-Received: by 2002:a17:902:f80c:b0:1db:ca53:403 with SMTP id ix12-20020a170902f80c00b001dbca530403mr9216561plb.26.1710747119043;
        Mon, 18 Mar 2024 00:31:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709027ec900b001db9c3d6506sm8636818plb.209.2024.03.18.00.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 00:31:58 -0700 (PDT)
Message-ID: <65f7edee.170a0220.96da.7885@mx.google.com>
Date: Mon, 18 Mar 2024 00:31:58 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240318
X-Kernelci-Report-Type: test
Subject: next/master baseline: 329 runs, 57 regressions (next-20240318)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 329 runs, 57 regressions (next-20240318)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

imx6q-udoo                   | arm    | lab-broonie   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | clang-17 | defconfi=
g                    | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

qemu_riscv64                 | riscv  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =

qemu_riscv64                 | riscv  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

qemu_smp8_riscv64            | riscv  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =

qemu_smp8_riscv64            | riscv  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240318/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240318
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2e93f143ca010a5013528e1cfdc895f024fe8c21 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b35c706181c9644c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b35c706181c9644c4=
2dc
        failing since 12 days (last pass: next-20240226, first fail: next-2=
0240305) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b35e6a3239eb494c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b35e6a3239eb494c4=
2db
        failing since 18 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b26bfe5f0f7dda4c430d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b26bfe5f0f7dda4c4=
30e
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b25bfe5f0f7dda4c42e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cbv514-1h-=
34uz-brya.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cbv514-1h-=
34uz-brya.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b25bfe5f0f7dda4c4=
2e7
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b24f99610676394c430a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b24f99610676394c4=
30b
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b25c4273fd9e2b4c42fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi5-brask.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi5-brask.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b25c4273fd9e2b4c4=
2fb
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b27e55ea389cf94c4301

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b27e55ea389cf94c4=
302
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b287260fe786cc4c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C433TA-AJ0=
005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C433TA-AJ0=
005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b287260fe786cc4c4=
2ee
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b269a22069c14f4c42f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C436FA-Fli=
p-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C436FA-Fli=
p-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b269a22069c14f4c4=
2fa
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b466e30a9f285e4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-cx9400-vol=
teer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-cx9400-vol=
teer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b466e30a9f285e4c4=
2db
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7add5489dfcab954c43a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7add5489dfcab954c4=
3aa
        failing since 286 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7bb6f1f284d5ac24c4312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7bb6f1f284d5ac24c4=
313
        failing since 355 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7bf6a9935ce7d674c42df

  Results:     51 PASS, 4 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65f7bf6a9935ce7d=
674c42e4
        new failure (last pass: next-20240315)
        1 lines

    2024-03-18T04:13:03.170520  / # =

    2024-03-18T04:13:03.179314  =

    2024-03-18T04:13:03.284496  / # #
    2024-03-18T04:13:03.291180  #
    2024-03-18T04:13:03.434542  / # export SHELL=3D/bin/sh
    2024-03-18T04:13:03.451071  export SHELL=3D/bin/sh
    2024-03-18T04:13:03.552948  / # . /lava-1108726/environment
    2024-03-18T04:13:03.563128  . /lava-1108726/environment
    2024-03-18T04:13:03.665020  / # /lava-1108726/bin/lava-test-runner /lav=
a-1108726/0
    2024-03-18T04:13:03.674932  /lava-1108726/bin/lava-test-runner /lava-11=
08726/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b2b02bde48d46c4c430a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b2b02bde48d46c4c4=
30b
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b2f35b820053264c434e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b2f35b820053264c4=
34f
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b344084a67c3a54c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b344084a67c3a54c4=
2e4
        failing since 12 days (last pass: next-20240226, first fail: next-2=
0240305) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b495e30a9f285e4c42fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b495e30a9f285e4c4=
2fd
        failing since 18 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b3531b0e842a824c42fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b3531b0e842a824c4=
2fd
        failing since 12 days (last pass: next-20240226, first fail: next-2=
0240305) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b370706181c9644c42f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b370706181c9644c4=
2f7
        failing since 18 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b2b210b10843974c42de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b2b210b10843974c4=
2df
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b39e085d1a4b4a4c4324

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-14-G1-s=
ona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-14-G1-s=
ona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b39e085d1a4b4a4c4=
325
        failing since 9 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6q-udoo                   | arm    | lab-broonie   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65f7bb374a8482fe084c42df

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65f7bb374=
a8482fe084c42ec
        new failure (last pass: next-20240228)

    2024-03-18T03:55:22.341517  /lava-18626/1/../bin/lava-test-case
    2024-03-18T03:55:22.368165  <8>[   24.184826] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
f7bb374a8482fe084c42ed
        new failure (last pass: next-20240228)

    2024-03-18T03:55:21.292999  /lava-18626/1/../bin/lava-test-case
    2024-03-18T03:55:21.320063  <8>[   23.136107] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65f7adaa4fe1d1c2954c431a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7adaa4fe1d1c2954c4321
        failing since 96 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-18T02:57:23.081627  <8>[   20.315365] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 444553_1.5.2.4.1>
    2024-03-18T02:57:23.187419  / # #
    2024-03-18T02:57:23.289207  export SHELL=3D/bin/sh
    2024-03-18T02:57:23.289735  #
    2024-03-18T02:57:23.390767  / # export SHELL=3D/bin/sh. /lava-444553/en=
vironment
    2024-03-18T02:57:23.391357  =

    2024-03-18T02:57:23.492382  / # . /lava-444553/environment/lava-444553/=
bin/lava-test-runner /lava-444553/1
    2024-03-18T02:57:23.493238  =

    2024-03-18T02:57:23.497400  / # /lava-444553/bin/lava-test-runner /lava=
-444553/1
    2024-03-18T02:57:23.556505  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65f7adaa4fe1d1c2954c4325
        failing since 96 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-18T02:57:25.664180  /lava-444553/1/../bin/lava-test-case
    2024-03-18T02:57:25.664807  <8>[   22.885660] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-18T02:57:25.665068  /lava-444553/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
f7adaa4fe1d1c2954c4327
        failing since 96 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-18T02:57:26.725451  /lava-444553/1/../bin/lava-test-case
    2024-03-18T02:57:26.726004  <8>[   23.925111] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-18T02:57:26.726364  /lava-444553/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f7adaa4fe1d1c2954c432c
        failing since 96 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-18T02:57:27.805027  /lava-444553/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65f7adaa4fe1d1c2954c432d
        failing since 96 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-18T02:57:27.808260  <8>[   25.043482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-18T02:57:28.869306  /lava-444553/1/../bin/lava-test-case
    2024-03-18T02:57:28.869794  <8>[   26.065512] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-18T02:57:28.870145  /lava-444553/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65f7b15620f503fca04c42f2

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7b15620f503fca04c42f9
        failing since 95 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-18T03:13:04.404047  + <8>[   20.253775] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 444572_1.5.2.4.1>
    2024-03-18T03:13:04.404339  set +x
    2024-03-18T03:13:04.509872  / # #
    2024-03-18T03:13:04.610623  export SHELL=3D/bin/sh
    2024-03-18T03:13:04.610959  #
    2024-03-18T03:13:04.711594  / # export SHELL=3D/bin/sh. /lava-444572/en=
vironment
    2024-03-18T03:13:04.711868  =

    2024-03-18T03:13:04.812428  / # . /lava-444572/environment/lava-444572/=
bin/lava-test-runner /lava-444572/1
    2024-03-18T03:13:04.812844  =

    2024-03-18T03:13:04.819537  / # /lava-444572/bin/lava-test-runner /lava=
-444572/1 =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65f7b15620f503fca04c42fd
        failing since 95 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-18T03:13:06.985860  /lava-444572/1/../bin/lava-test-case
    2024-03-18T03:13:06.986030  <8>[   22.822274] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-18T03:13:06.986206  /lava-444572/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
f7b15620f503fca04c42ff
        failing since 95 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-18T03:13:08.049640  /lava-444572/1/../bin/lava-test-case
    2024-03-18T03:13:08.050085  <8>[   23.862789] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-18T03:13:08.050342  /lava-444572/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f7b15620f503fca04c4304
        failing since 95 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-18T03:13:09.129024  /lava-444572/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65f7b15620f503fca04c4305
        failing since 95 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-18T03:13:09.132184  <8>[   24.982590] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-18T03:13:10.191681  /lava-444572/1/../bin/lava-test-case
    2024-03-18T03:13:10.191862  <8>[   26.004208] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-18T03:13:10.191956  /lava-444572/1/../bin/lava-test-case
    2024-03-18T03:13:10.192045  <8>[   26.022124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-03-18T03:13:10.192125  /lava-444572/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | clang-17 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65f7b6578ba23224da4c42da

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7b6578ba23224da4c42e1
        failing since 97 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-03-18T03:34:22.332184  / # #
    2024-03-18T03:34:22.434080  export SHELL=3D/bin/sh
    2024-03-18T03:34:22.434429  #
    2024-03-18T03:34:22.535078  / # export SHELL=3D/bin/sh. /lava-444582/en=
vironment
    2024-03-18T03:34:22.535369  =

    2024-03-18T03:34:22.635923  / # . /lava-444582/environment/lava-444582/=
bin/lava-test-runner /lava-444582/1
    2024-03-18T03:34:22.636346  =

    2024-03-18T03:34:22.642532  / # /lava-444582/bin/lava-test-runner /lava=
-444582/1
    2024-03-18T03:34:22.708764  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-18T03:34:22.708909  + <8>[   20.986272] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 444582_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f7b6578ba23224da4c42f4
        failing since 97 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-03-18T03:34:24.096615  <8>[   22.399124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-03-18T03:34:25.150919  /lava-444582/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65f7adbe84877fb6624c42ed

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7adbe84877fb6624c42f4
        failing since 96 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-18T02:57:46.157998  / # #
    2024-03-18T02:57:46.260149  export SHELL=3D/bin/sh
    2024-03-18T02:57:46.260713  #
    2024-03-18T02:57:46.362279  / # export SHELL=3D/bin/sh. /lava-444556/en=
vironment
    2024-03-18T02:57:46.362992  =

    2024-03-18T02:57:46.464380  / # . /lava-444556/environment/lava-444556/=
bin/lava-test-runner /lava-444556/1
    2024-03-18T02:57:46.465555  =

    2024-03-18T02:57:46.485647  / # /lava-444556/bin/lava-test-runner /lava=
-444556/1
    2024-03-18T02:57:46.538437  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-18T02:57:46.538870  + <8>[   21.094127] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 444556_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f7adbe84877fb6624c4307
        failing since 96 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-18T02:57:48.917618  /lava-444556/1/../bin/lava-test-case
    2024-03-18T02:57:48.987822  <8>[   23.519625] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-18T02:57:48.988277  /lava-444556/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65f7b0f2311d6975c34c42f9

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7b0f2311d6975c34c4300
        failing since 95 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-18T03:11:24.535331  / # #
    2024-03-18T03:11:24.636266  export SHELL=3D/bin/sh
    2024-03-18T03:11:24.636654  #
    2024-03-18T03:11:24.737240  / # export SHELL=3D/bin/sh. /lava-444570/en=
vironment
    2024-03-18T03:11:24.737614  =

    2024-03-18T03:11:24.838294  / # . /lava-444570/environment/lava-444570/=
bin/lava-test-runner /lava-444570/1
    2024-03-18T03:11:24.838654  =

    2024-03-18T03:11:24.849421  / # /lava-444570/bin/lava-test-runner /lava=
-444570/1
    2024-03-18T03:11:24.890285  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-18T03:11:24.910537  + <8>[   20.959171] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 444570_1.5.2.4.5> =

    ... (12 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f7b0f3311d6975c34c4313
        failing since 95 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-18T03:11:27.349384  /lava-444570/1/../bin/lava-test-case
    2024-03-18T03:11:27.349824  <8>[   23.388930] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-18T03:11:27.350161  /lava-444570/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b7d5e35a5af3154c4328

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b7d5e35a5af3154c4=
329
        failing since 88 days (last pass: next-20231115, first fail: next-2=
0231220) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b6e923af38f1624c432b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b6e923af38f1624c4=
32c
        new failure (last pass: next-20240219) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b780471daa94eb4c446d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b780471daa94eb4c4=
46e
        failing since 25 days (last pass: next-20240220, first fail: next-2=
0240221) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b792eaddbcc8474c42fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b792eaddbcc8474c4=
2ff
        failing since 25 days (last pass: next-20240220, first fail: next-2=
0240221) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b77f471daa94eb4c446a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b77f471daa94eb4c4=
46b
        failing since 25 days (last pass: next-20240220, first fail: next-2=
0240221) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_riscv64                 | riscv  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7ba33c3937ab9fc4c42f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7ba33c3937ab9fc4c4=
2f5
        new failure (last pass: next-20240314) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_riscv64                 | riscv  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7ba26c3937ab9fc4c42e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7ba26c3937ab9fc4c4=
2e1
        new failure (last pass: next-20240314) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_smp8_riscv64            | riscv  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7ba1deb45260abb4c42ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7ba1deb45260abb4c4=
2ed
        new failure (last pass: next-20240314) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_smp8_riscv64            | riscv  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7ba27eb45260abb4c42f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7ba27eb45260abb4c4=
2f3
        new failure (last pass: next-20240314) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b79aeaddbcc8474c4304

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7b79aeaddbcc8474c430d
        failing since 202 days (last pass: next-20230710, first fail: next-=
20230828)

    2024-03-18T03:39:55.197376  + set +x
    2024-03-18T03:39:55.200781  <8>[   28.568295] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1108746_1.5.2.4.1>
    2024-03-18T03:39:55.308492  / # #
    2024-03-18T03:39:56.773515  export SHELL=3D/bin/sh
    2024-03-18T03:39:56.794600  #
    2024-03-18T03:39:56.795080  / # export SHELL=3D/bin/sh
    2024-03-18T03:39:58.753109  / # . /lava-1108746/environment
    2024-03-18T03:40:02.356155  /lava-1108746/bin/lava-test-runner /lava-11=
08746/1
    2024-03-18T03:40:02.377590  . /lava-1108746/environment
    2024-03-18T03:40:02.377954  / # /lava-1108746/bin/lava-test-runner /lav=
a-1108746/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b312ab49b39c114c42f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b312ab49b39c114c4=
2f9
        failing since 481 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b20e358f99b5254c42ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7b20e358f99b5254c4=
2ed
        failing since 481 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b09306788081974c42e9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7b09306788081974c42f2
        failing since 284 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-18T03:09:54.594367  <8>[   14.554946] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3957893_1.5.2.4.1>
    2024-03-18T03:09:54.702637  / # #
    2024-03-18T03:09:54.805673  export SHELL=3D/bin/sh
    2024-03-18T03:09:54.806745  #
    2024-03-18T03:09:54.908571  / # export SHELL=3D/bin/sh. /lava-3957893/e=
nvironment
    2024-03-18T03:09:54.909663  =

    2024-03-18T03:09:55.011358  / # . /lava-3957893/environment/lava-395789=
3/bin/lava-test-runner /lava-3957893/1
    2024-03-18T03:09:55.013183  =

    2024-03-18T03:09:55.026029  / # /lava-3957893/bin/lava-test-runner /lav=
a-3957893/1
    2024-03-18T03:09:55.105978  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b773890539c1584c42e5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7b773890539c1584c42ee
        failing since 290 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-18T03:39:00.401017  <8>[   16.629094] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3958052_1.5.2.4.1>
    2024-03-18T03:39:00.509534  / # #
    2024-03-18T03:39:00.611662  export SHELL=3D/bin/sh
    2024-03-18T03:39:00.612662  #
    2024-03-18T03:39:00.714241  / # export SHELL=3D/bin/sh. /lava-3958052/e=
nvironment
    2024-03-18T03:39:00.715029  =

    2024-03-18T03:39:00.816412  / # . /lava-3958052/environment/lava-395805=
2/bin/lava-test-runner /lava-3958052/1
    2024-03-18T03:39:00.817751  =

    2024-03-18T03:39:00.832137  / # /lava-3958052/bin/lava-test-runner /lav=
a-3958052/1
    2024-03-18T03:39:00.954821  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7bb46dfb9d1daa84c430f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7bb46dfb9d1daa84c4318
        failing since 284 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-03-18T03:55:22.794720  / # #
    2024-03-18T03:55:22.895739  export SHELL=3D/bin/sh
    2024-03-18T03:55:22.896098  #
    2024-03-18T03:55:22.996755  / # export SHELL=3D/bin/sh. /lava-3958083/e=
nvironment
    2024-03-18T03:55:22.997184  =

    2024-03-18T03:55:23.097926  / # . /lava-3958083/environment/lava-395808=
3/bin/lava-test-runner /lava-3958083/1
    2024-03-18T03:55:23.098418  =

    2024-03-18T03:55:23.118307  / # /lava-3958083/bin/lava-test-runner /lav=
a-3958083/1
    2024-03-18T03:55:23.231671  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-18T03:55:23.232626  + cd /lava-3958083/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b09845d97300734c432c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7b09845d97300734c4335
        failing since 284 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-18T03:10:00.312845  + set +x
    2024-03-18T03:10:00.314549  [   21.111429] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462741_1.5.2.4.1>
    2024-03-18T03:10:00.422861  / # #
    2024-03-18T03:10:00.524482  export SHELL=3D/bin/sh
    2024-03-18T03:10:00.525029  #
    2024-03-18T03:10:00.625943  / # export SHELL=3D/bin/sh. /lava-462741/en=
vironment
    2024-03-18T03:10:00.626444  =

    2024-03-18T03:10:00.727315  / # . /lava-462741/environment/lava-462741/=
bin/lava-test-runner /lava-462741/1
    2024-03-18T03:10:00.728079  =

    2024-03-18T03:10:00.730772  / # /lava-462741/bin/lava-test-runner /lava=
-462741/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7b73eb8530651cc4c42f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7b73eb8530651cc4c4300
        failing since 290 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-18T03:38:14.196212  + set +x
    2024-03-18T03:38:14.198000  [   23.505181] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462756_1.5.2.4.1>
    2024-03-18T03:38:14.305552  / # #
    2024-03-18T03:38:14.407107  export SHELL=3D/bin/sh
    2024-03-18T03:38:14.407628  #
    2024-03-18T03:38:14.508600  / # export SHELL=3D/bin/sh. /lava-462756/en=
vironment
    2024-03-18T03:38:14.509126  =

    2024-03-18T03:38:14.610113  / # . /lava-462756/environment/lava-462756/=
bin/lava-test-runner /lava-462756/1
    2024-03-18T03:38:14.610936  =

    2024-03-18T03:38:14.613458  / # /lava-462756/bin/lava-test-runner /lava=
-462756/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f7bb394a8482fe084c4309

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240318/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7bb394a8482fe084c4312
        failing since 284 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-03-18T03:55:16.158630  + set +x[   19.754805] <LAVA_SIGNAL_ENDRUN =
0_dmesg 462760_1.5.2.4.1>
    2024-03-18T03:55:16.159105  =

    2024-03-18T03:55:16.267238  / # #
    2024-03-18T03:55:16.369018  export SHELL=3D/bin/sh
    2024-03-18T03:55:16.369596  #
    2024-03-18T03:55:16.470593  / # export SHELL=3D/bin/sh. /lava-462760/en=
vironment
    2024-03-18T03:55:16.471161  =

    2024-03-18T03:55:16.572162  / # . /lava-462760/environment/lava-462760/=
bin/lava-test-runner /lava-462760/1
    2024-03-18T03:55:16.572992  =

    2024-03-18T03:55:16.577418  / # /lava-462760/bin/lava-test-runner /lava=
-462760/1 =

    ... (12 line(s) more)  =

 =20

