Return-Path: <linux-next+bounces-2662-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A89915E16
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 07:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66A6E28418D
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 05:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115EC2744A;
	Tue, 25 Jun 2024 05:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="D/jeJsrc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339E33C0
	for <linux-next@vger.kernel.org>; Tue, 25 Jun 2024 05:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719292590; cv=none; b=P1qphwG7/gUfOguU/jBfOOt6DOMydy8vr/ZXQS8pvxdVeoG/JteoWBVwA3wpJEV6iN85DW22SrYq28Qd30RNpQXK53PdgxAqqtZIfhIsojj2sA/x9XwHpF9ts99rI7QThnWCpaV7pajpDhZ5JT+Zpy69L7QBXEOyEGNftob5oLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719292590; c=relaxed/simple;
	bh=pFdWnoJwGn8HjsM02vcGuGbOq/vDnUeycrEKQzlOzss=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Uiy8rw6cvARGQLGu8Fa9sQ/lvD8tHFeXU7U8zJwO+J1wtYVxW6oVN6u93UYpK1R9eiASaECFu4y9SuV4h1gxNYVSEkesKB215SXyE4FOm2Kaxgv+qm8e4TZjeOrDFuv6uwz/Vmgz75suEJ7XxZut6TB+/5AsRwUNwm0EaIGflsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=D/jeJsrc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c7dd4586afso4011642a91.2
        for <linux-next@vger.kernel.org>; Mon, 24 Jun 2024 22:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719292586; x=1719897386; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ghcRBTcEgZJHfAlfUqb4iPXGSKly1LEeAPhk1Z2FIDM=;
        b=D/jeJsrcjMD5EnSPSHnX8emGk0n6VPvlAYkocMGX8LaqRyQsyvYJ0bM4EXUF9ohEt+
         hXVULvln0VmtEvlZm5zH6ZS9p8tt/2u8gavBVGfNm0Jw7+6P35folAxgjjpHYwOOWIhz
         sQHVIamWgdlQA+gGBuVetgD4jvt9Q3aGDRqV0SFF42zaOdqHaw8NYeTcxSiXvSJ+evLw
         5jKmuos5SIf/M2EI7nqy+BaA3vV3nssgUcszZ4AMrm6yOPhIMSdyC0Bz9nfYliLIOfva
         eR1oDOZKNkbmgvx+yfA7tc/MUUnalGu5CmZlZsgi9jiO4DMpsHY10mU4FSc0w2n7uJpB
         Wmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719292586; x=1719897386;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghcRBTcEgZJHfAlfUqb4iPXGSKly1LEeAPhk1Z2FIDM=;
        b=wt06jusF/QBmde6AzBFX/ob1Dk4nx/dWTets/l3q9G3qhwjcQ+Zuh9l2LcXOWN9Zpb
         PbdP3Qztdb7UsKfLrm3xP7bMgcgNtwfRnAYFgmraOwExQSgB9Gc3SF/hRJhkTX69v/sC
         VELbfDhBBm0v7IfXD/wO90n0qdHL34dUcPqqgl/SnZ/gfCxFyzEcQVyS8wj1XuF0lGPG
         THUOrIhH5Xt4UWeFgX8EcV7kU1r7KyExUf2NOwjmyIT1W/DwsEihqevt2VjvTVTf/Re+
         hxiooq9JHL2ROurhQyMl/Eoewa6EC4NVJi3x2CptRhbfIesTHZEkV4+dy0ewFYlmWjK8
         69ow==
X-Gm-Message-State: AOJu0YzXAKVfek3I6DpaBjeVyPNrzswPAbE/E+DGsvx3JSS9bnwlc52u
	scXqCj5JOAABwonvzUFwekHbezxdSznM9BJOOklilCKsaN9gUI1viOMEilcnZa7o1ATDoDd0Rgc
	h
