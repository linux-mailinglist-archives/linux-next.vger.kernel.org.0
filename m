Return-Path: <linux-next+bounces-209-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B58802AEE
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 05:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B7FA1F20FC1
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 04:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF8481E;
	Mon,  4 Dec 2023 04:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1plxZK2u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E711692
	for <linux-next@vger.kernel.org>; Sun,  3 Dec 2023 20:38:17 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-58e238b654fso146711eaf.2
        for <linux-next@vger.kernel.org>; Sun, 03 Dec 2023 20:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701664697; x=1702269497; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LVyX305Zy6vcOx4ymLEjKcsqY5E4rSDWgYtF0e+a8Ms=;
        b=1plxZK2uTuP3nnm4/0JwdWlZE8pMLqUlJ5EnCmxgV8TmerPT/+wowCLcQvyFm1LSj6
         PajHeeYZKECkKw77NSzn2dgBvQFDBsxsk69LJfbZ2cIgWtLhoHKOZn9kYAm8Lryj3Qmv
         xpzRZMMmYY6fhRkMr9XldTXIlogpbfXwr7O/d4U+bsjbpCImGHX1iCk0sC1awUc4S7s5
         algW+BtrDSTkIkzOKZPrxLn7hDAu/g6WlE7NKcM4EzcrUqjVPCVSuCV3wXnHEohOlXcF
         54zCnEsax+pWFcSR2cWuglzqNGy1uoTM36kGTUOq+WLKGxF3/cl5E3U9oSNa7LQSUnHe
         tqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701664697; x=1702269497;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVyX305Zy6vcOx4ymLEjKcsqY5E4rSDWgYtF0e+a8Ms=;
        b=aSYS0ol4nkKTsrLqjGqLdyvdI/Vf3bodjRpvC7L6l0ZSNBgJ8t2Mlo+NLhCW7Dc9ro
         TJZL6TgiDpLN/p6y/eB+Pcm3sW58LHY0CXTD+70V6557JaP1GXcRgHsP4cE07Ts9Azgp
         u5qaS0H7n0AW2qOUyjUP967r/YDiMp1JXTYbf3eCfPTXXWqNIrQDdTr62gFu7cbRAb3o
         FWnuVXMDFdJL4/BRMk6fzXjDCg6wnI+q6LxRZQ6/nNuCF9lTEvcyK1GMVyvNo3POX9eq
         PrgUOTpdBFAy+PUJvX3jE/FMxa9MJIu6pg9vx+Wjqen/jPoseUcJmKP8j0UBWsIbbIJq
         p27Q==
X-Gm-Message-State: AOJu0Yz8HdtdgiSLPlNlvTSTy3dSUUuG/7qK9+S3FSma8EWV8F3I2mMw
	bzTdi02tcqY1CcYzNccG9fGJravq0enuWo9l1HkwBg==
X-Google-Smtp-Source: AGHT+IHUjnSjvsz3s2dqe/UXnLfaJ43IjhtsvusZHoT9UAPxQHtUr54J9z/PEzmiRm88Fncc3LqTTQ==
X-Received: by 2002:a05:6870:7ec7:b0:1fb:75b:2bba with SMTP id wz7-20020a0568707ec700b001fb075b2bbamr1092178oab.118.1701664696779;
        Sun, 03 Dec 2023 20:38:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s22-20020a63ff56000000b005bcea1bf43bsm6754355pgk.12.2023.12.03.20.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 20:38:16 -0800 (PST)
Message-ID: <656d57b8.630a0220.cd72.2d1e@mx.google.com>
Date: Sun, 03 Dec 2023 20:38:16 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc4-181-ge070da1246e73
Subject: next/pending-fixes baseline: 89 runs,
 2 regressions (v6.7-rc4-181-ge070da1246e73)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 89 runs, 2 regressions (v6.7-rc4-181-ge070da12=
46e73)

Regressions Summary
-------------------

platform         | arch | lab         | compiler | defconfig          | reg=
ressions
-----------------+------+-------------+----------+--------------------+----=
--------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig | 1  =
        =

beaglebone-black | arm  | lab-cip     | gcc-10   | multi_v7_defconfig | 1  =
        =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc4-181-ge070da1246e73/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc4-181-ge070da1246e73
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e070da1246e73617b8d1f079186bb4d7e0fde604 =



Test Regressions
---------------- =



platform         | arch | lab         | compiler | defconfig          | reg=
ressions
-----------------+------+-------------+----------+--------------------+----=
--------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/656d275d40c02f3aaee1347b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-18=
1-ge070da1246e73/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-18=
1-ge070da1246e73/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656d275d40c02f3aaee13=
47c
        new failure (last pass: v6.7-rc3-326-gebf39ec4a6f74) =

 =



platform         | arch | lab         | compiler | defconfig          | reg=
ressions
-----------------+------+-------------+----------+--------------------+----=
--------
beaglebone-black | arm  | lab-cip     | gcc-10   | multi_v7_defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/656d28130d7b3c943ee1347c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-18=
1-ge070da1246e73/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-18=
1-ge070da1246e73/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656d28130d7b3c943ee13=
47d
        new failure (last pass: v6.7-rc3-326-gebf39ec4a6f74) =

 =20

