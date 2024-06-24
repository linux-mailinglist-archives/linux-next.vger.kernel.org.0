Return-Path: <linux-next+bounces-2655-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C69E99158CB
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 23:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E74231C22DC4
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 21:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABC119EED2;
	Mon, 24 Jun 2024 21:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="K1ySumwd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A5E19EECF
	for <linux-next@vger.kernel.org>; Mon, 24 Jun 2024 21:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719264168; cv=none; b=VRt+u4JOe3RjtnjZv2x7ZzHTLbF8lLMduewpa2BMcT9HWsJDfbJUKDo4q1yAXUJtRkTVYTZxhVuChlv7PNYHFcF8PlUpN7ur3HaPoGtT873j11D7udozf9GRF+NPzAGrIwpzNUlU+bLlaKQuCwgwypogq/gtkvN/WWGShK5CfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719264168; c=relaxed/simple;
	bh=NlFVMtcOKUvB6uFfno979lFMM4dT2WwKZBpQ1l2LN2g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nZlxS2sa5OVIuS+UDIkglvdzyEmUcOFy/VLRhdC5k9+mnYSgkU6+dWQfHfoy1QIwbDH3j+O4CIDrR/BAYlYJ4G1HPXux8qMp/URt4yj69KY72mB8+O6RI2qASkBlG74fsM7EeT2dnWQiLJ9Osa9vx03MlGvJsU9BGI0ge9TsZ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=K1ySumwd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f4c7b022f8so42232965ad.1
        for <linux-next@vger.kernel.org>; Mon, 24 Jun 2024 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719264165; x=1719868965; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CqvY/oYhNhaIk6/r4Lnk5Kt1AODY6i0EOi5Aat00VGw=;
        b=K1ySumwdMRj8psaxIPQs3fo0F1x3M4rgS1ttEosDP2iSmZKgbLNaNv7GUwGd7erzNt
         W7Uwj7lX3lF2ST1DkW23K8D2xNxfxCCHSJPYCMR0XG5IO7qFXcH/su6ZtoovcqzJcPFa
         Ygz6m9fHj6ZoyhQAs9qeJ2WBvdr3dHu9mSXiO0jS4mggggePm/0w225lB0npcmd/nx5h
         ebQ4vqU+nmRxeV3DYWGv9npUoHvAaIhccQVfZkCt2jLzMFewjd7vJAujYTObid0NFiF3
         bUQqM+HrnqeIfQ+g4U4RBsC60QODuWgQBexqWGuMRmIb63jG8Yaadt1wCx53B0v5MCt2
         4BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719264165; x=1719868965;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqvY/oYhNhaIk6/r4Lnk5Kt1AODY6i0EOi5Aat00VGw=;
        b=r/G0ibKNByI2bwiPSkN9UhA8kw2yKVeHuQ7769tH0RrrByQT5O+yhBiCoA1mLJXog2
         WSaSw1/19J4EdLsh8dJJvDczpm81c44Z7mOxmHiwzJ10lEGL0nkYfF8B7PSu0aRl/WYH
         WqbP0orb6Y6+PJqYK1eUU/yDJWEApoMfVJKm/mn/YOJkZRlXT+rieM9Elhu4ymmenF4y
         RxP0o9D7dZDn1CAG39VDKUysdIPso8edLiT3u8wR25Ijyn0l/sfuT6XLDmYDQ488ACMe
         VP9SEcf9xYcFsMZZuyFpi1eOnk5+rYsqpfQmvLu9Of4W6FjpCZGyQ+pO8s6ajMH1B9uA
         iQlg==
X-Gm-Message-State: AOJu0YwNWu5/bq5/8xxN+9WDOy54E3MDUX8x0E3ymcTP9FWZSFOr6R1+
	SNIn2ouzJ4AdzZ7BdDeSWgBr8P/ylbUKyatL+rLL4nMoLNFLd4u7oOuG976sN+nmpjS946rl/kB
	h
X-Google-Smtp-Source: AGHT+IHmy1AtIn7gtzHQrO7VPtUwq0LiPsMoM6xrqp4g6lE/AWIxN0upcxy0aW1BTZKfuC/Y61+VOw==
X-Received: by 2002:a17:902:e84d:b0:1fa:bf7:2cd1 with SMTP id d9443c01a7336-1fa23ecb5a2mr71222025ad.32.1719264165532;
        Mon, 24 Jun 2024 14:22:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9f20598ffsm64847535ad.124.2024.06.24.14.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:22:45 -0700 (PDT)
Message-ID: <6679e3a5.170a0220.e0d0e.0ac2@mx.google.com>
Date: Mon, 24 Jun 2024 14:22:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc5-208-gd80fbb8036fc7
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 75 runs,
 2 regressions (v6.10-rc5-208-gd80fbb8036fc7)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 75 runs, 2 regressions (v6.10-rc5-208-gd80fbb8=
036fc7)

Regressions Summary
-------------------

platform         | arch | lab          | compiler | defconfig          | re=
gressions
-----------------+------+--------------+----------+--------------------+---=
---------
beaglebone-black | arm  | lab-cip      | gcc-10   | multi_v7_defconfig | 1 =
         =

jetson-tk1       | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1 =
         =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc5-208-gd80fbb8036fc7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc5-208-gd80fbb8036fc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d80fbb8036fc719a716b68659768e315a56e24ef =



Test Regressions
---------------- =



platform         | arch | lab          | compiler | defconfig          | re=
gressions
-----------------+------+--------------+----------+--------------------+---=
---------
beaglebone-black | arm  | lab-cip      | gcc-10   | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6679c1fa9c782b166f7e7079

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-2=
08-gd80fbb8036fc7/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-2=
08-gd80fbb8036fc7/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6679c1fa9c782b16=
6f7e707e
        new failure (last pass: v6.10-rc4-318-gc7e7720403303)
        1 lines

    2024-06-24T18:58:57.215135  / # =

    2024-06-24T18:58:57.224097  =

    2024-06-24T18:58:57.328740  / # #
    2024-06-24T18:58:57.336244  #
    2024-06-24T18:58:57.438383  / # export SHELL=3D/bin/sh
    2024-06-24T18:58:57.448202  export SHELL=3D/bin/sh
    2024-06-24T18:58:57.550079  / # . /lava-1155725/environment
    2024-06-24T18:58:57.560159  . /lava-1155725/environment
    2024-06-24T18:58:57.661962  / # /lava-1155725/bin/lava-test-runner /lav=
a-1155725/0
    2024-06-24T18:58:57.671571  /lava-1155725/bin/lava-test-runner /lava-11=
55725/0 =

    ... (9 line(s) more)  =

 =



platform         | arch | lab          | compiler | defconfig          | re=
gressions
-----------------+------+--------------+----------+--------------------+---=
---------
jetson-tk1       | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6679b128edb11052bb7e708f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-2=
08-gd80fbb8036fc7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc5-2=
08-gd80fbb8036fc7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6679b128edb11052bb7e7=
090
        failing since 6 days (last pass: v6.3-10703-gb3f869e79cdf0, first f=
ail: v6.10-rc4-262-g1ce98b2c2d5b0) =

 =20

