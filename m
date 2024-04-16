Return-Path: <linux-next+bounces-1948-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7D38A7628
	for <lists+linux-next@lfdr.de>; Tue, 16 Apr 2024 23:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D17342837C6
	for <lists+linux-next@lfdr.de>; Tue, 16 Apr 2024 21:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C241A5A4CF;
	Tue, 16 Apr 2024 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xGZuiaeu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27F41E864
	for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713302016; cv=none; b=pVHNBJmtQ/Ozm/PHtsP0lTGpWma/e7Kzjue9m8nytzmYUe6G8RYYjPyNhyXLKWefmIkcZOH8sP2U2xPvIwCBHv3TGm9loqsRB8z9FPz8niDT4+dBPa56HHjjJaAF3eM9y3+vDBe9ggelV1hOzRZT3orjH1mpxbsOwidzILt2IKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713302016; c=relaxed/simple;
	bh=YEScpSx8asa/fnyjKD4H6m1uk5FXl6vVJGcOYEXP6Y4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=MHofnigfyazPZ9HqHnYGTK0JDAuudxAhnrw3sWXeogw9s2hNdePKq2zjGz64AeDrYdianj746lLeMhvQ4WmN/UW6F0pXEQbjirkIdMTqvLze4RDqOU0s4M137hLkhkavm0ake9nuRVnZR7/WcmyK+/z2y6091VPSFOz9RLvbEOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xGZuiaeu; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e6723c606dso21495125ad.1
        for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 14:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713302014; x=1713906814; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0as/KJfOPCKxtdbsBns2IFeAsYLFz+ieCk1Zae0Vvp4=;
        b=xGZuiaeuN92eh4yHhxZ+FWDDMqyPzLMzdg4qjCNG7pPDr42Fhu/DwEmp3KNi7evfiY
         iK0ytjihNLPc7BzU8rBtiKmResBVuUgkMP1+a+r4h/mOuZ6PtKaTnY5umCg/OhSpIIky
         ltn44boHPZ9i4AA73Sp69CokE00L0L9biPbMHQqJEnJwT6DjNtuRl/5nhh5Ujvuc66Rh
         Uw2ikJn6FZ0aMMCnRsFr/YhfayqwcttFKEWvWjlWwOk13KNWGFPjFbBOxM7yU1lPKVwR
         PHZwzc4zPWzF4XFI1RFO+T+urs2qkAV/wnyxEmr5Rz/vEEP3vgdYyq6XXnMU/KkKtfmH
         r77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713302014; x=1713906814;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0as/KJfOPCKxtdbsBns2IFeAsYLFz+ieCk1Zae0Vvp4=;
        b=vdJQPiWJjkTEuFVw9cX3K/FpP/ygc1LQ82MRhTs4hGIrpOflKnG3rp6G96i9p+xuUp
         gBoriYgHitTCGsFtXtNwCut0kVJRHK2Uk5+JTlorJA0L25nvYewZTmn5avy/irsqLEJa
         RcHw8ZDUb8AzquafRWdusPicNrBONilYwgW9Xo/x1eHkJ4/XnGm69urcPh/HL48hQcQ8
         hr/D5Wbkr2qCOs+e9z6qcE6W2cGEgI0jBJDz2ylA416U3v1Rehztt55junGGRa6wPHNr
         UPoyAx+VDma3miev7fJe4IG91h/1nYExti3xCChNm0akUHgCT2MHQ8MsJ5i/6ldihS1y
         nK6w==
X-Gm-Message-State: AOJu0YyAlPJvJTjmdAlhpwOz1x5hhZEgXdbG9dQYL/91z46nxEw13i3F
	wAkJEPC1QH0Vrin0Me23Z5It5rrkidrmFPLOZkB1E57DtC3Damqmsz+KeR2fc2sYyFLYg401Cx/
	EY4o=
X-Google-Smtp-Source: AGHT+IEjgZ0uGMwpXnEmDwyUpTDHeCzG5pGt1+GKVa6Xe72/Swk1QBxL2+snOrt8wf7nZFMHKryT2Q==
X-Received: by 2002:a17:902:e750:b0:1e3:e243:1995 with SMTP id p16-20020a170902e75000b001e3e2431995mr19004743plf.1.1713302013717;
        Tue, 16 Apr 2024 14:13:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902ceca00b001e41e968a61sm10202394plg.223.2024.04.16.14.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:13:33 -0700 (PDT)
Message-ID: <661ee9fd.170a0220.616ce.e6e9@mx.google.com>
Date: Tue, 16 Apr 2024 14:13:33 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc4-325-gdafd70710825
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 69 runs,
 2 regressions (v6.9-rc4-325-gdafd70710825)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 69 runs, 2 regressions (v6.9-rc4-325-gdafd7071=
0825)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc4-325-gdafd70710825/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc4-325-gdafd70710825
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dafd70710825d144650cc2c585176ae5d63e0b85 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/661ec4e1201dd841684c42df

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc4-32=
5-gdafd70710825/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc4-32=
5-gdafd70710825/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/661ec4e2201dd841=
684c42e4
        new failure (last pass: v6.9-rc3-520-g66cd11927ee9)
        1 lines

    2024-04-16T18:34:57.040479  / # =

    2024-04-16T18:34:57.049416  =

    2024-04-16T18:34:57.154523  / # #
    2024-04-16T18:34:57.161342  #
    2024-04-16T18:34:57.305446  / # export SHELL=3D/bin/sh
    2024-04-16T18:34:57.321357  export SHELL=3D/bin/sh
    2024-04-16T18:34:57.422978  / # . /lava-1121122/environment
    2024-04-16T18:34:57.433174  . /lava-1121122/environment
    2024-04-16T18:34:57.535005  / # /lava-1121122/bin/lava-test-runner /lav=
a-1121122/0
    2024-04-16T18:34:57.545073  /lava-1121122/bin/lava-test-runner /lava-11=
21122/0 =

    ... (9 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/661eb5f463beeedc614c42f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc4-32=
5-gdafd70710825/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc4-32=
5-gdafd70710825/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661eb5f463beeedc614c4=
2f8
        new failure (last pass: v6.9-rc3-520-g66cd11927ee9) =

 =20

