Return-Path: <linux-next+bounces-2114-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D58B7A8E
	for <lists+linux-next@lfdr.de>; Tue, 30 Apr 2024 16:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02C5D2836DB
	for <lists+linux-next@lfdr.de>; Tue, 30 Apr 2024 14:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CAE152796;
	Tue, 30 Apr 2024 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="p+0007VD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782903C482
	for <linux-next@vger.kernel.org>; Tue, 30 Apr 2024 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714488608; cv=none; b=sI3JKVpS9UeFriV28CgYbbej1mpaD958bmj2pfBWQgFvrqiB3uDBLuAngvPIOlNtSJ6zZhk7ergw3Z3rN2rqW/azRvl41u5L69iVDPaJqa1Pxhr2c0Pov+V0fsB6smd6lbHq05C3/HsXMRmj1q9tM/66db7eQ37Y4PbQmgQYqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714488608; c=relaxed/simple;
	bh=vGAJH1ZFNh3ZBzQVoKtS1Q1XxRlqC0FanyNJE7aZrQI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=CP/cGtcChoYM7XkxNAhBFF2FuGS67CowzrGG29x2rBrroZ5uyrjKA8U18/jBfW8SgdU2P98k1j+Ssjv/09dD2/5efgbo4Pxs5Si69RRj6B0lW9VHz/E0nQLVQdjmbw5GAc3F74dbDbFkKIaLHNzcYDYe7bFPwgCn60nuBR+neHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=p+0007VD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1eab16c8d83so46244335ad.3
        for <linux-next@vger.kernel.org>; Tue, 30 Apr 2024 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714488605; x=1715093405; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0c9g2Dobd3ZdFP0XT7Ht/zCaYj73iEoNLJ9rz2ePK94=;
        b=p+0007VDfkFfYK6qNozAoSJG3KrQwYzhy3bHD38VPsgd4WBbOjhfiC/9fIzGWCgFaH
         Hr6IvhYcEP1pIWMYDHInRjY6mDBAloRIosUDJZgFJiKyPnZ5cjufRFbwLyyJNHkZMMCE
         pFu4VF4TlHT6eicCkV9B2vzW6IthZSiTeJKVQhW+DYtSmgR/Tq8/DE7rfxnfHNlQpZlO
         ndiMkE7cgxlNQOVWQyNdBPjEcyK91mV4/7nyS5sv6buY0jkUHc1KrRrrSMUYKfwDUtPO
         YaUtbR6nsniHqYs0jSlkTIHuqx2h+slMt70SxrAcBqGpnO0jZjV07tIIYkxNoO8WXD+j
         mWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714488605; x=1715093405;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0c9g2Dobd3ZdFP0XT7Ht/zCaYj73iEoNLJ9rz2ePK94=;
        b=O1qIAn1v1xqaav9GL81/sOzOjAQGbKscbfU+dq3BvAANTG0m0WenCFz2nja4Qon7kE
         ROVq/ZctQxJy0Y9yzQ6l9K0gxRsaLyGS+DYOur9pfen2Qrd+2zUdrN67bZgP5uTN6kyO
         9Mh+H7rgrn4h5NcTfmtdZaJFhDNo63Imy7Chv2KI7EGlm2P0aX7cvOJieuf+TSGdVSJN
         II0mF6GfW99ucUSzgQvVc6LdmR288VlTmSsTiyva5YTmGXuMG8NVRgVlWbPDpdA6HTQJ
         B7efBP+Xx/bsyIieZPWR7SkNH/mgbFjPyLO85BEzpoNg4RJEeaYyIoFDCRX+JmVu/ZHQ
         /wsw==
X-Gm-Message-State: AOJu0YxsmPFUhqSUMgFxB1Vl9C/rSPYrFoupBRlRNXtObp4ykqk5ZLdV
	n9sAZm0CW++FEcE+5VUMwMYMsRcE1T3BcAOV2cE99S2okwcWVjbHMu6D7vithrd6KtlRBi9tf78
	SOSY=
