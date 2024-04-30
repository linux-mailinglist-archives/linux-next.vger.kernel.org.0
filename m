Return-Path: <linux-next+bounces-2113-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DF8B748E
	for <lists+linux-next@lfdr.de>; Tue, 30 Apr 2024 13:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C781287B6C
	for <lists+linux-next@lfdr.de>; Tue, 30 Apr 2024 11:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E5612D1E9;
	Tue, 30 Apr 2024 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dBodaiXG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6B12C47A
	for <linux-next@vger.kernel.org>; Tue, 30 Apr 2024 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714476757; cv=none; b=go1OZ+Q6U3mMpdVfL2yCDanbclhu1zzf2U0ST/45lKsPTVTqUCAiGgWfd6hrFwgiMR5EzjdQ18XIHRmI+FqOW+nqCmynnI52DEt+ehR4wHFU2XzBBkrBXHzRkQIDEl3SemaP5C5f1yD8ryKFBGADTAqYJsD6D633Q4ed5zkpkOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714476757; c=relaxed/simple;
	bh=B8gKYIqySpCkO/yFtS+EGMy+NAlVPvnhf6ZyWZG2F4o=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=BS6iteJ84f3i2dLb5zUfvGX/YDSoX+wAwmC1htDTuNCyPGT81aKYuqeM1CEG67rYTgvw5dqAcAIHj8pQcLHNupED+UiuN1UGNxm6zz92rb6RTgsK1h3kxL4nue9LKojAsz9mIK8aN3o7m8soZF39lYPUlaurYLHJhaBbUWp1/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dBodaiXG; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6123726725eso1825953a12.3
        for <linux-next@vger.kernel.org>; Tue, 30 Apr 2024 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714476755; x=1715081555; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Efg3PcjkLib+4+attiCCgS698icKc7wvHXtlJdl1gB4=;
        b=dBodaiXGe7wsqHW4ApVazldAwpxWCPyyPUSzHPPZnzkffnZLhTB20vW2mODNAtYjmU
         +NNbzADlfzNRo7miu7hh6iLJTQCxZ7JlrE2CAeJGfyZppkyEZHUToT2ieV2Oo93DY1y8
         nsZcl3eHQv5ZQdXHxSFpDZKAU31MblkEMfqNEd7KuZ1Itj+UdNWErsbR4gmMKd+Wtg7/
         BxALUdrz/2L8AzrKAs4azuxF5KVN15KC6o93C1BpiTcUCLlR/+NPCGs0P70xKW96+zBd
         eFYD9j2aB/f9gnPheHfz1o4HYxp9qT5Bs6geEsVV3f4Q71qvlAJTt+nhrOSs+b+jZRAS
         dHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714476755; x=1715081555;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Efg3PcjkLib+4+attiCCgS698icKc7wvHXtlJdl1gB4=;
        b=SBolEgTreGkA5aSJsDpsH+2mJX8ext9w3Ut3SMv67aGSj7gP7K1D6EelCNipVSR/bn
         BgsYbs2+VxwEm5RefiGgcwGMIxImsnhNxAU4gJaI248Kka5o1FJzs7Dd+egOhVMnXM9t
         n2KfaFWBzEC1yL4jAyQx8Ax7engm5NMuy0U6evtEMQfrqklzL19bJA+0yJ99vYvBjQLN
         ol7MevcOmmTl3tBRtvFck/46DYn7NT3qDf3SIU2QvB7BnT4WdSv+H7GEvAkXCV1k1TCv
         fY1ezv7MCM2k5LSb49DVjOaODHAlvQEJlh7FTL6bnor0HSQ++NhaJyaG+Wh7EXwYQPLh
         ssFQ==
X-Gm-Message-State: AOJu0YwisVUt/qlnDO3IFQwotnKjgz76kzS2xvzC7/UX81RpIBhfvGf8
	iIcPXnsSgLQOqphopNWA/MwC6cHSrrSBZtW6Ai0B/RXAMsgMwKrpHc7lqjIGkESk4u5f5U02DyT
	rwXQ=
X-Google-Smtp-Source: AGHT+IGNHR9uMI4hzqjoroGDp1F85NVuifASdHDu6tx/HRXH65Urzp0NQmIti5TyUV96WutvM1IpFA==
X-Received: by 2002:a17:90a:f314:b0:2b1:74ad:e243 with SMTP id ca20-20020a17090af31400b002b174ade243mr5144785pjb.24.1714476755137;
        Tue, 30 Apr 2024 04:32:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id pb8-20020a17090b3c0800b002b08e6d885asm7169485pjb.3.2024.04.30.04.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 04:32:34 -0700 (PDT)
Message-ID: <6630d6d2.170a0220.7ab95.903d@mx.google.com>
Date: Tue, 30 Apr 2024 04:32:34 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc6-205-g3e8ecb3dccc6c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 70 runs,
 1 regressions (v6.9-rc6-205-g3e8ecb3dccc6c)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 70 runs, 1 regressions (v6.9-rc6-205-g3e8ecb3d=
ccc6c)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc6-205-g3e8ecb3dccc6c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc6-205-g3e8ecb3dccc6c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3e8ecb3dccc6c5d4be4ec8b03bfe74f76e57697d =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6630a940d7cc48b8184c42ea

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-20=
5-g3e8ecb3dccc6c/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc6-20=
5-g3e8ecb3dccc6c/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6630a941d7cc48b8=
184c42ef
        new failure (last pass: v6.9-rc5-365-g68d7c66c8435)
        1 lines

    2024-04-30T08:17:50.611406  / # =

    2024-04-30T08:17:50.620230  =

    2024-04-30T08:17:50.726249  / # #
    2024-04-30T08:17:50.731975  #
    2024-04-30T08:17:50.850002  / # export SHELL=3D/bin/sh
    2024-04-30T08:17:50.860074  export SHELL=3D/bin/sh
    2024-04-30T08:17:50.961955  / # . /lava-1126418/environment
    2024-04-30T08:17:50.971867  . /lava-1126418/environment
    2024-04-30T08:17:51.073791  / # /lava-1126418/bin/lava-test-runner /lav=
a-1126418/0
    2024-04-30T08:17:51.083808  /lava-1126418/bin/lava-test-runner /lava-11=
26418/0 =

    ... (9 line(s) more)  =

 =20