X-Google-Smtp-Source: AGHT+IF50SDqGgceeW3CsPEBcNeJ0PL5EPjhbg/8nGx9CvGWLnseOxZrb86srxBbTQGY12J44ajtVA==
X-Received: by 2002:a17:90a:17a5:b0:2c2:41cf:b0f0 with SMTP id 98e67ed59e1d1-2c858297582mr5951809a91.43.1719292585538;
        Mon, 24 Jun 2024 22:16:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819a66833sm7695948a91.9.2024.06.24.22.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 22:16:24 -0700 (PDT)
Message-ID: <667a52a8.170a0220.9527.4311@mx.google.com>
Date: Mon, 24 Jun 2024 22:16:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240624
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 425 runs, 45 regressions (next-20240624)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 425 runs, 45 regressions (next-20240624)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cp514-2h-1130g7-volteer | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

k3-j721e-beagleboneai64      | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | clang-17 | multi_v7=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

rk3399-roc-pc                | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | clang-17 | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240624/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240624
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      62c97045b8f720c2eac807a5f38e26c9ed512371 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a153728c83397977e7099

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a153728c83397977e7=
09a
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1502b42a66401b7e70ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1502b42a66401b7e7=
0ef
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a153d5128cfaa837e707c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cbv514-1h-34uz-brya.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cbv514-1h-34uz-brya.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a153d5128cfaa837e7=
07d
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a14f666807434397e7097

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a14f666807434397e7=
098
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a152213cfe649eb7e70f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi5-brask.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi5-brask.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a152213cfe649eb7e7=
0f6
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-2h-1130g7-volteer | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1534523336dd5a7e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-2h-1130g7-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-2h-1130g7-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1534523336dd5a7e7=
070
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/667a12a5510eb8d1c87e708c

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a12a5510eb8d1=
c87e7091
        new failure (last pass: next-20240621)
        4 lines

    2024-06-25T00:43:06.021138  / #

    2024-06-25T00:43:06.026791   =


    2024-06-25T00:43:06.131679  / # #

    2024-06-25T00:43:06.137322  #

    2024-06-25T00:43:06.238845  / # export SHELL=3D/bin/sh

    2024-06-25T00:43:06.245029  export SHELL=3D/bin/sh

    2024-06-25T00:43:06.346904  / # . /lava-14547959/environment

    2024-06-25T00:43:06.352661  . /lava-14547959/environment

    2024-06-25T00:43:06.454160  / # /lava-14547959/bin/lava-test-runner /la=
va-14547959/0

    2024-06-25T00:43:06.459576  /lava-14547959/bin/lava-test-runner /lava-1=
4547959/0
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a153d523336dd5a7e7074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-3wh-r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-3wh-r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a153d523336dd5a7e7=
075
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a14eac6096109c67e7070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C433TA-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C433TA-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a14eac6096109c67e7=
071
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1570aed84b0d957e7085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1570aed84b0d957e7=
086
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1527d8cd850f6f7e708f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1527d8cd850f6f7e7=
090
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a154c87169cf6cb7e707e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a154c87169cf6cb7e7=
07f
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667a182c08f871cacd7e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a182c08f871cacd7e7=
070
        failing since 510 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1b40e31834e54f7e708e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1b40e31834e54f7e7=
08f
        failing since 385 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1d8402578dc5057e7071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1d8402578dc5057e7=
072
        failing since 454 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1e5428db9796927e71b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1e5428db9796927e7=
1b2
        failing since 451 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667a2bb027ec94c8d27e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a2bb027ec94c8=
d27e7072
        new failure (last pass: next-20240621)
        1 lines

    2024-06-25T02:30:04.299353  / # =

    2024-06-25T02:30:04.307493  =

    2024-06-25T02:30:04.413143  / # #
    2024-06-25T02:30:04.419155  #
    2024-06-25T02:30:04.537330  / # export SHELL=3D/bin/sh
    2024-06-25T02:30:04.547177  export SHELL=3D/bin/sh
    2024-06-25T02:30:04.649062  / # . /lava-1156047/environment
    2024-06-25T02:30:04.659176  . /lava-1156047/environment
    2024-06-25T02:30:04.761138  / # /lava-1156047/bin/lava-test-runner /lav=
a-1156047/0
    2024-06-25T02:30:04.771182  /lava-1156047/bin/lava-test-runner /lava-11=
