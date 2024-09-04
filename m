Return-Path: <linux-next+bounces-3578-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DAF96B032
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 06:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90288B237A0
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 04:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2779635;
	Wed,  4 Sep 2024 04:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="rfqvfiFe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98ED2E401
	for <linux-next@vger.kernel.org>; Wed,  4 Sep 2024 04:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425766; cv=none; b=p9j75Oh9KXaAvJ9BHwbM+y7tyUPA0pCnIQS/XCNhDiRUbkZBUUEBQwGrMG6NlhVwtaOkTGcKPOwmam/nhHXz5kNwLMy1SY9VHwa+q4ABKmmUIAEk/odco3ASp/W+4O2RtsGRZovNIuNi1h3NQ7ayP7+Ox6yLM9pIOd38kVIFy2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425766; c=relaxed/simple;
	bh=pWVVAChwLIWvLTTMHSspXVCeRNS74HPy8sTPHtJkz5k=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PUQ9SzLiahlyPFtSDIHrsM7t1SUEWHPsuwhJQifz8xbQLI4zCe4dSlmGoltHzxD05ABsTu156yUpbOLJdshUw7fcw3kJ01QQ7Gvw5mjWK3WsO6/17ctJwJK4o1xzPRc/gdHq3iEqMAe+Tw4ZbPUPOHp0aY/8dAAzPK31CwisWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=rfqvfiFe; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-70f60d73436so3436279a34.1
        for <linux-next@vger.kernel.org>; Tue, 03 Sep 2024 21:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725425763; x=1726030563; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p+V9HbY9DD8i3Zrm10abIHLm1X6uqQbdtSWPXGYdFHs=;
        b=rfqvfiFe/O1RM1DELZtLyQ3YDCB8KBmwJIzGZHSV5m/4XkZXfdNNAPcLqCpMXrDYfA
         L22E9fUtVQg8DeUzXDHPUpAqF5iuEhhCUelMzCIPUc4xLU8hdltoi1S3tR9WglI54FVn
         bLw67kqJeCsWUyenvOTFvAPRCAoAtN5XOlY7xheHBdph9psEKqlDGalmFPfXLgzrXZr2
         TesaOaDrhqLxHEsOFAGDG4Y0Lyinb6Dz/OzqPS1ZwTJdjuOgG32NvE6ePj4QgJ4vMNJj
         frQygEKwe++kgU3Acy1HVKRaFoTZP2a66zrjAshprJe946UTBk7TC5SdFWiC+G0lOTot
         F1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425763; x=1726030563;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+V9HbY9DD8i3Zrm10abIHLm1X6uqQbdtSWPXGYdFHs=;
        b=LWMMKmC6xSZWVaBhDyMNsSoDN2RKME2706fMUxX7pcgADIAfc7ZdlNAqgANH1Y6yeB
         JswBK4mg7HDH2JIpk0xOADca1q0fXm7L/ykM3M9IoC4oGN7NZk7QcfzozFxQME5lx7s/
         Dv6Ljx7IrZEFDnl3a/5bAGD0PvEFwa7gGUQcb+UBztYQovuqB5k1DrlLssZ7n+HNh1YM
         4wNGe5P+rFoOazFmdrAFEPOHEZKNR/VdnOPBUvasfeUy8IaRYQKJkWAoE9WufONF9Yyl
         3ErZnzzeTYRIu3Skz+qtWElvPwvoDTg08GkDlied8jqkGiyLQCOK2qkByOodLL5iAX3x
         3syw==
X-Gm-Message-State: AOJu0Yzz7YSNNQWEqDr94wo/ZQhz1L+rPa6IvAy+1nDDLKUb7NGcQ0MN
	RpoQgtE0yWR//t+87wgzSHE4Jm3C8q+ZF2Sn4Va6Ldn7o0vSf4fKh+dcUMq+pLXm0MgXx9brxYo
	N
X-Google-Smtp-Source: AGHT+IGGHIItdRGOpNhN0iaZRYX2InyTBDh6C6+z7itFji/niI9FQ9ivZCxrzPisxrw7W3EQNvpw0A==
X-Received: by 2002:a05:6359:4129:b0:1b5:e9e2:cbe4 with SMTP id e5c5f4694b2df-1b603cd4f0bmr2475295155d.27.1725425763078;
        Tue, 03 Sep 2024 21:56:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778522984sm726502b3a.31.2024.09.03.21.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:56:02 -0700 (PDT)
Message-ID: <66d7e862.050a0220.11b31e.321e@mx.google.com>
Date: Tue, 03 Sep 2024 21:56:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.11-rc6-277-g1e62b52fb94b
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 33 runs,
 1 regressions (v6.11-rc6-277-g1e62b52fb94b)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 33 runs, 1 regressions (v6.11-rc6-277-g1e62b52=
fb94b)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.11-rc6-277-g1e62b52fb94b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.11-rc6-277-g1e62b52fb94b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1e62b52fb94b2c739e136835844af19b087f4a34 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-12   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/66d7bcaaa155ec9082c86855

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.11-rc6-2=
77-g1e62b52fb94b/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.11-rc6-2=
77-g1e62b52fb94b/arm/multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66d7bcaaa155ec90=
82c8685a
        new failure (last pass: v6.11-rc6-190-g360c419cbea7)
        1 lines

    2024-09-04T01:49:17.767579  / # =

    2024-09-04T01:49:17.776547  =

    2024-09-04T01:49:17.881542  / # #
    2024-09-04T01:49:17.888423  #
    2024-09-04T01:49:18.006211  / # export SHELL=3D/bin/sh
    2024-09-04T01:49:18.016147  export SHELL=3D/bin/sh
    2024-09-04T01:49:18.117979  / # . /lava-1188382/environment
    2024-09-04T01:49:18.128318  . /lava-1188382/environment
    2024-09-04T01:49:18.230184  / # /lava-1188382/bin/lava-test-runner /lav=
a-1188382/0
    2024-09-04T01:49:18.239973  /lava-1188382/bin/lava-test-runner /lava-11=
88382/0 =

    ... (9 line(s) more)  =

 =20