X-Google-Smtp-Source: AGHT+IGYrQCrl6J0S42Tu78louhxvLLJvobrzMalZXcUSvKTK5pt9MRqwsjgjSiNOpYdGx5rB+sJ/Q==
X-Received: by 2002:a17:902:e5d2:b0:1e7:b7a7:9f1f with SMTP id u18-20020a170902e5d200b001e7b7a79f1fmr18176425plf.2.1714488605361;
        Tue, 30 Apr 2024 07:50:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001ec5be2b733sm983599plh.123.2024.04.30.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:50:05 -0700 (PDT)
Message-ID: <6631051d.170a0220.b45e2.3381@mx.google.com>
Date: Tue, 30 Apr 2024 07:50:05 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240430
X-Kernelci-Report-Type: test
Subject: next/master baseline: 137 runs, 6 regressions (next-20240430)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 137 runs, 6 regressions (next-20240430)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-10   | sama5_defconfig  =
   | 1          =

bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | bcm2835_defconfig=
   | 1          =

beagle-xm             | arm  | lab-baylibre  | gcc-10   | omap2plus_defconf=
ig | 1          =

beaglebone-black      | arm  | lab-cip       | gcc-10   | omap2plus_defconf=
ig | 1          =

r8a7743-iwg20d-q7     | arm  | lab-cip       | gcc-10   | shmobile_defconfi=
g  | 1          =

rk3288-rock2-square   | arm  | lab-collabora | clang-17 | multi_v7_defconfi=
g  | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240430/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240430
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d04466706db5e241ee026f17b5f920e50dee26b5 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-10   | sama5_defconfig  =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/6630ca4fc9df3ded744c434a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240430/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240430/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6630ca4fc9df3ded744c4=
34b
        failing since 454 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | bcm2835_defconfig=
   | 1          =


  Details:     https://kernelci.org/test/plan/id/6630c38e48e72e5e8b4c44bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240430/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240430/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6630c38e48e72e5e8b4c4=
4be
        failing since 330 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
beagle-xm             | arm  | lab-baylibre  | gcc-10   | omap2plus_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/6630c897218e1974f64c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240430/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240430/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6630c897218e1974f64c4=
2db
        failing since 1 day (last pass: next-20240426, first fail: next-202=
40429) =

 =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
beaglebone-black      | arm  | lab-cip       | gcc-10   | omap2plus_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/6630d03d8539d6c7484c43e0

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240430/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240430/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6630d03d8539d6c7=
484c43e5
        new failure (last pass: next-20240429)
        1 lines

    2024-04-30T11:04:23.183028  / # =

    2024-04-30T11:04:23.191776  =

    2024-04-30T11:04:23.296979  / # #
    2024-04-30T11:04:23.303649  #
    2024-04-30T11:04:23.421513  / # export SHELL=3D/bin/sh
    2024-04-30T11:04:23.431716  export SHELL=3D/bin/sh
    2024-04-30T11:04:23.533556  / # . /lava-1126579/environment
    2024-04-30T11:04:23.543638  . /lava-1126579/environment
    2024-04-30T11:04:23.645480  / # /lava-1126579/bin/lava-test-runner /lav=
a-1126579/0
    2024-04-30T11:04:23.655650  /lava-1126579/bin/lava-test-runner /lava-11=
26579/0 =

    ... (9 line(s) more)  =

 =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
r8a7743-iwg20d-q7     | arm  | lab-cip       | gcc-10   | shmobile_defconfi=
g  | 1          =


  Details:     https://kernelci.org/test/plan/id/6630c2a313834193004c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240430/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240430/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6630c2a313834193004c4=
2e4
        new failure (last pass: next-20240429) =

 =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
rk3288-rock2-square   | arm  | lab-collabora | clang-17 | multi_v7_defconfi=
g  | 1          =


  Details:     https://kernelci.org/test/plan/id/6630d3810bca91bfb24c42e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240430/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240430/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6630d3810bca91bfb24c4=
2e9
        failing since 40 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =20