56047/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/667a32cd28d75adaa67e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a32cd28d75ada=
a67e7072
        new failure (last pass: next-20240621)
        1 lines

    2024-06-25T03:00:05.557381  / # =

    2024-06-25T03:00:05.567119  =

    2024-06-25T03:00:05.672851  / # #
    2024-06-25T03:00:05.679292  #
    2024-06-25T03:00:05.796954  / # export SHELL=3D/bin/sh
    2024-06-25T03:00:05.807160  export SHELL=3D/bin/sh
    2024-06-25T03:00:05.908938  / # . /lava-1156078/environment
    2024-06-25T03:00:05.919156  . /lava-1156078/environment
    2024-06-25T03:00:06.021037  / # /lava-1156078/bin/lava-test-runner /lav=
a-1156078/0
    2024-06-25T03:00:06.030910  /lava-1156078/bin/lava-test-runner /lava-11=
56078/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a14ffb42a66401b7e70e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a14ffb42a66401b7e7=
0e5
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a152d751013c50a7e7074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a152d751013c50a7e7=
075
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a152f18f9d025587e7082

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a152f18f9d025587e7=
083
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a14feb42a66401b7e70e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a14feb42a66401b7e7=
0e2
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1506b42a66401b7e70f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1506b42a66401b7e7=
0f2
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a15eef3a7556ab37e707f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a15eef3a7556ab37e7=
080
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a152d28c83397977e7080

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a152d28c83397977e7=
081
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1609205946bcc87e70a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1609205946bcc87e7=
0a9
        failing since 805 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1bef10f1bd08057e7070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1bef10f1bd08057e7=
071
        failing since 96 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/667a153118f9d025587e7087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a153118f9d025587e7=
088
        new failure (last pass: next-20240621) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/667a174724330a49607e7074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-lenov=
