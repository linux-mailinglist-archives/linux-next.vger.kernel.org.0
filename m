Return-Path: <linux-next+bounces-2209-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F13968BEB7A
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 20:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0214C1C20D6B
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 18:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C2F168AF5;
	Tue,  7 May 2024 18:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RxebSTqe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFDD73513
	for <linux-next@vger.kernel.org>; Tue,  7 May 2024 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715106384; cv=none; b=PGX5sEWVoECUhKLMSknCGa71Fu3EEAVXFVJNm0IYdg5Erhx7tnbjUlq1WfgOnj2ieYbtTiDZyN03Xc8IX95ZdwQcHhWgLHMB5txETV7QdCbAYZRxVJCgAxUOyh5+HCdEjfYUZrGuFppyORJKxftG19XcEocp9T2rfogEd+s3DNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715106384; c=relaxed/simple;
	bh=T8DT0Vn7g5Mm4CbGeGoPsB3pXMsml0PyHJ3KAdmPC3s=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cMngVA6bwt4/1ZfWoAC49YMOQ7Lc++1Oq6muSm0FWcP7rJfefA99TE8GHjmGgZOc0QDlvQJ0YfcVN0cJotWTVyt/MucMEkTzG9UhNpJs2sruNrFvDd5YU90qNdcWeJjarqsrolRrsZPvlWF8HwRiIRxczMo7zsR79gfxRoQCwQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=RxebSTqe; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e651a9f3ffso17437285ad.1
        for <linux-next@vger.kernel.org>; Tue, 07 May 2024 11:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715106381; x=1715711181; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c6Pi0FXqvmQAyEixssMGoZeTsp8waWFoQivfqcKfuNg=;
        b=RxebSTqeOsq6iGrY5DGKVEnkmgqcw6Ft5Fqobhmqkqs/Oh2qA5/sJoXomG7fsdkaoa
         5pbrWAIuzF/4tNgQ3i+HBaeOZBBnQw74aANK0yrarIUxIySi0x6C7R35avIa2dePOf2r
         Ei/uXmKv2X5uj9Z64x37FaGJFWGLoVUEge0qqmIGD75Lbg9YjN19atH2gJuHr5qpkHna
         Z+gxHUXiZZImCa6v2U+xfOkprerNGcAKwMkyMbeK93MP5PtC4zrSF6BwBS9r53K5Fo+r
         6dCB6U5ziG2Eefs5goVXC4HnjptjgH48teYSCIi84tSPTPfKNfhLlKMD4DhqeF1Vmgu2
         nyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715106381; x=1715711181;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6Pi0FXqvmQAyEixssMGoZeTsp8waWFoQivfqcKfuNg=;
        b=WCrtxlxnN21+pNB6ZKYivsnWMtevQqxdA2+KGcRNpvVMy+46cMQH9w9bccCqN/x9t2
         yd1dWcK/TUTc4ckSy92kssLchIAMm36AgEtIWrMUY0MbqzV7mdpz4fMC4BVF9p27Xxvs
         fyTb6wkSySPSF3OrAWSHcM5O4TGRzbVRukDxPgre1rv/evb4ae0Eu6lnJzdPMUyRvWEf
         Rp883uB2ES6/+7TLxRTqjgAf7eoeqG3VJAOk2Csi68GGcxv3EZWMC5haj8vcHfo7Ah1m
         L+iosSiMLN/9XBonKpdt2kwQjdhhA1fbTunNBYGco8e2Iw7yHIgX0K4gvVDlXYdKB4/m
         a+qQ==
X-Gm-Message-State: AOJu0YyJAnPxVtdyZUQ7v33AGyB/n0Yulq14nlWYqrMVEusvPxpAYaB3
	eWuqcMnb03GHtgXQbzwHqj2k8ecUfdDAv+wYOv2yrjt++QSaOhYJiWTwt54FgQphMMNcTi698oA
	8
X-Google-Smtp-Source: AGHT+IFir04CTiN5it+GidfIVFJytEaJNWJLF+isCx5dixS7PopB70QyGXcR0D8PWcF3JdzLdU/6GA==
X-Received: by 2002:a17:902:c944:b0:1e8:9f46:c1af with SMTP id d9443c01a7336-1eeb079696amr3874705ad.63.1715106381423;
        Tue, 07 May 2024 11:26:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id km6-20020a17090327c600b001ebf263d2fasm10383770plb.7.2024.05.07.11.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 11:26:21 -0700 (PDT)
Message-ID: <663a724d.170a0220.7b43.ffdd@mx.google.com>
Date: Tue, 07 May 2024 11:26:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.9-rc7-121-g9b1e89a69d08
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 79 runs,
 2 regressions (v6.9-rc7-121-g9b1e89a69d08)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 79 runs, 2 regressions (v6.9-rc7-121-g9b1e89a6=
9d08)

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
v6.9-rc7-121-g9b1e89a69d08/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc7-121-g9b1e89a69d08
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9b1e89a69d0843b8aa85621fba79deead84eb6d1 =



Test Regressions
---------------- =



platform         | arch | lab          | compiler | defconfig          | re=
gressions
-----------------+------+--------------+----------+--------------------+---=
---------
beaglebone-black | arm  | lab-cip      | gcc-10   | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/663a47ee5ed799de974c42e7

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc7-12=
1-g9b1e89a69d08/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc7-12=
1-g9b1e89a69d08/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/663a47ee5ed799de=
974c42ec
        new failure (last pass: v6.9-rc6-300-gbd494b917bde3)
        1 lines

    2024-05-07T15:25:22.628273  / # =

    2024-05-07T15:25:22.637868  =

    2024-05-07T15:25:22.743337  / # #
    2024-05-07T15:25:22.749868  #
    2024-05-07T15:25:22.893557  / # export SHELL=3D/bin/sh
    2024-05-07T15:25:22.909827  export SHELL=3D/bin/sh
    2024-05-07T15:25:23.011441  / # . /lava-1129507/environment
    2024-05-07T15:25:23.021768  . /lava-1129507/environment
    2024-05-07T15:25:23.123730  / # /lava-1129507/bin/lava-test-runner /lav=
a-1129507/0
    2024-05-07T15:25:23.133588  /lava-1129507/bin/lava-test-runner /lava-11=
29507/0 =

    ... (9 line(s) more)  =

 =



platform         | arch | lab          | compiler | defconfig          | re=
gressions
-----------------+------+--------------+----------+--------------------+---=
---------
jetson-tk1       | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/663a41d498b18fc98a4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc7-12=
1-g9b1e89a69d08/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc7-12=
1-g9b1e89a69d08/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-=
tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663a41d498b18fc98a4c4=
2db
        failing since 43 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

