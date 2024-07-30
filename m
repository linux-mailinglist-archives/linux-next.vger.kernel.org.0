Return-Path: <linux-next+bounces-3166-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E7940FDC
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 12:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6812B1C22C7C
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 10:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF5819E804;
	Tue, 30 Jul 2024 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="QZ2y8hJo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46E119DF70
	for <linux-next@vger.kernel.org>; Tue, 30 Jul 2024 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722336219; cv=none; b=IjcsfQp0UxMmnoDlHGtz9SoDZ/r9f9OJVHurFp5w5FvPx7RcZ4ngRj06WL9Sh2omvbYSnuUO3tH87k2uUhUyn+V4pX3lWQPh/evuLAzKRC7YaAQHmUmdCKHRgYvn92qhG/UGqDJ48EkPGE/UuKQ0HASuZu9pKKljJxHiqjdfUI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722336219; c=relaxed/simple;
	bh=/TOZR3XgzOz3utcaMfUEoKm9IQQGYsbeoCzj6R0Hjjg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=uTBKlXZeAKmH+JBTK3oGTIA5xAwhVqPiv2sp+wH1pWD9ub6URPT3SqvFukE8tMlrthK9F833wzP/7LBmehM8MWLtdiQBGYZ5PFoMWSJkXubCZU+t5bMyeVCHCUOC82F/tJP7wqS/KI3+ADAYR7WzYLxeON8ShpOV6PihfdAvMDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=QZ2y8hJo; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-70943b07c2cso1906516a34.1
        for <linux-next@vger.kernel.org>; Tue, 30 Jul 2024 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1722336217; x=1722941017; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gThePaYVKUi0JJP3dGIac5ktbAJsd9CQI9dAdr0Umso=;
        b=QZ2y8hJo6ZeOy45zrZI3jsQM5d9ZRUmGPMMgpcimIDqDAPVikucVHLLMfq6D2+3B9h
         FaqCuqat2J0LEgi0ucNKYh4FFgsfN22CjaYxU+Cr9mZlW0zSeKR5yq5SJ/7YxrqfJu9l
         xAEg4A9reG6Zr/hPiashtHz0LO9szg+LzfJ6uyLyVpj9Fw4msowaooLFMGLEXEM7+AQ/
         1vfCYPDEWrSfhpjXbUIdgxbJoXiAoMvlX54zJwUIagLEZ8+ojJFGE50hraZRGyQg+L2L
         HLKhOsM//gDMRi8QugHofQ5UhQNBzRw5PnsLHBOEr6/J4GO/J7o/ztlk1H8SL9kaPOMI
         2JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722336217; x=1722941017;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gThePaYVKUi0JJP3dGIac5ktbAJsd9CQI9dAdr0Umso=;
        b=f6lvfcbqkUB0B0MKrIpsV1n/Q/nAXjal6RVG/+pvjy9tFA9wrXB/965UQGHKB+Miht
         UhkxOLmUuPPPx+Clow5qLGJ4scGIMhmhJ4clwklJUtJ12urnFPdWdhlYMAxeMW5EjtPV
         88CJHgXEmeRIr+3KEps5xdYxGMggiDo6efQgKWQjTspVvI3lTfuklhx1h1jTR6F/Gi3+
         1p5l6pkT5IHqfMD2qRGakUd20WwnH90jQg04kirNvmVT5E0Bb8rxG11FJabFFJshBuYc
         bpR7l7k4SyZrlnXQisdwu3EofYV7lZxAonSPat+rH/GKsGPnpxn90pXojojp+UEfRj4u
         HAMg==
X-Gm-Message-State: AOJu0YwROPTmEhOfJiTxSOhGy4uGo6QVr14DGZqy68dLO+Zh+WUmCaYn
	vaU26uVYBBRDN169tWmDSC17nBStaCDcUiTtR7TxMjcBojrocNw/jF2wEYeC/qtFrPfbdJESToy
	G
X-Google-Smtp-Source: AGHT+IEnFdKJ+XXviyryHalAXOB4slHDKhO/g1yC4Ynzb7gD0XcSacTDWK+CUVnV5lIWKODXaYSh9A==
X-Received: by 2002:a05:6830:6e85:b0:709:488f:b632 with SMTP id 46e09a7af769-709488fb96emr10092497a34.25.1722336216624;
        Tue, 30 Jul 2024 03:43:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead874ae3sm8220031b3a.161.2024.07.30.03.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:43:36 -0700 (PDT)
Message-ID: <66a8c3d8.a70a0220.1bf330.4246@mx.google.com>
Date: Tue, 30 Jul 2024 03:43:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.11-rc1-181-g985785dd5ee1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 36 runs,
 2 regressions (v6.11-rc1-181-g985785dd5ee1)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 36 runs, 2 regressions (v6.11-rc1-181-g985785d=
d5ee1)

Regressions Summary
-------------------

platform                    | arch | lab         | compiler | defconfig    =
      | regressions
----------------------------+------+-------------+----------+--------------=
------+------------
beaglebone-black            | arm  | lab-cip     | gcc-12   | multi_v7_defc=
onfig | 1          =

stm32mp157a-dhcor-avenger96 | arm  | lab-broonie | gcc-12   | multi_v7_defc=
onfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.11-rc1-181-g985785dd5ee1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.11-rc1-181-g985785dd5ee1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      985785dd5ee12a4124524909ee367a193977f113 =



Test Regressions
---------------- =



platform                    | arch | lab         | compiler | defconfig    =
      | regressions
----------------------------+------+-------------+----------+--------------=
------+------------
beaglebone-black            | arm  | lab-cip     | gcc-12   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/66a89826492c60e2f87e707a

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.11-rc1-1=
81-g985785dd5ee1/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.11-rc1-1=
81-g985785dd5ee1/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66a89826492c60e2=
f87e707f
        new failure (last pass: v6.11-rc1-104-g06ea2053b2ca4)
        1 lines

    2024-07-30T07:36:53.638445  / # =

    2024-07-30T07:36:53.646998  =

    2024-07-30T07:36:53.752056  / # #
    2024-07-30T07:36:53.759069  #
    2024-07-30T07:36:53.861091  / # export SHELL=3D/bin/sh
    2024-07-30T07:36:53.871069  export SHELL=3D/bin/sh
    2024-07-30T07:36:53.972907  / # . /lava-1175526/environment
    2024-07-30T07:36:53.982123  . /lava-1175526/environment
    2024-07-30T07:36:54.083825  / # /lava-1175526/bin/lava-test-runner /lav=
a-1175526/0
    2024-07-30T07:36:54.094820  /lava-1175526/bin/lava-test-runner /lava-11=
75526/0 =

    ... (9 line(s) more)  =

 =



platform                    | arch | lab         | compiler | defconfig    =
      | regressions
----------------------------+------+-------------+----------+--------------=
------+------------
stm32mp157a-dhcor-avenger96 | arm  | lab-broonie | gcc-12   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/66a893e06df7d90d837e7159

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.11-rc1-1=
81-g985785dd5ee1/arm/multi_v7_defconfig/gcc-12/lab-broonie/baseline-stm32mp=
157a-dhcor-avenger96.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.11-rc1-1=
81-g985785dd5ee1/arm/multi_v7_defconfig/gcc-12/lab-broonie/baseline-stm32mp=
157a-dhcor-avenger96.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66a893e06df7d90d837e7=
15a
        new failure (last pass: v6.11-rc1-104-g06ea2053b2ca4) =

 =20