o-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-lenov=
o-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a174724330a49607e7=
075
        failing since 4 days (last pass: next-20240619, first fail: next-20=
240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1607205946bcc87e70a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1607205946bcc87e7=
0a6
        new failure (last pass: next-20240621) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667a18d3c4aa5404fc7e7160

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a18d3c4aa5404fc7e7=
161
        failing since 95 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667a176b32645063df7e708a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a176b32645063df7e7=
08b
        failing since 580 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667a15ef6222e02b457e7099

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a15ef6222e02b457e7=
09a
        failing since 580 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-roc-pc                | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1a302b74f100a17e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1a302b74f100a17e7=
076
        failing since 4 days (last pass: next-20240613, first fail: next-20=
240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-roc-pc                | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1c5e1d7f96c2f77e71ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667a1c5e1d7f96c2f77e7=
1ac
        new failure (last pass: next-20240613) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667a177913655a2eab7e707f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a177913655a2e=
ab7e7084
        failing since 17 days (last pass: next-20240606, first fail: next-2=
0240607)
        28 lines

    2024-06-25T01:03:20.134718  / # =

    2024-06-25T01:03:20.294931  / # #
    2024-06-25T01:03:20.407001  / # export SHELL=3D/bin/sh
    2024-06-25T01:03:20.518796  / # . /lava-3864813/environment
    2024-06-25T01:03:20.630742  / # /lava-3864813/bin/lava-test-runner /lav=
a-3864813/0
    2024-06-25T01:03:20.749591  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-25T01:03:20.750572  + cd /lava-3864813/0/tests/0_dmesg
    2024-06-25T01:03:20.750952  + cat uuid
    2024-06-25T01:03:20.751267  + UUID=3D3864813_1.5.2.4.1
    2024-06-25T01:03:20.751551  <8>[  182.267660] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3864813_1.5.2.4.1> =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667a171991d6691c747e707f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a171991d6691c=
747e7084
        failing since 17 days (last pass: next-20240606, first fail: next-2=
0240607)
        27 lines

    2024-06-25T01:01:55.962384  / # =

    2024-06-25T01:01:55.966271  =

    2024-06-25T01:01:56.071250  / # #
    2024-06-25T01:01:56.074947  #
    2024-06-25T01:01:56.177574  / # export SHELL=3D/bin/sh
    2024-06-25T01:01:56.181346  export SHELL=3D/bin/sh
    2024-06-25T01:01:56.283772  / # . /lava-470769/environment
    2024-06-25T01:01:56.288606  . /lava-470769/environment
    2024-06-25T01:01:56.389774  / # /lava-470769/bin/lava-test-runner /lava=
-470769/0
    2024-06-25T01:01:56.393506  /lava-470769/bin/lava-test-runner /lava-470=
769/0 =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1a1a905727ed007e7091

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a1a1a905727ed=
007e7096
        failing since 17 days (last pass: next-20240605, first fail: next-2=
0240607)
        26 lines

    2024-06-25T01:14:48.723270  / # =

    2024-06-25T01:14:48.835158  / # #
    2024-06-25T01:14:48.946893  / # export SHELL=3D/bin/sh
    2024-06-25T01:14:49.059268  / # . /lava-3864829/environment
    2024-06-25T01:14:49.170588  / # /lava-3864829/bin/lava-test-runner /lav=
a-3864829/0
    2024-06-25T01:14:49.250782  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-25T01:14:49.279675  + cd /lava-3864829/0/tests/0_dmesg
    2024-06-25T01:14:49.279949  + cat uuid
    2024-06-25T01:14:49.280137  + UUID=3D3864829_1.5.2.4.1
    2024-06-25T01:14:49.280554  + set +x =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1c8574551e35047e7079

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a1c8574551e35=
047e707e
        failing since 17 days (last pass: next-20240606, first fail: next-2=
0240607)
        29 lines

    2024-06-25T01:24:58.792315  / # =

    2024-06-25T01:24:58.936179  / # #
    2024-06-25T01:24:59.048092  / # export SHELL=3D/bin/sh
    2024-06-25T01:24:59.176047  / # . /lava-3864876/environment
    2024-06-25T01:24:59.329330  / # /lava-3864876/bin/lava-test-runner /lav=
a-3864876/0
    2024-06-25T01:24:59.397999  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-25T01:24:59.398696  + cd /lava-3864876/0/tests/0_dmesg
    2024-06-25T01:24:59.399100  + cat uuid
    2024-06-25T01:24:59.399733  + UUID=3D3864876_1.5.2.4.1<8>[  182.720002]=
 <LAVA_SIGNAL_STARTRUN 0_dmesg 3864876_1.5.2.4.1>
    2024-06-25T01:24:59.400065   =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1df04e8518997e7e707d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a1df04e851899=
7e7e7082
        failing since 17 days (last pass: next-20240606, first fail: next-2=
0240607)
        28 lines

    2024-06-25T01:31:10.809642  / # =

    2024-06-25T01:31:10.970827  / # #
    2024-06-25T01:31:11.081828  / # export SHELL=3D/bin/sh
    2024-06-25T01:31:11.194252  / # . /lava-3864922/environment
    2024-06-25T01:31:11.306314  / # /lava-3864922/bin/lava-test-runner /lav=
a-3864922/0
    2024-06-25T01:31:11.416953  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-25T01:31:11.417436  + cd /lava-3864922/0/tests/0_dmesg
    2024-06-25T01:31:11.417631  + cat uuid
    2024-06-25T01:31:11.417790  + UUID=3D3864922_1.5.2.4.1
    2024-06-25T01:31:11.417939  <8>[  177.504392] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3864922_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/667a19e933c9b15c187e70b7

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a19e933c9b15c=
187e70bc
        failing since 17 days (last pass: next-20240605, first fail: next-2=
0240607)
        26 lines

    2024-06-25T01:13:50.222053  / # =

    2024-06-25T01:13:50.225987  =

    2024-06-25T01:13:50.329481  / # #
    2024-06-25T01:13:50.333209  #
    2024-06-25T01:13:50.435636  / # export SHELL=3D/bin/sh
    2024-06-25T01:13:50.439230  export SHELL=3D/bin/sh
    2024-06-25T01:13:50.541495  / # . /lava-470770/environment
    2024-06-25T01:13:50.545166  . /lava-470770/environment
    2024-06-25T01:13:50.647893  / # /lava-470770/bin/lava-test-runner /lava=
-470770/0
    2024-06-25T01:13:50.651449  /lava-470770/bin/lava-test-runner /lava-470=
770/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1bdd37c3e7722e7e709d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a1bdd37c3e772=
2e7e70a2
        failing since 17 days (last pass: next-20240606, first fail: next-2=
0240607)
        27 lines

    2024-06-25T01:22:08.365076  / # =

    2024-06-25T01:22:08.368887  =

    2024-06-25T01:22:08.473738  / # #
    2024-06-25T01:22:08.477792  #
    2024-06-25T01:22:08.580327  / # export SHELL=3D/bin/sh
    2024-06-25T01:22:08.584140  export SHELL=3D/bin/sh
    2024-06-25T01:22:08.686704  / # . /lava-470773/environment
    2024-06-25T01:22:08.690546  . /lava-470773/environment
    2024-06-25T01:22:08.793897  / # /lava-470773/bin/lava-test-runner /lava=
-470773/0
    2024-06-25T01:22:08.797484  /lava-470773/bin/lava-test-runner /lava-470=
773/0 =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1dbd7edbe0f7197e7071

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a1dbd7edbe0f7=
197e7076
        failing since 17 days (last pass: next-20240606, first fail: next-2=
0240607)
        24 lines

    2024-06-25T01:30:17.814420  / # =

    2024-06-25T01:30:17.820879  =

    2024-06-25T01:30:17.925679  / # #
    2024-06-25T01:30:17.930174  #
    2024-06-25T01:30:18.032434  / # export SHELL=3D/bin/sh
    2024-06-25T01:30:18.037216  export SHELL=3D/bin/sh
    2024-06-25T01:30:18.138469  / # . /lava-470775/environment
    2024-06-25T01:30:18.144177  . /lava-470775/environment
    2024-06-25T01:30:18.247296  / # /lava-470775/bin/lava-test-runner /lava=
-470775/0
    2024-06-25T01:30:18.252486  /lava-470775/bin/lava-test-runner /lava-470=
775/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1b0afa44e2f58c7e707f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a1b0afa44e2f5=
8c7e7084
        failing since 17 days (last pass: next-20240606, first fail: next-2=
0240607)
        9 lines

    2024-06-25T01:18:51.463869  / # =

    2024-06-25T01:18:51.565687  / # #
    2024-06-25T01:18:51.668053  / # export SHELL=3D/bin/sh
    2024-06-25T01:18:51.771900  / # . /lava-3864871/environment
    2024-06-25T01:18:51.792863  / # /lava-3864871/bin/lava-test-runner /lav=
a-3864871/0
    2024-06-25T01:18:51.871699  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-25T01:18:51.901408  + cd /lava-3864871/0/tests/0_dmesg
    2024-06-25T01:18:51.901609  + cat uuid
    2024-06-25T01:18:51.901961  + UUID=3D3864871_1.5.2.4.1<8>[  160.321095]=
 <LAVA_SIGNAL_STARTRUN 0_dmesg 3864871_1.5.2.4.1>
    2024-06-25T01:18:51.902086   =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667a1ad994398f29237e7070

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240624/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240624/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667a1ad994398f29=
237e7075
        failing since 17 days (last pass: next-20240606, first fail: next-2=
0240607)
        10 lines

    2024-06-25T01:17:59.504327  / # =

    2024-06-25T01:17:59.508788  =

    2024-06-25T01:17:59.612256  / # #
    2024-06-25T01:17:59.615832  #
    2024-06-25T01:17:59.718595  / # export SHELL=3D/bin/sh
    2024-06-25T01:17:59.722165  export SHELL=3D/bin/sh
    2024-06-25T01:17:59.824573  / # . /lava-470772/environment
    2024-06-25T01:17:59.828500  . /lava-470772/environment
    2024-06-25T01:17:59.931607  / # /lava-470772/bin/lava-test-runner /lava=
-470772/0
    2024-06-25T01:17:59.935369  /lava-470772/bin/lava-test-runner /lava-470=
772/0 =

    ... (9 line(s) more)  =

 =20

